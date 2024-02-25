# Welcome to icecream_sv - IceCream for SystemVerilog!

![icecream_sv Logo](https://github.com/xver/icecream_sv/blob/main/doc/icecream_sv_log.png)

Never use `$display` and `uvm_info` to debug SystemVerilog again.

The **icecream_sv** utility makes it easier to inspect variables, expressions, and program flow with minimal syntax. Inspired by the `IceCream` project, `icecream_sv` aims to bring the simplicity and convenience of those tools to the SystemVerilog world. **icecream_sv** is available under the MIT License and can be used without restriction in both open-source and commercial applications.

## Installation

To use `icecream_sv`, simply include and import the `icecream_pkg.sv` file in your project's build flow.

## Usage

To debug with `icecream_sv`, use the `IC` macros anywhere in your SystemVerilog code:

```systemverilog
module my_module;

  initial begin
    // Example usage of icecream_sv
    int var = 10;
    byte char_var = "A"; 
    string str_var = "ICECREAM for SV";
    `IC;          // This will print the line number and file name  
    `IC_HEX(var); // This will print the variable name and its value in hex format
    `IC_DEC(var); // This will print the variable name and its value in dec format
    `IC_CHAR(char_var); // This will print ASCII and HEX for the char_var variable
    `IC_STR(str_var);   // This will print the str_var string
  end
endmodule
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

## Contributing and Bugs

- Contributions to `icecream_sv` are welcome! Whether it's adding new features, fixing bugs, or improving documentation, feel free to fork the repository and submit a pull request.
- Please report bugs to the [Issues](https://github.com/xver/icecream_sv/issues) page.

## Questions, Enquiries, Commercial Support

Please contact us at **icshunt.help@gmail.com**

## License

`icecream_sv` is released under the MIT License. See the LICENSE file for more details.

## Acknowledgments

- Inspired by `IceCream` progects: 

  Delicious IceCream should be enjoyed in every language.

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
!["Copyright (c) 2024 IC Verimeter"]((https://github.com/xver/icecream_sv/blob/main/doc/IcVerimeter_logo.png)
Copyright (c) 2024 IC Verimeter


  

