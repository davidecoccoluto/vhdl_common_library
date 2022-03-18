-- Author: Davide Coccoluto
-- Description:
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;


package common_type_definition_pkg is

 ------------------------------------------
subtype signed4_t is signed(3 downto 0); 
subtype signed5_t is signed(4 downto 0); 
subtype signed6_t is signed(5 downto 0); 
subtype signed7_t is signed(6 downto 0); 
subtype signed8_t is signed(7 downto 0); 
subtype signed9_t is signed(8 downto 0); 
subtype signed10_t is signed(9 downto 0); 
subtype signed11_t is signed(10 downto 0); 
subtype signed12_t is signed(11 downto 0); 
subtype signed13_t is signed(12 downto 0); 
subtype signed14_t is signed(13 downto 0); 
subtype signed15_t is signed(14 downto 0); 
subtype signed16_t is signed(15 downto 0); 
subtype signed17_t is signed(16 downto 0); 
subtype signed18_t is signed(17 downto 0); 
subtype signed19_t is signed(18 downto 0); 
subtype signed20_t is signed(19 downto 0); 
subtype signed21_t is signed(20 downto 0); 
subtype signed22_t is signed(21 downto 0); 
subtype signed23_t is signed(22 downto 0); 
subtype signed24_t is signed(23 downto 0); 
subtype signed25_t is signed(24 downto 0); 
subtype signed26_t is signed(25 downto 0); 
subtype signed27_t is signed(26 downto 0); 
subtype signed28_t is signed(27 downto 0); 
subtype signed29_t is signed(28 downto 0); 
subtype signed30_t is signed(29 downto 0); 
subtype signed31_t is signed(30 downto 0); 
subtype signed32_t is signed(31 downto 0); 
subtype signed33_t is signed(32 downto 0); 
subtype signed34_t is signed(33 downto 0); 
subtype signed35_t is signed(34 downto 0); 
subtype signed36_t is signed(35 downto 0); 
subtype signed37_t is signed(36 downto 0); 
subtype signed38_t is signed(37 downto 0); 
subtype signed39_t is signed(38 downto 0); 
subtype signed40_t is signed(39 downto 0); 
subtype signed41_t is signed(40 downto 0); 
subtype signed42_t is signed(41 downto 0); 
subtype signed43_t is signed(42 downto 0); 
subtype signed44_t is signed(43 downto 0); 
subtype signed45_t is signed(44 downto 0); 
subtype signed46_t is signed(45 downto 0); 
subtype signed47_t is signed(46 downto 0); 
subtype signed48_t is signed(47 downto 0); 
subtype signed49_t is signed(48 downto 0); 
subtype signed50_t is signed(49 downto 0); 
subtype signed51_t is signed(50 downto 0); 
subtype signed52_t is signed(51 downto 0); 
subtype signed53_t is signed(52 downto 0); 
subtype signed54_t is signed(53 downto 0); 
subtype signed55_t is signed(54 downto 0); 
subtype signed56_t is signed(55 downto 0); 
subtype signed57_t is signed(56 downto 0); 
subtype signed58_t is signed(57 downto 0); 
subtype signed59_t is signed(58 downto 0); 
subtype signed60_t is signed(59 downto 0); 
subtype signed61_t is signed(60 downto 0); 
subtype signed62_t is signed(61 downto 0); 
subtype signed63_t is signed(62 downto 0); 
subtype signed64_t is signed(63 downto 0); 
subtype signed128_t is signed(127 downto 0); 
subtype signed256_t is signed(255 downto 0); 
subtype signed512_t is signed(511 downto 0); 
subtype signed1024_t is signed(1023 downto 0); 
subtype signed2048_t is signed(2047 downto 0); 


 ------------------------------------------
