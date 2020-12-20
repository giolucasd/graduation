view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 800ps sim:/mux4_to_1/d0 
wave create -driver freeze -pattern clock -initialvalue 0 -period 200ps -dutycycle 50 -starttime 0ps -endtime 800ps sim:/mux4_to_1/d1 
wave create -driver freeze -pattern clock -initialvalue 0 -period 400ps -dutycycle 50 -starttime 0ps -endtime 800ps sim:/mux4_to_1/d2 
wave create -driver freeze -pattern clock -initialvalue 0 -period 800ps -dutycycle 50 -starttime 0ps -endtime 800ps sim:/mux4_to_1/d3 
wave create -driver freeze -pattern constant -value 00 -range 1 0 -starttime 0ps -endtime 100ps sim:/mux4_to_1/sel 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 01 -range 1 0 -starttime 100ps -endtime 200ps Edit:/mux4_to_1/sel 
wave modify -driver freeze -pattern constant -value 10 -range 1 0 -starttime 200ps -endtime 300ps Edit:/mux4_to_1/sel 
wave modify -driver freeze -pattern constant -value 11 -range 1 0 -starttime 300ps -endtime 400ps Edit:/mux4_to_1/sel 
wave modify -driver freeze -pattern constant -value 00 -range 1 0 -starttime 400ps -endtime 500ps Edit:/mux4_to_1/sel 
wave modify -driver freeze -pattern constant -value 01 -range 1 0 -starttime 500ps -endtime 600ps Edit:/mux4_to_1/sel 
wave modify -driver freeze -pattern constant -value 10 -range 1 0 -starttime 600ps -endtime 700ps Edit:/mux4_to_1/sel 
wave modify -driver freeze -pattern constant -value 11 -range 1 0 -starttime 700ps -endtime 800ps Edit:/mux4_to_1/sel 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 800ps Edit:/mux4_to_1/d1 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 800ps Edit:/mux4_to_1/d2 
wave modify -driver freeze -pattern clock -initialvalue 1 -period 100ps -dutycycle 50 -starttime 0ps -endtime 800ps Edit:/mux4_to_1/d3 
wave modify -driver freeze -pattern clock -initialvalue 1 -period 100ps -dutycycle 50 -starttime 0ps -endtime 800ps Edit:/mux4_to_1/d2 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 800ps -dutycycle 50 -starttime 0ps -endtime 800ps Edit:/mux4_to_1/d1 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 800ps -dutycycle 50 -starttime 0ps -endtime 800ps Edit:/mux4_to_1/d2 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 800ps -dutycycle 50 -starttime 0ps -endtime 800ps Edit:/mux4_to_1/d3 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 1600ps -dutycycle 50 -starttime 0ps -endtime 800ps Edit:/mux4_to_1/d3 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 1600ps -dutycycle 50 -starttime 0ps -endtime 800ps Edit:/mux4_to_1/d2 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 1600ps -dutycycle 50 -starttime 0ps -endtime 800ps Edit:/mux4_to_1/d1 
wave modify -driver freeze -pattern clock -initialvalue 1 -period 1600ps -dutycycle 50 -starttime 0ps -endtime 800ps Edit:/mux4_to_1/d0 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 1600ps -dutycycle 50 -starttime 0ps -endtime 800ps Edit:/mux4_to_1/d0 
wave modify -driver freeze -pattern clock -initialvalue 1 -period 1600ps -dutycycle 50 -starttime 0ps -endtime 800ps Edit:/mux4_to_1/d1 
wave modify -driver freeze -pattern clock -initialvalue 1 -period 1600ps -dutycycle 50 -starttime 0ps -endtime 800ps Edit:/mux4_to_1/d2 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 1600ps -dutycycle 50 -starttime 0ps -endtime 800ps Edit:/mux4_to_1/d1 
wave modify -driver freeze -pattern clock -initialvalue 1 -period 1600ps -dutycycle 50 -starttime 0ps -endtime 800ps Edit:/mux4_to_1/d3 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 1600ps -dutycycle 50 -starttime 0ps -endtime 800ps Edit:/mux4_to_1/d2 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 1600ps -dutycycle 50 -starttime 0ps -endtime 800ps Edit:/mux4_to_1/d3 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 800ps Edit:/mux4_to_1/d0 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 200ps -dutycycle 50 -starttime 0ps -endtime 800ps Edit:/mux4_to_1/d1 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 400ps -dutycycle 50 -starttime 0ps -endtime 800ps Edit:/mux4_to_1/d2 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 800ps -dutycycle 50 -starttime 0ps -endtime 800ps Edit:/mux4_to_1/d3 
WaveCollapseAll -1
wave clipboard restore
