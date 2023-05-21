library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package axi_lite_pack is
    type AXIL_MASTER_TYPE is record
        -- write data port
        WDATA: std_logic_vector(31 downto 0);
        WSTRB: std_logic_vector(3 downto 0);
        WVALID:std_logic;
        
        --write address port
        AWADDR: std_logic_vector(31 downto 0);
        AWVALID: std_logic;
        
        -- read data port
        RREADY: std_logic;

        -- read address port
        ARADDR: std_logic_vector(31 downto 0);
        ARVALID: std_logic;
        -- response port
        BREADY: std_logic;
    end record;

    type AXIL_SLAVE_TYPE is record
        -- write data port
        WREADY: std_logic;

        -- write address
        AWREADY: std_logic;

        -- read data port
        RDATA: std_logic_vector(31 downto 0);
        RVALID: std_logic;
        RRESP: std_logic_vector(1 downto 0);
        -- read address
        ARREADY: std_logic;

        -- response port
        BRESP: std_logic_vector(1 downto 0);
        BVALID: std_logic;
    end record;

    function apply_strobe(strobe: std_logic_vector(3 downto 0);
                          data_new: std_logic_vector(31 downto 0);
                          data_old: std_logic_vector(31 downto 0))
                        return std_logic_vector;
end package;

package body axi_lite_pack is
    function apply_strobe(strobe: std_logic_vector(3 downto 0);
                          data_new: std_logic_vector(31 downto 0);
                          data_old: std_logic_vector(31 downto 0))
                        return std_logic_vector
    is
        variable tmp: std_logic_vector(31 downto 0);
    begin
        tmp := data_old;
        if strobe(0)='1' then tmp(7   downto 0)  := data_new(7 downto 0);  end if;
        if strobe(1)='1' then tmp(15  downto 8)  := data_new(15 downto 8);  end if;
        if strobe(2)='1' then tmp(23  downto 16) := data_new(23 downto 16);  end if;
        if strobe(3)='1' then tmp(31  downto 24) := data_new(31 downto 24);  end if;
        
        return tmp;
    end function;

end axi_lite_pack;
