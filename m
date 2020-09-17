Content-Type: multipart/mixed; boundary="===============4798195628685545127=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5374/8311] arch/x86/kvm/svm/nested.c:1109:6: warning: Variable 'ret' is reassigned a value before the old one has been used.
Date: Thu, 17 Sep 2020 13:06:28 +0800
Message-ID: <202009171322.13blxNVE%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4798195628685545127==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Joerg Roedel <jroedel@suse.de>
CC: Borislav Petkov <bp@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   5fa35f247b563a7893f3f68f19d00ace2ccf3dff
commit: 6ccbd29ade0d159ee1be398dc9defaae567c253d [5374/8311] KVM: SVM: nest=
ed: Don't allocate VMCB structures on stack
:::::: branch date: 22 hours ago
:::::: commit date: 9 days ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> arch/x86/kvm/svm/nested.c:1109:6: warning: Variable 'ret' is reassigned =
a value before the old one has been used. [redundantAssignment]
    ret =3D -EFAULT;
        ^
   arch/x86/kvm/svm/nested.c:1103:7: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
    ret  =3D -ENOMEM;
         ^
   arch/x86/kvm/svm/nested.c:1109:6: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
    ret =3D -EFAULT;
        ^
   arch/x86/kvm/svm/nested.c:1115:6: warning: Variable 'ret' is reassigned =
a value before the old one has been used. [redundantAssignment]
    ret =3D -EINVAL;
        ^
   arch/x86/kvm/svm/nested.c:1109:6: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
    ret =3D -EFAULT;
        ^
   arch/x86/kvm/svm/nested.c:1115:6: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
    ret =3D -EINVAL;
        ^
   arch/x86/kvm/svm/nested.c:1151:6: warning: Variable 'ret' is reassigned =
a value before the old one has been used. [redundantAssignment]
    ret =3D 0;
        ^
   arch/x86/kvm/svm/nested.c:1115:6: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
    ret =3D -EINVAL;
        ^
   arch/x86/kvm/svm/nested.c:1151:6: note: Variable 'ret' is reassigned a v=
alue before the old one has been used.
    ret =3D 0;
        ^
--
>> drivers/net/ethernet/chelsio/cxgb4vf/cxgb4vf_main.c:367:11: warning: Loc=
al variable msi shadows outer variable [shadowVar]
     int qs, msi;
             ^
   drivers/net/ethernet/chelsio/cxgb4vf/cxgb4vf_main.c:88:12: note: Shadowe=
d declaration
   static int msi =3D MSI_DEFAULT;
              ^
   drivers/net/ethernet/chelsio/cxgb4vf/cxgb4vf_main.c:367:11: note: Shadow=
 variable
     int qs, msi;
             ^
   drivers/net/ethernet/chelsio/cxgb4vf/cxgb4vf_main.c:383:11: warning: Loc=
al variable msi shadows outer variable [shadowVar]
    int rxq, msi, err;
             ^
   drivers/net/ethernet/chelsio/cxgb4vf/cxgb4vf_main.c:88:12: note: Shadowe=
d declaration
   static int msi =3D MSI_DEFAULT;
              ^
   drivers/net/ethernet/chelsio/cxgb4vf/cxgb4vf_main.c:383:11: note: Shadow=
 variable
    int rxq, msi, err;
             ^
   drivers/net/ethernet/chelsio/cxgb4vf/cxgb4vf_main.c:421:11: warning: Loc=
al variable msi shadows outer variable [shadowVar]
    int rxq, msi;
             ^
   drivers/net/ethernet/chelsio/cxgb4vf/cxgb4vf_main.c:88:12: note: Shadowe=
d declaration
   static int msi =3D MSI_DEFAULT;
              ^
   drivers/net/ethernet/chelsio/cxgb4vf/cxgb4vf_main.c:421:11: note: Shadow=
 variable
    int rxq, msi;
             ^
>> drivers/net/ethernet/chelsio/cxgb4vf/cxgb4vf_main.c:3253:21: warning: Lo=
cal variable pi shadows outer variable [shadowVar]
     struct port_info *pi =3D netdev_priv(adapter->port[pidx]);
                       ^
   drivers/net/ethernet/chelsio/cxgb4vf/cxgb4vf_main.c:2962:20: note: Shado=
wed declaration
    struct port_info *pi;
                      ^
   drivers/net/ethernet/chelsio/cxgb4vf/cxgb4vf_main.c:3253:21: note: Shado=
w variable
     struct port_info *pi =3D netdev_priv(adapter->port[pidx]);
                       ^
>> block/blk-throttle.c:1467:6: warning: Variable 'ret' is reassigned a val=
ue before the old one has been used. [redundantAssignment]
    ret =3D 0;
        ^
   block/blk-throttle.c:1453:6: note: Variable 'ret' is reassigned a value =
