function instutil_test_instance_find_all(){
    // Setup
    var n = 7;
    var insts = array_create(n, noone);
    for (var i = 0; i < n; ++i) {
        insts[i] = instance_create_depth(0, 0, 0, obj_instutil_target, { value: i });
    }
    var gotInsts = [];
    
    // Unconditional case
    gotInsts = instance_find_all(obj_instutil_target);
    for (var j = 0; j < n; ++j) {
        assert_contains(gotInsts, insts[j]);
    }
    
    // Conditional case
    gotInsts = instance_find_all(obj_instutil_target, function(inst){ return inst.value >= 1; });
    for (var j = 1; j < n; ++j) {
        assert_contains(gotInsts, insts[j]);
    }
    assert_doesnt_contain(gotInsts, insts[0]);
    
    // Conditional case 2
    gotInsts = instance_find_all(obj_instutil_target, function(inst, arg){ return inst.value >= arg; }, 2);
    for (var j = 2; j < n; ++j) {
        assert_contains(gotInsts, insts[j]);
    }
    assert_doesnt_contain(gotInsts, insts[0]);
    assert_doesnt_contain(gotInsts, insts[1]);
    
    // Cleanup
    with (obj_instutil_target) {
        instance_destroy();
    }
}
