Content-Type: multipart/mixed; boundary="===============4070861155107526360=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: arch/x86/kvm/svm/avic.c:579:9: warning: Identical condition and return expression 'ret', return value is always 0 [identicalConditionAfterEarlyExit]
Date: Fri, 10 Apr 2020 05:06:56 +0800
Message-ID: <202004100552.b30yOClT%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4070861155107526360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Joerg Roedel <jroedel@suse.de>
CC: Paolo Bonzini <pbonzini@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5d30bcacd91af6874481129797af364a53cd9b46
commit: ef0f64960d012cbab8f55f305ef36bb6de4e1a9b KVM: SVM: Move AVIC code t=
o separate file
date:   6 days ago
:::::: branch date: 16 hours ago
:::::: commit date: 6 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> arch/x86/kvm/svm/avic.c:579:9: warning: Identical condition and return e=
xpression 'ret', return value is always 0 [identicalConditionAfterEarlyExit]
    return ret;
           ^
   arch/x86/kvm/svm/avic.c:572:6: note: If condition 'ret' is true, the fun=
ction will return/exit
    if (ret)
        ^
   arch/x86/kvm/svm/avic.c:579:9: note: Returning identical expression 'ret'
    return ret;
           ^
>> arch/x86/kvm/svm/avic.c:330:21: warning: Local variable 'apic' shadows o=
uter variable [shadowVariable]
     struct kvm_lapic *apic =3D svm->vcpu.arch.apic;
                       ^
   arch/x86/kvm/svm/avic.c:306:20: note: Shadowed declaration
    struct kvm_lapic *apic =3D svm->vcpu.arch.apic;
                      ^
   arch/x86/kvm/svm/avic.c:330:21: note: Shadow variable
     struct kvm_lapic *apic =3D svm->vcpu.arch.apic;
                       ^
>> arch/x86/kvm/svm/avic.c:404:15: warning: Shifting signed 32-bit value by=
 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    new_entry |=3D AVIC_LOGICAL_ID_ENTRY_VALID_MASK;
                 ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Def0f64960d012cbab8f55f305ef36bb6de4e1a9b
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout ef0f64960d012cbab8f55f305ef36bb6de4e1a9b
vim +/ret +579 arch/x86/kvm/svm/avic.c

ef0f64960d012c Joerg Roedel 2020-03-31  390  =

ef0f64960d012c Joerg Roedel 2020-03-31  391  static int avic_ldr_write(stru=
ct kvm_vcpu *vcpu, u8 g_physical_id, u32 ldr)
ef0f64960d012c Joerg Roedel 2020-03-31  392  {
ef0f64960d012c Joerg Roedel 2020-03-31  393  	bool flat;
ef0f64960d012c Joerg Roedel 2020-03-31  394  	u32 *entry, new_entry;
ef0f64960d012c Joerg Roedel 2020-03-31  395  =

ef0f64960d012c Joerg Roedel 2020-03-31  396  	flat =3D kvm_lapic_get_reg(vc=
pu->arch.apic, APIC_DFR) =3D=3D APIC_DFR_FLAT;
ef0f64960d012c Joerg Roedel 2020-03-31  397  	entry =3D avic_get_logical_id=
_entry(vcpu, ldr, flat);
ef0f64960d012c Joerg Roedel 2020-03-31  398  	if (!entry)
ef0f64960d012c Joerg Roedel 2020-03-31  399  		return -EINVAL;
ef0f64960d012c Joerg Roedel 2020-03-31  400  =

ef0f64960d012c Joerg Roedel 2020-03-31  401  	new_entry =3D READ_ONCE(*entr=
y);
ef0f64960d012c Joerg Roedel 2020-03-31  402  	new_entry &=3D ~AVIC_LOGICAL_=
ID_ENTRY_GUEST_PHYSICAL_ID_MASK;
ef0f64960d012c Joerg Roedel 2020-03-31  403  	new_entry |=3D (g_physical_id=
 & AVIC_LOGICAL_ID_ENTRY_GUEST_PHYSICAL_ID_MASK);
ef0f64960d012c Joerg Roedel 2020-03-31 @404  	new_entry |=3D AVIC_LOGICAL_I=
D_ENTRY_VALID_MASK;
ef0f64960d012c Joerg Roedel 2020-03-31  405  	WRITE_ONCE(*entry, new_entry);
ef0f64960d012c Joerg Roedel 2020-03-31  406  =

ef0f64960d012c Joerg Roedel 2020-03-31  407  	return 0;
ef0f64960d012c Joerg Roedel 2020-03-31  408  }
ef0f64960d012c Joerg Roedel 2020-03-31  409  =

