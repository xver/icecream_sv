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
    * demonstrates the display of decimal values
    */
   int decimal_var = 123;

   /**
    * Variable: hex_var
    * demonstrates the display of hexdecimal values
    */
   bit [7:0] hex_var = 8'hFF;

   /**
    * Variable: char_var
    * demonstrates  the display of characters.
    */
   byte      char_var = "A";

   /**
    * Variable: str_var
    * demonstrates the display of strings
    */
   string    str_var = "Hello, World";

   /**
    * Variable:  fixed_array
    * demonstrates the display of fixed array.
    */
   int       fixed_array[10]='{'h0, 'h3, 'h6, 'h9, 'hc, 'hf, 'h12, 'h15, 'h18, 'h1b};

   /**
    * Variable:  dynamic_array
    * demonstrates the display of dynamic_array.
    */
   int       dynamic_array[]= '{'h0, 'h5, 'ha, 'hf, 'h14};

   /**
    * Variable: assoc_array
    * demonstrates the display of associative array
    */
   int       assoc_array[string] = '{"first":'h64, "second":'hc8, "third":'h12c};

   /**
    * Variable: queue
    * demonstrates the display of system verilog queues
    */
   int       queue[$] = '{'ha, 'h14, 'h1e};


   /** variable: struct_t
    *
    * A structure that holds an integer, a string, and an 8-bit bit vector
    *
    * Members:
    *   int struct_int - An integer field in the structure.
    *   string struct_string - A string field in the structure.
    *   bit [7:0] struct_bit - An 8-bit bit vector field in the structure.
    */

   typedef struct {
      int         struct_int;
      string      struct_string;
      bit [7:0]   struct_bit;
   } struct_t;

   /**
    * Variable: my_struct
    * demonstrates the display of structures
    */
   struct_t my_struct='{struct_int:'haa, struct_string:"Hello, World!", struct_bit:'hff};


   /* Union: union_t
    *
    * This is a union that shares memory between different data types.
    *
    * Members:
    *
    * * int union_int - This integer value shares memory with other fields.
    * * string union_string - This string value shares memory with other fields.
    * * bit [7:0] union_bit - This 8-bit binary value shares memory with other fields.
    */

   typedef union  {
      int         union_int;
      reg [31:0]  union_reg;
      bit [31:0]   union_bit;
   } union_t;

   /**
    * Variable: my_struct
    * demonstrates the display of unions
    */
   union_t my_union;



  initial begin
      my_union.union_int = 'h55;

      /**
       * Define: IC
       * Demonstrates the use of the IC macro to display the following data types:
       *
       * - decimal (int)
       * - hexadecimal (bit [7:0])
       * - character (byte)
       * - string
       * - fixed array (int [10])
       * - dynamic array (int[])
       * - associative array (int [string])
       * - queue (int [$])
       * - structure (struct_t)
       * - union (union_t)
       *
       * Output:
       * --- Code
         IC_SV:: @0 Line:152 File:../test_icecream.sv
         IC_SV:: @0 Line:153 File:../test_icecream.sv decimal_var('h7b)
         IC_SV:: @0 Line:154 File:../test_icecream.sv hex_var('hff)
         IC_SV:: @0 Line:155 File:../test_icecream.sv char_var('h41)
         IC_SV:: @0 Line:156 File:../test_icecream.sv str_var("Hello, World")
         IC_SV:: @0 Line:157 File:../test_icecream.sv fixed_array('{'h0, 'h3, 'h6, 'h9, 'hc, 'hf, 'h12, 'h15, 'h18, 'h1b} )
         IC_SV:: @0 Line:158 File:../test_icecream.sv dynamic_array('{'h0, 'h5, 'ha, 'hf, 'h14} )
         IC_SV:: @0 Line:159 File:../test_icecream.sv assoc_array('{"first":'h64, "second":'hc8, "third":'h12c} )
         IC_SV:: @0 Line:160 File:../test_icecream.sv queue('{'ha, 'h14, 'h1e} )
         IC_SV:: @0 Line:161 File:../test_icecream.sv my_struct('{struct_int:'haa, struct_string:"Hello, World!", struct_bit:'hff})
         IC_SV:: @0 Line:162 File:../test_icecream.sv my_union('{union_int:'h55, union_reg:'h55, union_bit:'h55})
       * ---
       */
      `IC();
      `IC(decimal_var);
      `IC(hex_var);
      `IC(char_var);
      `IC(str_var);
      `IC(fixed_array);
      `IC(dynamic_array);
      `IC(assoc_array);
      `IC(queue);
      `IC(my_struct);
      `IC(my_union);

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

      /**
       * Define: IC_ARR
       * Demonstrates the use of the IC_ARR  macro to display:
       *
       * - fixed array
       * - dynamic array
       * - associative array
       * - queue
       * - structure
       * - union
       *
       * Output:
       * --- Code
       * * IC_SV:: @0 fixed_array('{'h0, 'h3, 'h6, 'h9, 'hc, 'hf, 'h12, 'h15, 'h18, 'h1b} )
       * * IC_SV:: @0 dynamic_array('{'h0, 'h5, 'ha, 'hf, 'h14} )
       * * IC_SV:: @0 assoc_array('{"first":'h64, "second":'hc8, "third":'h12c} )
       * * IC_SV:: @0 queue('{'ha, 'h14, 'h1e} )
       * * IC_SV:: @0 my_struct('{struct_int:'haa, struct_string:"Hello, World!", struct_bit:'hff})
       * * IC_SV:: @0 my_union('{union_int:'h55, union_reg:'h55, union_bit:'h55})
       * ---
       */
      `IC_ARR(fixed_array)
      `IC_ARR(dynamic_array)
      `IC_ARR(assoc_array)
      `IC_ARR(queue)
      `IC_ARR(my_struct)
      `IC_ARR(my_union)

      $finish;
  end // initial begin

endmodule :  test_icecream



