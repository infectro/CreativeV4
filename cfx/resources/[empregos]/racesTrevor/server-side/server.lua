-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("racesTrevor",cRP)
vCLIENT = Tunnel.getInterface("racesTrevor")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local raceActual = 1
local raceTimers = GetGameTimer()
-----------------------------------------------------------------------------------------------------------------------------------------
-- RACECIRCUITS
-----------------------------------------------------------------------------------------------------------------------------------------
local raceCircuits = {
	[1] = {
		["explode"] = 325,
		["coords"] = {
			{ 1823.44,3243.71,43.1 },
			{ 1999.57,3107.08,46.45 },
			{ 1800.59,2931.8,45.11 },
			{ 894.41,2697.01,40.24 },
			{ 713.71,2453.11,59.88 },
			{ 685.27,2337.8,49.64 },
			{ 603.35,2182.57,68.19 },
			{ -79.1,1996.11,180.36 },
			{ -267.92,1826.43,198.22 },
			{ -558.56,1885.34,209.14 },
			{ -756.76,1697.78,200.56 },
			{ -844.41,1785.92,172.24 },
			{ -883.84,1928.83,148.19 },
			{ -1440.09,2148.52,53.35 },
			{ -1504.53,1725.22,92.2 },
			{ -1625.26,1151.69,149.26 },
			{ -1981.39,514.22,107.2 },
			{ -1610.22,-132.42,56.21 },
			{ -1846.24,-239.24,39.28 },
			{ -2158.99,-277.89,12.44 },
			{ -1985.27,-467.8,10.95 },
			{ -1629.42,-740.34,10.75 },
			{ -1071.94,-628.2,16.02 },
			{ -793.18,-549.94,24.15 },
			{ -642.97,-767.78,25.0 },
			{ -246.47,-880.06,29.99 },
			{ -321.2,-1009.68,29.76 }
		}
	},
	[2] = {
		["explode"] = 300,
		["coords"] = {
			{ 1830.95,3240.33,43.44 },
			{ 2404.57,2915.25,48.68 },
			{ 2646.88,3113.64,48.78 },
			{ 2942.4,3868.32,51.75 },
			{ 2834.23,4339.24,49.35 },
			{ 2983.11,4542.7,49.84 },
			{ 2899.02,4825.42,61.79 },
			{ 2780.42,5060.99,62.5 },
			{ 2655.84,5379.96,61.7 },
			{ 1779.22,6302.35,48.02 },
			{ 1570.09,6406.41,24.26 },
			{ 1152.74,6492.44,20.41 },
			{ 250.01,6573.12,30.53 },
			{ 54.48,6628.15,30.97 },
			{ -262.97,6389.49,30.26 },
			{ -397.0,6180.0,30.94 },
			{ -416.99,6027.09,30.75 },
			{ -830.05,5464.7,33.19 },
			{ -1245.27,5268.24,49.39 },
			{ -1592.3,4912.05,60.66 },
			{ -2101.01,4444.15,60.46 },
			{ -2335.72,4105.85,34.27 },
			{ -2399.38,3575.82,16.78 },
			{ -2267.7,3447.2,30.95 }
		}
	},
	[3] = {
		["explode"] = 225,
		["coords"] = {
			{ 1808.56,3244.11,42.41 },
			{ 2310.02,2991.24,46.52 },
			{ 2262.28,2826.41,41.87 },
			{ 1972.92,2495.41,53.92 },
			{ 1885.64,2067.83,54.37 },
			{ 2064.59,1439.42,74.96 },
			{ 2531.97,644.37,105.65 },
			{ 2536.46,187.05,103.74 },
			{ 2298.43,-398.08,86.91 },
			{ 1332.6,-1092.85,51.19 },
			{ 1073.93,-1030.44,34.95 },
			{ 981.62,-871.63,31.19 },
			{ 825.63,-653.01,41.27 },
			{ 581.03,-419.77,42.83 },
			{ 447.84,-297.21,48.34 },
			{ 261.24,-562.37,42.65 },
			{ 227.52,-839.84,29.6 },
			{ 242.51,-966.05,28.68 },
			{ 496.59,-1043.19,35.1 },
			{ 713.29,-1085.06,21.74 }
		}
	},
	[4] = {
		["explode"] = 250,
		["coords"] = {
			{ 1823.06,3242.01,43.03 },
			{ 2286.85,3000.03,45.66 },
			{ 2293.2,2860.53,41.45 },
			{ 1978.57,2573.56,53.9 },
			{ 1753.13,1913.08,72.45 },
			{ 1659.0,1282.45,85.34 },
			{ 1585.07,983.94,78.07 },
			{ 1525.44,825.75,76.78 },
			{ 1321.73,621.95,79.78 },
			{ 1109.99,448.38,90.53 },
			{ 917.29,174.68,74.31 },
			{ 723.92,-70.85,56.28 },
			{ 567.51,-285.16,43.19 },
			{ 523.05,-203.51,51.43 },
			{ 447.87,-140.09,62.51 },
			{ 495.2,35.52,91.63 },
			{ 265.02,176.54,104.11 },
			{ 94.45,-105.11,58.15 },
			{ -173.48,-66.79,52.1 },
			{ -282.23,-133.71,43.34 },
			{ -510.0,-269.36,35.01 },
			{ -542.4,-327.44,34.54 },
			{ -566.51,-363.58,34.53 },
			{ -642.0,-521.28,34.15 },
			{ -690.26,-651.25,30.46 },
			{ -744.85,-769.93,25.06 },
			{ -692.38,-837.19,23.25 },
			{ -651.66,-1016.46,18.79 },
			{ -1036.45,-1263.0,5.71 },
			{ -1085.34,-1394.29,4.45 },
			{ -1121.11,-1416.21,4.55 },
			{ -1165.56,-1411.21,4.13 },
			{ -1211.15,-1402.21,3.52 },
			{ -1111.3,-1323.61,4.57 },
			{ -1079.78,-1243.83,4.53 }
		}
	},
	[5] = {
		["explode"] = 300,
		["coords"] = {
			{ 1806.94,3241.1,42.39 },
			{ 2005.11,3301.24,45.11 },
			{ 2060.4,3424.83,43.73 },
			{ 2037.9,3326.02,44.97 },
			{ 2313.76,3239.27,47.08 },
			{ 2555.94,3249.87,52.03 },
			{ 2657.73,3400.42,55.25 },
			{ 2754.35,3413.21,55.54 },
			{ 2859.31,3529.47,53.41 },
			{ 2856.94,4259.58,49.47 },
			{ 2700.68,4375.07,46.37 },
			{ 2538.65,4181.28,39.26 },
			{ 2468.77,4173.95,36.7 },
			{ 2459.82,4568.85,35.97 },
			{ 2241.74,4734.76,38.74 },
			{ 2198.04,4836.61,44.21 },
			{ 2308.69,5049.08,44.35 },
			{ 2314.88,5199.14,59.18 },
			{ 2007.12,5167.09,46.64 },
			{ 1845.45,5086.7,53.77 },
			{ 1835.64,4976.73,50.95 },
			{ 1793.03,4902.69,41.28 },
			{ 1878.52,4747.92,39.06 },
			{ 1911.58,4621.93,38.37 },
			{ 1697.16,4687.03,42.33 },
			{ 1774.91,5024.93,54.32 },
			{ 2106.0,4973.52,40.39 },
			{ 2338.77,5080.01,45.28 },
			{ 2561.12,5094.26,43.88 },
			{ 2754.73,4477.72,46.83 },
			{ 2855.85,4427.87,48.26 },
			{ 3057.38,4052.97,67.37 },
			{ 2985.45,3496.79,70.75 }
		}
	},
	[6] = {
		["explode"] = 325,
		["coords"] = {
			{ 1825.06,3241.14,43.14 },
			{ 2318.77,2987.77,46.89 },
			{ 2067.9,2654.19,51.44 },
			{ 1723.55,1659.06,81.49 },
			{ 1154.89,489.84,87.74 },
			{ 962.44,519.1,109.14 },
			{ 856.29,374.02,117.54 },
			{ 588.18,286.4,103.29 },
			{ 332.56,321.64,104.421 },
			{ 116.64,-46.93,67.05 },
			{ 260.1,-240.15,53.41 },
			{ 323.17,-339.3,47.08 },
			{ 90.72,-297.46,45.8 },
			{ -22.31,-393.67,38.92 },
			{ -155.73,-786.88,31.48 },
			{ -270.23,-807.85,31.32 },
			{ -144.3,-704.0,38.84 },
			{ 31.39,-775.49,43.57 },
			{ 132.02,-809.12,30.63 },
			{ 243.57,-963.65,28.66 },
			{ 86.72,-1039.95,28.81 },
			{ 16.7,-1076.91,37.51 },
			{ 164.31,-1129.8,28.7 },
			{ 318.89,-1057.08,28.58 },
			{ 484.84,-1068.51,28.44 },
			{ 448.48,-1131.56,28.8 },
			{ 264.76,-1184.0,37.59 },
			{ -346.65,-1200.5,40.39 },
			{ -452.18,-1391.78,30.45 },
			{ -445.54,-1518.83,34.79 },
			{ -647.72,-1699.37,36.85 },
			{ -754.35,-1822.91,26.81 },
			{ -849.58,-2273.01,15.75 },
			{ -980.84,-2488.87,13.51 }
		}
	},
	[7] = {
		["explode"] = 400,
		["coords"] = {
			{ 1813.44,3239.93,42.65 },
			{ 2192.95,2989.47,45.48 },
			{ 2052.26,2698.74,46.74 },
			{ 1862.34,2544.15,45.02 },
			{ 1591.2,2413.67,45.29 },
			{ 1604.31,2736.8,45.29 },
			{ 1862.62,2617.24,45.01 },
			{ 1807.32,2331.09,55.86 },
			{ 1738.74,1779.47,77.02 },
			{ 1748.51,1544.09,83.98 },
			{ 2112.41,1359.66,74.88 },
			{ 2264.46,1127.31,66.71 },
			{ 2499.79,756.65,97.98 },
			{ 2593.93,326.02,107.6 },
			{ 2544.24,38.51,94.34 },
			{ 2351.27,-324.17,84.7 },
			{ 1280.73,-1116.58,50.26 },
			{ 906.12,-717.57,41.27 },
			{ 797.0,-626.28,38.81 },
			{ 782.22,-547.64,32.39 },
			{ 558.55,-342.85,42.95 },
			{ 374.0,-395.8,45.38 },
			{ 226.37,-646.98,38.48 },
			{ 233.69,-841.01,29.45 },
			{ 203.04,-1307.86,28.7 },
			{ 356.67,-1554.77,28.66 },
			{ 304.36,-1806.88,26.84 },
			{ 207.83,-1790.22,28.22 },
			{ 301.5,-1894.74,26.22 },
			{ 283.8,-2017.7,19.06 },
			{ 89.68,-2021.38,17.54 },
			{ -3.07,-1959.63,1.06 },
			{ -334.6,-1700.69,0.49 },
			{ -493.91,-1491.23,11.61 },
			{ -591.7,-1438.21,9.97 },
			{ -586.07,-1247.52,12.28 },
			{ -521.77,-1199.55,17.93 },
			{ -442.23,-1430.86,28.66 },
			{ -7.42,-1374.5,28.66 },
			{ 156.07,-1294.11,28.43 }
		}
	},
	[8] = {
		["explode"] = 375,
		["coords"] = {
			{ 1885.09,3202.17,45.52 },
			{ 1527.63,2765.55,37.77 },
			{ 1417.46,2509.85,43.49 },
			{ 1480.38,1867.59,106.86 },
			{ 1616.09,1122.39,82.45 },
			{ 1529.4,833.64,77.19 },
			{ 1327.25,607.95,80.1 },
			{ 1171.61,418.01,90.57 },
			{ 827.02,-9.65,80.22 },
			{ 705.43,-157.58,49.11 },
			{ 562.72,-288.83,43.55 },
			{ 772.92,-637.93,28.59 },
			{ 981.22,-952.08,42.04 },
			{ 861.46,-1085.83,28.29 },
			{ 791.9,-1370.59,26.41 },
			{ 573.22,-1430.68,29.39 },
			{ 453.07,-1258.78,30.04 },
			{ 267.88,-1412.9,29.28 },
			{ 99.71,-1458.59,29.08 },
			{ -18.94,-1462.09,30.41 },
			{ -171.82,-1586.76,34.56 },
			{ -63.71,-1798.9,27.36 },
			{ 164.98,-1890.72,23.3 },
			{ 35.04,-2035.71,18.06 },
			{ -272.21,-2130.88,21.87 },
			{ -429.97,-2157.05,10.09 },
			{ -694.1,-2361.76,14.27 },
			{ -1028.95,-2084.0,13.4 },
			{ -846.5,-1704.41,18.67 },
			{ -694.95,-1488.68,10.98 },
			{ -719.23,-1396.57,4.74 }
		}
	},
	[9] = {
		["explode"] = 275,
		["coords"] = {
			{ 1884.77,3231.11,44.73 },
			{ 2051.36,3342.28,44.55 },
			{ 2042.53,3456.58,43.18 },
			{ 2079.55,3280.14,45.07 },
			{ 2249.77,3191.45,48.12 },
			{ 2338.07,2974.81,47.61 },
			{ 2511.28,2946.38,41.55 },
			{ 2903.86,3767.56,52.06 },
			{ 2712.91,4384.44,47.01 },
			{ 2471.12,4176.94,36.68 },
			{ 2385.76,4660.8,35.83 },
			{ 1941.27,4595.63,38.79 },
			{ 1699.69,4962.77,43.04 },
			{ 2005.87,5165.64,46.49 },
			{ 2492.37,5098.82,44.44 },
			{ 2606.62,5239.84,44.09 },
			{ 2392.27,5735.52,45.0 },
			{ 1670.77,6366.93,30.71 },
			{ 606.44,6538.95,27.55 },
			{ -7.01,6635.07,30.6 },
			{ -415.95,6119.97,31.03 },
			{ -555.99,6054.81,19.46 },
			{ -659.97,6011.26,9.43 },
			{ -695.26,5775.45,16.71 }
		}
	},
	[10] = {
		["explode"] = 375,
		["coords"] = {
			{ 1791.76,3339.46,40.55 },
			{ 1780.89,3555.88,35.23 },
			{ 2033.34,3772.47,31.71 },
			{ 1950.34,3873.87,32.35 },
			{ 1154.68,3536.98,34.32 },
			{ 183.12,2923.63,44.87 },
			{ -504.91,2776.18,39.3 },
			{ -716.6,2365.05,66.02 },
			{ -862.02,1771.3,174.65 },
			{ -707.33,1089.52,253.33 },
			{ -408.73,911.49,235.61 },
			{ -366.2,872.48,226.41 },
			{ 343.66,869.87,195.12 },
			{ 967.27,840.91,201.48 },
			{ 1079.53,539.81,94.65 },
			{ 1037.58,478.49,94.6 },
			{ 1090.94,332.03,90.08 },
			{ 924.66,220.76,77.58 },
			{ 826.46,153.26,80.66 },
			{ 730.39,65.41,82.27 },
			{ 633.14,93.99,88.2 },
			{ 700.27,239.19,92.21 }
		}
	},
	[11] = {
		["explode"] = 375,
		["coords"] = {
			{ 1793.07,3337.48,40.64 },
			{ 1647.58,3487.3,35.99 },
			{ 223.53,3279.72,40.76 },
			{ 253.24,2790.18,43.41 },
			{ 183.59,2635.36,47.4 },
			{ -185.13,2866.23,47.48 },
			{ -475.81,2791.95,38.78 },
			{ -848.34,1782.9,172.76 },
			{ -759.8,1691.85,200.53 },
			{ -93.75,1855.13,198.73 },
			{ 147.71,1501.94,238.26 },
			{ 313.92,957.95,208.37 },
			{ 257.07,520.66,137.25 },
			{ 78.1,360.54,113.37 },
			{ -59.8,262.32,103.0 },
			{ -97.68,62.75,70.87 },
			{ -218.59,-554.85,34.07 },
			{ -448.41,-693.67,30.29 },
			{ -506.15,-874.98,28.58 },
			{ -689.3,-1480.59,10.22 },
			{ -1068.88,-2043.24,12.68 },
			{ -767.35,-2345.04,14.5 },
			{ -841.24,-2605.29,13.49 },
			{ -962.68,-2743.99,19.57 },
			{ -1073.93,-2695.92,19.78 },
			{ -1005.87,-2468.19,19.77 },
			{ -854.18,-2246.26,17.44 },
			{ -682.05,-2123.61,13.22 },
			{ -535.02,-2076.25,28.91 },
			{ -490.48,-1968.31,32.30 },
			{ -755.49,-1706.46,28.93 },
			{ -690.95,-1631.64,23.58 },
			{ -643.0,-1714.3,24.11 }
		}
	},
	[12] = {
		["explode"] = 325,
		["coords"] = {
			{ 1801.63,3323.75,41.25 },
			{ 1542.9,3641.48,33.97 },
			{ 321.28,3438.02,35.8 },
			{ 112.97,2869.71,50.32 },
			{ -574.24,2853.13,34.14 },
			{ -1355.09,2309.86,39.98 },
			{ -1097.19,2202.53,83.9 },
			{ -880.64,1752.6,177.58 },
			{ -806.54,1406.24,244.74 },
			{ -669.03,919.01,230.07 },
			{ -585.32,680.45,146.94 },
			{ -696.79,600.07,142.24 },
			{ -1110.34,780.9,162.42 },
			{ -1066.31,664.1,141.43 },
			{ -765.68,452.29,98.49 },
			{ -1270.34,400.41,74.11 },
			{ -1432.24,256.91,60.63 },
			{ -1283.67,211.75,59.10 },
			{ -589.31,259.98,81.81 },
			{ 131.32,406.91,116.08 },
			{ 320.02,570.43,153.89 },
			{ 523.46,330.04,130.36 },
			{ 619.11,313.71,106.64 },
			{ 438.08,222.59,102.54 }
		}
	},
	[13] = {
		["explode"] = 350,
		["coords"] = {
			{ 1906.36,3179.14,46.0 },
			{ 2318.5,2987.26,46.88 },
			{ 2578.54,2612.84,36.42 },
			{ 2486.21,1324.44,45.72 },
			{ 2369.89,1159.88,62.84 },
			{ 2477.77,942.17,85.91 },
			{ 2626.19,374.97,96.42 },
			{ 2449.15,-175.87,87.62 },
			{ 2375.89,-377.11,74.56 },
			{ 2291.73,-703.25,64.35 },
			{ 1592.48,-1390.34,80.79 },
			{ 1233.52,-1683.66,40.27 },
			{ 923.35,-1755.96,30.32 },
			{ 772.3,-1988.54,28.64 },
			{ 376.04,-1937.77,23.95 },
			{ 337.0,-1805.82,27.59 },
			{ 255.28,-1654.91,28.68 },
			{ 265.6,-1458.58,28.68 },
			{ 340.23,-1326.14,31.72 },
			{ 502.01,-1189.69,28.67 },
			{ 384.77,-1153.68,28.63 },
			{ 215.09,-1184.5,37.59 },
			{ -281.52,-1184.28,36.63 },
			{ -396.73,-841.94,38.21 },
			{ -304.56,-663.16,32.45 },
			{ -180.79,-702.01,34.32 },
			{ -12.7,-414.64,38.83 },
			{ -93.44,-239.71,44.15 },
			{ -223.13,-211.98,48.46 },
			{ -373.44,-201.75,36.32 },
			{ -598.0,-319.16,34.29 },
			{ -743.59,-330.32,35.51 },
			{ -808.07,-397.88,36.25 }
		}
	},
	[14] = {
		["explode"] = 300,
		["coords"] = {
			{ 1848.7,3235.51,44.43 },
			{ 2231.76,3011.9,44.76 },
			{ 1931.43,2421.1,54.59 },
			{ 2185.47,1236.19,76.04 },
			{ 2275.82,1097.88,65.13 },
			{ 2385.08,848.12,116.86 },
			{ 1711.87,-86.97,177.77 },
			{ 1552.91,-84.4,156.86 },
			{ 1109.92,-234.28,68.74 },
			{ 515.31,-222.01,50.19 },
			{ 574.52,-430.6,43.15 },
			{ 577.4,-543.09,52.63 },
			{ 617.52,-916.57,10.27 },
			{ 656.73,-1664.82,9.26 },
			{ 602.94,-1941.14,19.57 },
			{ 513.08,-2045.5,26.38 },
			{ 277.73,-2527.18,5.41 },
			{ 169.53,-2832.7,5.55 },
			{ 177.93,-3081.88,5.67 },
			{ 135.77,-3090.77,5.9 },
			{ 116.32,-2926.87,5.54 },
			{ 88.36,-2721.87,6.01 }
		}
	},
	[15] = {
		["explode"] = 275,
		["coords"] = {
			{ 1848.7,3235.51,44.43 },
			{ 2278.62,3002.55,45.74 },
			{ 2258.46,2823.06,42.43 },
			{ 1994.85,2519.32,54.32 },
			{ 1868.66,2296.23,57.69 },
			{ 1721.5,1544.7,84.41 },
			{ 1656.92,1289.08,85.77 },
			{ 1578.69,976.36,78.4 },
			{ 1352.71,650.58,80.17 },
			{ 1213.73,472.38,84.19 },
			{ 1032.2,229.67,81.82 },
			{ 832.35,-0.75,79.93 },
			{ 1072.24,-229.24,69.37 },
			{ 1137.26,-359.05,66.8 },
			{ 1050.44,-355.28,66.87 },
			{ 926.83,-385.8,41.86 },
			{ 649.57,-590.59,14.66 },
			{ 614.65,-789.15,10.81 },
			{ 726.88,-856.26,21.01 },
			{ 757.92,-1046.17,25.4 },
			{ 651.71,-1057.52,22.02 },
			{ 618.39,-1156.65,9.77 },
			{ 668.8,-1496.06,10.15 },
			{ 625.86,-1891.79,11.09 },
			{ 492.74,-2059.13,25.16 },
			{ 354.63,-2167.2,13.57 },
			{ 92.83,-2190.95,5.74 },
			{ -60.44,-2187.2,7.6 },
			{ -310.93,-2158.97,10.08 },
			{ -631.58,-1996.86,6.06 },
			{ -825.72,-1994.47,13.73 }
		}
	},
	[16] = {
		["explode"] = 275,
		["coords"] = {
			{ 1838.34,3238.77,44.07 },
			{ 2224.54,3013.02,44.96 },
			{ 2318.89,2890.39,44.06 },
			{ 1762.95,1997.77,69.39 },
			{ 1681.07,1301.03,86.23 },
			{ 1493.19,809.53,76.81 },
			{ 1348.79,648.16,80.22 },
			{ 965.68,265.68,81.05 },
			{ 753.01,96.34,79.44 },
			{ 608.2,51.56,90.84 },
			{ 429.79,-63.35,73.05 },
			{ 250.39,-161.46,60.21 },
			{ 287.79,-292.08,53.98 },
			{ 300.06,-435.82,44.01 },
			{ 169.15,-595.23,43.22 },
			{ -8.26,-841.63,37.19 },
			{ -449.16,-837.62,30.49 },
			{ -637.32,-738.19,27.45 },
			{ -694.82,-651.25,30.39 },
			{ -735.49,-738.69,27.06 },
			{ -692.9,-748.72,28.74 },
			{ -661.08,-747.43,30.65 },
			{ -693.66,-748.01,33.06 },
			{ -655.81,-755.13,35.92 },
			{ -589.92,-754.81,28.87 },
			{ -465.33,-662.56,31.79 },
			{ -222.19,-631.62,32.71 },
			{ -81.96,-679.07,34.29 },
			{ 83.71,-608.51,31.01 },
			{ -81.24,-537.08,39.64 },
			{ -383.29,-551.4,25.48 },
			{ -493.67,-606.43,24.69 }
		}
	},
	[17] = {
		["explode"] = 375,
		["coords"] = {
			{ 1794.92,3335.93,40.73 },
			{ 1672.88,3620.74,34.91 },
			{ 1844.37,3747.79,32.57 },
			{ 1710.62,3900.16,34.26 },
			{ 1586.21,3787.49,34.22 },
			{ 1588.74,3663.33,33.88 },
			{ 1160.24,3537.37,34.35 },
			{ 245.95,3397.7,37.7 },
			{ 94.4,3355.05,33.92 },
			{ -524.2,2998.33,26.54 },
			{ -1393.3,2697.35,4.04 },
			{ -2676.96,3009.41,8.55 },
			{ -2722.7,3090.21,16.32 },
			{ -2600.81,3025.48,31.91 },
			{ -2623.09,2877.8,16.06 },
			{ -3045.4,1417.57,22.45 },
			{ -3162.3,1295.42,14.21 },
			{ -3127.3,833.07,16.19 },
			{ -3083.99,699.05,17.24 },
			{ -3024.76,181.11,15.28 },
			{ -2201.18,-364.88,12.48 },
			{ -2058.01,-542.96,6.0 },
			{ -1664.86,-904.99,7.81 }
		}
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- FINISHRACE
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.finishRace(raceId)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.generateItem(user_id,"dollarsz",math.random(1125,1425),true)
		TriggerEvent("blipsystem:serviceExit",source)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKTICKET
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.checkTicket()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.tryGetInventoryItem(user_id,"credential",1) then
			if GetGameTimer() >= raceTimers then
				raceTimers = GetGameTimer() + (20 * 60000)
				raceActual = raceActual + 1

				if raceActual > #raceCircuits then
					raceActual = 1
				end
			end

			TriggerEvent("blipsystem:serviceEnter",source,"Corredor",48)

			local policeResult = vRP.numPermission("Police")
			for k,v in pairs(policeResult) do
				async(function()
					TriggerClientEvent("Notify",v,"importante","Detectamos um corredor clandestino nas ruas.",2000)
					vRPC.playSound(v,"Beep_Red","DLC_HEIST_HACKING_SNAKE_SOUNDS")
				end)
			end

			return true,raceActual
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- EXITRACE
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.exitRace()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		TriggerEvent("blipsystem:serviceExit",source)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLAYERSPAWN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn",function(user_id,source)
	vCLIENT.updateRaces(source,raceCircuits)
end)