ef0f64960d012c Joerg Roedel 2020-03-31  410  static void avic_invalidate_lo=
gical_id_entry(struct kvm_vcpu *vcpu)
ef0f64960d012c Joerg Roedel 2020-03-31  411  {
ef0f64960d012c Joerg Roedel 2020-03-31  412  	struct vcpu_svm *svm =3D to_s=
vm(vcpu);
ef0f64960d012c Joerg Roedel 2020-03-31  413  	bool flat =3D svm->dfr_reg =
=3D=3D APIC_DFR_FLAT;
ef0f64960d012c Joerg Roedel 2020-03-31  414  	u32 *entry =3D avic_get_logic=
al_id_entry(vcpu, svm->ldr_reg, flat);
ef0f64960d012c Joerg Roedel 2020-03-31  415  =

ef0f64960d012c Joerg Roedel 2020-03-31  416  	if (entry)
ef0f64960d012c Joerg Roedel 2020-03-31  417  		clear_bit(AVIC_LOGICAL_ID_EN=
TRY_VALID_BIT, (unsigned long *)entry);
ef0f64960d012c Joerg Roedel 2020-03-31  418  }
ef0f64960d012c Joerg Roedel 2020-03-31  419  =

ef0f64960d012c Joerg Roedel 2020-03-31  420  static int avic_handle_ldr_upd=
ate(struct kvm_vcpu *vcpu)
ef0f64960d012c Joerg Roedel 2020-03-31  421  {
ef0f64960d012c Joerg Roedel 2020-03-31  422  	int ret =3D 0;
ef0f64960d012c Joerg Roedel 2020-03-31  423  	struct vcpu_svm *svm =3D to_s=
vm(vcpu);
ef0f64960d012c Joerg Roedel 2020-03-31  424  	u32 ldr =3D kvm_lapic_get_reg=
(vcpu->arch.apic, APIC_LDR);
ef0f64960d012c Joerg Roedel 2020-03-31  425  	u32 id =3D kvm_xapic_id(vcpu-=
>arch.apic);
ef0f64960d012c Joerg Roedel 2020-03-31  426  =

ef0f64960d012c Joerg Roedel 2020-03-31  427  	if (ldr =3D=3D svm->ldr_reg)
ef0f64960d012c Joerg Roedel 2020-03-31  428  		return 0;
ef0f64960d012c Joerg Roedel 2020-03-31  429  =

ef0f64960d012c Joerg Roedel 2020-03-31  430  	avic_invalidate_logical_id_en=
try(vcpu);
ef0f64960d012c Joerg Roedel 2020-03-31  431  =

ef0f64960d012c Joerg Roedel 2020-03-31  432  	if (ldr)
ef0f64960d012c Joerg Roedel 2020-03-31  433  		ret =3D avic_ldr_write(vcpu,=
 id, ldr);
ef0f64960d012c Joerg Roedel 2020-03-31  434  =

ef0f64960d012c Joerg Roedel 2020-03-31  435  	if (!ret)
ef0f64960d012c Joerg Roedel 2020-03-31  436  		svm->ldr_reg =3D ldr;
ef0f64960d012c Joerg Roedel 2020-03-31  437  =

ef0f64960d012c Joerg Roedel 2020-03-31  438  	return ret;
ef0f64960d012c Joerg Roedel 2020-03-31  439  }
ef0f64960d012c Joerg Roedel 2020-03-31  440  =

