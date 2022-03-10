Content-Type: multipart/mixed; boundary="===============3860539189600040905=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 304/973] drivers/tty/serial/xilinx_uartps.c:1518 cdns_get_id() warn: inconsistent returns '&bitmap_lock'.
Date: Thu, 10 Mar 2022 11:22:39 +0800
Message-ID: <202203101142.hH8SLXWi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3860539189600040905==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Michal Simek <monstr@monstr.eu>
CC: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
CC: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   802aff9b79e15ede7cbb84ac784f943f5a66287a
commit: f0090478ae8a76b733a846f50dc5559fff3c461f [304/973] serial: uartps: =
Change uart ID port allocation
:::::: branch date: 6 days ago
:::::: commit date: 5 weeks ago
config: openrisc-randconfig-m031-20220309 (https://download.01.org/0day-ci/=
archive/20220310/202203101142.hH8SLXWi-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/tty/serial/xilinx_uartps.c:1518 cdns_get_id() warn: inconsistent re=
turns '&bitmap_lock'.

vim +1518 drivers/tty/serial/xilinx_uartps.c

f0090478ae8a76b Michal Simek 2018-09-20  1453  =

f0090478ae8a76b Michal Simek 2018-09-20  1454  static int cdns_get_id(struc=
t platform_device *pdev)
f0090478ae8a76b Michal Simek 2018-09-20  1455  {
f0090478ae8a76b Michal Simek 2018-09-20  1456  	int id, ret;
f0090478ae8a76b Michal Simek 2018-09-20  1457  =

f0090478ae8a76b Michal Simek 2018-09-20  1458  	mutex_lock(&bitmap_lock);
f0090478ae8a76b Michal Simek 2018-09-20  1459  =

f0090478ae8a76b Michal Simek 2018-09-20  1460  	/* Alias list is stable tha=
t's why get alias bitmap only once */
f0090478ae8a76b Michal Simek 2018-09-20  1461  	if (!alias_bitmap_initializ=
ed) {
f0090478ae8a76b Michal Simek 2018-09-20  1462  		ret =3D of_alias_get_alias=
_list(cdns_uart_of_match, "serial",
f0090478ae8a76b Michal Simek 2018-09-20  1463  					      alias_bitmap, CDN=
S_UART_NR_PORTS);
f0090478ae8a76b Michal Simek 2018-09-20  1464  		if (ret)
f0090478ae8a76b Michal Simek 2018-09-20  1465  			return ret;
f0090478ae8a76b Michal Simek 2018-09-20  1466  =

f0090478ae8a76b Michal Simek 2018-09-20  1467  		alias_bitmap_initialized++;
f0090478ae8a76b Michal Simek 2018-09-20  1468  	}
f0090478ae8a76b Michal Simek 2018-09-20  1469  =

f0090478ae8a76b Michal Simek 2018-09-20  1470  	/* Make sure that alias ID =
is not taken by instance without alias */
f0090478ae8a76b Michal Simek 2018-09-20  1471  	bitmap_or(bitmap, bitmap, a=
lias_bitmap, CDNS_UART_NR_PORTS);
f0090478ae8a76b Michal Simek 2018-09-20  1472  =

f0090478ae8a76b Michal Simek 2018-09-20  1473  	dev_dbg(&pdev->dev, "Alias =
bitmap: %*pb\n",
f0090478ae8a76b Michal Simek 2018-09-20  1474  		CDNS_UART_NR_PORTS, bitmap=
);
f0090478ae8a76b Michal Simek 2018-09-20  1475  =

f0090478ae8a76b Michal Simek 2018-09-20  1476  	/* Look for a serialN alias=
 */
f0090478ae8a76b Michal Simek 2018-09-20  1477  	id =3D of_alias_get_id(pdev=
->dev.of_node, "serial");
f0090478ae8a76b Michal Simek 2018-09-20  1478  	if (id < 0) {
f0090478ae8a76b Michal Simek 2018-09-20  1479  		dev_warn(&pdev->dev,
f0090478ae8a76b Michal Simek 2018-09-20  1480  			 "No serial alias passed.=
 Using the first free id\n");
f0090478ae8a76b Michal Simek 2018-09-20  1481  =

f0090478ae8a76b Michal Simek 2018-09-20  1482  		/*
f0090478ae8a76b Michal Simek 2018-09-20  1483  		 * Start with id 0 and che=
ck if there is no serial0 alias
f0090478ae8a76b Michal Simek 2018-09-20  1484  		 * which points to device =
which is compatible with this driver.
f0090478ae8a76b Michal Simek 2018-09-20  1485  		 * If alias exists then tr=
y next free position.
f0090478ae8a76b Michal Simek 2018-09-20  1486  		 */
f0090478ae8a76b Michal Simek 2018-09-20  1487  		id =3D 0;
f0090478ae8a76b Michal Simek 2018-09-20  1488  =

f0090478ae8a76b Michal Simek 2018-09-20  1489  		for (;;) {
f0090478ae8a76b Michal Simek 2018-09-20  1490  			dev_info(&pdev->dev, "Che=
cking id %d\n", id);
f0090478ae8a76b Michal Simek 2018-09-20  1491  			id =3D find_next_zero_bit=
(bitmap, CDNS_UART_NR_PORTS, id);
f0090478ae8a76b Michal Simek 2018-09-20  1492  =

f0090478ae8a76b Michal Simek 2018-09-20  1493  			/* No free empty instance=
 */
f0090478ae8a76b Michal Simek 2018-09-20  1494  			if (id =3D=3D CDNS_UART_N=
R_PORTS) {
f0090478ae8a76b Michal Simek 2018-09-20  1495  				dev_err(&pdev->dev, "No =
free ID\n");
f0090478ae8a76b Michal Simek 2018-09-20  1496  				mutex_unlock(&bitmap_loc=
k);
f0090478ae8a76b Michal Simek 2018-09-20  1497  				return -EINVAL;
f0090478ae8a76b Michal Simek 2018-09-20  1498  			}
f0090478ae8a76b Michal Simek 2018-09-20  1499  =

f0090478ae8a76b Michal Simek 2018-09-20  1500  			dev_dbg(&pdev->dev, "The =
empty id is %d\n", id);
f0090478ae8a76b Michal Simek 2018-09-20  1501  			/* Check if ID is empty */
f0090478ae8a76b Michal Simek 2018-09-20  1502  			if (!test_and_set_bit(id,=
 bitmap)) {
f0090478ae8a76b Michal Simek 2018-09-20  1503  				/* Break the loop if bit=
 is taken */
f0090478ae8a76b Michal Simek 2018-09-20  1504  				dev_dbg(&pdev->dev,
f0090478ae8a76b Michal Simek 2018-09-20  1505  					"Selected ID %d allocat=
ion passed\n",
f0090478ae8a76b Michal Simek 2018-09-20  1506  					id);
f0090478ae8a76b Michal Simek 2018-09-20  1507  				break;
f0090478ae8a76b Michal Simek 2018-09-20  1508  			}
f0090478ae8a76b Michal Simek 2018-09-20  1509  			dev_dbg(&pdev->dev,
f0090478ae8a76b Michal Simek 2018-09-20  1510  				"Selected ID %d allocati=
on failed\n", id);
f0090478ae8a76b Michal Simek 2018-09-20  1511  			/* if taking bit fails th=
en try next one */
f0090478ae8a76b Michal Simek 2018-09-20  1512  			id++;
f0090478ae8a76b Michal Simek 2018-09-20  1513  		}
f0090478ae8a76b Michal Simek 2018-09-20  1514  	}
f0090478ae8a76b Michal Simek 2018-09-20  1515  =

f0090478ae8a76b Michal Simek 2018-09-20  1516  	mutex_unlock(&bitmap_lock);
f0090478ae8a76b Michal Simek 2018-09-20  1517  =

f0090478ae8a76b Michal Simek 2018-09-20 @1518  	return id;
f0090478ae8a76b Michal Simek 2018-09-20  1519  }
f0090478ae8a76b Michal Simek 2018-09-20  1520  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3860539189600040905==--

