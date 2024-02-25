/*
============================================================================
 File        : test_icecream.sv
 Copyright (c) 2024 IC Verimeter. All rights reserved.
               Licensed under the MIT License.
               See LICENSE file in the project root for full license information.
 Description : icecream_sv test
 ============================================================================
*/

/**
 * module: test_icecream
 *
 * A test module demonstrating the usage of the icecream_pkg debugging macros with various data types.
 *
 */

module test_icecream;
   
   import icecream_pkg::*; 
  
   /**
    * Variable: decimal_var
    * An integer variable used to demonstrate decimal value display.
    */
   int decimal_var = 123;

   /**
    * Variable: hex_var
    * A bit vector variable used to demonstrate hexadecimal value display.
    */
   bit [7:0] hex_var = 8'hFF;

   /**
    * Variable: char_var
    * A byte variable used to demonstrate character value display.
    */
   byte char_var = "A";

   /**
    * Variable: str_var
    * A string variable used to demonstrate string value display.
    */
   string str_var = "Hello, World";
   
   initial begin
      
      /**
       * Define: IC
       * Demonstrates the use of the IC macro to display current simulation time, line number, and file.
       * 
       * Output:
       *  --- Code 
       * IC_SV:: @0 Line:52 File:../test_icecream.sv 
       * ---
       */
      `IC;

      /**
       * Define: IC_HEX
       * Demonstrates the use of the IC_HEX macro to display the hexadecimal value of hex_var.
       * 
       *  Output:
       *  --- Code 
       *  IC_SV:: @0 hex_var(ff)
       *   ---
       */
      `IC_HEX(hex_var);
      
      /**
       * Define: IC_DEC
       * Demonstrates the use of the IC_DEC macro to display the decimal value of decimal_var.
       * 
       * Output: 
       * --- Code
       * IC_SV:: @0 decimal_var(123)
       * ---
       */
      `IC_DEC(decimal_var);
      
      /**
       * Define:  IC_CHAR
       * Demonstrates the use of the IC_CHAR macro to display the character value of char_var.
       * 
       * Output: 
       * --- Code 
       * IC_SV:: @0 char_var(41),(A)
       * ---
       */
      `IC_CHAR(char_var);
      
      /**
       * Define: IC_STR
       * Demonstrates the use of the IC_STR macro to display the string value of str_var.
       * 
       * Output: 
       * --- Code 
       * * IC_SV:: @0 str_var(Hello, World)
       * ---
       */
      `IC_STR(str_var);
      
      $finish;
   end // initial begin
   
endmodule :  test_icecream


