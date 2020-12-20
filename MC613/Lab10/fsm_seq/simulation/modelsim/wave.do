view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/fsm_seq/clock 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 1000ps sim:/fsm_seq/reset 
wave create -driver freeze -pattern clock -initialvalue 0 -period 200ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/fsm_seq/w 
wave modify -driver freeze -pattern random -initialvalue 0 -period 200ps -random_type Uniform -seed 5 -starttime 0ps -endtime 2000ps Edit:/fsm_seq/w 
wave modify -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 2000ps Edit:/fsm_seq/reset 
wave modify -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 2000ps Edit:/fsm_seq/clock 
wave modify -driver freeze -pattern random -initialvalue 0 -period 200ps -random_type Normal -seed 5 -starttime 0ps -endtime 2000ps Edit:/fsm_seq/w 
WaveCollapseAll -1
wave clipboard restore
