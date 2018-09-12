
module testbench;

    reg  [3:0] dig;
    wire [7:0] seg;

    display_driver dut
    (
        .dig  ( dig ),
        .seg  ( seg ) 
    );

    initial
        begin
            for(int i=0;i<16;i++) begin
                dig = i[3:0];
                #10;
                $display("seg=%b", seg);
                seg_out(seg);
            end
            $finish();
        end

    task seg_out([7:0] seg);

        // . g f e d c b a   // Letter from the diagram below
        // 7 6 5 4 3 2 1 0   // Bit in seg

        //   --a--
        //  |     |
        //  f     b
        //  |     |
        //   --g--
        //  |     |
        //  e     c
        //  |     |
        //   --d-- 

        $display( "%s", { ~seg[0] ? " -- " : "    "                      } );
        $display( "%s", { ~seg[5] ? "|" : " ", "  ", ~seg[1] ? "|" : " " } );
        $display( "%s", { ~seg[6] ? " -- " : "    "                      } );
        $display( "%s", { ~seg[4] ? "|" : " ", "  ", ~seg[2] ? "|" : " " } );
        $display( "%s", { ~seg[3] ? " -- " : "    ", ~seg[7] ? "." : " " } );
    endtask

    // do at the beginning of the simulation
    initial 
        $dumpvars;  //iverilog dump init

endmodule
