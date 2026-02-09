function instutil_test_instance_find_min(){
    // Setup
    var n = 7;
    var insts = array_create(n, noone);
    for (var i = 0; i < n; ++i) {
        insts[i] = instance_create_depth(0, 0, 0, obj_instutil_target, { value: i });
    }
    
    assert_equal(instance_find_min(obj_instutil_target, function(inst) { return inst.value; }), insts[0]);
    assert_equal(instance_find_min(obj_instutil_target, function(inst) { return -inst.value; }), insts[6]);
    
    // Cleanup
    with (obj_instutil_target) {
        instance_destroy();
    }
}
