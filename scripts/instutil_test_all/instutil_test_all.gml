///@func instutil_test_all()
function instutil_test_all() {
	global.__test_fails__ = 0;
	var timeA, timeB;
	timeA = current_time;
	
	/* v Tests here v */
    instutil_test_instance_all();
    instutil_test_instance_any();
    instutil_test_instance_find_if();
    instutil_test_instance_find_all();
    instutil_test_instance_number_if();
    instutil_test_instance_find_all_sorted();
    instutil_test_instance_find_min();
    instutil_test_instance_find_max();
    instutil_test_instance_sum();
    instutil_test_instance_foreach();
    instutil_test_instance_map();
	/* ^ Tests here ^ */
	
	timeB = current_time;
	show_debug_message("GM Instance Utility tests done in " + string(timeB-timeA) + "ms.");
	return global.__test_fails__ == 0;
}
