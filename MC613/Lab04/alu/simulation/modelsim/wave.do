view wave 
wave clipboard store
wave create -driver freeze -pattern counter -startvalue 0000 -endvalue 1111 -type Range -direction Up -period 100ps -step 1 -repeat 10 -range 3 0 -starttime 0ps -endtime 1000ps sim:/alu/a 
WaveExpandAll -1
wave create -driver freeze -pattern counter -startvalue 0000 -endvalue 1111 -type Range -direction Up -period 100ps -step 1 -repeat forever -range 3 0 -starttime 0ps -endtime 1000ps sim:/alu/b 
WaveExpandAll -1
wave modify -driver freeze -pattern counter -startvalue 0000 -endvalue 1111 -type Range -direction Up -period 800ps -step 1 -repeat forever -range 3 0 -starttime 0ps -endtime 1600ps Edit:/alu/a 
wave modify -driver freeze -pattern counter -startvalue 0000 -endvalue 1111 -type Range -direction Up -period 200ps -step 1 -repeat forever -range 3 0 -starttime 0ps -endtime 1600ps Edit:/alu/a 
wave modify -driver freeze -pattern counter -startvalue 0000 -endvalue 1111 -type Range -direction Up -period 100ps -step 1 -repeat forever -range 3 0 -starttime 0ps -endtime 1600ps Edit:/alu/b 
wave modify -driver freeze -pattern counter -startvalue 0000 -endvalue 1111 -type Range -direction Up -period 800ps -step 1 -repeat forever -range 3 0 -starttime 0ps -endtime 1600ps Edit:/alu/a 
wave modify -driver freeze -pattern counter -startvalue 0111 -endvalue 1111 -type Range -direction Up -period 800ps -step 1 -repeat forever -range 3 0 -starttime 0ps -endtime 1600ps Edit:/alu/a 
wave modify -driver freeze -pattern counter -startvalue 0111 -endvalue 1111 -type Range -direction Up -period 800ps -step 1 -repeat forever -range 3 0 -starttime 1600ps -endtime 3200ps Edit:/alu/a 
wave modify -driver freeze -pattern counter -startvalue 0111 -endvalue 1111 -type Range -direction Up -period 800ps -step 1 -repeat forever -range 3 0 -starttime 3200ps -endtime 4800ps Edit:/alu/a 
wave modify -driver freeze -pattern counter -startvalue 0111 -endvalue 1111 -type Range -direction Up -period 800ps -step 1 -repeat forever -range 3 0 -starttime 4800ps -endtime 6400ps Edit:/alu/a 
wave modify -driver freeze -pattern counter -startvalue 0000 -endvalue 1111 -type Range -direction Up -period 100ps -step 1 -repeat forever -range 3 0 -starttime 1600ps -endtime 6400ps Edit:/alu/b 
wave create -driver freeze -pattern clock -initialvalue 0 -period 1600ps -dutycycle 50 -starttime 0ps -endtime 6400ps sim:/alu/s0 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 3200ps -dutycycle 50 -starttime 0ps -endtime 6400ps Edit:/alu/s0 
wave create -driver freeze -pattern clock -initialvalue 0 -period 3200ps -dutycycle 50 -starttime 0ps -endtime 6400ps sim:/alu/s1 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 6400ps -dutycycle 50 -starttime 0ps -endtime 6400ps Edit:/alu/s0 
WaveCollapseAll -1
wave clipboard restore