ef0f64960d012c Joerg Roedel 2020-03-31  441  static int avic_handle_apic_id=
_update(struct kvm_vcpu *vcpu)
ef0f64960d012c Joerg Roedel 2020-03-31  442  {
ef0f64960d012c Joerg Roedel 2020-03-31  443  	u64 *old, *new;
ef0f64960d012c Joerg Roedel 2020-03-31  444  	struct vcpu_svm *svm =3D to_s=
vm(vcpu);
ef0f64960d012c Joerg Roedel 2020-03-31  445  	u32 id =3D kvm_xapic_id(vcpu-=
>arch.apic);
ef0f64960d012c Joerg Roedel 2020-03-31  446  =

ef0f64960d012c Joerg Roedel 2020-03-31  447  	if (vcpu->vcpu_id =3D=3D id)
ef0f64960d012c Joerg Roedel 2020-03-31  448  		return 0;
ef0f64960d012c Joerg Roedel 2020-03-31  449  =

ef0f64960d012c Joerg Roedel 2020-03-31  450  	old =3D avic_get_physical_id_=
entry(vcpu, vcpu->vcpu_id);
ef0f64960d012c Joerg Roedel 2020-03-31  451  	new =3D avic_get_physical_id_=
entry(vcpu, id);
ef0f64960d012c Joerg Roedel 2020-03-31  452  	if (!new || !old)
ef0f64960d012c Joerg Roedel 2020-03-31  453  		return 1;
ef0f64960d012c Joerg Roedel 2020-03-31  454  =

ef0f64960d012c Joerg Roedel 2020-03-31  455  	/* We need to move physical_i=
d_entry to new offset */
ef0f64960d012c Joerg Roedel 2020-03-31  456  	*new =3D *old;
ef0f64960d012c Joerg Roedel 2020-03-31  457  	*old =3D 0ULL;
ef0f64960d012c Joerg Roedel 2020-03-31  458  	to_svm(vcpu)->avic_physical_i=
d_cache =3D new;
ef0f64960d012c Joerg Roedel 2020-03-31  459  =

ef0f64960d012c Joerg Roedel 2020-03-31  460  	/*
ef0f64960d012c Joerg Roedel 2020-03-31  461  	 * Also update the guest phys=
ical APIC ID in the logical
ef0f64960d012c Joerg Roedel 2020-03-31  462  	 * APIC ID table entry if alr=
eady setup the LDR.
ef0f64960d012c Joerg Roedel 2020-03-31  463  	 */
ef0f64960d012c Joerg Roedel 2020-03-31  464  	if (svm->ldr_reg)
ef0f64960d012c Joerg Roedel 2020-03-31  465  		avic_handle_ldr_update(vcpu);
ef0f64960d012c Joerg Roedel 2020-03-31  466  =

ef0f64960d012c Joerg Roedel 2020-03-31  467  	return 0;
ef0f64960d012c Joerg Roedel 2020-03-31  468  }
ef0f64960d012c Joerg Roedel 2020-03-31  469  =

ef0f64960d012c Joerg Roedel 2020-03-31  470  static void avic_handle_dfr_up=
date(struct kvm_vcpu *vcpu)
ef0f64960d012c Joerg Roedel 2020-03-31  471  {
ef0f64960d012c Joerg Roedel 2020-03-31  472  	struct vcpu_svm *svm =3D to_s=
vm(vcpu);
ef0f64960d012c Joerg Roedel 2020-03-31  473  	u32 dfr =3D kvm_lapic_get_reg=
(vcpu->arch.apic, APIC_DFR);
ef0f64960d012c Joerg Roedel 2020-03-31  474  =

ef0f64960d012c Joerg Roedel 2020-03-31  475  	if (svm->dfr_reg =3D=3D dfr)
ef0f64960d012c Joerg Roedel 2020-03-31  476  		return;
ef0f64960d012c Joerg Roedel 2020-03-31  477  =

ef0f64960d012c Joerg Roedel 2020-03-31  478  	avic_invalidate_logical_id_en=
try(vcpu);
ef0f64960d012c Joerg Roedel 2020-03-31  479  	svm->dfr_reg =3D dfr;
ef0f64960d012c Joerg Roedel 2020-03-31  480  }
ef0f64960d012c Joerg Roedel 2020-03-31  481  =

