LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

PACKAGE common_functions_pkg IS

  FUNCTION reduce_or(x : STD_LOGIC_VECTOR) RETURN STD_LOGIC;
  FUNCTION reduce_xor(x : STD_LOGIC_VECTOR) RETURN STD_LOGIC;
  FUNCTION reduce_and(x : STD_LOGIC_VECTOR) RETURN STD_LOGIC;
  FUNCTION bit_reverse(x : STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR;
  FUNCTION vector_xor(x : STD_LOGIC_VECTOR; y : STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR;
  FUNCTION clog2(x : INTEGER) RETURN INTEGER;

END PACKAGE;

PACKAGE BODY common_functions_pkg IS

  FUNCTION reduce_or(x : STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
    VARIABLE tmp : STD_LOGIC_VECTOR(x'length - 1 DOWNTO 0) := (OTHERS => '0');
  BEGIN
    IF (x = tmp) THEN
      RETURN '0';
    ELSE
      RETURN '1';
    END IF;
  END FUNCTION;

  FUNCTION reduce_and(x : STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
    VARIABLE tmp : STD_LOGIC_VECTOR(x'length - 1 DOWNTO 0) := (OTHERS => '1');
  BEGIN
    IF (x = tmp) THEN
      RETURN '1';
    ELSE
      RETURN '0';
    END IF; END FUNCTION;

    FUNCTION reduce_xor(x : STD_LOGIC_VECTOR) RETURN STD_LOGIC IS
      VARIABLE tmp : STD_LOGIC := '0';
    BEGIN
      tmp := '0';
      FOR i IN 0 TO x'length - 1 LOOP
        tmp := tmp XOR x(i);
      END LOOP;
      RETURN tmp;
    END FUNCTION;

    FUNCTION bit_reverse(x : STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS
      VARIABLE tmp : STD_LOGIC_VECTOR(x'length - 1 DOWNTO 0);

    BEGIN
      FOR i IN 0 TO x'length - 1 LOOP
        tmp(i) := x(x'length - 1 - i);
      END LOOP;
      RETURN tmp;
    END FUNCTION;

    FUNCTION vector_xor(x : STD_LOGIC_VECTOR; y : STD_LOGIC_VECTOR) RETURN STD_LOGIC_VECTOR IS
      VARIABLE tmp : STD_LOGIC_VECTOR(x'length - 1 DOWNTO 0);
    BEGIN
      FOR i IN 0 TO x'length - 1 LOOP
        tmp(i) := x(i) XOR y(i);
      END LOOP;
      RETURN tmp;
    END FUNCTION;

    FUNCTION clog2(x : INTEGER) RETURN INTEGER IS
      VARIABLE tmp : INTEGER := 1;
    BEGIN
      WHILE 2 ** tmp < x LOOP
        tmp := tmp + 1;
      END LOOP;
      return tmp;
    END FUNCTION;

  END PACKAGE BODY;