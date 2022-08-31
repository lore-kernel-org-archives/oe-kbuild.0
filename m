Content-Type: multipart/mixed; boundary="===============5274561112376248030=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 5/6] rtc: isl12022: switch to using regmap API
Date: Thu, 01 Sep 2022 00:26:47 +0800
Message-ID: <202209010045.ydX5wKUS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5274561112376248030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/r=
tc/rtc-isl12022.c:119:22: warning: use of uninitialized value '<unknown>' [=
CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220830100152.698506-6-linux@rasmusvillemoes.dk>
References: <20220830100152.698506-6-linux@rasmusvillemoes.dk>
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
TO: Alessandro Zummo <a.zummo@towertech.it>
TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Rasmus Villemoes <linux@rasmusvillemoes.dk>
CC: linux-rtc(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Rasmus,

I love your patch! Perhaps something to improve:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on linus/master v6.0-rc3 next-20220831]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rasmus-Villemoes/rtc=
-isl12022-cleanups-and-hwmon-support/20220830-180614
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git =
rtc-next
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: arm-randconfig-c002-20220830 (https://download.01.org/0day-ci/archi=
ve/20220901/202209010045.ydX5wKUS-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7e7902b5b5d2b150860=
2203d0632a4f5390fcc35
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rasmus-Villemoes/rtc-isl12022-clea=
nups-and-hwmon-support/20220830-180614
        git checkout 7e7902b5b5d2b1508602203d0632a4f5390fcc35
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/rtc/rtc-isl12022.c: In function 'isl12022_rtc_set_time':
>> drivers/rtc/rtc-isl12022.c:119:22: warning: use of uninitialized value '=
<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     119 |                 bool change;
         |                      ^~~~~~
     'isl12022_rtc_set_time': events 1-3
       |
       |  118 |         if (!isl12022->write_enabled) {
       |      |            ^
       |      |            |
       |      |            (1) following 'false' branch...
       |  119 |                 bool change;
       |      |                      ~~~~~~
       |      |                      |
       |      |                      (2) ...to here
       |      |                      (3) use of uninitialized value '<unkno=
wn>' here
       |

vim +119 drivers/rtc/rtc-isl12022.c

d6c7428f9c2b1d Roman Fietze        2010-08-10  104  =

143d92bea3dcda Alexandre Belloni   2018-02-20  105  static int isl12022_rtc=
_set_time(struct device *dev, struct rtc_time *tm)
d6c7428f9c2b1d Roman Fietze        2010-08-10  106  {
e66895fce1795b Rasmus Villemoes    2022-08-30  107  	struct isl12022 *isl12=
022 =3D dev_get_drvdata(dev);
7e7902b5b5d2b1 Rasmus Villemoes    2022-08-30  108  	struct regmap *regmap =
=3D isl12022->regmap;
d6c7428f9c2b1d Roman Fietze        2010-08-10  109  	int ret;
d6c7428f9c2b1d Roman Fietze        2010-08-10  110  	uint8_t buf[ISL12022_R=
EG_DW + 1];
d6c7428f9c2b1d Roman Fietze        2010-08-10  111  =

e1ee69e8c1cc7f Rasmus Villemoes    2022-08-30  112  	dev_dbg(dev, "%s: secs=
=3D%d, mins=3D%d, hours=3D%d, "
d6c7428f9c2b1d Roman Fietze        2010-08-10  113  		"mday=3D%d, mon=3D%d,=
 year=3D%d, wday=3D%d\n",
d6c7428f9c2b1d Roman Fietze        2010-08-10  114  		__func__,
d6c7428f9c2b1d Roman Fietze        2010-08-10  115  		tm->tm_sec, tm->tm_mi=
n, tm->tm_hour,
d6c7428f9c2b1d Roman Fietze        2010-08-10  116  		tm->tm_mday, tm->tm_m=
on, tm->tm_year, tm->tm_wday);
d6c7428f9c2b1d Roman Fietze        2010-08-10  117  =

d6c7428f9c2b1d Roman Fietze        2010-08-10  118  	if (!isl12022->write_e=
nabled) {
7e7902b5b5d2b1 Rasmus Villemoes    2022-08-30 @119  		bool change;
d6c7428f9c2b1d Roman Fietze        2010-08-10  120  =

7e7902b5b5d2b1 Rasmus Villemoes    2022-08-30  121  		ret =3D regmap_update=
_bits_check(regmap, ISL12022_REG_INT,
7e7902b5b5d2b1 Rasmus Villemoes    2022-08-30  122  					       ISL12022_IN=
T_WRTC, ISL12022_INT_WRTC,
7e7902b5b5d2b1 Rasmus Villemoes    2022-08-30  123  					       &change);
d6c7428f9c2b1d Roman Fietze        2010-08-10  124  		if (ret)
d6c7428f9c2b1d Roman Fietze        2010-08-10  125  			return ret;
d6c7428f9c2b1d Roman Fietze        2010-08-10  126  =

7e7902b5b5d2b1 Rasmus Villemoes    2022-08-30  127  		if (change)
037a6cc3a5e084 Rasmus Villemoes    2022-08-30  128  			dev_info(dev, "init =
write enable\n");
d6c7428f9c2b1d Roman Fietze        2010-08-10  129  =

c1f5f0549d62c5 Gustavo A. R. Silva 2018-03-22  130  		isl12022->write_enabl=
ed =3D true;
d6c7428f9c2b1d Roman Fietze        2010-08-10  131  	}
d6c7428f9c2b1d Roman Fietze        2010-08-10  132  =

d6c7428f9c2b1d Roman Fietze        2010-08-10  133  	/* hours, minutes and =
seconds */
d6c7428f9c2b1d Roman Fietze        2010-08-10  134  	buf[ISL12022_REG_SC] =
=3D bin2bcd(tm->tm_sec);
d6c7428f9c2b1d Roman Fietze        2010-08-10  135  	buf[ISL12022_REG_MN] =
=3D bin2bcd(tm->tm_min);
6d23b2582fd0bc Roman Fietze        2010-08-10  136  	buf[ISL12022_REG_HR] =
=3D bin2bcd(tm->tm_hour) | ISL12022_HR_MIL;
d6c7428f9c2b1d Roman Fietze        2010-08-10  137  =

d6c7428f9c2b1d Roman Fietze        2010-08-10  138  	buf[ISL12022_REG_DT] =
=3D bin2bcd(tm->tm_mday);
d6c7428f9c2b1d Roman Fietze        2010-08-10  139  =

d6c7428f9c2b1d Roman Fietze        2010-08-10  140  	/* month, 1 - 12 */
d6c7428f9c2b1d Roman Fietze        2010-08-10  141  	buf[ISL12022_REG_MO] =
=3D bin2bcd(tm->tm_mon + 1);
d6c7428f9c2b1d Roman Fietze        2010-08-10  142  =

d6c7428f9c2b1d Roman Fietze        2010-08-10  143  	/* year and century */
d6c7428f9c2b1d Roman Fietze        2010-08-10  144  	buf[ISL12022_REG_YR] =
=3D bin2bcd(tm->tm_year % 100);
d6c7428f9c2b1d Roman Fietze        2010-08-10  145  =

d6c7428f9c2b1d Roman Fietze        2010-08-10  146  	buf[ISL12022_REG_DW] =
=3D tm->tm_wday & 0x07;
d6c7428f9c2b1d Roman Fietze        2010-08-10  147  =

7e7902b5b5d2b1 Rasmus Villemoes    2022-08-30  148  	return regmap_bulk_wri=
te(isl12022->regmap, ISL12022_REG_SC,
7e7902b5b5d2b1 Rasmus Villemoes    2022-08-30  149  				 buf, sizeof(buf));
d6c7428f9c2b1d Roman Fietze        2010-08-10  150  }
d6c7428f9c2b1d Roman Fietze        2010-08-10  151  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5274561112376248030==--

