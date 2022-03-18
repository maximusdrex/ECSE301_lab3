
-- 
-- Definition of  ControlLogic
-- 
--      Wed Mar  2 16:57:32 2022
--      
--      LeonardoSpectrum Level 3, 2009a.6
-- 

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity fake_gnd is
   port (
      Y : OUT std_logic) ;
end fake_gnd ;

architecture NETLIST of fake_gnd is
begin
   Y <= '0' ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity fake_vcc is
   port (
      Y : OUT std_logic) ;
end fake_vcc ;

architecture NETLIST of fake_vcc is
begin
   Y <= '1' ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity latch is
   port (
      Q : OUT std_logic ;
      D : IN std_logic ;
      CLK : IN std_logic) ;
end latch ;

architecture NETLIST of latch is
   procedure DLATCHPC (
      constant data  : in std_logic;
      constant preset : in std_logic;
      constant clear  : in std_logic;
      constant gate   : in std_logic;
      signal q        : out std_logic)
   is begin
       assert (gate /= 'Z')
           report "On dlatchpc : Found high-Z ('Z') on enable gate"
           severity error ;
   
       if (preset = '1') then
           q <= '1' ;
       elsif (clear = '1') then
           q <= '0' ;
       elsif (gate = '1') then
           q <= data ;
       end if;
       if ((preset/='1' or clear/='1') and gate/='0' and gate/='1') then
           q <= 'X' ;
       end if ;
   end DLATCHPC ;
   signal nx2, nx4: std_logic ;

begin
   DLATCHPC (D,nx4,nx2,CLK,Q) ;
   nx2 <= '0' ;
   nx4 <= '0' ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity or02 is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic) ;
end or02 ;

architecture NETLIST of or02 is
begin
   Y <= A1 OR A0 ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity nand03 is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic ;
      A2 : IN std_logic) ;
end nand03 ;

architecture NETLIST of nand03 is
   signal NOT_A2, NOT_A1, nx4, NOT_A0: std_logic ;

begin
   NOT_A2 <= NOT A2 ;
   NOT_A1 <= NOT A1 ;
   nx4 <= NOT_A2 OR NOT_A1 ;
   NOT_A0 <= NOT A0 ;
   Y <= nx4 OR NOT_A0 ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity oai21 is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic ;
      B0 : IN std_logic) ;
end oai21 ;

architecture NETLIST of oai21 is
   signal NOT_A0, NOT_A1, nx4, NOT_B0: std_logic ;

begin
   NOT_A0 <= NOT A0 ;
   NOT_A1 <= NOT A1 ;
   nx4 <= NOT_A0 AND NOT_A1 ;
   NOT_B0 <= NOT B0 ;
   Y <= nx4 OR NOT_B0 ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity inv02 is
   port (
      Y : OUT std_logic ;
      A : IN std_logic) ;
end inv02 ;

architecture NETLIST of inv02 is
begin
   Y <= NOT A ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity dff is
   port (
      Q : OUT std_logic ;
      QB : OUT std_logic ;
      D : IN std_logic ;
      CLK : IN std_logic) ;
end dff ;

