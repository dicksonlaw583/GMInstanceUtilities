function instutil_test_instance_number_if(){
    // Setup
    var n = 7;
    var insts = array_create(n, noone);
    for (var i = 0; i < n; ++i) {
        insts[i] = instance_create_depth(0, 0, 0, obj_instutil_target, { value: i });
    }
    
    assert_equal(instance_number_if(obj_instutil_target, function(inst) { return inst.value >= 0; }), n);
    assert_equal(instance_number_if(obj_instutil_target, function(inst) { return inst.value < 0; }), 0);
    assert_equal(instance_number_if(obj_instutil_target, function(inst) { return inst.value > 0; }), n-1);
    
    // Cleanup
    with (obj_instutil_target) {
        instance_destroy();
    }
}