subtype unsigned4_t is unsigned(3 downto 0); 
subtype unsigned5_t is unsigned(4 downto 0); 
subtype unsigned6_t is unsigned(5 downto 0); 
subtype unsigned7_t is unsigned(6 downto 0); 
subtype unsigned8_t is unsigned(7 downto 0); 
subtype unsigned9_t is unsigned(8 downto 0); 
subtype unsigned10_t is unsigned(9 downto 0); 
subtype unsigned11_t is unsigned(10 downto 0); 
subtype unsigned12_t is unsigned(11 downto 0); 
subtype unsigned13_t is unsigned(12 downto 0); 
subtype unsigned14_t is unsigned(13 downto 0); 
subtype unsigned15_t is unsigned(14 downto 0); 
subtype unsigned16_t is unsigned(15 downto 0); 
subtype unsigned17_t is unsigned(16 downto 0); 
subtype unsigned18_t is unsigned(17 downto 0); 
subtype unsigned19_t is unsigned(18 downto 0); 
subtype unsigned20_t is unsigned(19 downto 0); 
subtype unsigned21_t is unsigned(20 downto 0); 
subtype unsigned22_t is unsigned(21 downto 0); 
subtype unsigned23_t is unsigned(22 downto 0); 
subtype unsigned24_t is unsigned(23 downto 0); 
subtype unsigned25_t is unsigned(24 downto 0); 
subtype unsigned26_t is unsigned(25 downto 0); 
subtype unsigned27_t is unsigned(26 downto 0); 
subtype unsigned28_t is unsigned(27 downto 0); 
subtype unsigned29_t is unsigned(28 downto 0); 
subtype unsigned30_t is unsigned(29 downto 0); 
subtype unsigned31_t is unsigned(30 downto 0); 
subtype unsigned32_t is unsigned(31 downto 0); 
subtype unsigned33_t is unsigned(32 downto 0); 
subtype unsigned34_t is unsigned(33 downto 0); 
subtype unsigned35_t is unsigned(34 downto 0); 
subtype unsigned36_t is unsigned(35 downto 0); 
subtype unsigned37_t is unsigned(36 downto 0); 
subtype unsigned38_t is unsigned(37 downto 0); 
subtype unsigned39_t is unsigned(38 downto 0); 
subtype unsigned40_t is unsigned(39 downto 0); 
subtype unsigned41_t is unsigned(40 downto 0); 
subtype unsigned42_t is unsigned(41 downto 0); 
subtype unsigned43_t is unsigned(42 downto 0); 
subtype unsigned44_t is unsigned(43 downto 0); 
subtype unsigned45_t is unsigned(44 downto 0); 
subtype unsigned46_t is unsigned(45 downto 0); 
subtype unsigned47_t is unsigned(46 downto 0); 
subtype unsigned48_t is unsigned(47 downto 0); 
subtype unsigned49_t is unsigned(48 downto 0); 
subtype unsigned50_t is unsigned(49 downto 0); 
subtype unsigned51_t is unsigned(50 downto 0); 
subtype unsigned52_t is unsigned(51 downto 0); 
subtype unsigned53_t is unsigned(52 downto 0); 
subtype unsigned54_t is unsigned(53 downto 0); 
subtype unsigned55_t is unsigned(54 downto 0); 
subtype unsigned56_t is unsigned(55 downto 0); 
subtype unsigned57_t is unsigned(56 downto 0); 
subtype unsigned58_t is unsigned(57 downto 0); 
subtype unsigned59_t is unsigned(58 downto 0); 
subtype unsigned60_t is unsigned(59 downto 0); 
subtype unsigned61_t is unsigned(60 downto 0); 
subtype unsigned62_t is unsigned(61 downto 0); 
subtype unsigned63_t is unsigned(62 downto 0); 
subtype unsigned64_t is unsigned(63 downto 0); 
subtype unsigned128_t is unsigned(127 downto 0); 
subtype unsigned256_t is unsigned(255 downto 0); 
subtype unsigned512_t is unsigned(511 downto 0); 
subtype unsigned1024_t is unsigned(1023 downto 0); 
subtype unsigned2048_t is unsigned(2047 downto 0); 


 ------------------------------------------
