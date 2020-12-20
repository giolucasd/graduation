view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/ram/Clock 
wave create -driver freeze -pattern random -initialvalue UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU -period 50ps -random_type Uniform -seed 5 -range 31 0 -starttime 0ps -endtime 1000ps sim:/ram/DataIn 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 1000ps sim:/ram/WrEn 
wave modify -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 500ps Edit:/ram/WrEn 
wave create -driver freeze -pattern random -initialvalue UUUUUUUUUU -period 100ps -random_type Uniform -seed 5 -range 9 0 -starttime 0ps -endtime 1000ps sim:/ram/Address 
WaveExpandAll -1
wave modify -driver freeze -pattern random -initialvalue 0000000000 -period 100ps -random_type Uniform -seed 5 -range 9 0 -starttime 0ps -endtime 1000ps Edit:/ram/Address 
wave modify -driver freeze -pattern constant -value 0000000000 -range 9 0 -starttime 0ps -endtime 1000ps Edit:/ram/Address 
wave modify -driver freeze -pattern constant -value 0000000001 -range 9 0 -starttime 250ps -endtime 500ps Edit:/ram/Address 
wave modify -driver freeze -pattern constant -value 0000000001 -range 9 0 -starttime 750ps -endtime 1000ps Edit:/ram/Address 
wave modify -driver freeze -pattern counter -startvalue 00000000000000000000000000000000 -endvalue 11111111111111111111111111111111 -type Range -direction Up -period 100ps -step 1 -repeat forever -range 31 0 -starttime 0ps -endtime 1000ps Edit:/ram/DataIn 
wave modify -driver freeze -pattern constant -value 1111111111 -range 9 0 -starttime 0ps -endtime 1000ps Edit:/ram/Address 
wave modify -driver freeze -pattern constant -value 0011111111 -range 9 0 -starttime 0ps -endtime 1000ps Edit:/ram/Address 
wave modify -driver freeze -pattern constant -value 0100000000 -range 9 0 -starttime 0ps -endtime 1000ps Edit:/ram/Address 
wave modify -driver freeze -pattern constant -value 0011111111 -range 9 0 -starttime 0ps -endtime 1000ps Edit:/ram/Address 
WaveCollapseAll -1
wave clipboard restore
