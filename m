Content-Type: multipart/mixed; boundary="===============2662413923867469901=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tip:x86/fpu 1/2] arch/x86/kernel/fpu/core.c:863 fpu_idle_fpregs() warn: bitwise AND condition is false here
Date: Fri, 10 Jun 2022 22:07:36 +0800
Message-ID: <202206102129.qGhd6PFG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2662413923867469901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
CC: x86(a)kernel.org
TO: "Chang S. Bae" <chang.seok.bae@intel.com>
CC: Dave Hansen <dave.hansen@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/fpu
head:   43843d58393026fef4a43d192b641a4fabdc42bf
commit: 407f1fd0780e39d60778a66c6a157d8c8c832729 [1/2] x86/fpu: Add a helpe=
r to prepare AMX state for low-power CPU idle
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
610/202206102129.qGhd6PFG-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/x86/kernel/fpu/core.c:863 fpu_idle_fpregs() warn: bitwise AND conditio=
n is false here

vim +863 arch/x86/kernel/fpu/core.c

407f1fd0780e39 Chang S. Bae 2022-06-08  854  =

407f1fd0780e39 Chang S. Bae 2022-06-08  855  /*
407f1fd0780e39 Chang S. Bae 2022-06-08  856   * Initialize register state t=
hat may prevent from entering low-power idle.
407f1fd0780e39 Chang S. Bae 2022-06-08  857   * This function will be invok=
ed from the cpuidle driver only when needed.
407f1fd0780e39 Chang S. Bae 2022-06-08  858   */
407f1fd0780e39 Chang S. Bae 2022-06-08  859  void fpu_idle_fpregs(void)
407f1fd0780e39 Chang S. Bae 2022-06-08  860  {
407f1fd0780e39 Chang S. Bae 2022-06-08  861  	/* Note: AMX_TILE being enabl=
ed implies XGETBV1 support */
407f1fd0780e39 Chang S. Bae 2022-06-08  862  	if (cpu_feature_enabled(X86_F=
EATURE_AMX_TILE) &&
407f1fd0780e39 Chang S. Bae 2022-06-08 @863  	    (xfeatures_in_use() & XFE=
ATURE_MASK_XTILE)) {

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2662413923867469901==--