type complex4_t is record re,im: signed(3 downto 0); end record; 
type complex5_t is record re,im: signed(4 downto 0); end record; 
type complex6_t is record re,im: signed(5 downto 0); end record; 
type complex7_t is record re,im: signed(6 downto 0); end record; 
type complex8_t is record re,im: signed(7 downto 0); end record; 
type complex9_t is record re,im: signed(8 downto 0); end record; 
type complex10_t is record re,im: signed(9 downto 0); end record; 
type complex11_t is record re,im: signed(10 downto 0); end record; 
type complex12_t is record re,im: signed(11 downto 0); end record; 
type complex13_t is record re,im: signed(12 downto 0); end record; 
type complex14_t is record re,im: signed(13 downto 0); end record; 
type complex15_t is record re,im: signed(14 downto 0); end record; 
type complex16_t is record re,im: signed(15 downto 0); end record; 
type complex17_t is record re,im: signed(16 downto 0); end record; 
type complex18_t is record re,im: signed(17 downto 0); end record; 
type complex19_t is record re,im: signed(18 downto 0); end record; 
type complex20_t is record re,im: signed(19 downto 0); end record; 
type complex21_t is record re,im: signed(20 downto 0); end record; 
type complex22_t is record re,im: signed(21 downto 0); end record; 
type complex23_t is record re,im: signed(22 downto 0); end record; 
type complex24_t is record re,im: signed(23 downto 0); end record; 
type complex25_t is record re,im: signed(24 downto 0); end record; 
type complex26_t is record re,im: signed(25 downto 0); end record; 
type complex27_t is record re,im: signed(26 downto 0); end record; 
type complex28_t is record re,im: signed(27 downto 0); end record; 
type complex29_t is record re,im: signed(28 downto 0); end record; 
type complex30_t is record re,im: signed(29 downto 0); end record; 
type complex31_t is record re,im: signed(30 downto 0); end record; 
type complex32_t is record re,im: signed(31 downto 0); end record; 
type complex33_t is record re,im: signed(32 downto 0); end record; 
type complex34_t is record re,im: signed(33 downto 0); end record; 
type complex35_t is record re,im: signed(34 downto 0); end record; 
type complex36_t is record re,im: signed(35 downto 0); end record; 
type complex37_t is record re,im: signed(36 downto 0); end record; 
type complex38_t is record re,im: signed(37 downto 0); end record; 
type complex39_t is record re,im: signed(38 downto 0); end record; 
type complex40_t is record re,im: signed(39 downto 0); end record; 
type complex41_t is record re,im: signed(40 downto 0); end record; 
type complex42_t is record re,im: signed(41 downto 0); end record; 
type complex43_t is record re,im: signed(42 downto 0); end record; 
type complex44_t is record re,im: signed(43 downto 0); end record; 
type complex45_t is record re,im: signed(44 downto 0); end record; 
type complex46_t is record re,im: signed(45 downto 0); end record; 
type complex47_t is record re,im: signed(46 downto 0); end record; 
type complex48_t is record re,im: signed(47 downto 0); end record; 
type complex49_t is record re,im: signed(48 downto 0); end record; 
type complex50_t is record re,im: signed(49 downto 0); end record; 
type complex51_t is record re,im: signed(50 downto 0); end record; 
type complex52_t is record re,im: signed(51 downto 0); end record; 
type complex53_t is record re,im: signed(52 downto 0); end record; 
type complex54_t is record re,im: signed(53 downto 0); end record; 
type complex55_t is record re,im: signed(54 downto 0); end record; 
type complex56_t is record re,im: signed(55 downto 0); end record; 
type complex57_t is record re,im: signed(56 downto 0); end record; 
type complex58_t is record re,im: signed(57 downto 0); end record; 
type complex59_t is record re,im: signed(58 downto 0); end record; 
type complex60_t is record re,im: signed(59 downto 0); end record; 
type complex61_t is record re,im: signed(60 downto 0); end record; 
type complex62_t is record re,im: signed(61 downto 0); end record; 
type complex63_t is record re,im: signed(62 downto 0); end record; 
type complex64_t is record re,im: signed(63 downto 0); end record; 
type complex128_t is record re,im: signed(127 downto 0); end record; 
type complex256_t is record re,im: signed(255 downto 0); end record; 
type complex512_t is record re,im: signed(511 downto 0); end record; 
type complex1024_t is record re,im: signed(1023 downto 0); end record; 
type complex2048_t is record re,im: signed(2047 downto 0); end record; 


 ------------------------------------------
