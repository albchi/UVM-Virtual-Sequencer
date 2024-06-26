verdiWindowResize -win $_Verdi_1 "0" "0" "900" "700"
verdiWindowResize -win $_Verdi_1 "0" "0" "900" "700"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
simSetSimulator "-vcssv" -exec \
           "/home/sf10274/AlbertLand/0UVMgetinfo/VirtualSequencerTheOne/simv" \
           -args
debImport "-dbdir" \
          "/home/sf10274/AlbertLand/0UVMgetinfo/VirtualSequencerTheOne/simv.daidir"
debLoadSimResult /home/sf10274/AlbertLand/0UVMgetinfo/VirtualInterface/novas.fsdb
wvCreateWindow
srcHBSelect "top" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "top" -win $_nTrace1
srcSetScope "top" -delim "." -win $_nTrace1
srcHBSelect "top.intf_bus_0" -win $_nTrace1
srcHBSelect "top.intf_bus_0" -win $_nTrace1
srcSetScope "top.intf_bus_0" -delim "." -win $_nTrace1
srcHBSelect "top.intf_bus_0" -win $_nTrace1
srcHBSelect "top.intf_bus_0" -win $_nTrace1
srcHBSelect "top.intf_bus_0" -win $_nTrace1
srcHBAddObjectToWave -clipboard
wvDrop -win $_nWave2
srcHBSelect "top.slave0" -win $_nTrace1
srcHBSelect "top.slave0" -win $_nTrace1
