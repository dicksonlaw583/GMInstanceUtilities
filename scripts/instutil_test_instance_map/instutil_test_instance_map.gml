function instutil_test_instance_map(){
    // Setup
    var n = 7;
    var insts = array_create(n, noone);
    for (var i = 0; i < n; ++i) {
        insts[i] = instance_create_depth(0, 0, 0, obj_instutil_target, { value: i });
    }
    var vals = []
    
    vals = instance_map(obj_instutil_target, function(inst) { return inst.value; });
    array_sort(vals, true);
    assert_equal(vals, [0, 1, 2, 3, 4, 5, 6]);
    vals = instance_map(obj_instutil_target, function(inst, arg) { return inst.value*arg; }, -2);
    array_sort(vals, false);
    assert_equal(vals, [0, -2, -4, -6, -8, -10, -12]);
    
    // Cleanup
    with (obj_instutil_target) {
        instance_destroy();
    }
}
