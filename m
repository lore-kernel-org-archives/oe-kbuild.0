Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACB41EABBF
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Nov 2024 11:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730893827; cv=none; b=BjCIFLktYOkPtx2jeiu81CoM8MNAg7sqs5Sornz83fWSjg6gUyoRFYEO0oCyfgHX8p8IF1ygQQwEdNK1fOxXHvNMDVWVi++nzBuG2ZoXFzZD1MwAiU7AMMZ9f6r6Dsnj/jFTKUBosMeZE+mWo1SHihv5FOE3hCljrs+omVUPxIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730893827; c=relaxed/simple;
	bh=DhW0c/5k3//4I1NsbHN+AsuORL1IJgqRK3UegRVyJik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JB9BZRROb+9MUAiPMnC+xoSJIM2szO7VqWWPFF9XLWirCCZZtz4BZw5Jq2gaXHmfQ4jROOBAY7hGfkRx4SovxYDcYA/lNzjy0pX6ttmwb8LczWMSPaW+q3mvzqoQkgvS0gg7jiYIiusQzW8D3Wh6qCi9WKbPtJjN8j7JUOgouF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ng1XxIG6; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ng1XxIG6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730893826; x=1762429826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DhW0c/5k3//4I1NsbHN+AsuORL1IJgqRK3UegRVyJik=;
  b=ng1XxIG6Due1wQzy2JfzZFpbJs7dIrrSQ10c6isE5HZUPx7rrSA7KIqR
   Nf6ncpk+JMVWwAlfMQyPDUONvx6jvJ4bSVlhmchlHaOiBJhhkVt5iPAgP
   /ljQtEeMnr7dEgJMzEjJFFQpSC2YH+wEhAncTdJoYM/VyqyJbuI8nEXTV
   tdhT/ADB2Hat7M5VqmMh62uRw7EfsjBU5AhWCmy5iRwSONsgnhQVoq5Qe
   u3aTdomofYzBVNCDmtXKK9mK054ZW/63FitLPmAFZPLDO5+HAAkOm35Vt
   3PMA5RgIDHhZy5TSCSJoCgt6jEt4UXASHKFmROaGDsioSWlFboNFwBqeN
   w==;
X-CSE-ConnectionGUID: gdBKDl49SdiLv2oQmG9Pqw==
X-CSE-MsgGUID: /KG623WRQ/qBzisxoHyhFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34386566"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34386566"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 03:50:26 -0800
X-CSE-ConnectionGUID: 5Xgnh5RcRwC+iz3owjImhA==
X-CSE-MsgGUID: R+pH/9GvRwucaHjoNGsDbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="84407847"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Nov 2024 03:50:23 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8eYH-000nGm-1j;
	Wed, 06 Nov 2024 11:50:21 +0000
Date: Wed, 6 Nov 2024 19:49:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [chrome-os:chromeos-6.1 1/104] arch/x86/kvm/x86.c:6738
 kvm_arch_resume_notifier() warn: iterator 'i' not incremented
Message-ID: <202411061946.zPjk61u6-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   eebfbf01bf6938dd13cb315873c55c135325ffe2
commit: 4a2eac2ca4e283555d61291bace8d2cbd8fe2735 [1/104] CHROMIUM: KVM: x86: Include host suspended time in steal time.
:::::: branch date: 5 hours ago
:::::: commit date: 10 weeks ago
config: i386-randconfig-141-20241105 (https://download.01.org/0day-ci/archive/20241106/202411061946.zPjk61u6-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411061946.zPjk61u6-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/x86.c:6738 kvm_arch_resume_notifier() warn: iterator 'i' not incremented

Old smatch warnings:
arch/x86/kvm/x86.c:1126 __kvm_set_xcr() warn: bitwise AND condition is false here
arch/x86/kvm/x86.c:1127 __kvm_set_xcr() warn: bitwise AND condition is false here
arch/x86/kvm/x86.c:3026 kvm_end_pvclock_update() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:3278 kvmclock_update_fn() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:5566 kvm_arch_tsc_set_attr() warn: check for integer overflow 'offset'
arch/x86/kvm/x86.c:5607 kvm_vcpu_ioctl_device_attr() error: uninitialized symbol 'r'.
arch/x86/kvm/x86.c:6286 kvm_arch_sync_dirty_log() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:6711 kvm_arch_suspend_notifier() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:7778 emulator_read_write() warn: missing error code? 'rc'
arch/x86/kvm/x86.c:9386 __kvmclock_cpufreq_notifier() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:10473 enter_smm() warn: inconsistent indenting
arch/x86/kvm/x86.c:12095 kvm_arch_vcpu_guestdbg_update_apicv_inhibit() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:12689 kvm_arch_hardware_enable() warn: iterator 'i' not incremented
arch/x86/include/asm/kvm-x86-ops.h:17 kvm_ops_update() warn: inconsistent indenting
arch/x86/kvm/x86.c:12909 kvm_unload_vcpu_mmus() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:13155 kvm_arch_memslots_updated() warn: iterator 'i' not incremented

vim +/i +6738 arch/x86/kvm/x86.c

7d62874f69d7e5 Sergey Senozhatsky 2021-06-06  6728  
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10  6729  static int
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10  6730  kvm_arch_resume_notifier(struct kvm *kvm)
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10  6731  {
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10  6732  	struct kvm_vcpu *vcpu;
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10  6733  	unsigned long i;
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10  6734  
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10  6735  	kvm->last_suspend_duration = ktime_get_boottime_ns() -
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10  6736  	    kvm->suspended_time;
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10  6737  	mutex_lock(&kvm->lock);
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10 @6738  	kvm_for_each_vcpu(i, vcpu, kvm)
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10  6739  		WRITE_ONCE(vcpu->suspended, 1);
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10  6740  	mutex_unlock(&kvm->lock);
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10  6741  	return NOTIFY_DONE;
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10  6742  }
4a2eac2ca4e283 Suleiman Souhlal   2024-07-10  6743  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
