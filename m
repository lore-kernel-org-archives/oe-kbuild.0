Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D5433C7
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Jul 2024 22:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720390969; cv=none; b=FeTJ3rG6DWFYtAuilZw3MtRicIVaRATb/WEKiaU9NSAwlMI2SdF8f8Hkfd4kUaeBsHEC9qyNzU+vVO0D7pd68RDMROW4UdwtGnIx6Arg8LdI/PkNKJTMT3NB1fiqtvqsr94x9mLEL/7P4siOkzt1RlSCj4lwKEjs0OZXkzNIseI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720390969; c=relaxed/simple;
	bh=L9aTOI/PdCK5d2PUgxfc9FTFBCTIFDDJF6BaYWXgbIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OoCm94oM3sSq3YlMxo9i4q2a8T7FQ4LkSd6vG/UOSxO0lJl8RWbsdEVyMdXDrWcZRhXh6snf/7BbUydpLXxCCx+P7rkfXCeXR+YlEX/jbcsAHBLl/opIeCbB3WqGlzu5R8+sKR9Rc/rf1FKIIDy10F4QIrkX28SyofRXa4TwitQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L6ElqoKx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6ElqoKx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720390967; x=1751926967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L9aTOI/PdCK5d2PUgxfc9FTFBCTIFDDJF6BaYWXgbIw=;
  b=L6ElqoKxRarq+QzjrnUtPpC/dzLVKn/UUC14Ub9+pWe+MjmYI40UB425
   4qZmNqcI4zdulZZXiTa11Fhw8YVv7rk4BUaflBjknCQpZjZBONwUbzX54
   9U0zGHVWEWjW5jlgjebvAoJcgQpgW43Ay364DjBbaibngAYgjrVmAoLsp
   CTka4gM0wNFqogDT3NVgPudTC5ykIWKuyA0j/dSSJwFv83RRYGYq/h0R7
   ypAnuJYRxu/WdRAGyvteN8mxtCycS8EtF3pisITs7O5AvgaUCfH08YGzR
   LOJNJYGPxj5CFJUCdAKsAryFTYajTHPShg8IG7mqGGZXIjRjhFGas3hWD
   g==;
X-CSE-ConnectionGUID: YZoYkmcrSg6AvXqD53RVZw==
X-CSE-MsgGUID: z1BO0enGTEedy03xbbp3VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17399100"
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="17399100"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2024 15:22:46 -0700
X-CSE-ConnectionGUID: /b/k9MJLTZ2hHfLxrAlZVg==
X-CSE-MsgGUID: z4PWoqj6T+KLqX7u/1J1ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,190,1716274800"; 
   d="scan'208";a="47096849"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Jul 2024 15:22:46 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQaHL-000VJg-2e;
	Sun, 07 Jul 2024 22:22:43 +0000
Date: Mon, 8 Jul 2024 06:22:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dwmw2:vmclock 15/22] arch/x86/kvm/x86.c:2531
 kvm_track_tsc_matching() warn: iterator 'i' not incremented
Message-ID: <202407080604.xD7QOoXo-lkp@intel.com>
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
TO: David Woodhouse <dwmw@amazon.co.uk>
CC: Paul Durrant <paul@xen.org>

