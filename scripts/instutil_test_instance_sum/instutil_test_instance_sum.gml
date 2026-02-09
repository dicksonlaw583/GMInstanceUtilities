function instutil_test_instance_sum(){
    // Setup
    var n = 7;
    var insts = array_create(n, noone);
    for (var i = 0; i < n; ++i) {
        insts[i] = instance_create_depth(0, 0, 0, obj_instutil_target, { value: i });
    }
    
    assert_equal(instance_sum(obj_instutil_target, function(inst) { return inst.value; }), 21);
    assert_equal(instance_sum(obj_instutil_target, function(inst, arg) { return inst.value*arg; }, -1), -21);
    
    // Cleanup
    with (obj_instutil_target) {
        instance_destroy();
    }
}
