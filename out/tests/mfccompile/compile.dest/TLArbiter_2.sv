// Generated by CIRCT firtool-1.30.0
// Standard header to adapt well known macros to our needs.
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE

// RANDOM may be set to an expression that produces a 32-bit random unsigned value.
`ifndef RANDOM
  `define RANDOM $random
`endif // not def RANDOM

// Users can define 'ASSERT_VERBOSE_COND' to add an extra gate to assert error printing.
`ifndef ASSERT_VERBOSE_COND_
  `ifdef ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ (`ASSERT_VERBOSE_COND)
  `else  // ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ 1
  `endif // ASSERT_VERBOSE_COND
`endif // not def ASSERT_VERBOSE_COND_

// Users can define 'STOP_COND' to add an extra gate to stop conditions.
`ifndef STOP_COND_
  `ifdef STOP_COND
    `define STOP_COND_ (`STOP_COND)
  `else  // STOP_COND
    `define STOP_COND_ 1
  `endif // STOP_COND
`endif // not def STOP_COND_

// Users can define INIT_RANDOM as general code that gets injected into the
// initializer block for modules with registers.
`ifndef INIT_RANDOM
  `define INIT_RANDOM
`endif // not def INIT_RANDOM

// If using random initialization, you can also define RANDOMIZE_DELAY to
// customize the delay used, otherwise 0.002 is used.
`ifndef RANDOMIZE_DELAY
  `define RANDOMIZE_DELAY 0.002
`endif // not def RANDOMIZE_DELAY

// Define INIT_RANDOM_PROLOG_ for use in our modules below.
`ifndef INIT_RANDOM_PROLOG_
  `ifdef RANDOMIZE
    `ifdef VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM
    `else  // VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end
    `endif // VERILATOR
  `else  // RANDOMIZE
    `define INIT_RANDOM_PROLOG_
  `endif // RANDOMIZE
`endif // not def INIT_RANDOM_PROLOG_

module TLArbiter_2(
  input         clock,
                reset,
                sink_ready,	// tilelink/src/xbar/TLArbiter.scala:61:16
                sources_0_valid,	// tilelink/src/xbar/TLArbiter.scala:62:58
  input  [2:0]  sources_0_bits_opcode,	// tilelink/src/xbar/TLArbiter.scala:62:58
                sources_0_bits_param,	// tilelink/src/xbar/TLArbiter.scala:62:58
  input  [3:0]  sources_0_bits_size,	// tilelink/src/xbar/TLArbiter.scala:62:58
  input  [1:0]  sources_0_bits_source,	// tilelink/src/xbar/TLArbiter.scala:62:58
  input  [31:0] sources_0_bits_address,	// tilelink/src/xbar/TLArbiter.scala:62:58
  input  [7:0]  sources_0_bits_mask,	// tilelink/src/xbar/TLArbiter.scala:62:58
  input  [63:0] sources_0_bits_data,	// tilelink/src/xbar/TLArbiter.scala:62:58
  input         sources_0_bits_corrupt,	// tilelink/src/xbar/TLArbiter.scala:62:58
                sources_1_valid,	// tilelink/src/xbar/TLArbiter.scala:62:58
  input  [2:0]  sources_1_bits_opcode,	// tilelink/src/xbar/TLArbiter.scala:62:58
                sources_1_bits_param,	// tilelink/src/xbar/TLArbiter.scala:62:58
  input  [3:0]  sources_1_bits_size,	// tilelink/src/xbar/TLArbiter.scala:62:58
  input  [1:0]  sources_1_bits_source,	// tilelink/src/xbar/TLArbiter.scala:62:58
  input  [31:0] sources_1_bits_address,	// tilelink/src/xbar/TLArbiter.scala:62:58
  input  [7:0]  sources_1_bits_mask,	// tilelink/src/xbar/TLArbiter.scala:62:58
  input  [63:0] sources_1_bits_data,	// tilelink/src/xbar/TLArbiter.scala:62:58
  input         sources_1_bits_corrupt,	// tilelink/src/xbar/TLArbiter.scala:62:58
  output        sink_valid,	// tilelink/src/xbar/TLArbiter.scala:61:16
  output [2:0]  sink_bits_opcode,	// tilelink/src/xbar/TLArbiter.scala:61:16
                sink_bits_param,	// tilelink/src/xbar/TLArbiter.scala:61:16
  output [3:0]  sink_bits_size,	// tilelink/src/xbar/TLArbiter.scala:61:16
  output [1:0]  sink_bits_source,	// tilelink/src/xbar/TLArbiter.scala:61:16
  output [31:0] sink_bits_address,	// tilelink/src/xbar/TLArbiter.scala:61:16
  output [7:0]  sink_bits_mask,	// tilelink/src/xbar/TLArbiter.scala:61:16
  output [63:0] sink_bits_data,	// tilelink/src/xbar/TLArbiter.scala:61:16
  output        sink_bits_corrupt,	// tilelink/src/xbar/TLArbiter.scala:61:16
                sources_0_ready,	// tilelink/src/xbar/TLArbiter.scala:62:58
                sources_1_ready	// tilelink/src/xbar/TLArbiter.scala:62:58
);

  wire [18:0] _beatsIn_T_1 = 19'hF << sources_0_bits_size;	// tilelink/src/utils/OH1.scala:26:31
  wire        beatsIn_0 = ~(_beatsIn_T_1[3]);	// tilelink/src/bundle/TLLink.scala:51:71, tilelink/src/utils/OH1.scala:26:{6,31,36}
  wire [18:0] _beatsIn_T_5 = 19'hF << sources_1_bits_size;	// tilelink/src/utils/OH1.scala:26:31
  wire        beatsIn_1 = ~(_beatsIn_T_5[3]);	// tilelink/src/bundle/TLLink.scala:51:71, tilelink/src/utils/OH1.scala:26:{6,31,36}
  reg         beatsLeft;	// tilelink/src/xbar/TLArbiter.scala:72:28
  wire        idle = ~beatsLeft;	// tilelink/src/xbar/TLArbiter.scala:72:28, :73:26
  wire        latch = idle & sink_ready;	// tilelink/src/xbar/TLArbiter.scala:73:26, :74:22
  wire [1:0]  readys_valid = {sources_1_valid, sources_0_valid};	// tilelink/src/xbar/TLArbiter.scala:47:31, :79:53
  reg  [1:0]  readys_mask;	// tilelink/src/xbar/TLArbiter.scala:49:31
  wire [1:0]  _readys_filter_T_1 = readys_valid & ~readys_mask;	// tilelink/src/xbar/TLArbiter.scala:47:31, :49:31, :50:{48,50}
  wire [3:0]  readys_filter =
    {_readys_filter_T_1 | {1'h0, _readys_filter_T_1[1]}, readys_valid};	// dependencies/chisel3/src/main/scala/chisel3/experimental/util/algorithm/Bitwise.scala:45:{46,51}, tilelink/src/xbar/TLArbiter.scala:47:31, :50:{29,48}, :72:28
  wire [3:0]  readys_unready =
    {readys_mask[1], readys_filter[3] | readys_mask[0], readys_filter[2:1]};	// tilelink/src/xbar/TLArbiter.scala:49:31, :50:29, :51:48
  wire [1:0]  readys_readys = ~(readys_unready[3:2] & readys_unready[1:0]);	// tilelink/src/xbar/TLArbiter.scala:51:48, :52:{27,38,55,64}
  wire        readys_0;	// tilelink/src/xbar/TLArbiter.scala:79:25
  wire        readys_1;	// tilelink/src/xbar/TLArbiter.scala:79:25
  assign readys_0 = readys_readys[0];	// tilelink/src/xbar/TLArbiter.scala:52:27, :79:{25,85}
  assign readys_1 = readys_readys[1];	// tilelink/src/xbar/TLArbiter.scala:52:27, :79:{25,85}
  wire        winner_0;	// tilelink/src/xbar/TLArbiter.scala:80:25
  wire        winner_1;	// tilelink/src/xbar/TLArbiter.scala:80:25
  assign winner_0 = readys_0 & sources_0_valid;	// tilelink/src/xbar/TLArbiter.scala:80:{25,68}
  assign winner_1 = readys_1 & sources_1_valid;	// tilelink/src/xbar/TLArbiter.scala:80:{25,68}
  wire        prefixOR_1;	// tilelink/src/xbar/TLArbiter.scala:86:47
  assign prefixOR_1 = winner_0;	// tilelink/src/xbar/TLArbiter.scala:86:47
  wire        _sink_valid_T = sources_0_valid | sources_1_valid;	// tilelink/src/xbar/TLArbiter.scala:89:29
  wire        maskedBeats_0 = winner_0 & beatsIn_0;	// tilelink/src/bundle/TLLink.scala:51:71, tilelink/src/xbar/TLArbiter.scala:86:47, :92:67
  wire        maskedBeats_1 = winner_1 & beatsIn_1;	// tilelink/src/bundle/TLLink.scala:51:71, tilelink/src/xbar/TLArbiter.scala:87:60, :92:67
  wire        initBeats = maskedBeats_0 | maskedBeats_1;	// tilelink/src/xbar/TLArbiter.scala:92:67, :93:42
  reg         state_0;	// tilelink/src/xbar/TLArbiter.scala:97:24
  reg         state_1;	// tilelink/src/xbar/TLArbiter.scala:97:24
  wire        muxState_0 = idle ? winner_0 : state_0;	// tilelink/src/xbar/TLArbiter.scala:73:26, :86:47, :97:24, :98:23
  wire        muxState_1 = idle ? winner_1 : state_1;	// tilelink/src/xbar/TLArbiter.scala:73:26, :87:60, :97:24, :98:23
  wire        allowed_0 = idle ? readys_0 : state_0;	// tilelink/src/xbar/TLArbiter.scala:73:26, :80:68, :97:24, :101:22
  wire        allowed_1 = idle ? readys_1 : state_1;	// tilelink/src/xbar/TLArbiter.scala:73:26, :80:68, :97:24, :101:22
  wire        _sink_valid_output =
    idle ? _sink_valid_T : state_0 & sources_0_valid | state_1 & sources_1_valid;	// dependencies/chisel3/src/main/scala/chisel3/util/Mux.scala:27:73, tilelink/src/xbar/TLArbiter.scala:73:26, :89:29, :97:24, :103:22
  always @(posedge clock) begin
    if (reset) begin
      beatsLeft <= 1'h0;	// tilelink/src/xbar/TLArbiter.scala:72:28
      readys_mask <= 2'h3;	// tilelink/src/xbar/TLArbiter.scala:49:31
      state_0 <= 1'h0;	// tilelink/src/xbar/TLArbiter.scala:72:28, :97:24
      state_1 <= 1'h0;	// tilelink/src/xbar/TLArbiter.scala:72:28, :97:24
    end
    else begin
      if (latch)	// tilelink/src/xbar/TLArbiter.scala:74:22
        beatsLeft <= initBeats;	// tilelink/src/xbar/TLArbiter.scala:72:28, :93:42
      else	// tilelink/src/xbar/TLArbiter.scala:74:22
        beatsLeft <= beatsLeft - (sink_ready & _sink_valid_output);	// dependencies/chisel3/src/main/scala/chisel3/util/Decoupled.scala:52:35, tilelink/src/xbar/TLArbiter.scala:72:28, :94:50, :103:22
      if (latch & (|readys_valid)) begin	// tilelink/src/xbar/TLArbiter.scala:47:31, :53:{25,34}, :74:22
        automatic logic [1:0] _readys_mask_T = readys_readys & readys_valid;	// tilelink/src/xbar/TLArbiter.scala:47:31, :52:27, :54:41
        readys_mask <= _readys_mask_T | {_readys_mask_T[0], 1'h0};	// dependencies/chisel3/src/main/scala/chisel3/experimental/util/algorithm/Bitwise.scala:24:{46,56}, tilelink/src/xbar/TLArbiter.scala:49:31, :54:41, :72:28
      end
      state_0 <= muxState_0;	// tilelink/src/xbar/TLArbiter.scala:97:24, :98:23
      state_1 <= muxState_1;	// tilelink/src/xbar/TLArbiter.scala:97:24, :98:23
    end
  end // always @(posedge)
  `ifndef SYNTHESIS
    always @(posedge clock) begin	// tilelink/src/xbar/TLArbiter.scala:48:19
      if (~reset & readys_valid != readys_valid) begin	// tilelink/src/xbar/TLArbiter.scala:47:31, :48:{19,26}
        if (`ASSERT_VERBOSE_COND_)	// tilelink/src/xbar/TLArbiter.scala:48:19
          $error("Assertion failed\n    at TLArbiter.scala:48 assert(valid === valids)\n");	// tilelink/src/xbar/TLArbiter.scala:48:19
        if (`STOP_COND_)	// tilelink/src/xbar/TLArbiter.scala:48:19
          $fatal;	// tilelink/src/xbar/TLArbiter.scala:48:19
      end
      if (~reset & ~(~prefixOR_1 | ~winner_1)) begin	// tilelink/src/xbar/TLArbiter.scala:86:47, :87:{11,54,57,60}
        if (`ASSERT_VERBOSE_COND_)	// tilelink/src/xbar/TLArbiter.scala:87:11
          $error("Assertion failed\n    at TLArbiter.scala:87 assert(prefixOR.zip(winner).map { case (p, w) => !p || !w }.reduce { _ && _ })\n");	// tilelink/src/xbar/TLArbiter.scala:87:11
        if (`STOP_COND_)	// tilelink/src/xbar/TLArbiter.scala:87:11
          $fatal;	// tilelink/src/xbar/TLArbiter.scala:87:11
      end
      if (~reset & ~(~_sink_valid_T | winner_0 | winner_1)) begin	// tilelink/src/xbar/TLArbiter.scala:86:47, :87:60, :89:{11,12,29,35}
        if (`ASSERT_VERBOSE_COND_)	// tilelink/src/xbar/TLArbiter.scala:89:11
          $error("Assertion failed\n    at TLArbiter.scala:89 assert(!valids.reduce(_ || _) || winner.reduce(_ || _))\n");	// tilelink/src/xbar/TLArbiter.scala:89:11
        if (`STOP_COND_)	// tilelink/src/xbar/TLArbiter.scala:89:11
          $fatal;	// tilelink/src/xbar/TLArbiter.scala:89:11
      end
    end // always @(posedge)
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin
      automatic logic [31:0] _RANDOM_0;
      `ifdef INIT_RANDOM_PROLOG_
        `INIT_RANDOM_PROLOG_
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT
        _RANDOM_0 = `RANDOM;
        beatsLeft = _RANDOM_0[0];	// tilelink/src/xbar/TLArbiter.scala:72:28
        readys_mask = _RANDOM_0[2:1];	// tilelink/src/xbar/TLArbiter.scala:49:31, :72:28
        state_0 = _RANDOM_0[3];	// tilelink/src/xbar/TLArbiter.scala:72:28, :97:24
        state_1 = _RANDOM_0[4];	// tilelink/src/xbar/TLArbiter.scala:72:28, :97:24
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // not def SYNTHESIS
  assign sink_valid = _sink_valid_output;	// tilelink/src/xbar/TLArbiter.scala:103:22
  assign sink_bits_opcode =
    (state_0 ? sources_0_bits_opcode : 3'h0) | (state_1 ? sources_1_bits_opcode : 3'h0);	// dependencies/chisel3/src/main/scala/chisel3/util/Mux.scala:27:73, tilelink/src/xbar/TLArbiter.scala:97:24
  assign sink_bits_param =
    (state_0 ? sources_0_bits_param : 3'h0) | (state_1 ? sources_1_bits_param : 3'h0);	// dependencies/chisel3/src/main/scala/chisel3/util/Mux.scala:27:73, tilelink/src/xbar/TLArbiter.scala:97:24
  assign sink_bits_size =
    (state_0 ? sources_0_bits_size : 4'h0) | (state_1 ? sources_1_bits_size : 4'h0);	// dependencies/chisel3/src/main/scala/chisel3/util/Mux.scala:27:73, tilelink/src/xbar/TLArbiter.scala:97:24
  assign sink_bits_source =
    (state_0 ? sources_0_bits_source : 2'h0) | (state_1 ? sources_1_bits_source : 2'h0);	// dependencies/chisel3/src/main/scala/chisel3/util/Mux.scala:27:73, tilelink/src/xbar/TLArbiter.scala:97:24
  assign sink_bits_address =
    (state_0 ? sources_0_bits_address : 32'h0)
    | (state_1 ? sources_1_bits_address : 32'h0);	// dependencies/chisel3/src/main/scala/chisel3/util/Mux.scala:27:73, tilelink/src/xbar/TLArbiter.scala:97:24
  assign sink_bits_mask =
    (state_0 ? sources_0_bits_mask : 8'h0) | (state_1 ? sources_1_bits_mask : 8'h0);	// dependencies/chisel3/src/main/scala/chisel3/util/Mux.scala:27:73, tilelink/src/xbar/TLArbiter.scala:97:24
  assign sink_bits_data =
    (state_0 ? sources_0_bits_data : 64'h0) | (state_1 ? sources_1_bits_data : 64'h0);	// dependencies/chisel3/src/main/scala/chisel3/util/Mux.scala:27:73, tilelink/src/xbar/TLArbiter.scala:97:24
  assign sink_bits_corrupt =
    state_0 & sources_0_bits_corrupt | state_1 & sources_1_bits_corrupt;	// dependencies/chisel3/src/main/scala/chisel3/util/Mux.scala:27:73, tilelink/src/xbar/TLArbiter.scala:97:24
  assign sources_0_ready = sink_ready & allowed_0;	// tilelink/src/xbar/TLArbiter.scala:101:22, :102:73
  assign sources_1_ready = sink_ready & allowed_1;	// tilelink/src/xbar/TLArbiter.scala:101:22, :102:73
endmodule

