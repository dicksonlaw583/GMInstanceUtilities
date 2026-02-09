///@func instance_all(obj, cond, [condArg])
///@desc Returns whether all instances of a given object match a condition.
///@param {Asset.GMObject} obj The object to check.
///@param {function} cond A predicate function to apply to each instance.
///@param {any*} [condArg] An optional argument to pass to the predicate function.
///@returns {bool} Whether all instances match the condition.
function instance_all(obj, cond, condArg=undefined) {
    with (obj) if (!cond(id, condArg)) {
        return false;
    }
    return true;
}

///@func instance_any(obj, cond, [condArg])
///@desc Returns whether any instances of a given object match a condition.
///@param {Asset.GMObject} obj The object to check.
///@param {function} cond A predicate function to apply to each instance.
///@param {any*} [condArg] An optional argument to pass to the predicate function.
///@returns {bool} Whether any instances match the condition.
function instance_any(obj, cond, condArg=undefined) {
    with (obj) if (cond(id, condArg)) {
        return true;
    }
    return false;
}

///@func instance_find_all(obj, [cond], [condArg])
///@desc Returns all instances of a given object that match a condition.
///@param {Asset.GMObject} obj The object to check.
///@param {function} [cond] A predicate function to apply to each instance.
///@param {any*} [condArg] An optional argument to pass to the predicate function.
///@returns {array<Id.Instance>} All matching instances.
function instance_find_all(obj, cond=__instutil_return_true__, condArg=undefined) {
    var insts = [];
    with (obj) if (cond(id, condArg)) {
        array_push(insts, id);
    }
    return insts;
}

///@func instance_find_all_sorted(obj, sort, pred, [predArg], [cond], [condArg])
///@desc Returns all instances of a given object that match a condition, sorted by a predicate function.
///@param {Asset.GMObject} obj The object to check.
///@param {bool} sort Whether to sort the results.
///@param {function} pred A predicate function to apply to each instance for sorting.
///@param {any*} [predArg] An optional argument to pass to the predicate function.
///@param {function} [cond] A condition function to filter the instances.
///@param {any*} [condArg] An optional argument to pass to the condition function.
///@returns {array<Id.Instance>} The sorted matching instances.
function instance_find_all_sorted(obj, sort, pred, predArg=undefined, cond=__instutil_return_true__, condArg=undefined) {
    static pq = ds_priority_create();
    var result = [];
    with (obj) if (cond(id, condArg)) {
        ds_priority_add(pq, id, pred(id, predArg));
    }
    ///Feather disable GM1063
    var fetcher = sort ? ds_priority_delete_min : ds_priority_delete_max;
    ///Feather enable GM1063
    while (!ds_priority_empty(pq)) {
        array_push(result, fetcher(pq));
    }
    return result;
}

///@func instance_find_if(obj, cond, [condArg])
///@desc Returns the first instance of a given object that matches a condition.
///@param {Asset.GMObject} obj The object to check.
///@param {function} cond A predicate function to apply to each instance.
///@param {any*} [condArg] An optional argument to pass to the predicate function.
///@returns {Id.Instance} The first matching instance, or noone if none match.
function instance_find_if(obj, cond, condArg=undefined) {
    with (obj) if (cond(id, condArg)) {
        return id;
    }
    return noone;
}

///@func instance_find_max(obj, pred, [predArg], [cond], [condArg])
///@desc Returns the instance of a given object that matches a condition and has the maximum value according to a predicate function.
///@param {Asset.GMObject} obj The object to check.
///@param {function} pred A predicate function to apply to each instance for comparison.
///@param {any*} [predArg] An optional argument to pass to the predicate function.
///@param {function} [cond] A condition function to filter the instances.
///@param {any*} [condArg] An optional argument to pass to the condition function.
///@returns {Id.Instance} The instance with the maximum value that matches the condition.
function instance_find_max(obj, pred, predArg=undefined, cond=__instutil_return_true__, condArg=undefined) {
    var val, highest, highestVal;
    highest = noone;
    highestVal = -infinity;
    with (obj) if (cond(id, condArg)) {
        val = pred(id, predArg);
        if (val > highestVal) {
            highest = id;
            highestVal = val;
        }
    }
    return highest;
}

