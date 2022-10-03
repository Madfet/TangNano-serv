module rom32 #(
    parameter  ROM_SIZE      = 256*4,
    parameter  INITIAL_FILE  = "",
    localparam ROM_ADDR_BITS = $clog2(ROM_SIZE/4)
) (
    input  logic        clk,
    input  logic        resetn,
    input  logic        [ROM_ADDR_BITS-1:0] addr,
    input  logic        ce,
    output logic [31:0] data_out
);

logic [31:0] mem [0:ROM_SIZE/4-1]; /* synthesis syn_ramstyle="block_ram" */

always_ff @(posedge clk)
begin
    if( !resetn ) begin
        data_out <= 0;
    end
    else if(ce) begin
        data_out <= mem[addr];
    end
end

initial if(|INITIAL_FILE) $readmemh(INITIAL_FILE, mem);

endmodule