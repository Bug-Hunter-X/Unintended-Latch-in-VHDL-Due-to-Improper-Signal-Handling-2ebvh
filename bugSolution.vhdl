```vhdl
ENTITY example IS
    PORT (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        valid : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE behavioral OF example IS
    SIGNAL internal_data : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
    SIGNAL valid_int : STD_LOGIC := '0'; -- Internal signal to control valid
BEGIN
    PROCESS (clk, reset)
    BEGIN
        IF reset = '1' THEN
            internal_data <= "00000000";
            valid_int <= '0';
        ELSIF rising_edge(clk) THEN
            internal_data <= data_in;
            valid_int <= '1';
        ELSE
            valid_int <= '0'; -- added this line to prevent inferring latch
        END IF;
    END PROCESS;

    data_out <= internal_data;
    valid <= valid_int; -- assign the internal signal to the output
END ARCHITECTURE;
```