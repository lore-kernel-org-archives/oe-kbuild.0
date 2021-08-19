Content-Type: multipart/mixed; boundary="===============2952630742133704418=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/tty/serial/samsung_tty.c:1314:3: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
Date: Thu, 19 Aug 2021 20:26:43 +0800
Message-ID: <202108192024.QTEheMCJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2952630742133704418==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Julian Braha <julianbraha@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Julian,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d6d09a6942050f21b065a134169002b4d6b701ef
commit: 7d37cb2c912dc5c25ffac784a4f9b98c06c6bd08 lib: fix kconfig dependenc=
y on ARCH_WANT_FRAME_POINTERS
date:   4 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 4 months ago
compiler: csky-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> drivers/tty/serial/samsung_tty.c:1314:3: warning: %d in format string (n=
o. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrint=
fArgType_sint]
     sprintf(clkname, "clk_uart_baud%d", cnt);
     ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/tty/serial/samsung_tty.c:1314:3: warning: %d in format string (n=
o. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrint=
fArgType_sint]
     sprintf(clkname, "clk_uart_baud%d", cnt);
     ^
>> drivers/tty/n_gsm.c:1000:24: warning: Possible null pointer dereference:=
 data [nullPointer]
    memcpy(msg->data + 2, data, dlen);
                          ^
   drivers/tty/n_gsm.c:1216:36: note: Calling function 'gsm_control_reply',=
 3rd argument 'NULL' value is 0
     gsm_control_reply(gsm, CMD_FCON, NULL, 0);
                                      ^
   drivers/tty/n_gsm.c:1000:24: note: Null pointer dereference
    memcpy(msg->data + 2, data, dlen);
                          ^

vim +1314 drivers/tty/serial/samsung_tty.c

5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1296  =

