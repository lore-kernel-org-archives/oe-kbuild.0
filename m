Content-Type: multipart/mixed; boundary="===============7209363887540027119=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tip:x86/fpu 1/1] arch/x86/kernel/fpu/xstate.c:605:7: warning: Redundant initialization for 'size'. The initialized value is overwritten before it is read. [redundantInitialization]
Date: Tue, 26 Apr 2022 22:51:43 +0800
Message-ID: <202204262214.x10mbeG2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7209363887540027119==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
CC: x86(a)kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/fpu
head:   8ad7e8f696951f192c6629a0cbda9ac94c773159
commit: 8ad7e8f696951f192c6629a0cbda9ac94c773159 [1/1] x86/fpu/xsave: Suppo=
rt XSAVEC in the kernel
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 8ad7e8f696951f192c6629a0cbda9ac94c773159
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
   arch/x86/kernel/fpu/xstate.c:1236:7: warning: Local variable 'mask' shad=
ows outer variable [shadowVariable]
     u64 mask =3D ((u64)1 << i);
         ^
   arch/x86/kernel/fpu/xstate.c:1205:6: note: Shadowed declaration
    u64 mask;
        ^
   arch/x86/kernel/fpu/xstate.c:1236:7: note: Shadow variable
     u64 mask =3D ((u64)1 << i);
         ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/x86/kernel/fpu/xstate.c:605:7: warning: Redundant initialization fo=
r 'size'. The initialized value is overwritten before it is read. [redundan=
tInitialization]
    size =3D xstate_calculate_size(fpu_kernel_cfg.max_features, compacted);
         ^
   arch/x86/kernel/fpu/xstate.c:590:20: note: size is initialized
    unsigned int size =3D FXSAVE_SIZE + XSAVE_HDR_SIZE;
                      ^
   arch/x86/kernel/fpu/xstate.c:605:7: note: size is overwritten
    size =3D xstate_calculate_size(fpu_kernel_cfg.max_features, compacted);
         ^
>> arch/x86/kernel/fpu/xstate.c:589:7: warning: Local variable 'xsaves' sha=
dows outer function [shadowFunction]
    bool xsaves =3D cpu_feature_enabled(X86_FEATURE_XSAVES);
         ^
   arch/x86/kernel/fpu/xstate.c:1310:6: note: Shadowed declaration
   void xsaves(struct xregs_state *xstate, u64 mask)
        ^
   arch/x86/kernel/fpu/xstate.c:589:7: note: Shadow variable
    bool xsaves =3D cpu_feature_enabled(X86_FEATURE_XSAVES);
         ^
>> arch/x86/kernel/fpu/xstate.c:1708:43: warning: Parameter 'tsk' can be de=
clared with const [constParameter]
   long fpu_xstate_prctl(struct task_struct *tsk, int option, unsigned long=
 arg2)
                                             ^

vim +/size +605 arch/x86/kernel/fpu/xstate.c

84e4dccc8fce20 Chang S. Bae    2021-10-21  576  =

65ac2e9baa7dee Dave Hansen     2015-09-02  577  /*
65ac2e9baa7dee Dave Hansen     2015-09-02  578   * This essentially double-=
checks what the cpu told us about
65ac2e9baa7dee Dave Hansen     2015-09-02  579   * how large the XSAVE buff=
er needs to be.  We are recalculating
65ac2e9baa7dee Dave Hansen     2015-09-02  580   * it to be safe.
76d10256a97a7c Kan Liang       2020-07-20  581   *
01707b66535872 Andy Lutomirski 2021-06-23  582   * Independent XSAVE featur=
es allocate their own buffers and are not
76d10256a97a7c Kan Liang       2020-07-20  583   * covered by these checks.=
 Only the size of the buffer for task->fpu
76d10256a97a7c Kan Liang       2020-07-20  584   * is checked here.
65ac2e9baa7dee Dave Hansen     2015-09-02  585   */
cd9ae761744912 Thomas Gleixner 2021-10-15  586  static bool __init paranoid=
_xstate_size_valid(unsigned int kernel_size)
65ac2e9baa7dee Dave Hansen     2015-09-02  587  {
8ad7e8f696951f Thomas Gleixner 2022-04-04  588  	bool compacted =3D cpu_fea=
ture_enabled(X86_FEATURE_XCOMPACTED);
8ad7e8f696951f Thomas Gleixner 2022-04-04 @589  	bool xsaves =3D cpu_featur=
e_enabled(X86_FEATURE_XSAVES);
cd9ae761744912 Thomas Gleixner 2021-10-15  590  	unsigned int size =3D FXSA=
VE_SIZE + XSAVE_HDR_SIZE;
65ac2e9baa7dee Dave Hansen     2015-09-02  591  	int i;
65ac2e9baa7dee Dave Hansen     2015-09-02  592  =

1c253ff2287fe3 Thomas Gleixner 2021-10-15  593  	for_each_extended_xfeature=
(i, fpu_kernel_cfg.max_features) {
cd9ae761744912 Thomas Gleixner 2021-10-15  594  		if (!check_xstate_against=
_struct(i))
cd9ae761744912 Thomas Gleixner 2021-10-15  595  			return false;
65ac2e9baa7dee Dave Hansen     2015-09-02  596  		/*
65ac2e9baa7dee Dave Hansen     2015-09-02  597  		 * Supervisor state compo=
nents can be managed only by
02b93c0b00df22 Thomas Gleixner 2021-06-23  598  		 * XSAVES.
65ac2e9baa7dee Dave Hansen     2015-09-02  599  		 */
8ad7e8f696951f Thomas Gleixner 2022-04-04  600  		if (!xsaves && xfeature_i=
s_supervisor(i)) {
cd9ae761744912 Thomas Gleixner 2021-10-15  601  			XSTATE_WARN_ON(1);
cd9ae761744912 Thomas Gleixner 2021-10-15  602  			return false;
cd9ae761744912 Thomas Gleixner 2021-10-15  603  		}
65ac2e9baa7dee Dave Hansen     2015-09-02  604  	}
84e4dccc8fce20 Chang S. Bae    2021-10-21 @605  	size =3D xstate_calculate_=
size(fpu_kernel_cfg.max_features, compacted);
cd9ae761744912 Thomas Gleixner 2021-10-15  606  	XSTATE_WARN_ON(size !=3D k=
ernel_size);
cd9ae761744912 Thomas Gleixner 2021-10-15  607  	return size =3D=3D kernel_=
size;
65ac2e9baa7dee Dave Hansen     2015-09-02  608  }
65ac2e9baa7dee Dave Hansen     2015-09-02  609  =


:::::: The code at line 605 was first introduced by commit
:::::: 84e4dccc8fce20b497388d756e12de5c9006eb48 x86/fpu/xstate: Provide xst=
ate_calculate_size()

:::::: TO: Chang S. Bae <chang.seok.bae@intel.com>
:::::: CC: Borislav Petkov <bp@suse.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7209363887540027119==--