before the old one has been used.
    ret =3D -EINVAL;
        ^
   block/blk-throttle.c:1467:6: note: Variable 'ret' is reassigned a value =
before the old one has been used.
    ret =3D 0;
        ^
   block/blk-throttle.c:1672:7: warning: Variable 'ret' is reassigned a val=
ue before the old one has been used. [redundantAssignment]
     ret =3D -ERANGE;
         ^
   block/blk-throttle.c:1666:7: note: Variable 'ret' is reassigned a value =
before the old one has been used.
     ret =3D -EINVAL;
         ^
   block/blk-throttle.c:1672:7: note: Variable 'ret' is reassigned a value =
before the old one has been used.
     ret =3D -ERANGE;
         ^
   block/blk-throttle.c:1676:7: warning: Variable 'ret' is reassigned a val=
ue before the old one has been used. [redundantAssignment]
     ret =3D -EINVAL;
         ^
   block/blk-throttle.c:1672:7: note: Variable 'ret' is reassigned a value =
before the old one has been used.
     ret =3D -ERANGE;
         ^
   block/blk-throttle.c:1676:7: note: Variable 'ret' is reassigned a value =
before the old one has been used.
     ret =3D -EINVAL;
         ^

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3D6ccbd29ade0d159ee1be398dc9defaae567c253d
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git fetch --no-tags linux-next master
git checkout 6ccbd29ade0d159ee1be398dc9defaae567c253d
vim +/ret +1109 arch/x86/kvm/svm/nested.c

cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1054  =

cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1055  static int svm_set_nested_st=
ate(struct kvm_vcpu *vcpu,
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1056  				struct kvm_nested_state =
__user *user_kvm_nested_state,
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1057  				struct kvm_nested_state =
*kvm_state)
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1058  {
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1059  	struct vcpu_svm *svm =3D to=
_svm(vcpu);
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1060  	struct vmcb *hsave =3D svm-=
>nested.hsave;
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1061  	struct vmcb __user *user_vm=
cb =3D (struct vmcb __user *)
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1062  		&user_kvm_nested_state->da=
ta.svm[0];
6ccbd29ade0d15 Joerg Roedel  2020-09-07  1063  	struct vmcb_control_area *c=
tl;
6ccbd29ade0d15 Joerg Roedel  2020-09-07  1064  	struct vmcb_save_area *save;
6ccbd29ade0d15 Joerg Roedel  2020-09-07  1065  	int ret;
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1066  	u32 cr0;
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1067  =

6ccbd29ade0d15 Joerg Roedel  2020-09-07  1068  	BUILD_BUG_ON(sizeof(struct =
vmcb_control_area) + sizeof(struct vmcb_save_area) >
6ccbd29ade0d15 Joerg Roedel  2020-09-07  1069  		     KVM_STATE_NESTED_SVM_=
VMCB_SIZE);
6ccbd29ade0d15 Joerg Roedel  2020-09-07  1070  =

cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1071  	if (kvm_state->format !=3D =
KVM_STATE_NESTED_FORMAT_SVM)
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1072  		return -EINVAL;
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1073  =

cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1074  	if (kvm_state->flags & ~(KV=
M_STATE_NESTED_GUEST_MODE |
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1075  				 KVM_STATE_NESTED_RUN_PE=
NDING |
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1076  				 KVM_STATE_NESTED_GIF_SE=
T))
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1077  		return -EINVAL;
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1078  =

cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1079  	/*
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1080  	 * If in guest mode, vcpu->=
arch.efer actually refers to the L2 guest's
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1081  	 * EFER.SVME, but EFER.SVME=
 still has to be 1 for VMRUN to succeed.
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1082  	 */
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1083  	if (!(vcpu->arch.efer & EFE=
R_SVME)) {
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1084  		/* GIF=3D1 and no guest mo=
de are required if SVME=3D0.  */
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1085  		if (kvm_state->flags !=3D =
KVM_STATE_NESTED_GIF_SET)
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1086  			return -EINVAL;
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1087  	}
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1088  =

cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1089  	/* SMM temporarily disables=
 SVM, so we cannot be in guest mode.  */
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1090  	if (is_smm(vcpu) && (kvm_st=
ate->flags & KVM_STATE_NESTED_GUEST_MODE))
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1091  		return -EINVAL;
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1092  =

cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1093  	if (!(kvm_state->flags & KV=
M_STATE_NESTED_GUEST_MODE)) {
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1094  		svm_leave_nested(svm);
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1095  		goto out_set_gif;
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1096  	}
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1097  =

cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1098  	if (!page_address_valid(vcp=
u, kvm_state->hdr.svm.vmcb_pa))
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1099  		return -EINVAL;
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1100  	if (kvm_state->size < sizeo=
f(*kvm_state) + KVM_STATE_NESTED_SVM_VMCB_SIZE)
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1101  		return -EINVAL;
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1102  =

6ccbd29ade0d15 Joerg Roedel  2020-09-07  1103  	ret  =3D -ENOMEM;
6ccbd29ade0d15 Joerg Roedel  2020-09-07  1104  	ctl  =3D kzalloc(sizeof(*ct=
l),  GFP_KERNEL);
6ccbd29ade0d15 Joerg Roedel  2020-09-07  1105  	save =3D kzalloc(sizeof(*sa=
ve), GFP_KERNEL);
6ccbd29ade0d15 Joerg Roedel  2020-09-07  1106  	if (!ctl || !save)
6ccbd29ade0d15 Joerg Roedel  2020-09-07  1107  		goto out_free;
6ccbd29ade0d15 Joerg Roedel  2020-09-07  1108  =

6ccbd29ade0d15 Joerg Roedel  2020-09-07 @1109  	ret =3D -EFAULT;
6ccbd29ade0d15 Joerg Roedel  2020-09-07  1110  	if (copy_from_user(ctl, &us=
er_vmcb->control, sizeof(*ctl)))
6ccbd29ade0d15 Joerg Roedel  2020-09-07  1111  		goto out_free;
6ccbd29ade0d15 Joerg Roedel  2020-09-07  1112  	if (copy_from_user(save, &u=
ser_vmcb->save, sizeof(*save)))
6ccbd29ade0d15 Joerg Roedel  2020-09-07  1113  		goto out_free;
6ccbd29ade0d15 Joerg Roedel  2020-09-07  1114  =

6ccbd29ade0d15 Joerg Roedel  2020-09-07  1115  	ret =3D -EINVAL;
6ccbd29ade0d15 Joerg Roedel  2020-09-07  1116  	if (!nested_vmcb_check_cont=
rols(ctl))
6ccbd29ade0d15 Joerg Roedel  2020-09-07  1117  		goto out_free;
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1118  =

cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1119  	/*
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1120  	 * Processor state contains=
 L2 state.  Check that it is
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1121  	 * valid for guest mode (se=
e nested_vmcb_checks).
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1122  	 */
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1123  	cr0 =3D kvm_read_cr0(vcpu);
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1124          if (((cr0 & X86_CR0_=
CD) =3D=3D 0) && (cr0 & X86_CR0_NW))
6ccbd29ade0d15 Joerg Roedel  2020-09-07  1125  		goto out_free;
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1126  =

cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1127  	/*
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1128  	 * Validate host state save=
d from before VMRUN (see
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1129  	 * nested_svm_check_permiss=
ions).
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1130  	 * TODO: validate reserved =
bits for all saved state.
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1131  	 */
6ccbd29ade0d15 Joerg Roedel  2020-09-07  1132  	if (!(save->cr0 & X86_CR0_P=
G))
6ccbd29ade0d15 Joerg Roedel  2020-09-07  1133  		goto out_free;
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1134  =

cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1135  	/*
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1136  	 * All checks done, we can =
enter guest mode.  L1 control fields
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1137  	 * come from the nested sav=
e state.  Guest state is already
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1138  	 * in the registers, the sa=
ve area of the nested state instead
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1139  	 * contains saved L1 state.
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1140  	 */
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1141  	copy_vmcb_control_area(&hsa=
ve->control, &svm->vmcb->control);
6ccbd29ade0d15 Joerg Roedel  2020-09-07  1142  	hsave->save =3D *save;
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1143  =

cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1144  	svm->nested.vmcb =3D kvm_st=
ate->hdr.svm.vmcb_pa;
6ccbd29ade0d15 Joerg Roedel  2020-09-07  1145  	load_nested_vmcb_control(sv=
m, ctl);
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1146  	nested_prepare_vmcb_control=
(svm);
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1147  =

cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1148  out_set_gif:
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1149  	svm_set_gif(svm, !!(kvm_sta=
te->flags & KVM_STATE_NESTED_GIF_SET));
6ccbd29ade0d15 Joerg Roedel  2020-09-07  1150  =

6ccbd29ade0d15 Joerg Roedel  2020-09-07  1151  	ret =3D 0;
6ccbd29ade0d15 Joerg Roedel  2020-09-07  1152  out_free:
6ccbd29ade0d15 Joerg Roedel  2020-09-07  1153  	kfree(save);
6ccbd29ade0d15 Joerg Roedel  2020-09-07  1154  	kfree(ctl);
6ccbd29ade0d15 Joerg Roedel  2020-09-07  1155  =

6ccbd29ade0d15 Joerg Roedel  2020-09-07  1156  	return ret;
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1157  }
cc440cdad5b7a4 Paolo Bonzini 2020-05-13  1158  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4798195628685545127==--

