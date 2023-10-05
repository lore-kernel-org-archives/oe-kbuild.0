Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F2D41E3A
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Oct 2023 20:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HCuQRX6b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696537472; x=1728073472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RyOlvdj0JZoYDFOzmUpqos+PA+6DyvwOhNTaIRrhhfs=;
  b=HCuQRX6baT7LIetxsJ01XGH8yZRDVF3dLc+T0N8qXPnPAiuw/NVotlqu
   t1Q4GlkjEVmpXKaE47OLnk6epHSEGqGbnvQWfdxEIXtP6thEfB5YAA+8X
   yxnr08Z2yCwP862/d585XIWcf3+u674mL1xggjk48uAhyIHVijImmis3d
   B+8h576zo7JkEB+nIPU0y+emQCym8baRG2lsH7lsTWCXdgLWDWnVdeu74
   FsuudJ6mSzY9EakKcLSt8lsHM6SAnmtTrxrkqIAp+X4OjzwXYAIZMcv0I
   48A1x3tarPwrrNQas37pAFhlHbdwaxX1cVXjzGm93Fl84DJj3bR2oUsuk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="387483777"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="387483777"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 13:24:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="751908581"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="751908581"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 05 Oct 2023 13:24:25 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoUtS-000LsG-2b;
	Thu, 05 Oct 2023 20:24:22 +0000
Date: Fri, 6 Oct 2023 04:23:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dwmw2:kvmclock 3/4] arch/x86/kvm/x86.c:3290
 kvm_get_wall_clock_epoch() warn: if statement not indented
Message-ID: <202310060457.z7SFSOEM-lkp@intel.com>
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

