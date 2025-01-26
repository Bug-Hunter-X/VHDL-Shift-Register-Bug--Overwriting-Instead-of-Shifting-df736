```vhdl
ENTITY shift_register IS
    GENERIC (n : INTEGER := 8);
    PORT (clk, rst : IN BIT;
          data_in : IN BIT;
          data_out : OUT BIT_VECTOR(n-1 DOWNTO 0));
END ENTITY;

ARCHITECTURE behavioral OF shift_register IS
    SIGNAL shift_reg : BIT_VECTOR(n-1 DOWNTO 0) := (OTHERS => '0');
BEGIN
    PROCESS (clk, rst)
    BEGIN
        IF rst = '1' THEN
            shift_reg <= (OTHERS => '0');
        ELSIF rising_edge(clk) THEN
            shift_reg <= shift_reg(n-2 DOWNTO 0) & data_in;
        END IF;
    END PROCESS;
    data_out <= shift_reg;
END ARCHITECTURE;
```