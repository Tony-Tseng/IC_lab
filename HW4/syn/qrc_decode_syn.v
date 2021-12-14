/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : O-2018.06
// Date      : Wed Dec  2 15:50:50 2020
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_qrc_decode_mydesign_0 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net6005;

  TLATNXL latch ( .D(EN), .GN(CLK), .Q(net6005) );
  AND2XL main_gate ( .A(net6005), .B(CLK), .Y(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_qrc_decode_mydesign_5 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net6005;

  TLATNXL latch ( .D(EN), .GN(CLK), .Q(net6005) );
  AND2XL main_gate ( .A(net6005), .B(CLK), .Y(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_qrc_decode_mydesign_4 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net6005;

  TLATNXL latch ( .D(EN), .GN(CLK), .Q(net6005) );
  AND2XL main_gate ( .A(net6005), .B(CLK), .Y(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_qrc_decode_mydesign_3 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net6005;

  TLATNXL latch ( .D(EN), .GN(CLK), .Q(net6005) );
  AND2XL main_gate ( .A(net6005), .B(CLK), .Y(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_qrc_decode_mydesign_2 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net6005;

  TLATNXL latch ( .D(EN), .GN(CLK), .Q(net6005) );
  AND2XL main_gate ( .A(net6005), .B(CLK), .Y(ENCLK) );
endmodule


module SNPS_CLOCK_GATE_HIGH_qrc_decode_mydesign_1 ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net6005;

  TLATNXL latch ( .D(EN), .GN(CLK), .Q(net6005) );
  AND2XL main_gate ( .A(net6005), .B(CLK), .Y(ENCLK) );
endmodule


module qrc_decode ( clk, rstn, qrc_decode_start, qrc_decode_finish, sram_rdata, 
        sram_raddr, decode_jis8_valid, decode_jis8_data );
  input [3:0] sram_rdata;
  output [9:0] sram_raddr;
  output [7:0] decode_jis8_data;
  input clk, rstn, qrc_decode_start;
  output qrc_decode_finish, decode_jis8_valid;
  wire   N707, check_4, N1008, N1009, N1010, N1011, N1086, N1087, N1088, N1089,
         N1090, N1091, N1092, N1093, N1094, N1095, N1243, qrc_decode_start_reg,
         qrc_decode_finish_reg0, decode_jis8_valid_reg0, N2423, N2805, N2806,
         N2807, N2808, N2809, N2810, N2811, N2812, N2943, N2944, N2945, N2946,
         N2947, N2948, N3831, N3834, N3837, N3840, N3843, N3846, N3849, N3852,
         N3855, N3858, N3861, N3864, N3867, N3870, N3873, N3876, N3879, N3882,
         N3885, N3888, N3891, N3894, N3897, N3900, N3903, N3906, N3909, N3912,
         N3915, N3918, N3921, N3924, N3927, N3930, N3933, N3936, N3939, N3942,
         N3945, N3948, N3951, N3954, N3957, N3960, N3963, N3966, N3969, N3972,
         N3975, N3978, N3981, N3984, N3987, N3990, N3993, N3996, N3999, N4002,
         N4005, N4008, N4011, N4014, N4017, N4020, N4023, N4026, N4029, N4032,
         N4035, N4038, N4041, N4044, N4047, N4050, N4053, N4056, N4059, N4062,
         N4065, N4068, N4071, N4074, N4077, N4080, N4095, N4098, N4101, N4104,
         N4107, N4110, N4113, N4116, N4119, N4122, N4125, N4128, N4131, N4134,
         N4137, N4140, net6008, net6012, net6017, net6022, net6027, net6032,
         net6035, net6038, net9636, net9654, n961, n962, n963, n968, n969,
         n970, n971, n972, n973, n974, n975, n976, n977, n978, n979, n980,
         n981, n982, n983, n984, n985, n986, n987, n988, n989, n998, n999,
         n1000, n1001, n1002, n1003, n1004, n1005, n1006, intadd_0_CI,
         intadd_0_SUM_2_, intadd_0_SUM_1_, intadd_0_SUM_0_, intadd_0_n3,
         intadd_0_n2, intadd_0_n1, n1030, n1031, n1034, n1035, n1036, n1037,
         n1038, n1039, n1040, n1041, n1042, n1043, n1044, n1045, n1046, n1047,
         n1048, n1049, n1050, n1051, n1052, n1053, n1054, n1055, n1056, n1057,
         n1058, n1059, n1061, n1062, n1063, n1064, n1065, n1066, n1067, n1068,
         n1069, n1070, n1071, n1072, n1073, n1074, n1075, n1076, n1077, n1079,
         n1080, n1081, n1083, n1084, n1085, n10860, n10870, n10880, n10890,
         n10900, n10910, n10920, n10930, n10940, n10950, n1096, n1097, n1098,
         n1099, n1100, n1101, n1102, n1103, n1104, n1105, n1106, n1107, n1108,
         n1109, n1110, n1111, n1112, n1113, n1114, n1115, n1116, n1117, n1118,
         n1119, n1120, n1121, n1122, n1123, n1124, n1125, n1126, n1127, n1128,
         n1129, n1130, n1131, n1132, n1133, n1134, n1135, n1136, n1137, n1138,
         n1139, n1140, n1141, n1142, n1143, n1145, n1146, n1147, n1148, n1149,
         n1150, n1152, n1153, n1154, n1155, n1156, n1157, n1158, n1159, n1160,
         n1161, n1162, n1163, n1164, n1165, n1166, n1167, n1168, n1169, n1171,
         n1172, n1173, n1174, n1175, n1176, n1178, n1179, n1180, n1181, n1182,
         n1183, n1184, n1185, n1186, n1187, n1188, n1189, n1190, n1191, n1192,
         n1193, n1194, n1195, n1196, n1197, n1198, n1199, n1200, n1201, n1202,
         n1203, n1204, n1205, n1206, n1207, n1208, n1209, n1210, n1211, n1212,
         n1213, n1214, n1215, n1216, n1217, n1218, n1219, n1220, n1221, n1222,
         n1223, n1224, n1225, n1226, n1227, n1228, n1229, n1230, n1231, n1232,
         n1233, n1234, n1235, n1236, n1237, n1238, n1239, n1240, n1241, n1242,
         n12430, n1244, n1245, n1246, n1247, n1248, n1249, n1251, n1252, n1253,
         n1254, n1255, n1256, n1257, n1258, n1259, n1260, n1261, n1262, n1263,
         n1264, n1265, n1266, n1267, n1268, n1269, n1270, n1271, n1272, n1273,
         n1274, n1275, n1276, n1277, n1278, n1279, n1280, n1281, n1282, n1283,
         n1284, n1285, n1286, n1287, n1288, n1289, n1290, n1291, n1292, n1293,
         n1294, n1295, n1296, n1297, n1298, n1299, n1300, n1301, n1302, n1303,
         n1304, n1305, n1306, n1307, n1308, n1309, n1310, n1311, n1312, n1313,
         n1314, n1315, n1316, n1317, n1318, n1319, n1320, n1321, n1322, n1323,
         n1324, n1325, n1326, n1327, n1328, n1329, n1330, n1331, n1332, n1333,
         n1334, n1335, n1336, n1337, n1338, n1339, n1340, n1341, n1342, n1343,
         n1344, n1345, n1346, n1347, n1348, n1349, n1350, n1351, n1352, n1353,
         n1354, n1355, n1356, n1357, n1358, n1359, n1360, n1361, n1362, n1363,
         n1364, n1365, n1366, n1367, n1368, n1369, n1370, n1371, n1372, n1373,
         n1374, n1375, n1376, n1377, n1378, n1380, n1381, n1382, n1383, n1384,
         n1385, n1386, n1387, n1388, n1389, n1390, n1391, n1392, n1393, n1394,
         n1395, n1396, n1398, n1399, n1400, n1401, n1402, n1403, n1404, n1405,
         n1406, n1407, n1408, n1409, n1410, n1411, n1412, n1413, n1414, n1415,
         n1416, n1417, n1418, n1419, n1420, n1421, n1422, n1423, n1424, n1425,
         n1426, n1427, n1428, n1429, n1430, n1431, n1432, n1433, n1434, n1435,
         n1436, n1437, n1438, n1439, n1440, n1441, n1442, n1443, n1444, n1445,
         n1446, n1447, n1448, n1449, n1450, n1451, n1452, n1453, n1454, n1455,
         n1456, n1457, n1458, n1459, n1460, n1461, n1462, n1463, n1464, n1465,
         n1467, n1468, n1469, n1470, n1471, n1472, n1473, n1474, n1475, n1476,
         n1477, n1478, n1479, n1480, n1481, n1482, n1483, n1484, n1485, n1486,
         n1487, n1488, n1489, n1490, n1491, n1492, n1493, n1494, n1495, n1496,
         n1497, n1498, n1499, n1500, n1501, n1502, n1503, n1504, n1505, n1506,
         n1507, n1508, n1509, n1510, n1511, n1512, n1513, n1514, n1515, n1516,
         n1517, n1518, n1519, n1520, n1521, n1522, n1523, n1524, n1525, n1526,
         n1527, n1528, n1529, n1530, n1531, n1532, n1533, n1534, n1535, n1536,
         n1537, n1538, n1539, n1540, n1541, n1542, n1543, n1544, n1545, n1546,
         n1547, n1548, n1549, n1550, n1551, n1552, n1553, n1554, n1555, n1556,
         n1557, n1558, n1559, n1560, n1561, n1562, n1563, n1564, n1565, n1566,
         n1567, n1568, n1569, n1570, n1571, n1572, n1573, n1574, n1575, n1576,
         n1577, n1578, n1579, n1580, n1581, n1582, n1583, n1584, n1585, n1586,
         n1587, n1588, n1589, n1590, n1591, n1592, n1593, n1595, n1596, n1597,
         n1598, n1599, n1600, n1601, n1602, n1603, n1604, n1605, n1606, n1607,
         n1608, n1609, n1610, n1611, n1612, n1613, n1614, n1615, n1616, n1617,
         n1618, n1619, n1620, n1621, n1622, n1624, n1625, n1626, n1627, n1628,
         n1629, n1630, n1631, n1632, n1634, n1635, n1636, n1637, n1638, n1639,
         n1640, n1641, n1642, n1643, n1644, n1645, n1646, n1647, n1648, n1649,
         n1650, n1651, n1652, n1653, n1654, n1655, n1656, n1657, n1658, n1659,
         n1660, n1661, n1662, n1663, n1664, n1665, n1666, n1667, n1668, n1669,
         n1670, n1671, n1672, n1673, n1674, n1675, n1676, n1677, n1678, n1679,
         n1680, n1681, n1682, n1683, n1684, n1685, n1686, n1687, n1688, n1689,
         n1690, n1691, n1692, n1693, n1694, n1695, n1696, n1697, n1698, n1699,
         n1700, n1701, n1702, n1703, n1704, n1705, n1706, n1707, n1708, n1709,
         n1710, n1711, n1712, n1713, n1714, n1715, n1716, n1717, n1718, n1719,
         n1720, n1721, n1722, n1723, n1724, n1726, n1727, n1728, n1729, n1730,
         n1731, n1732, n1733, n1734, n1735, n1736, n1737, n1738, n1739, n1740,
         n1741, n1742, n1743, n1744, n1745, n1746, n1747, n1748, n1749, n1750,
         n1751, n1752, n1753, n1754, n1755, n1756, n1757, n1758, n1759, n1760,
         n1761, n1762, n1763, n1764, n1765, n1766, n1767, n1768, n1769, n1770,
         n1771, n1772, n1773, n1774, n1775, n1776, n1777, n1778, n1779, n1780,
         n1781, n1782, n1783, n1784, n1785, n1786, n1787, n1788, n1789, n1790,
         n1791, n1792, n1793, n1794, n1795, n1796, n1797, n1798, n1799, n1800,
         n1801, n1802, n1803, n1804, n1805, n1806, n1807, n1808, n1809, n1810,
         n1811, n1812, n1813, n1814, n1815, n1816, n1817, n1818, n1819, n1820,
         n1821, n1822, n1823, n1824, n1825, n1826, n1827, n1828, n1829, n1830,
         n1831, n1832, n1834, n1835, n1836, n1837, n1838, n1839, n1840, n1841,
         n1842, n1843, n1844, n1845, n1846, n1847, n1848, n1849, n1850, n1851,
         n1852, n1853, n1854, n1855, n1856, n1858, n1859, n1860, n1861, n1862,
         n1863, n1864, n1865, n1866, n1867, n1868, n1869, n1870, n1871, n1872,
         n1873, n1874, n1875, n1876, n1877, n1878, n1879, n1880, n1881, n1882,
         n1883, n1884, n1885, n1886, n1887, n1888, n1889, n1890, n1891, n1892,
         n1893, n1894, n1895, n1896, n1897, n1898, n1899, n1900, n1901, n1902,
         n1903, n1904, n1905, n1906, n1907, n1908, n1909, n1910, n1911, n1912,
         n1913, n1914, n1915, n1916, n1917, n1918, n1919, n1920, n1921, n1922,
         n1923, n1924, n1925, n1926, n1927, n1928, n1929, n1930, n1931, n1932,
         n1933, n1934, n1935, n1936, n1937, n1938, n1939, n1940, n1941, n1942,
         n1943, n1944, n1946, n1947, n1948, n1949, n1950, n1951, n1952, n1953,
         n1954, n1955, n1956, n1957, n1958, n1959, n1960, n1961, n1962, n1963,
         n1964, n1965, n1966, n1967, n1968, n1969, n1970, n1971, n1972, n1973,
         n1974, n1975, n1976, n1977, n1978, n1979, n1980, n1981, n1982, n1983,
         n1984, n1985, n1986, n1987, n1988, n1989, n1990, n1991, n1992, n1993,
         n1994, n1995, n1996, n1997, n1998, n1999, n2000, n2001, n2002, n2003,
         n2004, n2005, n2006, n2007, n2008, n2009, n2010, n2011, n2012, n2013,
         n2014, n2015, n2016, n2017, n2018, n2019, n2020, n2021, n2022, n2023,
         n2024, n2025, n2026, n2027, n2028, n2029, n2030, n2031, n2032, n2033,
         n2034, n2035, n2036, n2037, n2038, n2039, n2040, n2041, n2042, n2043,
         n2044, n2045, n2046, n2047, n2048, n2049, n2050, n2051, n2052, n2053,
         n2054, n2055, n2056, n2057, n2058, n2059, n2060, n2061, n2062, n2063,
         n2064, n2065, n2066, n2067, n2068, n2069, n2070, n2071, n2072, n2073,
         n2074, n2075, n2076, n2077, n2078, n2079, n2080, n2081, n2082, n2083,
         n2084, n2085, n2086, n2087, n2088, n2089, n2090, n2091, n2092, n2093,
         n2094, n2095, n2096, n2097, n2098, n2099, n2100, n2101, n2102, n2103,
         n2104, n2105, n2106, n2107, n2108, n2109, n2110, n2111, n2112, n2113,
         n2114, n2115, n2116, n2117, n2118, n2119, n2120, n2121, n2122, n2123,
         n2124, n2125, n2126, n2127, n2128, n2129, n2130, n2131, n2132, n2133,
         n2134, n2135, n2136, n2137, n2138, n2139, n2140, n2141, n2142, n2143,
         n2144, n2145, n2146, n2147, n2148, n2149, n2150, n2151, n2152, n2153,
         n2154, n2155, n2156, n2157, n2158, n2159, n2160, n2161, n2162, n2163,
         n2164, n2165, n2166, n2167, n2168, n2169, n2170, n2171, n2172, n2173,
         n2174, n2175, n2176, n2177, n2178, n2179, n2180, n2181, n2182, n2183,
         n2184, n2185, n2186, n2187, n2188, n2189, n2190, n2191, n2192, n2193,
         n2194, n2195, n2196, n2197, n2198, n2199, n2200, n2201, n2202, n2203,
         n2204, n2205, n2206, n2207, n2208, n2209, n2210, n2211, n2212, n2213,
         n2214, n2215, n2216, n2217, n2218, n2219, n2220, n2221, n2222, n2223,
         n2224, n2225, n2226, n2227, n2228, n2229, n2230, n2231, n2232, n2233,
         n2234, n2235, n2236, n2237, n2238, n2239, n2240, n2241, n2242, n2243,
         n2244, n2245, n2246, n2247, n2248, n2249, n2250, n2251, n2252, n2253,
         n2254, n2255, n2256, n2257, n2258, n2259, n2260, n2261, n2262, n2263,
         n2264, n2265, n2266, n2267, n2268, n2269, n2270, n2271, n2272, n2273,
         n2274, n2275, n2276, n2277, n2278, n2279, n2280, n2281, n2282, n2283,
         n2284, n2285, n2286, n2287, n2288, n2289, n2290, n2291, n2292, n2293,
         n2294, n2295, n2296, n2297, n2298, n2299, n2300, n2301, n2302, n2303,
         n2304, n2305, n2306, n2307, n2308, n2309, n2310, n2311, n2312, n2313,
         n2314, n2315, n2316, n2317, n2318, n2319, n2320, n2321, n2322, n2323,
         n2324, n2325, n2326, n2327, n2328, n2329, n2330, n2331, n2332, n2333,
         n2334, n2335, n2336, n2337, n2338, n2339, n2340, n2341, n2342, n2343,
         n2344, n2345, n2346, n2347, n2348, n2349, n2350, n2351, n2352, n2353,
         n2354, n2355, n2356, n2357, n2358, n2359, n2360, n2361, n2362, n2363,
         n2364, n2365, n2366, n2367, n2368, n2369, n2370, n2371, n2372, n2373,
         n2374, n2375, n2376, n2377, n2378, n2379, n2380, n2381, n2382, n2383,
         n2384, n2385, n2386, n2387, n2388, n2389, n2390, n2391, n2392, n2393,
         n2394, n2395, n2396, n2397, n2398, n2399, n2400, n2401, n2402, n2403,
         n2404, n2405, n2406, n2407, n2408, n2409, n2410, n2411, n2412, n2413,
         n2414, n2415, n2416, n2417, n2418, n2419, n2420, n2421, n2422, n24230,
         n2424, n2425, n2426, n2427, n2428, n2429, n2432, n2433, n2434, n2435,
         n2436, n2437, n2438, n2439, n2440, n2442, n2443, n2444, n2445, n2446,
         n2447, n2448, n2449, n2450, n2451, n2452, n2453, n2454, n2455, n2456,
         n2457, n2458, n2459, n2460, n2461, n2462, n2463, n2464, n2465, n2466,
         n2467, n2468, n2469, n2470, n2471, n2472, n2473, n2474, n2475, n2476,
         n2477, n2478, n2479, n2480, n2481, n2482, n2483, n2484, n2485, n2486,
         n2487, n2488, n2489, n2490, n2491, n2492, n2493, n2494, n2495, n2496,
         n2497, n2498, n2499, n2500, n2501, n2502, n2503, n2504, n2505, n2506,
         n2507, n2508, n2509, n2510, n2511, n2512, n2513, n2514, n2515, n2516,
         n2517, n2518, n2519, n2520, n2521, n2522, n2523, n2524, n2525, n2526,
         n2527, n2528, n2529, n2530, n2531, n2532, n2533, n2534, n2535, n2536,
         n2537, n2538, n2540, n2541, n2542, n2543, n2544, n2545, n2546, n2547,
         n2548, n2549, n2550, n2551, n2552, n2553, n2554, n2555, n2556, n2557,
         n2558, n2559, n2560, n2561, n2562, n2563, n2564, n2565, n2566, n2567,
         n2568, n2569, n2570, n2571, n2572, n2573, n2574, n2575, n2576, n2577,
         n2578, n2579, n2580, n2581, n2582, n2583, n2584, n2585, n2586, n2587,
         n2588, n2589, n2590, n2591, n2592, n2593, n2594, n2595, n2596, n2597,
         n2598, n2599, n2600, n2601, n2602, n2603, n2604, n2605, n2606, n2607,
         n2608, n2609, n2610, n2611, n2612, n2613, n2614, n2615, n2616, n2617,
         n2618, n2619, n2620, n2621, n2622, n2623, n2624, n2625, n2626, n2627,
         n2628, n2629, n2630, n2631, n2632, n2633, n2634, n2635, n2636, n2637,
         n2638, n2639, n2640, n2641, n2642, n2643, n2644, n2645, n2646, n2647,
         n2648, n2649, n2650, n2651, n2652, n2653, n2654, n2655, n2656, n2657,
         n2658, n2659, n2660, n2661, n2662, n2663, n2664, n2665, n2666, n2667,
         n2668, n2669, n2670, n2671, n2672, n2673, n2674, n2675, n2676, n2677,
         n2678, n2679, n2680, n2681, n2682, n2683, n2684, n2685, n2686, n2687,
         n2688, n2689, n2690, n2691, n2692, n2693, n2694, n2695, n2696, n2697,
         n2698, n2699, n2700, n2701, n2702, n2703, n2704, n2705, n2706, n2707,
         n2708, n2709, n2710, n2711, n2712, n2713, n2714, n2715, n2716, n2717,
         n2718, n2719, n2720, n2721, n2722, n2723, n2724, n2725, n2726, n2727,
         n2728, n2729, n2730, n2731, n2732, n2733, n2734, n2735, n2736, n2737,
         n2738, n2739, n2740, n2741, n2742, n2743, n2744, n2745, n2746, n2747,
         n2748, n2749, n2750, n2751, n2752, n2753, n2754, n2755, n2756, n2757,
         n2758, n2759, n2760, n2761, n2762, n2763, n2764, n2765, n2766, n2767,
         n2768, n2769, n2770, n2771, n2772, n2773, n2774, n2775, n2776, n2777,
         n2778, n2779, n2780, n2781, n2782, n2783, n2784, n2785, n2786, n2787,
         n2788, n2789, n2790, n2791, n2792, n2793, n2794, n2795, n2796, n2797,
         n2798, n2799, n2800, n2801, n2802, n2803, n2804, n28050, n28060,
         n28070, n28080, n28090, n28100, n28110;
  wire   [3:0] state;
  wire   [2:0] check;
  wire   [2:0] rotation_cnt;
  wire   [31:0] position_block;
  wire   [2:0] rotation_type;
  wire   [2:0] rotation_type_tmp;
  wire   [6:0] store_cnt;
  wire   [9:0] start_pos;
  wire   [9:0] start_tmp;
  wire   [51:0] position_block_line;
  wire   [51:0] position_block_line_tmp;
  wire   [6:0] position_cnt;
  wire   [3:0] sram_rdata_reg;
  wire   [9:6] qrcode_start;
  wire   [7:0] decode_cnt;
  wire   [7:0] decode_length_reg;
  wire   [7:1] decode_length;
  wire   [7:5] length;
  wire   [3:0] nstate;
  wire   [9:0] qrcode_start_whole;
  wire   [6:1] position_tmp;
  wire   [6:0] store_tmp;
  wire   [7:0] decode_tmp;
  wire   [7:0] decode_jis8_data_reg;
  wire   [9:6] qrcode_start_tmp;
  wire   [7:0] mask_pattern;

  CLKAND2X3 C5078 ( .A(n961), .B(length[7]), .Y(N4140) );
  CLKAND2X3 C5074 ( .A(n962), .B(n2348), .Y(N4137) );
  CLKAND2X3 C5070 ( .A(n963), .B(length[5]), .Y(N4134) );
  CLKAND2X3 C5066 ( .A(n2773), .B(n2347), .Y(N4131) );
  CLKAND2X3 C5062 ( .A(n2772), .B(n2787), .Y(N4128) );
  CLKAND2X3 C5058 ( .A(n2771), .B(n2346), .Y(N4125) );
  CLKAND2X3 C5054 ( .A(n2770), .B(n2344), .Y(N4122) );
  CLKAND2X3 C5050 ( .A(n998), .B(n2733), .Y(N4119) );
  CLKAND2X3 C5046 ( .A(n999), .B(n2676), .Y(N4116) );
  CLKAND2X3 C5042 ( .A(n1000), .B(n2631), .Y(N4113) );
  CLKAND2X3 C5038 ( .A(n1001), .B(n2597), .Y(N4110) );
  CLKAND2X3 C5034 ( .A(n1002), .B(n2569), .Y(N4107) );
  CLKAND2X3 C5030 ( .A(n1003), .B(n2535), .Y(N4104) );
  CLKAND2X3 C5026 ( .A(n1004), .B(n2500), .Y(N4101) );
  CLKAND2X3 C5022 ( .A(n1005), .B(n2466), .Y(N4098) );
  CLKAND2X3 C5016 ( .A(n968), .B(n2345), .Y(N4095) );
  CLKAND2X3 C4933 ( .A(n981), .B(position_block_line_tmp[0]), .Y(N4080) );
  CLKAND2X3 C4929 ( .A(n981), .B(position_block_line_tmp[1]), .Y(N4077) );
  CLKAND2X3 C4925 ( .A(n980), .B(position_block_line_tmp[2]), .Y(N4074) );
  CLKAND2X3 C4921 ( .A(n980), .B(position_block_line_tmp[3]), .Y(N4071) );
  CLKAND2X3 C4917 ( .A(n979), .B(position_block_line_tmp[4]), .Y(N4068) );
  CLKAND2X3 C4913 ( .A(n979), .B(position_block_line_tmp[5]), .Y(N4065) );
  CLKAND2X3 C4909 ( .A(n978), .B(position_block_line_tmp[6]), .Y(N4062) );
  CLKAND2X3 C4905 ( .A(n978), .B(position_block_line_tmp[7]), .Y(N4059) );
  CLKAND2X3 C4901 ( .A(n977), .B(position_block_line_tmp[8]), .Y(N4056) );
  CLKAND2X3 C4897 ( .A(n977), .B(position_block_line_tmp[9]), .Y(N4053) );
  CLKAND2X3 C4893 ( .A(n976), .B(position_block_line_tmp[10]), .Y(N4050) );
  CLKAND2X3 C4889 ( .A(n976), .B(position_block_line_tmp[11]), .Y(N4047) );
  CLKAND2X3 C4885 ( .A(n975), .B(position_block_line_tmp[12]), .Y(N4044) );
  CLKAND2X3 C4881 ( .A(n975), .B(position_block_line_tmp[13]), .Y(N4041) );
  CLKAND2X3 C4877 ( .A(n974), .B(position_block_line_tmp[14]), .Y(N4038) );
  CLKAND2X3 C4873 ( .A(n974), .B(position_block_line_tmp[15]), .Y(N4035) );
  CLKAND2X3 C4869 ( .A(n973), .B(position_block_line_tmp[16]), .Y(N4032) );
  CLKAND2X3 C4865 ( .A(n973), .B(position_block_line_tmp[17]), .Y(N4029) );
  CLKAND2X3 C4861 ( .A(n972), .B(position_block_line_tmp[18]), .Y(N4026) );
  CLKAND2X3 C4857 ( .A(n972), .B(position_block_line_tmp[19]), .Y(N4023) );
  CLKAND2X3 C4853 ( .A(n971), .B(position_block_line_tmp[20]), .Y(N4020) );
  CLKAND2X3 C4849 ( .A(n971), .B(position_block_line_tmp[21]), .Y(N4017) );
  CLKAND2X3 C4845 ( .A(n970), .B(position_block_line_tmp[22]), .Y(N4014) );
  CLKAND2X3 C4841 ( .A(n970), .B(position_block_line_tmp[23]), .Y(N4011) );
  CLKAND2X3 C4837 ( .A(n969), .B(position_block_line_tmp[24]), .Y(N4008) );
  CLKAND2X3 C4833 ( .A(n969), .B(position_block_line_tmp[25]), .Y(N4005) );
  CLKAND2X3 C4829 ( .A(n981), .B(position_block_line_tmp[26]), .Y(N4002) );
  CLKAND2X3 C4825 ( .A(n981), .B(position_block_line_tmp[27]), .Y(N3999) );
  CLKAND2X3 C4821 ( .A(n980), .B(position_block_line_tmp[28]), .Y(N3996) );
  CLKAND2X3 C4817 ( .A(n980), .B(position_block_line_tmp[29]), .Y(N3993) );
  CLKAND2X3 C4813 ( .A(n979), .B(position_block_line_tmp[30]), .Y(N3990) );
  CLKAND2X3 C4809 ( .A(n979), .B(position_block_line_tmp[31]), .Y(N3987) );
  CLKAND2X3 C4805 ( .A(n978), .B(position_block_line_tmp[32]), .Y(N3984) );
  CLKAND2X3 C4801 ( .A(n978), .B(position_block_line_tmp[33]), .Y(N3981) );
  CLKAND2X3 C4797 ( .A(n977), .B(position_block_line_tmp[34]), .Y(N3978) );
  CLKAND2X3 C4793 ( .A(n977), .B(position_block_line_tmp[35]), .Y(N3975) );
  CLKAND2X3 C4789 ( .A(n976), .B(position_block_line_tmp[36]), .Y(N3972) );
  CLKAND2X3 C4785 ( .A(n976), .B(position_block_line_tmp[37]), .Y(N3969) );
  CLKAND2X3 C4781 ( .A(n975), .B(position_block_line_tmp[38]), .Y(N3966) );
  CLKAND2X3 C4777 ( .A(n975), .B(position_block_line_tmp[39]), .Y(N3963) );
  CLKAND2X3 C4773 ( .A(n974), .B(position_block_line_tmp[40]), .Y(N3960) );
  CLKAND2X3 C4769 ( .A(n974), .B(position_block_line_tmp[41]), .Y(N3957) );
  CLKAND2X3 C4765 ( .A(n973), .B(position_block_line_tmp[42]), .Y(N3954) );
  CLKAND2X3 C4761 ( .A(n973), .B(position_block_line_tmp[43]), .Y(N3951) );
  CLKAND2X3 C4757 ( .A(n972), .B(position_block_line_tmp[44]), .Y(N3948) );
  CLKAND2X3 C4753 ( .A(n972), .B(position_block_line_tmp[45]), .Y(N3945) );
  CLKAND2X3 C4749 ( .A(n971), .B(position_block_line_tmp[46]), .Y(N3942) );
  CLKAND2X3 C4745 ( .A(n971), .B(position_block_line_tmp[47]), .Y(N3939) );
  CLKAND2X3 C4741 ( .A(n970), .B(position_block_line_tmp[48]), .Y(N3936) );
  CLKAND2X3 C4737 ( .A(n970), .B(position_block_line_tmp[49]), .Y(N3933) );
  CLKAND2X3 C4733 ( .A(n969), .B(position_block_line_tmp[50]), .Y(N3930) );
  CLKAND2X3 C4729 ( .A(n969), .B(position_block_line_tmp[51]), .Y(N3927) );
  CLKAND2X3 C4725 ( .A(n989), .B(position_block[0]), .Y(N3924) );
  CLKAND2X3 C4721 ( .A(n989), .B(position_block[1]), .Y(N3921) );
  CLKAND2X3 C4717 ( .A(n988), .B(position_block[2]), .Y(N3918) );
  CLKAND2X3 C4713 ( .A(n988), .B(position_block[3]), .Y(N3915) );
  CLKAND2X3 C4709 ( .A(n987), .B(position_block[4]), .Y(N3912) );
  CLKAND2X3 C4705 ( .A(n987), .B(position_block[5]), .Y(N3909) );
  CLKAND2X3 C4701 ( .A(n986), .B(position_block[6]), .Y(N3906) );
  CLKAND2X3 C4697 ( .A(n986), .B(position_block[7]), .Y(N3903) );
  CLKAND2X3 C4693 ( .A(n989), .B(position_block[8]), .Y(N3900) );
  CLKAND2X3 C4689 ( .A(n989), .B(position_block[9]), .Y(N3897) );
  CLKAND2X3 C4685 ( .A(n988), .B(position_block[10]), .Y(N3894) );
  CLKAND2X3 C4681 ( .A(n988), .B(position_block[11]), .Y(N3891) );
  CLKAND2X3 C4677 ( .A(n987), .B(position_block[12]), .Y(N3888) );
  CLKAND2X3 C4673 ( .A(n987), .B(position_block[13]), .Y(N3885) );
  CLKAND2X3 C4669 ( .A(n986), .B(position_block[14]), .Y(N3882) );
  CLKAND2X3 C4665 ( .A(n986), .B(position_block[15]), .Y(N3879) );
  CLKAND2X3 C4661 ( .A(n985), .B(position_block[16]), .Y(N3876) );
  CLKAND2X3 C4657 ( .A(n985), .B(position_block[17]), .Y(N3873) );
  CLKAND2X3 C4653 ( .A(n984), .B(position_block[18]), .Y(N3870) );
  CLKAND2X3 C4649 ( .A(n984), .B(position_block[19]), .Y(N3867) );
  CLKAND2X3 C4645 ( .A(n983), .B(position_block[20]), .Y(N3864) );
  CLKAND2X3 C4641 ( .A(n983), .B(position_block[21]), .Y(N3861) );
  CLKAND2X3 C4637 ( .A(n982), .B(position_block[22]), .Y(N3858) );
  CLKAND2X3 C4633 ( .A(n982), .B(position_block[23]), .Y(N3855) );
  CLKAND2X3 C4629 ( .A(n985), .B(position_block[24]), .Y(N3852) );
  CLKAND2X3 C4625 ( .A(n985), .B(position_block[25]), .Y(N3849) );
  CLKAND2X3 C4621 ( .A(n984), .B(position_block[26]), .Y(N3846) );
  CLKAND2X3 C4617 ( .A(n984), .B(position_block[27]), .Y(N3843) );
  CLKAND2X3 C4613 ( .A(n983), .B(position_block[28]), .Y(N3840) );
  CLKAND2X3 C4609 ( .A(n983), .B(position_block[29]), .Y(N3837) );
  CLKAND2X3 C4605 ( .A(n982), .B(position_block[30]), .Y(N3834) );
  CLKAND2X3 C4601 ( .A(n982), .B(position_block[31]), .Y(N3831) );
  DFFQXL qrc_decode_start_reg_reg ( .D(qrc_decode_start), .CK(clk), .Q(
        qrc_decode_start_reg) );
  DFFQXL sram_rdata_reg_reg_3_ ( .D(sram_rdata[3]), .CK(clk), .Q(
        sram_rdata_reg[3]) );
  DFFQXL sram_rdata_reg_reg_2_ ( .D(sram_rdata[2]), .CK(clk), .Q(
        sram_rdata_reg[2]) );
  DFFQXL sram_rdata_reg_reg_1_ ( .D(sram_rdata[1]), .CK(clk), .Q(
        sram_rdata_reg[1]) );
  DFFQXL sram_rdata_reg_reg_0_ ( .D(sram_rdata[0]), .CK(clk), .Q(
        sram_rdata_reg[0]) );
  DFFTRXL mask_pattern_reg_0_ ( .D(rstn), .RN(N2805), .CK(net6038), .Q(
        mask_pattern[0]), .QN(n2768) );
  DFFQXL position_block_line_reg_1__1_ ( .D(position_block_line_tmp[24]), .CK(
        clk), .Q(position_block_line[24]) );
  TLATXL check_reg_2_ ( .G(N1008), .D(check_4), .Q(check[2]) );
  DFFQXL position_block_line_reg_1__11_ ( .D(position_block_line_tmp[14]), 
        .CK(clk), .Q(position_block_line[14]) );
  TLATXL check_reg_0_ ( .G(N1008), .D(N1009), .Q(check[0]) );
  DFFQXL position_cnt_reg_1_ ( .D(position_tmp[1]), .CK(clk), .Q(
        position_cnt[1]) );
  DFFQXL position_cnt_reg_2_ ( .D(position_tmp[2]), .CK(clk), .Q(
        position_cnt[2]) );
  DFFQXL position_cnt_reg_3_ ( .D(position_tmp[3]), .CK(clk), .Q(
        position_cnt[3]) );
  DFFQXL position_cnt_reg_4_ ( .D(position_tmp[4]), .CK(clk), .Q(
        position_cnt[4]) );
  DFFQXL position_cnt_reg_5_ ( .D(position_tmp[5]), .CK(clk), .Q(
        position_cnt[5]) );
  DFFQXL position_block_line_reg_0__24_ ( .D(position_block_line_tmp[27]), 
        .CK(clk), .Q(position_block_line[27]) );
  DFFQXL position_block_line_reg_0__25_ ( .D(position_block_line_tmp[26]), 
        .CK(clk), .Q(position_block_line[26]) );
  DFFQXL position_block_line_reg_1__24_ ( .D(position_block_line_tmp[1]), .CK(
        clk), .Q(position_block_line[1]) );
  DFFQXL position_block_line_reg_1__25_ ( .D(position_block_line_tmp[0]), .CK(
        clk), .Q(position_block_line[0]) );
  DFFQXL position_block_line_reg_0__22_ ( .D(position_block_line_tmp[29]), 
        .CK(clk), .Q(position_block_line[29]) );
  DFFQXL position_block_line_reg_0__23_ ( .D(position_block_line_tmp[28]), 
        .CK(clk), .Q(position_block_line[28]) );
  DFFQXL position_block_line_reg_1__22_ ( .D(position_block_line_tmp[3]), .CK(
        clk), .Q(position_block_line[3]) );
  DFFQXL position_block_line_reg_1__23_ ( .D(position_block_line_tmp[2]), .CK(
        clk), .Q(position_block_line[2]) );
  DFFQXL position_block_line_reg_0__20_ ( .D(position_block_line_tmp[31]), 
        .CK(clk), .Q(position_block_line[31]) );
  DFFQXL position_block_line_reg_0__21_ ( .D(position_block_line_tmp[30]), 
        .CK(clk), .Q(position_block_line[30]) );
  DFFQXL position_block_line_reg_1__20_ ( .D(position_block_line_tmp[5]), .CK(
        clk), .Q(position_block_line[5]) );
  DFFQXL position_block_line_reg_1__21_ ( .D(position_block_line_tmp[4]), .CK(
        clk), .Q(position_block_line[4]) );
  DFFQXL position_block_line_reg_0__18_ ( .D(position_block_line_tmp[33]), 
        .CK(clk), .Q(position_block_line[33]) );
  DFFQXL position_block_line_reg_0__16_ ( .D(position_block_line_tmp[35]), 
        .CK(clk), .Q(position_block_line[35]) );
  DFFQXL position_block_line_reg_0__14_ ( .D(position_block_line_tmp[37]), 
        .CK(clk), .Q(position_block_line[37]) );
  DFFQXL position_block_line_reg_0__12_ ( .D(position_block_line_tmp[39]), 
        .CK(clk), .Q(position_block_line[39]) );
  DFFQXL position_block_line_reg_0__10_ ( .D(position_block_line_tmp[41]), 
        .CK(clk), .Q(position_block_line[41]) );
  DFFQXL position_block_line_reg_0__19_ ( .D(position_block_line_tmp[32]), 
        .CK(clk), .Q(position_block_line[32]) );
  DFFQXL position_block_line_reg_0__17_ ( .D(position_block_line_tmp[34]), 
        .CK(clk), .Q(position_block_line[34]) );
  DFFQXL position_block_line_reg_0__15_ ( .D(position_block_line_tmp[36]), 
        .CK(clk), .Q(position_block_line[36]) );
  DFFQXL position_block_line_reg_0__13_ ( .D(position_block_line_tmp[38]), 
        .CK(clk), .Q(position_block_line[38]) );
  DFFQXL position_block_line_reg_0__11_ ( .D(position_block_line_tmp[40]), 
        .CK(clk), .Q(position_block_line[40]) );
  DFFQXL position_block_line_reg_1__18_ ( .D(position_block_line_tmp[7]), .CK(
        clk), .Q(position_block_line[7]) );
  DFFQXL position_block_line_reg_1__16_ ( .D(position_block_line_tmp[9]), .CK(
        clk), .Q(position_block_line[9]) );
  DFFQXL position_block_line_reg_1__14_ ( .D(position_block_line_tmp[11]), 
        .CK(clk), .Q(position_block_line[11]) );
  DFFQXL position_block_line_reg_1__12_ ( .D(position_block_line_tmp[13]), 
        .CK(clk), .Q(position_block_line[13]) );
  DFFQXL position_block_line_reg_1__10_ ( .D(position_block_line_tmp[15]), 
        .CK(clk), .Q(position_block_line[15]) );
  DFFQXL position_block_line_reg_1__19_ ( .D(position_block_line_tmp[6]), .CK(
        clk), .Q(position_block_line[6]) );
  DFFQXL position_block_line_reg_1__17_ ( .D(position_block_line_tmp[8]), .CK(
        clk), .Q(position_block_line[8]) );
  DFFQXL position_block_line_reg_1__15_ ( .D(position_block_line_tmp[10]), 
        .CK(clk), .Q(position_block_line[10]) );
  DFFQXL position_block_line_reg_1__13_ ( .D(position_block_line_tmp[12]), 
        .CK(clk), .Q(position_block_line[12]) );
  DFFQXL position_block_line_reg_0__8_ ( .D(position_block_line_tmp[43]), .CK(
        clk), .Q(position_block_line[43]) );
  DFFQXL position_block_line_reg_0__9_ ( .D(position_block_line_tmp[42]), .CK(
        clk), .Q(position_block_line[42]) );
  DFFQXL position_block_line_reg_1__8_ ( .D(position_block_line_tmp[17]), .CK(
        clk), .Q(position_block_line[17]) );
  DFFQXL position_block_line_reg_1__9_ ( .D(position_block_line_tmp[16]), .CK(
        clk), .Q(position_block_line[16]) );
  DFFQXL position_block_line_reg_0__6_ ( .D(position_block_line_tmp[45]), .CK(
        clk), .Q(position_block_line[45]) );
  DFFQXL position_block_line_reg_0__7_ ( .D(position_block_line_tmp[44]), .CK(
        clk), .Q(position_block_line[44]) );
  DFFQXL position_block_line_reg_1__6_ ( .D(position_block_line_tmp[19]), .CK(
        clk), .Q(position_block_line[19]) );
  DFFQXL position_block_line_reg_1__7_ ( .D(position_block_line_tmp[18]), .CK(
        clk), .Q(position_block_line[18]) );
  DFFQXL position_block_line_reg_0__4_ ( .D(position_block_line_tmp[47]), .CK(
        clk), .Q(position_block_line[47]) );
  DFFQXL position_block_line_reg_0__5_ ( .D(position_block_line_tmp[46]), .CK(
        clk), .Q(position_block_line[46]) );
  DFFQXL position_block_line_reg_1__4_ ( .D(position_block_line_tmp[21]), .CK(
        clk), .Q(position_block_line[21]) );
  DFFQXL position_block_line_reg_1__5_ ( .D(position_block_line_tmp[20]), .CK(
        clk), .Q(position_block_line[20]) );
  DFFQXL position_block_line_reg_0__2_ ( .D(position_block_line_tmp[49]), .CK(
        clk), .Q(position_block_line[49]) );
  DFFQXL position_block_line_reg_0__0_ ( .D(position_block_line_tmp[51]), .CK(
        clk), .Q(position_block_line[51]) );
  DFFQXL position_block_line_reg_0__3_ ( .D(position_block_line_tmp[48]), .CK(
        clk), .Q(position_block_line[48]) );
  DFFQXL position_block_line_reg_0__1_ ( .D(position_block_line_tmp[50]), .CK(
        clk), .Q(position_block_line[50]) );
  TLATXL check_reg_1_ ( .G(N1008), .D(N1010), .Q(check[1]), .QN(n2756) );
  DFFQXL position_block_line_reg_1__2_ ( .D(position_block_line_tmp[23]), .CK(
        clk), .Q(position_block_line[23]) );
  DFFQXL position_block_line_reg_1__0_ ( .D(position_block_line_tmp[25]), .CK(
        clk), .Q(position_block_line[25]) );
  DFFQXL position_block_line_reg_1__3_ ( .D(position_block_line_tmp[22]), .CK(
        clk), .Q(position_block_line[22]) );
  DFFQXL position_cnt_reg_6_ ( .D(position_tmp[6]), .CK(clk), .Q(
        position_cnt[6]) );
  DFFQXL qrc_decode_finish_reg ( .D(qrc_decode_finish_reg0), .CK(clk), .Q(
        qrc_decode_finish) );
  DFFQXL decode_jis8_valid_reg ( .D(decode_jis8_valid_reg0), .CK(clk), .Q(
        decode_jis8_valid) );
  DFFQXL decode_cnt_reg_1_ ( .D(decode_tmp[1]), .CK(clk), .Q(decode_cnt[1]) );
  DFFQXL decode_cnt_reg_4_ ( .D(decode_tmp[4]), .CK(clk), .Q(decode_cnt[4]) );
  DFFQXL decode_cnt_reg_6_ ( .D(decode_tmp[6]), .CK(clk), .Q(decode_cnt[6]) );
  DFFQXL decode_cnt_reg_7_ ( .D(decode_tmp[7]), .CK(clk), .Q(decode_cnt[7]) );
  DFFQXL decode_length_reg_reg_0_ ( .D(n2795), .CK(net6022), .Q(
        decode_length_reg[0]) );
  DFFQXL decode_length_reg_reg_1_ ( .D(n2794), .CK(net6022), .Q(
        decode_length_reg[1]) );
  DFFQXL decode_length_reg_reg_2_ ( .D(n2793), .CK(net6022), .Q(
        decode_length_reg[2]) );
  DFFQXL decode_length_reg_reg_3_ ( .D(n2792), .CK(net6022), .Q(
        decode_length_reg[3]) );
  DFFQXL decode_length_reg_reg_4_ ( .D(n2791), .CK(net6022), .Q(
        decode_length_reg[4]) );
  DFFQXL decode_length_reg_reg_5_ ( .D(n2790), .CK(net6022), .Q(
        decode_length_reg[5]) );
  DFFQXL decode_length_reg_5_ ( .D(decode_length_reg[5]), .CK(clk), .Q(
        decode_length[5]) );
  DFFQXL decode_length_reg_reg_6_ ( .D(n2789), .CK(net6022), .Q(
        decode_length_reg[6]) );
  DFFQXL decode_length_reg_6_ ( .D(decode_length_reg[6]), .CK(clk), .Q(
        decode_length[6]) );
  DFFQXL decode_length_reg_reg_7_ ( .D(n2788), .CK(net6022), .Q(
        decode_length_reg[7]) );
  DFFQXL decode_length_reg_7_ ( .D(decode_length_reg[7]), .CK(clk), .Q(
        decode_length[7]) );
  DFFQXL start_pos_reg_6_ ( .D(net9654), .CK(net6012), .Q(start_pos[6]) );
  DFFQXL store_cnt_reg_6_ ( .D(store_tmp[6]), .CK(clk), .Q(store_cnt[6]) );
  DFFQXL store_cnt_reg_5_ ( .D(store_tmp[5]), .CK(clk), .Q(store_cnt[5]) );
  DFFTRXL start_pos_reg_2_ ( .D(n2784), .RN(start_tmp[2]), .CK(net6012), .Q(
        start_pos[2]), .QN(n1301) );
  DFFTRXL start_pos_reg_1_ ( .D(n2784), .RN(start_tmp[1]), .CK(net6012), .Q(
        start_pos[1]), .QN(n2769) );
  DFFTRXL start_pos_reg_0_ ( .D(n2784), .RN(start_tmp[0]), .CK(net6012), .Q(
        start_pos[0]), .QN(n1038) );
  DFFTRXL mask_pattern_reg_1_ ( .D(n2784), .RN(N2806), .CK(net6038), .Q(
        mask_pattern[1]) );
  DFFTRXL mask_pattern_reg_2_ ( .D(n2784), .RN(N2807), .CK(net6038), .Q(
        mask_pattern[2]) );
  DFFTRXL mask_pattern_reg_3_ ( .D(n2784), .RN(N2808), .CK(net6038), .Q(
        mask_pattern[3]) );
  DFFTRXL mask_pattern_reg_7_ ( .D(n2784), .RN(N2812), .CK(net6038), .Q(
        mask_pattern[7]), .QN(n2766) );
  DFFTRXL mask_pattern_reg_6_ ( .D(n2784), .RN(N2811), .CK(net6038), .Q(
        mask_pattern[6]) );
  DFFTRXL mask_pattern_reg_5_ ( .D(n2784), .RN(N2810), .CK(net6038), .Q(
        mask_pattern[5]) );
  DFFQXL start_pos_reg_7_ ( .D(net9636), .CK(net6012), .Q(start_pos[7]) );
  DFFQXL rotation_cnt_reg_0_ ( .D(n2785), .CK(net6027), .Q(rotation_cnt[0]) );
  DFFQXL rotation_cnt_reg_1_ ( .D(n2797), .CK(net6027), .Q(rotation_cnt[1]) );
  DFFQXL rotation_cnt_reg_2_ ( .D(n2796), .CK(net6027), .Q(rotation_cnt[2]) );
  DFFQXL rotation_type_reg_0_ ( .D(rotation_type_tmp[0]), .CK(net6032), .Q(
        rotation_type[0]) );
  DFFQXL rotation_type_reg_1_ ( .D(rotation_type_tmp[1]), .CK(net6032), .Q(
        rotation_type[1]) );
  DFFQXL rotation_type_reg_2_ ( .D(rotation_type_tmp[2]), .CK(net6032), .Q(
        rotation_type[2]) );
  DFFQXL sram_raddr_reg_0_ ( .D(n2777), .CK(clk), .Q(sram_raddr[0]) );
  DFFQXL sram_raddr_reg_1_ ( .D(n2776), .CK(clk), .Q(sram_raddr[1]) );
  DFFQXL sram_raddr_reg_2_ ( .D(n2775), .CK(clk), .Q(sram_raddr[2]) );
  DFFQXL sram_raddr_reg_3_ ( .D(n2774), .CK(clk), .Q(sram_raddr[3]) );
  DFFQXL sram_raddr_reg_4_ ( .D(n2762), .CK(clk), .Q(sram_raddr[4]) );
  DFFQXL sram_raddr_reg_5_ ( .D(n2761), .CK(clk), .Q(sram_raddr[5]) );
  DFFQXL sram_raddr_reg_6_ ( .D(n2760), .CK(clk), .Q(sram_raddr[6]) );
  DFFQXL sram_raddr_reg_7_ ( .D(n2759), .CK(clk), .Q(sram_raddr[7]) );
  DFFQXL sram_raddr_reg_8_ ( .D(n2758), .CK(clk), .Q(sram_raddr[8]) );
  DFFQXL sram_raddr_reg_9_ ( .D(n2783), .CK(clk), .Q(sram_raddr[9]) );
  DFFQXL decode_jis8_data_reg_0_ ( .D(decode_jis8_data_reg[0]), .CK(clk), .Q(
        decode_jis8_data[0]) );
  DFFQXL decode_jis8_data_reg_2_ ( .D(decode_jis8_data_reg[2]), .CK(clk), .Q(
        decode_jis8_data[2]) );
  DFFQXL decode_jis8_data_reg_6_ ( .D(decode_jis8_data_reg[6]), .CK(clk), .Q(
        decode_jis8_data[6]) );
  DFFQXL decode_jis8_data_reg_1_ ( .D(decode_jis8_data_reg[1]), .CK(clk), .Q(
        decode_jis8_data[1]) );
  DFFQXL decode_jis8_data_reg_3_ ( .D(decode_jis8_data_reg[3]), .CK(clk), .Q(
        decode_jis8_data[3]) );
  DFFQXL decode_jis8_data_reg_4_ ( .D(decode_jis8_data_reg[4]), .CK(clk), .Q(
        decode_jis8_data[4]) );
  DFFQXL decode_jis8_data_reg_5_ ( .D(decode_jis8_data_reg[5]), .CK(clk), .Q(
        decode_jis8_data[5]) );
  DFFQXL decode_jis8_data_reg_7_ ( .D(decode_jis8_data_reg[7]), .CK(clk), .Q(
        decode_jis8_data[7]) );
  DFFQXL qrcode_start_reg_9_ ( .D(N1095), .CK(net6017), .Q(qrcode_start[9]) );
  DFFQXL qrcode_start_reg_8_ ( .D(N1094), .CK(net6017), .Q(qrcode_start[8]) );
  DFFQXL qrcode_start_reg_7_ ( .D(N1093), .CK(net6017), .Q(qrcode_start[7]) );
  DFFQXL qrcode_start_reg_6_ ( .D(N1092), .CK(net6017), .Q(qrcode_start[6]) );
  DFFQXL qrcode_start_whole_reg_6_ ( .D(qrcode_start_tmp[6]), .CK(clk), .Q(
        qrcode_start_whole[6]) );
  DFFQXL qrcode_start_whole_reg_7_ ( .D(qrcode_start_tmp[7]), .CK(clk), .Q(
        qrcode_start_whole[7]) );
  DFFQXL qrcode_start_whole_reg_8_ ( .D(qrcode_start_tmp[8]), .CK(clk), .Q(
        qrcode_start_whole[8]) );
  DFFQXL qrcode_start_whole_reg_9_ ( .D(qrcode_start_tmp[9]), .CK(clk), .Q(
        qrcode_start_whole[9]) );
  DFFQXL qrcode_start_reg_5_ ( .D(N1091), .CK(net6017), .Q(N2948) );
  DFFQXL qrcode_start_whole_reg_5_ ( .D(N2948), .CK(clk), .Q(
        qrcode_start_whole[5]) );
  DFFQXL qrcode_start_reg_4_ ( .D(N1090), .CK(net6017), .Q(N2947) );
  DFFQXL qrcode_start_whole_reg_4_ ( .D(N2947), .CK(clk), .Q(
        qrcode_start_whole[4]) );
  DFFQXL qrcode_start_reg_3_ ( .D(N1089), .CK(net6017), .Q(N2946) );
  DFFQXL qrcode_start_whole_reg_3_ ( .D(N2946), .CK(clk), .Q(
        qrcode_start_whole[3]) );
  DFFQXL qrcode_start_reg_2_ ( .D(N1088), .CK(net6017), .Q(N2945) );
  DFFQXL qrcode_start_whole_reg_2_ ( .D(N2945), .CK(clk), .Q(
        qrcode_start_whole[2]) );
  DFFQXL qrcode_start_reg_1_ ( .D(N1087), .CK(net6017), .Q(N2944) );
  DFFQXL qrcode_start_whole_reg_1_ ( .D(N2944), .CK(clk), .Q(
        qrcode_start_whole[1]) );
  DFFQXL qrcode_start_reg_0_ ( .D(N1086), .CK(net6017), .Q(N2943) );
  DFFQXL qrcode_start_whole_reg_0_ ( .D(N2943), .CK(clk), .Q(
        qrcode_start_whole[0]) );
  ADDFX1 intadd_0_U4 ( .A(sram_rdata_reg[1]), .B(mask_pattern[1]), .CI(
        intadd_0_CI), .CO(intadd_0_n3), .S(intadd_0_SUM_0_) );
  ADDFX1 intadd_0_U3 ( .A(sram_rdata_reg[2]), .B(mask_pattern[2]), .CI(
        intadd_0_n3), .CO(intadd_0_n2), .S(intadd_0_SUM_1_) );
  ADDFX1 intadd_0_U2 ( .A(sram_rdata_reg[3]), .B(mask_pattern[3]), .CI(
        intadd_0_n2), .CO(intadd_0_n1), .S(intadd_0_SUM_2_) );
  DFFQXL store_cnt_reg_4_ ( .D(store_tmp[4]), .CK(clk), .Q(store_cnt[4]) );
  DFFQXL store_cnt_reg_1_ ( .D(store_tmp[1]), .CK(clk), .Q(store_cnt[1]) );
  DFFQXL store_cnt_reg_0_ ( .D(store_tmp[0]), .CK(clk), .Q(store_cnt[0]) );
  DFFTRXL start_pos_reg_8_ ( .D(n2784), .RN(start_tmp[8]), .CK(net6012), .Q(
        start_pos[8]), .QN(n2782) );
  DFFTRXL start_pos_reg_9_ ( .D(n2784), .RN(start_tmp[9]), .CK(net6012), .Q(
        start_pos[9]), .QN(n2781) );
  DFFTRXL start_pos_reg_5_ ( .D(n2784), .RN(start_tmp[5]), .CK(net6012), .Q(
        start_pos[5]), .QN(n2780) );
  DFFTRXL start_pos_reg_4_ ( .D(n2784), .RN(start_tmp[4]), .CK(net6012), .Q(
        start_pos[4]), .QN(n2765) );
  DFFTRXL start_pos_reg_3_ ( .D(n2784), .RN(start_tmp[3]), .CK(net6012), .Q(
        start_pos[3]), .QN(n2778) );
  DFFQXL decode_cnt_reg_3_ ( .D(decode_tmp[3]), .CK(clk), .Q(decode_cnt[3]) );
  DFFTRXL state_reg_1_ ( .D(rstn), .RN(nstate[1]), .CK(clk), .Q(state[1]), 
        .QN(n2767) );
  DFFQXL decode_cnt_reg_5_ ( .D(decode_tmp[5]), .CK(clk), .Q(decode_cnt[5]) );
  DFFTRXL mask_pattern_reg_4_ ( .D(n2784), .RN(N2809), .CK(net6038), .Q(
        mask_pattern[4]), .QN(n2779) );
  NAND2BXL U3 ( .AN(start_tmp[7]), .B(n2784), .Y(net9636) );
  NAND2BXL U4 ( .AN(start_tmp[6]), .B(n2784), .Y(net9654) );
  DFFTRX2 state_reg_3_ ( .D(rstn), .RN(nstate[3]), .CK(clk), .Q(state[3]), 
        .QN(n2764) );
  DFFQX2 decode_length_reg_2_ ( .D(decode_length_reg[2]), .CK(clk), .Q(
        decode_length[2]) );
  DFFQX1 decode_length_reg_0_ ( .D(decode_length_reg[0]), .CK(clk), .Q(N2423)
         );
  DFFQXL store_cnt_reg_3_ ( .D(store_tmp[3]), .CK(clk), .Q(store_cnt[3]) );
  DFFQXL store_cnt_reg_2_ ( .D(store_tmp[2]), .CK(clk), .Q(store_cnt[2]) );
  DFFQX1 decode_length_reg_3_ ( .D(decode_length_reg[3]), .CK(clk), .Q(
        decode_length[3]) );
  DFFQXL decode_cnt_reg_2_ ( .D(decode_tmp[2]), .CK(clk), .Q(decode_cnt[2]) );
  DFFQXL decode_cnt_reg_0_ ( .D(decode_tmp[0]), .CK(clk), .Q(decode_cnt[0]) );
  DFFTRXL state_reg_0_ ( .D(n2784), .RN(nstate[0]), .CK(clk), .Q(state[0]), 
        .QN(n2763) );
  DFFQXL position_cnt_reg_0_ ( .D(n2786), .CK(clk), .Q(position_cnt[0]) );
  OAI211XL U1256 ( .A0(n1930), .A1(n1761), .B0(n1760), .C0(n1759), .Y(n1762)
         );
  XNOR2X1 U1267 ( .A(n1869), .B(n1868), .Y(n1071) );
  NOR2BX1 U1274 ( .AN(n1924), .B(n1300), .Y(n1903) );
  ADDHX1 U1275 ( .A(N2948), .B(n1487), .CO(n1481), .S(n1488) );
  NOR2BX1 U1279 ( .AN(n2287), .B(n2419), .Y(n1530) );
  ADDHX1 U1280 ( .A(N2946), .B(n1504), .CO(n1498), .S(n1505) );
  OAI2BB1XL U1282 ( .A0N(n1719), .A1N(n1639), .B0(n1638), .Y(n1640) );
  ADDHX1 U1285 ( .A(position_cnt[0]), .B(N2943), .CO(n1516), .S(n1521) );
  OAI211X1 U1286 ( .A0(n1180), .A1(n1685), .B0(n1755), .C0(n1684), .Y(n1707)
         );
  NOR2XL U1293 ( .A(n2798), .B(n1588), .Y(n1169) );
  OAI22XL U1296 ( .A0(n1848), .A1(n28060), .B0(n1847), .B1(n1834), .Y(n1936)
         );
  NOR2X1 U1297 ( .A(n1739), .B(n1688), .Y(n1610) );
  NAND2XL U1298 ( .A(n1746), .B(n1670), .Y(n1031) );
  NOR2XL U1300 ( .A(n1179), .B(n28110), .Y(n1109) );
  AOI21XL U1302 ( .A0(n1031), .A1(n1030), .B0(decode_cnt[2]), .Y(n1675) );
  NAND2XL U1304 ( .A(n1697), .B(n1308), .Y(n1030) );
  NOR2X1 U1305 ( .A(n2440), .B(n1372), .Y(n1688) );
  NOR2XL U1306 ( .A(n1374), .B(n1554), .Y(n1726) );
  NOR2XL U1307 ( .A(n2435), .B(n1386), .Y(n1689) );
  NOR4XL U1308 ( .A(position_block[11]), .B(position_block[12]), .C(
        position_block[10]), .D(position_block[13]), .Y(n2198) );
  OAI211XL U1309 ( .A0(n2687), .A1(n2614), .B0(n2636), .C0(n2584), .Y(n2585)
         );
  OAI211XL U1310 ( .A0(n2708), .A1(n2687), .B0(n2525), .C0(n2524), .Y(n2526)
         );
  AOI31XL U1311 ( .A0(n2719), .A1(n2680), .A2(n2718), .B0(n2633), .Y(n2571) );
  NOR2BXL U1312 ( .AN(n1310), .B(n1946), .Y(n1285) );
  NOR4XL U1313 ( .A(n2217), .B(n2216), .C(position_block[17]), .D(
        position_block[13]), .Y(n2218) );
  NOR2BXL U1314 ( .AN(n2348), .B(n1037), .Y(n1118) );
  OAI211XL U1315 ( .A0(n2703), .A1(n2715), .B0(n2702), .C0(n2701), .Y(n2725)
         );
  OAI211XL U1316 ( .A0(n2613), .A1(n2703), .B0(n2612), .C0(n2611), .Y(n2625)
         );
  OAI211XL U1317 ( .A0(n2644), .A1(n2600), .B0(n2469), .C0(n2468), .Y(n2470)
         );
  OAI211XL U1318 ( .A0(n2709), .A1(n2711), .B0(n2528), .C0(n2527), .Y(n2529)
         );
  OAI2BB1XL U1319 ( .A0N(n2510), .A1N(n2545), .B0(n2447), .Y(n2452) );
  XNOR2XL U1320 ( .A(n1109), .B(n1178), .Y(n1108) );
  NOR4XL U1321 ( .A(position_block_line[43]), .B(position_block_line[39]), .C(
        position_block_line[35]), .D(position_block_line[33]), .Y(n1998) );
  OAI2BB1XL U1322 ( .A0N(n2738), .A1N(n2737), .B0(n2736), .Y(n2744) );
  OAI31XL U1323 ( .A0(n2563), .A1(n2562), .A2(n2561), .B0(n2726), .Y(n2564) );
  NOR2BXL U1324 ( .AN(start_pos[7]), .B(n2380), .Y(n2379) );
  OAI211XL U1325 ( .A0(start_pos[6]), .A1(n2239), .B0(n2380), .C0(n2376), .Y(
        n2240) );
  NOR4XL U1326 ( .A(position_block_line[14]), .B(position_block_line[12]), .C(
        position_block_line[10]), .D(position_block_line[8]), .Y(n2008) );
  OAI31XL U1327 ( .A0(position_cnt[2]), .A1(n2147), .A2(n2120), .B0(n2145), 
        .Y(n2129) );
  OAI211XL U1328 ( .A0(store_cnt[2]), .A1(n2066), .B0(n2065), .C0(n2264), .Y(
        n2067) );
  NOR4XL U1329 ( .A(n2746), .B(n2745), .C(n2744), .D(n2743), .Y(n2748) );
  OAI2BB1XL U1330 ( .A0N(qrcode_start[6]), .A1N(qrcode_start[7]), .B0(n2282), 
        .Y(n2278) );
  OAI211XL U1331 ( .A0(n2594), .A1(n2669), .B0(n2593), .C0(n2592), .Y(n2596)
         );
  OAI211XL U1332 ( .A0(n2463), .A1(n2668), .B0(n2462), .C0(n2461), .Y(n2465)
         );
  OAI2BB1XL U1333 ( .A0N(n2224), .A1N(n2223), .B0(n2236), .Y(n2244) );
  AOI31XL U1336 ( .A0(n2149), .A1(n2148), .A2(n2147), .B0(n2146), .Y(n2388) );
  OAI31XL U1337 ( .A0(n2418), .A1(n2764), .A2(n999), .B0(n2417), .Y(N1243) );
  OAI2BB1XL U1338 ( .A0N(start_pos[3]), .A1N(n2268), .B0(n2267), .Y(
        store_tmp[3]) );
  OAI2BB1XL U1341 ( .A0N(n2275), .A1N(intadd_0_SUM_0_), .B0(n2257), .Y(N2810)
         );
  OAI2BB1XL U1342 ( .A0N(start_pos[5]), .A1N(n2268), .B0(n2259), .Y(
        store_tmp[5]) );
  NOR2BXL U1343 ( .AN(n2069), .B(n2068), .Y(qrc_decode_finish_reg0) );
  XNOR2X1 U1344 ( .A(n2326), .B(n2325), .Y(n2327) );
  NOR3X1 U1345 ( .A(rotation_type[2]), .B(n2238), .C(n2245), .Y(n1421) );
  OAI211X1 U1348 ( .A0(n2736), .A1(n2296), .B0(n2295), .C0(n2294), .Y(
        nstate[1]) );
  INVXL U1349 ( .A(n1446), .Y(n2345) );
  OR2XL U1350 ( .A(N4116), .B(n2356), .Y(n2676) );
  OR2X1 U1351 ( .A(N4131), .B(n1441), .Y(n2347) );
  OR2XL U1352 ( .A(N4137), .B(n1439), .Y(n2348) );
  OR2XL U1353 ( .A(N4113), .B(n2354), .Y(n2631) );
  OAI21XL U1354 ( .A0(n1004), .A1(n2355), .B0(n2350), .Y(n2500) );
  OAI21XL U1355 ( .A0(n1003), .A1(n2355), .B0(n2351), .Y(n2535) );
  OAI21XL U1356 ( .A0(n1002), .A1(n2355), .B0(n2352), .Y(n2569) );
  OAI21XL U1357 ( .A0(n1001), .A1(n2355), .B0(n2353), .Y(n2597) );
  NAND2XL U1358 ( .A(n1410), .B(n1443), .Y(n1381) );
  OAI211X1 U1359 ( .A0(n2532), .A1(n2669), .B0(n2531), .C0(n2530), .Y(n2534)
         );
  XNOR2X1 U1360 ( .A(n1956), .B(n1232), .Y(n2298) );
  OAI211X1 U1361 ( .A0(n2730), .A1(n2729), .B0(n2728), .C0(n2727), .Y(n2732)
         );
  OAI211X1 U1362 ( .A0(n2628), .A1(n2729), .B0(n2627), .C0(n2626), .Y(n2630)
         );
  OAI211X1 U1363 ( .A0(n2673), .A1(n2729), .B0(n2672), .C0(n2671), .Y(n2675)
         );
  NOR2BX1 U1364 ( .AN(n1448), .B(n2021), .Y(n1277) );
  OAI211X1 U1365 ( .A0(n2497), .A1(n2669), .B0(n2496), .C0(n2495), .Y(n2499)
         );
  XNOR2X1 U1366 ( .A(n1956), .B(n1773), .Y(n1049) );
  OAI31X1 U1367 ( .A0(n2719), .A1(n2718), .A2(n2717), .B0(n2716), .Y(n2720) );
  OAI211X1 U1369 ( .A0(n2706), .A1(n2687), .B0(n2637), .C0(n2636), .Y(n2639)
         );
  NOR4X1 U1370 ( .A(n2650), .B(n2649), .C(n2648), .D(n2647), .Y(n2670) );
  NOR4X1 U1371 ( .A(n2508), .B(n2507), .C(n2506), .D(n2505), .Y(n2532) );
  OAI211X1 U1372 ( .A0(n2651), .A1(n2492), .B0(n2491), .C0(n2490), .Y(n2493)
         );
  OAI211X1 U1374 ( .A0(n2709), .A1(n2708), .B0(n2707), .C0(n2706), .Y(n2713)
         );
  XNOR2XL U1375 ( .A(n1956), .B(n1235), .Y(n1227) );
  OAI211X1 U1376 ( .A0(n2662), .A1(n2661), .B0(n2660), .C0(n2659), .Y(n2663)
         );
  XNOR2X1 U1377 ( .A(n1231), .B(n1765), .Y(n1135) );
  OAI211X1 U1378 ( .A0(n2646), .A1(n2708), .B0(n2572), .C0(n2571), .Y(n2573)
         );
  NOR4X1 U1380 ( .A(n2620), .B(n2619), .C(n2618), .D(n2617), .Y(n2621) );
  NOR2BX1 U1382 ( .AN(n2342), .B(n1108), .Y(n1106) );
  OR2XL U1383 ( .A(n1803), .B(n1802), .Y(n2311) );
  OAI211X1 U1385 ( .A0(n2662), .A1(n2517), .B0(n2482), .C0(n2481), .Y(n2494)
         );
  OAI211X1 U1386 ( .A0(n2546), .A1(n2543), .B0(n2542), .C0(n2541), .Y(n2544)
         );
  OAI211X1 U1387 ( .A0(n2662), .A1(n2652), .B0(n2459), .C0(n2458), .Y(n2460)
         );
  XOR2XL U1388 ( .A(n1201), .B(n1781), .Y(n1789) );
  OAI211X1 U1390 ( .A0(n2645), .A1(n2683), .B0(n2549), .C0(n2681), .Y(n2556)
         );
  ADDFX1 U1391 ( .A(n1807), .B(n1806), .CI(n1805), .CO(n1781), .S(n1815) );
  OAI211X1 U1392 ( .A0(n2560), .A1(n2662), .B0(n2559), .C0(n2558), .Y(n2561)
         );
  OAI211X1 U1393 ( .A0(n2695), .A1(n2666), .B0(n2548), .C0(n2678), .Y(n2681)
         );
  XNOR2X1 U1396 ( .A(n1269), .B(n1434), .Y(n1435) );
  XNOR2X1 U1397 ( .A(n1244), .B(n12430), .Y(n2310) );
  OAI2BB1X1 U1401 ( .A0N(n1523), .A1N(n1989), .B0(n1098), .Y(n1775) );
  XNOR2X1 U1402 ( .A(n1799), .B(n1047), .Y(n2316) );
  OR2XL U1404 ( .A(n1938), .B(n1955), .Y(n1046) );
  NOR2BX1 U1405 ( .AN(n2467), .B(n2522), .Y(n2613) );
  AND2XL U1406 ( .A(n1040), .B(n1477), .Y(n1098) );
  NOR2BX1 U1407 ( .AN(n1925), .B(n1926), .Y(n1906) );
  OAI2BB1XL U1408 ( .A0N(n1161), .A1N(n1620), .B0(n1158), .Y(n1156) );
  OAI22XL U1409 ( .A0(n1537), .A1(n1959), .B0(n1536), .B1(n28080), .Y(n1795)
         );
  XNOR2X1 U1410 ( .A(n1798), .B(n1797), .Y(n1799) );
  OAI211XL U1411 ( .A0(n2742), .A1(n2741), .B0(n2740), .C0(n2739), .Y(n2743)
         );
  ADDFX1 U1412 ( .A(n1883), .B(n1882), .CI(n1881), .CO(n1819), .S(n2328) );
  XNOR2X1 U1413 ( .A(n1821), .B(n1820), .Y(n10880) );
  AND2XL U1415 ( .A(n1847), .B(n1533), .Y(n1263) );
  ADDFX1 U1417 ( .A(n1905), .B(n1904), .CI(n1903), .CO(n1889), .S(n2337) );
  AND2XL U1418 ( .A(rotation_type[1]), .B(n1339), .Y(n2277) );
  OAI2BB1X1 U1420 ( .A0N(intadd_0_SUM_2_), .A1N(n2275), .B0(n2274), .Y(N2812)
         );
  OAI211X1 U1421 ( .A0(start_pos[8]), .A1(n2379), .B0(n2155), .C0(n2376), .Y(
        n2087) );
  OAI211X1 U1422 ( .A0(n2766), .A1(n2273), .B0(n2755), .C0(n2272), .Y(n2274)
         );
  OAI211X1 U1424 ( .A0(mask_pattern[6]), .A1(n2270), .B0(n2755), .C0(n2273), 
        .Y(n2271) );
  ADDHX1 U1426 ( .A(N2945), .B(n1510), .CO(n1504), .S(n1511) );
  NOR2BX1 U1427 ( .AN(n1036), .B(n1522), .Y(n1527) );
  OAI211X1 U1429 ( .A0(store_cnt[6]), .A1(n2262), .B0(n2261), .C0(n2264), .Y(
        n2263) );
  OAI211X1 U1430 ( .A0(store_cnt[3]), .A1(n2266), .B0(n2265), .C0(n2264), .Y(
        n2267) );
  OAI211X1 U1431 ( .A0(store_cnt[4]), .A1(n2063), .B0(n2062), .C0(n2264), .Y(
        n2064) );
  ADDFX1 U1432 ( .A(position_cnt[1]), .B(N2944), .CI(n1516), .CO(n1510), .S(
        n1517) );
  OAI211X1 U1433 ( .A0(n2234), .A1(n2233), .B0(n2232), .C0(n2231), .Y(n2235)
         );
  OAI211X1 U1434 ( .A0(n2233), .A1(n2768), .B0(n1338), .C0(n1337), .Y(n1343)
         );
  OAI211X1 U1435 ( .A0(n2233), .A1(n2766), .B0(n1341), .C0(n1340), .Y(n1342)
         );
  OAI211X1 U1436 ( .A0(mask_pattern[5]), .A1(n2256), .B0(n2755), .C0(n2269), 
        .Y(n2257) );
  OAI211X1 U1437 ( .A0(n2779), .A1(n2233), .B0(n1336), .C0(n1335), .Y(n1348)
         );
  XOR2XL U1438 ( .A(n1102), .B(n1483), .Y(n1987) );
  OAI211X1 U1439 ( .A0(start_pos[3]), .A1(n2371), .B0(n2376), .C0(n2373), .Y(
        n2042) );
  ADDFX1 U1442 ( .A(store_cnt[5]), .B(start_pos[5]), .CI(n1489), .CO(n1483), 
        .S(n1975) );
  OAI211XL U1443 ( .A0(n2363), .A1(decode_length_reg[5]), .B0(n2030), .C0(
        n2382), .Y(n2031) );
  OAI211X1 U1444 ( .A0(mask_pattern[4]), .A1(intadd_0_n1), .B0(n2755), .C0(
        n2255), .Y(n2254) );
  NOR4BX1 U1445 ( .AN(n2208), .B(n2207), .C(position_block[10]), .D(n2216), 
        .Y(n2209) );
  OAI211XL U1446 ( .A0(start_pos[1]), .A1(n2370), .B0(n2372), .C0(n2376), .Y(
        n2034) );
  NOR4X1 U1448 ( .A(n2197), .B(position_block[2]), .C(n2196), .D(n2195), .Y(
        n2208) );
  NAND2BXL U1450 ( .AN(n1407), .B(n1272), .Y(n1432) );
  NOR4X1 U1451 ( .A(n2204), .B(position_block[19]), .C(position_block[21]), 
        .D(n2203), .Y(n2205) );
  AOI221X1 U1452 ( .A0(n2060), .A1(decode_cnt[3]), .B0(n2059), .B1(n2058), 
        .C0(n2426), .Y(decode_tmp[3]) );
  AOI221X1 U1453 ( .A0(decode_cnt[7]), .A1(n2429), .B0(n2428), .B1(n2427), 
        .C0(n2426), .Y(decode_tmp[7]) );
  ADDHX1 U1454 ( .A(store_cnt[0]), .B(start_pos[0]), .CO(n1515), .S(n1978) );
  OAI211X1 U1455 ( .A0(decode_cnt[5]), .A1(n2421), .B0(n2424), .C0(n2055), .Y(
        n2054) );
  OAI211X1 U1457 ( .A0(decode_cnt[1]), .A1(n1592), .B0(n1591), .C0(n1590), .Y(
        n1608) );
  NOR4BX1 U1458 ( .AN(position_block_line[26]), .B(position_block_line[37]), 
        .C(n2001), .D(n2000), .Y(n2416) );
  OAI2BB1X1 U1459 ( .A0N(n2088), .A1N(n2147), .B0(n2145), .Y(n2112) );
  OAI2BB1X1 U1460 ( .A0N(position_cnt[3]), .A1N(n2088), .B0(n2145), .Y(n2099)
         );
  NOR4X1 U1461 ( .A(n2202), .B(n2201), .C(position_block[18]), .D(
        position_block[20]), .Y(n2206) );
  OAI211X1 U1463 ( .A0(n1705), .A1(n1704), .B0(n1703), .C0(n1702), .Y(n1706)
         );
  OAI2BB1X1 U1464 ( .A0N(n2419), .A1N(state[2]), .B0(n2052), .Y(n2745) );
  NOR4X1 U1466 ( .A(n2387), .B(n1997), .C(n1996), .D(n1995), .Y(n2411) );
  OAI211XL U1467 ( .A0(position_cnt[5]), .A1(n2040), .B0(n2039), .C0(n2043), 
        .Y(n2041) );
  OAI211X1 U1468 ( .A0(n2027), .A1(n2147), .B0(n2016), .C0(n2015), .Y(n2165)
         );
  OAI211X1 U1469 ( .A0(n1417), .A1(n1679), .B0(decode_cnt[0]), .C0(n1738), .Y(
        n1418) );
  OAI211XL U1470 ( .A0(n2287), .A1(n1000), .B0(n2080), .C0(n2286), .Y(n2081)
         );
  AND2XL U1471 ( .A(n1257), .B(n1524), .Y(n1492) );
  OAI211XL U1472 ( .A0(n1742), .A1(n1699), .B0(decode_cnt[2]), .C0(n1698), .Y(
        n1700) );
  NOR4BX1 U1473 ( .AN(n2016), .B(position_cnt[3]), .C(n2027), .D(n2032), .Y(
        n2172) );
  NOR4X1 U1474 ( .A(store_cnt[1]), .B(store_cnt[0]), .C(n2075), .D(n2074), .Y(
        n2082) );
  NOR2BX1 U1475 ( .AN(n1965), .B(n1195), .Y(n1478) );
  AND2XL U1476 ( .A(n1312), .B(n1549), .Y(n1320) );
  AND2XL U1477 ( .A(n1369), .B(n1371), .Y(n1664) );
  NOR4XL U1478 ( .A(store_cnt[1]), .B(store_cnt[4]), .C(n2735), .D(n2734), .Y(
        n2746) );
  OR2XL U1479 ( .A(n1197), .B(n2751), .Y(n1965) );
  AND2XL U1480 ( .A(decode_length[3]), .B(n2444), .Y(n1643) );
  NOR4X1 U1481 ( .A(decode_cnt[3]), .B(decode_cnt[7]), .C(n1755), .D(n1316), 
        .Y(n1317) );
  BUFX2 U1484 ( .A(n2314), .Y(n1034) );
  BUFX2 U1485 ( .A(n1282), .Y(n1035) );
  NAND2BXL U1486 ( .AN(n10900), .B(n1842), .Y(n10920) );
  OAI21XL U1488 ( .A0(n1284), .A1(n1946), .B0(n1947), .Y(n1283) );
  AND2XL U1489 ( .A(n2334), .B(n2335), .Y(n1059) );
  NAND2XL U1490 ( .A(n1125), .B(n1075), .Y(n1174) );
  OR2XL U1491 ( .A(n1739), .B(n1689), .Y(n1055) );
  NAND2BXL U1492 ( .AN(n1688), .B(n1735), .Y(n1126) );
  INVXL U1495 ( .A(n2276), .Y(n1848) );
  NOR2XL U1496 ( .A(n1534), .B(n1848), .Y(n1938) );
  NAND3BXL U1497 ( .AN(n1527), .B(n1526), .C(n1296), .Y(n1924) );
  NOR2XL U1498 ( .A(n2268), .B(n2141), .Y(n2145) );
  NOR2XL U1499 ( .A(state[1]), .B(n2047), .Y(n2751) );
  NAND2BXL U1501 ( .AN(n1929), .B(n2338), .Y(n1939) );
  NOR2XL U1502 ( .A(n1956), .B(n2338), .Y(n1940) );
  NAND2BXL U1503 ( .AN(n1664), .B(n2439), .Y(n1613) );
  INVXL U1504 ( .A(n1618), .Y(n1173) );
  NAND2BXL U1505 ( .AN(n1192), .B(n1404), .Y(n1405) );
  AOI21XL U1506 ( .A0(decode_cnt[0]), .A1(n1174), .B0(n1740), .Y(n1840) );
  INVXL U1507 ( .A(n1418), .Y(n1175) );
  NOR2XL U1508 ( .A(n1856), .B(n1534), .Y(n1953) );
  NAND2XL U1509 ( .A(n2742), .B(n1969), .Y(n1523) );
  NAND2XL U1510 ( .A(n1252), .B(n1937), .Y(n1251) );
  NAND2XL U1511 ( .A(n2252), .B(n1938), .Y(n1252) );
  NAND2XL U1512 ( .A(n1460), .B(n1234), .Y(n2742) );
  NAND2XL U1513 ( .A(decode_length[1]), .B(n1074), .Y(n2435) );
  NAND2BXL U1514 ( .AN(n1039), .B(n1793), .Y(n1241) );
  NAND2XL U1515 ( .A(n2312), .B(n2311), .Y(n1284) );
  AND2XL U1516 ( .A(n1225), .B(rotation_type[1]), .Y(n1045) );
  AND2XL U1517 ( .A(n10950), .B(n1965), .Y(n1036) );
  NAND3XL U1518 ( .A(n2147), .B(n2143), .C(n2284), .Y(n10950) );
  NAND2XL U1519 ( .A(state[3]), .B(n2757), .Y(n2047) );
  NAND4XL U1520 ( .A(n2763), .B(state[3]), .C(state[2]), .D(state[1]), .Y(
        n2073) );
  NOR2XL U1521 ( .A(n2763), .B(n1311), .Y(n2752) );
  AND2XL U1522 ( .A(state[0]), .B(n2369), .Y(n2291) );
  NAND2X1 U1523 ( .A(n2763), .B(n2369), .Y(n1969) );
  INVXL U1524 ( .A(decode_jis8_valid_reg0), .Y(n2736) );
  NAND2XL U1526 ( .A(n1254), .B(n1253), .Y(n2306) );
  INVXL U1527 ( .A(n1046), .Y(n1226) );
  OR2XL U1528 ( .A(n1825), .B(n1824), .Y(n2317) );
  OR2XL U1529 ( .A(n1888), .B(n1887), .Y(n2323) );
  OR2XL U1530 ( .A(n1895), .B(n1894), .Y(n2329) );
  OR2XL U1532 ( .A(n1928), .B(n1927), .Y(n2338) );
  NOR2XL U1533 ( .A(n1461), .B(state[0]), .Y(n2268) );
  INVXL U1534 ( .A(position_cnt[1]), .Y(n2168) );
  AND2XL U1535 ( .A(position_block_line[23]), .B(n2750), .Y(n2150) );
  OR2XL U1536 ( .A(n1726), .B(n1628), .Y(n1290) );
  OR2XL U1537 ( .A(n1653), .B(n1687), .Y(n1618) );
  NAND2BXL U1538 ( .AN(n1742), .B(n2802), .Y(n1146) );
  NAND2BXL U1539 ( .AN(n1180), .B(n1736), .Y(n1143) );
  INVXL U1540 ( .A(n2284), .Y(n10940) );
  AOI21XL U1541 ( .A0(n1756), .A1(n1952), .B0(n1266), .Y(n1265) );
  NOR2XL U1542 ( .A(n1380), .B(n1618), .Y(n1724) );
  OR2XL U1543 ( .A(n1664), .B(n1688), .Y(n1380) );
  AND2XL U1544 ( .A(n1719), .B(n1421), .Y(n1069) );
  INVXL U1545 ( .A(n1165), .Y(n1159) );
  NOR2XL U1546 ( .A(n1755), .B(n1533), .Y(n1161) );
  OR2XL U1547 ( .A(n1839), .B(n1045), .Y(n1058) );
  OR2XL U1548 ( .A(n1127), .B(n1431), .Y(n1056) );
  NOR2XL U1549 ( .A(n1427), .B(n1419), .Y(n1127) );
  AND2XL U1550 ( .A(n1443), .B(n2346), .Y(n1064) );
  OR2XL U1551 ( .A(n1273), .B(n1051), .Y(n1037) );
  AND2XL U1552 ( .A(decode_length[5]), .B(n2020), .Y(n1051) );
  NOR2XL U1553 ( .A(n2440), .B(n2347), .Y(n1273) );
  NOR2XL U1554 ( .A(n2348), .B(n1115), .Y(n1114) );
  NOR2XL U1555 ( .A(rotation_type[0]), .B(rotation_type[2]), .Y(n1339) );
  XOR2XL U1556 ( .A(n1584), .B(n1952), .Y(n1949) );
  OR2XL U1557 ( .A(n1952), .B(n1583), .Y(n1950) );
  NOR2XL U1558 ( .A(n1208), .B(n1230), .Y(n1203) );
  XOR2XL U1559 ( .A(n1622), .B(n1952), .Y(n1766) );
  OR2XL U1560 ( .A(n1952), .B(n1621), .Y(n1767) );
  NAND2XL U1561 ( .A(n1952), .B(n1758), .Y(n1278) );
  OAI21XL U1562 ( .A0(n1117), .A1(n1223), .B0(decode_length[6]), .Y(n1116) );
  INVXL U1563 ( .A(n2348), .Y(n1117) );
  AND2XL U1564 ( .A(n2044), .B(n2144), .Y(n2284) );
  XOR2XL U1565 ( .A(qrcode_start[9]), .B(n1463), .Y(n1464) );
  INVXL U1566 ( .A(n1775), .Y(n1268) );
  NAND2XL U1567 ( .A(n1783), .B(n1782), .Y(n1200) );
  INVXL U1568 ( .A(n1771), .Y(n1134) );
  NAND3XL U1569 ( .A(n1289), .B(n1485), .C(n1484), .Y(n1793) );
  AND2XL U1570 ( .A(n1460), .B(n2767), .Y(n2079) );
  AO21XL U1571 ( .A0(n2722), .A1(n2721), .B0(n2720), .Y(n2723) );
  OR2XL U1572 ( .A(n1049), .B(n10930), .Y(n1063) );
  AND2XL U1573 ( .A(n1049), .B(n10930), .Y(n1043) );
  AO21XL U1574 ( .A0(n1938), .A1(n1764), .B0(n1762), .Y(n1044) );
  INVXL U1575 ( .A(n1284), .Y(n1281) );
  XOR2XL U1576 ( .A(n1956), .B(n1792), .Y(n2307) );
  AOI21XL U1577 ( .A0(n1864), .A1(n1938), .B0(n1052), .Y(n1238) );
  AND2XL U1578 ( .A(n1054), .B(n1880), .Y(n1070) );
  NAND2XL U1579 ( .A(n1237), .B(n1901), .Y(n1236) );
  NAND2XL U1580 ( .A(n1249), .B(n1248), .Y(n1247) );
  AND2XL U1581 ( .A(n1218), .B(n1929), .Y(n1068) );
  NOR2BXL U1582 ( .AN(state[0]), .B(n1321), .Y(n1197) );
  NAND2XL U1583 ( .A(position_cnt[0]), .B(n2168), .Y(n2173) );
  NAND2XL U1584 ( .A(position_cnt[1]), .B(n2017), .Y(n2097) );
  INVXL U1585 ( .A(sram_rdata_reg[0]), .Y(n2390) );
  INVXL U1586 ( .A(sram_rdata_reg[1]), .Y(n2393) );
  NAND2XL U1587 ( .A(n1462), .B(n2145), .Y(n2342) );
  AND2XL U1588 ( .A(n2144), .B(n2143), .Y(n2148) );
  INVXL U1589 ( .A(sram_rdata_reg[2]), .Y(n2396) );
  NOR2XL U1590 ( .A(n1326), .B(n2375), .Y(n2400) );
  INVXL U1591 ( .A(sram_rdata_reg[3]), .Y(n2399) );
  OR3XL U1592 ( .A(decode_cnt[2]), .B(decode_cnt[7]), .C(n2058), .Y(n1314) );
  AO21XL U1593 ( .A0(n2358), .A1(n2357), .B0(N4119), .Y(n2733) );
  BUFX3 U1594 ( .A(rstn), .Y(n2784) );
  NAND2XL U1595 ( .A(decode_length[2]), .B(n1410), .Y(n1554) );
  NOR2XL U1596 ( .A(n1586), .B(n1585), .Y(n1599) );
  OR2XL U1597 ( .A(n1742), .B(n1741), .Y(n1191) );
  INVXL U1598 ( .A(n1625), .Y(n1709) );
  INVXL U1599 ( .A(n1620), .Y(n1162) );
  AND2XL U1600 ( .A(n1679), .B(n1635), .Y(n1307) );
  NAND2XL U1601 ( .A(n1721), .B(n1619), .Y(n1165) );
  OR2XL U1603 ( .A(n1669), .B(n1668), .Y(n1308) );
  AND2XL U1604 ( .A(n1691), .B(n1649), .Y(n1073) );
  OR2XL U1605 ( .A(n1689), .B(n1688), .Y(n1061) );
  AND2XL U1608 ( .A(n2160), .B(n1745), .Y(n1042) );
  INVXL U1609 ( .A(n1374), .Y(n1124) );
  NOR2XL U1610 ( .A(n1443), .B(N4125), .Y(n1123) );
  NAND2XL U1611 ( .A(n1146), .B(n1731), .Y(n1145) );
  NAND2XL U1612 ( .A(n1742), .B(n1180), .Y(n1142) );
  OR2XL U1613 ( .A(n1739), .B(n1723), .Y(n1062) );
  NOR2XL U1614 ( .A(n1835), .B(n1841), .Y(n1842) );
  NOR2XL U1615 ( .A(n1848), .B(n1840), .Y(n1836) );
  NOR2XL U1616 ( .A(decode_length[3]), .B(decode_length[4]), .Y(n1410) );
  NAND2XL U1617 ( .A(n1451), .B(length[5]), .Y(n1223) );
  INVXL U1618 ( .A(decode_length[1]), .Y(n2433) );
  NAND2XL U1619 ( .A(decode_length[3]), .B(decode_length[4]), .Y(n2439) );
  INVXL U1620 ( .A(qrcode_start[7]), .Y(n1256) );
  INVXL U1621 ( .A(n1795), .Y(n1215) );
  XOR2XL U1622 ( .A(n1677), .B(n1952), .Y(n1782) );
  AND2XL U1623 ( .A(n10940), .B(n1965), .Y(n1066) );
  NOR2XL U1624 ( .A(n2143), .B(n1196), .Y(n1493) );
  XOR2XL U1625 ( .A(n1045), .B(n1828), .Y(n1897) );
  AO21XL U1626 ( .A0(n1756), .A1(n1952), .B0(n1430), .Y(n1434) );
  AO21XL U1627 ( .A0(n1835), .A1(n1045), .B0(n1420), .Y(n1423) );
  NAND2XL U1628 ( .A(n1359), .B(n1751), .Y(n1417) );
  AND2XL U1629 ( .A(n2143), .B(n2284), .Y(n1072) );
  NAND2BXL U1630 ( .AN(n1277), .B(n1450), .Y(n1276) );
  INVXL U1631 ( .A(n1449), .Y(n1275) );
  INVXL U1632 ( .A(n1454), .Y(n1111) );
  XOR2XL U1633 ( .A(decode_length[3]), .B(n2714), .Y(n2453) );
  NOR2XL U1634 ( .A(n1053), .B(n1203), .Y(n1202) );
  AND2XL U1635 ( .A(n1950), .B(n1949), .Y(n1053) );
  NAND2XL U1636 ( .A(qrcode_start_whole[9]), .B(n1046), .Y(n1107) );
  NAND2XL U1637 ( .A(n1209), .B(n1230), .Y(n1205) );
  AO21XL U1638 ( .A0(n2284), .A1(n2147), .B0(n1196), .Y(n1067) );
  AO22XL U1639 ( .A0(n1820), .A1(n1821), .B0(n1085), .B1(n1819), .Y(n1047) );
  INVXL U1640 ( .A(n10860), .Y(n1085) );
  OR2XL U1641 ( .A(n1953), .B(n1954), .Y(n1302) );
  XOR2XL U1642 ( .A(n1737), .B(n1952), .Y(n1806) );
  OR2XL U1643 ( .A(n1863), .B(n1303), .Y(n1052) );
  AND2XL U1644 ( .A(store_cnt[4]), .B(n1931), .Y(n1303) );
  NAND2XL U1645 ( .A(n1913), .B(n1862), .Y(n1863) );
  NAND3XL U1646 ( .A(n2284), .B(n2143), .C(n2147), .Y(n1195) );
  OR2XL U1647 ( .A(n1953), .B(n1931), .Y(n1886) );
  INVXL U1648 ( .A(n1879), .Y(n1880) );
  NAND2BXL U1649 ( .AN(n1878), .B(n1877), .Y(n1879) );
  NOR3BXL U1650 ( .AN(n1913), .B(n1900), .C(n1048), .Y(n1901) );
  AND2XL U1651 ( .A(store_cnt[2]), .B(n1931), .Y(n1048) );
  AO21XL U1652 ( .A0(n1953), .A1(qrcode_start_whole[2]), .B0(n1910), .Y(n1900)
         );
  AND2XL U1653 ( .A(n1523), .B(n1976), .Y(n1057) );
  NAND2XL U1654 ( .A(n1517), .B(n1036), .Y(n1518) );
  INVXL U1655 ( .A(n1915), .Y(n1917) );
  INVXL U1656 ( .A(n1922), .Y(n1248) );
  NAND2XL U1657 ( .A(n1923), .B(n1938), .Y(n1249) );
  NOR2XL U1658 ( .A(n1542), .B(n1957), .Y(n1907) );
  INVXL U1659 ( .A(n1251), .Y(n1218) );
  NAND2XL U1660 ( .A(n1220), .B(n1221), .Y(n1184) );
  OR2XL U1661 ( .A(n1251), .B(n1929), .Y(n1220) );
  INVXL U1662 ( .A(n1219), .Y(n1186) );
  OR2XL U1663 ( .A(state[3]), .B(n2757), .Y(n1321) );
  INVXL U1664 ( .A(position_cnt[0]), .Y(n2017) );
  INVXL U1665 ( .A(n1563), .Y(n1751) );
  INVXL U1666 ( .A(decode_cnt[1]), .Y(n1697) );
  INVXL U1667 ( .A(n1746), .Y(n1180) );
  AOI22XL U1669 ( .A0(qrc_decode_start_reg), .A1(n2079), .B0(n1213), .B1(n2737), .Y(n2080) );
  NAND2XL U1670 ( .A(start_pos[6]), .B(store_cnt[6]), .Y(n1101) );
  AOI21XL U1671 ( .A0(n1938), .A1(n1772), .B0(n1134), .Y(n1133) );
  INVXL U1672 ( .A(n1097), .Y(n2370) );
  INVXL U1673 ( .A(n2376), .Y(n2378) );
  NOR2XL U1674 ( .A(state[1]), .B(n2763), .Y(n2030) );
  NAND2XL U1675 ( .A(state[1]), .B(state[0]), .Y(n2359) );
  NAND2XL U1676 ( .A(state[1]), .B(n2763), .Y(n2068) );
  NOR4XL U1677 ( .A(position_block_line[18]), .B(n2407), .C(n2006), .D(n2005), 
        .Y(n2007) );
  NAND2XL U1678 ( .A(sram_rdata_reg[0]), .B(n2752), .Y(n2389) );
  NAND2XL U1679 ( .A(sram_rdata_reg[1]), .B(n2752), .Y(n2392) );
  BUFX2 U1680 ( .A(n2750), .Y(n2141) );
  NAND2XL U1681 ( .A(sram_rdata_reg[3]), .B(n2752), .Y(n2398) );
  AO21XL U1682 ( .A0(n2349), .A1(n2357), .B0(N4098), .Y(n2466) );
  OR2XL U1684 ( .A(N4122), .B(n1447), .Y(n2344) );
  NOR2XL U1685 ( .A(decode_cnt[0]), .B(decode_cnt[1]), .Y(n2070) );
  NOR4XL U1686 ( .A(n2753), .B(n2752), .C(n2751), .D(n2750), .Y(n1006) );
  NOR3BXL U1687 ( .AN(n1212), .B(n2289), .C(n2290), .Y(n2295) );
  NOR2XL U1688 ( .A(n1213), .B(n2291), .Y(n1212) );
  XNOR2X1 U1689 ( .A(n2781), .B(n2155), .Y(n2156) );
  XNOR2X1 U1690 ( .A(n1985), .B(n1984), .Y(N1088) );
  XNOR2X1 U1691 ( .A(n1983), .B(n1982), .Y(N1089) );
  XNOR2X1 U1692 ( .A(n1981), .B(n1980), .Y(N1090) );
  OR2XL U1693 ( .A(n1980), .B(n1981), .Y(n1974) );
  XNOR2X1 U1694 ( .A(n2280), .B(n2279), .Y(qrcode_start_tmp[9]) );
  XNOR2X1 U1695 ( .A(qrcode_start[7]), .B(n2281), .Y(qrcode_start_tmp[7]) );
  XNOR2X1 U1696 ( .A(n1991), .B(n1990), .Y(N1094) );
  XNOR2X1 U1697 ( .A(n1993), .B(n1992), .Y(N1095) );
  OR2XL U1698 ( .A(n1991), .B(n1990), .Y(n1992) );
  INVXL U1699 ( .A(n1106), .Y(n1148) );
  AO21XL U1700 ( .A0(n2301), .A1(n2342), .B0(n2300), .Y(n2758) );
  AO21XL U1701 ( .A0(n1310), .A1(n1034), .B0(n1281), .Y(n1050) );
  AO21XL U1702 ( .A0(n2322), .A1(n2342), .B0(n2321), .Y(n2762) );
  AO21XL U1703 ( .A0(n2328), .A1(n2342), .B0(n2327), .Y(n2774) );
  AO21XL U1704 ( .A0(n2332), .A1(n2342), .B0(n2331), .Y(n2775) );
  AO21XL U1705 ( .A0(n2337), .A1(n2342), .B0(n2336), .Y(n2776) );
  AO21XL U1706 ( .A0(n2343), .A1(n2342), .B0(n2341), .Y(n2777) );
  NOR2XL U1707 ( .A(n1096), .B(n2378), .Y(start_tmp[0]) );
  XNOR2X1 U1708 ( .A(decode_length_reg[1]), .B(decode_length_reg[0]), .Y(n2022) );
  XNOR2X1 U1709 ( .A(position_cnt[4]), .B(n2035), .Y(n2036) );
  NOR4XL U1710 ( .A(n2407), .B(n2406), .C(n2405), .D(n2404), .Y(check_4) );
  OR2XL U1711 ( .A(N3840), .B(n2188), .Y(position_block[28]) );
  OR2XL U1712 ( .A(N3843), .B(n2186), .Y(position_block[27]) );
  OR2XL U1713 ( .A(N3846), .B(n2187), .Y(position_block[26]) );
  OR2XL U1714 ( .A(N3849), .B(n2189), .Y(position_block[25]) );
  OR2XL U1715 ( .A(N3855), .B(n2164), .Y(position_block[23]) );
  OR2XL U1716 ( .A(N3861), .B(n2184), .Y(position_block[21]) );
  OR2XL U1717 ( .A(N3864), .B(n2175), .Y(position_block[20]) );
  OR2XL U1718 ( .A(N3867), .B(n2176), .Y(position_block[19]) );
  OR2XL U1719 ( .A(N3870), .B(n2174), .Y(position_block[18]) );
  OR2XL U1720 ( .A(N3873), .B(n2177), .Y(position_block[17]) );
  OR2XL U1721 ( .A(N3876), .B(n2191), .Y(position_block[16]) );
  OR2XL U1722 ( .A(N3885), .B(n2183), .Y(position_block[13]) );
  OR2XL U1723 ( .A(N3888), .B(n2181), .Y(position_block[12]) );
  OR2XL U1724 ( .A(N3891), .B(n2180), .Y(position_block[11]) );
  OR2XL U1725 ( .A(N3894), .B(n2182), .Y(position_block[10]) );
  OR2XL U1726 ( .A(N3897), .B(n2166), .Y(position_block[9]) );
  OR2XL U1727 ( .A(N3900), .B(n2192), .Y(position_block[8]) );
  OR2XL U1728 ( .A(N3903), .B(n2171), .Y(position_block[7]) );
  OR2XL U1729 ( .A(N3906), .B(n2163), .Y(position_block[6]) );
  OR2XL U1730 ( .A(N3912), .B(n2178), .Y(position_block[4]) );
  OR2XL U1731 ( .A(N3915), .B(n2179), .Y(position_block[3]) );
  OR2XL U1732 ( .A(N3918), .B(n2162), .Y(position_block[2]) );
  OR2XL U1733 ( .A(N3921), .B(n2167), .Y(position_block[1]) );
  OR2XL U1734 ( .A(N3924), .B(n2190), .Y(position_block[0]) );
  NAND2XL U1735 ( .A(position_cnt[1]), .B(n2169), .Y(n989) );
  OR2XL U1736 ( .A(N3999), .B(n2391), .Y(position_block_line_tmp[27]) );
  OR2XL U1737 ( .A(N4002), .B(n2394), .Y(position_block_line_tmp[26]) );
  NAND2XL U1738 ( .A(n2127), .B(n2129), .Y(n976) );
  NAND2XL U1739 ( .A(n2121), .B(n2129), .Y(n977) );
  OR2XL U1740 ( .A(N4077), .B(n2397), .Y(position_block_line_tmp[1]) );
  OR2XL U1741 ( .A(N4080), .B(n2401), .Y(position_block_line_tmp[0]) );
  OR2XL U1742 ( .A(n1318), .B(n1004), .Y(n2770) );
  OR2XL U1743 ( .A(n1318), .B(n1003), .Y(n2771) );
  OR2XL U1744 ( .A(n1318), .B(n1002), .Y(n2772) );
  OR2XL U1745 ( .A(n1318), .B(n1001), .Y(n2773) );
  INVXL U1746 ( .A(n1956), .Y(n1929) );
  INVXL U1747 ( .A(position_cnt[3]), .Y(n2147) );
  OA21X1 U1748 ( .A0(n2044), .A1(n1492), .B0(n1067), .Y(n1039) );
  INVXL U1749 ( .A(rotation_type[1]), .Y(n2245) );
  OA22X1 U1750 ( .A0(n1257), .A1(n1256), .B0(n1255), .B1(n1524), .Y(n1040) );
  OA21X1 U1751 ( .A0(n1847), .A1(n1840), .B0(n1757), .Y(n1041) );
  INVXL U1752 ( .A(n1965), .Y(n1196) );
  NAND2XL U1753 ( .A(n1767), .B(n1766), .Y(n1230) );
  NAND2XL U1755 ( .A(n1867), .B(n1938), .Y(n1054) );
  NOR2XL U1756 ( .A(n1950), .B(n1949), .Y(n1208) );
  NOR2XL U1757 ( .A(state[3]), .B(state[2]), .Y(n1460) );
  INVXL U1759 ( .A(n1478), .Y(n1257) );
  OAI22XL U1760 ( .A0(n2280), .A1(n1257), .B0(n2781), .B1(n1524), .Y(n1065) );
  INVXL U1761 ( .A(n2160), .Y(n1744) );
  NOR2XL U1762 ( .A(decode_cnt[1]), .B(n1732), .Y(n2160) );
  INVXL U1764 ( .A(rotation_type[2]), .Y(n1225) );
  INVXL U1765 ( .A(start_pos[7]), .Y(n1255) );
  ADDFXL U1766 ( .A(n1969), .B(n1987), .CI(n1986), .CO(n1988), .S(N1092) );
  ADDFXL U1767 ( .A(n1969), .B(n1975), .CI(n1974), .CO(n1986), .S(N1091) );
  NAND2XL U1768 ( .A(n1739), .B(decode_cnt[2]), .Y(n1080) );
  NOR2XL U1769 ( .A(n1778), .B(n1779), .Y(n10930) );
  NOR2XL U1770 ( .A(rotation_type[0]), .B(rotation_type[1]), .Y(n1349) );
  NAND2XL U1771 ( .A(n1181), .B(n1626), .Y(n1595) );
  NOR2XL U1772 ( .A(n1687), .B(n1710), .Y(n1153) );
  NOR2XL U1773 ( .A(n1624), .B(n2801), .Y(n1167) );
  NAND2BXL U1775 ( .AN(n1065), .B(n1467), .Y(n1179) );
  NOR3XL U1776 ( .A(n1126), .B(n1055), .C(n1714), .Y(n1125) );
  OAI21XL U1777 ( .A0(n1848), .A1(n2804), .B0(n1265), .Y(n1758) );
  ADDHXL U1778 ( .A(n1777), .B(n1776), .CO(n1960), .S(n1778) );
  NAND3BXL U1779 ( .AN(n1652), .B(n1259), .C(n1415), .Y(n1258) );
  INVXL U1780 ( .A(n1643), .Y(n1415) );
  NOR2XL U1781 ( .A(n1381), .B(n2803), .Y(n1687) );
  OR2X1 U1782 ( .A(N2423), .B(decode_length[1]), .Y(n1388) );
  OAI21XL U1783 ( .A0(n1141), .A1(n1062), .B0(n1142), .Y(n1140) );
  NAND2XL U1784 ( .A(n1143), .B(n1724), .Y(n1141) );
  ADDFXL U1787 ( .A(n1931), .B(n1907), .CI(n1906), .CO(n1892), .S(n1908) );
  INVXL U1788 ( .A(n1849), .Y(n1076) );
  INVXL U1789 ( .A(n1076), .Y(n1077) );
  NAND2XL U1790 ( .A(decode_length[3]), .B(n1367), .Y(n1413) );
  NOR2BXL U1791 ( .AN(n2333), .B(n1941), .Y(n1139) );
  NAND2BXL U1792 ( .AN(n1166), .B(n1654), .Y(n1632) );
  INVXL U1793 ( .A(n1610), .Y(n1701) );
  NAND3BXL U1794 ( .AN(n1644), .B(n1167), .C(n1610), .Y(n1166) );
  INVXL U1795 ( .A(n1433), .Y(n1269) );
  NAND3XL U1796 ( .A(n1557), .B(n1401), .C(n1370), .Y(n1748) );
  INVXL U1797 ( .A(n1699), .Y(n1714) );
  INVXL U1798 ( .A(n1035), .Y(n2303) );
  AOI22XL U1799 ( .A0(n1954), .A1(store_cnt[4]), .B0(qrcode_start_whole[9]), 
        .B1(n1953), .Y(n1280) );
  INVXL U1800 ( .A(n1954), .Y(n1214) );
  AOI21XL U1803 ( .A0(n10920), .A1(n1844), .B0(n10910), .Y(n1845) );
  AOI2BB1XL U1805 ( .A0N(n1730), .A1N(n1729), .B0(n1732), .Y(n1079) );
  OAI21XL U1806 ( .A0(decode_cnt[0]), .A1(n1738), .B0(n1080), .Y(n1740) );
  NOR2XL U1807 ( .A(n1180), .B(n1743), .Y(n1194) );
  NOR2BXL U1809 ( .AN(n1667), .B(n1627), .Y(n1654) );
  OR2XL U1810 ( .A(n2433), .B(n2439), .Y(n1564) );
  AND3XL U1811 ( .A(n1655), .B(n1672), .C(n1654), .Y(n1081) );
  OR2XL U1812 ( .A(n1663), .B(n1669), .Y(n1670) );
  ADDFXL U1813 ( .A(n1962), .B(n1961), .CI(n1960), .CO(n1963), .S(n1544) );
  OR2X1 U1814 ( .A(n1534), .B(n1263), .Y(n1957) );
  OAI22XL U1815 ( .A0(n1751), .A1(n1073), .B0(n2059), .B1(n1081), .Y(n1674) );
  AOI21XL U1816 ( .A0(n1083), .A1(n2799), .B0(n1742), .Y(n1171) );
  NOR2XL U1818 ( .A(n1588), .B(n1061), .Y(n1083) );
  AOI21XL U1819 ( .A0(decode_cnt[2]), .A1(n1676), .B0(n1084), .Y(n1849) );
  OR2XL U1820 ( .A(n1674), .B(n1675), .Y(n1084) );
  INVXL U1821 ( .A(n1821), .Y(n10870) );
  NAND2XL U1822 ( .A(n1838), .B(n1837), .Y(n1844) );
  NOR2XL U1823 ( .A(n10890), .B(n10900), .Y(n10910) );
  NAND2XL U1824 ( .A(n1045), .B(n1842), .Y(n10890) );
  NOR2XL U1825 ( .A(n1856), .B(n1843), .Y(n10900) );
  XOR2XL U1826 ( .A(n10930), .B(n1049), .Y(n2302) );
  NAND2BX1 U1827 ( .AN(n1965), .B(n1969), .Y(n2376) );
  OAI21XL U1828 ( .A0(start_pos[0]), .A1(n1965), .B0(n1097), .Y(n1096) );
  NAND2XL U1829 ( .A(start_pos[0]), .B(n1965), .Y(n1097) );
  NAND2XL U1830 ( .A(n1101), .B(n1099), .Y(n1476) );
  NAND2BXL U1831 ( .AN(n1100), .B(n1483), .Y(n1099) );
  NOR2XL U1832 ( .A(start_pos[6]), .B(store_cnt[6]), .Y(n1100) );
  INVXL U1833 ( .A(store_cnt[6]), .Y(n1103) );
  OR2XL U1834 ( .A(n2323), .B(n2324), .Y(n1189) );
  XOR2XL U1835 ( .A(n1956), .B(n1104), .Y(n2324) );
  OAI21XL U1836 ( .A0(n1921), .A1(n1105), .B0(n1070), .Y(n1104) );
  XOR2XL U1837 ( .A(n1071), .B(n1870), .Y(n1105) );
  OAI21XL U1838 ( .A0(n1196), .A1(n1108), .B0(n1107), .Y(n1211) );
  INVXL U1839 ( .A(n1223), .Y(n1115) );
  OAI21XL U1840 ( .A0(n1113), .A1(n1112), .B0(n1110), .Y(n1457) );
  AOI21XL U1841 ( .A0(n1114), .A1(n1037), .B0(n1111), .Y(n1110) );
  INVXL U1842 ( .A(n1224), .Y(n1112) );
  INVXL U1843 ( .A(n1114), .Y(n1113) );
  AOI21XL U1844 ( .A0(n1118), .A1(n1112), .B0(n1116), .Y(n1456) );
  OAI21XL U1845 ( .A0(n2344), .A1(n1120), .B0(n1121), .Y(n1119) );
  AOI21XL U1846 ( .A0(n2719), .A1(n1446), .B0(decode_length[1]), .Y(n1120) );
  OR2XL U1847 ( .A(N4125), .B(n1444), .Y(n2346) );
  AOI22XL U1848 ( .A0(n1123), .A1(n1122), .B0(n1124), .B1(n1446), .Y(n1121) );
  INVXL U1849 ( .A(n1444), .Y(n1122) );
  NOR2XL U1850 ( .A(n1689), .B(n1714), .Y(n1728) );
  AOI22XL U1851 ( .A0(n1128), .A1(n2277), .B0(n1272), .B1(n1271), .Y(n1428) );
  INVXL U1852 ( .A(n1431), .Y(n1128) );
  AO21XL U1853 ( .A0(n1732), .A1(n1176), .B0(n1175), .Y(n1431) );
  XOR2XL U1854 ( .A(n1129), .B(n1423), .Y(n1424) );
  OAI21XL U1855 ( .A0(n1856), .A1(n1432), .B0(n1130), .Y(n1129) );
  NAND2BXL U1856 ( .AN(n1131), .B(n1261), .Y(n1260) );
  OAI21XL U1857 ( .A0(n1426), .A1(n1041), .B0(n1132), .Y(n1131) );
  OR3XL U1858 ( .A(n1533), .B(n1426), .C(n2804), .Y(n1132) );
  OR2XL U1859 ( .A(n1533), .B(n2804), .Y(n1262) );
  OAI21XL U1860 ( .A0(n1921), .A1(n1135), .B0(n1133), .Y(n1773) );
  NAND2XL U1861 ( .A(n1200), .B(n1198), .Y(n1765) );
  NOR2XL U1862 ( .A(n1739), .B(n1138), .Y(n1377) );
  INVXL U1863 ( .A(n1138), .Y(n1136) );
  NOR2XL U1864 ( .A(n1290), .B(n1138), .Y(n1137) );
  OR3XL U1865 ( .A(n1652), .B(n1644), .C(n1551), .Y(n1138) );
  NOR2XL U1866 ( .A(n1059), .B(n1139), .Y(n1149) );
  NAND2XL U1868 ( .A(n1148), .B(n1147), .Y(n2783) );
  OAI21XL U1869 ( .A0(n1188), .A1(n1149), .B0(n1942), .Y(n2326) );
  AOI21XL U1870 ( .A0(n1955), .A1(n1150), .B0(n1236), .Y(n1235) );
  XOR2XL U1871 ( .A(n1233), .B(n1899), .Y(n1150) );
  NOR2XL U1872 ( .A(n1646), .B(n1663), .Y(n1649) );
  NAND2XL U1873 ( .A(n1666), .B(n1645), .Y(n1663) );
  NOR2BXL U1874 ( .AN(n1709), .B(n1673), .Y(n1647) );
  NAND2XL U1875 ( .A(n2307), .B(n2306), .Y(n1947) );
  NAND2XL U1876 ( .A(n1965), .B(n2310), .Y(n1253) );
  OAI31XL U1878 ( .A0(n1172), .A1(n1171), .A2(n1707), .B0(n1706), .Y(n1831) );
  XOR2XL U1879 ( .A(n1851), .B(n1045), .Y(n1916) );
  INVXL U1882 ( .A(n1686), .Y(n1152) );
  NOR2X1 U1883 ( .A(n1412), .B(n2435), .Y(n1739) );
  OAI21XL U1884 ( .A0(n1043), .A1(n1282), .B0(n1063), .Y(n1154) );
  XOR2XL U1885 ( .A(n1154), .B(n2299), .Y(n2300) );
  OAI21XL U1886 ( .A0(n1856), .A1(n1829), .B0(n1155), .Y(n1828) );
  INVXL U1887 ( .A(n1156), .Y(n1155) );
  NAND2XL U1888 ( .A(n1165), .B(n1157), .Y(n1164) );
  NAND2XL U1889 ( .A(n1719), .B(n1304), .Y(n1157) );
  AOI22XL U1890 ( .A0(n1421), .A1(n1159), .B0(n1069), .B1(n1304), .Y(n1158) );
  NOR2XL U1891 ( .A(n1164), .B(n1160), .Y(n1163) );
  NOR2XL U1892 ( .A(n1755), .B(n1162), .Y(n1160) );
  OAI22XL U1893 ( .A0(n1163), .A1(n1848), .B0(n1847), .B1(n1829), .Y(n1830) );
  OAI22XL U1894 ( .A0(n1163), .A1(n1847), .B0(n1533), .B1(n1829), .Y(n1622) );
  OAI22XL U1895 ( .A0(n1163), .A1(n1856), .B0(n1848), .B1(n1829), .Y(n1621) );
  NAND2BXL U1896 ( .AN(n1586), .B(n1587), .Y(n1168) );
  OR2XL U1897 ( .A(n1168), .B(n1585), .Y(n1588) );
  INVXL U1899 ( .A(n1174), .Y(n1176) );
  NAND2XL U1900 ( .A(n1173), .B(n1176), .Y(n1304) );
  OAI21XL U1901 ( .A0(n1609), .A1(n1174), .B0(decode_cnt[0]), .Y(n1617) );
  OR2XL U1902 ( .A(n1378), .B(n1729), .Y(n1745) );
  NOR2XL U1903 ( .A(n1671), .B(n1714), .Y(n1401) );
  NAND2XL U1905 ( .A(n1532), .B(n1531), .Y(n1178) );
  NOR2XL U1906 ( .A(n1664), .B(n1182), .Y(n1181) );
  INVXL U1907 ( .A(n1394), .Y(n1182) );
  OAI21XL U1908 ( .A0(n1186), .A1(n1187), .B0(n1184), .Y(n1183) );
  NAND2BX1 U1909 ( .AN(n1183), .B(n1185), .Y(n2339) );
  OAI21XL U1910 ( .A0(n1940), .A1(n2339), .B0(n1939), .Y(n2333) );
  NAND2XL U1911 ( .A(n1068), .B(n1187), .Y(n1185) );
  NOR2XL U1912 ( .A(n2329), .B(n1227), .Y(n1188) );
  AO22XL U1913 ( .A0(n2323), .A1(n2324), .B0(n1189), .B1(n2326), .Y(n2320) );
  NAND2XL U1914 ( .A(n1191), .B(n1190), .Y(n1754) );
  AOI2BB1XL U1915 ( .A0N(n1744), .A1N(n1193), .B0(n1194), .Y(n1190) );
  NOR2XL U1916 ( .A(n1742), .B(n1193), .Y(n1192) );
  NOR2XL U1917 ( .A(n1400), .B(n1399), .Y(n1193) );
  INVXL U1918 ( .A(n1321), .Y(n2069) );
  NAND2BXL U1919 ( .AN(n1199), .B(n1781), .Y(n1198) );
  NOR2XL U1920 ( .A(n1783), .B(n1782), .Y(n1199) );
  XOR2XL U1921 ( .A(n1783), .B(n1782), .Y(n1201) );
  OAI21XL U1922 ( .A0(n1208), .A1(n1228), .B0(n1202), .Y(n1951) );
  NAND2XL U1923 ( .A(n1206), .B(n1204), .Y(n1763) );
  NAND2BXL U1924 ( .AN(n1205), .B(n1228), .Y(n1204) );
  AOI2BB1XL U1925 ( .A0N(n1230), .A1N(n1209), .B0(n1207), .Y(n1206) );
  NOR2XL U1926 ( .A(n1209), .B(n1228), .Y(n1207) );
  XOR2XL U1927 ( .A(n1950), .B(n1949), .Y(n1209) );
  NOR2XL U1928 ( .A(n1211), .B(n1210), .Y(n1966) );
  XOR2XL U1929 ( .A(n1964), .B(n1963), .Y(n1210) );
  INVXL U1930 ( .A(n1534), .Y(n1213) );
  OR2XL U1931 ( .A(n2047), .B(n2068), .Y(n1534) );
  OAI2BB1XL U1932 ( .A0N(n1954), .A1N(n1795), .B0(n1216), .Y(n1776) );
  OAI2BB1XL U1933 ( .A0N(n1215), .A1N(n1214), .B0(n1794), .Y(n1216) );
  XOR2XL U1934 ( .A(n1217), .B(n1794), .Y(n1796) );
  XOR2XL U1935 ( .A(n1954), .B(n1795), .Y(n1217) );
  OAI21XL U1936 ( .A0(n1251), .A1(n1955), .B0(n1929), .Y(n1221) );
  NOR2XL U1937 ( .A(n2334), .B(n2335), .Y(n1941) );
  XOR2XL U1938 ( .A(n1929), .B(n1222), .Y(n2335) );
  AOI21XL U1939 ( .A0(n1955), .A1(n1920), .B0(n1247), .Y(n1222) );
  OAI21XL U1940 ( .A0(n1853), .A1(n1233), .B0(n1854), .Y(n1870) );
  AOI2BB1XL U1941 ( .A0N(n1275), .A1N(n1274), .B0(n1276), .Y(n1224) );
  AOI2BB1XL U1942 ( .A0N(n1226), .A1N(n1536), .B0(n1796), .Y(n1254) );
  NAND2XL U1943 ( .A(n2329), .B(n1227), .Y(n1942) );
  XOR2XL U1944 ( .A(n1227), .B(n2329), .Y(n2330) );
  NAND2BXL U1945 ( .AN(n1229), .B(n1765), .Y(n1228) );
  NOR2XL U1946 ( .A(n1767), .B(n1766), .Y(n1229) );
  XOR2XL U1947 ( .A(n1767), .B(n1766), .Y(n1231) );
  AOI21XL U1948 ( .A0(n1955), .A1(n1763), .B0(n1044), .Y(n1232) );
  NAND2XL U1949 ( .A(n1852), .B(n1919), .Y(n1233) );
  AOI22XL U1950 ( .A0(n1798), .A1(n1797), .B0(n1529), .B1(n1047), .Y(n12430)
         );
  OAI21XL U1951 ( .A0(n1242), .A1(n12430), .B0(n1241), .Y(n1774) );
  AO22XL U1952 ( .A0(n1046), .A1(qrcode_start_whole[7]), .B0(n1965), .B1(n2305), .Y(n1779) );
  NAND2XL U1953 ( .A(n1902), .B(n1938), .Y(n1237) );
  OAI21XL U1954 ( .A0(n1921), .A1(n1239), .B0(n1238), .Y(n1865) );
  XOR2XL U1955 ( .A(n1045), .B(n1240), .Y(n1239) );
  AOI21XL U1956 ( .A0(n1869), .A1(n1870), .B0(n1868), .Y(n1240) );
  NOR2BX1 U1957 ( .AN(n1774), .B(n1268), .Y(n1531) );
  NAND3XL U1958 ( .A(n1410), .B(n1443), .C(decode_length[1]), .Y(n1245) );
  OAI21XL U1959 ( .A0(n1388), .A1(n1554), .B0(n1245), .Y(n1555) );
  INVXL U1960 ( .A(n1656), .Y(n1246) );
  OR2XL U1961 ( .A(n2049), .B(n2376), .Y(n1524) );
  NOR2XL U1962 ( .A(n1726), .B(n1643), .Y(n1727) );
  NOR2XL U1963 ( .A(n1258), .B(n1646), .Y(n1655) );
  INVXL U1964 ( .A(n1653), .Y(n1259) );
  OAI21XL U1965 ( .A0(n1264), .A1(n1260), .B0(n1278), .Y(n1805) );
  NAND3BXL U1966 ( .AN(n1952), .B(n1041), .C(n1262), .Y(n1261) );
  NOR3XL U1967 ( .A(n1534), .B(n1543), .C(n1263), .Y(n1925) );
  NOR2XL U1968 ( .A(n1847), .B(n1534), .Y(n1954) );
  NOR2XL U1969 ( .A(n1952), .B(n1758), .Y(n1264) );
  NOR2XL U1970 ( .A(n1856), .B(n1840), .Y(n1266) );
  OAI21XL U1971 ( .A0(n1921), .A1(n1267), .B0(n1280), .Y(n1279) );
  NAND2XL U1972 ( .A(n1511), .B(n1036), .Y(n1514) );
  NAND2XL U1973 ( .A(n1036), .B(n1505), .Y(n1508) );
  NAND2XL U1974 ( .A(n1036), .B(n1499), .Y(n1502) );
  NAND2XL U1975 ( .A(n1036), .B(n1488), .Y(n1491) );
  NAND2XL U1976 ( .A(n1036), .B(n1482), .Y(n1485) );
  NAND2XL U1977 ( .A(n1036), .B(n1475), .Y(n1477) );
  NAND2XL U1978 ( .A(n1036), .B(n1470), .Y(n1473) );
  NAND2XL U1979 ( .A(n1036), .B(n1464), .Y(n1467) );
  NOR2XL U1980 ( .A(n968), .B(n1270), .Y(n1445) );
  NOR2XL U1981 ( .A(n2771), .B(n1270), .Y(n1444) );
  NOR2XL U1982 ( .A(n2770), .B(n1270), .Y(n1447) );
  NOR2XL U1983 ( .A(n2772), .B(n1270), .Y(n1442) );
  NOR2XL U1984 ( .A(n2773), .B(n1270), .Y(n1441) );
  NOR2XL U1985 ( .A(n963), .B(n1270), .Y(n1440) );
  NOR2XL U1986 ( .A(n961), .B(n1270), .Y(n1452) );
  NOR2XL U1987 ( .A(n962), .B(n1270), .Y(n1439) );
  NAND2XL U1988 ( .A(n1409), .B(n1408), .Y(n1272) );
  XOR2XL U1989 ( .A(n1929), .B(n1279), .Y(n1967) );
  AOI21XL U1990 ( .A0(n1285), .A1(n2314), .B0(n1283), .Y(n1282) );
  NAND2BXL U1991 ( .AN(n1459), .B(n1458), .Y(nstate[3]) );
  MXI2XL U1992 ( .A(n1437), .B(n1436), .S0(n1435), .Y(n2357) );
  OR2XL U1995 ( .A(n1671), .B(n1715), .Y(n1287) );
  OA22X1 U1996 ( .A0(n1468), .A1(n1257), .B0(n2782), .B1(n1524), .Y(n1288) );
  OA22X1 U1997 ( .A0(n1480), .A1(n1257), .B0(n1479), .B1(n1524), .Y(n1289) );
  OA22X1 U1998 ( .A0(n1257), .A1(n1486), .B0(n2780), .B1(n1524), .Y(n1291) );
  OA22X1 U1999 ( .A0(n1257), .A1(n1497), .B0(n2765), .B1(n1524), .Y(n1292) );
  OA22X1 U2000 ( .A0(n1257), .A1(n1503), .B0(n2778), .B1(n1524), .Y(n1293) );
  OA22X1 U2001 ( .A0(n1257), .A1(n1509), .B0(n1301), .B1(n1524), .Y(n1294) );
  OA22X1 U2002 ( .A0(n1257), .A1(n1519), .B0(n2769), .B1(n1524), .Y(n1295) );
  OA22X1 U2003 ( .A0(n1257), .A1(n1525), .B0(n1038), .B1(n1524), .Y(n1296) );
  OR2XL U2004 ( .A(n1411), .B(n1629), .Y(n1297) );
  AO22XL U2005 ( .A0(n1721), .A1(n1720), .B0(n1719), .B1(n1718), .Y(n1298) );
  OR2XL U2006 ( .A(store_cnt[1]), .B(store_cnt[0]), .Y(n1299) );
  OA21X1 U2007 ( .A0(n2017), .A1(n1492), .B0(n1528), .Y(n1300) );
  OR3XL U2008 ( .A(n1726), .B(n1696), .C(n1686), .Y(n1305) );
  OR2XL U2009 ( .A(n1569), .B(n1305), .Y(n1306) );
  NAND2BXL U2010 ( .AN(n1453), .B(n2019), .Y(n1454) );
  OAI21XL U2011 ( .A0(n2252), .A1(n1926), .B0(n1933), .Y(n1309) );
  OR2XL U2012 ( .A(n2312), .B(n2311), .Y(n1310) );
  NAND3BXL U2013 ( .AN(n1769), .B(n1957), .C(n1861), .Y(n1956) );
  NAND2XL U2014 ( .A(n1075), .B(n1377), .Y(n1729) );
  NAND2XL U2015 ( .A(n1835), .B(n1045), .Y(n1838) );
  INVXL U2016 ( .A(decode_length[3]), .Y(n1448) );
  NOR2XL U2017 ( .A(n1431), .B(n1533), .Y(n1422) );
  NAND2BXL U2018 ( .AN(n1448), .B(n2021), .Y(n1449) );
  NOR3XL U2019 ( .A(rotation_type[2]), .B(rotation_type[1]), .C(n2238), .Y(
        n1427) );
  NOR2XL U2020 ( .A(n1934), .B(n1309), .Y(n1937) );
  NOR2XL U2021 ( .A(decode_length[2]), .B(n1374), .Y(n2444) );
  NAND2BXL U2022 ( .AN(n1912), .B(n1911), .Y(n1914) );
  NOR2XL U2023 ( .A(n2047), .B(n2030), .Y(n1325) );
  AOI21XL U2024 ( .A0(rotation_type[2]), .A1(n1351), .B0(n2084), .Y(n1429) );
  BUFX2 U2025 ( .A(N2423), .Y(n2719) );
  INVXL U2028 ( .A(n1931), .Y(n1926) );
  NAND2BXL U2029 ( .AN(n1325), .B(n1324), .Y(n1329) );
  NOR2XL U2031 ( .A(n1329), .B(n1328), .Y(n1331) );
  NOR2XL U2032 ( .A(position_cnt[1]), .B(position_cnt[0]), .Y(n2283) );
  NAND2XL U2033 ( .A(decode_cnt[0]), .B(decode_cnt[1]), .Y(n1705) );
  INVXL U2034 ( .A(store_cnt[0]), .Y(n2252) );
  INVXL U2035 ( .A(position_cnt[2]), .Y(n2143) );
  INVXL U2036 ( .A(n2400), .Y(n2750) );
  INVXL U2037 ( .A(rotation_type[0]), .Y(n2238) );
  INVXL U2038 ( .A(decode_cnt[4]), .Y(n24230) );
  NAND2XL U2039 ( .A(n2130), .B(n2129), .Y(n975) );
  NAND2XL U2040 ( .A(sram_rdata_reg[2]), .B(n2752), .Y(n2395) );
  NAND2XL U2041 ( .A(n2123), .B(n2129), .Y(n974) );
  OAI31XL U2042 ( .A0(state[2]), .A1(n2420), .A2(n2734), .B0(n2784), .Y(
        net6035) );
  OAI31XL U2043 ( .A0(n2415), .A1(n2414), .A2(n2413), .B0(n2412), .Y(N1009) );
  INVXL U2044 ( .A(n1460), .Y(n1311) );
  NOR2XL U2045 ( .A(n1311), .B(n2068), .Y(decode_jis8_valid_reg0) );
  NOR3XL U2046 ( .A(decode_length[5]), .B(decode_length[6]), .C(
        decode_length[7]), .Y(n1312) );
  INVX1 U2047 ( .A(decode_length[2]), .Y(n1443) );
  NOR2XL U2048 ( .A(n1388), .B(n1381), .Y(n1549) );
  INVXL U2049 ( .A(n1320), .Y(n1318) );
  INVXL U2050 ( .A(decode_cnt[3]), .Y(n2058) );
  NOR2XL U2051 ( .A(decode_cnt[5]), .B(decode_cnt[6]), .Y(n1313) );
  NAND2XL U2052 ( .A(n1313), .B(n24230), .Y(n1316) );
  NOR2XL U2053 ( .A(n1314), .B(n1316), .Y(n2159) );
  INVXL U2054 ( .A(n2159), .Y(n1319) );
  NOR2XL U2055 ( .A(n1318), .B(n1319), .Y(n1315) );
  NAND2XL U2056 ( .A(n2160), .B(n1315), .Y(n962) );
  NAND2XL U2057 ( .A(n1315), .B(n2070), .Y(n963) );
  INVXL U2058 ( .A(n1705), .Y(n1683) );
  NAND2XL U2059 ( .A(n1683), .B(n1317), .Y(n1001) );
  NAND2XL U2060 ( .A(n1746), .B(n1317), .Y(n1002) );
  NAND2XL U2061 ( .A(n2160), .B(n1317), .Y(n1003) );
  NOR2XL U2062 ( .A(decode_cnt[2]), .B(n1705), .Y(n1563) );
  NAND2XL U2063 ( .A(n1320), .B(n2349), .Y(n968) );
  NAND2XL U2064 ( .A(n2070), .B(n1317), .Y(n1004) );
  NOR2XL U2065 ( .A(n1180), .B(n1319), .Y(n2358) );
  NAND2XL U2066 ( .A(n1320), .B(n2358), .Y(n961) );
  NOR2X1 U2067 ( .A(state[1]), .B(n1321), .Y(n2369) );
  NAND2XL U2068 ( .A(n2245), .B(n1339), .Y(n1350) );
  INVXL U2069 ( .A(n2751), .Y(n2074) );
  NOR2XL U2070 ( .A(n2763), .B(n2074), .Y(n2738) );
  INVXL U2071 ( .A(n1330), .Y(n1322) );
  OR2XL U2072 ( .A(n1322), .B(store_cnt[4]), .Y(n2075) );
  NOR3XL U2073 ( .A(n2075), .B(n2252), .C(store_cnt[1]), .Y(n2737) );
  INVXL U2074 ( .A(n2737), .Y(n1323) );
  AOI22XL U2075 ( .A0(n2291), .A1(n1350), .B0(n2738), .B1(n1323), .Y(n1324) );
  NOR2XL U2076 ( .A(check[2]), .B(check[0]), .Y(n1333) );
  NAND2XL U2077 ( .A(n1333), .B(n2756), .Y(n2747) );
  INVXL U2078 ( .A(n2747), .Y(n2293) );
  INVXL U2079 ( .A(n2073), .Y(n1326) );
  INVXL U2080 ( .A(n1969), .Y(n2375) );
  INVXL U2081 ( .A(position_cnt[6]), .Y(n2044) );
  NOR2XL U2082 ( .A(position_cnt[5]), .B(position_cnt[4]), .Y(n2144) );
  NAND4XL U2083 ( .A(position_cnt[3]), .B(position_cnt[0]), .C(n1072), .D(
        n2168), .Y(n2076) );
  INVXL U2084 ( .A(n2359), .Y(n1327) );
  NAND2XL U2085 ( .A(n2069), .B(n1327), .Y(n2009) );
  OAI22XL U2086 ( .A0(n2293), .A1(n2400), .B0(n2076), .B1(n2009), .Y(n1328) );
  NOR2XL U2087 ( .A(n2764), .B(n2359), .Y(n2419) );
  NOR2XL U2088 ( .A(state[1]), .B(n2764), .Y(n2071) );
  NAND2XL U2089 ( .A(state[2]), .B(n2071), .Y(n2287) );
  NAND2XL U2090 ( .A(n2358), .B(state[0]), .Y(n2288) );
  NAND2BXL U2091 ( .AN(n2287), .B(n2288), .Y(n2052) );
  NOR2XL U2092 ( .A(store_cnt[6]), .B(store_cnt[5]), .Y(n2251) );
  INVXL U2093 ( .A(store_cnt[3]), .Y(n2248) );
  NAND4XL U2094 ( .A(store_cnt[2]), .B(n2251), .C(n2252), .D(n2248), .Y(n2735)
         );
  NAND3BXL U2095 ( .AN(n2735), .B(store_cnt[1]), .C(store_cnt[4]), .Y(n2072)
         );
  NAND2BXL U2096 ( .AN(n2073), .B(n2072), .Y(n2749) );
  NAND2XL U2097 ( .A(store_cnt[1]), .B(store_cnt[0]), .Y(n2246) );
  INVXL U2098 ( .A(n2246), .Y(n2066) );
  NAND4XL U2099 ( .A(store_cnt[4]), .B(n2066), .C(n2375), .D(n1330), .Y(n2241)
         );
  NAND2XL U2100 ( .A(n2749), .B(n2241), .Y(n2292) );
  NOR3BXL U2101 ( .AN(n1331), .B(n2745), .C(n2292), .Y(n1332) );
  INVXL U2102 ( .A(n1332), .Y(n1459) );
  NAND2XL U2103 ( .A(check[1]), .B(n1333), .Y(n2233) );
  NAND3BXL U2104 ( .AN(check[0]), .B(check[2]), .C(n2756), .Y(n2226) );
  INVXL U2105 ( .A(n2226), .Y(n2221) );
  NAND2BXL U2106 ( .AN(check[2]), .B(check[0]), .Y(n1334) );
  NOR2XL U2107 ( .A(check[1]), .B(n1334), .Y(n2229) );
  AOI22XL U2108 ( .A0(n2221), .A1(mask_pattern[6]), .B0(n2229), .B1(
        mask_pattern[1]), .Y(n1336) );
  NAND2BXL U2109 ( .AN(n1334), .B(check[1]), .Y(n2228) );
  INVXL U2110 ( .A(n2228), .Y(n2211) );
  NAND2XL U2111 ( .A(n2211), .B(mask_pattern[3]), .Y(n1335) );
  INVXL U2112 ( .A(n2233), .Y(n2220) );
  AOI22XL U2113 ( .A0(mask_pattern[2]), .A1(n2229), .B0(mask_pattern[3]), .B1(
        n2220), .Y(n1346) );
  AOI22XL U2114 ( .A0(mask_pattern[2]), .A1(n2221), .B0(n2229), .B1(
        mask_pattern[5]), .Y(n1338) );
  NAND2XL U2115 ( .A(n2211), .B(mask_pattern[7]), .Y(n1337) );
  AOI22XL U2116 ( .A0(n2221), .A1(mask_pattern[1]), .B0(n2229), .B1(
        mask_pattern[6]), .Y(n1341) );
  NAND2XL U2117 ( .A(n2211), .B(mask_pattern[0]), .Y(n1340) );
  AOI22XL U2118 ( .A0(n1427), .A1(n1343), .B0(n2277), .B1(n1342), .Y(n1345) );
  AOI22XL U2119 ( .A0(n2211), .A1(mask_pattern[4]), .B0(n2221), .B1(
        mask_pattern[5]), .Y(n1344) );
  AOI21XL U2120 ( .A0(n1421), .A1(n1348), .B0(n1347), .Y(n1360) );
  AOI22XL U2121 ( .A0(n2229), .A1(mask_pattern[0]), .B0(n2220), .B1(
        mask_pattern[1]), .Y(n1353) );
  AOI22XL U2122 ( .A0(n2211), .A1(mask_pattern[2]), .B0(n2221), .B1(
        mask_pattern[3]), .Y(n1352) );
  INVXL U2123 ( .A(n1349), .Y(n1351) );
  INVXL U2124 ( .A(n1350), .Y(n2084) );
  NOR2XL U2125 ( .A(n1360), .B(n2511), .Y(n2599) );
  AOI22XL U2126 ( .A0(n2211), .A1(mask_pattern[6]), .B0(n2221), .B1(
        mask_pattern[7]), .Y(n1357) );
  AOI22XL U2127 ( .A0(n2229), .A1(mask_pattern[4]), .B0(n2220), .B1(
        mask_pattern[5]), .Y(n1356) );
  INVXL U2128 ( .A(n1847), .Y(n1354) );
  NOR2XL U2129 ( .A(n1045), .B(n1354), .Y(n2276) );
  INVXL U2130 ( .A(n1427), .Y(n1355) );
  AOI22XL U2131 ( .A0(n1357), .A1(n1356), .B0(n2276), .B1(n1355), .Y(n2443) );
  NAND2XL U2132 ( .A(n1360), .B(n2511), .Y(n2467) );
  NOR2XL U2133 ( .A(n2443), .B(n2467), .Y(n2520) );
  NOR2XL U2134 ( .A(n2599), .B(n2520), .Y(n2551) );
  INVXL U2135 ( .A(n2443), .Y(n2512) );
  NOR2XL U2136 ( .A(n1360), .B(n2512), .Y(n2646) );
  NAND2XL U2137 ( .A(n2646), .B(n2511), .Y(n2548) );
  INVXL U2138 ( .A(n2511), .Y(n2501) );
  NAND2XL U2139 ( .A(n2501), .B(n1360), .Y(n2477) );
  NOR2XL U2140 ( .A(n2477), .B(n2443), .Y(n2523) );
  INVXL U2141 ( .A(n2523), .Y(n2678) );
  NAND2XL U2142 ( .A(n2548), .B(n2678), .Y(n2615) );
  NAND2XL U2143 ( .A(decode_cnt[2]), .B(n1705), .Y(n1359) );
  INVXL U2144 ( .A(n1417), .Y(n2057) );
  INVXL U2145 ( .A(n1360), .Y(n2432) );
  NOR2XL U2146 ( .A(n2432), .B(n2512), .Y(n2502) );
  NAND2XL U2147 ( .A(n2432), .B(n2512), .Y(n2484) );
  NOR2XL U2148 ( .A(n2501), .B(n2484), .Y(n2483) );
  AOI21XL U2149 ( .A0(n2501), .A1(n2502), .B0(n2483), .Y(n2509) );
  OAI21XL U2150 ( .A0(n2477), .A1(n2057), .B0(n2509), .Y(n1364) );
  NOR2XL U2151 ( .A(n2160), .B(n1746), .Y(n2056) );
  INVXL U2152 ( .A(n2056), .Y(n1363) );
  INVXL U2153 ( .A(n2483), .Y(n2546) );
  NOR2XL U2154 ( .A(n2443), .B(n2511), .Y(n2522) );
  NAND2XL U2155 ( .A(n2522), .B(n2432), .Y(n2455) );
  NAND2XL U2156 ( .A(n2502), .B(n2511), .Y(n1361) );
  AOI22XL U2157 ( .A0(decode_cnt[1]), .A1(n1364), .B0(n1363), .B1(n1362), .Y(
        n1365) );
  NAND2XL U2158 ( .A(n2226), .B(n2233), .Y(n1835) );
  NOR2XL U2159 ( .A(decode_length[2]), .B(decode_length[4]), .Y(n1367) );
  NOR2XL U2160 ( .A(n2435), .B(n1413), .Y(n1733) );
  NOR2XL U2161 ( .A(n1733), .B(n1643), .Y(n1557) );
  NAND2XL U2162 ( .A(decode_length[2]), .B(decode_length[4]), .Y(n1642) );
  INVXL U2163 ( .A(n1642), .Y(n1671) );
  NOR2XL U2166 ( .A(decode_length[3]), .B(decode_length[2]), .Y(n1368) );
  NAND2XL U2167 ( .A(decode_length[4]), .B(n1368), .Y(n1386) );
  NAND2XL U2169 ( .A(n2801), .B(n1371), .Y(n1699) );
  NAND2XL U2170 ( .A(decode_length[3]), .B(decode_length[2]), .Y(n1412) );
  INVXL U2171 ( .A(n1381), .Y(n1609) );
  NOR2XL U2172 ( .A(n1388), .B(n1413), .Y(n1690) );
  INVXL U2173 ( .A(n1412), .Y(n1369) );
  NOR2XL U2175 ( .A(n1413), .B(n2803), .Y(n1625) );
  NOR2XL U2176 ( .A(n1733), .B(n1625), .Y(n1385) );
  INVXL U2177 ( .A(decode_length[4]), .Y(n2440) );
  INVXL U2178 ( .A(n2444), .Y(n1372) );
  NOR2XL U2179 ( .A(n1726), .B(n1688), .Y(n1373) );
  NAND2XL U2180 ( .A(n1385), .B(n1373), .Y(n1378) );
  NOR2XL U2181 ( .A(n2439), .B(n1074), .Y(n1565) );
  NOR2XL U2182 ( .A(n1412), .B(n1374), .Y(n1624) );
  OR2XL U2183 ( .A(n1624), .B(n1565), .Y(n1646) );
  INVXL U2185 ( .A(n2439), .Y(n1375) );
  OR2XL U2186 ( .A(n1388), .B(n1386), .Y(n1394) );
  NAND2XL U2187 ( .A(n1564), .B(n1394), .Y(n1376) );
  NOR2XL U2188 ( .A(n2719), .B(n1554), .Y(n1644) );
  NOR2XL U2189 ( .A(n1412), .B(n1388), .Y(n1652) );
  NOR2XL U2190 ( .A(n1554), .B(n2803), .Y(n1551) );
  AOI211XL U2191 ( .A0(n1683), .A1(n1748), .B0(n1417), .C0(n1042), .Y(n1409)
         );
  NOR2XL U2192 ( .A(n2719), .B(n1381), .Y(n1653) );
  INVXL U2193 ( .A(n1557), .Y(n1713) );
  NOR2XL U2194 ( .A(n1374), .B(n1381), .Y(n1715) );
  OR2XL U2195 ( .A(n1690), .B(n1715), .Y(n1382) );
  NAND2BXL U2196 ( .AN(n1382), .B(n1075), .Y(n1383) );
  NOR2XL U2197 ( .A(n1713), .B(n1383), .Y(n1384) );
  NAND2XL U2198 ( .A(n1724), .B(n1384), .Y(n1747) );
  INVXL U2199 ( .A(n1385), .Y(n1387) );
  NAND2BXL U2200 ( .AN(n1387), .B(n1728), .Y(n1389) );
  NOR2XL U2201 ( .A(n2439), .B(n1388), .Y(n1392) );
  NOR2XL U2202 ( .A(n1671), .B(n1392), .Y(n1735) );
  INVXL U2203 ( .A(n1735), .Y(n1628) );
  NOR2XL U2204 ( .A(n1180), .B(n1749), .Y(n1390) );
  AOI21XL U2205 ( .A0(n2070), .A1(n1747), .B0(n1390), .Y(n1408) );
  NOR2XL U2206 ( .A(decode_length[1]), .B(n1413), .Y(n1391) );
  NOR2XL U2207 ( .A(n1391), .B(n1715), .Y(n1722) );
  NOR2XL U2208 ( .A(n1689), .B(n1392), .Y(n1398) );
  INVXL U2209 ( .A(n1688), .Y(n1691) );
  NAND3XL U2210 ( .A(n1722), .B(n1398), .C(n1691), .Y(n1393) );
  NOR2XL U2211 ( .A(n1393), .B(n1729), .Y(n1743) );
  NAND2XL U2212 ( .A(n1394), .B(n1401), .Y(n1396) );
  NOR2XL U2213 ( .A(n1726), .B(n1713), .Y(n1395) );
  NAND2XL U2214 ( .A(n1724), .B(n1395), .Y(n1399) );
  NOR2XL U2215 ( .A(n1396), .B(n1399), .Y(n1741) );
  OAI22XL U2216 ( .A0(n1744), .A1(n1743), .B0(n1705), .B1(n1741), .Y(n1406) );
  INVXL U2217 ( .A(n2070), .Y(n1742) );
  INVXL U2218 ( .A(n1739), .Y(n1679) );
  NAND3XL U2219 ( .A(n1398), .B(n1679), .C(n1075), .Y(n1400) );
  NAND2XL U2220 ( .A(n1401), .B(n1722), .Y(n1402) );
  NOR2XL U2221 ( .A(n1180), .B(n1750), .Y(n1403) );
  NOR2XL U2222 ( .A(n2057), .B(n1403), .Y(n1404) );
  NOR2XL U2223 ( .A(n1406), .B(n1405), .Y(n1407) );
  INVXL U2224 ( .A(n1429), .Y(n1419) );
  BUFX2 U2225 ( .A(n1410), .Y(n1411) );
  NOR2XL U2226 ( .A(decode_length[1]), .B(n1412), .Y(n1696) );
  INVXL U2227 ( .A(n1413), .Y(n1414) );
  NOR2XL U2228 ( .A(n1696), .B(n1414), .Y(n1416) );
  NAND2XL U2229 ( .A(n1416), .B(n1415), .Y(n1678) );
  NOR2XL U2230 ( .A(n1411), .B(n1678), .Y(n1738) );
  OAI21XL U2231 ( .A0(n1847), .A1(n1432), .B0(n1056), .Y(n1420) );
  INVXL U2232 ( .A(n1835), .Y(n1839) );
  MXI2XL U2233 ( .A(sram_rdata_reg[0]), .B(sram_rdata_reg[1]), .S0(n1424), .Y(
        n1437) );
  MXI2XL U2234 ( .A(sram_rdata_reg[2]), .B(sram_rdata_reg[3]), .S0(n1424), .Y(
        n1436) );
  NOR2XL U2235 ( .A(n1427), .B(n2277), .Y(n1425) );
  NAND2XL U2236 ( .A(n1425), .B(n1429), .Y(n1426) );
  INVXL U2237 ( .A(n1426), .Y(n1952) );
  NAND2XL U2238 ( .A(n2226), .B(n2228), .Y(n1756) );
  OAI21XL U2239 ( .A0(n1429), .A1(n1432), .B0(n1428), .Y(n1430) );
  INVXL U2240 ( .A(n1756), .Y(n1757) );
  OAI222XL U2241 ( .A0(n1432), .A1(n1533), .B0(n1757), .B1(n1952), .C0(n1847), 
        .C1(n1431), .Y(n1433) );
  NOR2XL U2242 ( .A(N4134), .B(n1440), .Y(n2020) );
  INVXL U2243 ( .A(decode_length[5]), .Y(n1451) );
  NOR2XL U2244 ( .A(N4128), .B(n1442), .Y(n2021) );
  NAND2XL U2245 ( .A(n2440), .B(n2347), .Y(n1450) );
  NOR2XL U2246 ( .A(N4095), .B(n1445), .Y(n1446) );
  INVXL U2247 ( .A(decode_length[7]), .Y(n1453) );
  NOR2XL U2248 ( .A(N4140), .B(n1452), .Y(n2019) );
  OR2XL U2249 ( .A(decode_length[7]), .B(n2019), .Y(n1455) );
  OAI21XL U2250 ( .A0(n1457), .A1(n1456), .B0(n1455), .Y(n2296) );
  NAND2XL U2251 ( .A(decode_jis8_valid_reg0), .B(n2296), .Y(n1458) );
  INVXL U2252 ( .A(n2752), .Y(n1462) );
  INVXL U2253 ( .A(n2079), .Y(n1461) );
  INVXL U2254 ( .A(qrcode_start[9]), .Y(n2280) );
  INVXL U2255 ( .A(n2742), .Y(n2049) );
  XOR2XL U2256 ( .A(start_pos[9]), .B(n1465), .Y(n1993) );
  INVXL U2258 ( .A(qrcode_start[8]), .Y(n1468) );
  ADDHX1 U2259 ( .A(qrcode_start[8]), .B(n1469), .CO(n1463), .S(n1470) );
  ADDHX1 U2260 ( .A(start_pos[8]), .B(n1471), .CO(n1465), .S(n1991) );
  NAND2XL U2261 ( .A(n1523), .B(n1991), .Y(n1472) );
  NAND3XL U2262 ( .A(n1288), .B(n1473), .C(n1472), .Y(n1532) );
  ADDHX1 U2263 ( .A(qrcode_start[7]), .B(n1474), .CO(n1469), .S(n1475) );
  ADDHX1 U2264 ( .A(start_pos[7]), .B(n1476), .CO(n1471), .S(n1989) );
  INVXL U2265 ( .A(qrcode_start[6]), .Y(n1480) );
  INVXL U2266 ( .A(start_pos[6]), .Y(n1479) );
  ADDHX1 U2267 ( .A(qrcode_start[6]), .B(n1481), .CO(n1474), .S(n1482) );
  NAND2XL U2268 ( .A(n1523), .B(n1987), .Y(n1484) );
  INVXL U2269 ( .A(N2948), .Y(n1486) );
  NAND2XL U2270 ( .A(n1523), .B(n1975), .Y(n1490) );
  NAND3XL U2271 ( .A(n1291), .B(n1491), .C(n1490), .Y(n1797) );
  INVXL U2272 ( .A(n1492), .Y(n1494) );
  AOI211XL U2273 ( .A0(position_cnt[5]), .A1(n1494), .B0(n1066), .C0(n1493), 
        .Y(n1495) );
  INVXL U2274 ( .A(n1495), .Y(n1798) );
  INVXL U2275 ( .A(n1496), .Y(n1529) );
  INVXL U2276 ( .A(position_cnt[4]), .Y(n2037) );
  NOR2XL U2277 ( .A(n2037), .B(n1492), .Y(n1821) );
  INVXL U2278 ( .A(N2947), .Y(n1497) );
  ADDHX1 U2279 ( .A(N2947), .B(n1498), .CO(n1487), .S(n1499) );
  ADDFX1 U2280 ( .A(store_cnt[4]), .B(start_pos[4]), .CI(n1500), .CO(n1489), 
        .S(n1981) );
  NAND2XL U2281 ( .A(n1523), .B(n1981), .Y(n1501) );
  NAND3XL U2282 ( .A(n1292), .B(n1502), .C(n1501), .Y(n1820) );
  INVXL U2283 ( .A(n1523), .Y(n1528) );
  OAI21XL U2284 ( .A0(n2147), .A1(n1492), .B0(n1528), .Y(n1883) );
  INVXL U2285 ( .A(N2946), .Y(n1503) );
  ADDFX1 U2286 ( .A(store_cnt[3]), .B(start_pos[3]), .CI(n1506), .CO(n1500), 
        .S(n1983) );
  NAND2XL U2287 ( .A(n1523), .B(n1983), .Y(n1507) );
  NAND3XL U2288 ( .A(n1293), .B(n1508), .C(n1507), .Y(n1882) );
  OAI21XL U2289 ( .A0(n2143), .A1(n1492), .B0(n1528), .Y(n1891) );
  INVXL U2290 ( .A(N2945), .Y(n1509) );
  ADDFX1 U2291 ( .A(store_cnt[2]), .B(start_pos[2]), .CI(n1512), .CO(n1506), 
        .S(n1985) );
  NAND2XL U2292 ( .A(n1523), .B(n1985), .Y(n1513) );
  NAND3XL U2293 ( .A(n1294), .B(n1514), .C(n1513), .Y(n1890) );
  NOR2XL U2294 ( .A(n2168), .B(n1492), .Y(n1905) );
  ADDFX1 U2295 ( .A(store_cnt[1]), .B(start_pos[1]), .CI(n1515), .CO(n1512), 
        .S(n1976) );
  NAND2BXL U2296 ( .AN(n1057), .B(n1518), .Y(n1520) );
  INVXL U2297 ( .A(N2944), .Y(n1519) );
  NAND2BXL U2298 ( .AN(n1520), .B(n1295), .Y(n1904) );
  INVXL U2299 ( .A(n1521), .Y(n1522) );
  NAND2XL U2300 ( .A(n1523), .B(n1978), .Y(n1526) );
  INVXL U2301 ( .A(N2943), .Y(n1525) );
  XOR2XL U2302 ( .A(n1532), .B(n1531), .Y(n2301) );
  AO22XL U2303 ( .A0(qrcode_start_whole[8]), .A1(n1046), .B0(n1965), .B1(n2301), .Y(n1545) );
  INVXL U2304 ( .A(n28080), .Y(n1962) );
  INVXL U2305 ( .A(n1953), .Y(n1959) );
  INVXL U2306 ( .A(qrcode_start_whole[8]), .Y(n1535) );
  OAI22XL U2307 ( .A0(n2248), .A1(n1959), .B0(n1535), .B1(n28080), .Y(n1961)
         );
  INVXL U2308 ( .A(store_cnt[2]), .Y(n2247) );
  INVXL U2309 ( .A(qrcode_start_whole[7]), .Y(n1768) );
  OAI22XL U2310 ( .A0(n2247), .A1(n1959), .B0(n1768), .B1(n28080), .Y(n1777)
         );
  INVXL U2311 ( .A(store_cnt[1]), .Y(n1537) );
  INVXL U2312 ( .A(qrcode_start_whole[6]), .Y(n1536) );
  INVXL U2313 ( .A(qrcode_start_whole[5]), .Y(n1538) );
  OAI22XL U2314 ( .A0(n2252), .A1(n1959), .B0(n1538), .B1(n28080), .Y(n1801)
         );
  INVXL U2315 ( .A(qrcode_start_whole[4]), .Y(n1539) );
  NOR2XL U2316 ( .A(n1539), .B(n28080), .Y(n1823) );
  INVXL U2317 ( .A(qrcode_start_whole[3]), .Y(n1540) );
  NOR2XL U2318 ( .A(n1540), .B(n1957), .Y(n1885) );
  INVXL U2319 ( .A(qrcode_start_whole[2]), .Y(n1541) );
  NOR2XL U2320 ( .A(n1541), .B(n1957), .Y(n1893) );
  INVXL U2321 ( .A(qrcode_start_whole[1]), .Y(n1542) );
  INVXL U2322 ( .A(qrcode_start_whole[0]), .Y(n1543) );
  NOR2XL U2323 ( .A(rotation_cnt[2]), .B(rotation_cnt[1]), .Y(n2157) );
  NOR2XL U2324 ( .A(n2751), .B(n2291), .Y(n1930) );
  NOR2XL U2325 ( .A(n2157), .B(n1930), .Y(n1769) );
  NOR2XL U2326 ( .A(rotation_cnt[2]), .B(rotation_cnt[0]), .Y(n1546) );
  NOR2XL U2327 ( .A(n1546), .B(n2157), .Y(n1784) );
  INVXL U2328 ( .A(n2009), .Y(n2753) );
  NAND2XL U2329 ( .A(n1784), .B(n2753), .Y(n1861) );
  INVXL U2330 ( .A(n1738), .Y(n1562) );
  NOR2XL U2331 ( .A(decode_cnt[0]), .B(decode_cnt[2]), .Y(n1721) );
  INVXL U2332 ( .A(n1721), .Y(n1548) );
  NAND2XL U2333 ( .A(decode_cnt[2]), .B(n1746), .Y(n1593) );
  INVXL U2334 ( .A(n1689), .Y(n1547) );
  OAI22XL U2335 ( .A0(n1548), .A1(n1679), .B0(n1593), .B1(n1547), .Y(n1561) );
  NOR2XL U2336 ( .A(n2435), .B(n1554), .Y(n1550) );
  NOR2XL U2337 ( .A(n1550), .B(n1549), .Y(n1568) );
  NOR2XL U2338 ( .A(n1726), .B(n1690), .Y(n1667) );
  NAND2XL U2339 ( .A(n1568), .B(n1667), .Y(n1574) );
  NOR2XL U2340 ( .A(n1182), .B(n1551), .Y(n1553) );
  NOR3XL U2341 ( .A(n1652), .B(n1687), .C(n1714), .Y(n1552) );
  NAND2XL U2342 ( .A(n1553), .B(n1552), .Y(n1558) );
  NOR3XL U2343 ( .A(n1624), .B(n1555), .C(n1625), .Y(n1556) );
  NAND2XL U2344 ( .A(n1557), .B(n1556), .Y(n1585) );
  NOR3XL U2346 ( .A(n1574), .B(n1558), .C(n1585), .Y(n1559) );
  NOR2XL U2347 ( .A(decode_cnt[0]), .B(n1559), .Y(n1560) );
  AOI211XL U2348 ( .A0(decode_cnt[0]), .A1(n1562), .B0(n1561), .C0(n1560), .Y(
        n1858) );
  AO21XL U2349 ( .A0(decode_cnt[2]), .A1(n1697), .B0(n1563), .Y(n1601) );
  INVXL U2350 ( .A(n1564), .Y(n1661) );
  NOR2XL U2351 ( .A(n1661), .B(n1739), .Y(n1587) );
  INVXL U2352 ( .A(n1687), .Y(n1571) );
  NAND2XL U2353 ( .A(n1587), .B(n1571), .Y(n1569) );
  NOR2XL U2354 ( .A(n1374), .B(n1642), .Y(n1566) );
  NOR3XL U2355 ( .A(n1392), .B(n1565), .C(n1566), .Y(n1572) );
  NOR2XL U2356 ( .A(n1642), .B(n2435), .Y(n1579) );
  NOR2XL U2357 ( .A(n1579), .B(n1551), .Y(n1567) );
  NAND3XL U2358 ( .A(n1572), .B(n1568), .C(n1567), .Y(n1686) );
  INVXL U2359 ( .A(n1696), .Y(n1570) );
  NAND2XL U2360 ( .A(n1570), .B(n1587), .Y(n1575) );
  NAND2XL U2361 ( .A(n1572), .B(n1571), .Y(n1573) );
  NOR3XL U2362 ( .A(n1575), .B(n1574), .C(n1573), .Y(n1577) );
  NOR2XL U2363 ( .A(n1755), .B(n1705), .Y(n2060) );
  AOI21XL U2364 ( .A0(n1746), .A1(n1687), .B0(n1305), .Y(n1576) );
  OAI22XL U2365 ( .A0(n1577), .A1(n2059), .B0(decode_cnt[2]), .B1(n1576), .Y(
        n1582) );
  INVXL U2366 ( .A(n1690), .Y(n1591) );
  INVXL U2367 ( .A(n1577), .Y(n1578) );
  OAI21XL U2368 ( .A0(n1579), .A1(n1578), .B0(n1746), .Y(n1580) );
  AOI21XL U2369 ( .A0(n1591), .A1(n1580), .B0(n1755), .Y(n1581) );
  AOI211XL U2370 ( .A0(n1601), .A1(n1306), .B0(n1582), .C0(n1581), .Y(n1855)
         );
  OAI22XL U2371 ( .A0(n1858), .A1(n1856), .B0(n1848), .B1(n1855), .Y(n1583) );
  OAI22XL U2372 ( .A0(n1858), .A1(n1847), .B0(n1533), .B1(n1855), .Y(n1584) );
  NOR2XL U2373 ( .A(decode_length[1]), .B(n1642), .Y(n1586) );
  NOR3XL U2374 ( .A(n1687), .B(n1652), .C(n1588), .Y(n1592) );
  INVXL U2375 ( .A(n1667), .Y(n1710) );
  NAND2XL U2376 ( .A(n1746), .B(n1589), .Y(n1590) );
  INVXL U2377 ( .A(n1593), .Y(n1606) );
  NAND2XL U2378 ( .A(n1628), .B(n2433), .Y(n1596) );
  INVXL U2379 ( .A(n1551), .Y(n1626) );
  NOR2XL U2380 ( .A(n1595), .B(n1585), .Y(n1597) );
  NAND2XL U2381 ( .A(n1596), .B(n1597), .Y(n1605) );
  INVXL U2382 ( .A(n2435), .Y(n2434) );
  OAI21XL U2383 ( .A0(n1371), .A1(n2434), .B0(n1671), .Y(n1598) );
  NAND2XL U2384 ( .A(n1598), .B(n1597), .Y(n1603) );
  NOR3XL U2385 ( .A(n1726), .B(n1392), .C(n1182), .Y(n1600) );
  NAND2XL U2386 ( .A(n1600), .B(n1599), .Y(n1602) );
  AOI22XL U2387 ( .A0(n2060), .A1(n1603), .B0(n1602), .B1(n1601), .Y(n1604) );
  AOI21XL U2388 ( .A0(n1755), .A1(n1608), .B0(n1607), .Y(n1829) );
  NOR3XL U2389 ( .A(n1375), .B(n1671), .C(n1664), .Y(n1611) );
  NAND2XL U2390 ( .A(n1611), .B(n1610), .Y(n1629) );
  INVXL U2391 ( .A(n1629), .Y(n1612) );
  NOR2XL U2392 ( .A(n1180), .B(n1612), .Y(n1615) );
  NOR2XL U2393 ( .A(n1671), .B(n1689), .Y(n1708) );
  NOR3XL U2395 ( .A(n1688), .B(n2802), .C(n1613), .Y(n1635) );
  NOR2XL U2396 ( .A(n1742), .B(n1307), .Y(n1614) );
  NOR2XL U2397 ( .A(n1615), .B(n1614), .Y(n1616) );
  NAND2XL U2398 ( .A(n1617), .B(n1616), .Y(n1620) );
  NOR2XL U2399 ( .A(decode_cnt[2]), .B(n1732), .Y(n1719) );
  INVXL U2400 ( .A(n1635), .Y(n1619) );
  NAND2XL U2401 ( .A(n1626), .B(n1648), .Y(n1627) );
  NOR2XL U2402 ( .A(n1628), .B(n1632), .Y(n1631) );
  AOI22XL U2403 ( .A0(n1689), .A1(n2070), .B0(n1732), .B1(n1297), .Y(n1630) );
  OAI21XL U2404 ( .A0(n1631), .A1(n1732), .B0(n1630), .Y(n1641) );
  OR2XL U2405 ( .A(n1287), .B(n1632), .Y(n1639) );
  INVXL U2406 ( .A(n1411), .Y(n1634) );
  NOR2XL U2407 ( .A(n1443), .B(n1374), .Y(n2700) );
  OR2XL U2408 ( .A(n1634), .B(n2700), .Y(n1636) );
  NAND2XL U2409 ( .A(n1636), .B(n1635), .Y(n1637) );
  AOI22XL U2410 ( .A0(n1733), .A1(n2060), .B0(n1721), .B1(n1637), .Y(n1638) );
  NOR3XL U2411 ( .A(n1690), .B(n1653), .C(n1696), .Y(n1645) );
  NOR2XL U2412 ( .A(n1074), .B(n1642), .Y(n1656) );
  NOR3XL U2413 ( .A(n1656), .B(n1644), .C(n1643), .Y(n1666) );
  NAND2XL U2414 ( .A(n1691), .B(n1649), .Y(n1673) );
  OR2XL U2415 ( .A(n1742), .B(n1647), .Y(n1660) );
  INVXL U2416 ( .A(n1648), .Y(n1651) );
  INVXL U2417 ( .A(n1649), .Y(n1650) );
  NOR2XL U2418 ( .A(n1651), .B(n1650), .Y(n1658) );
  AOI2BB1XL U2419 ( .A0N(n1744), .A1N(n1658), .B0(n1657), .Y(n1659) );
  NAND2XL U2420 ( .A(n1660), .B(n1659), .Y(n1676) );
  NOR3XL U2421 ( .A(n1661), .B(n1392), .C(n1182), .Y(n1662) );
  NAND2XL U2422 ( .A(n1662), .B(n1610), .Y(n1669) );
  NOR2XL U2423 ( .A(n1687), .B(n1664), .Y(n1665) );
  NAND3XL U2424 ( .A(n1667), .B(n1666), .C(n1665), .Y(n1668) );
  AOI211XL U2426 ( .A0(n1074), .A1(n1671), .B0(n1739), .C0(n1392), .Y(n1672)
         );
  OAI22XL U2427 ( .A0(n1850), .A1(n1856), .B0(n1848), .B1(n1077), .Y(n1783) );
  OAI22XL U2428 ( .A0(n1850), .A1(n1847), .B0(n1533), .B1(n1077), .Y(n1677) );
  NAND2XL U2429 ( .A(n1735), .B(n1075), .Y(n1692) );
  NOR2XL U2430 ( .A(n1714), .B(n1678), .Y(n1681) );
  NAND2XL U2431 ( .A(n1679), .B(n1681), .Y(n1680) );
  NOR2XL U2432 ( .A(n1692), .B(n1680), .Y(n1685) );
  INVXL U2433 ( .A(n1681), .Y(n1682) );
  NAND2XL U2434 ( .A(n1683), .B(n1682), .Y(n1684) );
  NOR2XL U2435 ( .A(n1411), .B(n1690), .Y(n1694) );
  NAND2XL U2436 ( .A(n1691), .B(n1694), .Y(n1693) );
  NOR2XL U2437 ( .A(n1693), .B(n1692), .Y(n1704) );
  NAND2XL U2438 ( .A(n1694), .B(n1610), .Y(n1695) );
  NAND2XL U2439 ( .A(n1746), .B(n1695), .Y(n1703) );
  NAND2XL U2440 ( .A(n1697), .B(n1696), .Y(n1698) );
  AOI21XL U2441 ( .A0(n2160), .A1(n1701), .B0(n1700), .Y(n1702) );
  BUFX2 U2442 ( .A(n1831), .Y(n1834) );
  NAND2XL U2443 ( .A(n1709), .B(n1708), .Y(n1711) );
  NOR2XL U2444 ( .A(n1711), .B(n1710), .Y(n1712) );
  NAND2XL U2445 ( .A(n1724), .B(n1712), .Y(n1720) );
  INVXL U2446 ( .A(n1729), .Y(n1716) );
  NAND2XL U2447 ( .A(n1717), .B(n1716), .Y(n1718) );
  INVXL U2448 ( .A(n1722), .Y(n1723) );
  NAND2XL U2449 ( .A(n1728), .B(n1727), .Y(n1730) );
  NAND2XL U2450 ( .A(n2160), .B(n1733), .Y(n1731) );
  INVXL U2451 ( .A(n1733), .Y(n1734) );
  NAND2XL U2452 ( .A(n1735), .B(n1734), .Y(n1736) );
  OAI22XL U2453 ( .A0(n1848), .A1(n1834), .B0(n1856), .B1(n28050), .Y(n1807)
         );
  OAI22XL U2454 ( .A0(n1533), .A1(n1834), .B0(n1847), .B1(n28050), .Y(n1737)
         );
  AOI222XL U2455 ( .A0(n1748), .A1(n2070), .B0(n2160), .B1(n1747), .C0(n1746), 
        .C1(n1745), .Y(n1752) );
  OAI21XL U2456 ( .A0(n1755), .A1(n1752), .B0(n1286), .Y(n1753) );
  AOI21XL U2457 ( .A0(n1755), .A1(n1754), .B0(n1753), .Y(n1843) );
  INVXL U2458 ( .A(rotation_cnt[0]), .Y(n2237) );
  NOR2XL U2459 ( .A(rotation_cnt[1]), .B(n2237), .Y(n1876) );
  NOR2XL U2460 ( .A(n2157), .B(n1876), .Y(n1761) );
  NAND2XL U2461 ( .A(store_cnt[3]), .B(n1954), .Y(n1760) );
  INVXL U2462 ( .A(rotation_cnt[1]), .Y(n2243) );
  NOR2XL U2463 ( .A(rotation_cnt[0]), .B(n2243), .Y(n1860) );
  NOR2XL U2464 ( .A(n1860), .B(n1876), .Y(n2024) );
  NOR2XL U2465 ( .A(rotation_cnt[2]), .B(n2024), .Y(n1872) );
  AOI22XL U2466 ( .A0(n1872), .A1(n2753), .B0(n1953), .B1(
        qrcode_start_whole[8]), .Y(n1759) );
  OR2XL U2467 ( .A(n2298), .B(n2297), .Y(n1948) );
  INVXL U2468 ( .A(n1764), .Y(n1772) );
  OAI22XL U2469 ( .A0(n1872), .A1(n2009), .B0(n1768), .B1(n1959), .Y(n1770) );
  AOI211XL U2470 ( .A0(n1954), .A1(store_cnt[2]), .B0(n1770), .C0(n1769), .Y(
        n1771) );
  ADDHX1 U2471 ( .A(store_cnt[6]), .B(n1780), .CO(n1764), .S(n1791) );
  INVXL U2472 ( .A(n1784), .Y(n1787) );
  INVXL U2473 ( .A(rotation_cnt[2]), .Y(n2367) );
  OAI21XL U2474 ( .A0(rotation_cnt[1]), .A1(rotation_cnt[0]), .B0(n2367), .Y(
        n1809) );
  AOI22XL U2475 ( .A0(n1809), .A1(n2753), .B0(n1953), .B1(
        qrcode_start_whole[6]), .Y(n1786) );
  AOI22XL U2476 ( .A0(store_cnt[6]), .A1(n1931), .B0(n1954), .B1(store_cnt[1]), 
        .Y(n1785) );
  AO21XL U2477 ( .A0(n1955), .A1(n1789), .B0(n1788), .Y(n1790) );
  AO21XL U2478 ( .A0(n1938), .A1(n1791), .B0(n1790), .Y(n1792) );
  NOR2XL U2479 ( .A(n2307), .B(n2306), .Y(n1946) );
  AO22XL U2480 ( .A0(qrcode_start_whole[5]), .A1(n1046), .B0(n1965), .B1(n2316), .Y(n1803) );
  ADDHX1 U2481 ( .A(store_cnt[5]), .B(n1804), .CO(n1780), .S(n1817) );
  INVXL U2482 ( .A(n2024), .Y(n1808) );
  NOR2XL U2483 ( .A(n2157), .B(n1808), .Y(n1813) );
  INVXL U2484 ( .A(n1809), .Y(n1810) );
  AOI22XL U2485 ( .A0(n1810), .A1(n2753), .B0(n1953), .B1(
        qrcode_start_whole[5]), .Y(n1812) );
  AOI22XL U2486 ( .A0(store_cnt[5]), .A1(n1931), .B0(n1954), .B1(store_cnt[0]), 
        .Y(n1811) );
  AO21XL U2487 ( .A0(n1955), .A1(n1815), .B0(n1814), .Y(n1816) );
  AO21XL U2488 ( .A0(n1938), .A1(n1817), .B0(n1816), .Y(n1818) );
  XOR2XL U2489 ( .A(n1956), .B(n1818), .Y(n2312) );
  AO22XL U2490 ( .A0(qrcode_start_whole[4]), .A1(n1046), .B0(n1965), .B1(n2322), .Y(n1825) );
  ADDHXL U2491 ( .A(n1823), .B(n1822), .CO(n1800), .S(n1824) );
  ADDHX1 U2492 ( .A(store_cnt[4]), .B(n1826), .CO(n1804), .S(n1864) );
  OAI22XL U2493 ( .A0(n1858), .A1(n1848), .B0(n1847), .B1(n1855), .Y(n1827) );
  OR2XL U2494 ( .A(n1045), .B(n1827), .Y(n1869) );
  INVXL U2495 ( .A(n1897), .Y(n1854) );
  OR2XL U2496 ( .A(n1045), .B(n1830), .Y(n1898) );
  INVXL U2497 ( .A(n1898), .Y(n1853) );
  OAI22XL U2498 ( .A0(n1533), .A1(n28060), .B0(n1856), .B1(n1831), .Y(n1832)
         );
  NOR2XL U2499 ( .A(n1936), .B(n1935), .Y(n1846) );
  AOI2BB1XL U2500 ( .A0N(n1847), .A1N(n1843), .B0(n1836), .Y(n1837) );
  OAI22XL U2501 ( .A0(n1850), .A1(n1848), .B0(n1847), .B1(n1849), .Y(n1915) );
  OAI22XL U2502 ( .A0(n1850), .A1(n1533), .B0(n1856), .B1(n1849), .Y(n1851) );
  OR2XL U2503 ( .A(n1915), .B(n1916), .Y(n1852) );
  OAI22XL U2504 ( .A0(n1858), .A1(n1533), .B0(n1856), .B1(n1855), .Y(n1859) );
  XOR2XL U2505 ( .A(n1045), .B(n1859), .Y(n1868) );
  INVXL U2506 ( .A(n1930), .Y(n1875) );
  NAND2XL U2507 ( .A(n1860), .B(n1875), .Y(n1913) );
  NOR2XL U2508 ( .A(rotation_cnt[2]), .B(n2243), .Y(n1932) );
  NAND2XL U2509 ( .A(rotation_cnt[0]), .B(n1932), .Y(n2366) );
  NOR2XL U2510 ( .A(n2366), .B(n1861), .Y(n1910) );
  AOI21XL U2511 ( .A0(qrcode_start_whole[4]), .A1(n1953), .B0(n1910), .Y(n1862) );
  NOR2XL U2512 ( .A(n2317), .B(n2318), .Y(n1943) );
  ADDHX1 U2513 ( .A(store_cnt[3]), .B(n1866), .CO(n1826), .S(n1867) );
  NOR2XL U2514 ( .A(rotation_cnt[0]), .B(n2009), .Y(n1871) );
  AO22XL U2515 ( .A0(n1872), .A1(n1871), .B0(qrcode_start_whole[3]), .B1(n1953), .Y(n1874) );
  NAND2XL U2516 ( .A(store_cnt[3]), .B(n1931), .Y(n1873) );
  NAND2BXL U2517 ( .AN(n1874), .B(n1873), .Y(n1878) );
  NAND2XL U2518 ( .A(n1876), .B(n1875), .Y(n1877) );
  AO22XL U2519 ( .A0(qrcode_start_whole[3]), .A1(n1046), .B0(n1965), .B1(n2328), .Y(n1888) );
  ADDFX1 U2520 ( .A(n1886), .B(n1885), .CI(n1884), .CO(n1822), .S(n1887) );
  ADDFX1 U2521 ( .A(n1891), .B(n1890), .CI(n1889), .CO(n1881), .S(n2332) );
  AO22XL U2522 ( .A0(qrcode_start_whole[2]), .A1(n1046), .B0(n1965), .B1(n2332), .Y(n1895) );
  ADDHX1 U2523 ( .A(store_cnt[2]), .B(n1896), .CO(n1866), .S(n1902) );
  AO22XL U2524 ( .A0(qrcode_start_whole[1]), .A1(n1046), .B0(n1965), .B1(n2337), .Y(n1909) );
  ADDHX1 U2525 ( .A(store_cnt[0]), .B(store_cnt[1]), .CO(n1896), .S(n1923) );
  AO21XL U2526 ( .A0(n1953), .A1(qrcode_start_whole[1]), .B0(n1910), .Y(n1912)
         );
  NAND2XL U2527 ( .A(store_cnt[1]), .B(n1931), .Y(n1911) );
  NAND2BXL U2528 ( .AN(n1914), .B(n1913), .Y(n1922) );
  INVXL U2529 ( .A(n1955), .Y(n1921) );
  XOR2XL U2530 ( .A(n1916), .B(n1917), .Y(n1918) );
  XNOR2X1 U2532 ( .A(n1924), .B(n1300), .Y(n2343) );
  AO22XL U2533 ( .A0(qrcode_start_whole[0]), .A1(n1046), .B0(n1965), .B1(n2343), .Y(n1928) );
  AOI22XL U2534 ( .A0(n1932), .A1(n2753), .B0(n1953), .B1(
        qrcode_start_whole[0]), .Y(n1933) );
  NAND2BXL U2535 ( .AN(n1943), .B(n2320), .Y(n1944) );
  INVXL U2537 ( .A(store_cnt[4]), .Y(n2249) );
  INVXL U2538 ( .A(qrcode_start_whole[9]), .Y(n1958) );
  OAI22XL U2539 ( .A0(n2249), .A1(n1959), .B0(n1958), .B1(n28080), .Y(n1964)
         );
  XNOR2XL U2540 ( .A(n1967), .B(n1966), .Y(n1968) );
  INVXL U2541 ( .A(n1976), .Y(n1973) );
  NOR2XL U2542 ( .A(n2075), .B(n2066), .Y(n2420) );
  INVXL U2543 ( .A(n2420), .Y(n1970) );
  OR2XL U2544 ( .A(n1970), .B(n1969), .Y(n1971) );
  INVXL U2545 ( .A(n1971), .Y(n1979) );
  OR2XL U2546 ( .A(n1979), .B(n1978), .Y(n1977) );
  INVXL U2547 ( .A(n1977), .Y(n1972) );
  NOR2XL U2548 ( .A(n1973), .B(n1972), .Y(n1984) );
  OR2XL U2549 ( .A(n1984), .B(n1985), .Y(n1982) );
  OR2XL U2550 ( .A(n1982), .B(n1983), .Y(n1980) );
  XOR2XL U2551 ( .A(n1977), .B(n1976), .Y(N1087) );
  ADDFX1 U2552 ( .A(n2375), .B(n1989), .CI(n1988), .CO(n1990), .S(N1093) );
  NAND2XL U2553 ( .A(state[2]), .B(n2763), .Y(n1994) );
  NOR2XL U2554 ( .A(n2071), .B(n1994), .Y(N1008) );
  NAND4XL U2555 ( .A(position_block_line[44]), .B(position_block_line[42]), 
        .C(position_block_line[36]), .D(position_block_line[34]), .Y(n2001) );
  NAND2XL U2556 ( .A(position_block_line[49]), .B(n2750), .Y(n2387) );
  NAND2XL U2557 ( .A(position_block_line[45]), .B(position_block_line[32]), 
        .Y(n1997) );
  NAND4XL U2558 ( .A(position_block_line[47]), .B(position_block_line[31]), 
        .C(position_block_line[28]), .D(position_block_line[27]), .Y(n1996) );
  NAND4XL U2559 ( .A(position_block_line[46]), .B(position_block_line[30]), 
        .C(position_block_line[29]), .D(position_block_line[48]), .Y(n1995) );
  INVXL U2560 ( .A(position_block_line[40]), .Y(n2408) );
  INVXL U2561 ( .A(position_block_line[38]), .Y(n2409) );
  NOR3XL U2562 ( .A(position_block_line[41]), .B(n2408), .C(n2409), .Y(n1999)
         );
  NAND4XL U2563 ( .A(n2411), .B(position_block_line[50]), .C(n1999), .D(n1998), 
        .Y(n2000) );
  NAND4XL U2564 ( .A(position_block_line[21]), .B(position_block_line[5]), .C(
        position_block_line[2]), .D(position_block_line[1]), .Y(n2003) );
  NAND4XL U2565 ( .A(position_block_line[20]), .B(position_block_line[4]), .C(
        position_block_line[3]), .D(position_block_line[22]), .Y(n2002) );
  NOR2XL U2566 ( .A(n2003), .B(n2002), .Y(n2004) );
  NAND4XL U2567 ( .A(position_block_line[19]), .B(position_block_line[6]), .C(
        n2150), .D(n2004), .Y(n2407) );
  NAND3BXL U2568 ( .AN(position_block_line[16]), .B(position_block_line[17]), 
        .C(position_block_line[15]), .Y(n2006) );
  NAND4XL U2569 ( .A(position_block_line[13]), .B(position_block_line[11]), 
        .C(position_block_line[24]), .D(position_block_line[25]), .Y(n2005) );
  NAND4XL U2570 ( .A(position_block_line[9]), .B(position_block_line[7]), .C(
        n2008), .D(n2007), .Y(n2412) );
  NAND2BXL U2571 ( .AN(n2416), .B(n2412), .Y(N1010) );
  OAI21XL U2572 ( .A0(state[0]), .A1(n2074), .B0(n2009), .Y(n2016) );
  NOR2XL U2573 ( .A(n2168), .B(n2017), .Y(n2149) );
  NOR2XL U2574 ( .A(n2149), .B(position_cnt[2]), .Y(n2027) );
  INVXL U2575 ( .A(n2149), .Y(n2010) );
  NOR2XL U2576 ( .A(n2010), .B(n2143), .Y(n2032) );
  NAND2BXL U2577 ( .AN(n2097), .B(n2172), .Y(n985) );
  NOR2XL U2578 ( .A(n2393), .B(n985), .Y(n2011) );
  NOR2XL U2579 ( .A(N3852), .B(n2011), .Y(n2217) );
  INVXL U2580 ( .A(n2217), .Y(position_block[24]) );
  NAND2XL U2581 ( .A(n2149), .B(n2172), .Y(n982) );
  NOR2XL U2582 ( .A(n2390), .B(n982), .Y(n2012) );
  NOR2XL U2583 ( .A(N3831), .B(n2012), .Y(n2207) );
  INVXL U2584 ( .A(n2207), .Y(position_block[31]) );
  NOR2XL U2585 ( .A(n2393), .B(n982), .Y(n2013) );
  NOR2XL U2586 ( .A(N3834), .B(n2013), .Y(n2202) );
  INVXL U2587 ( .A(n2202), .Y(position_block[30]) );
  NAND2XL U2588 ( .A(n2283), .B(n2172), .Y(n983) );
  NOR2XL U2589 ( .A(n2390), .B(n983), .Y(n2014) );
  NOR2XL U2590 ( .A(N3837), .B(n2014), .Y(n2201) );
  INVXL U2591 ( .A(n2201), .Y(position_block[29]) );
  NOR2XL U2592 ( .A(position_cnt[3]), .B(n2032), .Y(n2033) );
  INVXL U2593 ( .A(n2033), .Y(n2015) );
  NOR2XL U2594 ( .A(n2017), .B(n2165), .Y(n2161) );
  NAND2XL U2595 ( .A(position_cnt[1]), .B(n2161), .Y(n986) );
  NOR2XL U2596 ( .A(n2390), .B(n986), .Y(n2018) );
  NOR2XL U2597 ( .A(N3879), .B(n2018), .Y(n2197) );
  INVXL U2598 ( .A(n2197), .Y(position_block[15]) );
  INVXL U2599 ( .A(n2019), .Y(length[7]) );
  INVXL U2600 ( .A(n2020), .Y(length[5]) );
  INVXL U2601 ( .A(n2021), .Y(n2787) );
  INVXL U2602 ( .A(n2030), .Y(n2384) );
  NOR2XL U2603 ( .A(n2022), .B(n2384), .Y(n2794) );
  INVXL U2604 ( .A(decode_length_reg[2]), .Y(n2360) );
  NAND2XL U2605 ( .A(decode_length_reg[1]), .B(decode_length_reg[0]), .Y(n2361) );
  NOR2XL U2606 ( .A(n2360), .B(n2361), .Y(n2362) );
  NOR2XL U2607 ( .A(n2384), .B(n2023), .Y(n2792) );
  INVXL U2608 ( .A(n2369), .Y(n2029) );
  NOR2XL U2609 ( .A(n2024), .B(n2029), .Y(n2797) );
  NAND2XL U2610 ( .A(state[3]), .B(state[2]), .Y(n2025) );
  NAND2XL U2611 ( .A(n2763), .B(n2025), .Y(n2026) );
  OAI21XL U2612 ( .A0(n2767), .A1(n2047), .B0(n2026), .Y(n2046) );
  NOR3XL U2613 ( .A(n2032), .B(n2027), .C(n2046), .Y(position_tmp[2]) );
  NOR2XL U2614 ( .A(position_cnt[0]), .B(n2046), .Y(n2786) );
  INVXL U2615 ( .A(n2786), .Y(n2028) );
  OAI22XL U2616 ( .A0(n2046), .A1(n2173), .B0(n2168), .B1(n2028), .Y(
        position_tmp[1]) );
  NOR2XL U2617 ( .A(rotation_cnt[0]), .B(n2029), .Y(n2785) );
  AND3XL U2618 ( .A(decode_length_reg[4]), .B(decode_length_reg[3]), .C(n2362), 
        .Y(n2363) );
  NAND2XL U2619 ( .A(n2363), .B(decode_length_reg[5]), .Y(n2382) );
  INVXL U2620 ( .A(n2031), .Y(n2790) );
  NAND2XL U2621 ( .A(position_cnt[3]), .B(n2032), .Y(n2038) );
  INVXL U2622 ( .A(n2038), .Y(n2035) );
  NOR3XL U2623 ( .A(n2033), .B(n2046), .C(n2035), .Y(position_tmp[3]) );
  NAND2XL U2624 ( .A(start_pos[1]), .B(n2370), .Y(n2372) );
  INVXL U2625 ( .A(n2034), .Y(start_tmp[1]) );
  NOR2XL U2626 ( .A(n2046), .B(n2036), .Y(position_tmp[4]) );
  NOR2XL U2627 ( .A(n2037), .B(n2038), .Y(n2040) );
  INVXL U2628 ( .A(n2046), .Y(n2039) );
  NAND3BXL U2629 ( .AN(n2038), .B(position_cnt[5]), .C(position_cnt[4]), .Y(
        n2043) );
  INVXL U2630 ( .A(n2041), .Y(position_tmp[5]) );
  NOR2XL U2631 ( .A(n1301), .B(n2372), .Y(n2371) );
  NAND2XL U2632 ( .A(start_pos[3]), .B(n2371), .Y(n2373) );
  INVXL U2633 ( .A(n2042), .Y(start_tmp[3]) );
  NOR2XL U2634 ( .A(n2046), .B(n2045), .Y(position_tmp[6]) );
  INVXL U2635 ( .A(n2349), .Y(n1005) );
  INVXL U2636 ( .A(n2268), .Y(n2417) );
  NAND2XL U2637 ( .A(n2246), .B(n1299), .Y(n2050) );
  INVXL U2638 ( .A(n2047), .Y(n2048) );
  AOI211XL U2639 ( .A0(n2293), .A1(n2141), .B0(n2049), .C0(n2048), .Y(n2061)
         );
  OAI22XL U2640 ( .A0(n2417), .A1(n2769), .B0(n2050), .B1(n2061), .Y(
        store_tmp[1]) );
  OAI22XL U2641 ( .A0(n2417), .A1(n1038), .B0(store_cnt[0]), .B1(n2061), .Y(
        store_tmp[0]) );
  NOR2XL U2642 ( .A(n2768), .B(n2390), .Y(intadd_0_CI) );
  INVXL U2643 ( .A(n2358), .Y(n998) );
  NAND2XL U2644 ( .A(decode_cnt[3]), .B(n2060), .Y(n2422) );
  NOR2XL U2645 ( .A(n24230), .B(n2422), .Y(n2421) );
  NAND2XL U2646 ( .A(decode_cnt[5]), .B(n2421), .Y(n2424) );
  OAI21XL U2647 ( .A0(n998), .A1(n2757), .B0(n2419), .Y(n2077) );
  INVXL U2648 ( .A(n2077), .Y(n2051) );
  NOR2XL U2649 ( .A(n2051), .B(decode_jis8_valid_reg0), .Y(n2053) );
  NAND2XL U2650 ( .A(n2053), .B(n2052), .Y(n2055) );
  INVXL U2651 ( .A(n2054), .Y(decode_tmp[5]) );
  INVXL U2652 ( .A(n2055), .Y(n2426) );
  NOR2XL U2653 ( .A(n2056), .B(n2426), .Y(decode_tmp[1]) );
  NOR2XL U2654 ( .A(n2057), .B(n2426), .Y(decode_tmp[2]) );
  NOR2XL U2655 ( .A(decode_cnt[0]), .B(n2426), .Y(decode_tmp[0]) );
  NAND2XL U2656 ( .A(store_cnt[2]), .B(n2066), .Y(n2065) );
  INVXL U2657 ( .A(n2065), .Y(n2266) );
  NAND2XL U2658 ( .A(store_cnt[3]), .B(n2266), .Y(n2265) );
  INVXL U2659 ( .A(n2265), .Y(n2063) );
  NOR2XL U2660 ( .A(n2249), .B(n2265), .Y(n2258) );
  INVXL U2661 ( .A(n2258), .Y(n2062) );
  INVXL U2662 ( .A(n2061), .Y(n2264) );
  OAI21XL U2663 ( .A0(n2765), .A1(n2417), .B0(n2064), .Y(store_tmp[4]) );
  OAI21XL U2664 ( .A0(n1301), .A1(n2417), .B0(n2067), .Y(store_tmp[2]) );
  NAND2XL U2665 ( .A(n2070), .B(n2159), .Y(n1000) );
  OAI211XL U2666 ( .A0(n2757), .A1(n998), .B0(state[0]), .C0(n2071), .Y(n2086)
         );
  NOR3XL U2667 ( .A(n2747), .B(n2073), .C(n2072), .Y(n2083) );
  NAND3BXL U2668 ( .AN(n2075), .B(n2252), .C(store_cnt[1]), .Y(n2741) );
  INVXL U2669 ( .A(n2741), .Y(n2078) );
  NAND2XL U2670 ( .A(n2753), .B(n2076), .Y(n2740) );
  NAND2XL U2671 ( .A(n2752), .B(n2767), .Y(n2286) );
  NAND2XL U2672 ( .A(n2291), .B(n2084), .Y(n2739) );
  NAND4BXL U2673 ( .AN(qrc_decode_finish_reg0), .B(n2086), .C(n2085), .D(n2739), .Y(nstate[0]) );
  NAND2BXL U2674 ( .AN(n2149), .B(n2145), .Y(n2121) );
  NAND2XL U2675 ( .A(n2144), .B(n2752), .Y(n2120) );
  NOR2XL U2676 ( .A(n2143), .B(n2120), .Y(n2088) );
  NAND2XL U2677 ( .A(n2121), .B(n2099), .Y(n981) );
  NOR2XL U2678 ( .A(n2765), .B(n2373), .Y(n2374) );
  NAND2XL U2679 ( .A(n2239), .B(start_pos[6]), .Y(n2380) );
  NAND2XL U2680 ( .A(start_pos[8]), .B(n2379), .Y(n2155) );
  INVXL U2681 ( .A(n2087), .Y(start_tmp[8]) );
  NAND2BXL U2682 ( .AN(n2283), .B(n2145), .Y(n2123) );
  NAND2XL U2683 ( .A(n2123), .B(n2112), .Y(n970) );
  BUFX2 U2684 ( .A(n2750), .Y(n2153) );
  AOI21XL U2685 ( .A0(position_block_line[20]), .A1(n2153), .B0(N4014), .Y(
        n2089) );
  OAI21XL U2686 ( .A0(n970), .A1(n2398), .B0(n2089), .Y(
        position_block_line_tmp[22]) );
  AOI21XL U2687 ( .A0(position_block_line[46]), .A1(n2750), .B0(N3936), .Y(
        n2090) );
  OAI21XL U2688 ( .A0(n970), .A1(n2392), .B0(n2090), .Y(
        position_block_line_tmp[48]) );
  AOI21XL U2689 ( .A0(position_block_line[21]), .A1(n2153), .B0(N4011), .Y(
        n2091) );
  OAI21XL U2690 ( .A0(n970), .A1(n2395), .B0(n2091), .Y(
        position_block_line_tmp[23]) );
  AOI21XL U2691 ( .A0(position_block_line[47]), .A1(n2750), .B0(N3933), .Y(
        n2092) );
  OAI21XL U2692 ( .A0(n970), .A1(n2389), .B0(n2092), .Y(
        position_block_line_tmp[49]) );
  NAND2XL U2693 ( .A(n2123), .B(n2099), .Y(n978) );
  AOI21XL U2694 ( .A0(position_block_line[30]), .A1(n2153), .B0(N3984), .Y(
        n2093) );
  OAI21XL U2695 ( .A0(n2392), .A1(n978), .B0(n2093), .Y(
        position_block_line_tmp[32]) );
  AOI21XL U2696 ( .A0(position_block_line[5]), .A1(n2141), .B0(N4059), .Y(
        n2094) );
  OAI21XL U2697 ( .A0(n978), .A1(n2395), .B0(n2094), .Y(
        position_block_line_tmp[7]) );
  AOI21XL U2698 ( .A0(position_block_line[4]), .A1(n2141), .B0(N4062), .Y(
        n2095) );
  OAI21XL U2699 ( .A0(n978), .A1(n2398), .B0(n2095), .Y(
        position_block_line_tmp[6]) );
  AOI21XL U2700 ( .A0(position_block_line[31]), .A1(n2153), .B0(N3981), .Y(
        n2096) );
  OAI21XL U2701 ( .A0(n2389), .A1(n978), .B0(n2096), .Y(
        position_block_line_tmp[33]) );
  NAND2XL U2702 ( .A(n2145), .B(n2097), .Y(n2127) );
  NAND2XL U2703 ( .A(n2127), .B(n2099), .Y(n980) );
  AOI21XL U2704 ( .A0(position_block_line[26]), .A1(n2153), .B0(N3996), .Y(
        n2098) );
  OAI21XL U2705 ( .A0(n2392), .A1(n980), .B0(n2098), .Y(
        position_block_line_tmp[28]) );
  NAND2XL U2706 ( .A(n2145), .B(n2173), .Y(n2130) );
  NAND2XL U2707 ( .A(n2130), .B(n2099), .Y(n979) );
  AOI21XL U2708 ( .A0(position_block_line[28]), .A1(n2153), .B0(N3990), .Y(
        n2100) );
  OAI21XL U2709 ( .A0(n2392), .A1(n979), .B0(n2100), .Y(
        position_block_line_tmp[30]) );
  AOI21XL U2710 ( .A0(position_block_line[3]), .A1(n2141), .B0(N4065), .Y(
        n2101) );
  OAI21XL U2711 ( .A0(n979), .A1(n2395), .B0(n2101), .Y(
        position_block_line_tmp[5]) );
  AOI21XL U2712 ( .A0(position_block_line[1]), .A1(n2141), .B0(N4071), .Y(
        n2102) );
  OAI21XL U2713 ( .A0(n980), .A1(n2395), .B0(n2102), .Y(
        position_block_line_tmp[3]) );
  AOI21XL U2714 ( .A0(position_block_line[2]), .A1(n2141), .B0(N4068), .Y(
        n2103) );
  OAI21XL U2715 ( .A0(n979), .A1(n2398), .B0(n2103), .Y(
        position_block_line_tmp[4]) );
  AOI21XL U2716 ( .A0(position_block_line[27]), .A1(n2153), .B0(N3993), .Y(
        n2104) );
  OAI21XL U2717 ( .A0(n2389), .A1(n980), .B0(n2104), .Y(
        position_block_line_tmp[29]) );
  AOI21XL U2718 ( .A0(position_block_line[29]), .A1(n2153), .B0(N3987), .Y(
        n2105) );
  OAI21XL U2719 ( .A0(n2389), .A1(n979), .B0(n2105), .Y(
        position_block_line_tmp[31]) );
  AOI21XL U2720 ( .A0(position_block_line[0]), .A1(n2141), .B0(N4074), .Y(
        n2106) );
  OAI21XL U2721 ( .A0(n980), .A1(n2398), .B0(n2106), .Y(
        position_block_line_tmp[2]) );
  NAND2XL U2722 ( .A(n2112), .B(n2121), .Y(n973) );
  AOI21XL U2723 ( .A0(position_block_line[40]), .A1(n2750), .B0(N3954), .Y(
        n2107) );
  OAI21XL U2724 ( .A0(n2392), .A1(n973), .B0(n2107), .Y(
        position_block_line_tmp[42]) );
  NAND2XL U2725 ( .A(n2112), .B(n2130), .Y(n971) );
  AOI21XL U2726 ( .A0(position_block_line[19]), .A1(n2153), .B0(N4017), .Y(
        n2108) );
  OAI21XL U2727 ( .A0(n971), .A1(n2395), .B0(n2108), .Y(
        position_block_line_tmp[21]) );
  AOI21XL U2728 ( .A0(position_block_line[45]), .A1(n2750), .B0(N3939), .Y(
        n2109) );
  OAI21XL U2729 ( .A0(n2389), .A1(n971), .B0(n2109), .Y(
        position_block_line_tmp[47]) );
  AOI21XL U2730 ( .A0(position_block_line[15]), .A1(n2141), .B0(N4029), .Y(
        n2110) );
  OAI21XL U2731 ( .A0(n973), .A1(n2395), .B0(n2110), .Y(
        position_block_line_tmp[17]) );
  AOI21XL U2732 ( .A0(position_block_line[41]), .A1(n2153), .B0(N3951), .Y(
        n2111) );
  OAI21XL U2733 ( .A0(n2389), .A1(n973), .B0(n2111), .Y(
        position_block_line_tmp[43]) );
  NAND2XL U2734 ( .A(n2112), .B(n2127), .Y(n972) );
  AOI21XL U2735 ( .A0(position_block_line[16]), .A1(n2141), .B0(N4026), .Y(
        n2113) );
  OAI21XL U2736 ( .A0(n972), .A1(n2398), .B0(n2113), .Y(
        position_block_line_tmp[18]) );
  AOI21XL U2737 ( .A0(position_block_line[17]), .A1(n2141), .B0(N4023), .Y(
        n2114) );
  OAI21XL U2738 ( .A0(n972), .A1(n2395), .B0(n2114), .Y(
        position_block_line_tmp[19]) );
  AOI21XL U2739 ( .A0(position_block_line[44]), .A1(n2750), .B0(N3942), .Y(
        n2115) );
  OAI21XL U2740 ( .A0(n2392), .A1(n971), .B0(n2115), .Y(
        position_block_line_tmp[46]) );
  AOI21XL U2741 ( .A0(position_block_line[18]), .A1(n2141), .B0(N4020), .Y(
        n2116) );
  OAI21XL U2742 ( .A0(n971), .A1(n2398), .B0(n2116), .Y(
        position_block_line_tmp[20]) );
  AOI21XL U2743 ( .A0(position_block_line[42]), .A1(n2750), .B0(N3948), .Y(
        n2117) );
  OAI21XL U2744 ( .A0(n2392), .A1(n972), .B0(n2117), .Y(
        position_block_line_tmp[44]) );
  AOI21XL U2745 ( .A0(position_block_line[14]), .A1(n2141), .B0(N4032), .Y(
        n2118) );
  OAI21XL U2746 ( .A0(n973), .A1(n2398), .B0(n2118), .Y(
        position_block_line_tmp[16]) );
  AOI21XL U2747 ( .A0(position_block_line[43]), .A1(n2750), .B0(N3945), .Y(
        n2119) );
  OAI21XL U2748 ( .A0(n2389), .A1(n972), .B0(n2119), .Y(
        position_block_line_tmp[45]) );
  AOI21XL U2749 ( .A0(position_block_line[32]), .A1(n2153), .B0(N3978), .Y(
        n2122) );
  OAI21XL U2750 ( .A0(n2392), .A1(n977), .B0(n2122), .Y(
        position_block_line_tmp[34]) );
  AOI21XL U2751 ( .A0(position_block_line[38]), .A1(n2153), .B0(N3960), .Y(
        n2124) );
  OAI21XL U2752 ( .A0(n2392), .A1(n974), .B0(n2124), .Y(
        position_block_line_tmp[40]) );
  AOI21XL U2753 ( .A0(position_block_line[6]), .A1(n2141), .B0(N4056), .Y(
        n2125) );
  OAI21XL U2754 ( .A0(n977), .A1(n2398), .B0(n2125), .Y(
        position_block_line_tmp[8]) );
  AOI21XL U2755 ( .A0(position_block_line[7]), .A1(n2141), .B0(N4053), .Y(
        n2126) );
  OAI21XL U2756 ( .A0(n977), .A1(n2395), .B0(n2126), .Y(
        position_block_line_tmp[9]) );
  AOI21XL U2757 ( .A0(position_block_line[34]), .A1(n2153), .B0(N3972), .Y(
        n2128) );
  OAI21XL U2758 ( .A0(n2392), .A1(n976), .B0(n2128), .Y(
        position_block_line_tmp[36]) );
  AOI21XL U2759 ( .A0(position_block_line[10]), .A1(n2141), .B0(N4044), .Y(
        n2131) );
  OAI21XL U2760 ( .A0(n975), .A1(n2398), .B0(n2131), .Y(
        position_block_line_tmp[12]) );
  AOI21XL U2761 ( .A0(position_block_line[11]), .A1(n2153), .B0(N4041), .Y(
        n2132) );
  OAI21XL U2762 ( .A0(n975), .A1(n2395), .B0(n2132), .Y(
        position_block_line_tmp[13]) );
  AOI21XL U2763 ( .A0(position_block_line[36]), .A1(n2153), .B0(N3966), .Y(
        n2133) );
  OAI21XL U2764 ( .A0(n2392), .A1(n975), .B0(n2133), .Y(
        position_block_line_tmp[38]) );
  AOI21XL U2765 ( .A0(position_block_line[8]), .A1(n2141), .B0(N4050), .Y(
        n2134) );
  OAI21XL U2766 ( .A0(n976), .A1(n2398), .B0(n2134), .Y(
        position_block_line_tmp[10]) );
  AOI21XL U2767 ( .A0(position_block_line[9]), .A1(n2141), .B0(N4047), .Y(
        n2135) );
  OAI21XL U2768 ( .A0(n976), .A1(n2395), .B0(n2135), .Y(
        position_block_line_tmp[11]) );
  AOI21XL U2769 ( .A0(position_block_line[39]), .A1(n2153), .B0(N3957), .Y(
        n2136) );
  OAI21XL U2770 ( .A0(n2389), .A1(n974), .B0(n2136), .Y(
        position_block_line_tmp[41]) );
  AOI21XL U2771 ( .A0(position_block_line[33]), .A1(n2153), .B0(N3975), .Y(
        n2137) );
  OAI21XL U2772 ( .A0(n2389), .A1(n977), .B0(n2137), .Y(
        position_block_line_tmp[35]) );
  AOI21XL U2773 ( .A0(position_block_line[13]), .A1(n2141), .B0(N4035), .Y(
        n2138) );
  OAI21XL U2774 ( .A0(n974), .A1(n2395), .B0(n2138), .Y(
        position_block_line_tmp[15]) );
  AOI21XL U2775 ( .A0(position_block_line[35]), .A1(n2153), .B0(N3969), .Y(
        n2139) );
  OAI21XL U2776 ( .A0(n2389), .A1(n976), .B0(n2139), .Y(
        position_block_line_tmp[37]) );
  AOI21XL U2777 ( .A0(position_block_line[37]), .A1(n2153), .B0(N3963), .Y(
        n2140) );
  OAI21XL U2778 ( .A0(n2389), .A1(n975), .B0(n2140), .Y(
        position_block_line_tmp[39]) );
  AOI21XL U2779 ( .A0(position_block_line[12]), .A1(n2141), .B0(N4038), .Y(
        n2142) );
  OAI21XL U2780 ( .A0(n974), .A1(n2398), .B0(n2142), .Y(
        position_block_line_tmp[14]) );
  INVXL U2781 ( .A(n2145), .Y(n2146) );
  NOR2XL U2782 ( .A(n2150), .B(N4005), .Y(n2151) );
  OAI21XL U2783 ( .A0(n2388), .A1(n2395), .B0(n2151), .Y(
        position_block_line_tmp[25]) );
  AOI21XL U2784 ( .A0(position_block_line[48]), .A1(n2750), .B0(N3930), .Y(
        n2152) );
  OAI21XL U2785 ( .A0(n2388), .A1(n2392), .B0(n2152), .Y(
        position_block_line_tmp[50]) );
  AOI21XL U2786 ( .A0(position_block_line[22]), .A1(n2153), .B0(N4008), .Y(
        n2154) );
  OAI21XL U2787 ( .A0(n2388), .A1(n2398), .B0(n2154), .Y(
        position_block_line_tmp[24]) );
  NOR2XL U2788 ( .A(n2156), .B(n2378), .Y(start_tmp[9]) );
  NAND2BXL U2789 ( .AN(n2388), .B(n2342), .Y(n969) );
  INVXL U2790 ( .A(n2157), .Y(n2158) );
  OAI21XL U2791 ( .A0(rotation_cnt[0]), .A1(n2158), .B0(n2738), .Y(n2222) );
  NAND2XL U2792 ( .A(n2222), .B(n2417), .Y(N707) );
  NAND2XL U2793 ( .A(n2160), .B(n2159), .Y(n999) );
  NAND2XL U2794 ( .A(n2161), .B(n2168), .Y(n988) );
  NOR2XL U2795 ( .A(n2399), .B(n988), .Y(n2162) );
  NOR2XL U2796 ( .A(n2399), .B(n986), .Y(n2163) );
  NOR2XL U2797 ( .A(n2396), .B(n982), .Y(n2164) );
  NOR2XL U2798 ( .A(position_cnt[0]), .B(n2165), .Y(n2169) );
  NOR2XL U2799 ( .A(n2390), .B(n989), .Y(n2166) );
  NOR2XL U2800 ( .A(n2396), .B(n989), .Y(n2167) );
  NAND2XL U2801 ( .A(n2169), .B(n2168), .Y(n987) );
  NOR2XL U2802 ( .A(n2396), .B(n987), .Y(n2170) );
  NOR2XL U2803 ( .A(N3909), .B(n2170), .Y(n2212) );
  INVXL U2804 ( .A(n2212), .Y(position_block[5]) );
  NOR2XL U2805 ( .A(n2396), .B(n986), .Y(n2171) );
  NAND2BXL U2806 ( .AN(n2173), .B(n2172), .Y(n984) );
  NOR2XL U2807 ( .A(n2399), .B(n984), .Y(n2174) );
  NOR2XL U2808 ( .A(n2399), .B(n983), .Y(n2175) );
  NOR2XL U2809 ( .A(n2396), .B(n984), .Y(n2176) );
  NOR2XL U2810 ( .A(n2396), .B(n985), .Y(n2177) );
  NOR2XL U2811 ( .A(n2399), .B(n987), .Y(n2178) );
  NOR2XL U2812 ( .A(n2396), .B(n988), .Y(n2179) );
  NOR2XL U2813 ( .A(n2390), .B(n988), .Y(n2180) );
  NOR2XL U2814 ( .A(n2393), .B(n987), .Y(n2181) );
  NOR2XL U2815 ( .A(n2393), .B(n988), .Y(n2182) );
  NOR2XL U2816 ( .A(n2390), .B(n987), .Y(n2183) );
  NOR2XL U2817 ( .A(n2396), .B(n983), .Y(n2184) );
  NOR2XL U2818 ( .A(n2399), .B(n982), .Y(n2185) );
  NOR2XL U2819 ( .A(N3858), .B(n2185), .Y(n2210) );
  INVXL U2820 ( .A(n2210), .Y(position_block[22]) );
  NOR2XL U2821 ( .A(n2390), .B(n984), .Y(n2186) );
  NOR2XL U2822 ( .A(n2393), .B(n984), .Y(n2187) );
  NOR2XL U2823 ( .A(n2393), .B(n983), .Y(n2188) );
  NOR2XL U2824 ( .A(n2390), .B(n985), .Y(n2189) );
  NOR2XL U2825 ( .A(n2399), .B(n989), .Y(n2190) );
  NOR2XL U2826 ( .A(n2399), .B(n985), .Y(n2191) );
  NOR2XL U2827 ( .A(n2393), .B(n989), .Y(n2192) );
  NOR2XL U2828 ( .A(n2393), .B(n986), .Y(n2193) );
  NOR2XL U2829 ( .A(N3882), .B(n2193), .Y(n2194) );
  INVXL U2830 ( .A(n2194), .Y(position_block[14]) );
  NAND3BXL U2831 ( .AN(position_block[6]), .B(n2194), .C(position_block[23]), 
        .Y(n2196) );
  NAND4XL U2832 ( .A(position_block[9]), .B(position_block[1]), .C(
        position_block[5]), .D(position_block[7]), .Y(n2195) );
  NAND4XL U2833 ( .A(position_block[18]), .B(position_block[20]), .C(
        position_block[19]), .D(position_block[17]), .Y(n2200) );
  NAND2XL U2834 ( .A(position_block[4]), .B(position_block[3]), .Y(n2203) );
  NAND4BXL U2835 ( .AN(n2203), .B(n2198), .C(position_block[21]), .D(
        position_block[22]), .Y(n2199) );
  NOR2XL U2836 ( .A(n2200), .B(n2199), .Y(n2215) );
  NAND2XL U2837 ( .A(n2208), .B(n2215), .Y(n2227) );
  NAND4XL U2838 ( .A(position_block[27]), .B(position_block[26]), .C(
        position_block[28]), .D(position_block[25]), .Y(n2204) );
  NAND4XL U2839 ( .A(n2206), .B(n2205), .C(position_block[11]), .D(
        position_block[12]), .Y(n2216) );
  NAND4XL U2840 ( .A(n2210), .B(n2209), .C(position_block[13]), .D(
        position_block[17]), .Y(n2230) );
  AOI22XL U2841 ( .A0(n2211), .A1(n2227), .B0(n2229), .B1(n2230), .Y(n2224) );
  NAND3XL U2842 ( .A(position_block[0]), .B(position_block[16]), .C(
        position_block[6]), .Y(n2214) );
  NAND4XL U2843 ( .A(n2212), .B(position_block[8]), .C(position_block[14]), 
        .D(position_block[2]), .Y(n2213) );
  NAND2XL U2844 ( .A(n2219), .B(n2215), .Y(n2225) );
  NAND4XL U2845 ( .A(n2219), .B(n2218), .C(position_block[22]), .D(
        position_block[10]), .Y(n2234) );
  AOI22XL U2846 ( .A0(n2221), .A1(n2225), .B0(n2220), .B1(n2234), .Y(n2223) );
  INVXL U2847 ( .A(n2222), .Y(n2236) );
  OA22X1 U2848 ( .A0(n2228), .A1(n2227), .B0(n2226), .B1(n2225), .Y(n2232) );
  NAND2BXL U2849 ( .AN(n2230), .B(n2229), .Y(n2231) );
  NAND2XL U2850 ( .A(n2236), .B(n2235), .Y(n2242) );
  OAI22XL U2851 ( .A0(n2238), .A1(n2244), .B0(n2237), .B1(n2242), .Y(
        rotation_type_tmp[0]) );
  OAI22XL U2852 ( .A0(n1225), .A1(n2244), .B0(n2367), .B1(n2242), .Y(
        rotation_type_tmp[2]) );
  INVXL U2853 ( .A(n2240), .Y(start_tmp[6]) );
  NAND2XL U2854 ( .A(n2784), .B(n2241), .Y(net6008) );
  OAI22XL U2855 ( .A0(n2245), .A1(n2244), .B0(n2243), .B1(n2242), .Y(
        rotation_type_tmp[1]) );
  AOI21XL U2856 ( .A0(n2768), .A1(n2390), .B0(intadd_0_CI), .Y(n2754) );
  OAI22XL U2857 ( .A0(n1299), .A1(n2247), .B0(store_cnt[2]), .B1(n2246), .Y(
        n2250) );
  NAND4XL U2858 ( .A(n2251), .B(n2250), .C(n2249), .D(n2248), .Y(n2253) );
  NOR2XL U2859 ( .A(n2252), .B(n2253), .Y(n2275) );
  NOR2XL U2860 ( .A(store_cnt[0]), .B(n2253), .Y(n2755) );
  NAND2XL U2861 ( .A(mask_pattern[4]), .B(intadd_0_n1), .Y(n2255) );
  INVXL U2862 ( .A(n2255), .Y(n2256) );
  NAND2XL U2863 ( .A(mask_pattern[5]), .B(n2256), .Y(n2269) );
  NAND2XL U2864 ( .A(store_cnt[5]), .B(n2258), .Y(n2260) );
  INVXL U2865 ( .A(n2260), .Y(n2262) );
  NAND2XL U2866 ( .A(store_cnt[6]), .B(n2262), .Y(n2261) );
  INVXL U2867 ( .A(n2269), .Y(n2270) );
  NAND2XL U2868 ( .A(mask_pattern[6]), .B(n2270), .Y(n2273) );
  NAND2XL U2869 ( .A(n2766), .B(n2273), .Y(n2272) );
  NOR2XL U2870 ( .A(n2277), .B(n2276), .Y(n2282) );
  NAND2XL U2871 ( .A(qrcode_start[6]), .B(n2282), .Y(n2281) );
  NOR2XL U2872 ( .A(qrcode_start[8]), .B(n2278), .Y(n2279) );
  OA21X1 U2873 ( .A0(qrcode_start[6]), .A1(n2282), .B0(n2281), .Y(
        qrcode_start_tmp[6]) );
  NAND4XL U2874 ( .A(position_cnt[3]), .B(position_cnt[2]), .C(n2284), .D(
        n2283), .Y(n2285) );
  OAI22XL U2875 ( .A0(n2288), .A1(n2287), .B0(n2286), .B1(n2285), .Y(n2289) );
  NAND2XL U2876 ( .A(n2293), .B(n2292), .Y(n2294) );
  XOR2XL U2877 ( .A(n2298), .B(n2297), .Y(n2299) );
  XOR2XL U2878 ( .A(n2303), .B(n2302), .Y(n2304) );
  AO21XL U2879 ( .A0(n2305), .A1(n2342), .B0(n2304), .Y(n2759) );
  XOR2XL U2880 ( .A(n2307), .B(n2306), .Y(n2308) );
  XOR2XL U2881 ( .A(n2308), .B(n1050), .Y(n2309) );
  AO21XL U2882 ( .A0(n2310), .A1(n2342), .B0(n2309), .Y(n2760) );
  XOR2XL U2883 ( .A(n2312), .B(n2311), .Y(n2313) );
  XOR2XL U2884 ( .A(n1034), .B(n2313), .Y(n2315) );
  AO21XL U2885 ( .A0(n2316), .A1(n2342), .B0(n2315), .Y(n2761) );
  XOR2XL U2886 ( .A(n2318), .B(n2317), .Y(n2319) );
  XOR2XL U2887 ( .A(n2320), .B(n2319), .Y(n2321) );
  XNOR2X1 U2888 ( .A(n2324), .B(n2323), .Y(n2325) );
  XOR3XL U2889 ( .A(n2335), .B(n2334), .C(n2333), .Y(n2336) );
  XOR2XL U2890 ( .A(n1929), .B(n2338), .Y(n2340) );
  XOR2XL U2891 ( .A(n2340), .B(n2339), .Y(n2341) );
  INVXL U2892 ( .A(n2357), .Y(n2355) );
  INVXL U2893 ( .A(N4101), .Y(n2350) );
  INVXL U2894 ( .A(N4104), .Y(n2351) );
  INVXL U2895 ( .A(N4107), .Y(n2352) );
  INVXL U2896 ( .A(N4110), .Y(n2353) );
  NOR2XL U2897 ( .A(n1000), .B(n2355), .Y(n2354) );
  NOR2XL U2898 ( .A(n999), .B(n2355), .Y(n2356) );
  OAI21XL U2899 ( .A0(decode_length_reg[0]), .A1(n2763), .B0(n2359), .Y(n2795)
         );
  AOI211XL U2900 ( .A0(n2361), .A1(n2360), .B0(n2362), .C0(n2384), .Y(n2793)
         );
  INVXL U2901 ( .A(decode_length_reg[4]), .Y(n2365) );
  NAND2XL U2902 ( .A(decode_length_reg[3]), .B(n2362), .Y(n2364) );
  AOI211XL U2903 ( .A0(n2365), .A1(n2364), .B0(n2384), .C0(n2363), .Y(n2791)
         );
  OAI21XL U2904 ( .A0(rotation_cnt[1]), .A1(n2367), .B0(n2366), .Y(n2368) );
  AO22XL U2905 ( .A0(n2369), .A1(n2368), .B0(rotation_cnt[2]), .B1(n2785), .Y(
        n2796) );
  AOI211XL U2906 ( .A0(n1301), .A1(n2372), .B0(n2378), .C0(n2371), .Y(
        start_tmp[2]) );
  AOI211XL U2907 ( .A0(n2765), .A1(n2373), .B0(n2378), .C0(n2374), .Y(
        start_tmp[4]) );
  ADDFX1 U2908 ( .A(start_pos[5]), .B(n2375), .CI(n2374), .CO(n2239), .S(n2377) );
  AND2XL U2909 ( .A(n2377), .B(n2376), .Y(start_tmp[5]) );
  AOI211XL U2910 ( .A0(n1255), .A1(n2380), .B0(n2379), .C0(n2378), .Y(
        start_tmp[7]) );
  INVXL U2911 ( .A(decode_length_reg[6]), .Y(n2381) );
  NOR2XL U2912 ( .A(n2382), .B(n2381), .Y(n2385) );
  AOI211XL U2913 ( .A0(n2382), .A1(n2381), .B0(n2385), .C0(n2384), .Y(n2789)
         );
  NOR2XL U2914 ( .A(decode_length_reg[7]), .B(n2385), .Y(n2383) );
  AOI211XL U2915 ( .A0(decode_length_reg[7]), .A1(n2385), .B0(n2384), .C0(
        n2383), .Y(n2788) );
  INVXL U2916 ( .A(N3927), .Y(n2386) );
  OAI22XL U2917 ( .A0(n2400), .A1(n2390), .B0(n2389), .B1(n981), .Y(n2391) );
  OAI22XL U2918 ( .A0(n2400), .A1(n2393), .B0(n2392), .B1(n981), .Y(n2394) );
  OAI22XL U2919 ( .A0(n2400), .A1(n2396), .B0(n981), .B1(n2395), .Y(n2397) );
  OAI22XL U2920 ( .A0(n2400), .A1(n2399), .B0(n981), .B1(n2398), .Y(n2401) );
  NAND2XL U2921 ( .A(position_block_line[10]), .B(position_block_line[8]), .Y(
        n2406) );
  NAND4BXL U2922 ( .AN(position_block_line[7]), .B(position_block_line[12]), 
        .C(position_block_line[14]), .D(position_block_line[0]), .Y(n2405) );
  NOR2XL U2923 ( .A(position_block_line[17]), .B(position_block_line[15]), .Y(
        n2403) );
  NAND4XL U2924 ( .A(position_block_line[18]), .B(position_block_line[16]), 
        .C(n2403), .D(n2402), .Y(n2404) );
  NAND4XL U2925 ( .A(position_block_line[43]), .B(position_block_line[35]), 
        .C(position_block_line[33]), .D(position_block_line[50]), .Y(n2415) );
  NAND4XL U2926 ( .A(position_block_line[41]), .B(position_block_line[51]), 
        .C(n2409), .D(n2408), .Y(n2414) );
  NAND4XL U2927 ( .A(position_block_line[39]), .B(position_block_line[37]), 
        .C(n2411), .D(n2410), .Y(n2413) );
  OR3XL U2928 ( .A(n2416), .B(check_4), .C(N1009), .Y(N1011) );
  NAND2XL U2929 ( .A(state[0]), .B(state[2]), .Y(n2418) );
  INVXL U2930 ( .A(n2419), .Y(n2734) );
  AOI211XL U2931 ( .A0(n24230), .A1(n2422), .B0(n2421), .C0(n2426), .Y(
        decode_tmp[4]) );
  INVXL U2932 ( .A(decode_cnt[6]), .Y(n2425) );
  NOR2XL U2933 ( .A(n2425), .B(n2424), .Y(n2429) );
  AOI211XL U2934 ( .A0(n2425), .A1(n2424), .B0(n2429), .C0(n2426), .Y(
        decode_tmp[6]) );
  INVXL U2935 ( .A(decode_cnt[7]), .Y(n2428) );
  INVXL U2936 ( .A(n2429), .Y(n2427) );
  NOR2XL U2937 ( .A(decode_length[2]), .B(decode_length[1]), .Y(n2714) );
  NAND2XL U2938 ( .A(n2714), .B(n1371), .Y(n2654) );
  INVXL U2939 ( .A(n2654), .Y(n2633) );
  NAND2XL U2940 ( .A(n2455), .B(n2548), .Y(n2545) );
  INVXL U2941 ( .A(n2700), .Y(n2711) );
  NOR2XL U2942 ( .A(n2443), .B(n2432), .Y(n2598) );
  NOR2XL U2943 ( .A(n2501), .B(n2598), .Y(n2488) );
  NOR2XL U2944 ( .A(n2646), .B(n2511), .Y(n2557) );
  NOR2XL U2945 ( .A(n2488), .B(n2557), .Y(n2472) );
  NOR2XL U2946 ( .A(n2711), .B(n2472), .Y(n2647) );
  NOR2XL U2947 ( .A(n1443), .B(n2433), .Y(n2576) );
  NAND2XL U2948 ( .A(n2434), .B(n2576), .Y(n2683) );
  INVXL U2949 ( .A(n2613), .Y(n2688) );
  INVXL U2950 ( .A(n2502), .Y(n2642) );
  NAND2XL U2951 ( .A(n2477), .B(n2642), .Y(n2479) );
  INVXL U2952 ( .A(n2479), .Y(n2645) );
  NAND2XL U2953 ( .A(n2714), .B(n1074), .Y(n2550) );
  NAND2XL U2954 ( .A(n2477), .B(n2546), .Y(n2665) );
  INVXL U2955 ( .A(n2665), .Y(n2652) );
  NOR2XL U2956 ( .A(decode_length[1]), .B(n1443), .Y(n2704) );
  NAND2XL U2957 ( .A(n1074), .B(n2704), .Y(n2706) );
  OA22X1 U2958 ( .A0(n2645), .A1(n2550), .B0(n2652), .B1(n2706), .Y(n2437) );
  NOR2XL U2959 ( .A(decode_length[2]), .B(n2435), .Y(n2679) );
  NAND2XL U2960 ( .A(n2484), .B(n2642), .Y(n2487) );
  NAND2XL U2961 ( .A(n2511), .B(n2487), .Y(n2600) );
  INVXL U2962 ( .A(n2600), .Y(n2634) );
  NAND2XL U2963 ( .A(n2455), .B(n2467), .Y(n2560) );
  NAND2XL U2964 ( .A(n2719), .B(n2704), .Y(n2614) );
  INVXL U2965 ( .A(n2614), .Y(n2653) );
  AOI22XL U2966 ( .A0(n2679), .A1(n2634), .B0(n2560), .B1(n2653), .Y(n2436) );
  AOI211XL U2967 ( .A0(n2633), .A1(n2545), .B0(n2647), .C0(n2438), .Y(n2463)
         );
  OAI21XL U2968 ( .A0(n2714), .A1(n2440), .B0(n2439), .Y(n2454) );
  AOI21XL U2969 ( .A0(n2714), .A1(n1411), .B0(n2454), .Y(n2449) );
  INVXL U2970 ( .A(n2449), .Y(n2475) );
  INVXL U2971 ( .A(n2453), .Y(n2448) );
  NOR2XL U2972 ( .A(n2475), .B(n2448), .Y(n2724) );
  INVXL U2973 ( .A(n2724), .Y(n2668) );
  INVXL U2974 ( .A(n2454), .Y(n2442) );
  NOR2XL U2975 ( .A(n2442), .B(n2453), .Y(n2726) );
  NAND2XL U2976 ( .A(n2706), .B(n2711), .Y(n2510) );
  OAI21XL U2977 ( .A0(decode_length[2]), .A1(n2719), .B0(n2614), .Y(n2446) );
  INVXL U2978 ( .A(n2560), .Y(n2656) );
  NOR2XL U2979 ( .A(n2443), .B(n2656), .Y(n2540) );
  INVXL U2980 ( .A(n2540), .Y(n2655) );
  NOR2XL U2981 ( .A(n2655), .B(n2683), .Y(n2485) );
  BUFX2 U2982 ( .A(n2444), .Y(n2666) );
  INVXL U2983 ( .A(n2666), .Y(n2708) );
  OAI22XL U2984 ( .A0(n2615), .A1(n2654), .B0(n2642), .B1(n2708), .Y(n2445) );
  AOI211XL U2985 ( .A0(n2446), .A1(n2483), .B0(n2485), .C0(n2445), .Y(n2447)
         );
  INVXL U2986 ( .A(n2557), .Y(n2661) );
  NOR3XL U2987 ( .A(n2475), .B(n2708), .C(n2661), .Y(n2451) );
  NOR2XL U2988 ( .A(n2449), .B(n2448), .Y(n2473) );
  NAND2XL U2989 ( .A(n1074), .B(n2473), .Y(n2552) );
  NAND2XL U2990 ( .A(n2473), .B(n2548), .Y(n2592) );
  AOI21XL U2991 ( .A0(n2552), .A1(n2592), .B0(n2523), .Y(n2450) );
  AOI211XL U2992 ( .A0(n2726), .A1(n2452), .B0(n2451), .C0(n2450), .Y(n2462)
         );
  NOR2XL U2993 ( .A(n2454), .B(n2453), .Y(n2591) );
  INVXL U2994 ( .A(n2679), .Y(n2662) );
  NOR2XL U2995 ( .A(n2501), .B(n2512), .Y(n2521) );
  INVXL U2996 ( .A(n2553), .Y(n2694) );
  INVXL U2997 ( .A(n2704), .Y(n2456) );
  NAND2XL U2998 ( .A(n2456), .B(n2711), .Y(n2457) );
  OAI21XL U2999 ( .A0(n2502), .A1(n2511), .B0(n2467), .Y(n2715) );
  AOI22XL U3000 ( .A0(n2633), .A1(n2694), .B0(n2457), .B1(n2715), .Y(n2459) );
  INVXL U3001 ( .A(n2683), .Y(n2722) );
  INVXL U3002 ( .A(n2550), .Y(n2623) );
  INVXL U3003 ( .A(n2715), .Y(n2583) );
  AOI22XL U3004 ( .A0(n2722), .A1(n2509), .B0(n2623), .B1(n2583), .Y(n2458) );
  NAND2XL U3005 ( .A(n2591), .B(n2460), .Y(n2461) );
  NOR2XL U3006 ( .A(n2466), .B(n2465), .Y(n2464) );
  AOI211XL U3007 ( .A0(n2466), .A1(n2465), .B0(n2736), .C0(n2464), .Y(
        decode_jis8_data_reg[0]) );
  NAND2BXL U3008 ( .AN(n2599), .B(n2467), .Y(n2610) );
  NOR2XL U3009 ( .A(n2706), .B(n2610), .Y(n2471) );
  NAND2XL U3010 ( .A(n2550), .B(n2614), .Y(n2693) );
  INVXL U3011 ( .A(n2693), .Y(n2644) );
  AOI22XL U3012 ( .A0(n2700), .A1(n2560), .B0(n2694), .B1(n2722), .Y(n2469) );
  NAND3XL U3013 ( .A(n2719), .B(n1443), .C(n2557), .Y(n2468) );
  AOI211XL U3014 ( .A0(n2715), .A1(n2679), .B0(n2471), .C0(n2470), .Y(n2497)
         );
  INVXL U3015 ( .A(n2726), .Y(n2669) );
  INVXL U3016 ( .A(n2552), .Y(n2691) );
  INVXL U3017 ( .A(n2610), .Y(n2710) );
  INVXL U3018 ( .A(n2472), .Y(n2575) );
  NAND2XL U3019 ( .A(n2575), .B(n2653), .Y(n2474) );
  NAND2XL U3020 ( .A(n2719), .B(n2473), .Y(n2607) );
  OAI22XL U3021 ( .A0(n2475), .A1(n2474), .B0(n2652), .B1(n2607), .Y(n2476) );
  AOI21XL U3022 ( .A0(n2691), .A1(n2710), .B0(n2476), .Y(n2496) );
  NAND2XL U3023 ( .A(n2477), .B(n2600), .Y(n2517) );
  NOR2XL U3024 ( .A(n2546), .B(n2550), .Y(n2658) );
  OAI22XL U3025 ( .A0(n2642), .A1(n2654), .B0(n2646), .B1(n2683), .Y(n2478) );
  AOI211XL U3026 ( .A0(n2510), .A1(n2479), .B0(n2658), .C0(n2478), .Y(n2482)
         );
  INVXL U3027 ( .A(n2551), .Y(n2480) );
  NAND2XL U3028 ( .A(n2666), .B(n2480), .Y(n2481) );
  AOI21XL U3029 ( .A0(n2501), .A1(n2484), .B0(n2483), .Y(n2651) );
  INVXL U3030 ( .A(n2714), .Y(n2492) );
  NOR2XL U3031 ( .A(n2714), .B(n2576), .Y(n2570) );
  NAND2XL U3032 ( .A(n2719), .B(n2570), .Y(n2543) );
  NOR2XL U3033 ( .A(n2543), .B(n2551), .Y(n2486) );
  AOI211XL U3034 ( .A0(n2700), .A1(n2656), .B0(n2486), .C0(n2485), .Y(n2491)
         );
  NAND2XL U3035 ( .A(n2501), .B(n2487), .Y(n2577) );
  NAND2BXL U3036 ( .AN(n2488), .B(n2577), .Y(n2606) );
  INVXL U3037 ( .A(n2517), .Y(n2489) );
  AOI22XL U3038 ( .A0(n2679), .A1(n2606), .B0(n2704), .B1(n2489), .Y(n2490) );
  AOI22XL U3039 ( .A0(n2591), .A1(n2494), .B0(n2724), .B1(n2493), .Y(n2495) );
  NOR2XL U3040 ( .A(n2500), .B(n2499), .Y(n2498) );
  AOI211XL U3041 ( .A0(n2500), .A1(n2499), .B0(n2736), .C0(n2498), .Y(
        decode_jis8_data_reg[1]) );
  NOR2XL U3042 ( .A(n2654), .B(n2551), .Y(n2508) );
  OAI21XL U3043 ( .A0(n2501), .A1(n2646), .B0(n2577), .Y(n2721) );
  INVXL U3044 ( .A(n2721), .Y(n2643) );
  NAND2XL U3045 ( .A(n2546), .B(n2678), .Y(n2680) );
  INVXL U3046 ( .A(n2706), .Y(n2695) );
  AOI22XL U3047 ( .A0(n2679), .A1(n2575), .B0(n2680), .B1(n2695), .Y(n2503) );
  NAND2XL U3048 ( .A(n2502), .B(n2722), .Y(n2603) );
  INVXL U3049 ( .A(n2548), .Y(n2536) );
  NOR2XL U3050 ( .A(n2522), .B(n2536), .Y(n2717) );
  NOR2XL U3051 ( .A(n2708), .B(n2717), .Y(n2506) );
  INVXL U3052 ( .A(n2606), .Y(n2504) );
  NOR2XL U3053 ( .A(n2644), .B(n2504), .Y(n2505) );
  AOI22XL U3054 ( .A0(n2560), .A1(n2666), .B0(n2688), .B1(n2623), .Y(n2516) );
  NAND2XL U3055 ( .A(n2679), .B(n2694), .Y(n2515) );
  INVXL U3056 ( .A(n2509), .Y(n2699) );
  AOI22XL U3057 ( .A0(n2613), .A1(n2510), .B0(n2633), .B1(n2699), .Y(n2514) );
  OAI21XL U3058 ( .A0(n2512), .A1(n2511), .B0(n2546), .Y(n2697) );
  OAI21XL U3059 ( .A0(n2722), .A1(n2653), .B0(n2697), .Y(n2513) );
  NAND4XL U3060 ( .A(n2516), .B(n2515), .C(n2514), .D(n2513), .Y(n2519) );
  OAI22XL U3061 ( .A0(n2551), .A1(n2552), .B0(n2607), .B1(n2517), .Y(n2518) );
  AOI21XL U3062 ( .A0(n2591), .A1(n2519), .B0(n2518), .Y(n2531) );
  NOR2XL U3063 ( .A(n2522), .B(n2520), .Y(n2709) );
  NOR2XL U3064 ( .A(n2522), .B(n2521), .Y(n2687) );
  INVXL U3065 ( .A(n2717), .Y(n2686) );
  AOI22XL U3066 ( .A0(n2686), .A1(n2623), .B0(n2680), .B1(n2633), .Y(n2525) );
  NOR2XL U3067 ( .A(n2523), .B(n2634), .Y(n2632) );
  NOR2XL U3068 ( .A(n2632), .B(n2706), .Y(n2563) );
  INVXL U3069 ( .A(n2563), .Y(n2524) );
  AOI21XL U3070 ( .A0(n2653), .A1(n2557), .B0(n2526), .Y(n2528) );
  MXI2XL U3071 ( .A(n2679), .B(n2722), .S0(n2715), .Y(n2527) );
  NAND2XL U3072 ( .A(n2724), .B(n2529), .Y(n2530) );
  NOR2XL U3073 ( .A(n2535), .B(n2534), .Y(n2533) );
  AOI211XL U3074 ( .A0(n2535), .A1(n2534), .B0(n2736), .C0(n2533), .Y(
        decode_jis8_data_reg[2]) );
  INVXL U3075 ( .A(n2646), .Y(n2538) );
  NAND2XL U3076 ( .A(decode_length[1]), .B(n1443), .Y(n2696) );
  NOR2XL U3077 ( .A(n2536), .B(n2696), .Y(n2537) );
  AOI211XL U3078 ( .A0(n2538), .A1(n2623), .B0(n2666), .C0(n2537), .Y(n2542)
         );
  NOR2XL U3079 ( .A(n1074), .B(n2570), .Y(n2547) );
  OAI21XL U3080 ( .A0(n2547), .A1(n2695), .B0(n2540), .Y(n2541) );
  AOI21XL U3081 ( .A0(n2722), .A1(n2545), .B0(n2544), .Y(n2566) );
  INVXL U3082 ( .A(n2591), .Y(n2729) );
  AOI22XL U3083 ( .A0(n2679), .A1(n2483), .B0(n2547), .B1(n2610), .Y(n2549) );
  OAI22XL U3084 ( .A0(n2551), .A1(n2614), .B0(n2550), .B1(n2665), .Y(n2555) );
  OAI22XL U3085 ( .A0(n2553), .A1(n2607), .B0(n2552), .B1(n2600), .Y(n2554) );
  OAI22XL U3086 ( .A0(n2652), .A1(n2644), .B0(n2711), .B1(n2610), .Y(n2562) );
  AOI22XL U3087 ( .A0(n2666), .A1(n2688), .B0(n2560), .B1(n2633), .Y(n2559) );
  NAND2XL U3088 ( .A(n2722), .B(n2557), .Y(n2558) );
  NOR2XL U3089 ( .A(n2569), .B(n2568), .Y(n2567) );
  AOI211XL U3090 ( .A0(n2569), .A1(n2568), .B0(n2736), .C0(n2567), .Y(
        decode_jis8_data_reg[3]) );
  AOI21XL U3091 ( .A0(decode_length[2]), .A1(n2803), .B0(n2709), .Y(n2574) );
  NOR2XL U3092 ( .A(n2717), .B(n2683), .Y(n2620) );
  INVXL U3093 ( .A(n2620), .Y(n2572) );
  INVXL U3094 ( .A(n2570), .Y(n2718) );
  AOI211XL U3095 ( .A0(n2695), .A1(n2575), .B0(n2574), .C0(n2573), .Y(n2594)
         );
  AOI22XL U3096 ( .A0(n2699), .A1(n2695), .B0(n2652), .B1(n2693), .Y(n2581) );
  NAND2XL U3097 ( .A(n2666), .B(n2583), .Y(n2580) );
  NAND2XL U3098 ( .A(n2576), .B(n2610), .Y(n2579) );
  INVXL U3099 ( .A(n2577), .Y(n2692) );
  AOI22XL U3100 ( .A0(n2633), .A1(n2665), .B0(n2679), .B1(n2692), .Y(n2578) );
  NAND4XL U3101 ( .A(n2581), .B(n2580), .C(n2579), .D(n2578), .Y(n2590) );
  INVXL U3102 ( .A(n2651), .Y(n2582) );
  AOI22XL U3103 ( .A0(n2722), .A1(n2582), .B0(n2666), .B1(n2699), .Y(n2588) );
  NAND2XL U3104 ( .A(n2633), .B(n2606), .Y(n2677) );
  NAND2XL U3105 ( .A(n2623), .B(n2721), .Y(n2587) );
  NAND2XL U3106 ( .A(n2688), .B(n2679), .Y(n2636) );
  NAND2XL U3107 ( .A(n2695), .B(n2583), .Y(n2584) );
  AOI21XL U3108 ( .A0(n2700), .A1(n2697), .B0(n2585), .Y(n2586) );
  NAND4XL U3109 ( .A(n2588), .B(n2677), .C(n2587), .D(n2586), .Y(n2589) );
  AOI22XL U3110 ( .A0(n2591), .A1(n2590), .B0(n2724), .B1(n2589), .Y(n2593) );
  NOR2XL U3111 ( .A(n2597), .B(n2596), .Y(n2595) );
  AOI211XL U3112 ( .A0(n2597), .A1(n2596), .B0(n2736), .C0(n2595), .Y(
        decode_jis8_data_reg[4]) );
  NOR2XL U3113 ( .A(n2599), .B(n2598), .Y(n2640) );
  NOR2XL U3114 ( .A(n2696), .B(n2640), .Y(n2605) );
  INVXL U3115 ( .A(n2709), .Y(n2601) );
  NAND2XL U3116 ( .A(n2642), .B(n2600), .Y(n2616) );
  INVXL U3117 ( .A(n2616), .Y(n2705) );
  AOI22XL U3118 ( .A0(n2601), .A1(n2633), .B0(n2695), .B1(n2705), .Y(n2602) );
  AOI211XL U3119 ( .A0(n2700), .A1(n2606), .B0(n2605), .C0(n2604), .Y(n2628)
         );
  INVXL U3120 ( .A(n2607), .Y(n2689) );
  AOI22XL U3121 ( .A0(n2691), .A1(n2699), .B0(n2689), .B1(n2692), .Y(n2627) );
  NOR2XL U3122 ( .A(n2633), .B(n2722), .Y(n2703) );
  NOR2XL U3123 ( .A(n2644), .B(n2687), .Y(n2609) );
  OAI22XL U3124 ( .A0(n2632), .A1(n2711), .B0(n2665), .B1(n2708), .Y(n2608) );
  AOI211XL U3125 ( .A0(n2679), .A1(n2610), .B0(n2609), .C0(n2608), .Y(n2612)
         );
  NAND2XL U3126 ( .A(n2695), .B(n2699), .Y(n2611) );
  OAI22XL U3127 ( .A0(n2615), .A1(n2614), .B0(n2646), .B1(n2662), .Y(n2619) );
  OAI22XL U3128 ( .A0(n2699), .A1(n2711), .B0(n2616), .B1(n2708), .Y(n2618) );
  NOR2XL U3129 ( .A(n2706), .B(n2640), .Y(n2617) );
  OAI21XL U3130 ( .A0(n2654), .A1(n2688), .B0(n2621), .Y(n2622) );
  AO21XL U3131 ( .A0(n2623), .A1(n2697), .B0(n2622), .Y(n2624) );
  AOI22XL U3132 ( .A0(n2726), .A1(n2625), .B0(n2724), .B1(n2624), .Y(n2626) );
  NOR2XL U3133 ( .A(n2631), .B(n2630), .Y(n2629) );
  AOI211XL U3134 ( .A0(n2631), .A1(n2630), .B0(n2736), .C0(n2629), .Y(
        decode_jis8_data_reg[5]) );
  INVXL U3135 ( .A(n2632), .Y(n2635) );
  AOI22XL U3136 ( .A0(n2666), .A1(n2635), .B0(n2634), .B1(n2633), .Y(n2637) );
  AOI21XL U3137 ( .A0(n2644), .A1(n2711), .B0(n2651), .Y(n2638) );
  AOI211XL U3138 ( .A0(n2722), .A1(n2656), .B0(n2639), .C0(n2638), .Y(n2673)
         );
  INVXL U3139 ( .A(n2640), .Y(n2641) );
  AOI22XL U3140 ( .A0(n2691), .A1(n2705), .B0(n2689), .B1(n2641), .Y(n2672) );
  NOR2XL U3141 ( .A(n2642), .B(n2662), .Y(n2650) );
  OAI22XL U3142 ( .A0(n2655), .A1(n2706), .B0(n2643), .B1(n2708), .Y(n2649) );
  OAI22XL U3143 ( .A0(n2646), .A1(n2703), .B0(n2645), .B1(n2644), .Y(n2648) );
  NOR2XL U3144 ( .A(n2711), .B(n2651), .Y(n2664) );
  AOI22XL U3145 ( .A0(n2699), .A1(n2653), .B0(n2722), .B1(n2652), .Y(n2660) );
  OAI22XL U3146 ( .A0(n2656), .A1(n2706), .B0(n2655), .B1(n2654), .Y(n2657) );
  NOR2XL U3147 ( .A(n2658), .B(n2657), .Y(n2659) );
  AOI211XL U3148 ( .A0(n2666), .A1(n2665), .B0(n2664), .C0(n2663), .Y(n2667)
         );
  OA22X1 U3149 ( .A0(n2670), .A1(n2669), .B0(n2668), .B1(n2667), .Y(n2671) );
  NOR2XL U3150 ( .A(n2676), .B(n2675), .Y(n2674) );
  AOI211XL U3151 ( .A0(n2676), .A1(n2675), .B0(n2736), .C0(n2674), .Y(
        decode_jis8_data_reg[6]) );
  INVXL U3152 ( .A(n2677), .Y(n2685) );
  AOI22XL U3153 ( .A0(n2700), .A1(n2680), .B0(n2679), .B1(n2678), .Y(n2682) );
  AOI211XL U3154 ( .A0(n2693), .A1(n2686), .B0(n2685), .C0(n2684), .Y(n2730)
         );
  INVXL U3155 ( .A(n2687), .Y(n2690) );
  AOI22XL U3156 ( .A0(n2691), .A1(n2690), .B0(n2689), .B1(n2688), .Y(n2728) );
  AOI22XL U3157 ( .A0(n2695), .A1(n2694), .B0(n2693), .B1(n2692), .Y(n2702) );
  INVXL U3158 ( .A(n2696), .Y(n2698) );
  AOI22XL U3159 ( .A0(n2700), .A1(n2699), .B0(n2698), .B1(n2697), .Y(n2701) );
  NAND2XL U3160 ( .A(n2705), .B(n2704), .Y(n2707) );
  NOR2XL U3161 ( .A(n2711), .B(n2710), .Y(n2712) );
  AOI211XL U3162 ( .A0(n2715), .A1(n2714), .B0(n2713), .C0(n2712), .Y(n2716)
         );
  AOI22XL U3163 ( .A0(n2726), .A1(n2725), .B0(n2724), .B1(n2723), .Y(n2727) );
  NOR2XL U3164 ( .A(n2733), .B(n2732), .Y(n2731) );
  AOI211XL U3165 ( .A0(n2733), .A1(n2732), .B0(n2736), .C0(n2731), .Y(
        decode_jis8_data_reg[7]) );
  AOI32XL U3166 ( .A0(n2749), .A1(n2748), .A2(n1969), .B0(n2747), .B1(n2748), 
        .Y(nstate[2]) );
  AND2XL U3167 ( .A(n2755), .B(intadd_0_SUM_2_), .Y(N2808) );
  AND2XL U3168 ( .A(n2755), .B(intadd_0_SUM_1_), .Y(N2807) );
  AND2XL U3169 ( .A(n2755), .B(intadd_0_SUM_0_), .Y(N2806) );
  AND2XL U3170 ( .A(n2755), .B(n2754), .Y(N2805) );
  SNPS_CLOCK_GATE_HIGH_qrc_decode_mydesign_0 clk_gate_start_pos_reg ( .CLK(clk), .EN(net6008), .ENCLK(net6012) );
  SNPS_CLOCK_GATE_HIGH_qrc_decode_mydesign_5 clk_gate_qrcode_start_reg ( .CLK(
        clk), .EN(N1011), .ENCLK(net6017) );
  SNPS_CLOCK_GATE_HIGH_qrc_decode_mydesign_4 clk_gate_decode_length_reg_reg ( 
        .CLK(clk), .EN(N1243), .ENCLK(net6022) );
  SNPS_CLOCK_GATE_HIGH_qrc_decode_mydesign_3 clk_gate_rotation_cnt_reg ( .CLK(
        clk), .EN(n1006), .ENCLK(net6027) );
  SNPS_CLOCK_GATE_HIGH_qrc_decode_mydesign_2 clk_gate_rotation_type_reg ( 
        .CLK(clk), .EN(N707), .ENCLK(net6032) );
  SNPS_CLOCK_GATE_HIGH_qrc_decode_mydesign_1 clk_gate_mask_pattern_reg ( .CLK(
        clk), .EN(net6035), .ENCLK(net6038) );
  NOR2BXL U1292 ( .AN(n1699), .B(n1625), .Y(n1648) );
  XOR2X1 U1877 ( .A(n1045), .B(n1832), .Y(n1935) );
  NOR2XL U1785 ( .A(n1646), .B(n1376), .Y(n1075) );
  OR2X2 U1531 ( .A(n1909), .B(n1908), .Y(n2334) );
  DFFQX2 decode_length_reg_1_ ( .D(decode_length_reg[1]), .CK(clk), .Q(
        decode_length[1]) );
  DFFTRXL state_reg_2_ ( .D(rstn), .RN(nstate[2]), .CK(clk), .Q(state[2]), 
        .QN(n2757) );
  DFFQXL decode_length_reg_4_ ( .D(decode_length_reg[4]), .CK(clk), .Q(
        decode_length[4]) );
  NOR2X1 U1683 ( .A(decode_cnt[0]), .B(n1697), .Y(n1746) );
  INVX2 U1758 ( .A(decode_cnt[2]), .Y(n1755) );
  INVX1 U1494 ( .A(n2277), .Y(n1856) );
  NAND2X1 U1763 ( .A(n2736), .B(n1530), .Y(n1955) );
  ADDFX1 U1263 ( .A(n1302), .B(n1801), .CI(n1800), .CO(n1794), .S(n1802) );
  OA22X1 U1994 ( .A0(n1751), .A1(n1750), .B0(n2059), .B1(n1749), .Y(n1286) );
  XNOR2X1 U1394 ( .A(n1898), .B(n1897), .Y(n1899) );
  XNOR2X1 U1254 ( .A(n1438), .B(n2357), .Y(n1270) );
  XNOR2X1 U1255 ( .A(n1926), .B(n1925), .Y(n1927) );
  XNOR2X1 U1257 ( .A(start_pos[6]), .B(n1103), .Y(n1102) );
  BUFX2 U1258 ( .A(n1957), .Y(n28080) );
  OR2XL U1259 ( .A(n1710), .B(n1588), .Y(n1589) );
  AND2XL U1260 ( .A(decode_length[4]), .B(n1368), .Y(n2801) );
  NOR2BXL U1261 ( .AN(n1136), .B(n1402), .Y(n1750) );
  NOR2BXL U1262 ( .AN(n1137), .B(n1389), .Y(n1749) );
  OAI2BB1XL U1264 ( .A0N(n1606), .A1N(n1605), .B0(n1604), .Y(n1607) );
  NOR4XL U1265 ( .A(n1715), .B(n1392), .C(n1714), .D(n1713), .Y(n1717) );
  OAI221XL U1266 ( .A0(n2057), .A1(n2546), .B0(n1417), .B1(n2455), .C0(n1361), 
        .Y(n1362) );
  NOR4XL U1268 ( .A(decode_cnt[2]), .B(n2501), .C(n1360), .D(n1705), .Y(n1358)
         );
  NOR2BXL U1269 ( .AN(n1808), .B(n1930), .Y(n1934) );
  AOI31XL U1270 ( .A0(n1755), .A1(n1697), .A2(n2615), .B0(n1358), .Y(n1366) );
  NOR2BXL U1271 ( .AN(n1427), .B(n1407), .Y(n1271) );
  OAI211XL U1272 ( .A0(decode_cnt[0]), .A1(n2551), .B0(n1366), .C0(n1365), .Y(
        n1438) );
  AOI32XL U1273 ( .A0(n1346), .A1(n1345), .A2(n1344), .B0(n1847), .B1(n1345), 
        .Y(n1347) );
  NOR2BXL U1276 ( .AN(n1058), .B(n1422), .Y(n1130) );
  OAI211XL U1277 ( .A0(n1930), .A1(n1787), .B0(n1786), .C0(n1785), .Y(n1788)
         );
  OAI211XL U1278 ( .A0(n1930), .A1(n1813), .B0(n1812), .C0(n1811), .Y(n1814)
         );
  NOR2BXL U1281 ( .AN(n1119), .B(n1064), .Y(n1274) );
  XNOR2XL U1283 ( .A(n1952), .B(n1951), .Y(n1267) );
  NOR2BXL U1284 ( .AN(n1955), .B(n1929), .Y(n1219) );
  NOR2BXL U1287 ( .AN(state[1]), .B(n2763), .Y(n1234) );
  NOR2BXL U1288 ( .AN(n2455), .B(n2521), .Y(n2553) );
  OAI2BB1XL U1289 ( .A0N(n1353), .A1N(n1352), .B0(n1429), .Y(n2511) );
  NOR2BXL U1290 ( .AN(n1495), .B(n1797), .Y(n1496) );
  NOR2BXL U1291 ( .AN(n10870), .B(n1820), .Y(n10860) );
  ADDFX1 U1294 ( .A(n1954), .B(n1893), .CI(n1892), .CO(n1884), .S(n1894) );
  NOR4XL U1295 ( .A(position_block[9]), .B(position_block[1]), .C(n2214), .D(
        n2213), .Y(n2219) );
  OAI211XL U1299 ( .A0(n2709), .A1(n2683), .B0(n2682), .C0(n2681), .Y(n2684)
         );
  OAI211XL U1301 ( .A0(n2643), .A1(n2644), .B0(n2603), .C0(n2602), .Y(n2604)
         );
  OAI211XL U1303 ( .A0(n2643), .A1(n2711), .B0(n2503), .C0(n2603), .Y(n2507)
         );
  OAI211XL U1334 ( .A0(n2683), .A1(n2688), .B0(n2437), .C0(n2436), .Y(n2438)
         );
  OR2XL U1335 ( .A(n1545), .B(n1544), .Y(n2297) );
  NOR2BXL U1339 ( .AN(n1039), .B(n1793), .Y(n1242) );
  XNOR2XL U1340 ( .A(n1929), .B(n1865), .Y(n2318) );
  INVXL U1346 ( .A(decode_cnt[0]), .Y(n1732) );
  NOR4XL U1347 ( .A(store_cnt[2]), .B(store_cnt[3]), .C(store_cnt[6]), .D(
        store_cnt[5]), .Y(n1330) );
  OAI211XL U1368 ( .A0(n2078), .A1(n2742), .B0(n2740), .C0(n2077), .Y(n2290)
         );
  AOI221XL U1373 ( .A0(n2556), .A1(n2724), .B0(n2555), .B1(n2724), .C0(n2554), 
        .Y(n2565) );
  NOR4XL U1379 ( .A(decode_cnt[3]), .B(decode_cnt[7]), .C(n1316), .D(n1751), 
        .Y(n2349) );
  XNOR2XL U1381 ( .A(n1039), .B(n1793), .Y(n1244) );
  NOR4XL U1384 ( .A(position_block_line[44]), .B(position_block_line[42]), .C(
        position_block_line[36]), .D(position_block_line[34]), .Y(n2410) );
  NOR4BXL U1389 ( .AN(position_block_line[24]), .B(position_block_line[13]), 
        .C(position_block_line[11]), .D(position_block_line[9]), .Y(n2402) );
  NOR4XL U1395 ( .A(n2083), .B(n2082), .C(n2290), .D(n2081), .Y(n2085) );
  INVXL U1398 ( .A(n2060), .Y(n2059) );
  OAI211XL U1399 ( .A0(n2566), .A1(n2729), .B0(n2565), .C0(n2564), .Y(n2568)
         );
  XNOR2XL U1400 ( .A(n1774), .B(n1268), .Y(n2305) );
  XNOR2XL U1403 ( .A(n10880), .B(n1819), .Y(n2322) );
  OAI211XL U1414 ( .A0(store_cnt[5]), .A1(n2258), .B0(n2260), .C0(n2264), .Y(
        n2259) );
  XNOR2XL U1416 ( .A(decode_length_reg[3]), .B(n2362), .Y(n2023) );
  XNOR2XL U1419 ( .A(n2044), .B(n2043), .Y(n2045) );
  OAI2BB1XL U1423 ( .A0N(n2754), .A1N(n2275), .B0(n2254), .Y(N2809) );
  XNOR2XL U1425 ( .A(n1979), .B(n1978), .Y(N1086) );
  XNOR2XL U1428 ( .A(qrcode_start[8]), .B(n2278), .Y(qrcode_start_tmp[8]) );
  OAI2BB1XL U1440 ( .A0N(n2275), .A1N(intadd_0_SUM_1_), .B0(n2271), .Y(N2811)
         );
  OAI2BB1XL U1441 ( .A0N(start_pos[6]), .A1N(n2268), .B0(n2263), .Y(
        store_tmp[6]) );
  OAI211XL U1447 ( .A0(n2388), .A1(n2389), .B0(n2387), .C0(n2386), .Y(
        position_block_line_tmp[51]) );
  NOR2XL U1449 ( .A(decode_length[1]), .B(n1386), .Y(n2798) );
  AND2XL U1456 ( .A(n1153), .B(n1152), .Y(n2799) );
  AND2XL U1462 ( .A(n2317), .B(n2318), .Y(n2800) );
  NOR4XL U1465 ( .A(n1739), .B(n1609), .C(n1690), .D(n1664), .Y(n1370) );
  NOR2XL U1482 ( .A(decode_length[1]), .B(n1074), .Y(n1371) );
  OR2XL U1483 ( .A(n1671), .B(n1689), .Y(n2802) );
  OR2XL U1487 ( .A(decode_length[1]), .B(n1074), .Y(n2803) );
  XNOR2X1 U1493 ( .A(n1149), .B(n2330), .Y(n2331) );
  INVX1 U1500 ( .A(n1421), .Y(n1533) );
  NOR2BXL U1525 ( .AN(n1421), .B(n1840), .Y(n1841) );
  AOI21XL U1602 ( .A0(decode_cnt[2]), .A1(n1641), .B0(n1640), .Y(n1850) );
  AOI21XL U1606 ( .A0(n1755), .A1(n1754), .B0(n1753), .Y(n2804) );
  NOR2XL U1607 ( .A(n1298), .B(n28070), .Y(n28050) );
  NOR2XL U1668 ( .A(n1298), .B(n28070), .Y(n28060) );
  AOI31XL U1754 ( .A0(n1246), .A1(n1655), .A2(n1654), .B0(n1180), .Y(n1657) );
  INVX1 U1774 ( .A(N2423), .Y(n1074) );
  NAND2BXL U1786 ( .AN(n2800), .B(n1944), .Y(n2314) );
  AOI21XL U1801 ( .A0(n1140), .A1(n28090), .B0(n1755), .Y(n28070) );
  XNOR2XL U1802 ( .A(n1919), .B(n1918), .Y(n1920) );
  NOR2XL U1804 ( .A(n1845), .B(n1846), .Y(n1919) );
  NOR2XL U1808 ( .A(n1145), .B(n1079), .Y(n28090) );
  XNOR2XL U1817 ( .A(n28100), .B(n1968), .Y(n1147) );
  AOI22XL U1867 ( .A0(n2297), .A1(n2298), .B0(n1948), .B1(n1154), .Y(n28100)
         );
  AOI21XL U1880 ( .A0(n2799), .A1(n1169), .B0(n1744), .Y(n1172) );
  XOR3XL U1881 ( .A(n1936), .B(n1935), .C(n1845), .Y(n1187) );
  NAND2X1 U1898 ( .A(N2423), .B(decode_length[1]), .Y(n1374) );
  NAND2X1 U1904 ( .A(rotation_type[2]), .B(n1349), .Y(n1847) );
  NOR2X1 U1993 ( .A(n1534), .B(n1533), .Y(n1931) );
  AND2XL U2026 ( .A(n1523), .B(n1993), .Y(n28110) );
endmodule

