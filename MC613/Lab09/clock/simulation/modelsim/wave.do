view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/clock/set_second 
wave modify -driver freeze -pattern constant -value 0 -starttime 100ps -endtime 1000ps Edit:/clock/set_second 
wave create -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 50ps sim:/clock/set_minute 
wave modify -driver freeze -pattern constant -value 0 -starttime 50ps -endtime 1000ps Edit:/clock/set_minute 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 100ps sim:/clock/set_hour 
wave modify -driver freeze -pattern constant -value 1 -starttime 100ps -endtime 150ps Edit:/clock/set_hour 
wave modify -driver freeze -pattern constant -value 0 -starttime 150ps -endtime 1000ps Edit:/clock/set_hour 
wave create -driver freeze -pattern constant -value 0000 -range 3 0 -starttime 0ps -endtime 1000ps sim:/clock/unity 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 1111 -range 3 0 -starttime 0ps -endtime 1000ps sim:/clock/decimal 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 0011 -range 3 0 -starttime 0ps -endtime 1000ps Edit:/clock/decimal 
wave modify -driver freeze -pattern constant -value 0001 -range 3 0 -starttime 0ps -endtime 1000ps Edit:/clock/decimal 
wave create -driver freeze -pattern clock -initialvalue 0 -period 10fs -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/clock/clk 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps Edit:/clock/clk 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 10fs -dutycycle 50 -starttime 0ps -endtime 1000ps Edit:/clock/clk 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 1ps -dutycycle 50 -starttime 0ps -endtime 1000ps Edit:/clock/clk 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 10ps -dutycycle 50 -starttime 0ps -endtime 1000ps Edit:/clock/clk 
wave modify -driver freeze -pattern constant -value 0 -starttime 30ps -endtime 1000ps Edit:/clock/set_hour 
wave modify -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 1000ps Edit:/clock/set_minute 
wave modify -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 1000ps Edit:/clock/set_second 
wave modify -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 50ps Edit:/clock/set_second 
wave modify -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 50ps Edit:/clock/set_minute 
wave modify -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 50ps Edit:/clock/set_minute 
wave modify -driver freeze -pattern constant -value 1 -starttime 50ps -endtime 100ps Edit:/clock/set_minute 
wave modify -driver freeze -pattern constant -value 1 -starttime 100ps -endtime 150ps Edit:/clock/set_hour 
wave modify -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 50ps Edit:/clock/set_second 
wave modify -driver freeze -pattern constant -value 1 -starttime 0ps -endtime 15ps Edit:/clock/set_second 
wave modify -driver freeze -pattern constant -value 0 -starttime 50ps -endtime 100ps Edit:/clock/set_minute 
wave modify -driver freeze -pattern constant -value 1 -starttime 15ps -endtime 30ps Edit:/clock/set_minute 
wave modify -driver freeze -pattern constant -value 0 -starttime 100ps -endtime 150ps Edit:/clock/set_hour 
wave modify -driver freeze -pattern constant -value 1 -starttime 30ps -endtime 45ps Edit:/clock/set_hour 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 10ps -dutycycle 50 -starttime 0ps -endtime 2000ps Edit:/clock/clk 
wave modify -driver freeze -pattern constant -value 0001 -range 3 0 -starttime 0ps -endtime 2000ps Edit:/clock/decimal 
wave modify -driver freeze -pattern constant -value 0000 -range 3 0 -starttime 0ps -endtime 2000ps Edit:/clock/unity 
wave modify -driver freeze -pattern constant -value 0 -starttime 45ps -endtime 2000ps Edit:/clock/set_hour 
wave modify -driver freeze -pattern constant -value 0 -starttime 30ps -endtime 2000ps Edit:/clock/set_minute 
wave modify -driver freeze -pattern constant -value 0 -starttime 15ps -endtime 2000ps Edit:/clock/set_second 
wave modify -driver freeze -pattern constant -value 0001 -range 3 0 -starttime 0ps -endtime 10000ps Edit:/clock/decimal 
wave modify -driver freeze -pattern constant -value 0000 -range 3 0 -starttime 0ps -endtime 10000ps Edit:/clock/unity 
wave modify -driver freeze -pattern constant -value 0 -starttime 2000ps -endtime 10000ps Edit:/clock/set_hour 
wave modify -driver freeze -pattern constant -value 0 -starttime 2000ps -endtime 10000ps Edit:/clock/set_minute 
wave modify -driver freeze -pattern constant -value 0 -starttime 2000ps -endtime 10000ps Edit:/clock/set_second 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 10ps -dutycycle 50 -starttime 2000ps -endtime 10000ps Edit:/clock/clk 
WaveCollapseAll -1
wave clipboard restore
