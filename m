Content-Type: multipart/mixed; boundary="===============5722867163493055532=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:bp/bp/rc0+ 6/11] arch/x86/kernel/cpu/common.c:1418 cpu_parse_early_param() warn: potential spectre issue 'x86_cap_flags' [w] (local cap)
Date: Tue, 29 Mar 2022 22:53:41 +0800
Message-ID: <202203292229.b6WwiuSO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5722867163493055532==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: Borislav Petkov <bp@suse.de>
CC: Kees Cook <keescook@chromium.org>

tree:   https://github.com/ammarfaizi2/linux-block bp/bp/rc0+
head:   2d784fc7295963360594f3de64446aa32841c694
commit: c3b9dcd01973935375ca9d0c67044bea7333d4ef [6/11] x86/cpu: Allow feat=
ure bit names from /proc/cpuinfo in clearcpuid=3D
:::::: branch date: 4 hours ago
:::::: commit date: 5 hours ago
config: i386-randconfig-m021-20220328 (https://download.01.org/0day-ci/arch=
ive/20220329/202203292229.b6WwiuSO-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/x86/kernel/cpu/common.c:1418 cpu_parse_early_param() warn: potential s=
pectre issue 'x86_cap_flags' [w] (local cap)

vim +/x86_cap_flags +1418 arch/x86/kernel/cpu/common.c

1ef5423a55c2ac Mike Hommey     2020-09-22  1385  =

1ef5423a55c2ac Mike Hommey     2020-09-22  1386  	if (cmdline_find_option_b=
ool(boot_command_line, "noxsave"))
1ef5423a55c2ac Mike Hommey     2020-09-22  1387  		setup_clear_cpu_cap(X86_=
FEATURE_XSAVE);
1ef5423a55c2ac Mike Hommey     2020-09-22  1388  =

1ef5423a55c2ac Mike Hommey     2020-09-22  1389  	if (cmdline_find_option_b=
ool(boot_command_line, "noxsaveopt"))
1ef5423a55c2ac Mike Hommey     2020-09-22  1390  		setup_clear_cpu_cap(X86_=
FEATURE_XSAVEOPT);
1ef5423a55c2ac Mike Hommey     2020-09-22  1391  =

1ef5423a55c2ac Mike Hommey     2020-09-22  1392  	if (cmdline_find_option_b=
ool(boot_command_line, "noxsaves"))
1ef5423a55c2ac Mike Hommey     2020-09-22  1393  		setup_clear_cpu_cap(X86_=
FEATURE_XSAVES);
1ef5423a55c2ac Mike Hommey     2020-09-22  1394  =

1ef5423a55c2ac Mike Hommey     2020-09-22  1395  	arglen =3D cmdline_find_o=
ption(boot_command_line, "clearcpuid", arg, sizeof(arg));
1ef5423a55c2ac Mike Hommey     2020-09-22  1396  	if (arglen <=3D 0)
1ef5423a55c2ac Mike Hommey     2020-09-22  1397  		return;
1ef5423a55c2ac Mike Hommey     2020-09-22  1398  =

1ef5423a55c2ac Mike Hommey     2020-09-22  1399  	pr_info("Clearing CPUID b=
its:");
1ef5423a55c2ac Mike Hommey     2020-09-22  1400  =

c3b9dcd0197393 Borislav Petkov 2022-01-27  1401  	while (argptr) {
c3b9dcd0197393 Borislav Petkov 2022-01-27  1402  		bool found __maybe_unuse=
d =3D false;
c3b9dcd0197393 Borislav Petkov 2022-01-27  1403  		unsigned int bit;
c3b9dcd0197393 Borislav Petkov 2022-01-27  1404  =

c3b9dcd0197393 Borislav Petkov 2022-01-27  1405  		opt =3D strsep(&argptr, =
",");
c3b9dcd0197393 Borislav Petkov 2022-01-27  1406  =

c3b9dcd0197393 Borislav Petkov 2022-01-27  1407  		/*
c3b9dcd0197393 Borislav Petkov 2022-01-27  1408  		 * Handle naked numbers =
first for feature flags which don't
c3b9dcd0197393 Borislav Petkov 2022-01-27  1409  		 * have names.
c3b9dcd0197393 Borislav Petkov 2022-01-27  1410  		 */
c3b9dcd0197393 Borislav Petkov 2022-01-27  1411  		if (!kstrtouint(opt, 10,=
 &bit)) {
c3b9dcd0197393 Borislav Petkov 2022-01-27  1412  			if (bit < NCAPINTS * 32=
) {
1ef5423a55c2ac Mike Hommey     2020-09-22  1413  =

c3b9dcd0197393 Borislav Petkov 2022-01-27  1414  				/* empty-string, i.e.,=
 ""-defined feature flags */
c3b9dcd0197393 Borislav Petkov 2022-01-27  1415  				if (!x86_cap_flags[bit=
])
c3b9dcd0197393 Borislav Petkov 2022-01-27  1416  					pr_cont(" " X86_CAP_F=
MT_NUM, x86_cap_flag_num(bit));
c3b9dcd0197393 Borislav Petkov 2022-01-27  1417  				else
1ef5423a55c2ac Mike Hommey     2020-09-22 @1418  					pr_cont(" " X86_CAP_F=
MT, x86_cap_flag(bit));
c3b9dcd0197393 Borislav Petkov 2022-01-27  1419  =

c3b9dcd0197393 Borislav Petkov 2022-01-27  1420  				setup_clear_cpu_cap(bi=
t);
c3b9dcd0197393 Borislav Petkov 2022-01-27  1421  				taint++;
c3b9dcd0197393 Borislav Petkov 2022-01-27  1422  			}
c3b9dcd0197393 Borislav Petkov 2022-01-27  1423  			/*
c3b9dcd0197393 Borislav Petkov 2022-01-27  1424  			 * The assumption is th=
at there are no feature names with only
c3b9dcd0197393 Borislav Petkov 2022-01-27  1425  			 * numbers in the name =
thus go to the next argument.
c3b9dcd0197393 Borislav Petkov 2022-01-27  1426  			 */
c3b9dcd0197393 Borislav Petkov 2022-01-27  1427  			continue;
c3b9dcd0197393 Borislav Petkov 2022-01-27  1428  		}
c3b9dcd0197393 Borislav Petkov 2022-01-27  1429  =


:::::: The code@line 1418 was first introduced by commit
:::::: 1ef5423a55c2ac6f1361811efe75b6e46d1023ed x86/fpu: Handle FPU-related=
 and clearcpuid command line arguments earlier

:::::: TO: Mike Hommey <mh@glandium.org>
:::::: CC: Borislav Petkov <bp@suse.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5722867163493055532==--

