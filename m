Content-Type: multipart/mixed; boundary="===============3692434242768283197=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 12714/13542] drivers/rtc/rtc-zynqmp.c:238 xlnx_rtc_set_offset() error: uninitialized symbol 'fract_tick'.
Date: Fri, 29 Jul 2022 03:18:49 +0800
Message-ID: <202207290351.mp2A2229-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3692434242768283197==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Srinivas Neeli <srinivas.neeli@xilinx.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   7c5e07b73ff3011c9b82d4a3286a3362b951ad2b
commit: 07dcc6f9c76275d6679f28a69e042a2f9dc8f128 [12714/13542] rtc: zynqmp:=
 Add calibration set and get support
:::::: branch date: 8 hours ago
:::::: commit date: 2 days ago
config: mips-randconfig-m031-20220727 (https://download.01.org/0day-ci/arch=
ive/20220729/202207290351.mp2A2229-lkp(a)intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/rtc/rtc-zynqmp.c:238 xlnx_rtc_set_offset() error: uninitialized sym=
bol 'fract_tick'.

vim +/fract_tick +238 drivers/rtc/rtc-zynqmp.c

07dcc6f9c76275 Srinivas Neeli  2022-06-26  200  =

07dcc6f9c76275 Srinivas Neeli  2022-06-26  201  static int xlnx_rtc_set_off=
set(struct device *dev, long offset)
07dcc6f9c76275 Srinivas Neeli  2022-06-26  202  {
07dcc6f9c76275 Srinivas Neeli  2022-06-26  203  	struct xlnx_rtc_dev *xrtcd=
ev =3D dev_get_drvdata(dev);
07dcc6f9c76275 Srinivas Neeli  2022-06-26  204  	unsigned long long rtc_ppb=
 =3D RTC_PPB;
07dcc6f9c76275 Srinivas Neeli  2022-06-26  205  	unsigned int tick_mult =3D=
 do_div(rtc_ppb, xrtcdev->freq);
07dcc6f9c76275 Srinivas Neeli  2022-06-26  206  	unsigned char fract_tick;
07dcc6f9c76275 Srinivas Neeli  2022-06-26  207  	unsigned int calibval;
07dcc6f9c76275 Srinivas Neeli  2022-06-26  208  	short int  max_tick;
07dcc6f9c76275 Srinivas Neeli  2022-06-26  209  	int fract_offset;
07dcc6f9c76275 Srinivas Neeli  2022-06-26  210  =

07dcc6f9c76275 Srinivas Neeli  2022-06-26  211  	if (offset < RTC_MIN_OFFSE=
T || offset > RTC_MAX_OFFSET)
07dcc6f9c76275 Srinivas Neeli  2022-06-26  212  		return -ERANGE;
07dcc6f9c76275 Srinivas Neeli  2022-06-26  213  =

07dcc6f9c76275 Srinivas Neeli  2022-06-26  214  	/* Number ticks for given =
offset */
07dcc6f9c76275 Srinivas Neeli  2022-06-26  215  	max_tick =3D div_s64_rem(o=
ffset, tick_mult, &fract_offset);
07dcc6f9c76275 Srinivas Neeli  2022-06-26  216  =

07dcc6f9c76275 Srinivas Neeli  2022-06-26  217  	/* Number fractional ticks=
 for given offset */
07dcc6f9c76275 Srinivas Neeli  2022-06-26  218  	if (fract_offset) {
07dcc6f9c76275 Srinivas Neeli  2022-06-26  219  		if (fract_offset < 0) {
07dcc6f9c76275 Srinivas Neeli  2022-06-26  220  			fract_offset =3D fract_o=
ffset + tick_mult;
07dcc6f9c76275 Srinivas Neeli  2022-06-26  221  			max_tick--;
07dcc6f9c76275 Srinivas Neeli  2022-06-26  222  		}
07dcc6f9c76275 Srinivas Neeli  2022-06-26  223  		if (fract_offset > (tick_=
mult / RTC_FR_MAX_TICKS)) {
07dcc6f9c76275 Srinivas Neeli  2022-06-26  224  			for (fract_tick =3D 1; f=
ract_tick < 16; fract_tick++) {
07dcc6f9c76275 Srinivas Neeli  2022-06-26  225  				if (fract_offset <=3D
07dcc6f9c76275 Srinivas Neeli  2022-06-26  226  				    (fract_tick *
07dcc6f9c76275 Srinivas Neeli  2022-06-26  227  				     (tick_mult / RTC_F=
R_MAX_TICKS)))
07dcc6f9c76275 Srinivas Neeli  2022-06-26  228  					break;
07dcc6f9c76275 Srinivas Neeli  2022-06-26  229  			}
07dcc6f9c76275 Srinivas Neeli  2022-06-26  230  		}
07dcc6f9c76275 Srinivas Neeli  2022-06-26  231  	}
07dcc6f9c76275 Srinivas Neeli  2022-06-26  232  =

07dcc6f9c76275 Srinivas Neeli  2022-06-26  233  	/* Zynqmp RTC uses second =
and fractional tick
07dcc6f9c76275 Srinivas Neeli  2022-06-26  234  	 * counters for compensati=
on
11143c19eb57a8 Suneel Garapati 2015-08-19  235  	 */
07dcc6f9c76275 Srinivas Neeli  2022-06-26  236  	calibval =3D max_tick + RT=
C_CALIB_DEF;
07dcc6f9c76275 Srinivas Neeli  2022-06-26  237  =

07dcc6f9c76275 Srinivas Neeli  2022-06-26 @238  	if (fract_tick)
07dcc6f9c76275 Srinivas Neeli  2022-06-26  239  		calibval |=3D RTC_FR_EN;
07dcc6f9c76275 Srinivas Neeli  2022-06-26  240  =

07dcc6f9c76275 Srinivas Neeli  2022-06-26  241  	calibval |=3D (fract_tick =
<< RTC_FR_DATSHIFT);
07dcc6f9c76275 Srinivas Neeli  2022-06-26  242  =

07dcc6f9c76275 Srinivas Neeli  2022-06-26  243  	writel(calibval, (xrtcdev-=
>reg_base + RTC_CALIB_WR));
07dcc6f9c76275 Srinivas Neeli  2022-06-26  244  =

07dcc6f9c76275 Srinivas Neeli  2022-06-26  245  	return 0;
11143c19eb57a8 Suneel Garapati 2015-08-19  246  }
11143c19eb57a8 Suneel Garapati 2015-08-19  247  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3692434242768283197==--

