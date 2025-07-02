Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5201277CBE
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Jul 2025 16:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751472697; cv=none; b=gHn+Z/H7f9kGes/+TMumWiUPdlGGkH5krb9lJFkfLjBQLAbF1Y3SYNlwQYoPQedKr7Vs/HoSAhtSsgvMrWpVKbaYzf+PyVZ2XcQgewDysIYB3QWT5H9oHsjcO7bM3+jxSInoGPpEprGsJlLx+kwwyMQ/vP7ZatUgFLTaL+XtTH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751472697; c=relaxed/simple;
	bh=Rm8zKpn2rwW5XxRcuKrANowWuBjNXgD86RUU++UDSfE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UJwnm/TjtdDF/sRQrJprY5yIBJZdqHFGNVYpYmow03KAxUyV2foDxJ8/+Qd6equDAQd7HGMOyx7jW8JfnFu2wdkoocSyvKtJc1EdvyPCrzywCKz3bkKCI0rErvOd0iy7wxMEoQJB0rqKTLm75kAQxENxH5jVsx2g6ruXpmNMJtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XX0xGDS8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XX0xGDS8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751472694; x=1783008694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rm8zKpn2rwW5XxRcuKrANowWuBjNXgD86RUU++UDSfE=;
  b=XX0xGDS8b4tliGX52z113KivRiSUUyr4yxz5/5lmGX+uyl7SiqX8xE24
   nNLC1dVO+KCOSuzleQE0Xbsmsx+LSb7z8WHUDTp6mablRq5177BpcN50/
   I2w0oeb6slAum/yHarM34fITniZP1E8M/sBI04pjDojAA3F15Xe0LWf11
   5/cegWyxMwsAUvd0LxG6a0G5J+WcMdqqNSNn/b8a9BixA/CkV/SBG45X1
   XV2Ns2nScwVuqjYWfL0Hgi9qUg9WbJfoIYbiY5KU+bkjvn6WHamXLIa/Q
   n5gMzEkwHbKlzSeimXbM1DHs7TUpUJw1rfkEqZQXnOlLIgmEhT0Hfv2MF
   A==;
X-CSE-ConnectionGUID: LQ3A/ACIStSWPMvux6WQag==
X-CSE-MsgGUID: j2naUyaVShiAsEPTedh1yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53710318"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="53710318"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 09:02:35 -0700
X-CSE-ConnectionGUID: EDXLxqu3RVu8isoTAZlhaQ==
X-CSE-MsgGUID: Uc9YjJhlSl+D5BGmhkYYiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="154676838"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Jul 2025 09:02:33 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWzup-0000p5-1E;
	Wed, 02 Jul 2025 16:02:31 +0000
Date: Thu, 3 Jul 2025 00:02:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12-desktop 6/6]
 arch/x86/kvm/pkvm/pkvm.c: pkvm.h is included more than once.
Message-ID: <202507022329.otInNMYk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   d94c9af01df6cfef567c9c9c34f97a683cfecc9c
commit: e6d0c519b354da165ca8294f14d4897abcca7d86 [6/6] ANDROID: pkvm: x86: Refactor pvmfw handling as a part of new PV code
:::::: branch date: 3 hours ago
:::::: commit date: 7 hours ago
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507022329.otInNMYk-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/x86/kvm/pkvm/pkvm.c: pkvm.h is included more than once.

