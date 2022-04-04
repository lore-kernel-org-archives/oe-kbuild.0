Content-Type: multipart/mixed; boundary="===============9029807549262551453=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/powerpc/lib/sstep.c:329:1: warning: Label 'Efault' is not used. There is #if in function body so the label might be used in code that is removed by the preprocessor. [unusedLabelConfiguration]
Date: Tue, 05 Apr 2022 03:09:46 +0800
Message-ID: <202204050334.lEEI2pYI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9029807549262551453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3123109284176b1532874591f7c81f3837bbdc17
commit: e28d0b675056d072f1f11fa644d0efbb016bb7ce powerpc/lib/sstep: Don't u=
se __{get/put}_user() on kernel addresses
date:   6 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 6 months ago
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/edac/edac_mc.c:502:62: warning: Parameter 'dev' can be declared =
with const [constParameter]
   static struct mem_ctl_info *__find_mci_by_dev(struct device *dev)
                                                                ^
>> drivers/edac/edac_mc.c:703:3: warning: There is an unknown macro here so=
mewhere. Configuration is required. If mci_for_each_dimm is a macro then pl=
ease configure it. [unknownMacro]
     mci_for_each_dimm(mci, dimm)
     ^
--
>> drivers/base/power/wakeup.c:413:2: warning: There is an unknown macro he=
re somewhere. Configuration is required. If list_for_each_entry_rcu is a ma=
cro then please configure it. [unknownMacro]
    list_for_each_entry_rcu_locked(ws, &wakeup_sources, entry)
    ^
--
   arch/powerpc/lib/sstep.c:1635:9: warning: Shifting a negative value is t=
echnically undefined behaviour [shiftNegativeLHS]
     imm =3D MASK32(mb, me);
           ^
   arch/powerpc/lib/sstep.c:1643:31: warning: Shifting a negative value is =
technically undefined behaviour [shiftNegativeLHS]
     op->val =3D ROTATE(val, rb) & MASK32(mb, me);
                                 ^
   arch/powerpc/lib/sstep.c:1651:31: warning: Shifting a negative value is =
technically undefined behaviour [shiftNegativeLHS]
     op->val =3D ROTATE(val, rb) & MASK32(mb, me);
                                 ^
>> arch/powerpc/lib/sstep.c:329:1: warning: Label 'Efault' is not used. The=
re is #if in function body so the label might be used in code that is remov=
ed by the preprocessor. [unusedLabelConfiguration]
   Efault:
   ^
   arch/powerpc/lib/sstep.c:386:1: warning: Label 'Efault' is not used. The=
re is #if in function body so the label might be used in code that is remov=
ed by the preprocessor. [unusedLabelConfiguration]
   Efault:
   ^
   arch/powerpc/lib/sstep.c:465:1: warning: Label 'Efault' is not used. The=
re is #if in function body so the label might be used in code that is remov=
ed by the preprocessor. [unusedLabelConfiguration]
   Efault:
   ^
   arch/powerpc/lib/sstep.c:522:1: warning: Label 'Efault' is not used. The=
re is #if in function body so the label might be used in code that is remov=
ed by the preprocessor. [unusedLabelConfiguration]
   Efault:
   ^
   arch/powerpc/lib/sstep.c:656:8: warning: Overlapping read/write of union=
 is undefined behavior [overlappingWriteUnion]
      u.u =3D u.l[0];
          ^
   arch/powerpc/lib/sstep.c:2232:33: warning: Unsigned expression '63-sh' c=
an't be negative so it is unnecessary to test it. [unsignedPositive]
       op->val =3D ROTATE(val, sh) & MASK64(0, 63 - sh);
                                   ^
   arch/powerpc/lib/sstep.c:2201:19: warning: Shifting signed 64-bit value =
by 63 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
      op->val =3D ival >> (sh < 64 ? sh : 63);
                     ^

vim +/Efault +329 arch/powerpc/lib/sstep.c

d955189ae42796 Paul Mackerras   2017-08-30  304  =

e28d0b675056d0 Christophe Leroy 2021-09-16  305  static __always_inline int
e28d0b675056d0 Christophe Leroy 2021-09-16  306  __read_mem_aligned(unsigne=
d long *dest, unsigned long ea, int nb, struct pt_regs *regs)
0016a4cf558241 Paul Mackerras   2010-06-15  307  {
0016a4cf558241 Paul Mackerras   2010-06-15  308  	unsigned long x =3D 0;
0016a4cf558241 Paul Mackerras   2010-06-15  309  =

0016a4cf558241 Paul Mackerras   2010-06-15  310  	switch (nb) {
0016a4cf558241 Paul Mackerras   2010-06-15  311  	case 1:
e28d0b675056d0 Christophe Leroy 2021-09-16  312  		unsafe_get_user(x, (unsi=
gned char __user *)ea, Efault);
0016a4cf558241 Paul Mackerras   2010-06-15  313  		break;
0016a4cf558241 Paul Mackerras   2010-06-15  314  	case 2:
e28d0b675056d0 Christophe Leroy 2021-09-16  315  		unsafe_get_user(x, (unsi=
gned short __user *)ea, Efault);
0016a4cf558241 Paul Mackerras   2010-06-15  316  		break;
0016a4cf558241 Paul Mackerras   2010-06-15  317  	case 4:
e28d0b675056d0 Christophe Leroy 2021-09-16  318  		unsafe_get_user(x, (unsi=
gned int __user *)ea, Efault);
0016a4cf558241 Paul Mackerras   2010-06-15  319  		break;
0016a4cf558241 Paul Mackerras   2010-06-15  320  #ifdef __powerpc64__
0016a4cf558241 Paul Mackerras   2010-06-15  321  	case 8:
e28d0b675056d0 Christophe Leroy 2021-09-16  322  		unsafe_get_user(x, (unsi=
gned long __user *)ea, Efault);
0016a4cf558241 Paul Mackerras   2010-06-15  323  		break;
0016a4cf558241 Paul Mackerras   2010-06-15  324  #endif
0016a4cf558241 Paul Mackerras   2010-06-15  325  	}
0016a4cf558241 Paul Mackerras   2010-06-15  326  	*dest =3D x;
e28d0b675056d0 Christophe Leroy 2021-09-16  327  	return 0;
e28d0b675056d0 Christophe Leroy 2021-09-16  328  =

e28d0b675056d0 Christophe Leroy 2021-09-16 @329  Efault:
e28d0b675056d0 Christophe Leroy 2021-09-16  330  	regs->dar =3D ea;
e28d0b675056d0 Christophe Leroy 2021-09-16  331  	return -EFAULT;
e28d0b675056d0 Christophe Leroy 2021-09-16  332  }
e28d0b675056d0 Christophe Leroy 2021-09-16  333  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9029807549262551453==--

