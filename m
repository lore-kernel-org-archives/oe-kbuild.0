Content-Type: multipart/mixed; boundary="===============6411228870771245123=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [tglx-devel:x86/fpu-kvm 1/6] arch/x86/kernel/fpu/xstate.c:1637 __xstate_request_perm() error: uninitialized symbol 'ret'.
Date: Wed, 15 Dec 2021 00:42:50 +0800
Message-ID: <202112150028.6Iybe7bM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6411228870771245123==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/=
fpu-kvm
head:   e16d6eec3c9e60abfb29d0d77f08411d326142dd
commit: 8a4ae8c80ec211646b5824b7c89d64cf7d286625 [1/6] x86/fpu: Extend fpu_=
xstate_prctl() with guest permissions
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: x86_64-randconfig-m001-20211214 (https://download.01.org/0day-ci/ar=
chive/20211215/202112150028.6Iybe7bM-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
arch/x86/kernel/fpu/xstate.c:1637 __xstate_request_perm() error: uninitiali=
zed symbol 'ret'.

Old smatch warnings:
arch/x86/kernel/fpu/xstate.c:375 os_xrstor_booting() warn: mask and shift t=
o zero

vim +/ret +1637 arch/x86/kernel/fpu/xstate.c

db8268df0983adc Chang S. Bae    2021-10-21  1597  =

8a4ae8c80ec2116 Thomas Gleixner 2021-12-07  1598  static int __xstate_reque=
st_perm(u64 permitted, u64 requested, bool guest)
db8268df0983adc Chang S. Bae    2021-10-21  1599  {
db8268df0983adc Chang S. Bae    2021-10-21  1600  	/*
db8268df0983adc Chang S. Bae    2021-10-21  1601  	 * This deliberately doe=
s not exclude !XSAVES as we still might
db8268df0983adc Chang S. Bae    2021-10-21  1602  	 * decide to optionally =
context switch XCR0 or talk the silicon
500afbf645a040a Chang S. Bae    2021-10-21  1603  	 * vendors into extendin=
g XFD for the pre AMX states, especially
500afbf645a040a Chang S. Bae    2021-10-21  1604  	 * AVX512.
db8268df0983adc Chang S. Bae    2021-10-21  1605  	 */
db8268df0983adc Chang S. Bae    2021-10-21  1606  	bool compacted =3D cpu_f=
eature_enabled(X86_FEATURE_XSAVES);
db8268df0983adc Chang S. Bae    2021-10-21  1607  	struct fpu *fpu =3D &cur=
rent->group_leader->thread.fpu;
8a4ae8c80ec2116 Thomas Gleixner 2021-12-07  1608  	struct fpu_state_perm *p=
erm;
db8268df0983adc Chang S. Bae    2021-10-21  1609  	unsigned int ksize, usiz=
e;
db8268df0983adc Chang S. Bae    2021-10-21  1610  	u64 mask;
db8268df0983adc Chang S. Bae    2021-10-21  1611  	int ret;
db8268df0983adc Chang S. Bae    2021-10-21  1612  =

db8268df0983adc Chang S. Bae    2021-10-21  1613  	/* Check whether fully e=
nabled */
db8268df0983adc Chang S. Bae    2021-10-21  1614  	if ((permitted & request=
ed) =3D=3D requested)
db8268df0983adc Chang S. Bae    2021-10-21  1615  		return 0;
db8268df0983adc Chang S. Bae    2021-10-21  1616  =

db8268df0983adc Chang S. Bae    2021-10-21  1617  	/* Calculate the resulti=
ng kernel state size */
db8268df0983adc Chang S. Bae    2021-10-21  1618  	mask =3D permitted | req=
uested;
db8268df0983adc Chang S. Bae    2021-10-21  1619  	ksize =3D xstate_calcula=
te_size(mask, compacted);
db8268df0983adc Chang S. Bae    2021-10-21  1620  =

db8268df0983adc Chang S. Bae    2021-10-21  1621  	/* Calculate the resulti=
ng user state size */
db8268df0983adc Chang S. Bae    2021-10-21  1622  	mask &=3D XFEATURE_MASK_=
USER_SUPPORTED;
db8268df0983adc Chang S. Bae    2021-10-21  1623  	usize =3D xstate_calcula=
te_size(mask, false);
db8268df0983adc Chang S. Bae    2021-10-21  1624  =

8a4ae8c80ec2116 Thomas Gleixner 2021-12-07  1625  	if (!guest) {
db8268df0983adc Chang S. Bae    2021-10-21  1626  		ret =3D validate_sigalt=
stack(usize);
db8268df0983adc Chang S. Bae    2021-10-21  1627  		if (ret)
db8268df0983adc Chang S. Bae    2021-10-21  1628  			return ret;
8a4ae8c80ec2116 Thomas Gleixner 2021-12-07  1629  	}
db8268df0983adc Chang S. Bae    2021-10-21  1630  =

8a4ae8c80ec2116 Thomas Gleixner 2021-12-07  1631  	perm =3D guest ? &fpu->g=
uest_perm : &fpu->perm;
db8268df0983adc Chang S. Bae    2021-10-21  1632  	/* Pairs with the READ_O=
NCE() in xstate_get_group_perm() */
8a4ae8c80ec2116 Thomas Gleixner 2021-12-07  1633  	WRITE_ONCE(perm->__state=
_perm, requested);
db8268df0983adc Chang S. Bae    2021-10-21  1634  	/* Protected by sighand =
lock */
8a4ae8c80ec2116 Thomas Gleixner 2021-12-07  1635  	perm->__state_size =3D k=
size;
8a4ae8c80ec2116 Thomas Gleixner 2021-12-07  1636  	perm->__user_state_size =
=3D usize;
db8268df0983adc Chang S. Bae    2021-10-21 @1637  	return ret;
db8268df0983adc Chang S. Bae    2021-10-21  1638  }
db8268df0983adc Chang S. Bae    2021-10-21  1639  =


:::::: The code at line 1637 was first introduced by commit
:::::: db8268df0983adc2bb1fb48c9e5f7bfbb5f617f3 x86/arch_prctl: Add control=
s for dynamic XSTATE components

:::::: TO: Chang S. Bae <chang.seok.bae@intel.com>
:::::: CC: Borislav Petkov <bp@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6411228870771245123==--

