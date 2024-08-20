module ARCH_tb();
	//Signals Declaration
    reg clk;
    reg reset;
    wire [31:0] writedata, dataadr;
    // Instantiate device to be tested
    ARCH ARCH_DUT (clk, reset, writedata, dataadr);
    
    // Initialize test
    initial begin
        reset = 1;
        #22; 
        reset = 0;
    end
    
    // Generate clock to sequence tests
    always begin
        clk = 1;
        #5;
        clk = 0;
        #5;
    end
    
    // Load memory with test data
    initial begin
        $readmemh ("mem.dat", ARCH_DUT.INSTRUCTION_MEMORY.RAM);
    end
    
    // Check results
    always @(negedge clk) begin
    	//Test Stimiulus Generator
        $display("PC = %d, Instr = %h, ALUResult = %d, WriteData = %d, DataAddress = %d, MemWrite = %b", 
                 ARCH_DUT.PC, ARCH_DUT.Instr, ARCH_DUT.DataAddress, writedata, dataadr, ARCH_DUT.MemWrite);
        if (ARCH_DUT.MemWrite) begin
            if (dataadr == 84 && writedata == 7) begin
                $display("Simulation Succeeded");
                $stop;
            end else if (dataadr !== 80) begin
                $display("Simulation Failed");
                $stop;
            end
        end
    end
endmodule