architecture NETLIST of dff is
   procedure DFFPC (
      constant data   : in std_logic;
      constant preset : in std_logic;
      constant clear  : in std_logic;
      signal clk      : in std_logic;
      signal q        : out std_logic)
   is begin
       if (preset = '1') then
           q <= '1' ;
       elsif (clear = '1') then
           q <= '0' ;
       elsif (clk'event and clk'last_value = '0' and clk = '1') then
           q <= data and data ;    -- takes care of q<='X' if data='Z'
       end if ;
       if ((clear/='1' or preset/='1') and clk/='0' and clk/='1') then
           q <= 'X' ;
       end if ;
   end DFFPC ;
   signal \[869_\, nx2, nx4: std_logic ;

begin
   Q <= \[869_\ ;
   DFFPC (D,nx4,nx2,CLK,\[869_\) ;
   nx2 <= '0' ;
   nx4 <= '0' ;
   QB <= NOT \[869_\ ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity nor04 is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic ;
      A2 : IN std_logic ;
      A3 : IN std_logic) ;
end nor04 ;

architecture NETLIST of nor04 is
   signal NOT_A0, NOT_A1, nx4, NOT_A2, nx8, NOT_A3: std_logic ;

begin
   NOT_A0 <= NOT A0 ;
   NOT_A1 <= NOT A1 ;
   nx4 <= NOT_A0 AND NOT_A1 ;
   NOT_A2 <= NOT A2 ;
   nx8 <= nx4 AND NOT_A2 ;
   NOT_A3 <= NOT A3 ;
   Y <= nx8 AND NOT_A3 ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity xnor2 is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic) ;
end xnor2 ;

architecture NETLIST of xnor2 is
begin
   Y <= NOT (A0 XOR A1) ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity nand02_2x is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic) ;
end nand02_2x ;

architecture NETLIST of nand02_2x is
   signal NOT_A1, NOT_A0: std_logic ;

begin
   NOT_A1 <= NOT A1 ;
   NOT_A0 <= NOT A0 ;
   Y <= NOT_A1 OR NOT_A0 ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity aoi21 is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic ;
      B0 : IN std_logic) ;
end aoi21 ;

architecture NETLIST of aoi21 is
   signal NOT_A1, NOT_B0, nx4, NOT_A0, nx8: std_logic ;

begin
   NOT_A1 <= NOT A1 ;
   NOT_B0 <= NOT B0 ;
   nx4 <= NOT_A1 AND NOT_B0 ;
   NOT_A0 <= NOT A0 ;
   nx8 <= NOT_A0 AND NOT_B0 ;
   Y <= nx4 OR nx8 ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity buf08 is
   port (
      Y : OUT std_logic ;
      A : IN std_logic) ;
end buf08 ;

architecture NETLIST of buf08 is
begin
   Y <= A ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity inv08 is
   port (
      Y : OUT std_logic ;
      A : IN std_logic) ;
end inv08 ;

architecture NETLIST of inv08 is
begin
   Y <= NOT A ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity nor02ii is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic) ;
end nor02ii ;

architecture NETLIST of nor02ii is
   signal NOT_A0: std_logic ;

begin
   NOT_A0 <= NOT A0 ;
   Y <= NOT_A0 AND A1 ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity latchr is
   port (
      QB : OUT std_logic ;
      D : IN std_logic ;
      CLK : IN std_logic ;
      R : IN std_logic) ;
end latchr ;

architecture NETLIST of latchr is
   procedure DLATCHPC (
      constant data  : in std_logic;
      constant preset : in std_logic;
      constant clear  : in std_logic;
      constant gate   : in std_logic;
      signal q        : out std_logic)
   is begin
       assert (gate /= 'Z')
           report "On dlatchpc : Found high-Z ('Z') on enable gate"
           severity error ;
   
       if (preset = '1') then
           q <= '1' ;
       elsif (clear = '1') then
           q <= '0' ;
       elsif (gate = '1') then
           q <= data ;
       end if;
       if ((preset/='1' or clear/='1') and gate/='0' and gate/='1') then
           q <= 'X' ;
       end if ;
   end DLATCHPC ;
   signal IQ0, nx2: std_logic ;

begin
   DLATCHPC (D,nx2,R,CLK,IQ0) ;
   nx2 <= '0' ;
   QB <= NOT IQ0 ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity inv01 is
   port (
      Y : OUT std_logic ;
      A : IN std_logic) ;
end inv01 ;

architecture NETLIST of inv01 is
begin
   Y <= NOT A ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity buf02 is
   port (
      Y : OUT std_logic ;
      A : IN std_logic) ;
end buf02 ;

architecture NETLIST of buf02 is
begin
   Y <= A ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity nor03 is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic ;
      A2 : IN std_logic) ;
end nor03 ;

architecture NETLIST of nor03 is
   signal NOT_A0, NOT_A1, nx4, NOT_A2: std_logic ;

