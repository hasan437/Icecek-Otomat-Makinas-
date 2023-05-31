module a ( 
    input btn1,                     //butonları input ve ledleri output olarak verdim.
    input btn2,    
    output reg [2:0] lights);       //led için 3 bit tutan bir oluşturdum.

    reg [1:0] count = 2'b00;     // count adında, register türünde 2 bit tutan bir sayıcı oluşturdum ve ilk değeri "0".
    initial begin
        lights = 3'b111;         //initial blokları içinde led'in ilk değerini verdim ve başlangıçta yanmayacak.
    end
    
    always @ (btn1 | btn2) begin                //sensitivity listte butonları tetikleyici olarak verdim.
        if((btn1 == 0) && (btn2 == 1))begin     
            count <= count + 1;                 // sadece "A" butonuna basıldığında sayıcının değeri "1" artacak.
        end
        if( (btn2 == 0) && (btn1 == 1)) begin      // sadece "B" butonuna basıldığında sayıcının değerine göre belirtilen renkte led yanacak.
            case (count)
                2'b01: begin
                    lights = 3'b110;
                end
                2'b10: begin
                    lights = 3'b101;
                end
                2'b11: begin
                    lights = 3'b011;
                end
            endcase
        end
        if ((btn1 == 0) && (btn2 == 0)) begin           //eğer iki butona da basılmışsa sayıcı sıfırlanacak ve led sönecek.
             count <= 2'b00;
             lights = 3'b111;
        end
            
    end

endmodule
    
