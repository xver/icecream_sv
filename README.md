# Welcome to icecream_sv - IceCream for SystemVerilog! ![](https://github.com/xver/icecream_sv/blob/main/doc/IcVerimeter_logo.png) [![](https://img.shields.io/static/v1?label=Sponsor&message=%E2%9D%A4&logo=GitHub&color=%23fe8e86)](https://github.com/sponsors/xver)

![icecream_sv Logo](https://github.com/xver/icecream_sv/blob/main/doc/icecream_sv_log.png)

Never use **$display** and **`uvm_info** to debug SystemVerilog again.

The **icecream_sv** utility makes it easier to inspect variables, expressions, and program flow with minimal syntax. Inspired by the `IceCream` project, `icecream_sv` aims to bring the simplicity and convenience of those tools to the SystemVerilog world. **icecream_sv** is available under the MIT License and can be used without restriction in both open-source and commercial applications.

The package is intentionally minimal so it compiles quickly and is portable across common simulators. Tests are provided for Verilator, and the package has been validated on Aldec Riviera, Cadence Xcelium, Siemens Questa, and Synopsys VCS.

Also, check out other open-source projects by IC Verimeter.

- [The Shunt](https://github.com/xver/Shunt): An Open Source Client/Server TCP/IP socket-based communication library designed for integrating SystemVerilog simulations with external applications in C, SystemC, and Python.
- [SVDB Gateway](https://github.com/xver/svdb_gateway): A bridge between SystemVerilog and SQLite databases, allowing SystemVerilog code to interact with SQLite through the Direct Programming Interface (DPI).

## Why use icecream_sv?

* Faster debugging: write `IC(my_var)`instead of crafting `$display or `uvm_info format strings
* Easier to scan logs: consistent output format with variable name and value
* Lightweight: small footprint, no runtime dependencies or external tools
* Portable: written in plain SystemVerilog and works in typical simulator workflows

## Installation

To use `icecream_sv`, simply include and import the `icecream_pkg.sv` file in your project's build flow.

**Note**: The `import icecream_pkg::*` statement is optional, but we recommend including it because future versions of icecream_sv may require it.

## Supported simulators

* **Tested with all major SystemVerilog RTL simulators:**
  * Aldec Riviera
  * Cadence Xcelium
  * Siemens Questa
  * Synopsys VCS
  * Verilator

You can also try `icecream_sv` directly on [EDA Playground](https://www.edaplayground.com/x/J3HG).

---

## Usage

To debug with `icecream_sv`, use the `IC` macros anywhere in your SystemVerilog code

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
      `IC();
      `IC(decimal_var, "NO");
      `IC(hex_var);
      `IC(char_var);
      `IC(str_var);
      `IC(fixed_array);
      `IC(dynamic_array);
      `IC(assoc_array);
      `IC(queue);
      `IC(my_struct);
      `IC(my_union);
      `IC_DEC(decimal_var);
      `IC_CHAR(char_var);
   
      $finish;
   end // initial begin
   
endmodule:  my_module
```

Output:

```
IC_SV:: @0 Line:67 File:../my_module.sv
IC_SV:: @0 decimal_var('h7b)
IC_SV:: @0 Line:69 File:../my_module.sv hex_var('hff)
IC_SV:: @0 Line:70 File:../my_module.sv char_var('h41)
IC_SV:: @0 Line:71 File:../my_module.sv str_var(ICECREAM for SV)
IC_SV:: @0 Line:72 File:../my_module.sv fixed_array('{'h0, 'h3, 'h6, 'h9, 'hc, 'hf, 'h12, 'h15, 'h18, 'h1b})
IC_SV:: @0 Line:73 File:../my_module.sv dynamic_array('{'h0, 'h5, 'ha, 'hf, 'h14})
IC_SV:: @0 Line:74 File:../my_module.sv assoc_array('{"first":'h64, "second":'hc8, "third":'h12c})
IC_SV:: @0 Line:75 File:../my_module.sv queue('{'ha, 'h14, 'h1e})
IC_SV:: @0 Line:76 File:../my_module.sv my_struct('{struct_int:'haa, struct_string:"Hello, World!", struct_bit:'hff})
IC_SV:: @0 Line:77 File:../my_module.sv my_union('{union_int:'h55, union_reg:'h55, union_bit:'h55})
IC_SV:: @0 decimal_var(123)
IC_SV:: @0 char_var(41),(A)
```

### Compile and Run Example

- Change directory to `test/verilator`
- Run `make`

*NOTE: The example is provided for Verilator only. For other simulators, use [EDA Playground](https://www.edaplayground.com/x/J3HG)

## HTML Documentation

- API specification is available [here](https://raw.githack.com/xver/icecream_sv/master/doc/index.html).

## Features

* Simple, single-line macros to print: variable **name** + **value** + file and line prefix
* Works with primitives (ints, bits), packed and unpacked arrays, fixed and dynamic arrays, queues, associative arrays
* Prints structs and unions in a readable form.
* Small, header-only SystemVerilog package, drop it into your compile list
* Example test harness and `Makefile` for Verilator-based tests

## Contributing and Bugs [![](https://img.shields.io/static/v1?label=Sponsor&message=%E2%9D%A4&logo=GitHub&color=%23fe8e86)](https://github.com/sponsors/xver)

- Contributions to icecream_sv are welcome! Whether it is adding new features, fixing bugs, or improving documentation, feel free to fork the repository and submit a pull request.

Please follow these simple guidelines:

1. Fork the repository and create a topic branch for your changes.
3. Run the existing examples ()test/verilator) or try them on EDA Playground, and add new tests for any new behaviour.
4. Open a pull request describing your changes and the reasoning behind them.
5. Follow the project code style and keep the package small and dependency-free.

- Please report bugs to the [Issues](https://github.com/xver/icecream_sv/issues) page.

## Questions, Enquiries, Commercial Support [![](https://img.shields.io/static/v1?label=Sponsor&message=%E2%9D%A4&logo=GitHub&color=%23fe8e86)](https://github.com/sponsors/xver)

Please contact us at **icshunt.help@gmail.com**

## License

`icecream_sv` is released under the MIT License. See the LICENSE file for more details.

## Acknowledgments

- Inspired by `IceCream` protects

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

---

![img](https://github.com/xver/icecream_sv/blob/main/doc/IcVerimeter_logo.png) [![](https://img.shields.io/static/v1?label=Sponsor&message=%E2%9D%A4&logo=GitHub&color=%23fe8e86)](https://github.com/sponsors/xver)
Copyright (c) 2024 IC Verimeter
