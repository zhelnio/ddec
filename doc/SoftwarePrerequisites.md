
# Software Prerequisites

1. Visual Studio Code with plugins:
    - SystemVerilog - Language Support (eirikpre.systemverilog)
    - Tcl (sleutho.tcl)
    - MIPS Support (kdarkhan.mips)
2. MSYS2 with packages:
    - make
    - mc
3. Intel Quartus Lite 17.1
4. Xilinx Vivado WebPack 2018.2
5. Icarus Verilog 10.1.1
6. Git

## Details of Install Process

1. Visual Studio Code
    - link: https://code.visualstudio.com/

2. MSYS2
    - link: https://www.msys2.org/
    - assume you installed MSYS2 at 'C:\bin\msys64', add 'C:\bin\msys64\usr\bin' to your %PATH% environment variable;
    - to install "make" & "mc", issue the following commands under cmd.exe
    ```
        C:\> pacman -S make
        C:\> pacman -S mc
    ```
    - to check that the %PATH% is correct, issue the following command under cmd.exe
    ```
        C:\> make
    ```

3. Intel Quartus Lite 17.1
    - link: http://dl.altera.com/17.1/?edition=lite&lang=en
    - selected options:
        + Cyclone IV
        + Cyclone V
        + MAX 10 FPGA
        + Modelsim - Intel FPGA starter Edition
    - assume you installed Intel Quartus at 'C:\bin\altera\17.1\', add 'C:\bin\altera\17.1\quartus\bin64' and 'C:\bin\altera\altera\17.1\modelsim_ase\win32aloem' to your %PATH% environment variable
    - to check that the %PATH% is correct, issue the following commands under cmd.exe
    ```
        C:\> quartus
        C:\> vsim
    ```

4. Xilinx Vivado WebPack 2018.2
    - link: https://www.xilinx.com/support/download.html
    - selected options:
        + DocNav
        + Artix-7
        + Virtex-7
        + Spartan-7
        + Install Cable Drivers
    - assume you installed Xilinx Vivado at 'C:\bin\Xilinx\', add 'C:\bin\Xilinx\Vivado\2018.2\bin' to your %PATH% environment variable
    - to check that the %PATH% is correct, issue the following command under cmd.exe
    ```
        C:\> vivado
    ```

5. Icarus Verilog 10.1.1
    - link: http://bleyer.org/icarus/
    - assume you installed Icarus Verilog at 'C:\bin\iverilog', add 'C:\bin\iverilog\bin' and 'C:\bin\iverilog\gtkwave\bin' to your %PATH% environment variable
    - to check that the %PATH% is correct, issue the following commands under cmd.exe
    ```
        C:\> iverilog
        C:\> gtkwave
    ```

6. Git
    - link: https://git-scm.com/download/win
    - check that folder with git binary was added to %PATH%
    ```
        C:\> git
    ```

7. Additional information
    - to simplify %PATH% editing you can use RapidEE: https://www.rapidee.com/
