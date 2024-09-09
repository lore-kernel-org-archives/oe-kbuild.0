Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68C51B1D7A
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Sep 2024 11:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725881592; cv=none; b=BPWWzxzxvoNBhsZWDITxIGO1iD1a1W4ixYm/a+K6nxeaiiATYSByeigB/gdPUyt3hNzd7YTtjOUr7IuhpQ7Ei3ZZl01HUTHXJdT3zy8tgTiToaAk0km2ZJ8c9ZHV8UJ0Bby95j1iVmikY/0+odbRwvW5O6zyN+txV7wMjZ4pzw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725881592; c=relaxed/simple;
	bh=jixlALS5Ay5MXMIei9738jHj33N8AEIX56N4IuXPsWA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uO8pxNeCJ7nEteWPi2FlPQ8hCKZs8h8eH83K/+2AYlnZqou8P2Vya6v0zXmNN9p3CYQ9/6wldJJV6KGsuSpkFbkGd4QQcz3XOLTB7PbfubqncBgfNDzi69D8ZYr0UcQj276ZX2pRNUrFGpcq+iP/lNSJtfvr6d+7saNNrC37OcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PFThRCYW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PFThRCYW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725881590; x=1757417590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jixlALS5Ay5MXMIei9738jHj33N8AEIX56N4IuXPsWA=;
  b=PFThRCYW0hNiqYcrLHox4pFC9+DhR0JYogVNo7BfEWuGZA12Xvw/ST6F
   TqfIP1dtxvy6ElnmQpn9rz+I9UGoLKGMb7XBeUCX1kmir6vRFCB7UICzO
   RDqzEx6UjA7R9Xnj8Wy2FhnOBTjNyy86+6qkfJ1kmusaHylmPVdv5AgO0
   b26J1/R4j6NDc3P2wYH40cegtR1014BucVozHH70QgsFN82LZKwZEt9hN
   30MPe8G4thhPWgMguH3XrfcV1nNiewNSTO4SQ8K7Gp334B2e6Lu5F94fC
   qigLks4egbHL4RFLXNbGccCjngeUHRAsreInDJ+SkEddE914cz9xa1LB8
   Q==;
X-CSE-ConnectionGUID: 2cVxkTryS8ez+KIXmWHM4w==
X-CSE-MsgGUID: pzjfbDQRTYSkRfuYg4ZBEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24733617"
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="24733617"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 04:33:09 -0700
X-CSE-ConnectionGUID: YoIB00HDS8ua20aZXk1Gcw==
X-CSE-MsgGUID: vC9M/0wAQQ6MdfpsOzeZ1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="scan'208";a="71425003"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Sep 2024 04:33:08 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sncdl-000Eea-06;
	Mon, 09 Sep 2024 11:33:05 +0000
Date: Mon, 9 Sep 2024 19:32:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kvm:queue 18/24] arch/x86/kvm/x86.c:12591
 kvm_arch_enable_virtualization_cpu() warn: iterator 'i' not incremented
Message-ID: <202409091927.eRgV2rYZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: kvm@vger.kernel.org
CC: Robert Hu <robert.hu@intel.com>
CC: Farrah Chen <farrah.chen@intel.com>
CC: Danmei Wei <danmei.wei@intel.com>
TO: Sean Christopherson <seanjc@google.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Kai Huang <kai.huang@intel.com>

