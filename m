Content-Type: multipart/mixed; boundary="===============5530460280300534340=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 142/314] arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4971:1: sparse: sparse: unused label 'arch_vm_ioctl'
Date: Wed, 24 Aug 2022 10:46:54 +0800
Message-ID: <202208241009.i6K5EHGl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5530460280300534340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4971:1: sparse: sparse: unused=
 label 'arch_vm_ioctl'"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Chao Peng <chao.p.peng@linux.intel.com>
CC: Isaku Yamahata <isaku.yamahata@intel.com>

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   552dd80c48f67ca01bcdd10667e0c11efd375177
commit: 303b911206dd2a12b1a4fdee94044dc5a6fa36a3 [142/314] KVM: Register/un=
register the guest private memory regions
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: riscv-randconfig-s032-20220824 (https://download.01.org/0day-ci/arc=
hive/20220824/202208241009.i6K5EHGl-lkp(a)intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel/tdx/commit/303b911206dd2a12b1a4fdee94044=
dc5a6fa36a3
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 303b911206dd2a12b1a4fdee94044dc5a6fa36a3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dr=
iscv SHELL=3D/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zihintpause'
>> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4971:1: sparse: sparse: unus=
ed label 'arch_vm_ioctl'
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c: note: in included file:
   include/linux/kvm_host.h:1952:54: sparse: sparse: array of flexible stru=
ctures
   include/linux/kvm_host.h:1954:56: sparse: sparse: array of flexible stru=
ctures
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:597:9: sparse: sparse: conte=
xt imbalance in 'kvm_mmu_notifier_change_pte' - different lock contexts for=
 basic block
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:597:9: sparse: sparse: conte=
xt imbalance in 'kvm_mmu_notifier_invalidate_range_start' - different lock =
contexts for basic block
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:597:9: sparse: sparse: conte=
xt imbalance in 'kvm_mmu_notifier_invalidate_range_end' - different lock co=
ntexts for basic block
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:597:9: sparse: sparse: conte=
xt imbalance in 'kvm_mmu_notifier_clear_flush_young' - different lock conte=
xts for basic block
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:597:9: sparse: sparse: conte=
xt imbalance in 'kvm_mmu_notifier_clear_young' - different lock contexts fo=
r basic block
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:597:9: sparse: sparse: conte=
xt imbalance in 'kvm_mmu_notifier_test_young' - different lock contexts for=
 basic block
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:2727:9: sparse: sparse: cont=
ext imbalance in 'hva_to_pfn_remapped' - unexpected unlock

vim +/arch_vm_ioctl +4971 arch/riscv/kvm/../../../virt/kvm/kvm_main.c

a4ec3c29649907 virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4747  =

bccf2150fe62dd drivers/kvm/kvm_main.c Avi Kivity        2007-02-21  4748  s=
tatic long kvm_vm_ioctl(struct file *filp,
bccf2150fe62dd drivers/kvm/kvm_main.c Avi Kivity        2007-02-21  4749  	=
		   unsigned int ioctl, unsigned long arg)
bccf2150fe62dd drivers/kvm/kvm_main.c Avi Kivity        2007-02-21  4750  {
bccf2150fe62dd drivers/kvm/kvm_main.c Avi Kivity        2007-02-21  4751  	=
struct kvm *kvm =3D filp->private_data;
bccf2150fe62dd drivers/kvm/kvm_main.c Avi Kivity        2007-02-21  4752  	=
void __user *argp =3D (void __user *)arg;
1fe779f8eccd16 drivers/kvm/kvm_main.c Carsten Otte      2007-10-29  4753  	=
int r;
bccf2150fe62dd drivers/kvm/kvm_main.c Avi Kivity        2007-02-21  4754  =

f4d316537059b2 virt/kvm/kvm_main.c    Paolo Bonzini     2021-11-11  4755  	=
if (kvm->mm !=3D current->mm || kvm->vm_dead)
6d4e4c4fca5be8 drivers/kvm/kvm_main.c Avi Kivity        2007-11-21  4756  	=
	return -EIO;
bccf2150fe62dd drivers/kvm/kvm_main.c Avi Kivity        2007-02-21  4757  	=
switch (ioctl) {
bccf2150fe62dd drivers/kvm/kvm_main.c Avi Kivity        2007-02-21  4758  	=
case KVM_CREATE_VCPU:
bccf2150fe62dd drivers/kvm/kvm_main.c Avi Kivity        2007-02-21  4759  	=
	r =3D kvm_vm_ioctl_create_vcpu(kvm, arg);
bccf2150fe62dd drivers/kvm/kvm_main.c Avi Kivity        2007-02-21  4760  	=
	break;
e5d83c74a5800c virt/kvm/kvm_main.c    Paolo Bonzini     2017-02-16  4761  	=
case KVM_ENABLE_CAP: {
e5d83c74a5800c virt/kvm/kvm_main.c    Paolo Bonzini     2017-02-16  4762  	=
	struct kvm_enable_cap cap;
e5d83c74a5800c virt/kvm/kvm_main.c    Paolo Bonzini     2017-02-16  4763  =

e5d83c74a5800c virt/kvm/kvm_main.c    Paolo Bonzini     2017-02-16  4764  	=
	r =3D -EFAULT;
e5d83c74a5800c virt/kvm/kvm_main.c    Paolo Bonzini     2017-02-16  4765  	=
	if (copy_from_user(&cap, argp, sizeof(cap)))
e5d83c74a5800c virt/kvm/kvm_main.c    Paolo Bonzini     2017-02-16  4766  	=
		goto out;
e5d83c74a5800c virt/kvm/kvm_main.c    Paolo Bonzini     2017-02-16  4767  	=
	r =3D kvm_vm_ioctl_enable_cap_generic(kvm, &cap);
e5d83c74a5800c virt/kvm/kvm_main.c    Paolo Bonzini     2017-02-16  4768  	=
	break;
e5d83c74a5800c virt/kvm/kvm_main.c    Paolo Bonzini     2017-02-16  4769  	}
6fc138d2278078 drivers/kvm/kvm_main.c Izik Eidus        2007-10-09  4770  	=
case KVM_SET_USER_MEMORY_REGION: {
a4ec3c29649907 virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4771  	=
	struct kvm_user_mem_region mem;
a4ec3c29649907 virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4772  	=
	unsigned long size;
a4ec3c29649907 virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4773  	=
	u32 flags;
a4ec3c29649907 virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4774  =

a4ec3c29649907 virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4775  	=
	kvm_sanity_check_user_mem_region_alias();
a4ec3c29649907 virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4776  =

a4ec3c29649907 virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4777  	=
	memset(&mem, 0, sizeof(mem));
6fc138d2278078 drivers/kvm/kvm_main.c Izik Eidus        2007-10-09  4778  =

6fc138d2278078 drivers/kvm/kvm_main.c Izik Eidus        2007-10-09  4779  	=
	r =3D -EFAULT;
a4ec3c29649907 virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4780  =

a4ec3c29649907 virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4781  	=
	if (get_user(flags,
a4ec3c29649907 virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4782  	=
		(u32 __user *)(argp + offsetof(typeof(mem), flags))))
a4ec3c29649907 virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4783  	=
		goto out;
a4ec3c29649907 virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4784  =

a4ec3c29649907 virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4785  	=
	if (flags & KVM_MEM_PRIVATE) {
a4ec3c29649907 virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4786  	=
		r =3D -EINVAL;
a4ec3c29649907 virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4787  	=
		goto out;
a4ec3c29649907 virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4788  	=
	}
a4ec3c29649907 virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4789  =

a4ec3c29649907 virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4790  	=
	size =3D sizeof(struct kvm_userspace_memory_region);
a4ec3c29649907 virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4791  =

a4ec3c29649907 virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4792  	=
	if (copy_from_user(&mem, argp, size))
a4ec3c29649907 virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4793  	=
		goto out;
a4ec3c29649907 virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4794  =

a4ec3c29649907 virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4795  	=
	r =3D -EINVAL;
a4ec3c29649907 virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4796  	=
	if ((flags ^ mem.flags) & KVM_MEM_PRIVATE)
6fc138d2278078 drivers/kvm/kvm_main.c Izik Eidus        2007-10-09  4797  	=
		goto out;
6fc138d2278078 drivers/kvm/kvm_main.c Izik Eidus        2007-10-09  4798  =

a4ec3c29649907 virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4799  	=
	r =3D kvm_vm_ioctl_set_memory_region(kvm, &mem);
6aa8b732ca01c3 drivers/kvm/kvm_main.c Avi Kivity        2006-12-10  4800  	=
	break;
6aa8b732ca01c3 drivers/kvm/kvm_main.c Avi Kivity        2006-12-10  4801  	}
303b911206dd2a virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4802  #=
ifdef CONFIG_HAVE_KVM_PRIVATE_MEM
303b911206dd2a virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4803  	=
case KVM_MEMORY_ENCRYPT_REG_REGION:
303b911206dd2a virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4804  	=
case KVM_MEMORY_ENCRYPT_UNREG_REGION: {
303b911206dd2a virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4805  	=
	struct kvm_enc_region region;
303b911206dd2a virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4806  =

303b911206dd2a virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4807  	=
	if (!kvm_arch_private_mem_supported(kvm))
303b911206dd2a virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4808  	=
		goto arch_vm_ioctl;
303b911206dd2a virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4809  =

303b911206dd2a virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4810  	=
	r =3D -EFAULT;
303b911206dd2a virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4811  	=
	if (copy_from_user(&region, argp, sizeof(region)))
303b911206dd2a virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4812  	=
		goto out;
303b911206dd2a virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4813  =

303b911206dd2a virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4814  	=
	r =3D kvm_vm_ioctl_set_encrypted_region(kvm, ioctl, &region);
303b911206dd2a virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4815  	=
	break;
303b911206dd2a virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4816  	}
303b911206dd2a virt/kvm/kvm_main.c    Chao Peng         2022-07-06  4817  #=
endif
6aa8b732ca01c3 drivers/kvm/kvm_main.c Avi Kivity        2006-12-10  4818  	=
case KVM_GET_DIRTY_LOG: {
6aa8b732ca01c3 drivers/kvm/kvm_main.c Avi Kivity        2006-12-10  4819  	=
	struct kvm_dirty_log log;
6aa8b732ca01c3 drivers/kvm/kvm_main.c Avi Kivity        2006-12-10  4820  =

6aa8b732ca01c3 drivers/kvm/kvm_main.c Avi Kivity        2006-12-10  4821  	=
	r =3D -EFAULT;
893bdbf16574e7 virt/kvm/kvm_main.c    Xiubo Li          2015-02-26  4822  	=
	if (copy_from_user(&log, argp, sizeof(log)))
6aa8b732ca01c3 drivers/kvm/kvm_main.c Avi Kivity        2006-12-10  4823  	=
		goto out;
2c6f5df9793e6f drivers/kvm/kvm_main.c Avi Kivity        2007-02-20  4824  	=
	r =3D kvm_vm_ioctl_get_dirty_log(kvm, &log);
6aa8b732ca01c3 drivers/kvm/kvm_main.c Avi Kivity        2006-12-10  4825  	=
	break;
6aa8b732ca01c3 drivers/kvm/kvm_main.c Avi Kivity        2006-12-10  4826  	}
2a31b9db153530 virt/kvm/kvm_main.c    Paolo Bonzini     2018-10-23  4827  #=
ifdef CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT
2a31b9db153530 virt/kvm/kvm_main.c    Paolo Bonzini     2018-10-23  4828  	=
case KVM_CLEAR_DIRTY_LOG: {
2a31b9db153530 virt/kvm/kvm_main.c    Paolo Bonzini     2018-10-23  4829  	=
	struct kvm_clear_dirty_log log;
2a31b9db153530 virt/kvm/kvm_main.c    Paolo Bonzini     2018-10-23  4830  =

2a31b9db153530 virt/kvm/kvm_main.c    Paolo Bonzini     2018-10-23  4831  	=
	r =3D -EFAULT;
2a31b9db153530 virt/kvm/kvm_main.c    Paolo Bonzini     2018-10-23  4832  	=
	if (copy_from_user(&log, argp, sizeof(log)))
2a31b9db153530 virt/kvm/kvm_main.c    Paolo Bonzini     2018-10-23  4833  	=
		goto out;
2a31b9db153530 virt/kvm/kvm_main.c    Paolo Bonzini     2018-10-23  4834  	=
	r =3D kvm_vm_ioctl_clear_dirty_log(kvm, &log);
2a31b9db153530 virt/kvm/kvm_main.c    Paolo Bonzini     2018-10-23  4835  	=
	break;
2a31b9db153530 virt/kvm/kvm_main.c    Paolo Bonzini     2018-10-23  4836  	}
2a31b9db153530 virt/kvm/kvm_main.c    Paolo Bonzini     2018-10-23  4837  #=
endif
4b4357e02523ec virt/kvm/kvm_main.c    Paolo Bonzini     2017-03-31  4838  #=
ifdef CONFIG_KVM_MMIO
5f94c1741bdc7a virt/kvm/kvm_main.c    Laurent Vivier    2008-05-30  4839  	=
case KVM_REGISTER_COALESCED_MMIO: {
5f94c1741bdc7a virt/kvm/kvm_main.c    Laurent Vivier    2008-05-30  4840  	=
	struct kvm_coalesced_mmio_zone zone;
f95ef0cd025785 virt/kvm/kvm_main.c    Xiubo Li          2015-02-26  4841  =

5f94c1741bdc7a virt/kvm/kvm_main.c    Laurent Vivier    2008-05-30  4842  	=
	r =3D -EFAULT;
893bdbf16574e7 virt/kvm/kvm_main.c    Xiubo Li          2015-02-26  4843  	=
	if (copy_from_user(&zone, argp, sizeof(zone)))
5f94c1741bdc7a virt/kvm/kvm_main.c    Laurent Vivier    2008-05-30  4844  	=
		goto out;
5f94c1741bdc7a virt/kvm/kvm_main.c    Laurent Vivier    2008-05-30  4845  	=
	r =3D kvm_vm_ioctl_register_coalesced_mmio(kvm, &zone);
5f94c1741bdc7a virt/kvm/kvm_main.c    Laurent Vivier    2008-05-30  4846  	=
	break;
5f94c1741bdc7a virt/kvm/kvm_main.c    Laurent Vivier    2008-05-30  4847  	}
5f94c1741bdc7a virt/kvm/kvm_main.c    Laurent Vivier    2008-05-30  4848  	=
case KVM_UNREGISTER_COALESCED_MMIO: {
5f94c1741bdc7a virt/kvm/kvm_main.c    Laurent Vivier    2008-05-30  4849  	=
	struct kvm_coalesced_mmio_zone zone;
f95ef0cd025785 virt/kvm/kvm_main.c    Xiubo Li          2015-02-26  4850  =

5f94c1741bdc7a virt/kvm/kvm_main.c    Laurent Vivier    2008-05-30  4851  	=
	r =3D -EFAULT;
893bdbf16574e7 virt/kvm/kvm_main.c    Xiubo Li          2015-02-26  4852  	=
	if (copy_from_user(&zone, argp, sizeof(zone)))
5f94c1741bdc7a virt/kvm/kvm_main.c    Laurent Vivier    2008-05-30  4853  	=
		goto out;
5f94c1741bdc7a virt/kvm/kvm_main.c    Laurent Vivier    2008-05-30  4854  	=
	r =3D kvm_vm_ioctl_unregister_coalesced_mmio(kvm, &zone);
5f94c1741bdc7a virt/kvm/kvm_main.c    Laurent Vivier    2008-05-30  4855  	=
	break;
5f94c1741bdc7a virt/kvm/kvm_main.c    Laurent Vivier    2008-05-30  4856  	}
5f94c1741bdc7a virt/kvm/kvm_main.c    Laurent Vivier    2008-05-30  4857  #=
endif
721eecbf4fe995 virt/kvm/kvm_main.c    Gregory Haskins   2009-05-20  4858  	=
case KVM_IRQFD: {
721eecbf4fe995 virt/kvm/kvm_main.c    Gregory Haskins   2009-05-20  4859  	=
	struct kvm_irqfd data;
721eecbf4fe995 virt/kvm/kvm_main.c    Gregory Haskins   2009-05-20  4860  =

721eecbf4fe995 virt/kvm/kvm_main.c    Gregory Haskins   2009-05-20  4861  	=
	r =3D -EFAULT;
893bdbf16574e7 virt/kvm/kvm_main.c    Xiubo Li          2015-02-26  4862  	=
	if (copy_from_user(&data, argp, sizeof(data)))
721eecbf4fe995 virt/kvm/kvm_main.c    Gregory Haskins   2009-05-20  4863  	=
		goto out;
d4db2935e4fffe virt/kvm/kvm_main.c    Alex Williamson   2012-06-29  4864  	=
	r =3D kvm_irqfd(kvm, &data);
721eecbf4fe995 virt/kvm/kvm_main.c    Gregory Haskins   2009-05-20  4865  	=
	break;
721eecbf4fe995 virt/kvm/kvm_main.c    Gregory Haskins   2009-05-20  4866  	}
d34e6b175e6182 virt/kvm/kvm_main.c    Gregory Haskins   2009-07-07  4867  	=
case KVM_IOEVENTFD: {
d34e6b175e6182 virt/kvm/kvm_main.c    Gregory Haskins   2009-07-07  4868  	=
	struct kvm_ioeventfd data;
d34e6b175e6182 virt/kvm/kvm_main.c    Gregory Haskins   2009-07-07  4869  =

d34e6b175e6182 virt/kvm/kvm_main.c    Gregory Haskins   2009-07-07  4870  	=
	r =3D -EFAULT;
893bdbf16574e7 virt/kvm/kvm_main.c    Xiubo Li          2015-02-26  4871  	=
	if (copy_from_user(&data, argp, sizeof(data)))
d34e6b175e6182 virt/kvm/kvm_main.c    Gregory Haskins   2009-07-07  4872  	=
		goto out;
d34e6b175e6182 virt/kvm/kvm_main.c    Gregory Haskins   2009-07-07  4873  	=
	r =3D kvm_ioeventfd(kvm, &data);
d34e6b175e6182 virt/kvm/kvm_main.c    Gregory Haskins   2009-07-07  4874  	=
	break;
d34e6b175e6182 virt/kvm/kvm_main.c    Gregory Haskins   2009-07-07  4875  	}
07975ad3b30579 virt/kvm/kvm_main.c    Jan Kiszka        2012-03-29  4876  #=
ifdef CONFIG_HAVE_KVM_MSI
07975ad3b30579 virt/kvm/kvm_main.c    Jan Kiszka        2012-03-29  4877  	=
case KVM_SIGNAL_MSI: {
07975ad3b30579 virt/kvm/kvm_main.c    Jan Kiszka        2012-03-29  4878  	=
	struct kvm_msi msi;
07975ad3b30579 virt/kvm/kvm_main.c    Jan Kiszka        2012-03-29  4879  =

07975ad3b30579 virt/kvm/kvm_main.c    Jan Kiszka        2012-03-29  4880  	=
	r =3D -EFAULT;
893bdbf16574e7 virt/kvm/kvm_main.c    Xiubo Li          2015-02-26  4881  	=
	if (copy_from_user(&msi, argp, sizeof(msi)))
07975ad3b30579 virt/kvm/kvm_main.c    Jan Kiszka        2012-03-29  4882  	=
		goto out;
07975ad3b30579 virt/kvm/kvm_main.c    Jan Kiszka        2012-03-29  4883  	=
	r =3D kvm_send_userspace_msi(kvm, &msi);
07975ad3b30579 virt/kvm/kvm_main.c    Jan Kiszka        2012-03-29  4884  	=
	break;
07975ad3b30579 virt/kvm/kvm_main.c    Jan Kiszka        2012-03-29  4885  	}
23d43cf998275b virt/kvm/kvm_main.c    Christoffer Dall  2012-07-24  4886  #=
endif
23d43cf998275b virt/kvm/kvm_main.c    Christoffer Dall  2012-07-24  4887  #=
ifdef __KVM_HAVE_IRQ_LINE
23d43cf998275b virt/kvm/kvm_main.c    Christoffer Dall  2012-07-24  4888  	=
case KVM_IRQ_LINE_STATUS:
23d43cf998275b virt/kvm/kvm_main.c    Christoffer Dall  2012-07-24  4889  	=
case KVM_IRQ_LINE: {
23d43cf998275b virt/kvm/kvm_main.c    Christoffer Dall  2012-07-24  4890  	=
	struct kvm_irq_level irq_event;
23d43cf998275b virt/kvm/kvm_main.c    Christoffer Dall  2012-07-24  4891  =

23d43cf998275b virt/kvm/kvm_main.c    Christoffer Dall  2012-07-24  4892  	=
	r =3D -EFAULT;
893bdbf16574e7 virt/kvm/kvm_main.c    Xiubo Li          2015-02-26  4893  	=
	if (copy_from_user(&irq_event, argp, sizeof(irq_event)))
23d43cf998275b virt/kvm/kvm_main.c    Christoffer Dall  2012-07-24  4894  	=
		goto out;
23d43cf998275b virt/kvm/kvm_main.c    Christoffer Dall  2012-07-24  4895  =

aa2fbe6d448920 virt/kvm/kvm_main.c    Yang Zhang        2013-04-11  4896  	=
	r =3D kvm_vm_ioctl_irq_line(kvm, &irq_event,
aa2fbe6d448920 virt/kvm/kvm_main.c    Yang Zhang        2013-04-11  4897  	=
				ioctl =3D=3D KVM_IRQ_LINE_STATUS);
23d43cf998275b virt/kvm/kvm_main.c    Christoffer Dall  2012-07-24  4898  	=
	if (r)
23d43cf998275b virt/kvm/kvm_main.c    Christoffer Dall  2012-07-24  4899  	=
		goto out;
23d43cf998275b virt/kvm/kvm_main.c    Christoffer Dall  2012-07-24  4900  =

23d43cf998275b virt/kvm/kvm_main.c    Christoffer Dall  2012-07-24  4901  	=
	r =3D -EFAULT;
23d43cf998275b virt/kvm/kvm_main.c    Christoffer Dall  2012-07-24  4902  	=
	if (ioctl =3D=3D KVM_IRQ_LINE_STATUS) {
893bdbf16574e7 virt/kvm/kvm_main.c    Xiubo Li          2015-02-26  4903  	=
		if (copy_to_user(argp, &irq_event, sizeof(irq_event)))
23d43cf998275b virt/kvm/kvm_main.c    Christoffer Dall  2012-07-24  4904  	=
			goto out;
23d43cf998275b virt/kvm/kvm_main.c    Christoffer Dall  2012-07-24  4905  	=
	}
23d43cf998275b virt/kvm/kvm_main.c    Christoffer Dall  2012-07-24  4906  =

23d43cf998275b virt/kvm/kvm_main.c    Christoffer Dall  2012-07-24  4907  	=
	r =3D 0;
23d43cf998275b virt/kvm/kvm_main.c    Christoffer Dall  2012-07-24  4908  	=
	break;
23d43cf998275b virt/kvm/kvm_main.c    Christoffer Dall  2012-07-24  4909  	}
73880c80aa9c8d virt/kvm/kvm_main.c    Gleb Natapov      2009-06-09  4910  #=
endif
aa8d5944b8b280 virt/kvm/kvm_main.c    Alexander Graf    2013-04-15  4911  #=
ifdef CONFIG_HAVE_KVM_IRQ_ROUTING
aa8d5944b8b280 virt/kvm/kvm_main.c    Alexander Graf    2013-04-15  4912  	=
case KVM_SET_GSI_ROUTING: {
aa8d5944b8b280 virt/kvm/kvm_main.c    Alexander Graf    2013-04-15  4913  	=
	struct kvm_irq_routing routing;
aa8d5944b8b280 virt/kvm/kvm_main.c    Alexander Graf    2013-04-15  4914  	=
	struct kvm_irq_routing __user *urouting;
f8c1b85b2523da virt/kvm/kvm_main.c    Paolo Bonzini     2016-06-01  4915  	=
	struct kvm_irq_routing_entry *entries =3D NULL;
aa8d5944b8b280 virt/kvm/kvm_main.c    Alexander Graf    2013-04-15  4916  =

aa8d5944b8b280 virt/kvm/kvm_main.c    Alexander Graf    2013-04-15  4917  	=
	r =3D -EFAULT;
aa8d5944b8b280 virt/kvm/kvm_main.c    Alexander Graf    2013-04-15  4918  	=
	if (copy_from_user(&routing, argp, sizeof(routing)))
aa8d5944b8b280 virt/kvm/kvm_main.c    Alexander Graf    2013-04-15  4919  	=
		goto out;
aa8d5944b8b280 virt/kvm/kvm_main.c    Alexander Graf    2013-04-15  4920  	=
	r =3D -EINVAL;
5c0aea0e8d98e3 virt/kvm/kvm_main.c    David Hildenbrand 2017-04-28  4921  	=
	if (!kvm_arch_can_set_irq_routing(kvm))
5c0aea0e8d98e3 virt/kvm/kvm_main.c    David Hildenbrand 2017-04-28  4922  	=
		goto out;
caf1ff26e1aa17 virt/kvm/kvm_main.c    Xiubo Li          2016-06-15  4923  	=
	if (routing.nr > KVM_MAX_IRQ_ROUTES)
aa8d5944b8b280 virt/kvm/kvm_main.c    Alexander Graf    2013-04-15  4924  	=
		goto out;
aa8d5944b8b280 virt/kvm/kvm_main.c    Alexander Graf    2013-04-15  4925  	=
	if (routing.flags)
aa8d5944b8b280 virt/kvm/kvm_main.c    Alexander Graf    2013-04-15  4926  	=
		goto out;
f8c1b85b2523da virt/kvm/kvm_main.c    Paolo Bonzini     2016-06-01  4927  	=
	if (routing.nr) {
7ec28e264f2e52 virt/kvm/kvm_main.c    Denis Efremov     2020-06-03  4928  	=
		urouting =3D argp;
7ec28e264f2e52 virt/kvm/kvm_main.c    Denis Efremov     2020-06-03  4929  	=
		entries =3D vmemdup_user(urouting->entries,
7ec28e264f2e52 virt/kvm/kvm_main.c    Denis Efremov     2020-06-03  4930  	=
				       array_size(sizeof(*entries),
42bc47b35320e0 virt/kvm/kvm_main.c    Kees Cook         2018-06-12  4931  	=
						  routing.nr));
7ec28e264f2e52 virt/kvm/kvm_main.c    Denis Efremov     2020-06-03  4932  	=
		if (IS_ERR(entries)) {
7ec28e264f2e52 virt/kvm/kvm_main.c    Denis Efremov     2020-06-03  4933  	=
			r =3D PTR_ERR(entries);
aa8d5944b8b280 virt/kvm/kvm_main.c    Alexander Graf    2013-04-15  4934  	=
			goto out;
7ec28e264f2e52 virt/kvm/kvm_main.c    Denis Efremov     2020-06-03  4935  	=
		}
f8c1b85b2523da virt/kvm/kvm_main.c    Paolo Bonzini     2016-06-01  4936  	=
	}
aa8d5944b8b280 virt/kvm/kvm_main.c    Alexander Graf    2013-04-15  4937  	=
	r =3D kvm_set_irq_routing(kvm, entries, routing.nr,
aa8d5944b8b280 virt/kvm/kvm_main.c    Alexander Graf    2013-04-15  4938  	=
				routing.flags);
7ec28e264f2e52 virt/kvm/kvm_main.c    Denis Efremov     2020-06-03  4939  	=
	kvfree(entries);
aa8d5944b8b280 virt/kvm/kvm_main.c    Alexander Graf    2013-04-15  4940  	=
	break;
aa8d5944b8b280 virt/kvm/kvm_main.c    Alexander Graf    2013-04-15  4941  	}
aa8d5944b8b280 virt/kvm/kvm_main.c    Alexander Graf    2013-04-15  4942  #=
endif /* CONFIG_HAVE_KVM_IRQ_ROUTING */
852b6d57dc7fa3 virt/kvm/kvm_main.c    Scott Wood        2013-04-12  4943  	=
case KVM_CREATE_DEVICE: {
852b6d57dc7fa3 virt/kvm/kvm_main.c    Scott Wood        2013-04-12  4944  	=
	struct kvm_create_device cd;
852b6d57dc7fa3 virt/kvm/kvm_main.c    Scott Wood        2013-04-12  4945  =

852b6d57dc7fa3 virt/kvm/kvm_main.c    Scott Wood        2013-04-12  4946  	=
	r =3D -EFAULT;
852b6d57dc7fa3 virt/kvm/kvm_main.c    Scott Wood        2013-04-12  4947  	=
	if (copy_from_user(&cd, argp, sizeof(cd)))
852b6d57dc7fa3 virt/kvm/kvm_main.c    Scott Wood        2013-04-12  4948  	=
		goto out;
852b6d57dc7fa3 virt/kvm/kvm_main.c    Scott Wood        2013-04-12  4949  =

852b6d57dc7fa3 virt/kvm/kvm_main.c    Scott Wood        2013-04-12  4950  	=
	r =3D kvm_ioctl_create_device(kvm, &cd);
852b6d57dc7fa3 virt/kvm/kvm_main.c    Scott Wood        2013-04-12  4951  	=
	if (r)
852b6d57dc7fa3 virt/kvm/kvm_main.c    Scott Wood        2013-04-12  4952  	=
		goto out;
852b6d57dc7fa3 virt/kvm/kvm_main.c    Scott Wood        2013-04-12  4953  =

852b6d57dc7fa3 virt/kvm/kvm_main.c    Scott Wood        2013-04-12  4954  	=
	r =3D -EFAULT;
852b6d57dc7fa3 virt/kvm/kvm_main.c    Scott Wood        2013-04-12  4955  	=
	if (copy_to_user(argp, &cd, sizeof(cd)))
852b6d57dc7fa3 virt/kvm/kvm_main.c    Scott Wood        2013-04-12  4956  	=
		goto out;
852b6d57dc7fa3 virt/kvm/kvm_main.c    Scott Wood        2013-04-12  4957  =

852b6d57dc7fa3 virt/kvm/kvm_main.c    Scott Wood        2013-04-12  4958  	=
	r =3D 0;
852b6d57dc7fa3 virt/kvm/kvm_main.c    Scott Wood        2013-04-12  4959  	=
	break;
852b6d57dc7fa3 virt/kvm/kvm_main.c    Scott Wood        2013-04-12  4960  	}
92b591a4c46b10 virt/kvm/kvm_main.c    Alexander Graf    2014-07-14  4961  	=
case KVM_CHECK_EXTENSION:
92b591a4c46b10 virt/kvm/kvm_main.c    Alexander Graf    2014-07-14  4962  	=
	r =3D kvm_vm_ioctl_check_extension_generic(kvm, arg);
92b591a4c46b10 virt/kvm/kvm_main.c    Alexander Graf    2014-07-14  4963  	=
	break;
fb04a1eddb1a65 virt/kvm/kvm_main.c    Peter Xu          2020-09-30  4964  	=
case KVM_RESET_DIRTY_RINGS:
fb04a1eddb1a65 virt/kvm/kvm_main.c    Peter Xu          2020-09-30  4965  	=
	r =3D kvm_vm_ioctl_reset_dirty_pages(kvm);
fb04a1eddb1a65 virt/kvm/kvm_main.c    Peter Xu          2020-09-30  4966  	=
	break;
fcfe1baeddbf1c virt/kvm/kvm_main.c    Jing Zhang        2021-06-18  4967  	=
case KVM_GET_STATS_FD:
fcfe1baeddbf1c virt/kvm/kvm_main.c    Jing Zhang        2021-06-18  4968  	=
	r =3D kvm_vm_ioctl_get_stats_fd(kvm);
fcfe1baeddbf1c virt/kvm/kvm_main.c    Jing Zhang        2021-06-18  4969  	=
	break;
f17abe9a44425f drivers/kvm/kvm_main.c Avi Kivity        2007-02-21  4970  	=
default:
303b911206dd2a virt/kvm/kvm_main.c    Chao Peng         2022-07-06 @4971  a=
rch_vm_ioctl:
1fe779f8eccd16 drivers/kvm/kvm_main.c Carsten Otte      2007-10-29  4972  	=
	r =3D kvm_arch_vm_ioctl(filp, ioctl, arg);
f17abe9a44425f drivers/kvm/kvm_main.c Avi Kivity        2007-02-21  4973  	}
f17abe9a44425f drivers/kvm/kvm_main.c Avi Kivity        2007-02-21  4974  o=
ut:
f17abe9a44425f drivers/kvm/kvm_main.c Avi Kivity        2007-02-21  4975  	=
return r;
f17abe9a44425f drivers/kvm/kvm_main.c Avi Kivity        2007-02-21  4976  }
f17abe9a44425f drivers/kvm/kvm_main.c Avi Kivity        2007-02-21  4977  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5530460280300534340==--

