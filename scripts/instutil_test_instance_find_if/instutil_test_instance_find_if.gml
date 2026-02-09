function instutil_test_instance_find_if(){
    // Setup
    var n = 7;
    var insts = array_create(n, noone);
    for (var i = 0; i < n; ++i) {
        insts[i] = instance_create_depth(0, 0, 0, obj_instutil_target, { value: i });
    }
    
    for (var j = 0; j < n; ++j) {
        assert_equal(instance_find_if(obj_instutil_target, function(inst, arg) { return inst.value == arg; }, j), insts[j]);
    }
    assert_equal(instance_find_if(obj_instutil_target, function(inst, arg) { return inst.value == arg; }, n), noone);
    assert_equal(instance_find_if(obj_instutil_target, function(inst, arg) { return inst.value == arg; }, -1), noone);
    
    // Cleanup
    with (obj_instutil_target) {
        instance_destroy();
    }
}
