Content-Type: multipart/mixed; boundary="===============0135497802840661007=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 8395/8513] arch/x86/kernel/cpu/rdrand.c:36 x86_init_rdrand() error: uninitialized symbol 'prev'.
Date: Fri, 08 Jul 2022 04:48:50 +0800
Message-ID: <202207080455.fbxFQpiq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0135497802840661007==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   75d7bf5eae277f32dd952276aa41ae7915dba1b2
commit: 2d29184c1c10466b4c15e99d4776e99c06d930e4 [8395/8513] random: remove=
 "nordrand" flag in favor of "random.trust_cpu"
:::::: branch date: 11 hours ago
:::::: commit date: 20 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20708/202207080455.fbxFQpiq-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
arch/x86/kernel/cpu/rdrand.c:36 x86_init_rdrand() error: uninitialized symb=
ol 'prev'.

Old smatch warnings:
arch/x86/kernel/cpu/rdrand.c:49 x86_init_rdrand() error: uninitialized symb=
ol 'prev'.

vim +/prev +36 arch/x86/kernel/cpu/rdrand.c

49d859d78c5aeb9 H. Peter Anvin     2011-07-31  13  =

49d859d78c5aeb9 H. Peter Anvin     2011-07-31  14  /*
0007bccc3cfd1e6 Len Brown          2015-08-16  15   * RDRAND has Built-In-S=
elf-Test (BIST) that runs on every invocation.
2d29184c1c10466 Jason A. Donenfeld 2022-07-05  16   * Run the instruction a=
 few times as a sanity check. Also make sure
2d29184c1c10466 Jason A. Donenfeld 2022-07-05  17   * it's not outputting t=
he same value over and over, which has happened
2d29184c1c10466 Jason A. Donenfeld 2022-07-05  18   * as a result of past C=
PU bugs.
2d29184c1c10466 Jason A. Donenfeld 2022-07-05  19   *
2d29184c1c10466 Jason A. Donenfeld 2022-07-05  20   * If it fails, it is si=
mple to disable RDRAND and RDSEED here.
49d859d78c5aeb9 H. Peter Anvin     2011-07-31  21   */
49d859d78c5aeb9 H. Peter Anvin     2011-07-31  22  =

148f9bb87745ed4 Paul Gortmaker     2013-06-18  23  void x86_init_rdrand(str=
uct cpuinfo_x86 *c)
49d859d78c5aeb9 H. Peter Anvin     2011-07-31  24  {
2d29184c1c10466 Jason A. Donenfeld 2022-07-05  25  	enum { SAMPLES =3D 8, M=
IN_CHANGE =3D 5 };
2d29184c1c10466 Jason A. Donenfeld 2022-07-05  26  	unsigned long sample, p=
rev;
2d29184c1c10466 Jason A. Donenfeld 2022-07-05  27  	bool failure =3D false;
2d29184c1c10466 Jason A. Donenfeld 2022-07-05  28  	size_t i, changed;
2d29184c1c10466 Jason A. Donenfeld 2022-07-05  29  =

2d29184c1c10466 Jason A. Donenfeld 2022-07-05  30  	if (cpu_has(c, X86_FEAT=
URE_RDRAND)) {
2d29184c1c10466 Jason A. Donenfeld 2022-07-05  31  		for (changed =3D 0, i =
=3D 0; i < SAMPLES; ++i) {
2d29184c1c10466 Jason A. Donenfeld 2022-07-05  32  			if (!rdrand_long(&sam=
ple)) {
2d29184c1c10466 Jason A. Donenfeld 2022-07-05  33  				failure =3D true;
2d29184c1c10466 Jason A. Donenfeld 2022-07-05  34  				break;
0007bccc3cfd1e6 Len Brown          2015-08-16  35  			}
2d29184c1c10466 Jason A. Donenfeld 2022-07-05 @36  			changed +=3D i && sam=
ple !=3D prev;

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0135497802840661007==--

