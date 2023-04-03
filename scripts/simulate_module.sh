
module_name=$1
do_file_name="doFiles/sim_${module_name}.do"

# Check if module exists
if [ ! -f "src/${module_name}.sv" ]; then
    echo "File src/${module_name}.sv does not exist!"
    exit 1
fi

# Check if do_file_name exists as a file
if [ ! -f $do_file_name ]; then
    echo "vlib work" > "$do_file_name"
    echo "vlog \"./src/${module_name}.sv\"" >> "$do_file_name"
    echo "vsim -voptargs=\"+acc\" -t 1ps -lib work ${module_name}_testbench" >> "$do_file_name"
    echo "do doFiles/${module_name}_wave.do" >> "$do_file_name"
    echo "view wave" >> "$do_file_name"
    echo "view structure" >> "$do_file_name"
    echo "view signals" >> "$do_file_name"
    echo "run -all" >> "$do_file_name"
fi

/mnt/c/intelFPGA_lite/17.0/modelsim_ase/win32aloem/modelsim.exe -do "$do_file_name"