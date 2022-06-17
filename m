Content-Type: multipart/mixed; boundary="===============1426611801551256197=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [avpatel:riscv_kvm_aia_v1 25/29] arch/riscv/kvm/aia.c:31:43: warning: Parameter 'owner' can be declared with const [constParameter]
Date: Fri, 17 Jun 2022 15:58:50 +0800
Message-ID: <202206171538.bDZqbQaw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1426611801551256197==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: arch/risc=
v/kvm/aia.c:31:43: warning: Parameter 'owner' can be declared with const [c=
onstParameter]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Anup Patel <apatel@ventanamicro.com>

tree:   https://github.com/avpatel/linux.git riscv_kvm_aia_v1
head:   00790a8b765d864a8a1d0be2f7985954cb719031
commit: 2bbb6c939352838630361b9d4a0ea5266c708614 [25/29] RISC-V: KVM: Imple=
ment guest external interrupt line management
:::::: branch date: 28 hours ago
:::::: commit date: 2 days ago
compiler: riscv64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 2bbb6c939352838630361b9d4a0ea5266c708614
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/riscv/kvm/vcpu_insn.c:613:9: warning: Expression '-(20-2)' can have=
 a negative value. That is converted to an unsigned value and used in an un=
signed calculation. [signConversion]
    data =3D GET_RS2(insn, &vcpu->arch.guest_context);
           ^
   arch/riscv/kvm/vcpu_insn.c:637:12: warning: Expression '0-2' can have a =
negative value. That is converted to an unsigned value and used in an unsig=
ned calculation. [signConversion]
     data32 =3D GET_RS2S(insn, &vcpu->arch.guest_context);
              ^
   arch/riscv/kvm/vcpu_insn.c:613:9: warning: Expression '-(20-3)' can have=
 a negative value. That is converted to an unsigned value and used in an un=
signed calculation. [signConversion]
    data =3D GET_RS2(insn, &vcpu->arch.guest_context);
           ^
   arch/riscv/kvm/vcpu_insn.c:629:12: warning: Expression '0-3' can have a =
negative value. That is converted to an unsigned value and used in an unsig=
ned calculation. [signConversion]
     data64 =3D GET_RS2S(insn, &vcpu->arch.guest_context);
              ^
   arch/riscv/kvm/vcpu_insn.c:633:12: warning: Expression '2-3' can have a =
negative value. That is converted to an unsigned value and used in an unsig=
ned calculation. [signConversion]
     data64 =3D GET_RS2C(insn, &vcpu->arch.guest_context);
              ^
   arch/riscv/kvm/vcpu_insn.c:637:12: warning: Expression '0-3' can have a =
negative value. That is converted to an unsigned value and used in an unsig=
ned calculation. [signConversion]
     data32 =3D GET_RS2S(insn, &vcpu->arch.guest_context);
              ^
   arch/riscv/kvm/vcpu_insn.c:641:12: warning: Expression '2-3' can have a =
negative value. That is converted to an unsigned value and used in an unsig=
ned calculation. [signConversion]
     data32 =3D GET_RS2C(insn, &vcpu->arch.guest_context);
              ^
--
>> arch/riscv/kvm/aia.c:31:43: warning: Parameter 'owner' can be declared w=
ith const [constParameter]
   static int aia_find_hgei(struct kvm_vcpu *owner)
                                             ^

vim +/owner +31 arch/riscv/kvm/aia.c

865faedf30dc847 Anup Patel 2022-01-19  30  =

2bbb6c939352838 Anup Patel 2022-01-19 @31  static int aia_find_hgei(struct =
kvm_vcpu *owner)
2bbb6c939352838 Anup Patel 2022-01-19  32  {
2bbb6c939352838 Anup Patel 2022-01-19  33  	int i, hgei;
2bbb6c939352838 Anup Patel 2022-01-19  34  	unsigned long flags;
2bbb6c939352838 Anup Patel 2022-01-19  35  	struct aia_hgei_control *hgctrl=
 =3D this_cpu_ptr(&aia_hgei);
2bbb6c939352838 Anup Patel 2022-01-19  36  =

2bbb6c939352838 Anup Patel 2022-01-19  37  	raw_spin_lock_irqsave(&hgctrl->=
lock, flags);
2bbb6c939352838 Anup Patel 2022-01-19  38  =

2bbb6c939352838 Anup Patel 2022-01-19  39  	hgei =3D -1;
2bbb6c939352838 Anup Patel 2022-01-19  40  	for (i =3D 1; i <=3D kvm_riscv_=
aia_nr_hgei; i++) {
2bbb6c939352838 Anup Patel 2022-01-19  41  		if (hgctrl->owners[i] =3D=3D o=
wner) {
2bbb6c939352838 Anup Patel 2022-01-19  42  			hgei =3D i;
2bbb6c939352838 Anup Patel 2022-01-19  43  			break;
2bbb6c939352838 Anup Patel 2022-01-19  44  		}
2bbb6c939352838 Anup Patel 2022-01-19  45  	}
2bbb6c939352838 Anup Patel 2022-01-19  46  =

2bbb6c939352838 Anup Patel 2022-01-19  47  	raw_spin_unlock_irqrestore(&hgc=
trl->lock, flags);
2bbb6c939352838 Anup Patel 2022-01-19  48  =

2bbb6c939352838 Anup Patel 2022-01-19  49  	return hgei;
2bbb6c939352838 Anup Patel 2022-01-19  50  }
2bbb6c939352838 Anup Patel 2022-01-19  51  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1426611801551256197==--

