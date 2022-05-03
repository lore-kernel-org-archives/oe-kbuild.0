Content-Type: multipart/mixed; boundary="===============2825984267224802381=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/powerpc/lib/sstep.c:327:1: warning: Label 'Efault' is not used. There is #if in function body so the label might be used in code that is removed by the preprocessor. [unusedLabelConfiguration]
Date: Tue, 03 May 2022 16:07:46 +0800
Message-ID: <202205031633.VKTZ9GCH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2825984267224802381==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Anders Roxell <anders.roxell@linaro.org>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Segher Boessenkool <segher@kernel.crashing.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9050ba3a61a4b5bd84c2cde092a100404f814f31
commit: 8219d31effa7be5dbc7ff915d7970672e028c701 powerpc/lib/sstep: Fix bui=
ld errors with newer binutils
date:   9 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 9 weeks ago
compiler: powerpc64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 8219d31effa7be5dbc7ff915d7970672e028c701
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/powerpc/platforms/ps3/setup.c:293:2: warning: Found a exit path fro=
m function with non-void return type that has missing return statement [mis=
singReturn]
    .name    =3D "PS3",
    ^
>> arch/powerpc/platforms/powermac/pfunc_core.c:568:70: warning: Parameter =
'np' can be declared with const [constParameter]
   static inline struct pmf_device *pmf_find_device(struct device_node *np)
                                                                        ^
>> arch/powerpc/platforms/powermac/pfunc_core.c:573:12: warning: Uninitiali=
zed variable: dev->node [uninitvar]
     if (dev->node =3D=3D np)
              ^
--
>> arch/powerpc/platforms/powermac/setup.c:595:2: warning: Found a exit pat=
h from function with non-void return type that has missing return statement=
 [missingReturn]
    .name   =3D "PowerMac",
    ^
--
   arch/powerpc/lib/sstep.c:1627:9: warning: Shifting a negative value is t=
echnically undefined behaviour [shiftNegativeLHS]
     imm =3D MASK32(mb, me);
           ^
   arch/powerpc/lib/sstep.c:1635:31: warning: Shifting a negative value is =
technically undefined behaviour [shiftNegativeLHS]
     op->val =3D ROTATE(val, rb) & MASK32(mb, me);
                                 ^
   arch/powerpc/lib/sstep.c:1643:31: warning: Shifting a negative value is =
technically undefined behaviour [shiftNegativeLHS]
     op->val =3D ROTATE(val, rb) & MASK32(mb, me);
                                 ^
>> arch/powerpc/lib/sstep.c:327:1: warning: Label 'Efault' is not used. The=
re is #if in function body so the label might be used in code that is remov=
ed by the preprocessor. [unusedLabelConfiguration]
   Efault:
   ^
   arch/powerpc/lib/sstep.c:384:1: warning: Label 'Efault' is not used. The=
re is #if in function body so the label might be used in code that is remov=
ed by the preprocessor. [unusedLabelConfiguration]
   Efault:
   ^
   arch/powerpc/lib/sstep.c:463:1: warning: Label 'Efault' is not used. The=
re is #if in function body so the label might be used in code that is remov=
ed by the preprocessor. [unusedLabelConfiguration]
   Efault:
   ^
   arch/powerpc/lib/sstep.c:520:1: warning: Label 'Efault' is not used. The=
re is #if in function body so the label might be used in code that is remov=
ed by the preprocessor. [unusedLabelConfiguration]
   Efault:
   ^
   arch/powerpc/lib/sstep.c:654:8: warning: Overlapping read/write of union=
 is undefined behavior [overlappingWriteUnion]
      u.u =3D u.l[0];
          ^
   arch/powerpc/lib/sstep.c:2224:33: warning: Unsigned expression '63-sh' c=
an't be negative so it is unnecessary to test it. [unsignedPositive]
       op->val =3D ROTATE(val, sh) & MASK64(0, 63 - sh);
                                   ^
   arch/powerpc/lib/sstep.c:2193:19: warning: Shifting signed 64-bit value =
by 63 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
      op->val =3D ival >> (sh < 64 ? sh : 63);
                     ^

vim +/Efault +327 arch/powerpc/lib/sstep.c

d955189ae42796 Paul Mackerras   2017-08-30  302  =

e28d0b675056d0 Christophe Leroy 2021-09-16  303  static __always_inline int
e28d0b675056d0 Christophe Leroy 2021-09-16  304  __read_mem_aligned(unsigne=
d long *dest, unsigned long ea, int nb, struct pt_regs *regs)
0016a4cf558241 Paul Mackerras   2010-06-15  305  {
0016a4cf558241 Paul Mackerras   2010-06-15  306  	unsigned long x =3D 0;
0016a4cf558241 Paul Mackerras   2010-06-15  307  =

0016a4cf558241 Paul Mackerras   2010-06-15  308  	switch (nb) {
0016a4cf558241 Paul Mackerras   2010-06-15  309  	case 1:
e28d0b675056d0 Christophe Leroy 2021-09-16  310  		unsafe_get_user(x, (unsi=
gned char __user *)ea, Efault);
0016a4cf558241 Paul Mackerras   2010-06-15  311  		break;
0016a4cf558241 Paul Mackerras   2010-06-15  312  	case 2:
e28d0b675056d0 Christophe Leroy 2021-09-16  313  		unsafe_get_user(x, (unsi=
gned short __user *)ea, Efault);
0016a4cf558241 Paul Mackerras   2010-06-15  314  		break;
0016a4cf558241 Paul Mackerras   2010-06-15  315  	case 4:
e28d0b675056d0 Christophe Leroy 2021-09-16  316  		unsafe_get_user(x, (unsi=
gned int __user *)ea, Efault);
0016a4cf558241 Paul Mackerras   2010-06-15  317  		break;
0016a4cf558241 Paul Mackerras   2010-06-15  318  #ifdef __powerpc64__
0016a4cf558241 Paul Mackerras   2010-06-15  319  	case 8:
e28d0b675056d0 Christophe Leroy 2021-09-16  320  		unsafe_get_user(x, (unsi=
gned long __user *)ea, Efault);
0016a4cf558241 Paul Mackerras   2010-06-15  321  		break;
0016a4cf558241 Paul Mackerras   2010-06-15  322  #endif
0016a4cf558241 Paul Mackerras   2010-06-15  323  	}
0016a4cf558241 Paul Mackerras   2010-06-15  324  	*dest =3D x;
e28d0b675056d0 Christophe Leroy 2021-09-16  325  	return 0;
e28d0b675056d0 Christophe Leroy 2021-09-16  326  =

e28d0b675056d0 Christophe Leroy 2021-09-16 @327  Efault:
e28d0b675056d0 Christophe Leroy 2021-09-16  328  	regs->dar =3D ea;
e28d0b675056d0 Christophe Leroy 2021-09-16  329  	return -EFAULT;
e28d0b675056d0 Christophe Leroy 2021-09-16  330  }
e28d0b675056d0 Christophe Leroy 2021-09-16  331  =


:::::: The code at line 327 was first introduced by commit
:::::: e28d0b675056d072f1f11fa644d0efbb016bb7ce powerpc/lib/sstep: Don't us=
e __{get/put}_user() on kernel addresses

:::::: TO: Christophe Leroy <christophe.leroy@csgroup.eu>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2825984267224802381==--

