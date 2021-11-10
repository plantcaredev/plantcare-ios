//
//  ReSwift-select.swift
//  PlantCare
//
//  Created by Eric Alas on 2021-11-10.
//

import Foundation

func memoize<S: Hashable, C>(_ function: @escaping (S) -> C) -> (S) -> C {
    var storage = [S: C]()

    return { input in
        if let cached = storage[input] {
            return cached
        }

        let result = function(input)
        storage[input] = result
        return result
    }
}

func memoize<S: Hashable, P, C>(_ function: @escaping (S, P) -> C) -> (S, P) -> C {
    var storage = [S: C]()

    return { input, props in
        if let cached = storage[input] {
            return cached
        }

        let result = function(input, props)
        storage[input] = result
        return result
    }
}

// MARK: regular selectors
func createSelector<S: Hashable, C, R1>(selector1: @escaping (S) -> R1, _ combiner: @escaping (R1) -> C) -> (S) -> C {
    return memoize { state in
        return combiner(selector1(state))
    }
}

func createSelector<S: Hashable, C, R1, R2>(selector1: @escaping (S) -> R1, selector2: @escaping (S) -> R2, _ combiner: @escaping (R1, R2) -> C) -> (S) -> C {
    return memoize { state in
        return combiner(selector1(state), selector2(state))
    }
}

func createSelector<S: Hashable, C, R1, R2, R3>(selector1: @escaping (S) -> R1, selector2: @escaping (S) -> R2, selector3: @escaping (S) -> R3, _ combiner: @escaping (R1, R2, R3) -> C) -> (S) -> C {
    return memoize { state in
        return combiner(selector1(state), selector2(state), selector3(state))
    }
}

func createSelector<S: Hashable, C, R1, R2, R3, R4>(selector1: @escaping (S) -> R1, selector2: @escaping (S) -> R2, selector3: @escaping (S) -> R3, selector4: @escaping (S) -> R4, _ combiner: @escaping (R1, R2, R3, R4) -> C) -> (S) -> C {
    return memoize { state in
        return combiner(selector1(state), selector2(state), selector3(state), selector4(state))
    }
}

func createSelector<S: Hashable, C, R1, R2, R3, R4, R5>(selector1: @escaping (S) -> R1, selector2: @escaping (S) -> R2, selector3: @escaping (S) -> R3, selector4: @escaping (S) -> R4, selector5: @escaping (S) -> R5, _ combiner: @escaping (R1, R2, R3, R4, R5) -> C) -> (S) -> C {
    return memoize { state in
        return combiner(selector1(state), selector2(state), selector3(state), selector4(state), selector5(state))
    }
}

// MARK: parametric selectors
func createSelector<S: Hashable, P, C, R1>(selector1: @escaping (S, P) -> R1, _ combiner: @escaping (R1) -> C) -> (S, P) -> C {
    return memoize { state, props in
        return combiner(selector1(state, props))
    }
}

func createSelector<S: Hashable, P, C, R1, R2>(selector1: @escaping(S, P) -> R1, selector2: @escaping(S, P) -> R2, _ combiner: @escaping(R1, R2) -> C) -> (S, P) -> C {
    return memoize { state, props in
        return combiner(selector1(state, props), selector2(state, props))
    }
}

func createSelector<S: Hashable, P, C, R1, R2, R3>(selector1: @escaping(S, P) -> R1, selector2: @escaping(S, P) -> R2, selector3: @escaping(S, P) -> R3, _ combiner: @escaping(R1, R2, R3) -> C) -> (S, P) -> C {
    return memoize { state, props in
        return combiner(selector1(state, props), selector2(state, props), selector3(state, props))
    }
}

func createSelector<S: Hashable, P, C, R1, R2, R3, R4>(selector1: @escaping(S, P) -> R1, selector2: @escaping(S, P) -> R2, selector3: @escaping(S, P) -> R3, selector4: @escaping(S, P) -> R4, _ combiner: @escaping(R1, R2, R3, R4) -> C) -> (S, P) -> C {
    return memoize { state, props in
        return combiner(selector1(state, props), selector2(state, props), selector3(state, props), selector4(state, props))
    }
}

func createSelector<S: Hashable, P, C, R1, R2, R3, R4, R5>(selector1: @escaping(S, P) -> R1, selector2: @escaping(S, P) -> R2, selector3: @escaping(S, P) -> R3, selector4: @escaping(S, P) -> R4, selector5: @escaping(S, P) -> R5, _ combiner: @escaping(R1, R2, R3, R4, R5) -> C) -> (S, P) -> C {
    return memoize { state, props in
        return combiner(selector1(state, props), selector2(state, props), selector3(state, props), selector4(state, props), selector5(state, props))
    }
}
