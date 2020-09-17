Content-Type: multipart/mixed; boundary="===============0477455884944065086=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kvm/x86.c:5458:6: warning: Buffer is accessed out of bounds: kvm_emulate_prefix
Date: Thu, 17 Sep 2020 13:23:07 +0800
Message-ID: <202009171350.fqvYC6cB%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0477455884944065086==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Masami Hiramatsu <mhiramat@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5925fa68fe8244651b3f78a88c4af99190a88f0d
commit: b3dc0695fa40c3b280230fb6fb7fb7a94ce28bf4 x86: xen: kvm: Gather the =
definition of emulate prefixes
date:   11 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 11 months ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

       ^
   arch/x86/kvm/x86.c:7193:4: warning: Variable 'r' is reassigned a value b=
efore the old one has been used. [redundantAssignment]
    r =3D kvm_mmu_module_init();
      ^
   arch/x86/kvm/x86.c:7178:4: note: Variable 'r' is reassigned a value befo=
re the old one has been used.
    r =3D -ENOMEM;
      ^
   arch/x86/kvm/x86.c:7193:4: note: Variable 'r' is reassigned a value befo=
re the old one has been used.
    r =3D kvm_mmu_module_init();
      ^
   arch/x86/kvm/x86.c:8691:6: warning: Variable 'ret' is reassigned a value=
 before the old one has been used. [redundantAssignment]
    ret =3D 0;
        ^
   arch/x86/kvm/x86.c:8670:0: note: Variable 'ret' is reassigned a value be=
fore the old one has been used.
    int ret =3D -EINVAL;
   ^
   arch/x86/kvm/x86.c:8691:6: note: Variable 'ret' is reassigned a value be=
fore the old one has been used.
    ret =3D 0;
        ^
   arch/x86/kvm/x86.c:8827:6: warning: Variable 'ret' is reassigned a value=
 before the old one has been used. [redundantAssignment]
    ret =3D 0;
        ^
   arch/x86/kvm/x86.c:8751:0: note: Variable 'ret' is reassigned a value be=
fore the old one has been used.
    int ret =3D -EINVAL;
   ^
   arch/x86/kvm/x86.c:8827:6: note: Variable 'ret' is reassigned a value be=
fore the old one has been used.
    ret =3D 0;
        ^
   arch/x86/kvm/x86.c:8893:4: warning: Variable 'r' is reassigned a value b=
efore the old one has been used. [redundantAssignment]
    r =3D 0;
      ^
   arch/x86/kvm/x86.c:8852:5: note: Variable 'r' is reassigned a value befo=
re the old one has been used.
     r =3D -EBUSY;
       ^
   arch/x86/kvm/x86.c:8893:4: note: Variable 'r' is reassigned a value befo=
re the old one has been used.
    r =3D 0;
      ^
   arch/x86/kvm/x86.c:3871:29: warning: Opposite expression on both sides o=
f '&'. [oppositeExpression]
     u64 xfeature_mask =3D valid & -valid;
                               ^
   arch/x86/kvm/x86.c:3914:29: warning: Opposite expression on both sides o=
f '&'. [oppositeExpression]
     u64 xfeature_mask =3D valid & -valid;
                               ^
   arch/x86/kvm/x86.c:402:11: warning: Shifting signed 32-bit value by 31 b=
its is undefined behaviour. See condition at line 399. [shiftTooManyBitsSig=
ned]
    mask =3D 1 << vector;
             ^
   arch/x86/kvm/x86.c:399:21: note: Assuming that condition 'vector>31' is =
not redundant
    if (WARN_ON(vector > 31 || vector =3D=3D NMI_VECTOR))
                       ^
   arch/x86/kvm/x86.c:402:11: note: Shift
    mask =3D 1 << vector;
             ^
>> arch/x86/kvm/x86.c:5458:6: warning: Buffer is accessed out of bounds: kv=
m_emulate_prefix [bufferAccessOutOfBounds]
        memcmp(sig, kvm_emulate_prefix, sizeof(sig)) =3D=3D 0) {
        ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Db3dc0695fa40c3b280230fb6fb7fb7a94ce28bf4
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout b3dc0695fa40c3b280230fb6fb7fb7a94ce28bf4
vim +5458 arch/x86/kvm/x86.c

77c2002e7c6f01 Izik Eidus          2008-12-29  5447  =

082d06edab49f3 Wanpeng Li          2018-04-03  5448  int handle_ud(struct k=
vm_vcpu *vcpu)
082d06edab49f3 Wanpeng Li          2018-04-03  5449  {
b3dc0695fa40c3 Masami Hiramatsu    2019-09-06  5450  	static const char kvm=
_emulate_prefix[] =3D { __KVM_EMULATE_PREFIX };
6c86eedc206dd1 Wanpeng Li          2018-04-03  5451  	int emul_type =3D EMU=
LTYPE_TRAP_UD;
6c86eedc206dd1 Wanpeng Li          2018-04-03  5452  	char sig[5]; /* ud2; =
.ascii "kvm" */
6c86eedc206dd1 Wanpeng Li          2018-04-03  5453  	struct x86_exception =
e;
6c86eedc206dd1 Wanpeng Li          2018-04-03  5454  =

6c86eedc206dd1 Wanpeng Li          2018-04-03  5455  	if (force_emulation_p=
refix &&
3c9fa24ca7c9c4 Paolo Bonzini       2018-06-06  5456  	    kvm_read_guest_vi=
rt(vcpu, kvm_get_linear_rip(vcpu),
3c9fa24ca7c9c4 Paolo Bonzini       2018-06-06  5457  				sig, sizeof(sig), =
&e) =3D=3D 0 &&
b3dc0695fa40c3 Masami Hiramatsu    2019-09-06 @5458  	    memcmp(sig, kvm_e=
mulate_prefix, sizeof(sig)) =3D=3D 0) {
6c86eedc206dd1 Wanpeng Li          2018-04-03  5459  		kvm_rip_write(vcpu, =
kvm_rip_read(vcpu) + sizeof(sig));
b4000606205959 Sean Christopherson 2019-08-27  5460  		emul_type =3D EMULTY=
PE_TRAP_UD_FORCED;
6c86eedc206dd1 Wanpeng Li          2018-04-03  5461  	}
082d06edab49f3 Wanpeng Li          2018-04-03  5462  =

60fc3d02d5b882 Sean Christopherson 2019-08-27  5463  	return kvm_emulate_in=
struction(vcpu, emul_type);
082d06edab49f3 Wanpeng Li          2018-04-03  5464  }
082d06edab49f3 Wanpeng Li          2018-04-03  5465  EXPORT_SYMBOL_GPL(hand=
le_ud);
082d06edab49f3 Wanpeng Li          2018-04-03  5466  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0477455884944065086==--

