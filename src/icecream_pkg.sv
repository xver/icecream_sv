/*
============================================================================
 File        : icecream_pkg.sv
 Copyright (c) 2024 IC Verimeter. All rights reserved.
               Licensed under the MIT License.
               See LICENSE file in the project root for full license information.
 Description : Simple implementation of IceCream for SystemVerilog 
 Inspired by `IceCream` projects,  for Python,C++,Bash and e.t.c
 ============================================================================
*/


/**
 * Package: icecream_pkg
 *
 * A utility package for debugging in SystemVerilog that provides easy-to-use macros for displaying variable values and diagnostic information.
 * 
 * Inspired by `IceCream`projects
 * 
 */

package icecream_pkg;

/**
 * Macro: IC
 *
 * Displays a message with the current simulation time, line number, and file name.
 *
 * Example:
 * > `IC 
 */
`define IC  $display("IC_SV:: @%0t Line:%0d File:%s",$time,`__LINE__,`__FILE__);

/**
 * Macro: IC_HEX
 *
 * Displays the hexadecimal value of a variable along with the current simulation time.
 *
 * Parameters:
 *   __VALUE - The variable whose hexadecimal value is to be displayed.
 *
 * Example:
 * > `IC_HEX(my_var)
 */
`define IC_HEX(__VALUE) $display("IC_SV:: @%0t %s(%0h)",$time, `"__VALUE`", __VALUE);

/**
 * Macro: IC_DEC
 *
 * Displays the decimal value of a variable along with the current simulation time.
 *
 * Parameters:
 *   __VALUE - The variable whose decimal value is to be displayed.
 *
 * Example:
 * > `IC_DEC(my_var)
 */
`define IC_DEC(__VALUE) $display("IC_SV:: @%0t %s(%0d)",$time, `"__VALUE`", __VALUE);

/**
 * Macro: IC_CHAR
 *
 * Displays the hexadecimal and ASCII character representation of a variable along with the current simulation time.
 *
 * Parameters:
 *   __VALUE - The variable whose values are to be displayed.
 *
 * Example:
 * > `IC_CHAR(my_var)
 */
`define IC_CHAR(__VALUE) $display("IC_SV:: @%0t %s(%0h),(%s)", $time, `"__VALUE`", __VALUE, __VALUE);

/**
 * Macro: IC_STR
 *
 * Displays the string representation of a variable along with the current simulation time.
 *
 * Parameters:
 *   __VALUE - The string variable to be displayed.
 *
 * Example:
 * > `IC_STR(my_var)
 */
`define IC_STR(__VALUE) $display("IC_SV:: @%0t %s(s)",$time, `"__VALUE`", __VALUE);

endpackage // icecream_pkg

   