begin
   NOT_A0 <= NOT A0 ;
   NOT_A1 <= NOT A1 ;
   nx4 <= NOT_A0 AND NOT_A1 ;
   NOT_A2 <= NOT A2 ;
   Y <= nx4 AND NOT_A2 ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity nor02_2x is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic) ;
end nor02_2x ;

architecture NETLIST of nor02_2x is
   signal NOT_A0, NOT_A1: std_logic ;

begin
   NOT_A0 <= NOT A0 ;
   NOT_A1 <= NOT A1 ;
   Y <= NOT_A0 AND NOT_A1 ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ao21 is
   port (
      Y : OUT std_logic ;
      A0 : IN std_logic ;
      A1 : IN std_logic ;
      B0 : IN std_logic) ;
end ao21 ;

architecture NETLIST of ao21 is
   signal nx0: std_logic ;

begin
   nx0 <= A0 AND A1 ;
   Y <= nx0 OR B0 ;
end NETLIST ;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ControlLogic is
   port (
      Q_in : IN std_logic_vector (1 DOWNTO 0) ;
      clock : IN std_logic ;
      start : IN std_logic ;
      Q_sig : OUT std_logic_vector (1 DOWNTO 0) ;
      A_sig : OUT std_logic_vector (1 DOWNTO 0) ;
      done_sig : OUT std_logic ;
      M_sig : OUT std_logic ;
      adder_sig : OUT std_logic) ;
end ControlLogic ;

architecture INTERFACE of ControlLogic is
   signal nx341, PRES_STATE_0, NEXT_STATE_0, NEXT_STATE_2, PRES_STATE_1, 
      NEXT_STATE_1, nx353, nx2, nx18, nx22, nx30, nx40, count_0, nx355, 
      NOT_PRES_STATE_0, nx50, nx60, count_2, nx356, count_1, nx88, nx110, 
      nx124, nx138, nx146, NOT_nx60, nx190, nx365, nx367, nx369, nx379, 
      nx382, nx388, nx397, nx399, nx403, nx405, nx407, nx409, nx429, nx433, 
      nx435, nx437, nx5, nx448, nx450, nx508, nx510: std_logic ;

