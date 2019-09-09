//
//  Ranking.swift
//  BearsApp
//
//  Created by Виталий Субботин on 08/06/2019.
//  Copyright © 2019 Виталий Субботин. All rights reserved.
//

enum Criterion {
    case max
    case min
}

struct Property {
    var isSelected: Bool
    var name: String
    var criterion: Criterion
    var values: [Double]
    
    init(name: String) {
        self.values = []
        self.name = name
        self.isSelected = false
        self.criterion = .min
    }
}

func rank(withProperties properties: [Property]) -> [Int]? {
    
    let n = properties[0].values.count
    
    var r = [[[Double]]]()

    for t in 0..<properties.count {
        var tmpR = [[Double]]()
        for i in 0..<n {
            var tmp = [Double]()
            for j in 0..<n {
                if i != j {
                    if properties[t].criterion == .max {
                        tmp.append(properties[t].values[j] / (properties[t].values[i] + properties[t].values[j]))
                    }
                    else {
                        tmp.append(properties[t].values[i] / (properties[t].values[i] + properties[t].values[j]))
                    }
                }
                else {
                    if properties[t].values[i] == 0 && properties[t].values[j] == 0 {
                        tmp.append(0.5)
                    }
                    else {
                        tmp.append(1)
                    }
                }
            }
            tmpR.append(tmp)
            
        }
        r.append(tmpR)
    }
    
    var p = r[0]
    
    for t in 1..<properties.count {
        guard let sum = matrixSum(a: p, b: r[t]) else {
            return nil
        }
        p = sum
    }
    
    var result = [(Int, Double)]()
    for i in 0..<n {
        var tmp: Double = 0
        for j in 0..<n {
            tmp += p[j][i] - p[i][j]
        }
        result.append((i, tmp))
    }

    result.sort(by: {$0.1 > $1.1})
    
    var ranking = [Int]()
    for elem in result {
        ranking.append(elem.0)
    }
    
    return ranking
}


func matrixSum(a: [[Double]], b: [[Double]]) -> [[Double]]? {
    if a.count == b.count {
        if a[0].count == b[0].count {
            var sum = [[Double]]()
            for i in 0..<a.count {
                var tmpSum = [Double]()
                for j in 0..<a[0].count {
                    tmpSum.append(a[i][j] + b[i][j])
                }
                sum.append(tmpSum)
            }
            return sum
        }
        else{
            return nil
        }
    }
    else {
        return nil
    }
}
