LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

PACKAGE common_functions_pkg IS

    FUNCTION reduce_or(x  : std_logic_vector) return std_logic;
    FUNCTION reduce_xor(x : std_logic_vector) return std_logic;
    FUNCTION reduce_and(x : std_logic_vector) return std_logic;
    FUNCTION bit_reverse(x: std_logic_vector) return std_logic_vector;

END PACKAGE;

PACKAGE BODY common_functions_pkg IS

    FUNCTION reduce_or(x  : std_logic_vector) return std_logic is
      variable tmp: std_logic_vector(x'length-1 downto 0) := (others => '0');
      BEGIN
        if(x = tmp) then
          return '0';
        else
          return '1';
        end if;
    end function;



    FUNCTION reduce_and(x : std_logic_vector) return std_logic is
      variable tmp: std_logic_vector(x'length-1 downto 0) := (others => '1');
      BEGIN
        if(x = tmp) then
          return '1';
        else
          return '0';
        end if;    end function;

    FUNCTION reduce_xor(x : std_logic_vector) return std_logic is
      variable tmp: std_logic := '0';
      BEGIN
        tmp := '0';
        for i in 0 to x'length-1 loop
          tmp := tmp XOR x(i);
        end loop;
      return tmp;
    end function;

    FUNCTION bit_reverse(x: std_logic_vector) return std_logic_vector is
      variable tmp: std_logic_vector(x'length-1 downto 0);

      begin
      for i in 0 to x'length-1 loop
          tmp(i) := x(x'length-1-i);
      end loop;
      return tmp;
    END FUNCTION;


END PACKAGE BODY;