type array_of_std_logic_vector4_t is array(natural range<>) of std_logic_vector(3 downto 0); 
type array_of_std_logic_vector5_t is array(natural range<>) of std_logic_vector(4 downto 0); 
type array_of_std_logic_vector6_t is array(natural range<>) of std_logic_vector(5 downto 0); 
type array_of_std_logic_vector7_t is array(natural range<>) of std_logic_vector(6 downto 0); 
type array_of_std_logic_vector8_t is array(natural range<>) of std_logic_vector(7 downto 0); 
type array_of_std_logic_vector9_t is array(natural range<>) of std_logic_vector(8 downto 0); 
type array_of_std_logic_vector10_t is array(natural range<>) of std_logic_vector(9 downto 0); 
type array_of_std_logic_vector11_t is array(natural range<>) of std_logic_vector(10 downto 0); 
type array_of_std_logic_vector12_t is array(natural range<>) of std_logic_vector(11 downto 0); 
type array_of_std_logic_vector13_t is array(natural range<>) of std_logic_vector(12 downto 0); 
type array_of_std_logic_vector14_t is array(natural range<>) of std_logic_vector(13 downto 0); 
type array_of_std_logic_vector15_t is array(natural range<>) of std_logic_vector(14 downto 0); 
type array_of_std_logic_vector16_t is array(natural range<>) of std_logic_vector(15 downto 0); 
type array_of_std_logic_vector17_t is array(natural range<>) of std_logic_vector(16 downto 0); 
type array_of_std_logic_vector18_t is array(natural range<>) of std_logic_vector(17 downto 0); 
type array_of_std_logic_vector19_t is array(natural range<>) of std_logic_vector(18 downto 0); 
type array_of_std_logic_vector20_t is array(natural range<>) of std_logic_vector(19 downto 0); 
type array_of_std_logic_vector21_t is array(natural range<>) of std_logic_vector(20 downto 0); 
type array_of_std_logic_vector22_t is array(natural range<>) of std_logic_vector(21 downto 0); 
type array_of_std_logic_vector23_t is array(natural range<>) of std_logic_vector(22 downto 0); 
type array_of_std_logic_vector24_t is array(natural range<>) of std_logic_vector(23 downto 0); 
type array_of_std_logic_vector25_t is array(natural range<>) of std_logic_vector(24 downto 0); 
type array_of_std_logic_vector26_t is array(natural range<>) of std_logic_vector(25 downto 0); 
type array_of_std_logic_vector27_t is array(natural range<>) of std_logic_vector(26 downto 0); 
type array_of_std_logic_vector28_t is array(natural range<>) of std_logic_vector(27 downto 0); 
type array_of_std_logic_vector29_t is array(natural range<>) of std_logic_vector(28 downto 0); 
type array_of_std_logic_vector30_t is array(natural range<>) of std_logic_vector(29 downto 0); 
type array_of_std_logic_vector31_t is array(natural range<>) of std_logic_vector(30 downto 0); 
type array_of_std_logic_vector32_t is array(natural range<>) of std_logic_vector(31 downto 0); 
type array_of_std_logic_vector33_t is array(natural range<>) of std_logic_vector(32 downto 0); 
type array_of_std_logic_vector34_t is array(natural range<>) of std_logic_vector(33 downto 0); 
type array_of_std_logic_vector35_t is array(natural range<>) of std_logic_vector(34 downto 0); 
type array_of_std_logic_vector36_t is array(natural range<>) of std_logic_vector(35 downto 0); 
type array_of_std_logic_vector37_t is array(natural range<>) of std_logic_vector(36 downto 0); 
type array_of_std_logic_vector38_t is array(natural range<>) of std_logic_vector(37 downto 0); 
type array_of_std_logic_vector39_t is array(natural range<>) of std_logic_vector(38 downto 0); 
type array_of_std_logic_vector40_t is array(natural range<>) of std_logic_vector(39 downto 0); 
type array_of_std_logic_vector41_t is array(natural range<>) of std_logic_vector(40 downto 0); 
type array_of_std_logic_vector42_t is array(natural range<>) of std_logic_vector(41 downto 0); 
type array_of_std_logic_vector43_t is array(natural range<>) of std_logic_vector(42 downto 0); 
type array_of_std_logic_vector44_t is array(natural range<>) of std_logic_vector(43 downto 0); 
type array_of_std_logic_vector45_t is array(natural range<>) of std_logic_vector(44 downto 0); 
type array_of_std_logic_vector46_t is array(natural range<>) of std_logic_vector(45 downto 0); 
type array_of_std_logic_vector47_t is array(natural range<>) of std_logic_vector(46 downto 0); 
type array_of_std_logic_vector48_t is array(natural range<>) of std_logic_vector(47 downto 0); 
type array_of_std_logic_vector49_t is array(natural range<>) of std_logic_vector(48 downto 0); 
type array_of_std_logic_vector50_t is array(natural range<>) of std_logic_vector(49 downto 0); 
type array_of_std_logic_vector51_t is array(natural range<>) of std_logic_vector(50 downto 0); 
type array_of_std_logic_vector52_t is array(natural range<>) of std_logic_vector(51 downto 0); 
type array_of_std_logic_vector53_t is array(natural range<>) of std_logic_vector(52 downto 0); 
type array_of_std_logic_vector54_t is array(natural range<>) of std_logic_vector(53 downto 0); 
type array_of_std_logic_vector55_t is array(natural range<>) of std_logic_vector(54 downto 0); 
type array_of_std_logic_vector56_t is array(natural range<>) of std_logic_vector(55 downto 0); 
type array_of_std_logic_vector57_t is array(natural range<>) of std_logic_vector(56 downto 0); 
type array_of_std_logic_vector58_t is array(natural range<>) of std_logic_vector(57 downto 0); 
type array_of_std_logic_vector59_t is array(natural range<>) of std_logic_vector(58 downto 0); 
type array_of_std_logic_vector60_t is array(natural range<>) of std_logic_vector(59 downto 0); 
type array_of_std_logic_vector61_t is array(natural range<>) of std_logic_vector(60 downto 0); 
type array_of_std_logic_vector62_t is array(natural range<>) of std_logic_vector(61 downto 0); 
type array_of_std_logic_vector63_t is array(natural range<>) of std_logic_vector(62 downto 0); 
type array_of_std_logic_vector64_t is array(natural range<>) of std_logic_vector(63 downto 0); 
type array_of_std_logic_vector128_t is array(natural range<>) of std_logic_vector(127 downto 0); 
type array_of_std_logic_vector256_t is array(natural range<>) of std_logic_vector(255 downto 0); 
type array_of_std_logic_vector512_t is array(natural range<>) of std_logic_vector(511 downto 0); 
type array_of_std_logic_vector1024_t is array(natural range<>) of std_logic_vector(1023 downto 0); 
type array_of_std_logic_vector2048_t is array(natural range<>) of std_logic_vector(2047 downto 0); 


 ------------------------------------------