Hi Sean,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
head:   590b09b1d88e18ae57f89930a6f7b89795d2e9f3
commit: 071f24ad28cdcdfa544fdb79b1b1d2b423717a11 [18/24] KVM: Rename arch hooks related to per-CPU virtualization enabling
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20240909 (https://download.01.org/0day-ci/archive/20240909/202409091927.eRgV2rYZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409091927.eRgV2rYZ-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/x86.c:12591 kvm_arch_enable_virtualization_cpu() warn: iterator 'i' not incremented

Old smatch warnings:
arch/x86/kvm/x86.c:1087 __kvm_set_xcr() warn: bitwise AND condition is false here
arch/x86/kvm/x86.c:1088 __kvm_set_xcr() warn: bitwise AND condition is false here
arch/x86/kvm/x86.c:3054 kvm_end_pvclock_update() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:3404 kvmclock_update_fn() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:5760 kvm_arch_tsc_set_attr() warn: check for integer overflow 'offset'
arch/x86/kvm/x86.c:5802 kvm_vcpu_ioctl_device_attr() error: uninitialized symbol 'r'.
arch/x86/kvm/x86.c:6502 kvm_arch_sync_dirty_log() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:6945 kvm_arch_suspend_notifier() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:8016 emulator_read_write() warn: missing error code? 'rc'
arch/x86/kvm/x86.c:9195 x86_emulate_instruction() warn: missing error code? 'r'
arch/x86/kvm/x86.c:9566 __kvmclock_cpufreq_notifier() warn: iterator 'i' not incremented
arch/x86/include/asm/kvm-x86-ops.h:16 kvm_ops_update() warn: inconsistent indenting
arch/x86/kvm/x86.c:12009 kvm_arch_vcpu_guestdbg_update_apicv_inhibit() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:12722 kvm_unload_vcpu_mmus() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:12972 kvm_arch_memslots_updated() warn: iterator 'i' not incremented

vim +/i +12591 arch/x86/kvm/x86.c

e9b11c17552afe drivers/kvm/x86.c  Zhang Xiantao       2007-11-14  12514  
071f24ad28cdcd arch/x86/kvm/x86.c Sean Christopherson 2024-08-29  12515  int kvm_arch_enable_virtualization_cpu(void)
e9b11c17552afe drivers/kvm/x86.c  Zhang Xiantao       2007-11-14  12516  {
ca84d1a24c376e arch/x86/kvm/x86.c Zachary Amsden      2010-08-19  12517  	struct kvm *kvm;
ca84d1a24c376e arch/x86/kvm/x86.c Zachary Amsden      2010-08-19  12518  	struct kvm_vcpu *vcpu;
46808a4cb89708 arch/x86/kvm/x86.c Marc Zyngier        2021-11-16  12519  	unsigned long i;
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12520  	int ret;
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12521  	u64 local_tsc;
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12522  	u64 max_tsc = 0;
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12523  	bool stable, backwards_tsc = false;
18863bdd60f895 arch/x86/kvm/x86.c Avi Kivity          2009-09-07  12524  
7e34fbd05c6350 arch/x86/kvm/x86.c Sean Christopherson 2020-09-23  12525  	kvm_user_return_msr_cpu_online();
c82a5c5c53c5b7 arch/x86/kvm/x86.c Chao Gao            2022-11-30  12526  
c82a5c5c53c5b7 arch/x86/kvm/x86.c Chao Gao            2022-11-30  12527  	ret = kvm_x86_check_processor_compatibility();
c82a5c5c53c5b7 arch/x86/kvm/x86.c Chao Gao            2022-11-30  12528  	if (ret)
c82a5c5c53c5b7 arch/x86/kvm/x86.c Chao Gao            2022-11-30  12529  		return ret;
c82a5c5c53c5b7 arch/x86/kvm/x86.c Chao Gao            2022-11-30  12530  
896046474f8d2e arch/x86/kvm/x86.c Wei Wang            2024-05-07  12531  	ret = kvm_x86_call(hardware_enable)();
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12532  	if (ret != 0)
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12533  		return ret;
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12534  
4ea1636b04dbd6 arch/x86/kvm/x86.c Andy Lutomirski     2015-06-25  12535  	local_tsc = rdtsc();
b0c39dc68e3b3d arch/x86/kvm/x86.c Vitaly Kuznetsov    2018-01-24  12536  	stable = !kvm_check_tsc_unstable();
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12537  	list_for_each_entry(kvm, &vm_list, vm_list) {
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12538  		kvm_for_each_vcpu(i, vcpu, kvm) {
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12539  			if (!stable && vcpu->cpu == smp_processor_id())
105b21bbf67bb5 arch/x86/kvm/x86.c Guo Hui Liu         2014-09-12  12540  				kvm_make_request(KVM_REQ_CLOCK_UPDATE, vcpu);
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12541  			if (stable && vcpu->arch.last_host_tsc > local_tsc) {
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12542  				backwards_tsc = true;
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12543  				if (vcpu->arch.last_host_tsc > max_tsc)
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12544  					max_tsc = vcpu->arch.last_host_tsc;
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12545  			}
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12546  		}
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12547  	}
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12548  
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12549  	/*
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12550  	 * Sometimes, even reliable TSCs go backwards.  This happens on
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12551  	 * platforms that reset TSC during suspend or hibernate actions, but
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12552  	 * maintain synchronization.  We must compensate.  Fortunately, we can
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12553  	 * detect that condition here, which happens early in CPU bringup,
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12554  	 * before any KVM threads can be running.  Unfortunately, we can't
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12555  	 * bring the TSCs fully up to date with real time, as we aren't yet far
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12556  	 * enough into CPU bringup that we know how much real time has actually
9285ec4c8b61d4 arch/x86/kvm/x86.c Jason A. Donenfeld  2019-06-21  12557  	 * elapsed; our helper function, ktime_get_boottime_ns() will be using boot
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12558  	 * variables that haven't been updated yet.
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12559  	 *
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12560  	 * So we simply find the maximum observed TSC above, then record the
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12561  	 * adjustment to TSC in each VCPU.  When the VCPU later gets loaded,
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12562  	 * the adjustment will be applied.  Note that we accumulate
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12563  	 * adjustments, in case multiple suspend cycles happen before some VCPU
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12564  	 * gets a chance to run again.  In the event that no KVM threads get a
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12565  	 * chance to run, we will miss the entire elapsed period, as we'll have
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12566  	 * reset last_host_tsc, so VCPUs will not have the TSC adjusted and may
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12567  	 * loose cycle time.  This isn't too big a deal, since the loss will be
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12568  	 * uniform across all VCPUs (not to mention the scenario is extremely
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12569  	 * unlikely). It is possible that a second hibernate recovery happens
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12570  	 * much faster than a first, causing the observed TSC here to be
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12571  	 * smaller; this would require additional padding adjustment, which is
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12572  	 * why we set last_host_tsc to the local tsc observed here.
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12573  	 *
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12574  	 * N.B. - this code below runs only on platforms with reliable TSC,
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12575  	 * as that is the only way backwards_tsc is set above.  Also note
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12576  	 * that this runs for ALL vcpus, which is not a bug; all VCPUs should
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12577  	 * have the same delta_cyc adjustment applied if backwards_tsc
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12578  	 * is detected.  Note further, this adjustment is only done once,
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12579  	 * as we reset last_host_tsc on all VCPUs to stop this from being
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12580  	 * called multiple times (one for each physical CPU bringup).
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12581  	 *
4a9699807c4917 arch/x86/kvm/x86.c Guo Chao            2012-06-28  12582  	 * Platforms with unreliable TSCs don't have to deal with this, they
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12583  	 * will be compensated by the logic in vcpu_load, which sets the TSC to
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12584  	 * catchup mode.  This will catchup all VCPUs to real time, but cannot
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12585  	 * guarantee that they stay in perfect synchronization.
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12586  	 */
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12587  	if (backwards_tsc) {
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12588  		u64 delta_cyc = max_tsc - local_tsc;
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12589  		list_for_each_entry(kvm, &vm_list, vm_list) {
a826faf108e2d8 arch/x86/kvm/x86.c Ladi Prosek         2017-06-26  12590  			kvm->arch.backwards_tsc_observed = true;
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03 @12591  			kvm_for_each_vcpu(i, vcpu, kvm) {
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12592  				vcpu->arch.tsc_offset_adjustment += delta_cyc;
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12593  				vcpu->arch.last_host_tsc = local_tsc;
105b21bbf67bb5 arch/x86/kvm/x86.c Guo Hui Liu         2014-09-12  12594  				kvm_make_request(KVM_REQ_MASTERCLOCK_UPDATE, vcpu);
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12595  			}
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12596  
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12597  			/*
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12598  			 * We have to disable TSC offset matching.. if you were
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12599  			 * booting a VM while issuing an S4 host suspend....
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12600  			 * you may have some problem.  Solving this issue is
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12601  			 * left as an exercise to the reader.
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12602  			 */
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12603  			kvm->arch.last_tsc_nsec = 0;
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12604  			kvm->arch.last_tsc_write = 0;
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12605  		}
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12606  
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12607  	}
0dd6a6edb0124e arch/x86/kvm/x86.c Zachary Amsden      2012-02-03  12608  	return 0;
e9b11c17552afe drivers/kvm/x86.c  Zhang Xiantao       2007-11-14  12609  }
e9b11c17552afe drivers/kvm/x86.c  Zhang Xiantao       2007-11-14  12610  

:::::: The code at line 12591 was first introduced by commit
:::::: 0dd6a6edb0124e6c71931ff575b18e15ed6e8603 KVM: Dont mark TSC unstable due to S4 suspend

:::::: TO: Zachary Amsden <zamsden@gmail.com>
:::::: CC: Avi Kivity <avi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
