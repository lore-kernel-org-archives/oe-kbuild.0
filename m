Content-Type: multipart/mixed; boundary="===============7370230102170093940=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kvm/x86.c:1014 __kvm_set_xcr() warn: bitwise AND condition is false here
Date: Thu, 10 Mar 2022 03:55:06 +0800
Message-ID: <202203100319.XACjiYJC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7370230102170093940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jing Liu <jing2.liu@intel.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Yang Zhong <yang.zhong@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   330f4c53d3c2d8b11d86ec03a964b86dc81452f5
commit: 86aff7a4799286635efd94dab17b513544703cad kvm: x86: Add XCR0 support=
 for Intel AMX
date:   8 weeks ago
:::::: branch date: 23 hours ago
:::::: commit date: 8 weeks ago
config: i386-randconfig-m031-20220307 (https://download.01.org/0day-ci/arch=
ive/20220310/202203100319.XACjiYJC-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
arch/x86/kvm/x86.c:1014 __kvm_set_xcr() warn: bitwise AND condition is fals=
e here

Old smatch warnings:
arch/x86/kvm/x86.c:1015 __kvm_set_xcr() warn: bitwise AND condition is fals=
e here
arch/x86/kvm/x86.c:5048 kvm_arch_tsc_set_attr() warn: check for integer ove=
rflow 'offset'
arch/x86/kvm/x86.c:5089 kvm_vcpu_ioctl_device_attr() error: uninitialized s=
ymbol 'r'.
arch/x86/kvm/x86.c:9516 enter_smm() warn: inconsistent indenting

vim +1014 arch/x86/kvm/x86.c

42bdf991f4cad9 Marcelo Tosatti     2013-04-15   979  =

69b0049a89ad41 Fengguang Wu        2015-01-19   980  static int __kvm_set_x=
cr(struct kvm_vcpu *vcpu, u32 index, u64 xcr)
2acf923e38fb6a Dexuan Cui          2010-06-10   981  {
56c103ec040b19 Liu, Jinsong        2014-02-21   982  	u64 xcr0 =3D xcr;
56c103ec040b19 Liu, Jinsong        2014-02-21   983  	u64 old_xcr0 =3D vcpu=
->arch.xcr0;
46c34cb059d519 Paolo Bonzini       2013-10-17   984  	u64 valid_bits;
2acf923e38fb6a Dexuan Cui          2010-06-10   985  =

2acf923e38fb6a Dexuan Cui          2010-06-10   986  	/* Only support XCR_X=
FEATURE_ENABLED_MASK(xcr0) now  */
2acf923e38fb6a Dexuan Cui          2010-06-10   987  	if (index !=3D XCR_XF=
EATURE_ENABLED_MASK)
2acf923e38fb6a Dexuan Cui          2010-06-10   988  		return 1;
d91cab78133d33 Dave Hansen         2015-09-02   989  	if (!(xcr0 & XFEATURE=
_MASK_FP))
2acf923e38fb6a Dexuan Cui          2010-06-10   990  		return 1;
d91cab78133d33 Dave Hansen         2015-09-02   991  	if ((xcr0 & XFEATURE_=
MASK_YMM) && !(xcr0 & XFEATURE_MASK_SSE))
2acf923e38fb6a Dexuan Cui          2010-06-10   992  		return 1;
46c34cb059d519 Paolo Bonzini       2013-10-17   993  =

46c34cb059d519 Paolo Bonzini       2013-10-17   994  	/*
46c34cb059d519 Paolo Bonzini       2013-10-17   995  	 * Do not allow the g=
uest to set bits that we do not support
46c34cb059d519 Paolo Bonzini       2013-10-17   996  	 * saving.  However, =
xcr0 bit 0 is always set, even if the
e8f65b9bb48320 Sean Christopherson 2021-09-20   997  	 * emulated CPU does =
not support XSAVE (see kvm_vcpu_reset()).
46c34cb059d519 Paolo Bonzini       2013-10-17   998  	 */
d91cab78133d33 Dave Hansen         2015-09-02   999  	valid_bits =3D vcpu->=
arch.guest_supported_xcr0 | XFEATURE_MASK_FP;
46c34cb059d519 Paolo Bonzini       2013-10-17  1000  	if (xcr0 & ~valid_bit=
s)
2acf923e38fb6a Dexuan Cui          2010-06-10  1001  		return 1;
46c34cb059d519 Paolo Bonzini       2013-10-17  1002  =

d91cab78133d33 Dave Hansen         2015-09-02  1003  	if ((!(xcr0 & XFEATUR=
E_MASK_BNDREGS)) !=3D
d91cab78133d33 Dave Hansen         2015-09-02  1004  	    (!(xcr0 & XFEATUR=
E_MASK_BNDCSR)))
390bd528ae1c14 Liu, Jinsong        2014-02-24  1005  		return 1;
390bd528ae1c14 Liu, Jinsong        2014-02-24  1006  =

d91cab78133d33 Dave Hansen         2015-09-02  1007  	if (xcr0 & XFEATURE_M=
ASK_AVX512) {
d91cab78133d33 Dave Hansen         2015-09-02  1008  		if (!(xcr0 & XFEATUR=
E_MASK_YMM))
612263b30c900b Chao Peng           2014-10-22  1009  			return 1;
d91cab78133d33 Dave Hansen         2015-09-02  1010  		if ((xcr0 & XFEATURE=
_MASK_AVX512) !=3D XFEATURE_MASK_AVX512)
612263b30c900b Chao Peng           2014-10-22  1011  			return 1;
612263b30c900b Chao Peng           2014-10-22  1012  	}
86aff7a4799286 Jing Liu            2022-01-05  1013  =

86aff7a4799286 Jing Liu            2022-01-05 @1014  	if ((xcr0 & XFEATURE_=
MASK_XTILE) &&
86aff7a4799286 Jing Liu            2022-01-05  1015  	    ((xcr0 & XFEATURE=
_MASK_XTILE) !=3D XFEATURE_MASK_XTILE))
86aff7a4799286 Jing Liu            2022-01-05  1016  		return 1;
86aff7a4799286 Jing Liu            2022-01-05  1017  =

2acf923e38fb6a Dexuan Cui          2010-06-10  1018  	vcpu->arch.xcr0 =3D x=
cr0;
56c103ec040b19 Liu, Jinsong        2014-02-21  1019  =

d91cab78133d33 Dave Hansen         2015-09-02  1020  	if ((xcr0 ^ old_xcr0)=
 & XFEATURE_MASK_EXTEND)
aedbaf4f6afdcf Xiaoyao Li          2020-07-09  1021  		kvm_update_cpuid_run=
time(vcpu);
2acf923e38fb6a Dexuan Cui          2010-06-10  1022  	return 0;
2acf923e38fb6a Dexuan Cui          2010-06-10  1023  }
2acf923e38fb6a Dexuan Cui          2010-06-10  1024  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7370230102170093940==--

