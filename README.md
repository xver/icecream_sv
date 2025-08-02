# Welcome to icecream_sv - IceCream for SystemVerilog! !["Copyright (c) 2024 IC Verimeter"](https://github.com/xver/icecream_sv/blob/main/doc/IcVerimeter_logo.png) [![](https://img.shields.io/static/v1?label=Sponsor&message=%E2%9D%A4&logo=GitHub&color=%23fe8e86)](https://github.com/sponsors/xver)

![icecream_sv Logo](https://github.com/xver/icecream_sv/blob/main/doc/icecream_sv_log.png)

Never use **$display** and **`uvm_info** to debug SystemVerilog again.

The **icecream_sv** utility makes it easier to inspect variables, expressions, and program flow with minimal syntax. Inspired by the `IceCream` project, `icecream_sv` aims to bring the simplicity and convenience of those tools to the SystemVerilog world. **icecream_sv** is available under the MIT License and can be used without restriction in both open-source and commercial applications.

Also, check out other open-source projects by IC Verimeter:
 - [The Shunt](https://github.com/xver/Shunt): An Open Source Client/Server TCP/IP socket-based communication library designed for integrating SystemVerilog simulations with external applications in C, SystemC, and Python.
 - [SVDB Gateway](https://github.com/xver/svdb_gateway): A bridge between SystemVerilog and SQLite databases, allowing SystemVerilog code to interact with SQLite through the Direct Programming Interface (DPI).

## Installation 
To use `icecream_sv`, simply include and import the `icecream_pkg.sv` file in your project's build flow.

## Usage
To debug with `icecream_sv`, use the `IC` macros anywhere in your SystemVerilog code:

```systemverilog
module my_module;
   
   import icecream_pkg::*; 
   
   int decimal_var = 123;
   bit [7:0] hex_var = 8'hFF;
   byte      char_var = "A";
   string    str_var = "ICECREAM for SV";
   int       fixed_array[10]='{'h0, 'h3, 'h6, 'h9, 'hc, 'hf, 'h12, 'h15, 'h18, 'h1b};
   int       dynamic_array[]= '{'h0, 'h5, 'ha, 'hf, 'h14};
   int       assoc_array[string] = '{"first":'h64, "second":'hc8, "third":'h12c};
   int       queue[$] = '{'ha, 'h14, 'h1e};
   
   typedef struct {
      int         struct_int;
      string      struct_string;
      bit [7:0]   struct_bit;
   } struct_t;
   struct_t my_struct='{struct_int:'haa, struct_string:"Hello, World!", struct_bit:'hff};
   
   typedef union  {
      int         union_int;
      reg [31:0]  union_reg;
      bit [31:0]   union_bit;
   } union_t;
   union_t my_union;
   
   initial begin
      my_union.union_int = 'h55;
      `IC;
      `IC_HEX(hex_var);
      `IC_DEC(decimal_var);
      `IC_CHAR(char_var);
      `IC_STR(str_var);
      `IC_ARR(fixed_array)
      `IC_ARR(dynamic_array)
      `IC_ARR(assoc_array)
      `IC_ARR(queue)
      `IC_ARR(my_struct)
      `IC_ARR(my_union)
      
      $finish;
   end // initial begin
   
endmodule:  my_module

Output:

  IC_SV:: @0 Line:128 File:../test_icecream.sv
  IC_SV:: @0 hex_var(ff)
  IC_SV:: @0 decimal_var(123)
  IC_SV:: @0 char_var(41),(A)
  IC_SV:: @0 str_var(s)Hello, World
  IC_SV:: @0 fixed_array('{'h0, 'h3, 'h6, 'h9, 'hc, 'hf, 'h12, 'h15, 'h18, 'h1b} )
  IC_SV:: @0 dynamic_array('{'h0, 'h5, 'ha, 'hf, 'h14} )
  IC_SV:: @0 assoc_array('{"first":'h64, "second":'hc8, "third":'h12c} )
  IC_SV:: @0 queue('{'ha, 'h14, 'h1e} )
  IC_SV:: @0 my_struct('{struct_int:'haa, struct_string:"ICECREAM for SV", struct_bit:'hff})
  IC_SV:: @0 my_union('{union_int:'h55, union_reg:'h55, union_bit:'h55})

```

### Compile and Run Example 

- Change directory to `test/<simulator>`
- Run `make`

*NOTE: The test is available only for Verilator currently.*

### HTML Documentation

- API specification is available [here](https://raw.githack.com/xver/icecream_sv/master/doc/index.html).

## Features

- **Easy Inspection**: Quickly print variable names and their values without repetitive code.
- **Minimal Syntax**: Use the `IC` macros for everything, keeping your debug code clean and concise.
- **Flexible**: Works with any SystemVerilog data type.

## Contributing and Bugs [![](https://img.shields.io/static/v1?label=Sponsor&message=%E2%9D%A4&logo=GitHub&color=%23fe8e86)](https://github.com/sponsors/xver)

- Contributions to `icecream_sv` are welcome! Whether it's adding new features, fixing bugs, or improving documentation, feel free to fork the repository and submit a pull request.
- Please report bugs to the [Issues](https://github.com/xver/icecream_sv/issues) page.

## Questions, Enquiries, Commercial Support [![](https://img.shields.io/static/v1?label=Sponsor&message=%E2%9D%A4&logo=GitHub&color=%23fe8e86)](https://github.com/sponsors/xver)

Please contact us at **icshunt.help@gmail.com**

## License

`icecream_sv` is released under the MIT License. See the LICENSE file for more details.

## Acknowledgments 

- Inspired by `IceCream` protects: 

https://github.com/gruns/icecream

Delicious `IceCream` should be enjoyed in every language.

- Dart: [icecream](https://github.com/HallerPatrick/icecream)
- Rust: [icecream-rs](https://github.com/ericchang00/icecream-rs)
- Node.js: [node-icecream](https://github.com/jmerle/node-icecream)
- C++: [IceCream-Cpp](https://github.com/renatoGarcia/icecream-cpp)
- C99: [icecream-c](https://github.com/chunqian/icecream-c)
- PHP: [icecream-php](https://github.com/ntzm/icecream-php)
- Go: [icecream-go](https://github.com/WAY29/icecream-go)
- Ruby: [Ricecream](https://github.com/nodai2hITC/ricecream)
- Java: [icecream-java](https://github.com/Akshay-Thakare/icecream-java)
- R: [icecream](https://github.com/lewinfox/icecream)
- Lua: [icecream-lua](https://github.com/wlingze/icecream-lua)
- Clojure(Script): [icecream-cljc](https://github.com/Eigenbahn/icecream-cljc)
- Bash: [IceCream-Bash](https://github.com/jtplaarj/IceCream-Bash)
-------------------------
!["Copyright (c) 2024 IC Verimeter"](https://github.com/xver/icecream_sv/blob/main/doc/IcVerimeter_logo.png) [![](https://img.shields.io/static/v1?label=Sponsor&message=%E2%9D%A4&logo=GitHub&color=%23fe8e86)](https://github.com/sponsors/xver)
Copyright (c) 2024 IC Verimeter


  

