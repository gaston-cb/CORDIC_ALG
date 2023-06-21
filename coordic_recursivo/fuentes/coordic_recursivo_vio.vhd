library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vio_cordic is
    port (
        clk_in : in std_logic ;    
        rst_in : in std_logic 
    );
end vio_cordic;

architecture vio_cordic_arq of vio_cordic is
	constant Nb: integer:=18 ; 
	component coordic_recursivo IS
		generic(
			N:natural:=18 
		); 
		port (
			clk_in : in std_logic;
			rst_in : in std_logic;
			x0:in std_logic_vector (N-1 downto 0) ; 
			y0:in std_logic_vector (N-1 downto 0) ; 
			z0:in std_logic_vector (N-1 downto 0)  ; 
			xN:out std_logic_vector(N-1 downto 0)  ; 
			yN:out std_logic_vector(N-1 downto 0)  ; 
			zN:out std_logic_vector(N-1 downto 0)   
		);
	end component;
  
	COMPONENT vio_0
	  PORT (
		clk : IN STD_LOGIC;
		probe_in0 : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		probe_in1 : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		probe_in2 : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
		probe_out0 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
		probe_out1 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
		probe_out2 : OUT STD_LOGIC_VECTOR(17 DOWNTO 0) 
	  );
    END COMPONENT;
	signal x0: std_logic_vector (17 downto 0) ; 
    signal y0: std_logic_vector (17 downto 0) ; 
    signal z0: std_logic_vector (17 downto 0)  ; 
    signal xN: std_logic_vector (17 downto 0)  ; 
    signal yN: std_logic_vector (17 downto 0)  ; 
    signal zN: std_logic_vector (17 downto 0)   ; 


begin
	
	inst_vio0 : vio_0
	  PORT MAP (
		clk => clk_in,
		probe_in0  => xN,
		probe_in1  => yN,
		probe_in2  => zN,
		probe_out0 => x0,
		probe_out1 => y0,
		probe_out2 => z0
	  );
	coor_inst: coordic_recursivo
		generic map(
			N => Nb 
		) 
		port map(
			clk_in =>clk_in ,
			rst_in =>  rst_in, 
			x0 => x0,
			y0 => y0,
			z0 => z0,
			xN => xN,
			yN => yN,
			zN => zN
		);
	
	
	
end architecture;