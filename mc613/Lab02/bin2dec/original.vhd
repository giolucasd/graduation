Library IEEE;
use IEEE.std_logic_1164.all;
Entity original IS
	Port (a, b, c, d, e : IN std_logic;
		f : OUT std_logic);
	End original;
Architecture estrutural OF original IS
signal m0, m2, m5, m8, m13, m15, m18, m21, m24, m29, m31: std_logic;
Begin
	m0 <= not(a) and not(b)	and not(c) and not(d) and not(e);
	m2 <= not(a) and not(b)	and not(c) and d and not(e);
	m5 <= not(a) and not(b)	and c and not(d) and e;
	m8 <= not(a) and b	and not(c) and not(d) and not(e);
	m13 <= not(a) and b	and c and not(d) and e;
	m15 <= not(a) and b	and c and d and e;
	m18 <= a and not(b)	and not(c) and d and not(e);
	m21 <= a and not(b)	and c and not(d) and e;
	m24 <= a and b	and not(c) and not(d) and not(e);
	m29 <= a and b	and c and not(d) and e;
	m31 <= a and b	and c and d and e;
	f <= m0 or m2 or m5 or m8 or m13 or m15 or  m18 or m21 or m24 or m29 or m31; 
End estrutural;