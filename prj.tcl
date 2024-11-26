project_new example1 -overwrite

set_global_assignment -name FAMILY MAX10
set_global_assignment -name DEVICE 10M50DAF484C7G 

set_global_assignment -name BDF_FILE cnt.bdf
set_global_assignment -name VERILOG_FILE cnt.v
set_global_assignment -name SDC_FILE cnt.sdc

set_global_assignment -name TOP_LEVEL_ENTITY cnt

set_location_assignment PIN_P11 -to clk    ;
set_location_assignment PIN_B8 -to rst      ;

set_location_assignment PIN_C10 -to opcode[0] ;
set_location_assignment PIN_C11 -to opcode[1] ;
set_location_assignment PIN_D12 -to opcode[2] ;


set_location_assignment PIN_A8  -to cnt[0]  ;
set_location_assignment PIN_A9  -to cnt[1]  ;
set_location_assignment PIN_A10 -to cnt[2]  ;
set_location_assignment PIN_B10 -to cnt[3]  ;
set_location_assignment PIN_D13 -to cnt[4]  ;
set_location_assignment PIN_C13 -to cnt[5]  ;
set_location_assignment PIN_E14 -to cnt[6]  ;
set_location_assignment PIN_D14 -to cnt[7]  ;


load_package flow
execute_flow -compile

project_close