vim +3 arch/x86/kvm/pkvm/pkvm.c

   > 3	#include <asm/kvm_pkvm.h>
     4	#include "x86.h"
   > 5	#include "pkvm.h"
     6	#include "cpuid.h"
     7	#include <asm/pkvm_spinlock.h>
     8	//FIXME: clean up the header files
   > 9	#include <vmx/pkvm/hyp/mem_protect.h>
  > 10	#include <vmx/pkvm/hyp/memory.h>
  > 11	#include <pkvm.h>
    12	
    13	struct cpuinfo_x86 boot_cpu_data;
    14	unsigned int tsc_khz;
    15	
    16	/*
    17	 * FIXME: This was defined in kvm/mmu/mmu.c but as this file is not used for
    18	 * adding cpu state protection, there is no equivalent mmu.c in the pkvm
    19	 * hypervisor, define the tdp_enabled here to simplify.
    20	 */
    21	bool tdp_enabled = true;
    22	DEFINE_PER_CPU(struct kvm_vcpu *, host_vcpu);
    23	u64 x86_pred_cmd;
    24	DEFINE_PER_CPU(u64, x86_spec_ctrl_current);
    25	
    26	size_t pkvm_vm_sz = sizeof(struct pkvm_vm);
    27	size_t pkvm_vcpu_sz = sizeof(struct pkvm_vcpu);
    28	
    29	static DECLARE_BITMAP(pkvm_vms_bitmap, MAX_PKVM_VMS);
    30	static pkvm_spinlock_t pkvm_vms_lock = __PKVM_SPINLOCK_UNLOCKED;
    31	static struct pkvm_vm_ref pkvm_vms_ref[MAX_PKVM_VMS];
    32	struct pkvm_x86_ops pkvm_x86_ops __read_mostly;
    33	
    34	static DEFINE_PER_CPU(union pkvm_pv_param *, pv_param);
    35	
    36	#define this_pv_param(f)	(&this_cpu_read(pv_param)->f)
    37	
    38	static int pkvm_enable_virtualization_cpu(unsigned long pv_param_pa)
    39	{
    40		int r = kvm_arch_enable_virtualization_cpu();
    41	
    42		if (!r)
    43			/*
    44			 * TODO: Assume host is already share the pv_param structure
    45			 * with pkvm. Pin the pv_param_pa so that it won't be re-used
    46			 * as guest memory.
    47			 */
    48			this_cpu_write(pv_param, __pkvm_va(pv_param_pa));
    49	
    50		return r;
    51	}
    52	
    53	static void pkvm_disable_virtualization_cpu(void)
    54	{
    55		kvm_arch_disable_virtualization_cpu();
    56	
    57		/* TODO: unpin the shared pv_param memory */
    58		this_cpu_write(pv_param, NULL);
    59	}
    60	
    61	#define HANDLE_OFFSET 1
    62	
    63	static int idx_to_vm_handle(int idx)
    64	{
    65		return idx + HANDLE_OFFSET;
    66	}
    67	
    68	static int vm_handle_to_idx(int handle)
    69	{
    70		return handle - HANDLE_OFFSET;
    71	}
    72	
    73	static int allocate_pkvm_vm_handle(struct pkvm_vm *pkvm_vm)
    74	{
    75		struct pkvm_vm_ref *pkvm_vm_ref;
    76		int idx;
    77	
    78		/*
    79		 * The pkvm_vm_handle is an int so cannot exceed the INT_MAX.
    80		 * Meanwhile pkvm_vm_handle will also be used as owner_id in
    81		 * the page state machine so it also cannot exceed the max
    82		 * owner_id.
    83		 */
    84		BUILD_BUG_ON(MAX_PKVM_VMS >
    85			     min(INT_MAX, ((1 << hweight_long(PKVM_INVALID_PTE_OWNER_MASK)) - 1)));
    86	
    87		pkvm_spin_lock(&pkvm_vms_lock);
    88	
    89		idx = find_next_zero_bit(pkvm_vms_bitmap, MAX_PKVM_VMS, 0);
    90		if (idx == MAX_PKVM_VMS) {
    91			pkvm_spin_unlock(&pkvm_vms_lock);
    92			return -ENOMEM;
    93		}
    94		__set_bit(idx, pkvm_vms_bitmap);
    95	
    96		to_kvm(pkvm_vm)->arch.pkvm.pkvm_vm_handle = idx_to_vm_handle(idx);
    97		pkvm_vm_ref = &pkvm_vms_ref[idx];
    98		pkvm_vm_ref->pkvm_vm = pkvm_vm;
    99		atomic_set(&pkvm_vm_ref->refcount, 1);
   100	
   101		pkvm_spin_unlock(&pkvm_vms_lock);
   102		return 0;
   103	}
   104	
   105	static struct pkvm_vm *free_pkvm_vm_handle(int handle)
   106	{
   107		struct pkvm_vm_ref *pkvm_vm_ref;
   108		struct pkvm_vm *pkvm_vm = NULL;
   109		int idx;
   110	
   111		idx = vm_handle_to_idx(handle);
   112		if (idx < 0 || idx >= MAX_PKVM_VMS)
   113			return NULL;
   114	
   115		pkvm_spin_lock(&pkvm_vms_lock);
   116	
   117		pkvm_vm_ref = &pkvm_vms_ref[idx];
   118		if ((atomic_cmpxchg(&pkvm_vm_ref->refcount, 1, 0) != 1)) {
   119			pr_err("%s: VM%d is busy, refcount %d\n",
   120				__func__, handle, atomic_read(&pkvm_vm_ref->refcount));
   121			goto out;
   122		}
   123	
   124		pkvm_vm = pkvm_vm_ref->pkvm_vm;
   125		pkvm_vm_ref->pkvm_vm = NULL;
   126	
   127		__clear_bit(idx, pkvm_vms_bitmap);
   128	out:
   129		pkvm_spin_unlock(&pkvm_vms_lock);
   130		return pkvm_vm;
   131	}
   132	
   133	static void teardown_donated_memory(struct pkvm_memcache *mc, void *addr, size_t size)
   134	{
   135		size = PAGE_ALIGN(size);
   136		memset(addr, 0, size);
   137	
   138		for (void *start = addr; start < addr + size; start += PAGE_SIZE)
   139			push_pkvm_memcache(mc, start, pkvm_virt_to_host_gpa);
   140	
 > 141		__pkvm_hyp_donate_host(pkvm_virt_to_phys(addr), size);
   142	}
   143	
   144	static int pkvm_vm_init(struct kvm *shared_kvm, unsigned long gpa)
   145	{
   146		unsigned long pkvm_vm_pa;
   147		struct pkvm_vm *pkvm_vm;
   148		struct kvm *kvm;
   149		size_t pa_size;
   150		int ret;
   151	
   152		pkvm_vm_pa = host_gpa2hpa(gpa);
   153		if (!PAGE_ALIGNED(pkvm_vm_pa))
   154			return -EINVAL;
   155	
   156		pa_size = PAGE_ALIGN(pkvm_vm_sz);
 > 157		if (__pkvm_host_donate_hyp(pkvm_vm_pa, pa_size))
   158			return -EINVAL;
   159	
   160		pkvm_vm = pkvm_phys_to_virt(pkvm_vm_pa);
   161		memset(pkvm_vm, 0, pa_size);
   162	
   163		pkvm_vm->size = pa_size;
   164		/*
   165		 * TODO: Assume host is already share the kvm structure
   166		 * (represented by shared_kvm) with pkvm. So just pin
   167		 * shared_kvm.
   168		 */
   169		pkvm_vm->shared_kvm = shared_kvm;
   170		pkvm_vm->lock = __PKVM_SPINLOCK_UNLOCKED;
   171	
   172		kvm = to_kvm(pkvm_vm);
   173	
   174		ret = kvm_arch_init_vm(kvm, pkvm_vm->shared_kvm->arch.vm_type);
   175		if (ret)
   176			goto undonate;
   177	
   178		ret = allocate_pkvm_vm_handle(pkvm_vm);
   179		if (ret)
   180			goto vm_destroy;
   181	
   182		return kvm->arch.pkvm.pkvm_vm_handle;
   183	
   184	vm_destroy:
   185		kvm_x86_call(vm_destroy)(kvm);
   186	undonate:
 > 187		__pkvm_hyp_donate_host(pkvm_vm_pa, pa_size);
   188		return ret;
   189	}
   190	
   191	static int attach_pkvm_vcpu_to_vm(struct pkvm_vcpu *pkvm_vcpu, struct pkvm_vm *pkvm_vm)
   192	{
   193		struct kvm_vcpu *vcpu;
   194		struct kvm *kvm;
   195		int ret = 0;
   196	
   197		kvm = to_kvm(pkvm_vm);
   198	
   199		pkvm_spin_lock(&pkvm_vm->lock);
   200	
   201		if (kvm->created_vcpus == KVM_MAX_VCPUS) {
   202			ret = -EINVAL;
   203			goto out;
   204		}
   205	
   206		pkvm_vcpu->vcpu_idx = kvm->created_vcpus;
   207		pkvm_vcpu->pkvm_vm = pkvm_vm;
   208	
   209		/* Setup necessary fields in kvm_vcpu */
   210		vcpu = to_kvm_vcpu(pkvm_vcpu);
   211		/* Set cpu to -1 to indicate it is not loaded on any CPU */
   212		vcpu->cpu = -1;
   213		vcpu->kvm = kvm;
   214		vcpu->vcpu_id = pkvm_vcpu->shared_vcpu->vcpu_id;
   215		/*
   216		 * Set apic in vcpu->arch points to the apic in the shared vcpu
 > 217		 * to make the pkvm hypervisor knows if lapic_in_kernel() is true or
 > 218		 * not. The pkvm hypervisor should not use this as a normal memory.
   219		 */
   220		vcpu->arch.apic = pkvm_vcpu->shared_vcpu->arch.apic;
   221		vcpu->arch.apic_base = pkvm_vcpu->shared_vcpu->arch.apic_base;
   222	
   223		ret = kvm_arch_vcpu_create(vcpu);
   224		if (ret)
   225			goto out;
   226	
   227		pkvm_vm->vcpus[pkvm_vcpu->vcpu_idx] = pkvm_vcpu;
   228		kvm->created_vcpus++;
   229	out:
   230		pkvm_spin_unlock(&pkvm_vm->lock);
   231		return ret;
   232	}
   233	
   234	static void detach_pkvm_vcpu_from_vm(struct pkvm_vcpu *pkvm_vcpu, struct pkvm_vm *pkvm_vm)
   235	{
   236		struct kvm *kvm;
   237	
   238		kvm = to_kvm(pkvm_vm);
   239	
   240		pkvm_spin_lock(&pkvm_vm->lock);
   241	
   242		kvm_x86_call(vcpu_free)(to_kvm_vcpu(pkvm_vcpu));
   243	
   244		pkvm_vm->vcpus[pkvm_vcpu->vcpu_idx] = NULL;
   245	
   246		pkvm_spin_unlock(&pkvm_vm->lock);
   247	}
   248	
   249	struct pkvm_vm *get_pkvm_vm(int handle)
   250	{
   251		int idx = vm_handle_to_idx(handle);
   252		struct pkvm_vm_ref *pkvm_vm_ref;
   253	
   254		if (idx < 0 || idx >= MAX_PKVM_VMS)
   255			return NULL;
   256	
   257		pkvm_vm_ref = &pkvm_vms_ref[idx];
   258		return atomic_inc_not_zero(&pkvm_vm_ref->refcount) ? pkvm_vm_ref->pkvm_vm : NULL;
   259	}
   260	
   261	void put_pkvm_vm(struct pkvm_vm *pkvm_vm)
   262	{
   263		int idx = vm_handle_to_idx(to_kvm(pkvm_vm)->arch.pkvm.pkvm_vm_handle);
   264		struct pkvm_vm_ref *pkvm_vm_ref;
   265	
   266		if (idx < 0 || idx >= MAX_PKVM_VMS)
   267			return;
   268	
   269		pkvm_vm_ref = &pkvm_vms_ref[idx];
   270		WARN_ON(atomic_dec_if_positive(&pkvm_vm_ref->refcount) <= 0);
   271	}
   272	
   273	static int pkvm_vcpu_create(struct kvm_vcpu *shared_vcpu, unsigned long gpa)
   274	{
   275		struct pkvm_vcpu *pkvm_vcpu;
   276		unsigned long pkvm_vcpu_pa;
   277		struct pkvm_vm *pkvm_vm;
   278		struct kvm *shared_kvm;
   279		size_t pa_size;
   280		int ret;
   281	
   282		pkvm_vcpu_pa = host_gpa2hpa(gpa);
   283		if (!PAGE_ALIGNED(pkvm_vcpu_pa))
   284			return -EINVAL;
   285	
   286		pa_size = PAGE_ALIGN(pkvm_vcpu_sz);
 > 287		if (__pkvm_host_donate_hyp(pkvm_vcpu_pa, pa_size))
   288			return -EINVAL;
   289	
   290		pkvm_vcpu = pkvm_phys_to_virt(pkvm_vcpu_pa);
   291		memset(pkvm_vcpu, 0, pa_size);
   292	
   293		pkvm_vcpu->size = pa_size;
   294		/*
   295		 * TODO: Assume host is already share the kvm_vcpu structure
   296		 * (represented by shared_vcpu) with pkvm. So just pin
   297		 * shared_vcpu. Unpin shared_vcpu when destroying
   298		 */
   299		pkvm_vcpu->shared_vcpu = shared_vcpu;
   300	
   301		shared_kvm = kern_pkvm_va(pkvm_vcpu->shared_vcpu->kvm);
   302		pkvm_vm = get_pkvm_vm(shared_kvm->arch.pkvm.pkvm_vm_handle);
   303		if (!pkvm_vm) {
   304			ret = -EBUSY;
   305			goto undonate;
   306		}
   307	
   308		ret = attach_pkvm_vcpu_to_vm(pkvm_vcpu, pkvm_vm);
   309		if (ret)
   310			goto put_pkvm_vm;
   311	
   312		put_pkvm_vm(pkvm_vm);
   313	
   314		return pkvm_vcpu->vcpu_idx;
   315	
   316	put_pkvm_vm:
   317		put_pkvm_vm(pkvm_vm);
   318	undonate:
 > 319		__pkvm_hyp_donate_host(pkvm_vcpu_pa, pa_size);
   320		return ret;
   321	}
   322	
   323	static int pkvm_vm_finalize(int handle)
   324	{
   325		struct kvm *kvm, *shared_kvm;
   326		struct pkvm_vm *pkvm_vm;
   327		u64 pvmfw_load_addr;
   328		int ret = 0, i;
   329	
   330		pkvm_vm = get_pkvm_vm(handle);
   331		if (!pkvm_vm)
   332			return -EINVAL;
   333	
   334		kvm = to_kvm(pkvm_vm);
   335		shared_kvm = pkvm_vm->shared_kvm;
   336	
   337		if (!pkvm_is_protected_vm(kvm)) {
   338			ret = -EINVAL;
   339			goto put_pkvm_vm;
   340		}
   341	
   342		pkvm_spin_lock(&pkvm_vm->lock);
   343	
   344		if (kvm->arch.pkvm.finalized) {
   345			ret = -EBUSY;
   346			goto unlock;
   347		}
   348	
   349		pvmfw_load_addr = READ_ONCE(shared_kvm->arch.pkvm.pvmfw_load_addr);
   350		if (pvmfw_load_addr != INVALID_GPA) {
   351			if (!pvmfw_present) {
   352				ret = -EINVAL;
   353				goto unlock;
   354			}
   355			kvm->arch.pkvm.pvmfw_load_addr = pvmfw_load_addr;
   356		}
   357	
   358		kvm->arch.bsp_vcpu_id = shared_kvm->arch.bsp_vcpu_id;
   359	
   360		/*
   361		 * Make sure to update pvmfw_load_addr and bsp_vcpu_id values before
   362		 * updating the primary vCPU's mp_state, i.e. before allowing the
   363		 * primary vCPU to run. Paired with smp_rmb() in pkvm_vcpu_run().
   364		 */
   365		smp_wmb();
   366	
   367		for (i = 0; i < kvm->created_vcpus; i++) {
   368			struct kvm_vcpu *vcpu = to_kvm_vcpu(pkvm_vm->vcpus[i]);
   369	
   370			if (vcpu->vcpu_id == kvm->arch.bsp_vcpu_id)
   371				WRITE_ONCE(vcpu->arch.mp_state, KVM_MP_STATE_RUNNABLE);
   372	
   373			/*
   374			 * FIXME: temporarily allow secondary vCPUs to run as well
   375			 * until we implement a guest PV mechanism to let the pVM itself
   376			 * allow a vCPU to run.
   377			 */
   378			WRITE_ONCE(vcpu->arch.mp_state, KVM_MP_STATE_RUNNABLE);
   379		}
   380	
   381		kvm->arch.pkvm.finalized = true;
   382		shared_kvm->arch.pkvm.finalized = true;
   383	unlock:
   384		pkvm_spin_unlock(&pkvm_vm->lock);
   385	put_pkvm_vm:
   386		put_pkvm_vm(pkvm_vm);
   387		return ret;
   388	}
   389	
   390	static void pkvm_vm_destroy(int handle)
   391	{
   392		struct kvm_protected_vm *shared_pkvm;
   393		struct pkvm_vm *pkvm_vm;
   394		int i;
   395	
   396		pkvm_vm = free_pkvm_vm_handle(handle);
   397		if (!pkvm_vm)
   398			return;
   399		shared_pkvm = &pkvm_vm->shared_kvm->arch.pkvm;
   400	
   401		for (i = 0; i < to_kvm(pkvm_vm)->created_vcpus; i++) {
   402			struct pkvm_vcpu *pkvm_vcpu = pkvm_vm->vcpus[i];
   403			struct kvm_vcpu *vcpu = to_kvm_vcpu(pkvm_vcpu);
   404	
   405			detach_pkvm_vcpu_from_vm(pkvm_vcpu, pkvm_vm);
   406			teardown_donated_memory(&shared_pkvm->teardown_mc,
   407						(void *)vcpu->arch.cpuid_entries,
   408						sizeof(struct kvm_cpuid_entry2) *
   409						vcpu->arch.cpuid_nent);
   410			teardown_donated_memory(&shared_pkvm->teardown_mc,
   411						(void *)pkvm_vcpu, pkvm_vcpu->size);
   412			/* TODO: unpin shared kvm_vcpu */
   413		}
   414	
   415		kvm_arch_destroy_vm(to_kvm(pkvm_vm));
   416		teardown_donated_memory(&shared_pkvm->teardown_mc,
   417					(void *)pkvm_vm, pkvm_vm->size);
   418	
   419		/* TODO: unpin shared_kvm */
   420	}
   421	
   422	static struct pkvm_vcpu *get_pkvm_vcpu_from_vm(struct pkvm_vm *pkvm_vm, int handle)
   423	{
   424		struct pkvm_vcpu *pkvm_vcpu = NULL;
   425	
   426		pkvm_spin_lock(&pkvm_vm->lock);
   427	
   428		if (handle < to_kvm(pkvm_vm)->created_vcpus)
   429			pkvm_vcpu = pkvm_vm->vcpus[handle];
   430	
   431		pkvm_spin_unlock(&pkvm_vm->lock);
   432	
   433		return pkvm_vcpu;
   434	}
   435	
   436	struct pkvm_vcpu *get_pkvm_vcpu(int vm_handle, int vcpu_handle)
   437	{
   438		struct pkvm_vcpu *pkvm_vcpu;
   439		struct pkvm_vm *pkvm_vm;
   440	
   441		pkvm_vm = get_pkvm_vm(vm_handle);
   442		if (!pkvm_vm)
   443			return NULL;
   444	
   445		pkvm_vcpu = get_pkvm_vcpu_from_vm(pkvm_vm, vcpu_handle);
   446		if (!pkvm_vcpu)
   447			put_pkvm_vm(pkvm_vm);
   448	
   449		return pkvm_vcpu;
   450	}
   451	
   452	void put_pkvm_vcpu(struct pkvm_vcpu *pkvm_vcpu)
   453	{
   454		put_pkvm_vm(pkvm_vcpu->pkvm_vm);
   455	}
   456	
   457	static struct pkvm_vcpu *get_pkvm_vcpu_via_shared(struct kvm_vcpu *shared_vcpu)
   458	{
   459		struct pkvm_vcpu *pkvm_vcpu;
   460		struct kvm *shared_kvm;
   461	
   462		/*
   463		 * FIXME: Any check neeeds to be performed before accessing
   464		 * the shared_vcpu?
   465		 */
   466		shared_kvm = kern_pkvm_va(shared_vcpu->kvm);
   467		pkvm_vcpu = get_pkvm_vcpu(shared_kvm->arch.pkvm.pkvm_vm_handle,
   468					  shared_vcpu->arch.pkvm_vcpu_handle);
   469		if (!pkvm_vcpu)
   470			return NULL;
   471	
   472		if (pkvm_vcpu->shared_vcpu == shared_vcpu)
   473			return pkvm_vcpu;
   474	
   475		put_pkvm_vcpu(pkvm_vcpu);
   476		return NULL;
   477	}
   478	
   479	static bool is_kvm_vcpu_accessible(struct kvm_vcpu *vcpu, unsigned long fn)
   480	{
   481		/*
   482		 * Determine if the vcpu is accessible for a specific PV interface.
   483		 * For the npVM, the vcpu is always accessible.
   484		 */
   485		if (!pkvm_is_protected_vcpu(vcpu))
   486			return true;
   487	
   488		switch (fn) {
   489		/*
   490		 * FIXME:
   491		 * Any security concern to allow the host using below PV interfaces?
   492		 * 1) __pkvm__get_nmi_mask: the host KVM needs these for nmi injection.
   493		 *
   494		 * TODO: Add protection for below PV interfaces:
   495		 *	__pkvm__write_tsc_offset
   496		 *	__pkvm__write_tsc_multiplier
   497		 */
   498		case __pkvm__vcpu_after_set_cpuid:
   499		case __pkvm__vcpu_reset:
   500		case __pkvm__get_segment_base:
   501		case __pkvm__get_segment:
   502		case __pkvm__set_segment:
   503		case __pkvm__set_cr0:
   504		case __pkvm__set_cr4:
   505		case __pkvm__set_msr:
   506		case __pkvm__get_msr:
   507		case __pkvm__set_efer:
   508		case __pkvm__get_idt:
   509		case __pkvm__set_idt:
   510		case __pkvm__get_gdt:
   511		case __pkvm__set_gdt:
   512		case __pkvm__get_rflags:
   513		case __pkvm__set_rflags:
   514		case __pkvm__set_dr7:
   515		case __pkvm__set_interrupt_shadow:
   516		case __pkvm__get_interrupt_shadow:
   517		case __pkvm__inject_exception:
   518		case __pkvm__set_nmi_mask:
   519		case __pkvm__post_set_cr3:
   520		case __pkvm__cache_reg:
   521		case __pkvm__update_exception_bitmap:
   522			/*
   523			 * FIXME: As the host still needs to pre-configure pVM's vcpu
   524			 * state for booting, the protection is enforced by the pkvm
   525			 * hypervisor only if the vcpu has started running. If the host
   526			 * doesn't need to do so, the protection can be enforced
   527			 * directly.
   528			 */
   529			return !kvm_vcpu_has_run(vcpu);
   530		default:
   531			break;
   532		}
   533	
   534		return true;
   535	}
   536	
   537	static struct pkvm_vcpu *load_pkvm_vcpu(struct kvm_vcpu *shared_vcpu, unsigned long fn)
   538	{
   539		struct pkvm_vcpu *pkvm_vcpu = get_pkvm_vcpu_via_shared(shared_vcpu);
   540		struct kvm_vcpu *vcpu;
   541	
   542		if (!pkvm_vcpu)
   543			return NULL;
   544	
   545		vcpu = to_kvm_vcpu(pkvm_vcpu);
   546		if (!is_kvm_vcpu_accessible(vcpu, fn))
   547			goto out;
   548	
   549		/*
   550		 * Except the vcpu_load PV interface, the other vcpu accessing PV
   551		 * interfaces requires the vcpu to be loaded on this CPU.
   552		 */
   553		if (vcpu->cpu != raw_smp_processor_id() &&
   554		    !(vcpu->cpu == -1 && fn == __pkvm__vcpu_load))
   555			goto out;
   556	
   557		pkvm_x86_call(switch_to_guest_vcpu)(vcpu);
   558	
   559		return pkvm_vcpu;
   560	out:
   561		put_pkvm_vcpu(pkvm_vcpu);
   562		return NULL;
   563	}
   564	
   565	static void unload_pkvm_vcpu(struct pkvm_vcpu *pkvm_vcpu)
   566	{
   567		if (!pkvm_vcpu)
   568			return;
   569	
   570		pkvm_x86_call(switch_to_host_vcpu)(this_cpu_read(host_vcpu));
   571	
   572		put_pkvm_vcpu(pkvm_vcpu);
   573	}
   574	
   575	static void pkvm_vcpu_load(struct pkvm_vcpu *pkvm_vcpu, int cpu)
   576	{
   577		struct kvm_vcpu *vcpu;
   578		int loaded_cpu;
   579	
   580		if (WARN_ON_ONCE(!pkvm_vcpu))
   581			return;
   582	
   583		if (WARN_ON_ONCE(cpu != raw_smp_processor_id()))
   584			return;
   585	
   586		vcpu = to_kvm_vcpu(pkvm_vcpu);
   587		loaded_cpu = cmpxchg(&vcpu->cpu, -1, cpu);
   588		if (loaded_cpu == -1) {
   589			/* Not loaded yet */
   590			get_pkvm_vm(vcpu->kvm->arch.pkvm.pkvm_vm_handle);
   591		} else if (WARN_ON_ONCE(loaded_cpu != cpu)) {
   592			/* Already loaded on another CPU */
   593			return;
   594		}
   595	
   596		kvm_x86_call(vcpu_load)(vcpu, cpu);
   597	}
   598	
   599	static void pkvm_vcpu_put(struct pkvm_vcpu *pkvm_vcpu)
   600	{
   601		int cpu = raw_smp_processor_id(), loaded_cpu;
   602		struct kvm_vcpu *vcpu;
   603	
   604		if (WARN_ON_ONCE(!pkvm_vcpu))
   605			return;
   606	
   607		vcpu = to_kvm_vcpu(pkvm_vcpu);
   608		loaded_cpu = cmpxchg(&vcpu->cpu, cpu, -1);
   609		/* Only the CPU which has loaded this vcpu can do a put */
   610		if (WARN_ON_ONCE(loaded_cpu != cpu))
   611			return;
   612	
   613		kvm_x86_call(vcpu_put)(vcpu);
   614	
   615		put_pkvm_vm(pkvm_vcpu->pkvm_vm);
   616	}
   617	
   618	static void pkvm_vcpu_update_state_from_host(struct pkvm_vcpu *pkvm_vcpu)
   619	{
   620		struct kvm_vcpu *shared_vcpu = pkvm_vcpu->shared_vcpu;
   621		struct kvm_vcpu *vcpu = to_kvm_vcpu(pkvm_vcpu);
   622	
   623		if (!pkvm_is_protected_vcpu(vcpu)) {
   624			/*
   625			 * Make sure the RSP/RIP in shared_vcpu are aligned with the
   626			 * private vcpu if they are not dirty.
   627			 */
   628			if (kvm_register_is_dirty(shared_vcpu, VCPU_REGS_RSP))
   629				kvm_register_mark_dirty(vcpu, VCPU_REGS_RSP);
   630			else
   631				shared_vcpu->arch.regs[VCPU_REGS_RSP] = kvm_rsp_read(vcpu);
   632			if (kvm_register_is_dirty(shared_vcpu, VCPU_REGS_RIP))
   633				kvm_register_mark_dirty(vcpu, VCPU_REGS_RIP);
   634			else
   635				shared_vcpu->arch.regs[VCPU_REGS_RIP] = kvm_rip_read(vcpu);
   636			/* Update the npVM's GPRs from the host */
   637			memcpy(vcpu->arch.regs, shared_vcpu->arch.regs,
   638			       NR_VCPU_REGS * sizeof(*vcpu->arch.regs));
   639	
   640			/* Update the debug registers from the host */
   641			memcpy(vcpu->arch.db, shared_vcpu->arch.db,
   642			       ARRAY_SIZE(vcpu->arch.db) * sizeof(*vcpu->arch.db));
   643			memcpy(vcpu->arch.eff_db, shared_vcpu->arch.eff_db,
   644			       ARRAY_SIZE(vcpu->arch.db) * sizeof(*vcpu->arch.db));
   645			vcpu->arch.dr6 = shared_vcpu->arch.dr6;
   646			vcpu->arch.dr7 = shared_vcpu->arch.dr7;
   647			if (vcpu->guest_debug & KVM_GUESTDBG_USE_HW_BP)
   648				vcpu->arch.guest_debug_dr7 = shared_vcpu->arch.guest_debug_dr7;
   649			if (vcpu->guest_debug & KVM_GUESTDBG_SINGLESTEP)
   650				vcpu->arch.singlestep_rip = shared_vcpu->arch.singlestep_rip;
   651		} else if (unlikely(!kvm_vcpu_has_run(vcpu))) {
   652			/*
   653			 * FIXME: Allows the host to set the pVM's vcpu state for the
   654			 * initial booting if the vcpu has not started running. This
   655			 * is to satisfy the current crosvm implementation. But the
   656			 * initial vcpu state set by the host is un-trusted. Once the
 > 657			 * crosvm will not do so and the pkvm hypervisor set the initial
   658			 * pVM's vcpu state, this should be removed.
   659			 *
   660			 * For Multiboot-compatible bootloader, the boot information is
   661			 * stored in the RAX/RDX.
   662			 */
   663			kvm_rax_write(vcpu, shared_vcpu->arch.regs[VCPU_REGS_RAX]);
   664			kvm_rdx_write(vcpu, shared_vcpu->arch.regs[VCPU_REGS_RDX]);
   665			/*
   666			 * For ELF/kernel bzImage, configures the bootstrap VCPU for the
   667			 * Linux/x86 boot protocol in RSP/RSI.
   668			 * <https://www.kernel.org/doc/html/latest/arch/x86/boot.html>
   669			 */
   670			if (kvm_register_is_dirty(shared_vcpu, VCPU_REGS_RSP))
   671				kvm_rsp_write(vcpu, shared_vcpu->arch.regs[VCPU_REGS_RSP]);
   672			kvm_rsi_write(vcpu, shared_vcpu->arch.regs[VCPU_REGS_RSI]);
   673			/* Pass the guest boot entry address in RIP */
   674			if (!pkvm_vcpu_is_pvmfw_bsp(vcpu) &&
   675			    kvm_register_is_dirty(shared_vcpu, VCPU_REGS_RIP))
   676				kvm_rip_write(vcpu, shared_vcpu->arch.regs[VCPU_REGS_RIP]);
   677			/*
   678			 * FIXME: Pass pVM payload entry address to pVM firmware by RDI.
   679			 * According to the comment in the crosvm x86_64/src/lib.rs,
   680			 * this is just for development purpose. Probably this update
   681			 * will not be needed eventually.
   682			 */
   683			kvm_rdi_write(vcpu, shared_vcpu->arch.regs[VCPU_REGS_RDI]);
   684	
   685			return;
   686		}
   687	
   688		pkvm_x86_call(sync_vcpu_state_post_switch)(pkvm_vcpu);
   689	}
   690	
   691	static void pkvm_vcpu_share_state_to_host(struct pkvm_vcpu *pkvm_vcpu)
   692	{
   693		struct kvm_vcpu *shared_vcpu = pkvm_vcpu->shared_vcpu;
   694		struct kvm_vcpu *vcpu = to_kvm_vcpu(pkvm_vcpu);
   695	
   696		if (!pkvm_is_protected_vcpu(vcpu)) {
   697			/* Make sure the RSP/RIP in private vcpu are up-to-date */
   698			if (!kvm_register_is_available(vcpu, VCPU_REGS_RSP))
   699				kvm_rsp_read(vcpu);
   700			if (!kvm_register_is_available(vcpu, VCPU_REGS_RIP))
   701				kvm_rip_read(vcpu);
   702	
   703			/*
   704			 * Share the npVM's GPRs/EFER/CR0/CR4 to the host which may be
   705			 * used by the host to handle vmexit.
   706			 */
   707			memcpy(shared_vcpu->arch.regs, vcpu->arch.regs,
   708			       NR_VCPU_REGS * sizeof(*vcpu->arch.regs));
   709			kvm_register_mark_available(shared_vcpu, VCPU_REGS_RSP);
   710			kvm_register_mark_available(shared_vcpu, VCPU_REGS_RIP);
   711			shared_vcpu->arch.cr0 = kvm_read_cr0(vcpu);
   712			kvm_register_mark_available(shared_vcpu, VCPU_EXREG_CR0);
   713			shared_vcpu->arch.cr4 = kvm_read_cr4(vcpu);
   714			kvm_register_mark_available(shared_vcpu, VCPU_EXREG_CR4);
   715			shared_vcpu->arch.efer = vcpu->arch.efer;
   716	
   717			/*
   718			 * Share the exception information to the host if there is any
   719			 */
   720			if (vcpu->arch.exception.pending || vcpu->arch.exception.injected) {
   721				shared_vcpu->arch.exception = vcpu->arch.exception;
   722				kvm_clear_exception_queue(vcpu);
   723			}
   724	
   725			/* Share the debug registers to the host */
   726			memcpy(shared_vcpu->arch.db, vcpu->arch.db,
   727			       ARRAY_SIZE(vcpu->arch.db) * sizeof(*vcpu->arch.db));
   728			memcpy(shared_vcpu->arch.eff_db, vcpu->arch.eff_db,
   729			       ARRAY_SIZE(vcpu->arch.db) * sizeof(*vcpu->arch.db));
   730			shared_vcpu->arch.dr6 = vcpu->arch.dr6;
   731			shared_vcpu->arch.dr7 = vcpu->arch.dr7;
 > 732		} else if (pkvm_has_req_to_host(HOST_INIT_MMU, vcpu) ||
 > 733			   pkvm_has_req_to_host(HOST_RESET_MMU, vcpu)) {
   734			shared_vcpu->arch.cr0 = kvm_read_cr0(vcpu);
   735			kvm_register_mark_available(shared_vcpu, VCPU_EXREG_CR0);
   736			shared_vcpu->arch.cr4 = kvm_read_cr4(vcpu);
   737			kvm_register_mark_available(shared_vcpu, VCPU_EXREG_CR4);
   738			shared_vcpu->arch.efer = vcpu->arch.efer;
   739		}
   740	
   741		pkvm_x86_call(sync_vcpu_state_pre_switch)(pkvm_vcpu);
   742	}
   743	
   744	static unsigned long pkvm_vcpu_run(struct pkvm_vcpu *pkvm_vcpu, bool force_immediate_exit)
   745	{
   746		struct kvm_vcpu *vcpu;
   747		unsigned long reqs;
   748	
   749		if (WARN_ON_ONCE(!pkvm_vcpu))
   750			return 0;
   751	
   752		vcpu = to_kvm_vcpu(pkvm_vcpu);
   753	
   754		if (unlikely(pkvm_is_protected_vcpu(vcpu) && !kvm_vcpu_has_run(vcpu))) {
   755			if (READ_ONCE(vcpu->arch.mp_state) != KVM_MP_STATE_RUNNABLE)
   756				return 0;
   757	
   758			/*
   759			 * Ensure that pvmfw_load_addr and bsp_vcpu_id are read after
   760			 * mp_state, so they are read with up-to-date values.
   761			 * Paired with smp_wmb() in pkvm_vm_finalize().
   762			 */
   763			smp_rmb();
   764	
   765			if (pkvm_vcpu_is_pvmfw_bsp(vcpu))
   766				kvm_rip_write(vcpu, vcpu->kvm->arch.pkvm.pvmfw_load_addr);
   767		}
   768	
   769		pkvm_vcpu_update_state_from_host(pkvm_vcpu);
   770	
   771		reqs = kvm_vcpu_enter_guest(vcpu, force_immediate_exit);
   772	
   773		pkvm_vcpu_share_state_to_host(pkvm_vcpu);
   774	
   775		return reqs;
   776	}
   777	
   778	static unsigned long pkvm_vcpu_after_set_cpuid(struct pkvm_vcpu *pkvm_vcpu, unsigned long new_pa)
   779	{
   780		struct kvm_cpuid_entry2 *new, *old;
   781		unsigned long ret = new_pa;
   782		struct kvm_vcpu *vcpu;
   783		int nent;
   784		u64 size;
   785	
   786		if (WARN_ON_ONCE(!pkvm_vcpu))
   787			return ret;
   788	
   789		nent = pkvm_vcpu->shared_vcpu->arch.cpuid_nent;
   790		size = PAGE_ALIGN(sizeof(struct kvm_cpuid_entry2) * nent);
 > 791		if (__pkvm_host_donate_hyp(new_pa, size))
   792			return ret;
   793	
   794		vcpu = to_kvm_vcpu(pkvm_vcpu);
   795		old = vcpu->arch.cpuid_entries;
   796		new = __pkvm_va(new_pa);
   797	
   798		if (kvm_set_cpuid(vcpu, new, nent) || vcpu->arch.cpuid_entries != new) {
   799			/* New physical page is not consumed */
 > 800			__pkvm_hyp_donate_host(new_pa, size);
   801		} else if (vcpu->arch.cpuid_entries == new) {
   802			/* New physical page is consumed */
   803			if (old) {
   804				memset(old, 0, size);
   805				/* Let the host VMM to free the old physical pages */
   806				ret = __pkvm_pa(old);
   807				/* Before that, undonate the old physical pages */
 > 808				__pkvm_hyp_donate_host(ret, size);
   809			} else {
   810				/* No physical page for the host VMM to free */
   811				ret = INVALID_PAGE;
   812			}
   813		}
   814	
   815		return ret;
   816	}
   817	
   818	static void pkvm_reset_vcpu(struct pkvm_vcpu *pkvm_vcpu, bool init_event)
   819	{
   820		if (WARN_ON_ONCE(!pkvm_vcpu))
   821			return;
   822	
   823		kvm_vcpu_reset(to_kvm_vcpu(pkvm_vcpu), init_event);
   824	}
   825	
   826	static u64 pkvm_get_segment_base(struct pkvm_vcpu *pkvm_vcpu, int seg)
   827	{
   828		if (WARN_ON_ONCE(!pkvm_vcpu))
   829			return 0;
   830	
   831		return kvm_x86_call(get_segment_base)(to_kvm_vcpu(pkvm_vcpu), seg);
   832	}
   833	
   834	static void pkvm_get_segment(struct pkvm_vcpu *pkvm_vcpu, struct kvm_segment *var, int seg)
   835	{
   836		if (WARN_ON_ONCE(!pkvm_vcpu))
   837			return;
   838	
   839		if (WARN_ON_ONCE(var != this_pv_param(seg)))
   840			return;
   841	
   842		kvm_x86_call(get_segment)(to_kvm_vcpu(pkvm_vcpu), var, seg);
   843	}
   844	
   845	static void pkvm_set_segment(struct pkvm_vcpu *pkvm_vcpu, struct kvm_segment *var, int seg)
   846	{
   847		if (WARN_ON_ONCE(!pkvm_vcpu))
   848			return;
   849	
   850		if (WARN_ON_ONCE(var != this_pv_param(seg)))
   851			return;
   852	
   853		kvm_x86_call(set_segment)(to_kvm_vcpu(pkvm_vcpu), var, seg);
   854	}
   855	
   856	static void pkvm_set_cr0(struct pkvm_vcpu *pkvm_vcpu, unsigned long cr0)
   857	{
   858		if (WARN_ON_ONCE(!pkvm_vcpu))
   859			return;
   860	
   861		kvm_x86_call(set_cr0)(to_kvm_vcpu(pkvm_vcpu), cr0);
   862	}
   863	
   864	static void pkvm_set_cr4(struct pkvm_vcpu *pkvm_vcpu, unsigned long cr4)
   865	{
   866		if (WARN_ON_ONCE(!pkvm_vcpu))
   867			return;
   868	
   869		kvm_x86_call(set_cr4)(to_kvm_vcpu(pkvm_vcpu), cr4);
   870	}
   871	
   872	static int pkvm_set_msr(struct pkvm_vcpu *pkvm_vcpu, struct msr_data *msr)
   873	{
   874		if (WARN_ON_ONCE(!pkvm_vcpu))
   875			return -EINVAL;
   876	
   877		if (WARN_ON_ONCE(msr != this_pv_param(msr)))
   878			return -EINVAL;
   879	
   880		return kvm_x86_call(set_msr)(to_kvm_vcpu(pkvm_vcpu), msr);
   881	}
   882	
   883	static int pkvm_get_msr(struct pkvm_vcpu *pkvm_vcpu, struct msr_data *msr)
   884	{
   885		if (WARN_ON_ONCE(!pkvm_vcpu))
   886			return -EINVAL;
   887	
   888		if (WARN_ON_ONCE(msr != this_pv_param(msr)))
   889			return -EINVAL;
   890	
   891		return kvm_x86_call(get_msr)(to_kvm_vcpu(pkvm_vcpu), msr);
   892	}
   893	
   894	static int pkvm_set_efer(struct pkvm_vcpu *pkvm_vcpu, u64 efer)
   895	{
   896		if (WARN_ON_ONCE(!pkvm_vcpu))
   897			return -EINVAL;
   898	
   899		return kvm_x86_call(set_efer)(to_kvm_vcpu(pkvm_vcpu), efer);
   900	}
   901	
   902	static void pkvm_access_idt_gdt(struct pkvm_vcpu *pkvm_vcpu, struct desc_ptr *desc,
   903					bool set, bool idt)
   904	{
   905		if (WARN_ON_ONCE(!pkvm_vcpu))
   906			return;
   907	
   908		if (WARN_ON_ONCE(desc != this_pv_param(desc)))
   909			return;
   910	
   911		if (idt) {
   912			if (set)
   913				kvm_x86_call(set_idt)(to_kvm_vcpu(pkvm_vcpu), desc);
   914			else
   915				kvm_x86_call(get_idt)(to_kvm_vcpu(pkvm_vcpu), desc);
   916		} else {
   917			if (set)
   918				kvm_x86_call(set_gdt)(to_kvm_vcpu(pkvm_vcpu), desc);
   919			else
   920				kvm_x86_call(get_gdt)(to_kvm_vcpu(pkvm_vcpu), desc);
   921		}
   922	}
   923	
   924	static void pkvm_set_dr7(struct pkvm_vcpu *pkvm_vcpu, unsigned long val)
   925	{
   926		unsigned long dr7 = val;
   927		struct kvm_vcpu *vcpu;
   928	
   929		if (WARN_ON_ONCE(!pkvm_vcpu))
   930			return;
   931	
   932		vcpu = to_kvm_vcpu(pkvm_vcpu);
   933		kvm_x86_call(set_dr7)(vcpu, dr7);
   934		vcpu->arch.switch_db_regs &= ~KVM_DEBUGREG_BP_ENABLED;
   935		if (dr7 & DR7_BP_EN_MASK)
   936			vcpu->arch.switch_db_regs |= KVM_DEBUGREG_BP_ENABLED;
   937	}
   938	
   939	static unsigned long pkvm_get_rflags(struct pkvm_vcpu *pkvm_vcpu)
   940	{
   941		if (WARN_ON_ONCE(!pkvm_vcpu))
   942			return 0;
   943	
   944		return kvm_x86_call(get_rflags)(to_kvm_vcpu(pkvm_vcpu));
   945	}
   946	
   947	static void pkvm_set_rflags(struct pkvm_vcpu *pkvm_vcpu, unsigned long val)
   948	{
   949		if (WARN_ON_ONCE(!pkvm_vcpu))
   950			return;
   951	
   952		kvm_x86_call(set_rflags)(to_kvm_vcpu(pkvm_vcpu), val);
   953	}
   954	
   955	/*
   956	 * FIXME: For the 4 tlb flushing PV interfaces, revisit to see how to work with
   957	 * the PV EPT when the PV EPT is ready.
   958	 */
   959	static void pkvm_flush_tlb_all(struct pkvm_vcpu *pkvm_vcpu)
   960	{
   961		if (WARN_ON_ONCE(!pkvm_vcpu))
   962			return;
   963	
   964		kvm_x86_call(flush_tlb_all)(to_kvm_vcpu(pkvm_vcpu));
   965	}
   966	
   967	static void pkvm_flush_tlb_current(struct pkvm_vcpu *pkvm_vcpu)
   968	{
   969		if (WARN_ON_ONCE(!pkvm_vcpu))
   970			return;
   971	
   972		kvm_x86_call(flush_tlb_current)(to_kvm_vcpu(pkvm_vcpu));
   973	}
   974	
   975	static void pkvm_flush_tlb_gva(struct pkvm_vcpu *pkvm_vcpu, gva_t addr)
   976	{
   977		if (WARN_ON_ONCE(!pkvm_vcpu))
   978			return;
   979	
   980		kvm_x86_call(flush_tlb_gva)(to_kvm_vcpu(pkvm_vcpu), addr);
   981	}
   982	
   983	static void pkvm_flush_tlb_guest(struct pkvm_vcpu *pkvm_vcpu)
   984	{
   985		if (WARN_ON_ONCE(!pkvm_vcpu))
   986			return;
   987	
   988		kvm_x86_call(flush_tlb_guest)(to_kvm_vcpu(pkvm_vcpu));
   989	}
   990	
   991	static void pkvm_set_interrupt_shadow(struct pkvm_vcpu *pkvm_vcpu, int mask)
   992	{
   993		if (WARN_ON_ONCE(!pkvm_vcpu))
   994			return;
   995	
   996		kvm_x86_call(set_interrupt_shadow)(to_kvm_vcpu(pkvm_vcpu), mask);
   997	}
   998	
   999	static u32 pkvm_get_interrupt_shadow(struct pkvm_vcpu *pkvm_vcpu)
  1000	{
  1001		if (WARN_ON_ONCE(!pkvm_vcpu))
  1002			return 0;
  1003	
  1004		return kvm_x86_call(get_interrupt_shadow)(to_kvm_vcpu(pkvm_vcpu));
  1005	}
  1006	
  1007	static int pkvm_complete_emulated_msr(struct pkvm_vcpu *pkvm_vcpu, int err)
  1008	{
  1009		struct kvm_vcpu *vcpu;
  1010	
  1011		if (WARN_ON_ONCE(!pkvm_vcpu))
  1012			return 0;
  1013	
  1014		vcpu = to_kvm_vcpu(pkvm_vcpu);
  1015		if (!pkvm_is_protected_vcpu(vcpu))
  1016			return kvm_x86_call(complete_emulated_msr)(vcpu, err);
  1017	
  1018		/*
  1019		 * Record the error code from the host for the emulated MSR
  1020		 * rather than completing the emulation via
  1021		 * kvm_x86_call(complete_emulated_msr), so that to prevent the
  1022		 * host from injecting exception or skipping instructions for
  1023		 * the pVM. The msr emulation will be completed before entering the guest.
  1024		 */
  1025		pkvm_vcpu->host_emulated_msr_err = err;
  1026		return 1;
  1027	}
  1028	
  1029	static int __pkvm_interrupt_allowed(struct pkvm_vcpu *pkvm_vcpu, bool for_injection)
  1030	{
  1031		struct kvm_vcpu *vcpu = to_kvm_vcpu(pkvm_vcpu);
  1032	
  1033		if (!for_injection ||
  1034		    (!kvm_event_needs_reinjection(vcpu) &&
  1035		     !vcpu->arch.exception.pending &&
  1036		     !pkvm_vcpu->host_emulated_msr_err))
  1037			return kvm_x86_call(interrupt_allowed)(vcpu, for_injection);
  1038	
  1039		return -EBUSY;
  1040	}
  1041	
  1042	static int pkvm_interrupt_allowed(struct pkvm_vcpu *pkvm_vcpu, bool for_injection)
  1043	{
  1044		if (WARN_ON_ONCE(!pkvm_vcpu))
  1045			return -EBUSY;
  1046	
  1047		return __pkvm_interrupt_allowed(pkvm_vcpu, for_injection);
  1048	}
  1049	
  1050	static int __pkvm_nmi_allowed(struct pkvm_vcpu *pkvm_vcpu, bool for_injection)
  1051	{
  1052		struct kvm_vcpu *vcpu = to_kvm_vcpu(pkvm_vcpu);
  1053	
  1054		if (!for_injection ||
  1055		    (!kvm_event_needs_reinjection(vcpu) &&
  1056		     !vcpu->arch.exception.pending &&
  1057		     !pkvm_vcpu->host_emulated_msr_err))
  1058			return kvm_x86_call(nmi_allowed)(vcpu, for_injection);
  1059	
  1060		return -EBUSY;
  1061	}
  1062	
  1063	static int pkvm_nmi_allowed(struct pkvm_vcpu *pkvm_vcpu, bool for_injection)
  1064	{
  1065		if (WARN_ON_ONCE(!pkvm_vcpu))
  1066			return -EINVAL;
  1067	
  1068		return __pkvm_nmi_allowed(pkvm_vcpu, for_injection);
  1069	}
  1070	
  1071	static void pkvm_inject_irq(struct pkvm_vcpu *pkvm_vcpu)
  1072	{
  1073		struct kvm_vcpu *vcpu, *shared_vcpu;
  1074	
  1075		if (WARN_ON_ONCE(!pkvm_vcpu))
  1076			return;
  1077	
  1078		if (WARN_ON_ONCE(__pkvm_interrupt_allowed(pkvm_vcpu, true) <= 0))
  1079			return;
  1080	
  1081		vcpu = to_kvm_vcpu(pkvm_vcpu);
  1082		shared_vcpu = pkvm_vcpu->shared_vcpu;
  1083		vcpu->arch.interrupt.soft = shared_vcpu->arch.interrupt.soft;
  1084		vcpu->arch.interrupt.nr = shared_vcpu->arch.interrupt.nr;
  1085	
  1086		kvm_x86_call(inject_irq)(vcpu, false);
  1087	}
  1088	
  1089	static void pkvm_inject_nmi(struct pkvm_vcpu *pkvm_vcpu)
  1090	{
  1091		if (WARN_ON_ONCE(!pkvm_vcpu))
  1092			return;
  1093	
  1094		if (WARN_ON_ONCE(__pkvm_nmi_allowed(pkvm_vcpu, true) <= 0))
  1095			return;
  1096	
  1097		kvm_x86_call(inject_nmi)(to_kvm_vcpu(pkvm_vcpu));
  1098	}
  1099	
  1100	static void pkvm_inject_exception(struct pkvm_vcpu *pkvm_vcpu)
  1101	{
  1102		struct kvm_vcpu *vcpu, *shared_vcpu;
  1103	
  1104		if (WARN_ON_ONCE(!pkvm_vcpu))
  1105			return;
  1106	
  1107		vcpu = to_kvm_vcpu(pkvm_vcpu);
  1108		if (WARN_ON_ONCE(pkvm_is_protected_vcpu(vcpu)))
  1109			return;
  1110	
  1111		shared_vcpu = pkvm_vcpu->shared_vcpu;
  1112		vcpu->arch.exception = shared_vcpu->arch.exception;
  1113	
  1114		kvm_x86_call(inject_exception)(vcpu);
  1115	}
  1116	
  1117	static void pkvm_cancel_injection(struct pkvm_vcpu *pkvm_vcpu)
  1118	{
  1119		struct kvm_vcpu *vcpu, *shared_vcpu;
  1120	
  1121		if (WARN_ON_ONCE(!pkvm_vcpu))
  1122			return;
  1123	
  1124		vcpu = to_kvm_vcpu(pkvm_vcpu);
  1125		kvm_x86_call(cancel_injection)(vcpu);
  1126	
  1127		shared_vcpu = pkvm_vcpu->shared_vcpu;
  1128		if (vcpu->arch.nmi_injected) {
  1129			shared_vcpu->arch.nmi_injected = true;
  1130			vcpu->arch.nmi_injected = false;
  1131		} else if (vcpu->arch.interrupt.injected) {
  1132			kvm_queue_interrupt(shared_vcpu, vcpu->arch.interrupt.nr,
  1133					    vcpu->arch.interrupt.soft);
  1134			kvm_clear_interrupt_queue(vcpu);
  1135		} else if (!pkvm_is_protected_vcpu(vcpu) && vcpu->arch.exception.injected) {
  1136			/*
  1137			 * For the pVM, the exception can only be injected and canceled
> 1138			 * by the pkvm hypervisor.
  1139			 * For the npVM, the exception can be injected and caceled by
  1140			 * both sides.
  1141			 */
  1142			shared_vcpu->arch.exception = vcpu->arch.exception;
  1143			kvm_clear_exception_queue(vcpu);
  1144		}
  1145	}
  1146	
  1147	static bool pkvm_get_nmi_mask(struct pkvm_vcpu *pkvm_vcpu)
  1148	{
  1149		if (WARN_ON_ONCE(!pkvm_vcpu))
  1150			return false;
  1151	
  1152		return kvm_x86_call(get_nmi_mask)(to_kvm_vcpu(pkvm_vcpu));
  1153	}
  1154	
  1155	static void pkvm_set_nmi_mask(struct pkvm_vcpu *pkvm_vcpu, bool masked)
  1156	{
  1157		if (WARN_ON_ONCE(!pkvm_vcpu))
  1158			return;
  1159	
  1160		kvm_x86_call(set_nmi_mask)(to_kvm_vcpu(pkvm_vcpu), masked);
  1161	}
  1162	
  1163	static void pkvm_enable_nmi_window(struct pkvm_vcpu *pkvm_vcpu)
  1164	{
  1165		if (WARN_ON_ONCE(!pkvm_vcpu))
  1166			return;
  1167	
  1168		kvm_x86_call(enable_nmi_window)(to_kvm_vcpu(pkvm_vcpu));
  1169	}
  1170	
  1171	static void pkvm_enable_irq_window(struct pkvm_vcpu *pkvm_vcpu)
  1172	{
  1173		if (WARN_ON_ONCE(!pkvm_vcpu))
  1174			return;
  1175	
  1176		kvm_x86_call(enable_irq_window)(to_kvm_vcpu(pkvm_vcpu));
  1177	}
  1178	
  1179	static void pkvm_update_cr8_intercept(struct pkvm_vcpu *pkvm_vcpu, int tpr, int irr)
  1180	{
  1181		if (WARN_ON_ONCE(!pkvm_vcpu))
  1182			return;
  1183	
  1184		kvm_x86_call(update_cr8_intercept)(to_kvm_vcpu(pkvm_vcpu), tpr, irr);
  1185	}
  1186	
  1187	static void pkvm_set_virtual_apic_mode(struct pkvm_vcpu *pkvm_vcpu, u64 apic_base)
  1188	{
  1189		struct kvm_vcpu *vcpu;
  1190	
  1191		if (WARN_ON_ONCE(!pkvm_vcpu))
  1192			return;
  1193	
  1194		vcpu = to_kvm_vcpu(pkvm_vcpu);
  1195		vcpu->arch.apic_base = apic_base;
  1196	
  1197		kvm_x86_call(set_virtual_apic_mode)(vcpu);
  1198	}
  1199	
  1200	static void pkvm_refresh_apicv_exec_ctrl(struct pkvm_vcpu *pkvm_vcpu, bool apicv_active)
  1201	{
  1202		if (WARN_ON_ONCE(!pkvm_vcpu))
  1203			return;
  1204	
  1205		kvm_x86_call(refresh_apicv_exec_ctrl)(to_kvm_vcpu(pkvm_vcpu));
  1206	}
  1207	
  1208	static void pkvm_load_eoi_exitmap(struct pkvm_vcpu *pkvm_vcpu, u64 *eoi_exit_bitmap)
  1209	{
  1210		if (WARN_ON_ONCE(!pkvm_vcpu))
  1211			return;
  1212	
  1213		if (WARN_ON_ONCE(eoi_exit_bitmap != this_pv_param(eoi_exit_bitmap[0])))
  1214			return;
  1215	
  1216		kvm_x86_call(load_eoi_exitmap)(to_kvm_vcpu(pkvm_vcpu), eoi_exit_bitmap);
  1217	}
  1218	