type array_of_signed4_t is array(natural range<>) of signed(3 downto 0); 
type array_of_signed5_t is array(natural range<>) of signed(4 downto 0); 
type array_of_signed6_t is array(natural range<>) of signed(5 downto 0); 
type array_of_signed7_t is array(natural range<>) of signed(6 downto 0); 
type array_of_signed8_t is array(natural range<>) of signed(7 downto 0); 
type array_of_signed9_t is array(natural range<>) of signed(8 downto 0); 
type array_of_signed10_t is array(natural range<>) of signed(9 downto 0); 
type array_of_signed11_t is array(natural range<>) of signed(10 downto 0); 
type array_of_signed12_t is array(natural range<>) of signed(11 downto 0); 
type array_of_signed13_t is array(natural range<>) of signed(12 downto 0); 
type array_of_signed14_t is array(natural range<>) of signed(13 downto 0); 
type array_of_signed15_t is array(natural range<>) of signed(14 downto 0); 
type array_of_signed16_t is array(natural range<>) of signed(15 downto 0); 
type array_of_signed17_t is array(natural range<>) of signed(16 downto 0); 
type array_of_signed18_t is array(natural range<>) of signed(17 downto 0); 
type array_of_signed19_t is array(natural range<>) of signed(18 downto 0); 
type array_of_signed20_t is array(natural range<>) of signed(19 downto 0); 
type array_of_signed21_t is array(natural range<>) of signed(20 downto 0); 
type array_of_signed22_t is array(natural range<>) of signed(21 downto 0); 
type array_of_signed23_t is array(natural range<>) of signed(22 downto 0); 
type array_of_signed24_t is array(natural range<>) of signed(23 downto 0); 
type array_of_signed25_t is array(natural range<>) of signed(24 downto 0); 
type array_of_signed26_t is array(natural range<>) of signed(25 downto 0); 
type array_of_signed27_t is array(natural range<>) of signed(26 downto 0); 
type array_of_signed28_t is array(natural range<>) of signed(27 downto 0); 
type array_of_signed29_t is array(natural range<>) of signed(28 downto 0); 
type array_of_signed30_t is array(natural range<>) of signed(29 downto 0); 
type array_of_signed31_t is array(natural range<>) of signed(30 downto 0); 
type array_of_signed32_t is array(natural range<>) of signed(31 downto 0); 
type array_of_signed33_t is array(natural range<>) of signed(32 downto 0); 
type array_of_signed34_t is array(natural range<>) of signed(33 downto 0); 
type array_of_signed35_t is array(natural range<>) of signed(34 downto 0); 
type array_of_signed36_t is array(natural range<>) of signed(35 downto 0); 
type array_of_signed37_t is array(natural range<>) of signed(36 downto 0); 
type array_of_signed38_t is array(natural range<>) of signed(37 downto 0); 
type array_of_signed39_t is array(natural range<>) of signed(38 downto 0); 
type array_of_signed40_t is array(natural range<>) of signed(39 downto 0); 
type array_of_signed41_t is array(natural range<>) of signed(40 downto 0); 
type array_of_signed42_t is array(natural range<>) of signed(41 downto 0); 
type array_of_signed43_t is array(natural range<>) of signed(42 downto 0); 
type array_of_signed44_t is array(natural range<>) of signed(43 downto 0); 
type array_of_signed45_t is array(natural range<>) of signed(44 downto 0); 
type array_of_signed46_t is array(natural range<>) of signed(45 downto 0); 
type array_of_signed47_t is array(natural range<>) of signed(46 downto 0); 
type array_of_signed48_t is array(natural range<>) of signed(47 downto 0); 
type array_of_signed49_t is array(natural range<>) of signed(48 downto 0); 
type array_of_signed50_t is array(natural range<>) of signed(49 downto 0); 
type array_of_signed51_t is array(natural range<>) of signed(50 downto 0); 
type array_of_signed52_t is array(natural range<>) of signed(51 downto 0); 
type array_of_signed53_t is array(natural range<>) of signed(52 downto 0); 
type array_of_signed54_t is array(natural range<>) of signed(53 downto 0); 
type array_of_signed55_t is array(natural range<>) of signed(54 downto 0); 
type array_of_signed56_t is array(natural range<>) of signed(55 downto 0); 
type array_of_signed57_t is array(natural range<>) of signed(56 downto 0); 
type array_of_signed58_t is array(natural range<>) of signed(57 downto 0); 
type array_of_signed59_t is array(natural range<>) of signed(58 downto 0); 
type array_of_signed60_t is array(natural range<>) of signed(59 downto 0); 
type array_of_signed61_t is array(natural range<>) of signed(60 downto 0); 
type array_of_signed62_t is array(natural range<>) of signed(61 downto 0); 
type array_of_signed63_t is array(natural range<>) of signed(62 downto 0); 
type array_of_signed64_t is array(natural range<>) of signed(63 downto 0); 
type array_of_signed128_t is array(natural range<>) of signed(127 downto 0); 
type array_of_signed256_t is array(natural range<>) of signed(255 downto 0); 
type array_of_signed512_t is array(natural range<>) of signed(511 downto 0); 
type array_of_signed1024_t is array(natural range<>) of signed(1023 downto 0); 
type array_of_signed2048_t is array(natural range<>) of signed(2047 downto 0); 


 ------------------------------------------
