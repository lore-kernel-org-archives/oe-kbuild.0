Content-Type: multipart/mixed; boundary="===============7081473851258049565=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [avpatel:riscv_kvm_aia_v1 25/29] arch/riscv/kvm/aia.c:31:43: warning: Parameter 'owner' can be declared with const [constParameter]
Date: Fri, 08 Apr 2022 15:17:54 +0800
Message-ID: <202204081547.AaMLLC6s-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7081473851258049565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Anup Patel <apatel@ventanamicro.com>

tree:   https://github.com/avpatel/linux.git riscv_kvm_aia_v1
head:   dab41b5c8f55fb8e864a5e10fd181dd0d4443778
commit: 74de87a8890ab0c58f3e5142ff49d219872a0eb5 [25/29] RISC-V: KVM: Imple=
ment guest external interrupt line management
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: riscv64-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 74de87a8890ab0c58f3e5142ff49d219872a0eb5
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/irqchip/irq-riscv-imsic.c:895:26: warning: Local variable 'paren=
t' shadows outer argument [shadowArgument]
     struct of_phandle_args parent;
                            ^
   drivers/irqchip/irq-riscv-imsic.c:711:29: note: Shadowed declaration
           struct device_node *parent)
                               ^
   drivers/irqchip/irq-riscv-imsic.c:895:26: note: Shadow variable
     struct of_phandle_args parent;
                            ^
>> arch/riscv/kvm/aia.c:31:43: warning: Parameter 'owner' can be declared w=
ith const [constParameter]
   static int aia_find_hgei(struct kvm_vcpu *owner)
                                             ^
--
>> arch/riscv/kvm/vcpu_exit.c:516:9: warning: Expression '-(20-2)' can have=
 a negative value. That is converted to an unsigned value and used in an un=
signed calculation. [signConversion]
    data =3D GET_RS2(insn, &vcpu->arch.guest_context);
           ^
   arch/riscv/kvm/vcpu_exit.c:540:12: warning: Expression '0-2' can have a =
negative value. That is converted to an unsigned value and used in an unsig=
ned calculation. [signConversion]
     data32 =3D GET_RS2S(insn, &vcpu->arch.guest_context);
              ^
   arch/riscv/kvm/vcpu_exit.c:516:9: warning: Expression '-(20-3)' can have=
 a negative value. That is converted to an unsigned value and used in an un=
signed calculation. [signConversion]
    data =3D GET_RS2(insn, &vcpu->arch.guest_context);
           ^
   arch/riscv/kvm/vcpu_exit.c:532:12: warning: Expression '0-3' can have a =
negative value. That is converted to an unsigned value and used in an unsig=
ned calculation. [signConversion]
     data64 =3D GET_RS2S(insn, &vcpu->arch.guest_context);
              ^
   arch/riscv/kvm/vcpu_exit.c:536:12: warning: Expression '2-3' can have a =
negative value. That is converted to an unsigned value and used in an unsig=
ned calculation. [signConversion]
     data64 =3D GET_RS2C(insn, &vcpu->arch.guest_context);
              ^
   arch/riscv/kvm/vcpu_exit.c:540:12: warning: Expression '0-3' can have a =
negative value. That is converted to an unsigned value and used in an unsig=
ned calculation. [signConversion]
     data32 =3D GET_RS2S(insn, &vcpu->arch.guest_context);
              ^
   arch/riscv/kvm/vcpu_exit.c:544:12: warning: Expression '2-3' can have a =
negative value. That is converted to an unsigned value and used in an unsig=
ned calculation. [signConversion]
     data32 =3D GET_RS2C(insn, &vcpu->arch.guest_context);
              ^

vim +/owner +31 arch/riscv/kvm/aia.c

362960efc54f42 Anup Patel 2022-01-19  30  =

74de87a8890ab0 Anup Patel 2022-01-19 @31  static int aia_find_hgei(struct k=
vm_vcpu *owner)
74de87a8890ab0 Anup Patel 2022-01-19  32  {
74de87a8890ab0 Anup Patel 2022-01-19  33  	int i, hgei;
74de87a8890ab0 Anup Patel 2022-01-19  34  	unsigned long flags;
74de87a8890ab0 Anup Patel 2022-01-19  35  	struct aia_hgei_control *hgctrl =
=3D this_cpu_ptr(&aia_hgei);
74de87a8890ab0 Anup Patel 2022-01-19  36  =

74de87a8890ab0 Anup Patel 2022-01-19  37  	raw_spin_lock_irqsave(&hgctrl->l=
ock, flags);
74de87a8890ab0 Anup Patel 2022-01-19  38  =

74de87a8890ab0 Anup Patel 2022-01-19  39  	hgei =3D -1;
74de87a8890ab0 Anup Patel 2022-01-19  40  	for (i =3D 1; i <=3D kvm_riscv_a=
ia_nr_hgei; i++) {
74de87a8890ab0 Anup Patel 2022-01-19  41  		if (hgctrl->owners[i] =3D=3D ow=
ner) {
74de87a8890ab0 Anup Patel 2022-01-19  42  			hgei =3D i;
74de87a8890ab0 Anup Patel 2022-01-19  43  			break;
74de87a8890ab0 Anup Patel 2022-01-19  44  		}
74de87a8890ab0 Anup Patel 2022-01-19  45  	}
74de87a8890ab0 Anup Patel 2022-01-19  46  =

74de87a8890ab0 Anup Patel 2022-01-19  47  	raw_spin_unlock_irqrestore(&hgct=
rl->lock, flags);
74de87a8890ab0 Anup Patel 2022-01-19  48  =

74de87a8890ab0 Anup Patel 2022-01-19  49  	return hgei;
74de87a8890ab0 Anup Patel 2022-01-19  50  }
74de87a8890ab0 Anup Patel 2022-01-19  51  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7081473851258049565==--

