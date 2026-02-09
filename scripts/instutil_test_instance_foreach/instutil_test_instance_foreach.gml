function instutil_test_instance_foreach(){
    // Setup
    var n = 7;
    var insts = array_create(n, noone);
    for (var i = 0; i < n; ++i) {
        insts[i] = instance_create_depth(0, 0, 0, obj_instutil_target, { value: i });
    }
    
    var spy = {
        slots: array_create(n, 0),
        hit: function(inst, arg=1) {
            slots[inst.value] += arg;
        },
        reset: function() {
            for (var i = array_length(slots)-1; i >= 0; --i) {
                slots[i] = 0;
            }
        },
    };
    instance_foreach(obj_instutil_target, spy.hit);
    assert_equal(spy.slots, [1, 1, 1, 1, 1, 1, 1]);
    
    // Cleanup
    with (obj_instutil_target) {
        instance_destroy();
    }
}
