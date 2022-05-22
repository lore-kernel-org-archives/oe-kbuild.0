Content-Type: multipart/mixed; boundary="===============0344964358046511966=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 12704/13468] drivers/thermal/k3_j72xx_bandgap.c:83:12: warning: Parameter 'ref_table' can be declared with const [constParameter]
Date: Sun, 22 May 2022 18:07:59 +0800
Message-ID: <202205221841.meBBEZ9c-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0344964358046511966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Keerthy <j-keerthy@ti.com>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   18ecd30af1a8402c162cca1bd58771c0e5be7815
commit: ffcb2fc86eb7ebc9f5524525fb57e1cccfbd1fc0 [12704/13468] thermal: k3_=
j72xx_bandgap: Add the bandgap driver support
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
compiler: m68k-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout ffcb2fc86eb7ebc9f5524525fb57e1cccfbd1fc0
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/thermal/k3_j72xx_bandgap.c:83:12: warning: Parameter 'ref_table'=
 can be declared with const [constParameter]
         int *ref_table)
              ^

vim +/ref_table +83 drivers/thermal/k3_j72xx_bandgap.c

ffcb2fc86eb7eb Keerthy 2022-05-17   81  =

ffcb2fc86eb7eb Keerthy 2022-05-17   82  static void create_table_segments(s=
truct err_values *err_vals, int seg,
ffcb2fc86eb7eb Keerthy 2022-05-17  @83  				  int *ref_table)
ffcb2fc86eb7eb Keerthy 2022-05-17   84  {
ffcb2fc86eb7eb Keerthy 2022-05-17   85  	int m =3D 0, c, num, den, i, err, =
idx1, idx2, err1, err2, ref1, ref2;
ffcb2fc86eb7eb Keerthy 2022-05-17   86  =

ffcb2fc86eb7eb Keerthy 2022-05-17   87  	if (seg =3D=3D 0)
ffcb2fc86eb7eb Keerthy 2022-05-17   88  		idx1 =3D 0;
ffcb2fc86eb7eb Keerthy 2022-05-17   89  	else
ffcb2fc86eb7eb Keerthy 2022-05-17   90  		idx1 =3D err_vals->refs[seg];
ffcb2fc86eb7eb Keerthy 2022-05-17   91  =

ffcb2fc86eb7eb Keerthy 2022-05-17   92  	idx2 =3D err_vals->refs[seg + 1];
ffcb2fc86eb7eb Keerthy 2022-05-17   93  	err1 =3D err_vals->errs[seg];
ffcb2fc86eb7eb Keerthy 2022-05-17   94  	err2 =3D err_vals->errs[seg + 1];
ffcb2fc86eb7eb Keerthy 2022-05-17   95  	ref1 =3D err_vals->refs[seg];
ffcb2fc86eb7eb Keerthy 2022-05-17   96  	ref2 =3D err_vals->refs[seg + 1];
ffcb2fc86eb7eb Keerthy 2022-05-17   97  =

ffcb2fc86eb7eb Keerthy 2022-05-17   98  	/*
ffcb2fc86eb7eb Keerthy 2022-05-17   99  	 * Calculate the slope with adc va=
lues read from the register
ffcb2fc86eb7eb Keerthy 2022-05-17  100  	 * as the y-axis param and err in =
adc value as x-axis param
ffcb2fc86eb7eb Keerthy 2022-05-17  101  	 */
ffcb2fc86eb7eb Keerthy 2022-05-17  102  	num =3D ref2 - ref1;
ffcb2fc86eb7eb Keerthy 2022-05-17  103  	den =3D err2 - err1;
ffcb2fc86eb7eb Keerthy 2022-05-17  104  	if (den)
ffcb2fc86eb7eb Keerthy 2022-05-17  105  		m =3D num / den;
ffcb2fc86eb7eb Keerthy 2022-05-17  106  	c =3D ref2 - m * err2;
ffcb2fc86eb7eb Keerthy 2022-05-17  107  =

ffcb2fc86eb7eb Keerthy 2022-05-17  108  	/*
ffcb2fc86eb7eb Keerthy 2022-05-17  109  	 * Take care of divide by zero err=
or if error values are same
ffcb2fc86eb7eb Keerthy 2022-05-17  110  	 * Or when the slope is 0
ffcb2fc86eb7eb Keerthy 2022-05-17  111  	 */
ffcb2fc86eb7eb Keerthy 2022-05-17  112  	if (den !=3D 0 && m !=3D 0) {
ffcb2fc86eb7eb Keerthy 2022-05-17  113  		for (i =3D idx1; i <=3D idx2; i++=
) {
ffcb2fc86eb7eb Keerthy 2022-05-17  114  			err =3D (i - c) / m;
ffcb2fc86eb7eb Keerthy 2022-05-17  115  			if (((i + err) < 0) || ((i + err=
) >=3D TABLE_SIZE))
ffcb2fc86eb7eb Keerthy 2022-05-17  116  				continue;
ffcb2fc86eb7eb Keerthy 2022-05-17  117  			derived_table[i] =3D ref_table[i=
 + err];
ffcb2fc86eb7eb Keerthy 2022-05-17  118  		}
ffcb2fc86eb7eb Keerthy 2022-05-17  119  	} else { /* Constant error take ca=
re of divide by zero */
ffcb2fc86eb7eb Keerthy 2022-05-17  120  		for (i =3D idx1; i <=3D idx2; i++=
) {
ffcb2fc86eb7eb Keerthy 2022-05-17  121  			if (((i + err1) < 0) || ((i + er=
r1) >=3D TABLE_SIZE))
ffcb2fc86eb7eb Keerthy 2022-05-17  122  				continue;
ffcb2fc86eb7eb Keerthy 2022-05-17  123  			derived_table[i] =3D ref_table[i=
 + err1];
ffcb2fc86eb7eb Keerthy 2022-05-17  124  		}
ffcb2fc86eb7eb Keerthy 2022-05-17  125  	}
ffcb2fc86eb7eb Keerthy 2022-05-17  126  }
ffcb2fc86eb7eb Keerthy 2022-05-17  127  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0344964358046511966==--

