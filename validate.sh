#!/bin/bash
# validate.sh

# 1. Compile Mini-C code to MIPS assembly (adjust command based on your compiler executable)
./minic_compiler input.c -o output.s
if [ $? -ne 0 ]; then
    echo "Compilation Error: Failed to generate MIPS assembly."
    exit 1
fi

# 2. Run the assembly output through MARS 4.5 in headless mode
# 'nc' flag runs it without copyright notice or graphical UI
java -jar Mars4_5.jar nc output.s > /dev/null 2>&1

# 3. Check MARS exit status
if [ $? -eq 0 ]; then
    echo "MARS Simulation Passed"
else
    echo "MARS Simulation Failed"
    exit 1
fi