begin
   ix342 : fake_gnd port map ( Y=>nx341);
   ix340 : fake_vcc port map ( Y=>done_sig);
   lat_adder : latch port map ( Q=>adder_sig, D=>PRES_STATE_1, CLK=>nx2);
   ix31 : or02 port map ( Y=>nx30, A0=>NEXT_STATE_1, A1=>start);
   lat_NEXT_STATE_1 : latch port map ( Q=>NEXT_STATE_1, D=>nx18, CLK=>nx433
   );
   ix19 : nand03 port map ( Y=>nx18, A0=>nx365, A1=>nx407, A2=>nx409);
   ix366 : oai21 port map ( Y=>nx365, A0=>Q_in(1), A1=>nx367, B0=>nx369);
   ix368 : inv02 port map ( Y=>nx367, A=>Q_in(0));
   ix125 : or02 port map ( Y=>nx124, A0=>NEXT_STATE_2, A1=>start);
   lat_NEXT_STATE_2 : latch port map ( Q=>NEXT_STATE_2, D=>nx353, CLK=>nx433
   );
   reg_PRES_STATE_0 : dff port map ( Q=>PRES_STATE_0, QB=>NOT_PRES_STATE_0, 
      D=>nx146, CLK=>clock);
   ix147 : or02 port map ( Y=>nx146, A0=>NEXT_STATE_0, A1=>start);
   lat_NEXT_STATE_0 : latch port map ( Q=>NEXT_STATE_0, D=>nx138, CLK=>nx433
   );
   ix139 : nor04 port map ( Y=>nx138, A0=>PRES_STATE_1, A1=>nx510, A2=>
      PRES_STATE_0, A3=>nx379);
   ix380 : xnor2 port map ( Y=>nx379, A0=>Q_in(1), A1=>Q_in(0));
   reg_PRES_STATE_1 : dff port map ( Q=>PRES_STATE_1, QB=>nx382, D=>nx30, 
      CLK=>clock);
   ix111 : nor04 port map ( Y=>nx110, A0=>nx510, A1=>nx388, A2=>count_2, A3
      =>count_1);
   ix61 : oai21 port map ( Y=>nx60, A0=>nx510, A1=>nx40, B0=>nx50);
   lat_count_2 : latch port map ( Q=>count_2, D=>nx356, CLK=>nx437);
   ix101 : nand02_2x port map ( Y=>nx356, A0=>nx397, A1=>nx450);
   ix398 : xnor2 port map ( Y=>nx397, A0=>count_2, A1=>nx448);
   lat_count_1 : latch port map ( Q=>count_1, D=>nx88, CLK=>nx437);
   ix404 : aoi21 port map ( Y=>nx403, A0=>count_1, A1=>count_0, B0=>nx448);
   reg_PRES_STATE_2 : dff port map ( Q=>OPEN, QB=>nx405, D=>nx124, CLK=>
      clock);
   lat_M_out : latch port map ( Q=>M_sig, D=>PRES_STATE_0, CLK=>nx433);
   lat_A_out_0 : latch port map ( Q=>A_sig(0), D=>nx190, CLK=>nx433);
   lat_A_out_1 : latch port map ( Q=>A_sig(1), D=>NOT_PRES_STATE_0, CLK=>
      nx433);
   lat_Q_out_0 : latch port map ( Q=>Q_sig(0), D=>NOT_nx60, CLK=>nx22);
   lat_Q_out_1 : latch port map ( Q=>Q_sig(1), D=>nx50, CLK=>nx22);
   ix420 : inv02 port map ( Y=>NOT_nx60, A=>nx60);
   ix3 : inv02 port map ( Y=>nx2, A=>nx407);
   ix117 : inv02 port map ( Y=>nx353, A=>nx409);
   ix428 : inv02 port map ( Y=>nx429, A=>nx405);
   ix434 : buf08 port map ( Y=>nx435, A=>nx355);
   ix436 : inv08 port map ( Y=>nx437, A=>NOT_nx60);
   ix400 : nor02ii port map ( Y=>nx399, A0=>count_1, A1=>nx388);
   lat_count_0_u1 : latchr port map ( QB=>nx5, D=>nx435, CLK=>nx437, R=>
      nx341);
   lat_count_0_u2 : inv01 port map ( Y=>count_0, A=>nx5);
   lat_count_0_u3 : buf02 port map ( Y=>nx388, A=>nx5);
   ix447 : buf02 port map ( Y=>nx448, A=>nx399);
   ix449 : inv02 port map ( Y=>nx450, A=>nx510);
   ix408 : or02 port map ( Y=>nx407, A0=>nx510, A1=>NOT_PRES_STATE_0);
   ix370 : nor03 port map ( Y=>nx369, A0=>PRES_STATE_1, A1=>nx510, A2=>
      PRES_STATE_0);
   ix23 : nand02_2x port map ( Y=>nx22, A0=>nx382, A1=>nx510);
   ix73 : nor02ii port map ( Y=>nx355, A0=>nx429, A1=>nx388);
   ix41 : nand02_2x port map ( Y=>nx40, A0=>NOT_PRES_STATE_0, A1=>
      PRES_STATE_1);
   ix51 : nand03 port map ( Y=>nx50, A0=>PRES_STATE_1, A1=>nx429, A2=>
      PRES_STATE_0);
   ix89 : nor02_2x port map ( Y=>nx88, A0=>nx403, A1=>nx429);
   ix410 : oai21 port map ( Y=>nx409, A0=>nx110, A1=>nx429, B0=>nx508);
   ix507 : inv02 port map ( Y=>nx508, A=>nx40);
   ix191 : ao21 port map ( Y=>nx190, A0=>nx429, A1=>PRES_STATE_1, B0=>nx369
   );
   ix432 : nand02_2x port map ( Y=>nx433, A0=>nx382, A1=>nx429);
   ix509 : inv02 port map ( Y=>nx510, A=>nx405);
end INTERFACE ;

