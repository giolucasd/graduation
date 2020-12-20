view wave 
wave clipboard store
wave create -driver freeze -pattern counter -startvalue 00001111 -endvalue 11111111 -type Range -direction Up -period 1000ps -step 1111 -repeat forever -range 7 0 -starttime 0ps -endtime 1600ps sim:/cla_8bits/x 
WaveExpandAll -1
wave modify -driver freeze -pattern counter -startvalue 00001111 -endvalue 11111111 -type Range -direction Up -period 1000ps -step 1 -repeat forever -range 7 0 -starttime 0ps -endtime 1600ps Edit:/cla_8bits/x 
wave modify -driver freeze -pattern counter -startvalue 00001111 -endvalue 11111111 -type Range -direction Up -period 100ps -step 1111 -repeat forever -range 7 0 -starttime 0ps -endtime 1600ps Edit:/cla_8bits/x 
wave modify -driver freeze -pattern counter -startvalue 00001111 -endvalue 11111111 -type Range -direction Up -period 100ps -step 1 -repeat forever -range 7 0 -starttime 0ps -endtime 1600ps Edit:/cla_8bits/x 
wave modify -driver freeze -pattern counter -startvalue 00001111 -endvalue 11111111 -type Range -direction Up -period 100ps -step 11 -repeat forever -range 7 0 -starttime 0ps -endtime 1600ps Edit:/cla_8bits/x 
wave modify -driver freeze -pattern counter -startvalue 00001111 -endvalue 11111111 -type Range -direction Up -period 100ps -step 111 -repeat forever -range 7 0 -starttime 0ps -endtime 1600ps Edit:/cla_8bits/x 
wave modify -driver freeze -pattern counter -startvalue 00000000 -endvalue 11111111 -type Range -direction Up -period 100ps -step 111 -repeat forever -range 7 0 -starttime 0ps -endtime 1600ps Edit:/cla_8bits/x 
wave modify -driver freeze -pattern counter -startvalue 00000000 -endvalue 11111111 -type Range -direction Up -period 100ps -step 11 -repeat forever -range 7 0 -starttime 0ps -endtime 1600ps Edit:/cla_8bits/x 
wave create -driver freeze -pattern counter -startvalue 00000000 -endvalue 11111111 -type Range -direction Up -period 100ps -step 11 -repeat forever -range 7 0 -starttime 0ps -endtime 1600ps sim:/cla_8bits/y 
WaveExpandAll -1
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1600ps sim:/cla_8bits/cin 
WaveCollapseAll -1
wave clipboard restore
