function instutil_test_instance_all(){
    // Setup
    var n = 7;
    var insts = array_create(n, noone);
    for (var i = 0; i < n; ++i) {
        insts[i] = instance_create_depth(0, 0, 0, obj_instutil_target, { value: i });
    }
    
    assert(instance_all(obj_instutil_target, function(inst) { return inst.value < 10; }));
    assert_fail(instance_all(obj_instutil_target, function(inst) { return inst.value < 5; }));
    
    // Cleanup
    with (obj_instutil_target) {
        instance_destroy();
    }
}
