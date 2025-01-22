Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FC5214205
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Jan 2025 15:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737558475; cv=none; b=XKnWk3/k1MsnMkn8ZDRaIX4UkyhSNtfEHuF5TGH9PaR11Y2Bhb/d3N+CGjOC+446pDFkMXw4gNf8QHnmzEMuSXmDItdGkFHrMSeMY66oH4ZI1d9gT1FdiYU+Z1l51LJNSlHyT5Gneb06UVl748ATaAmHoFLs92WIHmXTkHWcdj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737558475; c=relaxed/simple;
	bh=2WMdG5aoikgB1jEPuO5HMsjWZwOvFxmCpcUU3GMA5Tg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wi0tUgVtjUYxLfeDoJnmObdgTGkSdcaSUfNAFu5MA7bcoBuOKu0SLt6M216/anyvsjGrEsW35XorLdUmudg2YPI+TeYWU0mO1uxAoKcJP4B00TGg5BEHSAH0dr64drmLX7DVCmHwuUuluys9F1kQ/RmL4xRujDPHjSodgIDlzLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VappXDKc; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VappXDKc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737558473; x=1769094473;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2WMdG5aoikgB1jEPuO5HMsjWZwOvFxmCpcUU3GMA5Tg=;
  b=VappXDKc7RTQKhM3MtKsfXt4fAO4nxvP3LaS882IkHkAV7MGK+oxKoIn
   bDu5nJ1f3L2CQRPkuBlV/0oqQR9BgzFs3hsPbRNVlTtrfMnVyr6YSSLJ/
   DMGMQdfgFT1k9X9o2kFJ5Vo7gkHvLtvYjGdY1oaQUDp2t9+vw1VTL0FM8
   v19HVt0/hU+76Liz/gda0bRzPj//sCLplAW/0yWNz5seaid4yu4TqaBIL
   qqeQCwhftXCC5G3pS7ZqAE59TC+lhf1kl92jovrw3ZtVR08HQ4YFjGrs5
   E5ZrS9kztzvUe43afibGvMop4K0MGqhwvxzdxL1Fmz4MftykThiU6bAUz
   A==;
X-CSE-ConnectionGUID: AYK+JyydSxaA9cgFL2QeHQ==
X-CSE-MsgGUID: cEh0FUftSAuVYGLlmfqewA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49433093"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="49433093"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 07:07:53 -0800
X-CSE-ConnectionGUID: 54rQfpJSROmT5TpyTEXGUg==
X-CSE-MsgGUID: QYkYfRcKSuSpGvAhYP19aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108046360"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Jan 2025 07:07:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tacKb-000Zzr-1F;
	Wed, 22 Jan 2025 15:07:49 +0000
Date: Wed, 22 Jan 2025 23:05:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 06/10] KVM: x86/xen: Use guest's copy of pvclock when
 starting timer
Message-ID: <202501222250.KDXKa8hj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250118005552.2626804-7-seanjc@google.com>
References: <20250118005552.2626804-7-seanjc@google.com>
TO: Sean Christopherson <seanjc@google.com>

Hi Sean,

kernel test robot noticed the following build warnings:

