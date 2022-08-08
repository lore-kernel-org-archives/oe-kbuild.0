Content-Type: multipart/mixed; boundary="===============7640273687739264560=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kvm/x86.c:4988 kvm_arch_tsc_set_attr() warn: check for integer overflow 'offset'
Date: Mon, 08 Aug 2022 22:20:09 +0800
Message-ID: <202208082240.2wKJ0aav-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7640273687739264560==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Oliver Upton <oupton@google.com>
CC: Paolo Bonzini <pbonzini@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4e23eeebb2e57f5a28b36221aa776b5a1122dde5
commit: 828ca89628bfcb1b8f27535025f69dd00eb55207 KVM: x86: Expose TSC offse=
t controls to userspace
date:   10 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-m021-20220808 (https://download.01.org/0day-ci/arch=
ive/20220808/202208082240.2wKJ0aav-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
arch/x86/kvm/x86.c:4988 kvm_arch_tsc_set_attr() warn: check for integer ove=
rflow 'offset'
arch/x86/kvm/x86.c:5029 kvm_vcpu_ioctl_device_attr() error: uninitialized s=
ymbol 'r'.

Old smatch warnings:
arch/x86/kvm/x86.c:9320 enter_smm() warn: inconsistent indenting

vim +/offset +4988 arch/x86/kvm/x86.c

828ca89628bfcb Oliver Upton 2021-09-16  4961  =

828ca89628bfcb Oliver Upton 2021-09-16  4962  static int kvm_arch_tsc_set_a=
ttr(struct kvm_vcpu *vcpu,
828ca89628bfcb Oliver Upton 2021-09-16  4963  				 struct kvm_device_attr *=
attr)
828ca89628bfcb Oliver Upton 2021-09-16  4964  {
828ca89628bfcb Oliver Upton 2021-09-16  4965  	u64 __user *uaddr =3D (u64 _=
_user *)(unsigned long)attr->addr;
828ca89628bfcb Oliver Upton 2021-09-16  4966  	struct kvm *kvm =3D vcpu->kv=
m;
828ca89628bfcb Oliver Upton 2021-09-16  4967  	int r;
828ca89628bfcb Oliver Upton 2021-09-16  4968  =

828ca89628bfcb Oliver Upton 2021-09-16  4969  	if ((u64)(unsigned long)uadd=
r !=3D attr->addr)
828ca89628bfcb Oliver Upton 2021-09-16  4970  		return -EFAULT;
828ca89628bfcb Oliver Upton 2021-09-16  4971  =

828ca89628bfcb Oliver Upton 2021-09-16  4972  	switch (attr->attr) {
828ca89628bfcb Oliver Upton 2021-09-16  4973  	case KVM_VCPU_TSC_OFFSET: {
828ca89628bfcb Oliver Upton 2021-09-16  4974  		u64 offset, tsc, ns;
828ca89628bfcb Oliver Upton 2021-09-16  4975  		unsigned long flags;
828ca89628bfcb Oliver Upton 2021-09-16  4976  		bool matched;
828ca89628bfcb Oliver Upton 2021-09-16  4977  =

828ca89628bfcb Oliver Upton 2021-09-16  4978  		r =3D -EFAULT;
828ca89628bfcb Oliver Upton 2021-09-16  4979  		if (get_user(offset, uaddr))
828ca89628bfcb Oliver Upton 2021-09-16  4980  			break;
828ca89628bfcb Oliver Upton 2021-09-16  4981  =

828ca89628bfcb Oliver Upton 2021-09-16  4982  		raw_spin_lock_irqsave(&kvm-=
>arch.tsc_write_lock, flags);
828ca89628bfcb Oliver Upton 2021-09-16  4983  =

828ca89628bfcb Oliver Upton 2021-09-16  4984  		matched =3D (vcpu->arch.vir=
tual_tsc_khz &&
828ca89628bfcb Oliver Upton 2021-09-16  4985  			   kvm->arch.last_tsc_khz =
=3D=3D vcpu->arch.virtual_tsc_khz &&
828ca89628bfcb Oliver Upton 2021-09-16  4986  			   kvm->arch.last_tsc_offs=
et =3D=3D offset);
828ca89628bfcb Oliver Upton 2021-09-16  4987  =

828ca89628bfcb Oliver Upton 2021-09-16 @4988  		tsc =3D kvm_scale_tsc(vcpu,=
 rdtsc(), vcpu->arch.l1_tsc_scaling_ratio) + offset;
828ca89628bfcb Oliver Upton 2021-09-16  4989  		ns =3D get_kvmclock_base_ns=
();
828ca89628bfcb Oliver Upton 2021-09-16  4990  =

828ca89628bfcb Oliver Upton 2021-09-16  4991  		__kvm_synchronize_tsc(vcpu,=
 offset, tsc, ns, matched);
828ca89628bfcb Oliver Upton 2021-09-16  4992  		raw_spin_unlock_irqrestore(=
&kvm->arch.tsc_write_lock, flags);
828ca89628bfcb Oliver Upton 2021-09-16  4993  =

828ca89628bfcb Oliver Upton 2021-09-16  4994  		r =3D 0;
828ca89628bfcb Oliver Upton 2021-09-16  4995  		break;
828ca89628bfcb Oliver Upton 2021-09-16  4996  	}
828ca89628bfcb Oliver Upton 2021-09-16  4997  	default:
828ca89628bfcb Oliver Upton 2021-09-16  4998  		r =3D -ENXIO;
828ca89628bfcb Oliver Upton 2021-09-16  4999  	}
828ca89628bfcb Oliver Upton 2021-09-16  5000  =

828ca89628bfcb Oliver Upton 2021-09-16  5001  	return r;
828ca89628bfcb Oliver Upton 2021-09-16  5002  }
828ca89628bfcb Oliver Upton 2021-09-16  5003  =

828ca89628bfcb Oliver Upton 2021-09-16  5004  static int kvm_vcpu_ioctl_dev=
ice_attr(struct kvm_vcpu *vcpu,
828ca89628bfcb Oliver Upton 2021-09-16  5005  				      unsigned int ioctl,
828ca89628bfcb Oliver Upton 2021-09-16  5006  				      void __user *argp)
828ca89628bfcb Oliver Upton 2021-09-16  5007  {
828ca89628bfcb Oliver Upton 2021-09-16  5008  	struct kvm_device_attr attr;
828ca89628bfcb Oliver Upton 2021-09-16  5009  	int r;
828ca89628bfcb Oliver Upton 2021-09-16  5010  =

828ca89628bfcb Oliver Upton 2021-09-16  5011  	if (copy_from_user(&attr, ar=
gp, sizeof(attr)))
828ca89628bfcb Oliver Upton 2021-09-16  5012  		return -EFAULT;
828ca89628bfcb Oliver Upton 2021-09-16  5013  =

828ca89628bfcb Oliver Upton 2021-09-16  5014  	if (attr.group !=3D KVM_VCPU=
_TSC_CTRL)
828ca89628bfcb Oliver Upton 2021-09-16  5015  		return -ENXIO;
828ca89628bfcb Oliver Upton 2021-09-16  5016  =

828ca89628bfcb Oliver Upton 2021-09-16  5017  	switch (ioctl) {
828ca89628bfcb Oliver Upton 2021-09-16  5018  	case KVM_HAS_DEVICE_ATTR:
828ca89628bfcb Oliver Upton 2021-09-16  5019  		r =3D kvm_arch_tsc_has_attr=
(vcpu, &attr);
828ca89628bfcb Oliver Upton 2021-09-16  5020  		break;
828ca89628bfcb Oliver Upton 2021-09-16  5021  	case KVM_GET_DEVICE_ATTR:
828ca89628bfcb Oliver Upton 2021-09-16  5022  		r =3D kvm_arch_tsc_get_attr=
(vcpu, &attr);
828ca89628bfcb Oliver Upton 2021-09-16  5023  		break;
828ca89628bfcb Oliver Upton 2021-09-16  5024  	case KVM_SET_DEVICE_ATTR:
828ca89628bfcb Oliver Upton 2021-09-16  5025  		r =3D kvm_arch_tsc_set_attr=
(vcpu, &attr);
828ca89628bfcb Oliver Upton 2021-09-16  5026  		break;
828ca89628bfcb Oliver Upton 2021-09-16  5027  	}
828ca89628bfcb Oliver Upton 2021-09-16  5028  =

828ca89628bfcb Oliver Upton 2021-09-16 @5029  	return r;
828ca89628bfcb Oliver Upton 2021-09-16  5030  }
828ca89628bfcb Oliver Upton 2021-09-16  5031  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7640273687739264560==--