///@func instance_find_min(obj, pred, [predArg], [cond], [condArg])
///@desc Returns the instance of a given object that matches a condition and has the minimum value according to a predicate function.
///@param {Asset.GMObject} obj The object to check.
///@param {function} pred A predicate function to apply to each instance for comparison.
///@param {any*} [predArg] An optional argument to pass to the predicate function.
///@param {function} [cond] A condition function to filter the instances.
///@param {any*} [condArg] An optional argument to pass to the condition function.
///@returns {Id.Instance} The instance with the minimum value that matches the condition.
function instance_find_min(obj, pred, predArg=undefined, cond=__instutil_return_true__, condArg=undefined) {
    var val, lowest, lowestVal;
    lowest = noone;
    lowestVal = infinity;
    with (obj) if (cond(id, condArg)) {
        val = pred(id, predArg);
        if (val < lowestVal) {
            lowest = id;
            lowestVal = val;
        }
    }
    return lowest;
}

///@func instance_foreach(obj, func, [funcArg], [cond], [condArg])
///@desc Applies a function to each instance of an object that matches a condition.
///@param {Asset.GMObject} obj The object to check.
///@param {function} func A function to apply to each instance.
///@param {any*} [funcArg] An optional argument to pass to the function.
///@param {function} [cond] A condition function to filter the instances.
///@param {any*} [condArg] An optional argument to pass to the condition function.
function instance_foreach(obj, func, funcArg=undefined, cond=__instutil_return_true__, condArg=undefined) {
    with (obj) if (cond(id, condArg)) {
        func(id, funcArg);
    }
}

///@func instance_map(obj, pred, [predArg], [cond], [condArg])
///@desc Returns an array of values obtained by applying a predicate function to each instance of an object that matches a condition.
///@param {Asset.GMObject} obj The object to check.
///@param {function} pred A predicate function to apply to each instance for calculation.
///@param {any*} [predArg] An optional argument to pass to the predicate function.
///@param {function} [cond] A condition function to filter the instances.
///@param {any*} [condArg] An optional argument to pass to the condition function.
///@returns {array<any>} The array of values that match the condition.
function instance_map(obj, pred, predArg=undefined, cond=__instutil_return_true__, condArg=undefined) {
    var insts = [];
    with (obj) if (cond(id, condArg)) {
        array_push(insts, pred(id, predArg));
    }
    return insts;
}

///@func instance_number_if(obj, cond, [condArg])
///@desc Returns the number of instances of a given object that match a condition.
///@param {Asset.GMObject} obj The object to check.
///@param {function} cond A predicate function to apply to each instance.
///@param {any*} [condArg] An optional argument to pass to the predicate function.
///@returns {real} The number of matching instances.
function instance_number_if(obj, cond, condArg=undefined) {
    var count = 0;
    with (obj) if (cond(id, condArg)) {
        ++count;
    }
    return count;
}

///@func instance_sum(obj, pred, [predArg], [cond], [condArg])
///@desc Returns the sum of values obtained by applying a predicate function to each instance of an object that matches a condition.
///@param {Asset.GMObject} obj The object to check.
///@param {function} pred A predicate function to apply to each instance that returns a value.
///@param {any*} [predArg] An optional argument to pass to the predicate function.
///@param {function} [cond] A condition function to filter the instances.
///@param {any*} [condArg] An optional argument to pass to the condition function.
///@returns {real} The sum of values that match the condition.
function instance_sum(obj, pred, predArg=undefined, cond=__instutil_return_true__, condArg=undefined) {
    var sum = 0;
    with (obj) if (cond(id, condArg)) {
        sum += pred(id, predArg);
    }
    return sum;
}