5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1297  static unsigned int s3c24xx_serial_getclk(struct s3c24xx_uart_port *=
ourport,
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1298  			unsigned int req_baud, struct clk **best_clk,
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1299  			unsigned int *clk_num)
b497549a035c2a drivers/serial/samsung.c         Ben Dooks       2008-07-03 =
 1300  {
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1301  	struct s3c24xx_uart_info *info =3D ourport->info;
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1302  	struct clk *clk;
b497549a035c2a drivers/serial/samsung.c         Ben Dooks       2008-07-03 =
 1303  	unsigned long rate;
7d31676a8d91dd drivers/tty/serial/samsung_tty.c Jonathan Bakker 2020-05-08 =
 1304  	unsigned int cnt, baud, quot, best_quot =3D 0;
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1305  	char clkname[MAX_CLK_NAME_LENGTH];
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1306  	int calc_deviation, deviation =3D (1 << 30) - 1;
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1307  =

5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1308  	for (cnt =3D 0; cnt < info->num_clks; cnt++) {
7d31676a8d91dd drivers/tty/serial/samsung_tty.c Jonathan Bakker 2020-05-08 =
 1309  		/* Keep selected clock if provided */
7d31676a8d91dd drivers/tty/serial/samsung_tty.c Jonathan Bakker 2020-05-08 =
 1310  		if (ourport->cfg->clk_sel &&
7d31676a8d91dd drivers/tty/serial/samsung_tty.c Jonathan Bakker 2020-05-08 =
 1311  			!(ourport->cfg->clk_sel & (1 << cnt)))
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1312  			continue;
b497549a035c2a drivers/serial/samsung.c         Ben Dooks       2008-07-03 =
 1313  =

5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
@1314  		sprintf(clkname, "clk_uart_baud%d", cnt);
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1315  		clk =3D clk_get(ourport->port.dev, clkname);
7cd88831feb03c drivers/tty/serial/samsung.c     Kyoungil Kim    2012-05-20 =
 1316  		if (IS_ERR(clk))
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1317  			continue;
b497549a035c2a drivers/serial/samsung.c         Ben Dooks       2008-07-03 =
 1318  =

5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1319  		rate =3D clk_get_rate(clk);
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1320  		if (!rate)
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1321  			continue;
090f848da00008 drivers/serial/samsung.c         Ben Dooks       2008-12-12 =
 1322  =

090f848da00008 drivers/serial/samsung.c         Ben Dooks       2008-12-12 =
 1323  		if (ourport->info->has_divslot) {
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1324  			unsigned long div =3D rate / req_baud;
090f848da00008 drivers/serial/samsung.c         Ben Dooks       2008-12-12 =
 1325  =

090f848da00008 drivers/serial/samsung.c         Ben Dooks       2008-12-12 =
 1326  			/* The UDIVSLOT register on the newer UARTs allows us to
090f848da00008 drivers/serial/samsung.c         Ben Dooks       2008-12-12 =
 1327  			 * get a divisor adjustment of 1/16th on the baud clock.
090f848da00008 drivers/serial/samsung.c         Ben Dooks       2008-12-12 =
 1328  			 *
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1329  			 * We don't keep the UDIVSLOT value (the 16ths we
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1330  			 * calculated by not multiplying the baud by 16) as it
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1331  			 * is easy enough to recalculate.
090f848da00008 drivers/serial/samsung.c         Ben Dooks       2008-12-12 =
 1332  			 */
090f848da00008 drivers/serial/samsung.c         Ben Dooks       2008-12-12 =
 1333  =

5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1334  			quot =3D div / 16;
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1335  			baud =3D rate / div;
090f848da00008 drivers/serial/samsung.c         Ben Dooks       2008-12-12 =
 1336  		} else {
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1337  			quot =3D (rate + (8 * req_baud)) / (16 * req_baud);
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1338  			baud =3D rate / (quot * 16);
090f848da00008 drivers/serial/samsung.c         Ben Dooks       2008-12-12 =
 1339  		}
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1340  		quot--;
b497549a035c2a drivers/serial/samsung.c         Ben Dooks       2008-07-03 =
 1341  =

5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1342  		calc_deviation =3D req_baud - baud;
b497549a035c2a drivers/serial/samsung.c         Ben Dooks       2008-07-03 =
 1343  		if (calc_deviation < 0)
b497549a035c2a drivers/serial/samsung.c         Ben Dooks       2008-07-03 =
 1344  			calc_deviation =3D -calc_deviation;
b497549a035c2a drivers/serial/samsung.c         Ben Dooks       2008-07-03 =
 1345  =

b497549a035c2a drivers/serial/samsung.c         Ben Dooks       2008-07-03 =
 1346  		if (calc_deviation < deviation) {
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1347  			*best_clk =3D clk;
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1348  			best_quot =3D quot;
5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1349  			*clk_num =3D cnt;
b497549a035c2a drivers/serial/samsung.c         Ben Dooks       2008-07-03 =
 1350  			deviation =3D calc_deviation;
b497549a035c2a drivers/serial/samsung.c         Ben Dooks       2008-07-03 =
 1351  		}
b497549a035c2a drivers/serial/samsung.c         Ben Dooks       2008-07-03 =
 1352  	}
b497549a035c2a drivers/serial/samsung.c         Ben Dooks       2008-07-03 =
 1353  =

5f5a7a5578c588 drivers/tty/serial/samsung.c     Thomas Abraham  2011-10-24 =
 1354  	return best_quot;
b497549a035c2a drivers/serial/samsung.c         Ben Dooks       2008-07-03 =
 1355  }
b497549a035c2a drivers/serial/samsung.c         Ben Dooks       2008-07-03 =
 1356  =


:::::: The code@line 1314 was first introduced by commit
:::::: 5f5a7a5578c5885201cf9c85856f023fe8b81765 serial: samsung: switch to =
clkdev based clock lookup

:::::: TO: Thomas Abraham <thomas.abraham@linaro.org>
:::::: CC: Kukjin Kim <kgene.kim@samsung.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2952630742133704418==--

