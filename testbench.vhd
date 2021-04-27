-- Code your testbench here
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_signed.ALL;

entity testbench is
    
end testbench;



architecture tb of testbench is
    component booth_multiplier is
    PORT(m : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	     r : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	     result : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
    end component;
    
   signal m_tb, r_tb : STD_LOGIC_VECTOR(3 DOWNTO 0);
   signal res_tb : std_logic_vector(7 downto 0);
   
   begin
    DUT: booth_multiplier port map(m_tb, r_tb, res_tb);

    process
    begin
        m_tb <= "0101";
        r_tb <= "0100";
        wait for 10ns;
        assert(res_tb="00110000") report "Fail 0/0" severity error; 

        m_tb <= "0000";
        r_tb <= "0000";

        assert false report "Test done." severity note;
        wait;
    end process;
end tb;
    
    