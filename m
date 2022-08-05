Content-Type: multipart/mixed; boundary="===============3535783544716445827=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kernel/cpu/rdrand.c:38 x86_init_rdrand() error: uninitialized symbol 'prev'.
Date: Fri, 05 Aug 2022 09:12:05 +0800
Message-ID: <202208050909.B5IoJBIV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3535783544716445827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c040862bfbd9c5f3cb64e1df1c623e20e38fe656
commit: 049f9ae93d033be6758ad865a9b89650f9f075ec x86/rdrand: Remove "nordra=
nd" flag in favor of "random.trust_cpu"
date:   3 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
805/202208050909.B5IoJBIV-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/x86/kernel/cpu/rdrand.c:38 x86_init_rdrand() error: uninitialized symb=
ol 'prev'.

vim +/prev +38 arch/x86/kernel/cpu/rdrand.c

49d859d78c5aeb9 H. Peter Anvin     2011-07-31  13  =

49d859d78c5aeb9 H. Peter Anvin     2011-07-31  14  /*
0007bccc3cfd1e6 Len Brown          2015-08-16  15   * RDRAND has Built-In-S=
elf-Test (BIST) that runs on every invocation.
049f9ae93d033be Jason A. Donenfeld 2022-07-09  16   * Run the instruction a=
 few times as a sanity check. Also make sure
049f9ae93d033be Jason A. Donenfeld 2022-07-09  17   * it's not outputting t=
he same value over and over, which has happened
049f9ae93d033be Jason A. Donenfeld 2022-07-09  18   * as a result of past C=
PU bugs.
049f9ae93d033be Jason A. Donenfeld 2022-07-09  19   *
049f9ae93d033be Jason A. Donenfeld 2022-07-09  20   * If it fails, it is si=
mple to disable RDRAND and RDSEED here.
49d859d78c5aeb9 H. Peter Anvin     2011-07-31  21   */
49d859d78c5aeb9 H. Peter Anvin     2011-07-31  22  =

148f9bb87745ed4 Paul Gortmaker     2013-06-18  23  void x86_init_rdrand(str=
uct cpuinfo_x86 *c)
49d859d78c5aeb9 H. Peter Anvin     2011-07-31  24  {
049f9ae93d033be Jason A. Donenfeld 2022-07-09  25  	enum { SAMPLES =3D 8, M=
IN_CHANGE =3D 5 };
049f9ae93d033be Jason A. Donenfeld 2022-07-09  26  	unsigned long sample, p=
rev;
049f9ae93d033be Jason A. Donenfeld 2022-07-09  27  	bool failure =3D false;
049f9ae93d033be Jason A. Donenfeld 2022-07-09  28  	size_t i, changed;
49d859d78c5aeb9 H. Peter Anvin     2011-07-31  29  =

49d859d78c5aeb9 H. Peter Anvin     2011-07-31  30  	if (!cpu_has(c, X86_FEA=
TURE_RDRAND))
0007bccc3cfd1e6 Len Brown          2015-08-16  31  		return;
49d859d78c5aeb9 H. Peter Anvin     2011-07-31  32  =

049f9ae93d033be Jason A. Donenfeld 2022-07-09  33  	for (changed =3D 0, i =
=3D 0; i < SAMPLES; ++i) {
049f9ae93d033be Jason A. Donenfeld 2022-07-09  34  		if (!rdrand_long(&samp=
le)) {
049f9ae93d033be Jason A. Donenfeld 2022-07-09  35  			failure =3D true;
049f9ae93d033be Jason A. Donenfeld 2022-07-09  36  			break;
0007bccc3cfd1e6 Len Brown          2015-08-16  37  		}
049f9ae93d033be Jason A. Donenfeld 2022-07-09 @38  		changed +=3D i && samp=
le !=3D prev;

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3535783544716445827==--

