function instutil_test_instance_find_all_sorted(){
    // Setup
    var n = 7;
    var insts = array_create(n, noone);
    var instsReverse = array_create(n, noone);
    for (var i = 0; i < n; ++i) {
        insts[i] = instance_create_depth(0, 0, 0, obj_instutil_target, { value: i });
        instsReverse[n-1-i] = insts[i];
    }
    var gotInsts = [];
    
    // Unconditional case
    gotInsts = instance_find_all_sorted(obj_instutil_target, true, function(inst) { return inst.value; });
    assert_equal(gotInsts, insts);
    gotInsts = instance_find_all_sorted(obj_instutil_target, false, function(inst) { return inst.value; });
    assert_equal(gotInsts, instsReverse);
    
    // Conditional case
    gotInsts = instance_find_all_sorted(obj_instutil_target, true, function(inst) { return inst.value; },, function(inst){ return inst.value >= 1; });
    assert_equal(gotInsts, [insts[1], insts[2], insts[3], insts[4], insts[5], insts[6]]);
    gotInsts = instance_find_all_sorted(obj_instutil_target, false, function(inst) { return inst.value; },, function(inst){ return inst.value >= 1; });
    assert_equal(gotInsts, [insts[6], insts[5], insts[4], insts[3], insts[2], insts[1]]);
    
    // Conditional case 2
    gotInsts = instance_find_all_sorted(obj_instutil_target, true, function(inst, arg) { return inst.value*arg; }, -1, function(inst, arg){ return inst.value >= arg; }, 2);
    assert_equal(gotInsts, [insts[6], insts[5], insts[4], insts[3], insts[2]]);
    gotInsts = instance_find_all_sorted(obj_instutil_target, false, function(inst, arg) { return inst.value*arg; }, -1, function(inst, arg){ return inst.value >= arg; }, 2);
    assert_equal(gotInsts, [insts[2], insts[3], insts[4], insts[5], insts[6]]);
    
    // Cleanup
    with (obj_instutil_target) {
        instance_destroy();
    }
}
