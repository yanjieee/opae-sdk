// emif_ddr4_ddr4a.v

// Generated using ACDS version 17.0 290

`timescale 1 ps / 1 ps
module emif_ddr4_ddr4a (
		output wire [31:0]  clks_sharing_master_out, // clks_sharing_master_out.clks_sharing
		output wire         amm_ready_0,             //              ctrl_amm_0.waitrequest_n
		input  wire         amm_read_0,              //                        .read
		input  wire         amm_write_0,             //                        .write
		input  wire [25:0]  amm_address_0,           //                        .address
		output wire [511:0] amm_readdata_0,          //                        .readdata
		input  wire [511:0] amm_writedata_0,         //                        .writedata
		input  wire [6:0]   amm_burstcount_0,        //                        .burstcount
		input  wire [63:0]  amm_byteenable_0,        //                        .byteenable
		output wire         amm_readdatavalid_0,     //                        .readdatavalid
		output wire         emif_usr_clk,            //            emif_usr_clk.clk
		output wire         emif_usr_reset_n,        //        emif_usr_reset_n.reset_n
		input  wire         global_reset_n,          //          global_reset_n.reset_n
		output wire [0:0]   mem_ck,                  //                     mem.mem_ck
		output wire [0:0]   mem_ck_n,                //                        .mem_ck_n
		output wire [16:0]  mem_a,                   //                        .mem_a
		output wire [0:0]   mem_act_n,               //                        .mem_act_n
		output wire [1:0]   mem_ba,                  //                        .mem_ba
		output wire [1:0]   mem_bg,                  //                        .mem_bg
		output wire [0:0]   mem_cke,                 //                        .mem_cke
		output wire [0:0]   mem_cs_n,                //                        .mem_cs_n
		output wire [0:0]   mem_odt,                 //                        .mem_odt
		output wire [0:0]   mem_reset_n,             //                        .mem_reset_n
		output wire [0:0]   mem_par,                 //                        .mem_par
		input  wire [0:0]   mem_alert_n,             //                        .mem_alert_n
		inout  wire [7:0]   mem_dqs,                 //                        .mem_dqs
		inout  wire [7:0]   mem_dqs_n,               //                        .mem_dqs_n
		inout  wire [63:0]  mem_dq,                  //                        .mem_dq
		inout  wire [7:0]   mem_dbi_n,               //                        .mem_dbi_n
		input  wire         oct_rzqin,               //                     oct.oct_rzqin
		input  wire         pll_ref_clk,             //             pll_ref_clk.clk
		output wire         local_cal_success,       //                  status.local_cal_success
		output wire         local_cal_fail           //                        .local_cal_fail
	);

	emif_ddr4_ddr4a_altera_emif_170_np444ry ddr4a (
		.clks_sharing_master_out (clks_sharing_master_out), // clks_sharing_master_out.clks_sharing
		.amm_ready_0             (amm_ready_0),             //              ctrl_amm_0.waitrequest_n
		.amm_read_0              (amm_read_0),              //                        .read
		.amm_write_0             (amm_write_0),             //                        .write
		.amm_address_0           (amm_address_0),           //                        .address
		.amm_readdata_0          (amm_readdata_0),          //                        .readdata
		.amm_writedata_0         (amm_writedata_0),         //                        .writedata
		.amm_burstcount_0        (amm_burstcount_0),        //                        .burstcount
		.amm_byteenable_0        (amm_byteenable_0),        //                        .byteenable
		.amm_readdatavalid_0     (amm_readdatavalid_0),     //                        .readdatavalid
		.emif_usr_clk            (emif_usr_clk),            //            emif_usr_clk.clk
		.emif_usr_reset_n        (emif_usr_reset_n),        //        emif_usr_reset_n.reset_n
		.global_reset_n          (global_reset_n),          //          global_reset_n.reset_n
		.mem_ck                  (mem_ck),                  //                     mem.mem_ck
		.mem_ck_n                (mem_ck_n),                //                        .mem_ck_n
		.mem_a                   (mem_a),                   //                        .mem_a
		.mem_act_n               (mem_act_n),               //                        .mem_act_n
		.mem_ba                  (mem_ba),                  //                        .mem_ba
		.mem_bg                  (mem_bg),                  //                        .mem_bg
		.mem_cke                 (mem_cke),                 //                        .mem_cke
		.mem_cs_n                (mem_cs_n),                //                        .mem_cs_n
		.mem_odt                 (mem_odt),                 //                        .mem_odt
		.mem_reset_n             (mem_reset_n),             //                        .mem_reset_n
		.mem_par                 (mem_par),                 //                        .mem_par
		.mem_alert_n             (mem_alert_n),             //                        .mem_alert_n
		.mem_dqs                 (mem_dqs),                 //                        .mem_dqs
		.mem_dqs_n               (mem_dqs_n),               //                        .mem_dqs_n
		.mem_dq                  (mem_dq),                  //                        .mem_dq
		.mem_dbi_n               (mem_dbi_n),               //                        .mem_dbi_n
		.oct_rzqin               (oct_rzqin),               //                     oct.oct_rzqin
		.pll_ref_clk             (pll_ref_clk),             //             pll_ref_clk.clk
		.local_cal_success       (local_cal_success),       //                  status.local_cal_success
		.local_cal_fail          (local_cal_fail)           //                        .local_cal_fail
	);

endmodule