ef0f64960d012c Joerg Roedel 2020-03-31  482  static int avic_unaccel_trap_w=
rite(struct vcpu_svm *svm)
ef0f64960d012c Joerg Roedel 2020-03-31  483  {
ef0f64960d012c Joerg Roedel 2020-03-31  484  	struct kvm_lapic *apic =3D sv=
m->vcpu.arch.apic;
ef0f64960d012c Joerg Roedel 2020-03-31  485  	u32 offset =3D svm->vmcb->con=
trol.exit_info_1 &
ef0f64960d012c Joerg Roedel 2020-03-31  486  				AVIC_UNACCEL_ACCESS_OFFSET=
_MASK;
ef0f64960d012c Joerg Roedel 2020-03-31  487  =

ef0f64960d012c Joerg Roedel 2020-03-31  488  	switch (offset) {
ef0f64960d012c Joerg Roedel 2020-03-31  489  	case APIC_ID:
ef0f64960d012c Joerg Roedel 2020-03-31  490  		if (avic_handle_apic_id_upda=
te(&svm->vcpu))
ef0f64960d012c Joerg Roedel 2020-03-31  491  			return 0;
ef0f64960d012c Joerg Roedel 2020-03-31  492  		break;
ef0f64960d012c Joerg Roedel 2020-03-31  493  	case APIC_LDR:
ef0f64960d012c Joerg Roedel 2020-03-31  494  		if (avic_handle_ldr_update(&=
svm->vcpu))
ef0f64960d012c Joerg Roedel 2020-03-31  495  			return 0;
ef0f64960d012c Joerg Roedel 2020-03-31  496  		break;
ef0f64960d012c Joerg Roedel 2020-03-31  497  	case APIC_DFR:
ef0f64960d012c Joerg Roedel 2020-03-31  498  		avic_handle_dfr_update(&svm-=
>vcpu);
ef0f64960d012c Joerg Roedel 2020-03-31  499  		break;
ef0f64960d012c Joerg Roedel 2020-03-31  500  	default:
ef0f64960d012c Joerg Roedel 2020-03-31  501  		break;
ef0f64960d012c Joerg Roedel 2020-03-31  502  	}
ef0f64960d012c Joerg Roedel 2020-03-31  503  =

ef0f64960d012c Joerg Roedel 2020-03-31  504  	kvm_lapic_reg_write(apic, off=
set, kvm_lapic_get_reg(apic, offset));
ef0f64960d012c Joerg Roedel 2020-03-31  505  =

ef0f64960d012c Joerg Roedel 2020-03-31  506  	return 1;
ef0f64960d012c Joerg Roedel 2020-03-31  507  }
ef0f64960d012c Joerg Roedel 2020-03-31  508  =

ef0f64960d012c Joerg Roedel 2020-03-31  509  static bool is_avic_unaccelera=
ted_access_trap(u32 offset)
ef0f64960d012c Joerg Roedel 2020-03-31  510  {
ef0f64960d012c Joerg Roedel 2020-03-31  511  	bool ret =3D false;
ef0f64960d012c Joerg Roedel 2020-03-31  512  =

ef0f64960d012c Joerg Roedel 2020-03-31  513  	switch (offset) {
ef0f64960d012c Joerg Roedel 2020-03-31  514  	case APIC_ID:
ef0f64960d012c Joerg Roedel 2020-03-31  515  	case APIC_EOI:
ef0f64960d012c Joerg Roedel 2020-03-31  516  	case APIC_RRR:
ef0f64960d012c Joerg Roedel 2020-03-31  517  	case APIC_LDR:
ef0f64960d012c Joerg Roedel 2020-03-31  518  	case APIC_DFR:
ef0f64960d012c Joerg Roedel 2020-03-31  519  	case APIC_SPIV:
ef0f64960d012c Joerg Roedel 2020-03-31  520  	case APIC_ESR:
ef0f64960d012c Joerg Roedel 2020-03-31  521  	case APIC_ICR:
ef0f64960d012c Joerg Roedel 2020-03-31  522  	case APIC_LVTT:
ef0f64960d012c Joerg Roedel 2020-03-31  523  	case APIC_LVTTHMR:
ef0f64960d012c Joerg Roedel 2020-03-31  524  	case APIC_LVTPC:
ef0f64960d012c Joerg Roedel 2020-03-31  525  	case APIC_LVT0:
ef0f64960d012c Joerg Roedel 2020-03-31  526  	case APIC_LVT1:
ef0f64960d012c Joerg Roedel 2020-03-31  527  	case APIC_LVTERR:
ef0f64960d012c Joerg Roedel 2020-03-31  528  	case APIC_TMICT:
ef0f64960d012c Joerg Roedel 2020-03-31  529  	case APIC_TDCR:
ef0f64960d012c Joerg Roedel 2020-03-31  530  		ret =3D true;
ef0f64960d012c Joerg Roedel 2020-03-31  531  		break;
ef0f64960d012c Joerg Roedel 2020-03-31  532  	default:
ef0f64960d012c Joerg Roedel 2020-03-31  533  		break;
ef0f64960d012c Joerg Roedel 2020-03-31  534  	}
ef0f64960d012c Joerg Roedel 2020-03-31  535  	return ret;
ef0f64960d012c Joerg Roedel 2020-03-31  536  }
ef0f64960d012c Joerg Roedel 2020-03-31  537  =

