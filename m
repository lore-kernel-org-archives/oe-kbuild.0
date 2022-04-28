Content-Type: multipart/mixed; boundary="===============6414829826841249388=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v6 4/4] thermal: k3_j72xx_bandgap: Add the bandgap driver support
Date: Thu, 28 Apr 2022 23:34:10 +0800
Message-ID: <202204282346.lOm4TFZt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6414829826841249388==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220427064635.24898-5-j-keerthy@ti.com>
References: <20220427064635.24898-5-j-keerthy@ti.com>
TO: Keerthy <j-keerthy@ti.com>
TO: robh+dt(a)kernel.org
TO: daniel.lezcano(a)linaro.org
TO: rui.zhang(a)intel.com
TO: amitk(a)kernel.org
TO: kristo(a)kernel.org
TO: vigneshr(a)ti.com
TO: krzysztof.kozlowski(a)linaro.org
CC: j-keerthy(a)ti.com
CC: linux-pm(a)vger.kernel.org
CC: devicetree(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Keerthy,

I love your patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on rafael-pm/thermal v5.18-rc4 next-20220428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Keerthy/thermal-k3_j=
72xx_bandgap-Add-the-bandgap-driver-support/20220427-144949
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
compiler: xtensa-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout bb7f95a68cbaa1b42612b447a058a53a788ecb20
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/thermal/k3_j72xx_bandgap.c:83:12: warning: Parameter 'ref_table'=
 can be declared with const [constParameter]
         int *ref_table)
              ^

vim +/ref_table +83 drivers/thermal/k3_j72xx_bandgap.c

bb7f95a68cbaa1b Keerthy 2022-04-27   81  =

bb7f95a68cbaa1b Keerthy 2022-04-27   82  static void create_table_segments(=
struct err_values *err_vals, int seg,
bb7f95a68cbaa1b Keerthy 2022-04-27  @83  				  int *ref_table)
bb7f95a68cbaa1b Keerthy 2022-04-27   84  {
bb7f95a68cbaa1b Keerthy 2022-04-27   85  	int m =3D 0, c, num, den, i, err,=
 idx1, idx2, err1, err2, ref1, ref2;
bb7f95a68cbaa1b Keerthy 2022-04-27   86  =

bb7f95a68cbaa1b Keerthy 2022-04-27   87  	if (seg =3D=3D 0)
bb7f95a68cbaa1b Keerthy 2022-04-27   88  		idx1 =3D 0;
bb7f95a68cbaa1b Keerthy 2022-04-27   89  	else
bb7f95a68cbaa1b Keerthy 2022-04-27   90  		idx1 =3D err_vals->refs[seg];
bb7f95a68cbaa1b Keerthy 2022-04-27   91  =

bb7f95a68cbaa1b Keerthy 2022-04-27   92  	idx2 =3D err_vals->refs[seg + 1];
bb7f95a68cbaa1b Keerthy 2022-04-27   93  	err1 =3D err_vals->errs[seg];
bb7f95a68cbaa1b Keerthy 2022-04-27   94  	err2 =3D err_vals->errs[seg + 1];
bb7f95a68cbaa1b Keerthy 2022-04-27   95  	ref1 =3D err_vals->refs[seg];
bb7f95a68cbaa1b Keerthy 2022-04-27   96  	ref2 =3D err_vals->refs[seg + 1];
bb7f95a68cbaa1b Keerthy 2022-04-27   97  =

bb7f95a68cbaa1b Keerthy 2022-04-27   98  	/*
bb7f95a68cbaa1b Keerthy 2022-04-27   99  	 * Calculate the slope with adc v=
alues read from the register
bb7f95a68cbaa1b Keerthy 2022-04-27  100  	 * as the y-axis param and err in=
 adc value as x-axis param
bb7f95a68cbaa1b Keerthy 2022-04-27  101  	 */
bb7f95a68cbaa1b Keerthy 2022-04-27  102  	num =3D ref2 - ref1;
bb7f95a68cbaa1b Keerthy 2022-04-27  103  	den =3D err2 - err1;
bb7f95a68cbaa1b Keerthy 2022-04-27  104  	if (den)
bb7f95a68cbaa1b Keerthy 2022-04-27  105  		m =3D num / den;
bb7f95a68cbaa1b Keerthy 2022-04-27  106  	c =3D ref2 - m * err2;
bb7f95a68cbaa1b Keerthy 2022-04-27  107  =

bb7f95a68cbaa1b Keerthy 2022-04-27  108  	/*
bb7f95a68cbaa1b Keerthy 2022-04-27  109  	 * Take care of divide by zero er=
ror if error values are same
bb7f95a68cbaa1b Keerthy 2022-04-27  110  	 * Or when the slope is 0
bb7f95a68cbaa1b Keerthy 2022-04-27  111  	 */
bb7f95a68cbaa1b Keerthy 2022-04-27  112  	if (den !=3D 0 && m !=3D 0) {
bb7f95a68cbaa1b Keerthy 2022-04-27  113  		for (i =3D idx1; i <=3D idx2; i+=
+) {
bb7f95a68cbaa1b Keerthy 2022-04-27  114  			err =3D (i - c) / m;
bb7f95a68cbaa1b Keerthy 2022-04-27  115  			if (((i + err) < 0) || ((i + er=
r) >=3D TABLE_SIZE))
bb7f95a68cbaa1b Keerthy 2022-04-27  116  				continue;
bb7f95a68cbaa1b Keerthy 2022-04-27  117  			derived_table[i] =3D ref_table[=
i + err];
bb7f95a68cbaa1b Keerthy 2022-04-27  118  		}
bb7f95a68cbaa1b Keerthy 2022-04-27  119  	} else { /* Constant error take c=
are of divide by zero */
bb7f95a68cbaa1b Keerthy 2022-04-27  120  		for (i =3D idx1; i <=3D idx2; i+=
+) {
bb7f95a68cbaa1b Keerthy 2022-04-27  121  			if (((i + err1) < 0) || ((i + e=
rr1) >=3D TABLE_SIZE))
bb7f95a68cbaa1b Keerthy 2022-04-27  122  				continue;
bb7f95a68cbaa1b Keerthy 2022-04-27  123  			derived_table[i] =3D ref_table[=
i + err1];
bb7f95a68cbaa1b Keerthy 2022-04-27  124  		}
bb7f95a68cbaa1b Keerthy 2022-04-27  125  	}
bb7f95a68cbaa1b Keerthy 2022-04-27  126  }
bb7f95a68cbaa1b Keerthy 2022-04-27  127  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6414829826841249388==--