[auto build test WARNING on eb723766b1030a23c38adf2348b7c3d1409d11f0]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Christopherson/KVM-x86-Don-t-take-kvm-lock-when-iterating-over-vCPUs-in-suspend-notifier/20250118-085939
base:   eb723766b1030a23c38adf2348b7c3d1409d11f0
patch link:    https://lore.kernel.org/r/20250118005552.2626804-7-seanjc%40google.com
patch subject: [PATCH 06/10] KVM: x86/xen: Use guest's copy of pvclock when starting timer
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20250122 (https://download.01.org/0day-ci/archive/20250122/202501222250.KDXKa8hj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501222250.KDXKa8hj-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/xen.c:173 xen_get_guest_pvclock() error: uninitialized symbol 'guest_hv_clock'.
arch/x86/kvm/xen.c:219 kvm_xen_start_timer() error: uninitialized symbol 'xen'.

Old smatch warnings:
include/linux/kvm_host.h:998 kvm_get_vcpu_by_id() warn: iterator 'i' not incremented

vim +/guest_hv_clock +173 arch/x86/kvm/xen.c

536395260582be Joao Martins        2022-03-03  152  
4d6163d65c0021 Sean Christopherson 2025-01-17  153  static int xen_get_guest_pvclock(struct kvm_vcpu *vcpu,
4d6163d65c0021 Sean Christopherson 2025-01-17  154  				 struct pvclock_vcpu_time_info *hv_clock,
4d6163d65c0021 Sean Christopherson 2025-01-17  155  				 struct gfn_to_pfn_cache *gpc,
4d6163d65c0021 Sean Christopherson 2025-01-17  156  				 unsigned int offset)
4d6163d65c0021 Sean Christopherson 2025-01-17  157  {
4d6163d65c0021 Sean Christopherson 2025-01-17  158  	struct pvclock_vcpu_time_info *guest_hv_clock;
4d6163d65c0021 Sean Christopherson 2025-01-17  159  	unsigned long flags;
4d6163d65c0021 Sean Christopherson 2025-01-17  160  	int r;
4d6163d65c0021 Sean Christopherson 2025-01-17  161  
4d6163d65c0021 Sean Christopherson 2025-01-17  162  	read_lock_irqsave(&gpc->lock, flags);
4d6163d65c0021 Sean Christopherson 2025-01-17  163  	while (!kvm_gpc_check(gpc, offset + sizeof(*guest_hv_clock))) {
4d6163d65c0021 Sean Christopherson 2025-01-17  164  		read_unlock_irqrestore(&gpc->lock, flags);
4d6163d65c0021 Sean Christopherson 2025-01-17  165  
4d6163d65c0021 Sean Christopherson 2025-01-17  166  		r = kvm_gpc_refresh(gpc, offset + sizeof(*guest_hv_clock));
4d6163d65c0021 Sean Christopherson 2025-01-17  167  		if (r)
4d6163d65c0021 Sean Christopherson 2025-01-17  168  			return r;
4d6163d65c0021 Sean Christopherson 2025-01-17  169  
4d6163d65c0021 Sean Christopherson 2025-01-17  170  		read_lock_irqsave(&gpc->lock, flags);
4d6163d65c0021 Sean Christopherson 2025-01-17  171  	}
4d6163d65c0021 Sean Christopherson 2025-01-17  172  
4d6163d65c0021 Sean Christopherson 2025-01-17 @173  	memcpy(hv_clock, guest_hv_clock, sizeof(*hv_clock));
4d6163d65c0021 Sean Christopherson 2025-01-17  174  	read_unlock_irqrestore(&gpc->lock, flags);
4d6163d65c0021 Sean Christopherson 2025-01-17  175  
4d6163d65c0021 Sean Christopherson 2025-01-17  176  	/*
4d6163d65c0021 Sean Christopherson 2025-01-17  177  	 * Sanity check TSC shift+multiplier to verify the guest's view of time
4d6163d65c0021 Sean Christopherson 2025-01-17  178  	 * is more or less consistent.
4d6163d65c0021 Sean Christopherson 2025-01-17  179  	 */
4d6163d65c0021 Sean Christopherson 2025-01-17  180  	if (hv_clock->tsc_shift != vcpu->arch.hv_clock.tsc_shift ||
4d6163d65c0021 Sean Christopherson 2025-01-17  181  	    hv_clock->tsc_to_system_mul != vcpu->arch.hv_clock.tsc_to_system_mul)
4d6163d65c0021 Sean Christopherson 2025-01-17  182  		return -EINVAL;
4d6163d65c0021 Sean Christopherson 2025-01-17  183  	return 0;
4d6163d65c0021 Sean Christopherson 2025-01-17  184  }
4d6163d65c0021 Sean Christopherson 2025-01-17  185  
451a707813aee2 David Woodhouse     2024-02-27  186  static void kvm_xen_start_timer(struct kvm_vcpu *vcpu, u64 guest_abs,
451a707813aee2 David Woodhouse     2024-02-27  187  				bool linux_wa)
536395260582be Joao Martins        2022-03-03  188  {
4d6163d65c0021 Sean Christopherson 2025-01-17  189  	struct kvm_vcpu_xen *xen;
451a707813aee2 David Woodhouse     2024-02-27  190  	int64_t kernel_now, delta;
451a707813aee2 David Woodhouse     2024-02-27  191  	uint64_t guest_now;
4d6163d65c0021 Sean Christopherson 2025-01-17  192  	int r = -EOPNOTSUPP;
451a707813aee2 David Woodhouse     2024-02-27  193  
451a707813aee2 David Woodhouse     2024-02-27  194  	/*
451a707813aee2 David Woodhouse     2024-02-27  195  	 * The guest provides the requested timeout in absolute nanoseconds
451a707813aee2 David Woodhouse     2024-02-27  196  	 * of the KVM clock — as *it* sees it, based on the scaled TSC and
451a707813aee2 David Woodhouse     2024-02-27  197  	 * the pvclock information provided by KVM.
451a707813aee2 David Woodhouse     2024-02-27  198  	 *
451a707813aee2 David Woodhouse     2024-02-27  199  	 * The kernel doesn't support hrtimers based on CLOCK_MONOTONIC_RAW
451a707813aee2 David Woodhouse     2024-02-27  200  	 * so use CLOCK_MONOTONIC. In the timescales covered by timers, the
451a707813aee2 David Woodhouse     2024-02-27  201  	 * difference won't matter much as there is no cumulative effect.
451a707813aee2 David Woodhouse     2024-02-27  202  	 *
451a707813aee2 David Woodhouse     2024-02-27  203  	 * Calculate the time for some arbitrary point in time around "now"
451a707813aee2 David Woodhouse     2024-02-27  204  	 * in terms of both kvmclock and CLOCK_MONOTONIC. Calculate the
451a707813aee2 David Woodhouse     2024-02-27  205  	 * delta between the kvmclock "now" value and the guest's requested
451a707813aee2 David Woodhouse     2024-02-27  206  	 * timeout, apply the "Linux workaround" described below, and add
451a707813aee2 David Woodhouse     2024-02-27  207  	 * the resulting delta to the CLOCK_MONOTONIC "now" value, to get
451a707813aee2 David Woodhouse     2024-02-27  208  	 * the absolute CLOCK_MONOTONIC time at which the timer should
451a707813aee2 David Woodhouse     2024-02-27  209  	 * fire.
451a707813aee2 David Woodhouse     2024-02-27  210  	 */
4d6163d65c0021 Sean Christopherson 2025-01-17  211  	do {
4d6163d65c0021 Sean Christopherson 2025-01-17  212  		struct pvclock_vcpu_time_info hv_clock;
451a707813aee2 David Woodhouse     2024-02-27  213  		uint64_t host_tsc, guest_tsc;
451a707813aee2 David Woodhouse     2024-02-27  214  
4d6163d65c0021 Sean Christopherson 2025-01-17  215  		if (!static_cpu_has(X86_FEATURE_CONSTANT_TSC) ||
4d6163d65c0021 Sean Christopherson 2025-01-17  216  		    !vcpu->kvm->arch.use_master_clock)
4d6163d65c0021 Sean Christopherson 2025-01-17  217  			break;
4d6163d65c0021 Sean Christopherson 2025-01-17  218  
4d6163d65c0021 Sean Christopherson 2025-01-17 @219  		if (xen->vcpu_info_cache.active)
4d6163d65c0021 Sean Christopherson 2025-01-17  220  			r = xen_get_guest_pvclock(vcpu, &hv_clock, &xen->vcpu_info_cache,
4d6163d65c0021 Sean Christopherson 2025-01-17  221  						offsetof(struct compat_vcpu_info, time));
4d6163d65c0021 Sean Christopherson 2025-01-17  222  		else if (xen->vcpu_time_info_cache.active)
4d6163d65c0021 Sean Christopherson 2025-01-17  223  			r = xen_get_guest_pvclock(vcpu, &hv_clock, &xen->vcpu_time_info_cache, 0);
4d6163d65c0021 Sean Christopherson 2025-01-17  224  		if (r)
4d6163d65c0021 Sean Christopherson 2025-01-17  225  			break;
4d6163d65c0021 Sean Christopherson 2025-01-17  226  
451a707813aee2 David Woodhouse     2024-02-27  227  		if (!IS_ENABLED(CONFIG_64BIT) ||
451a707813aee2 David Woodhouse     2024-02-27  228  		    !kvm_get_monotonic_and_clockread(&kernel_now, &host_tsc)) {
451a707813aee2 David Woodhouse     2024-02-27  229  			/*
451a707813aee2 David Woodhouse     2024-02-27  230  			 * Don't fall back to get_kvmclock_ns() because it's
451a707813aee2 David Woodhouse     2024-02-27  231  			 * broken; it has a systemic error in its results
451a707813aee2 David Woodhouse     2024-02-27  232  			 * because it scales directly from host TSC to
451a707813aee2 David Woodhouse     2024-02-27  233  			 * nanoseconds, and doesn't scale first to guest TSC
451a707813aee2 David Woodhouse     2024-02-27  234  			 * and *then* to nanoseconds as the guest does.
451a707813aee2 David Woodhouse     2024-02-27  235  			 *
451a707813aee2 David Woodhouse     2024-02-27  236  			 * There is a small error introduced here because time
451a707813aee2 David Woodhouse     2024-02-27  237  			 * continues to elapse between the ktime_get() and the
451a707813aee2 David Woodhouse     2024-02-27  238  			 * subsequent rdtsc(). But not the systemic drift due
451a707813aee2 David Woodhouse     2024-02-27  239  			 * to get_kvmclock_ns().
451a707813aee2 David Woodhouse     2024-02-27  240  			 */
451a707813aee2 David Woodhouse     2024-02-27  241  			kernel_now = ktime_get(); /* This is CLOCK_MONOTONIC */
451a707813aee2 David Woodhouse     2024-02-27  242  			host_tsc = rdtsc();
451a707813aee2 David Woodhouse     2024-02-27  243  		}
451a707813aee2 David Woodhouse     2024-02-27  244  
451a707813aee2 David Woodhouse     2024-02-27  245  		/* Calculate the guest kvmclock as the guest would do it. */
451a707813aee2 David Woodhouse     2024-02-27  246  		guest_tsc = kvm_read_l1_tsc(vcpu, host_tsc);
4d6163d65c0021 Sean Christopherson 2025-01-17  247  		guest_now = __pvclock_read_cycles(&hv_clock, guest_tsc);
4d6163d65c0021 Sean Christopherson 2025-01-17  248  	} while (0);
4d6163d65c0021 Sean Christopherson 2025-01-17  249  
4d6163d65c0021 Sean Christopherson 2025-01-17  250  	if (r) {
451a707813aee2 David Woodhouse     2024-02-27  251  		/*
451a707813aee2 David Woodhouse     2024-02-27  252  		 * Without CONSTANT_TSC, get_kvmclock_ns() is the only option.
451a707813aee2 David Woodhouse     2024-02-27  253  		 *
451a707813aee2 David Woodhouse     2024-02-27  254  		 * Also if the guest PV clock hasn't been set up yet, as is
451a707813aee2 David Woodhouse     2024-02-27  255  		 * likely to be the case during migration when the vCPU has
451a707813aee2 David Woodhouse     2024-02-27  256  		 * not been run yet. It would be possible to calculate the
451a707813aee2 David Woodhouse     2024-02-27  257  		 * scaling factors properly in that case but there's not much
451a707813aee2 David Woodhouse     2024-02-27  258  		 * point in doing so. The get_kvmclock_ns() drift accumulates
451a707813aee2 David Woodhouse     2024-02-27  259  		 * over time, so it's OK to use it at startup. Besides, on
451a707813aee2 David Woodhouse     2024-02-27  260  		 * migration there's going to be a little bit of skew in the
451a707813aee2 David Woodhouse     2024-02-27  261  		 * precise moment at which timers fire anyway. Often they'll
451a707813aee2 David Woodhouse     2024-02-27  262  		 * be in the "past" by the time the VM is running again after
451a707813aee2 David Woodhouse     2024-02-27  263  		 * migration.
451a707813aee2 David Woodhouse     2024-02-27  264  		 */
451a707813aee2 David Woodhouse     2024-02-27  265  		guest_now = get_kvmclock_ns(vcpu->kvm);
451a707813aee2 David Woodhouse     2024-02-27  266  		kernel_now = ktime_get();
451a707813aee2 David Woodhouse     2024-02-27  267  	}
451a707813aee2 David Woodhouse     2024-02-27  268  
451a707813aee2 David Woodhouse     2024-02-27  269  	delta = guest_abs - guest_now;
451a707813aee2 David Woodhouse     2024-02-27  270  
451a707813aee2 David Woodhouse     2024-02-27  271  	/*
451a707813aee2 David Woodhouse     2024-02-27  272  	 * Xen has a 'Linux workaround' in do_set_timer_op() which checks for
451a707813aee2 David Woodhouse     2024-02-27  273  	 * negative absolute timeout values (caused by integer overflow), and
451a707813aee2 David Woodhouse     2024-02-27  274  	 * for values about 13 days in the future (2^50ns) which would be
451a707813aee2 David Woodhouse     2024-02-27  275  	 * caused by jiffies overflow. For those cases, Xen sets the timeout
451a707813aee2 David Woodhouse     2024-02-27  276  	 * 100ms in the future (not *too* soon, since if a guest really did
451a707813aee2 David Woodhouse     2024-02-27  277  	 * set a long timeout on purpose we don't want to keep churning CPU
451a707813aee2 David Woodhouse     2024-02-27  278  	 * time by waking it up).  Emulate Xen's workaround when starting the
451a707813aee2 David Woodhouse     2024-02-27  279  	 * timer in response to __HYPERVISOR_set_timer_op.
451a707813aee2 David Woodhouse     2024-02-27  280  	 */
451a707813aee2 David Woodhouse     2024-02-27  281  	if (linux_wa &&
451a707813aee2 David Woodhouse     2024-02-27  282  	    unlikely((int64_t)guest_abs < 0 ||
451a707813aee2 David Woodhouse     2024-02-27  283  		     (delta > 0 && (uint32_t) (delta >> 50) != 0))) {
451a707813aee2 David Woodhouse     2024-02-27  284  		delta = 100 * NSEC_PER_MSEC;
451a707813aee2 David Woodhouse     2024-02-27  285  		guest_abs = guest_now + delta;
451a707813aee2 David Woodhouse     2024-02-27  286  	}
451a707813aee2 David Woodhouse     2024-02-27  287  
77c9b9dea4fb3e David Woodhouse     2023-09-30  288  	/*
77c9b9dea4fb3e David Woodhouse     2023-09-30  289  	 * Avoid races with the old timer firing. Checking timer_expires
77c9b9dea4fb3e David Woodhouse     2023-09-30  290  	 * to avoid calling hrtimer_cancel() will only have false positives
77c9b9dea4fb3e David Woodhouse     2023-09-30  291  	 * so is fine.
77c9b9dea4fb3e David Woodhouse     2023-09-30  292  	 */
77c9b9dea4fb3e David Woodhouse     2023-09-30  293  	if (vcpu->arch.xen.timer_expires)
77c9b9dea4fb3e David Woodhouse     2023-09-30  294  		hrtimer_cancel(&vcpu->arch.xen.timer);
77c9b9dea4fb3e David Woodhouse     2023-09-30  295  
536395260582be Joao Martins        2022-03-03  296  	atomic_set(&vcpu->arch.xen.timer_pending, 0);
536395260582be Joao Martins        2022-03-03  297  	vcpu->arch.xen.timer_expires = guest_abs;
536395260582be Joao Martins        2022-03-03  298  
451a707813aee2 David Woodhouse     2024-02-27  299  	if (delta <= 0)
536395260582be Joao Martins        2022-03-03  300  		xen_timer_callback(&vcpu->arch.xen.timer);
451a707813aee2 David Woodhouse     2024-02-27  301  	else
536395260582be Joao Martins        2022-03-03  302  		hrtimer_start(&vcpu->arch.xen.timer,
451a707813aee2 David Woodhouse     2024-02-27  303  			      ktime_add_ns(kernel_now, delta),
536395260582be Joao Martins        2022-03-03  304  			      HRTIMER_MODE_ABS_HARD);
536395260582be Joao Martins        2022-03-03  305  }
536395260582be Joao Martins        2022-03-03  306  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