tree:   git://git.infradead.org/users/dwmw2/linux kvmclock
head:   517b16173e1d8471583d17588096fe8ed3bbbbeb
commit: ccc5926d03f10f017a4bcceec6b4ed4277af3388 [3/4] timer hack to show kvmclock drift
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20231005 (https://download.01.org/0day-ci/archive/20231006/202310060457.z7SFSOEM-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231006/202310060457.z7SFSOEM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310060457.z7SFSOEM-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/x86.c:3290 kvm_get_wall_clock_epoch() warn: if statement not indented

Old smatch warnings:
arch/x86/kvm/x86.c:5590 kvm_arch_tsc_set_attr() warn: check for integer overflow 'offset'
arch/x86/kvm/x86.c:5631 kvm_vcpu_ioctl_device_attr() error: uninitialized symbol 'r'.
arch/x86/kvm/x86.c:7782 emulator_read_write() warn: missing error code? 'rc'
arch/x86/include/asm/kvm-x86-ops.h:17 kvm_ops_update() warn: inconsistent indenting

vim +3290 arch/x86/kvm/x86.c

c807660407a695 Gerd Hoffmann   2009-02-04  3238  
b71c616ce3d939 David Woodhouse 2023-10-01  3239  uint64_t kvm_get_wall_clock_epoch(struct kvm *kvm)
b71c616ce3d939 David Woodhouse 2023-10-01  3240  {
b71c616ce3d939 David Woodhouse 2023-10-01  3241  	/*
b71c616ce3d939 David Woodhouse 2023-10-01  3242  	 * The guest calculates current wall clock time by adding
b71c616ce3d939 David Woodhouse 2023-10-01  3243  	 * system time (updated by kvm_guest_time_update below) to the
b71c616ce3d939 David Woodhouse 2023-10-01  3244  	 * wall clock specified here.  We do the reverse here.
b71c616ce3d939 David Woodhouse 2023-10-01  3245  	 */
b71c616ce3d939 David Woodhouse 2023-10-01  3246  #ifdef CONFIG_X86_64
b71c616ce3d939 David Woodhouse 2023-10-01  3247  	struct pvclock_vcpu_time_info hv_clock;
b71c616ce3d939 David Woodhouse 2023-10-01  3248  	struct kvm_arch *ka = &kvm->arch;
b71c616ce3d939 David Woodhouse 2023-10-01  3249  	unsigned long seq, local_tsc_khz = 0;
b71c616ce3d939 David Woodhouse 2023-10-01  3250  	struct timespec64 ts;
b71c616ce3d939 David Woodhouse 2023-10-01  3251  	uint64_t host_tsc;
b71c616ce3d939 David Woodhouse 2023-10-01  3252  
b71c616ce3d939 David Woodhouse 2023-10-01  3253  	do {
b71c616ce3d939 David Woodhouse 2023-10-01  3254  		seq = read_seqcount_begin(&ka->pvclock_sc);
b71c616ce3d939 David Woodhouse 2023-10-01  3255  
b71c616ce3d939 David Woodhouse 2023-10-01  3256  		if (!ka->use_master_clock)
b71c616ce3d939 David Woodhouse 2023-10-01  3257  			break;
b71c616ce3d939 David Woodhouse 2023-10-01  3258  
b71c616ce3d939 David Woodhouse 2023-10-01  3259  		/* It all has to happen on the same CPU */
b71c616ce3d939 David Woodhouse 2023-10-01  3260  		get_cpu();
b71c616ce3d939 David Woodhouse 2023-10-01  3261  
b71c616ce3d939 David Woodhouse 2023-10-01  3262  		local_tsc_khz = get_cpu_tsc_khz();
b71c616ce3d939 David Woodhouse 2023-10-01  3263  
b71c616ce3d939 David Woodhouse 2023-10-01  3264  		if (local_tsc_khz &&
ccc5926d03f10f David Woodhouse 2023-10-02  3265  		    !kvm_get_time_and_clockread(&ts.tv_sec, &host_tsc))
b71c616ce3d939 David Woodhouse 2023-10-01  3266  			local_tsc_khz = 0; /* Fall back to old method */
b71c616ce3d939 David Woodhouse 2023-10-01  3267  
b71c616ce3d939 David Woodhouse 2023-10-01  3268  		hv_clock.tsc_timestamp = ka->master_cycle_now;
b71c616ce3d939 David Woodhouse 2023-10-01  3269  		hv_clock.system_time = ka->master_kernel_ns + ka->kvmclock_offset;
b71c616ce3d939 David Woodhouse 2023-10-01  3270  
b71c616ce3d939 David Woodhouse 2023-10-01  3271  		put_cpu();
b71c616ce3d939 David Woodhouse 2023-10-01  3272  	} while (read_seqcount_retry(&ka->pvclock_sc, seq));
b71c616ce3d939 David Woodhouse 2023-10-01  3273  
b71c616ce3d939 David Woodhouse 2023-10-01  3274  	/*
b71c616ce3d939 David Woodhouse 2023-10-01  3275  	 * If the conditions were right, and obtaining the wallclock+TSC was
b71c616ce3d939 David Woodhouse 2023-10-01  3276  	 * successful, calculate the KVM clock at the corresponding time and
b71c616ce3d939 David Woodhouse 2023-10-01  3277  	 * subtract one from the other to get the epoch in nanoseconds.
b71c616ce3d939 David Woodhouse 2023-10-01  3278  	 */
b71c616ce3d939 David Woodhouse 2023-10-01  3279  	if (local_tsc_khz) {
b71c616ce3d939 David Woodhouse 2023-10-01  3280  		kvm_get_time_scale(NSEC_PER_SEC, local_tsc_khz * 1000LL,
b71c616ce3d939 David Woodhouse 2023-10-01  3281  				   &hv_clock.tsc_shift,
b71c616ce3d939 David Woodhouse 2023-10-01  3282  				   &hv_clock.tsc_to_system_mul);
ccc5926d03f10f David Woodhouse 2023-10-02  3283  
ccc5926d03f10f David Woodhouse 2023-10-02  3284  		uint64_t res = __pvclock_read_cycles(&hv_clock, host_tsc);
ccc5926d03f10f David Woodhouse 2023-10-02  3285  		uint64_t d2 = ts.tv_sec + ka->kvmclock_offset;
ccc5926d03f10f David Woodhouse 2023-10-02  3286  		printk("Calculated %lld (%lld/%lld delta %lld, ns %lld o %lld)\n",
ccc5926d03f10f David Woodhouse 2023-10-02  3287  		       res,
ccc5926d03f10f David Woodhouse 2023-10-02  3288  		       ts.tv_sec, d2, d2-res,
ccc5926d03f10f David Woodhouse 2023-10-02  3289  		       ka->master_kernel_ns, ka->kvmclock_offset);
ccc5926d03f10f David Woodhouse 2023-10-02 @3290  		if (0)
b71c616ce3d939 David Woodhouse 2023-10-01  3291  		return ts.tv_nsec + NSEC_PER_SEC * ts.tv_sec -
b71c616ce3d939 David Woodhouse 2023-10-01  3292  			__pvclock_read_cycles(&hv_clock, host_tsc);
b71c616ce3d939 David Woodhouse 2023-10-01  3293  	}
b71c616ce3d939 David Woodhouse 2023-10-01  3294  #endif
b71c616ce3d939 David Woodhouse 2023-10-01  3295  	return ktime_get_real_ns() - get_kvmclock_ns(kvm);
b71c616ce3d939 David Woodhouse 2023-10-01  3296  }
b71c616ce3d939 David Woodhouse 2023-10-01  3297  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
