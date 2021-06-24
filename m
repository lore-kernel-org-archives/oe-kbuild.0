Content-Type: multipart/mixed; boundary="===============6830711749104379381=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-linux-intel-lts:5.4/yocto 1/2] arch/x86/kernel/tsc.c:1267:8: warning: Uninitialized variable: rem [uninitvar]
Date: Fri, 25 Jun 2021 04:00:27 +0800
Message-ID: <202106250415.dDzF7NLf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6830711749104379381==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
CC: "Qin, Chao" <chao.qin@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 5.4/yocto
head:   53cbd8c20c3f8e8afcc3482e6dd4c9400fc77dcd
commit: 056abbf6314ea7d95396062560c605f172e7535e [1/2] ptp: PSE TGPIO IOCTL=
s fix
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/x86/kernel/tsc.c:1267:8: warning: Uninitialized variable: rem [unin=
itvar]
    tmp =3D rem * art_to_tsc_denominator;
          ^

vim +1267 arch/x86/kernel/tsc.c

8fbbc4b45ce3e4 Alok Kataria        2008-07-01  1244  =

056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1245  /**
056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1246   * convert_tsc_to_art(=
) - Returns ART value associated with system counter
056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1247   *
056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1248   * Converts input TSC =
to the corresponding ART value using conversion
056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1249   * factors discovered =
by detect_art()
056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1250   *
056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1251   * Return:
056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1252   * u64 ART value
056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1253   */
056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1254  int convert_tsc_to_art=
(const struct system_counterval_t *system_counter,
056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1255  		       u64 *art)
056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1256  {
056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1257  	u64 tmp, res, rem;
056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1258  =

056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1259  	if (system_counter->c=
s !=3D art_related_clocksource)
056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1260  		return -EINVAL;
056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1261  =

056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1262  	res =3D system_counte=
r->cycles - art_to_tsc_offset;
056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1263  	if (art_to_tsc_numera=
tor)
056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1264  		rem =3D do_div(res, =
art_to_tsc_numerator);
056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1265  =

056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1266  	*art =3D res * art_to=
_tsc_denominator;
056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21 @1267  	tmp =3D rem * art_to_=
tsc_denominator;
056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1268  =

056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1269  	if (art_to_tsc_numera=
tor)
056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1270  		do_div(tmp, art_to_t=
sc_numerator);
056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1271  	*art +=3D tmp;
056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1272  =

056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1273  	return 0;
056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1274  }
056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1275  EXPORT_SYMBOL(convert_=
tsc_to_art);
056abbf6314ea7 D, Lakshmi Sowjanya 2021-06-21  1276  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6830711749104379381==--