type array_of_unsigned4_t is array(natural range<>) of unsigned(3 downto 0); 
type array_of_unsigned5_t is array(natural range<>) of unsigned(4 downto 0); 
type array_of_unsigned6_t is array(natural range<>) of unsigned(5 downto 0); 
type array_of_unsigned7_t is array(natural range<>) of unsigned(6 downto 0); 
type array_of_unsigned8_t is array(natural range<>) of unsigned(7 downto 0); 
type array_of_unsigned9_t is array(natural range<>) of unsigned(8 downto 0); 
type array_of_unsigned10_t is array(natural range<>) of unsigned(9 downto 0); 
type array_of_unsigned11_t is array(natural range<>) of unsigned(10 downto 0); 
type array_of_unsigned12_t is array(natural range<>) of unsigned(11 downto 0); 
type array_of_unsigned13_t is array(natural range<>) of unsigned(12 downto 0); 
type array_of_unsigned14_t is array(natural range<>) of unsigned(13 downto 0); 
type array_of_unsigned15_t is array(natural range<>) of unsigned(14 downto 0); 
type array_of_unsigned16_t is array(natural range<>) of unsigned(15 downto 0); 
type array_of_unsigned17_t is array(natural range<>) of unsigned(16 downto 0); 
type array_of_unsigned18_t is array(natural range<>) of unsigned(17 downto 0); 
type array_of_unsigned19_t is array(natural range<>) of unsigned(18 downto 0); 
type array_of_unsigned20_t is array(natural range<>) of unsigned(19 downto 0); 
type array_of_unsigned21_t is array(natural range<>) of unsigned(20 downto 0); 
type array_of_unsigned22_t is array(natural range<>) of unsigned(21 downto 0); 
type array_of_unsigned23_t is array(natural range<>) of unsigned(22 downto 0); 
type array_of_unsigned24_t is array(natural range<>) of unsigned(23 downto 0); 
type array_of_unsigned25_t is array(natural range<>) of unsigned(24 downto 0); 
type array_of_unsigned26_t is array(natural range<>) of unsigned(25 downto 0); 
type array_of_unsigned27_t is array(natural range<>) of unsigned(26 downto 0); 
type array_of_unsigned28_t is array(natural range<>) of unsigned(27 downto 0); 
type array_of_unsigned29_t is array(natural range<>) of unsigned(28 downto 0); 
type array_of_unsigned30_t is array(natural range<>) of unsigned(29 downto 0); 
type array_of_unsigned31_t is array(natural range<>) of unsigned(30 downto 0); 
type array_of_unsigned32_t is array(natural range<>) of unsigned(31 downto 0); 
type array_of_unsigned33_t is array(natural range<>) of unsigned(32 downto 0); 
type array_of_unsigned34_t is array(natural range<>) of unsigned(33 downto 0); 
type array_of_unsigned35_t is array(natural range<>) of unsigned(34 downto 0); 
type array_of_unsigned36_t is array(natural range<>) of unsigned(35 downto 0); 
type array_of_unsigned37_t is array(natural range<>) of unsigned(36 downto 0); 
type array_of_unsigned38_t is array(natural range<>) of unsigned(37 downto 0); 
type array_of_unsigned39_t is array(natural range<>) of unsigned(38 downto 0); 
type array_of_unsigned40_t is array(natural range<>) of unsigned(39 downto 0); 
type array_of_unsigned41_t is array(natural range<>) of unsigned(40 downto 0); 
type array_of_unsigned42_t is array(natural range<>) of unsigned(41 downto 0); 
type array_of_unsigned43_t is array(natural range<>) of unsigned(42 downto 0); 
type array_of_unsigned44_t is array(natural range<>) of unsigned(43 downto 0); 
type array_of_unsigned45_t is array(natural range<>) of unsigned(44 downto 0); 
type array_of_unsigned46_t is array(natural range<>) of unsigned(45 downto 0); 
type array_of_unsigned47_t is array(natural range<>) of unsigned(46 downto 0); 
type array_of_unsigned48_t is array(natural range<>) of unsigned(47 downto 0); 
type array_of_unsigned49_t is array(natural range<>) of unsigned(48 downto 0); 
type array_of_unsigned50_t is array(natural range<>) of unsigned(49 downto 0); 
type array_of_unsigned51_t is array(natural range<>) of unsigned(50 downto 0); 
type array_of_unsigned52_t is array(natural range<>) of unsigned(51 downto 0); 
type array_of_unsigned53_t is array(natural range<>) of unsigned(52 downto 0); 
type array_of_unsigned54_t is array(natural range<>) of unsigned(53 downto 0); 
type array_of_unsigned55_t is array(natural range<>) of unsigned(54 downto 0); 
type array_of_unsigned56_t is array(natural range<>) of unsigned(55 downto 0); 
type array_of_unsigned57_t is array(natural range<>) of unsigned(56 downto 0); 
type array_of_unsigned58_t is array(natural range<>) of unsigned(57 downto 0); 
type array_of_unsigned59_t is array(natural range<>) of unsigned(58 downto 0); 
type array_of_unsigned60_t is array(natural range<>) of unsigned(59 downto 0); 
type array_of_unsigned61_t is array(natural range<>) of unsigned(60 downto 0); 
type array_of_unsigned62_t is array(natural range<>) of unsigned(61 downto 0); 
type array_of_unsigned63_t is array(natural range<>) of unsigned(62 downto 0); 
type array_of_unsigned64_t is array(natural range<>) of unsigned(63 downto 0); 
type array_of_unsigned128_t is array(natural range<>) of unsigned(127 downto 0); 
type array_of_unsigned256_t is array(natural range<>) of unsigned(255 downto 0); 
type array_of_unsigned512_t is array(natural range<>) of unsigned(511 downto 0); 
type array_of_unsigned1024_t is array(natural range<>) of unsigned(1023 downto 0); 
type array_of_unsigned2048_t is array(natural range<>) of unsigned(2047 downto 0); 


 ------------------------------------------
