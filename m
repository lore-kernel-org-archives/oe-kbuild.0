Content-Type: multipart/mixed; boundary="===============6283968391534722665=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 4/5] thunderbolt: Add CL1 support for USB4 and Titan Ridge routers
Date: Mon, 02 May 2022 07:50:52 +0800
Message-ID: <202205020757.wt9r1bvE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6283968391534722665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220501203321.19021-5-gil.fine@intel.com>
References: <20220501203321.19021-5-gil.fine@intel.com>
TO: Gil Fine <gil.fine@intel.com>
TO: andreas.noever(a)gmail.com
TO: michael.jamet(a)intel.com
TO: mika.westerberg(a)linux.intel.com
TO: YehezkelShB(a)gmail.com
CC: gil.fine(a)intel.com
CC: linux-usb(a)vger.kernel.org
CC: lukas(a)wunner.de

Hi Gil,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.18-rc5 next-20220429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Gil-Fine/thunderbolt=
-CL1-support-for-USB4-and-Titan-Ridge/20220502-042620
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
b2da7df52e16110c8d8dda0602db81c15711e7ff
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
compiler: sparc64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout f775f468178fe45bda2e74cc13c066679de592a8
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/thunderbolt/tmu.c:17:6: warning: Variable 'freq_meas_wind' can b=
e declared with const [constVariable]
    u32 freq_meas_wind[2] =3D { 30, 800 };
        ^
>> drivers/thunderbolt/tmu.c:18:6: warning: Variable 'avg_const' can be dec=
lared with const [constVariable]
    u32 avg_const[2] =3D { 4, 8 };
        ^

vim +/freq_meas_wind +17 drivers/thunderbolt/tmu.c

cf29b9afb12149 Rajmohan Mani 2019-12-17  13  =

f775f468178fe4 Gil Fine      2022-05-01  14  static int tb_switch_set_tmu_m=
ode_params(struct tb_switch *sw,
f775f468178fe4 Gil Fine      2022-05-01  15  					 enum tb_switch_tmu_rate =
rate)
f775f468178fe4 Gil Fine      2022-05-01  16  {
f775f468178fe4 Gil Fine      2022-05-01 @17  	u32 freq_meas_wind[2] =3D { 3=
0, 800 };
f775f468178fe4 Gil Fine      2022-05-01 @18  	u32 avg_const[2] =3D { 4, 8 };
f775f468178fe4 Gil Fine      2022-05-01  19  	u32 freq, avg, val;
f775f468178fe4 Gil Fine      2022-05-01  20  	int ret;
f775f468178fe4 Gil Fine      2022-05-01  21  =

f775f468178fe4 Gil Fine      2022-05-01  22  	if (rate =3D=3D TB_SWITCH_TMU=
_RATE_NORMAL) {
f775f468178fe4 Gil Fine      2022-05-01  23  		freq =3D freq_meas_wind[0];
f775f468178fe4 Gil Fine      2022-05-01  24  		avg =3D avg_const[0];
f775f468178fe4 Gil Fine      2022-05-01  25  	} else if (rate =3D=3D TB_SWI=
TCH_TMU_RATE_HIFI) {
f775f468178fe4 Gil Fine      2022-05-01  26  		freq =3D freq_meas_wind[1];
f775f468178fe4 Gil Fine      2022-05-01  27  		avg =3D avg_const[1];
f775f468178fe4 Gil Fine      2022-05-01  28  	} else {
f775f468178fe4 Gil Fine      2022-05-01  29  		return 0;
f775f468178fe4 Gil Fine      2022-05-01  30  	}
f775f468178fe4 Gil Fine      2022-05-01  31  =

f775f468178fe4 Gil Fine      2022-05-01  32  	ret =3D tb_sw_read(sw, &val, =
TB_CFG_SWITCH,
f775f468178fe4 Gil Fine      2022-05-01  33  			 sw->tmu.cap + TMU_RTR_CS_0=
, 1);
f775f468178fe4 Gil Fine      2022-05-01  34  	if (ret)
f775f468178fe4 Gil Fine      2022-05-01  35  		return ret;
f775f468178fe4 Gil Fine      2022-05-01  36  =

f775f468178fe4 Gil Fine      2022-05-01  37  	val &=3D ~TMU_RTR_CS_0_FREQ_W=
IND_MASK;
f775f468178fe4 Gil Fine      2022-05-01  38  	val |=3D freq << TMU_RTR_CS_0=
_FREQ_WIND_SHIFT;
f775f468178fe4 Gil Fine      2022-05-01  39  =

f775f468178fe4 Gil Fine      2022-05-01  40  	ret =3D tb_sw_write(sw, &val,=
 TB_CFG_SWITCH,
f775f468178fe4 Gil Fine      2022-05-01  41  			  sw->tmu.cap + TMU_RTR_CS_=
0, 1);
f775f468178fe4 Gil Fine      2022-05-01  42  	if (ret)
f775f468178fe4 Gil Fine      2022-05-01  43  		return ret;
f775f468178fe4 Gil Fine      2022-05-01  44  =

f775f468178fe4 Gil Fine      2022-05-01  45  	ret =3D tb_sw_read(sw, &val, =
TB_CFG_SWITCH,
f775f468178fe4 Gil Fine      2022-05-01  46  			 sw->tmu.cap + TMU_RTR_CS_1=
5, 1);
f775f468178fe4 Gil Fine      2022-05-01  47  	if (ret)
f775f468178fe4 Gil Fine      2022-05-01  48  		return ret;
f775f468178fe4 Gil Fine      2022-05-01  49  =

f775f468178fe4 Gil Fine      2022-05-01  50  	val &=3D ~TMU_RTR_CS_15_AVG_M=
ASK << TMU_RTR_CS_15_FREQ_AVG_SHIFT &
f775f468178fe4 Gil Fine      2022-05-01  51  		~TMU_RTR_CS_15_AVG_MASK << T=
MU_RTR_CS_15_DELAY_AVG_SHIFT &
f775f468178fe4 Gil Fine      2022-05-01  52  		~TMU_RTR_CS_15_AVG_MASK << T=
MU_RTR_CS_15_OFFSET_AVG_SHIFT &
f775f468178fe4 Gil Fine      2022-05-01  53  		~TMU_RTR_CS_15_AVG_MASK << T=
MU_RTR_CS_15_ERROR_AVG_SHIFT;
f775f468178fe4 Gil Fine      2022-05-01  54  	val |=3D avg << TMU_RTR_CS_15=
_FREQ_AVG_SHIFT |
f775f468178fe4 Gil Fine      2022-05-01  55  		avg << TMU_RTR_CS_15_DELAY_A=
VG_SHIFT |
f775f468178fe4 Gil Fine      2022-05-01  56  		avg << TMU_RTR_CS_15_OFFSET_=
AVG_SHIFT |
f775f468178fe4 Gil Fine      2022-05-01  57  		avg << TMU_RTR_CS_15_ERROR_A=
VG_SHIFT;
f775f468178fe4 Gil Fine      2022-05-01  58  =

f775f468178fe4 Gil Fine      2022-05-01  59  	return tb_sw_write(sw, &val, =
TB_CFG_SWITCH,
f775f468178fe4 Gil Fine      2022-05-01  60  			   sw->tmu.cap + TMU_RTR_CS=
_15, 1);
f775f468178fe4 Gil Fine      2022-05-01  61  }
f775f468178fe4 Gil Fine      2022-05-01  62  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6283968391534722665==--