tree:   git://git.infradead.org/users/dwmw2/linux vmclock
head:   db3ab1c0cc360f9a6e4ccef13dafa182511752d3
commit: e3dc2e2e4e3cf61435793a29402b75e70290bf5f [15/22] KVM: x86: Allow KVM master clock mode when TSCs are offset from each other
:::::: branch date: 31 hours ago
:::::: commit date: 5 weeks ago
config: x86_64-randconfig-161-20240708 (https://download.01.org/0day-ci/archive/20240708/202407080604.xD7QOoXo-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407080604.xD7QOoXo-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/x86.c:2531 kvm_track_tsc_matching() warn: iterator 'i' not incremented

Old smatch warnings:
arch/x86/kvm/x86.c:3162 kvm_end_pvclock_update() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:3514 kvmclock_update_fn() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:4955 kvm_x86_dev_get_attr() error: uninitialized symbol 'val'.
arch/x86/kvm/x86.c:5867 kvm_arch_tsc_set_attr() warn: check for integer overflow 'offset'
arch/x86/kvm/x86.c:5912 kvm_vcpu_ioctl_device_attr() error: uninitialized symbol 'r'.
arch/x86/kvm/x86.c:6769 kvm_arch_sync_dirty_log() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:7189 kvm_arch_suspend_notifier() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:8253 emulator_read_write() warn: missing error code? 'rc'
arch/x86/kvm/x86.c:9428 x86_emulate_instruction() warn: missing error code? 'r'
arch/x86/kvm/x86.c:9799 __kvmclock_cpufreq_notifier() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:9888 pvclock_gtod_update_fn() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:12220 kvm_arch_vcpu_guestdbg_update_apicv_inhibit() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:12803 kvm_arch_hardware_enable() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:12942 kvm_unload_vcpu_mmus() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:13192 kvm_arch_memslots_updated() warn: iterator 'i' not incremented

vim +/i +2531 arch/x86/kvm/x86.c

b0c39dc68e3b3d Vitaly Kuznetsov    2018-01-24  2510  
09c8a66bc82e84 David Woodhouse     2024-04-19  2511  static void kvm_track_tsc_matching(struct kvm_vcpu *vcpu)
b48aa97e38206a Marcelo Tosatti     2012-11-27  2512  {
b48aa97e38206a Marcelo Tosatti     2012-11-27  2513  #ifdef CONFIG_X86_64
b48aa97e38206a Marcelo Tosatti     2012-11-27  2514  	struct kvm_arch *ka = &vcpu->kvm->arch;
b48aa97e38206a Marcelo Tosatti     2012-11-27  2515  	struct pvclock_gtod_data *gtod = &pvclock_gtod_data;
e3dc2e2e4e3cf6 David Woodhouse     2024-04-27  2516  	struct kvm_vcpu *v;
e3dc2e2e4e3cf6 David Woodhouse     2024-04-27  2517  	unsigned long i;
e3dc2e2e4e3cf6 David Woodhouse     2024-04-27  2518  	bool matched = true;
e3dc2e2e4e3cf6 David Woodhouse     2024-04-27  2519  
e3dc2e2e4e3cf6 David Woodhouse     2024-04-27  2520  	lockdep_assert_held(&vcpu->kvm->arch.tsc_write_lock);
e3dc2e2e4e3cf6 David Woodhouse     2024-04-27  2521  
e3dc2e2e4e3cf6 David Woodhouse     2024-04-27  2522  	/*
e3dc2e2e4e3cf6 David Woodhouse     2024-04-27  2523  	 * When called via kvm_arch_vcpu_create() for a new vCPU, the count
e3dc2e2e4e3cf6 David Woodhouse     2024-04-27  2524  	 * in kvm->online_vcpus will not yet have been incremented and the
e3dc2e2e4e3cf6 David Woodhouse     2024-04-27  2525  	 * kvm_for_each_vcpu() loop will not iterate over 'vcpu'.
e3dc2e2e4e3cf6 David Woodhouse     2024-04-27  2526  	 *
e3dc2e2e4e3cf6 David Woodhouse     2024-04-27  2527  	 * The right thing still happens in that case, because a match will
e3dc2e2e4e3cf6 David Woodhouse     2024-04-27  2528  	 * be found only if the new vCPU's TSC is at the same rate as *all*
e3dc2e2e4e3cf6 David Woodhouse     2024-04-27  2529  	 * the existing vCPUs' TSCs.
e3dc2e2e4e3cf6 David Woodhouse     2024-04-27  2530  	 */
e3dc2e2e4e3cf6 David Woodhouse     2024-04-27 @2531  	kvm_for_each_vcpu(i, v, vcpu->kvm) {
e3dc2e2e4e3cf6 David Woodhouse     2024-04-27  2532  		if (v->arch.virtual_tsc_khz != vcpu->arch.virtual_tsc_khz) {
e3dc2e2e4e3cf6 David Woodhouse     2024-04-27  2533  			matched = false;
e3dc2e2e4e3cf6 David Woodhouse     2024-04-27  2534  			break;
e3dc2e2e4e3cf6 David Woodhouse     2024-04-27  2535  		}
e3dc2e2e4e3cf6 David Woodhouse     2024-04-27  2536  	}
e3dc2e2e4e3cf6 David Woodhouse     2024-04-27  2537  	ka->all_vcpus_matched_tsc = matched;
b48aa97e38206a Marcelo Tosatti     2012-11-27  2538  
c52ffadc65e28a Sean Christopherson 2023-10-18  2539  	/*
c52ffadc65e28a Sean Christopherson 2023-10-18  2540  	 * To use the masterclock, the host clocksource must be based on TSC
e3dc2e2e4e3cf6 David Woodhouse     2024-04-27  2541  	 * and all vCPUs must have matching TSC frequencies.
c52ffadc65e28a Sean Christopherson 2023-10-18  2542  	 */
e3dc2e2e4e3cf6 David Woodhouse     2024-04-27  2543  	bool use_master_clock = ka->all_vcpus_matched_tsc &&
c52ffadc65e28a Sean Christopherson 2023-10-18  2544  				gtod_is_based_on_tsc(gtod->clock.vclock_mode);
b48aa97e38206a Marcelo Tosatti     2012-11-27  2545  
7f187922ddf6b6 Marcelo Tosatti     2014-11-04  2546  	/*
c52ffadc65e28a Sean Christopherson 2023-10-18  2547  	 * Request a masterclock update if the masterclock needs to be toggled
09c8a66bc82e84 David Woodhouse     2024-04-19  2548  	 * on/off.
7f187922ddf6b6 Marcelo Tosatti     2014-11-04  2549  	 */
09c8a66bc82e84 David Woodhouse     2024-04-19  2550  	if ((ka->use_master_clock != use_master_clock))
b48aa97e38206a Marcelo Tosatti     2012-11-27  2551  		kvm_make_request(KVM_REQ_MASTERCLOCK_UPDATE, vcpu);
b48aa97e38206a Marcelo Tosatti     2012-11-27  2552  
e3dc2e2e4e3cf6 David Woodhouse     2024-04-27  2553  	trace_kvm_track_tsc(vcpu->vcpu_id, ka->all_vcpus_matched_tsc,
b48aa97e38206a Marcelo Tosatti     2012-11-27  2554  			    atomic_read(&vcpu->kvm->online_vcpus),
b48aa97e38206a Marcelo Tosatti     2012-11-27  2555  		            ka->use_master_clock, gtod->clock.vclock_mode);
b48aa97e38206a Marcelo Tosatti     2012-11-27  2556  #endif
b48aa97e38206a Marcelo Tosatti     2012-11-27  2557  }
b48aa97e38206a Marcelo Tosatti     2012-11-27  2558  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
