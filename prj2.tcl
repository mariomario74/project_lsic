project_new example1 -overwrite

set_global_assignment -name FAMILY MAX10
set_global_assignment -name DEVICE 10M50DAF484C7G 

set_global_assignment -name BDF_FILE cnt.bdf
set_global_assignment -name VERILOG_FILE cnt.v
set_global_assignment -name SDC_FILE cnt.sdc

set_global_assignment -name TOP_LEVEL_ENTITY cnt

set_location_assignment PIN_P11 -to clk    ;
set_location_assignment PIN_B8 -to rst      ;


# Set the location assignments for the six 7-segment displays
set_location_assignment PIN_C14 -to HEX00[0] ;
set_location_assignment PIN_E15 -to HEX00[1] ;
set_location_assignment PIN_C15 -to HEX00[2] ;
set_location_assignment PIN_C16 -to HEX00[3] ;
set_location_assignment PIN_E16 -to HEX00[4] ;
set_location_assignment PIN_D17 -to HEX00[5] ;
set_location_assignment PIN_C17 -to HEX00[6] ;
set_location_assignment PIN_D15 -to HEX00[7] ;

set_location_assignment PIN_C18 -to HEX01[0] ;
set_location_assignment PIN_D18 -to HEX01[1] ;
set_location_assignment PIN_E18 -to HEX01[2] ;
set_location_assignment PIN_B16 -to HEX01[3] ;
set_location_assignment PIN_A17 -to HEX01[4] ;
set_location_assignment PIN_A18 -to HEX01[5] ;
set_location_assignment PIN_B17 -to HEX01[6] ;
set_location_assignment PIN_A16 -to HEX01[7] ;

set_location_assignment PIN_B20 -to HEX02[0] ;
set_location_assignment PIN_A20 -to HEX02[1] ;
set_location_assignment PIN_B19 -to HEX02[2] ;
set_location_assignment PIN_A21 -to HEX02[3] ;
set_location_assignment PIN_B21 -to HEX02[4] ;
set_location_assignment PIN_C22 -to HEX02[5] ;
set_location_assignment PIN_B22 -to HEX02[6] ;
set_location_assignment PIN_A19 -to HEX02[7] ;

set_location_assignment PIN_F21 -to HEX03[0] ;
set_location_assignment PIN_E22 -to HEX03[1] ;
set_location_assignment PIN_E21 -to HEX03[2] ;
set_location_assignment PIN_C19 -to HEX03[3] ;
set_location_assignment PIN_C20 -to HEX03[4] ;
set_location_assignment PIN_D19 -to HEX03[5] ;
set_location_assignment PIN_E17 -to HEX03[6] ;
set_location_assignment PIN_D22 -to HEX03[7] ;

set_location_assignment PIN_F18 -to HEX04[0] ;
set_location_assignment PIN_E20 -to HEX04[1] ;
set_location_assignment PIN_E19 -to HEX04[2] ;
set_location_assignment PIN_J18 -to HEX04[3] ;
set_location_assignment PIN_H19 -to HEX04[4] ;
set_location_assignment PIN_F19 -to HEX04[5] ;
set_location_assignment PIN_F20 -to HEX04[6] ;
set_location_assignment PIN_F17 -to HEX04[7] ;

set_location_assignment PIN_J20 -to HEX05[0] ;
set_location_assignment PIN_K20 -to HEX05[1] ;
set_location_assignment PIN_L18 -to HEX05[2] ;
set_location_assignment PIN_N18 -to HEX05[3] ;
set_location_assignment PIN_M20 -to HEX05[4] ;
set_location_assignment PIN_N19 -to HEX05[5] ;
set_location_assignment PIN_N20 -to HEX05[6] ;
set_location_assignment PIN_L19 -to HEX05[7] ;


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
