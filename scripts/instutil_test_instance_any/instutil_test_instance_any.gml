function instutil_test_instance_any(){
    // Setup
    var n = 7;
    var insts = array_create(n, noone);
    for (var i = 0; i < n; ++i) {
        insts[i] = instance_create_depth(0, 0, 0, obj_instutil_target, { value: i });
    }
    
    assert(instance_any(obj_instutil_target, function(inst) { return inst.value >= 0; }));
    assert(instance_any(obj_instutil_target, function(inst) { return inst.value > 4; }));
    assert(instance_any(obj_instutil_target, function(inst) { return inst.value == 6; }));
    assert_fail(instance_any(obj_instutil_target, function(inst) { return inst.value < 0; }));
    
    // Cleanup
    with (obj_instutil_target) {
        instance_destroy();
    }
}