type array_of_complex4_t is array(natural range<>) of complex4_t; 
type array_of_complex5_t is array(natural range<>) of complex5_t; 
type array_of_complex6_t is array(natural range<>) of complex6_t; 
type array_of_complex7_t is array(natural range<>) of complex7_t; 
type array_of_complex8_t is array(natural range<>) of complex8_t; 
type array_of_complex9_t is array(natural range<>) of complex9_t; 
type array_of_complex10_t is array(natural range<>) of complex10_t; 
type array_of_complex11_t is array(natural range<>) of complex11_t; 
type array_of_complex12_t is array(natural range<>) of complex12_t; 
type array_of_complex13_t is array(natural range<>) of complex13_t; 
type array_of_complex14_t is array(natural range<>) of complex14_t; 
type array_of_complex15_t is array(natural range<>) of complex15_t; 
type array_of_complex16_t is array(natural range<>) of complex16_t; 
type array_of_complex17_t is array(natural range<>) of complex17_t; 
type array_of_complex18_t is array(natural range<>) of complex18_t; 
type array_of_complex19_t is array(natural range<>) of complex19_t; 
type array_of_complex20_t is array(natural range<>) of complex20_t; 
type array_of_complex21_t is array(natural range<>) of complex21_t; 
type array_of_complex22_t is array(natural range<>) of complex22_t; 
type array_of_complex23_t is array(natural range<>) of complex23_t; 
type array_of_complex24_t is array(natural range<>) of complex24_t; 
type array_of_complex25_t is array(natural range<>) of complex25_t; 
type array_of_complex26_t is array(natural range<>) of complex26_t; 
type array_of_complex27_t is array(natural range<>) of complex27_t; 
type array_of_complex28_t is array(natural range<>) of complex28_t; 
type array_of_complex29_t is array(natural range<>) of complex29_t; 
type array_of_complex30_t is array(natural range<>) of complex30_t; 
type array_of_complex31_t is array(natural range<>) of complex31_t; 
type array_of_complex32_t is array(natural range<>) of complex32_t; 
type array_of_complex33_t is array(natural range<>) of complex33_t; 
type array_of_complex34_t is array(natural range<>) of complex34_t; 
type array_of_complex35_t is array(natural range<>) of complex35_t; 
type array_of_complex36_t is array(natural range<>) of complex36_t; 
type array_of_complex37_t is array(natural range<>) of complex37_t; 
type array_of_complex38_t is array(natural range<>) of complex38_t; 
type array_of_complex39_t is array(natural range<>) of complex39_t; 
type array_of_complex40_t is array(natural range<>) of complex40_t; 
type array_of_complex41_t is array(natural range<>) of complex41_t; 
type array_of_complex42_t is array(natural range<>) of complex42_t; 
type array_of_complex43_t is array(natural range<>) of complex43_t; 
type array_of_complex44_t is array(natural range<>) of complex44_t; 
type array_of_complex45_t is array(natural range<>) of complex45_t; 
type array_of_complex46_t is array(natural range<>) of complex46_t; 
type array_of_complex47_t is array(natural range<>) of complex47_t; 
type array_of_complex48_t is array(natural range<>) of complex48_t; 
type array_of_complex49_t is array(natural range<>) of complex49_t; 
type array_of_complex50_t is array(natural range<>) of complex50_t; 
type array_of_complex51_t is array(natural range<>) of complex51_t; 
type array_of_complex52_t is array(natural range<>) of complex52_t; 
type array_of_complex53_t is array(natural range<>) of complex53_t; 
type array_of_complex54_t is array(natural range<>) of complex54_t; 
type array_of_complex55_t is array(natural range<>) of complex55_t; 
type array_of_complex56_t is array(natural range<>) of complex56_t; 
type array_of_complex57_t is array(natural range<>) of complex57_t; 
type array_of_complex58_t is array(natural range<>) of complex58_t; 
type array_of_complex59_t is array(natural range<>) of complex59_t; 
type array_of_complex60_t is array(natural range<>) of complex60_t; 
type array_of_complex61_t is array(natural range<>) of complex61_t; 
type array_of_complex62_t is array(natural range<>) of complex62_t; 
type array_of_complex63_t is array(natural range<>) of complex63_t; 
type array_of_complex64_t is array(natural range<>) of complex64_t; 
type array_of_complex128_t is array(natural range<>) of complex128_t; 
type array_of_complex256_t is array(natural range<>) of complex256_t; 
type array_of_complex512_t is array(natural range<>) of complex512_t; 
type array_of_complex1024_t is array(natural range<>) of complex1024_t; 
type array_of_complex2048_t is array(natural range<>) of complex2048_t; 


 end package;