> 1219	static void pkvm_hwapic_irr_update(struct pkvm_vcpu *pkvm_vcpu, int max_irr)
  1220	{
  1221		if (WARN_ON_ONCE(!pkvm_vcpu))
  1222			return;
  1223	
  1224		kvm_x86_call(hwapic_irr_update)(to_kvm_vcpu(pkvm_vcpu), max_irr);
  1225	}
  1226	
> 1227	static void pkvm_hwapic_isr_update(struct pkvm_vcpu *pkvm_vcpu, int max_isr)
  1228	{
  1229		if (WARN_ON_ONCE(!pkvm_vcpu))
  1230			return;
  1231	
  1232		kvm_x86_call(hwapic_isr_update)(to_kvm_vcpu(pkvm_vcpu), max_isr);
  1233	}
  1234	
  1235	static void pkvm_write_tsc_offset(struct pkvm_vcpu *pkvm_vcpu, u64 tsc_offset)
  1236	{
  1237		struct kvm_vcpu *vcpu;
  1238	
  1239		if (WARN_ON_ONCE(!pkvm_vcpu))
  1240			return;
  1241	
  1242		vcpu = to_kvm_vcpu(pkvm_vcpu);
  1243		vcpu->arch.l1_tsc_offset = tsc_offset;
  1244		vcpu->arch.tsc_offset = tsc_offset;
  1245		kvm_x86_call(write_tsc_offset)(vcpu);
  1246	}
  1247	
  1248	static void pkvm_write_tsc_multiplier(struct pkvm_vcpu *pkvm_vcpu, u64 ratio)
  1249	{
  1250		struct kvm_vcpu *vcpu;
  1251	
  1252		if (!kvm_caps.has_tsc_control)
  1253			return;
  1254	
  1255		if (WARN_ON_ONCE(!pkvm_vcpu))
  1256			return;
  1257	
  1258		vcpu = to_kvm_vcpu(pkvm_vcpu);
  1259		vcpu->arch.l1_tsc_scaling_ratio = ratio;
  1260		vcpu->arch.tsc_scaling_ratio = ratio;
  1261		kvm_x86_call(write_tsc_multiplier)(vcpu);
  1262	}
  1263	
  1264	static void pkvm_post_set_cr3(struct pkvm_vcpu *pkvm_vcpu, unsigned long cr3)
  1265	{
  1266		if (WARN_ON_ONCE(!pkvm_vcpu))
  1267			return;
  1268	
  1269		kvm_x86_call(post_set_cr3)(to_kvm_vcpu(pkvm_vcpu), cr3);
  1270	}
  1271	
  1272	static void pkvm_load_mmu_pgd(struct pkvm_vcpu *pkvm_vcpu, hpa_t root_hpa, int root_level)
  1273	{
  1274		struct kvm_vcpu *vcpu;
  1275	
  1276		if (WARN_ON_ONCE(!pkvm_vcpu))
  1277			return;
  1278	
  1279		vcpu = to_kvm_vcpu(pkvm_vcpu);
  1280	
  1281		pkvm_x86_call(setup_virtual_mmu)(vcpu, root_hpa, root_level);
  1282	
  1283		kvm_x86_call(load_mmu_pgd)(vcpu, vcpu->arch.mmu->root.hpa,
  1284					   vcpu->arch.mmu->root_role.level);
  1285	}
  1286	
  1287	static void pkvm_setup_mce(struct pkvm_vcpu *pkvm_vcpu, u64 mcg_cap)
  1288	{
  1289		struct kvm_vcpu *vcpu;
  1290	
  1291		if (WARN_ON_ONCE(!pkvm_vcpu))
  1292			return;
  1293	
  1294		vcpu = to_kvm_vcpu(pkvm_vcpu);
  1295		vcpu->arch.mcg_cap = mcg_cap;
  1296		kvm_x86_call(setup_mce)(vcpu);
  1297	}
  1298	
  1299	static unsigned long pkvm_cache_reg(struct pkvm_vcpu *pkvm_vcpu, enum kvm_reg reg)
  1300	{
  1301		struct kvm_vcpu *vcpu, *shared_vcpu;
  1302	
  1303		if (WARN_ON_ONCE(!pkvm_vcpu))
  1304			return 0;
  1305	
  1306		vcpu = to_kvm_vcpu(pkvm_vcpu);
  1307	
  1308		kvm_x86_call(cache_reg)(vcpu, reg);
  1309	
  1310		shared_vcpu = pkvm_vcpu->shared_vcpu;
  1311	
  1312		switch (reg) {
  1313		case VCPU_REGS_RSP:
  1314			shared_vcpu->arch.regs[VCPU_REGS_RSP] = vcpu->arch.regs[VCPU_REGS_RSP];
  1315			break;
  1316		case VCPU_REGS_RIP:
  1317			shared_vcpu->arch.regs[VCPU_REGS_RIP] = vcpu->arch.regs[VCPU_REGS_RIP];
  1318			break;
  1319		case VCPU_EXREG_PDPTR: {
  1320			struct kvm_mmu *shared_mmu = shared_vcpu->arch.walk_mmu;
  1321			struct kvm_mmu *mmu = vcpu->arch.walk_mmu;
  1322	
  1323			shared_mmu->pdptrs[0] = mmu->pdptrs[0];
  1324			shared_mmu->pdptrs[1] = mmu->pdptrs[1];
  1325			shared_mmu->pdptrs[2] = mmu->pdptrs[2];
  1326			shared_mmu->pdptrs[3] = mmu->pdptrs[3];
  1327	
  1328			break;
  1329		}
  1330		case VCPU_EXREG_CR0:
  1331			shared_vcpu->arch.cr0 = vcpu->arch.cr0;
  1332			break;
  1333		case VCPU_EXREG_CR3:
  1334			shared_vcpu->arch.cr3 = vcpu->arch.cr3;
  1335			break;
  1336		case VCPU_EXREG_CR4:
  1337			shared_vcpu->arch.cr4 = vcpu->arch.cr4;
  1338			break;
  1339		default:
  1340			pr_err("pkvm: Unsupported register %d\n", reg);
  1341			break;
  1342		}
  1343	
  1344		return 0;
  1345	}
  1346	
  1347	static void pkvm_update_cpuid_runtime(struct pkvm_vcpu *pkvm_vcpu)
  1348	{
  1349		struct kvm_vcpu *vcpu, *shared_vcpu;
  1350		u64 old_apic_base;
  1351	
  1352		if (WARN_ON_ONCE(!pkvm_vcpu))
  1353			return;
  1354	
  1355		vcpu = to_kvm_vcpu(pkvm_vcpu);
  1356		shared_vcpu = pkvm_vcpu->shared_vcpu;
  1357	
  1358		old_apic_base = vcpu->arch.apic_base;
  1359		vcpu->arch.apic_base = shared_vcpu->arch.apic_base;
  1360	
  1361		if ((old_apic_base ^ vcpu->arch.apic_base) & MSR_IA32_APICBASE_ENABLE)
  1362			kvm_update_cpuid_runtime(vcpu);
  1363	}
  1364	
  1365	static void pkvm_update_exception_bitmap(struct pkvm_vcpu *pkvm_vcpu)
  1366	{
  1367		struct kvm_vcpu *vcpu, *shared_vcpu;
  1368	
  1369		if (WARN_ON_ONCE(!pkvm_vcpu))
  1370			return;
  1371	
  1372		vcpu = to_kvm_vcpu(pkvm_vcpu);
  1373		shared_vcpu = pkvm_vcpu->shared_vcpu;
  1374		vcpu->guest_debug = shared_vcpu->guest_debug;
  1375	
  1376		kvm_x86_call(update_exception_bitmap)(vcpu);
  1377	}
  1378	
  1379	static unsigned long pkvm_vcpu_handle_kvm_call(unsigned long fn,
  1380						       struct kvm_vcpu *shared_vcpu,
  1381						       unsigned long p2, unsigned  long p3)
  1382	{
  1383		struct pkvm_vcpu *pkvm_vcpu;
  1384		unsigned long ret = 0;
  1385	
  1386		pkvm_vcpu = load_pkvm_vcpu(shared_vcpu, fn);
  1387	
  1388		switch (fn) {
  1389		case __pkvm__vcpu_load:
  1390			pkvm_vcpu_load(pkvm_vcpu, (int)p2);
  1391			break;
  1392		case __pkvm__vcpu_put:
  1393			pkvm_vcpu_put(pkvm_vcpu);
  1394			break;
  1395		case __pkvm__vcpu_run:
  1396			ret = pkvm_vcpu_run(pkvm_vcpu, (bool)p2);
  1397			break;
  1398		case __pkvm__vcpu_after_set_cpuid:
  1399			ret = pkvm_vcpu_after_set_cpuid(pkvm_vcpu, p2);
  1400			break;
  1401		case __pkvm__vcpu_reset:
  1402			pkvm_reset_vcpu(pkvm_vcpu, (bool)p2);
  1403			break;
  1404		case __pkvm__get_segment_base:
  1405			ret = pkvm_get_segment_base(pkvm_vcpu, (int)p2);
  1406			break;
  1407		case __pkvm__get_segment:
  1408			pkvm_get_segment(pkvm_vcpu, (struct kvm_segment *)kern_pkvm_va((void *)p2),
  1409					 (int)p3);
  1410			break;
  1411		case __pkvm__set_segment:
  1412			pkvm_set_segment(pkvm_vcpu, (struct kvm_segment *)kern_pkvm_va((void *)p2),
  1413					 (int)p3);
  1414			break;
  1415		case __pkvm__set_cr0:
  1416			pkvm_set_cr0(pkvm_vcpu, (unsigned long)p2);
  1417			break;
  1418		case __pkvm__set_cr4:
  1419			pkvm_set_cr4(pkvm_vcpu, (unsigned long)p2);
  1420			break;
  1421		case __pkvm__set_msr:
  1422			ret = pkvm_set_msr(pkvm_vcpu, (struct msr_data *)kern_pkvm_va((void *)p2));
  1423			break;
  1424		case __pkvm__get_msr:
  1425			ret = pkvm_get_msr(pkvm_vcpu, (struct msr_data *)kern_pkvm_va((void *)p2));
  1426			break;
  1427		case __pkvm__set_efer:
  1428			ret = pkvm_set_efer(pkvm_vcpu, (u64)p2);
  1429			break;
  1430		case __pkvm__get_idt:
  1431			pkvm_access_idt_gdt(pkvm_vcpu, (struct desc_ptr *)kern_pkvm_va((void *)p2),
  1432					    false, true);
  1433			break;
  1434		case __pkvm__set_idt:
  1435			pkvm_access_idt_gdt(pkvm_vcpu, (struct desc_ptr *)kern_pkvm_va((void *)p2),
  1436					    true, true);
  1437			break;
  1438		case __pkvm__get_gdt:
  1439			pkvm_access_idt_gdt(pkvm_vcpu, (struct desc_ptr *)kern_pkvm_va((void *)p2),
  1440					    false, false);
  1441			break;
  1442		case __pkvm__set_gdt:
  1443			pkvm_access_idt_gdt(pkvm_vcpu, (struct desc_ptr *)kern_pkvm_va((void *)p2),
  1444					    true, false);
  1445			break;
  1446		case __pkvm__set_dr7:
  1447			pkvm_set_dr7(pkvm_vcpu, p2);
  1448			break;
  1449		case __pkvm__get_rflags:
  1450			ret = pkvm_get_rflags(pkvm_vcpu);
  1451			break;
  1452		case __pkvm__set_rflags:
  1453			pkvm_set_rflags(pkvm_vcpu, p2);
  1454			break;
  1455		case __pkvm__flush_tlb_all:
  1456			pkvm_flush_tlb_all(pkvm_vcpu);
  1457			break;
  1458		case __pkvm__flush_tlb_current:
  1459			pkvm_flush_tlb_current(pkvm_vcpu);
  1460			break;
  1461		case __pkvm__flush_tlb_gva:
  1462			pkvm_flush_tlb_gva(pkvm_vcpu, (gva_t)p2);
  1463			break;
  1464		case __pkvm__flush_tlb_guest:
  1465			pkvm_flush_tlb_guest(pkvm_vcpu);
  1466			break;
  1467		case __pkvm__set_interrupt_shadow:
  1468			pkvm_set_interrupt_shadow(pkvm_vcpu, (int)p2);
  1469			break;
  1470		case __pkvm__get_interrupt_shadow:
  1471			ret = pkvm_get_interrupt_shadow(pkvm_vcpu);
  1472			break;
  1473		case __pkvm__complete_emulated_msr:
  1474			ret = pkvm_complete_emulated_msr(pkvm_vcpu, (int)p2);
  1475			break;
  1476		case __pkvm__interrupt_allowed:
  1477			ret = pkvm_interrupt_allowed(pkvm_vcpu, (bool)p2);
  1478			break;
  1479		case __pkvm__nmi_allowed:
  1480			ret = pkvm_nmi_allowed(pkvm_vcpu, (bool)p2);
  1481			break;
  1482		case __pkvm__inject_irq:
  1483			pkvm_inject_irq(pkvm_vcpu);
  1484			break;
  1485		case __pkvm__inject_nmi:
  1486			pkvm_inject_nmi(pkvm_vcpu);
  1487			break;
  1488		case __pkvm__inject_exception:
  1489			pkvm_inject_exception(pkvm_vcpu);
  1490			break;
  1491		case __pkvm__cancel_injection:
  1492			pkvm_cancel_injection(pkvm_vcpu);
  1493			break;
  1494		case __pkvm__get_nmi_mask:
  1495			ret = pkvm_get_nmi_mask(pkvm_vcpu);
  1496			break;
  1497		case __pkvm__set_nmi_mask:
  1498			pkvm_set_nmi_mask(pkvm_vcpu, (bool)p2);
  1499			break;
  1500		case __pkvm__enable_nmi_window:
  1501			pkvm_enable_nmi_window(pkvm_vcpu);
  1502			break;
  1503		case __pkvm__enable_irq_window:
  1504			pkvm_enable_irq_window(pkvm_vcpu);
  1505			break;
  1506		case __pkvm__update_cr8_intercept:
  1507			pkvm_update_cr8_intercept(pkvm_vcpu, (int)p2, (int)p3);
  1508			break;
  1509		case __pkvm__set_virtual_apic_mode:
  1510			pkvm_set_virtual_apic_mode(pkvm_vcpu, (u64)p2);
  1511			break;
  1512		case __pkvm__refresh_apicv_exec_ctrl:
  1513			pkvm_refresh_apicv_exec_ctrl(pkvm_vcpu, (bool)p2);
  1514			break;
  1515		case __pkvm__load_eoi_exitmap:
  1516			pkvm_load_eoi_exitmap(pkvm_vcpu, (u64 *)p2);
  1517			break;
  1518		case __pkvm__hwapic_irr_update:
> 1519			pkvm_hwapic_irr_update(pkvm_vcpu, (int)p2);
  1520			break;
  1521		case __pkvm__hwapic_isr_update:
> 1522			pkvm_hwapic_isr_update(pkvm_vcpu, (int)p2);
  1523			break;
  1524		case __pkvm__write_tsc_offset:
  1525			pkvm_write_tsc_offset(pkvm_vcpu, (u64)p2);
  1526			break;
  1527		case __pkvm__write_tsc_multiplier:
  1528			pkvm_write_tsc_multiplier(pkvm_vcpu, (u64)p2);
  1529			break;
  1530		case __pkvm__post_set_cr3:
  1531			pkvm_post_set_cr3(pkvm_vcpu, p2);
  1532			break;
  1533		case __pkvm__load_mmu_pgd:
  1534			pkvm_load_mmu_pgd(pkvm_vcpu, (hpa_t)p2, (int)p3);
  1535			break;
  1536		case __pkvm__setup_mce:
  1537			pkvm_setup_mce(pkvm_vcpu, (u64)p2);
  1538			break;
  1539		case __pkvm__cache_reg:
  1540			ret = pkvm_cache_reg(pkvm_vcpu, (enum kvm_reg)p2);
  1541			break;
  1542		case __pkvm__update_cpuid_runtime:
  1543			pkvm_update_cpuid_runtime(pkvm_vcpu);
  1544			break;
  1545		case __pkvm__update_exception_bitmap:
  1546			pkvm_update_exception_bitmap(pkvm_vcpu);
  1547			break;
  1548		default:
  1549			ret = -EINVAL;
  1550			break;
  1551		}
  1552	
  1553		unload_pkvm_vcpu(pkvm_vcpu);
  1554	
  1555		return ret;
  1556	}
  1557	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