ef0f64960d012c Joerg Roedel 2020-03-31  538  int avic_unaccelerated_access_=
interception(struct vcpu_svm *svm)
ef0f64960d012c Joerg Roedel 2020-03-31  539  {
ef0f64960d012c Joerg Roedel 2020-03-31  540  	int ret =3D 0;
ef0f64960d012c Joerg Roedel 2020-03-31  541  	u32 offset =3D svm->vmcb->con=
trol.exit_info_1 &
ef0f64960d012c Joerg Roedel 2020-03-31  542  		     AVIC_UNACCEL_ACCESS_OFF=
SET_MASK;
ef0f64960d012c Joerg Roedel 2020-03-31  543  	u32 vector =3D svm->vmcb->con=
trol.exit_info_2 &
ef0f64960d012c Joerg Roedel 2020-03-31  544  		     AVIC_UNACCEL_ACCESS_VEC=
TOR_MASK;
ef0f64960d012c Joerg Roedel 2020-03-31  545  	bool write =3D (svm->vmcb->co=
ntrol.exit_info_1 >> 32) &
ef0f64960d012c Joerg Roedel 2020-03-31  546  		     AVIC_UNACCEL_ACCESS_WRI=
TE_MASK;
ef0f64960d012c Joerg Roedel 2020-03-31  547  	bool trap =3D is_avic_unaccel=
erated_access_trap(offset);
ef0f64960d012c Joerg Roedel 2020-03-31  548  =

ef0f64960d012c Joerg Roedel 2020-03-31  549  	trace_kvm_avic_unaccelerated_=
access(svm->vcpu.vcpu_id, offset,
ef0f64960d012c Joerg Roedel 2020-03-31  550  					    trap, write, vector);
ef0f64960d012c Joerg Roedel 2020-03-31  551  	if (trap) {
ef0f64960d012c Joerg Roedel 2020-03-31  552  		/* Handling Trap */
ef0f64960d012c Joerg Roedel 2020-03-31  553  		WARN_ONCE(!write, "svm: Hand=
ling trap read.\n");
ef0f64960d012c Joerg Roedel 2020-03-31  554  		ret =3D avic_unaccel_trap_wr=
ite(svm);
ef0f64960d012c Joerg Roedel 2020-03-31  555  	} else {
ef0f64960d012c Joerg Roedel 2020-03-31  556  		/* Handling Fault */
ef0f64960d012c Joerg Roedel 2020-03-31  557  		ret =3D kvm_emulate_instruct=
ion(&svm->vcpu, 0);
ef0f64960d012c Joerg Roedel 2020-03-31  558  	}
ef0f64960d012c Joerg Roedel 2020-03-31  559  =

ef0f64960d012c Joerg Roedel 2020-03-31  560  	return ret;
ef0f64960d012c Joerg Roedel 2020-03-31  561  }
ef0f64960d012c Joerg Roedel 2020-03-31  562  =

ef0f64960d012c Joerg Roedel 2020-03-31  563  int avic_init_vcpu(struct vcpu=
_svm *svm)
ef0f64960d012c Joerg Roedel 2020-03-31  564  {
ef0f64960d012c Joerg Roedel 2020-03-31  565  	int ret;
ef0f64960d012c Joerg Roedel 2020-03-31  566  	struct kvm_vcpu *vcpu =3D &sv=
m->vcpu;
ef0f64960d012c Joerg Roedel 2020-03-31  567  =

ef0f64960d012c Joerg Roedel 2020-03-31  568  	if (!avic || !irqchip_in_kern=
el(vcpu->kvm))
ef0f64960d012c Joerg Roedel 2020-03-31  569  		return 0;
ef0f64960d012c Joerg Roedel 2020-03-31  570  =

ef0f64960d012c Joerg Roedel 2020-03-31  571  	ret =3D avic_init_backing_pag=
e(&svm->vcpu);
ef0f64960d012c Joerg Roedel 2020-03-31  572  	if (ret)
ef0f64960d012c Joerg Roedel 2020-03-31  573  		return ret;
ef0f64960d012c Joerg Roedel 2020-03-31  574  =

ef0f64960d012c Joerg Roedel 2020-03-31  575  	INIT_LIST_HEAD(&svm->ir_list);
ef0f64960d012c Joerg Roedel 2020-03-31  576  	spin_lock_init(&svm->ir_list_=
lock);
ef0f64960d012c Joerg Roedel 2020-03-31  577  	svm->dfr_reg =3D APIC_DFR_FLA=
T;
ef0f64960d012c Joerg Roedel 2020-03-31  578  =

ef0f64960d012c Joerg Roedel 2020-03-31 @579  	return ret;
ef0f64960d012c Joerg Roedel 2020-03-31  580  }
ef0f64960d012c Joerg Roedel 2020-03-31  581  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4070861155107526360==--

