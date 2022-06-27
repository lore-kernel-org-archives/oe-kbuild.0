Content-Type: multipart/mixed; boundary="===============3754627716234016304=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH V8 3/3] rtc: zynqmp: Add calibration set and get support
Date: Mon, 27 Jun 2022 03:04:29 +0000
Message-ID: <202206260936.lhyU0jFD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3754627716234016304==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220613125836.523449-3-srinivas.neeli@xilinx.com>
References: <20220613125836.523449-3-srinivas.neeli@xilinx.com>
TO: Srinivas Neeli <srinivas.neeli@xilinx.com>

Hi Srinivas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on v5.19-rc3 next-20220624]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Neeli/dt-bi=
ndings-rtc-zynqmp-Add-clock-information/20220614-013701
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git =
rtc-next
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: arc-randconfig-m031-20220622
compiler: arceb-elf-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/rtc/rtc-zynqmp.c:238 xlnx_rtc_set_offset() error: uninitialized sym=
bol 'fract_tick'.

vim +/fract_tick +238 drivers/rtc/rtc-zynqmp.c

2781fd75583878 Srinivas Neeli  2022-06-13  200  =

2781fd75583878 Srinivas Neeli  2022-06-13  201  static int xlnx_rtc_set_off=
set(struct device *dev, long offset)
2781fd75583878 Srinivas Neeli  2022-06-13  202  {
2781fd75583878 Srinivas Neeli  2022-06-13  203  	struct xlnx_rtc_dev *xrtcd=
ev =3D dev_get_drvdata(dev);
2781fd75583878 Srinivas Neeli  2022-06-13  204  	unsigned long long rtc_ppb=
 =3D RTC_PPB;
2781fd75583878 Srinivas Neeli  2022-06-13  205  	unsigned int tick_mult =3D=
 do_div(rtc_ppb, xrtcdev->freq);
2781fd75583878 Srinivas Neeli  2022-06-13  206  	unsigned char fract_tick;
2781fd75583878 Srinivas Neeli  2022-06-13  207  	unsigned int calibval;
2781fd75583878 Srinivas Neeli  2022-06-13  208  	short int  max_tick;
2781fd75583878 Srinivas Neeli  2022-06-13  209  	int fract_offset;
2781fd75583878 Srinivas Neeli  2022-06-13  210  =

2781fd75583878 Srinivas Neeli  2022-06-13  211  	if (offset < RTC_MIN_OFFSE=
T || offset > RTC_MAX_OFFSET)
2781fd75583878 Srinivas Neeli  2022-06-13  212  		return -ERANGE;
2781fd75583878 Srinivas Neeli  2022-06-13  213  =

2781fd75583878 Srinivas Neeli  2022-06-13  214  	/* Number ticks for given =
offset */
2781fd75583878 Srinivas Neeli  2022-06-13  215  	max_tick =3D div_s64_rem(o=
ffset, tick_mult, &fract_offset);
2781fd75583878 Srinivas Neeli  2022-06-13  216  =

2781fd75583878 Srinivas Neeli  2022-06-13  217  	/* Number fractional ticks=
 for given offset */
2781fd75583878 Srinivas Neeli  2022-06-13  218  	if (fract_offset) {
2781fd75583878 Srinivas Neeli  2022-06-13  219  		if (fract_offset < 0) {
2781fd75583878 Srinivas Neeli  2022-06-13  220  			fract_offset =3D fract_o=
ffset + tick_mult;
2781fd75583878 Srinivas Neeli  2022-06-13  221  			max_tick--;
2781fd75583878 Srinivas Neeli  2022-06-13  222  		}
2781fd75583878 Srinivas Neeli  2022-06-13  223  		if (fract_offset > (tick_=
mult / RTC_FR_MAX_TICKS)) {
2781fd75583878 Srinivas Neeli  2022-06-13  224  			for (fract_tick =3D 1; f=
ract_tick < 16; fract_tick++) {
2781fd75583878 Srinivas Neeli  2022-06-13  225  				if (fract_offset <=3D
2781fd75583878 Srinivas Neeli  2022-06-13  226  				    (fract_tick *
2781fd75583878 Srinivas Neeli  2022-06-13  227  				     (tick_mult / RTC_F=
R_MAX_TICKS)))
2781fd75583878 Srinivas Neeli  2022-06-13  228  					break;
2781fd75583878 Srinivas Neeli  2022-06-13  229  			}
2781fd75583878 Srinivas Neeli  2022-06-13  230  		}
2781fd75583878 Srinivas Neeli  2022-06-13  231  	}
2781fd75583878 Srinivas Neeli  2022-06-13  232  =

2781fd75583878 Srinivas Neeli  2022-06-13  233  	/* Zynqmp RTC uses second =
and fractional tick
2781fd75583878 Srinivas Neeli  2022-06-13  234  	 * counters for compensati=
on
11143c19eb57a8 Suneel Garapati 2015-08-19  235  	 */
2781fd75583878 Srinivas Neeli  2022-06-13  236  	calibval =3D max_tick + RT=
C_CALIB_DEF;
2781fd75583878 Srinivas Neeli  2022-06-13  237  =

2781fd75583878 Srinivas Neeli  2022-06-13 @238  	if (fract_tick)
2781fd75583878 Srinivas Neeli  2022-06-13  239  		calibval |=3D RTC_FR_EN;
2781fd75583878 Srinivas Neeli  2022-06-13  240  =

2781fd75583878 Srinivas Neeli  2022-06-13  241  	calibval |=3D (fract_tick =
<< RTC_FR_DATSHIFT);
2781fd75583878 Srinivas Neeli  2022-06-13  242  =

2781fd75583878 Srinivas Neeli  2022-06-13  243  	writel(calibval, (xrtcdev-=
>reg_base + RTC_CALIB_WR));
2781fd75583878 Srinivas Neeli  2022-06-13  244  =

2781fd75583878 Srinivas Neeli  2022-06-13  245  	return 0;
11143c19eb57a8 Suneel Garapati 2015-08-19  246  }
11143c19eb57a8 Suneel Garapati 2015-08-19  247  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3754627716234016304==--

