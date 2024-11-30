Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5E2156CA
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 02:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732933192; cv=none; b=l8Mb2rfLhfyXxtOMo257qHdrr+kKcOW2QUUWclniNur/2kc3Nr7cBUwT/ch6lcJQTFNxQ19/qsceKqPPkakZJSelccOCi6AI6lcG2ul2erH5x2s45l78KpWjfpuGQ6gD6F1JV9U9+nB//OJz8PDyBa3ruZCzmlGcehBtRLEZU4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732933192; c=relaxed/simple;
	bh=5wNMnZ24hNuvXQetlCrxEucIc3oQOOgVSIg5pEN4Gww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QaF7FUdwp+T3WNXytLFXSuuE8JHJceC1CvGZcxR8TXjI5hRRPY4mm8ddkReqy3uJLGcaJChhg1v3iFrEMC/+00Hy+cH1XZ1beK42ljqCGLAYQ/h42rvCKTSRtilV9ldEnSGou5voDppsP5ODjBJwEtjmsRocAylVZxhN+b1xjyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+8ROQlB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+8ROQlB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732933190; x=1764469190;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5wNMnZ24hNuvXQetlCrxEucIc3oQOOgVSIg5pEN4Gww=;
  b=m+8ROQlBB8Mh6Mf9QVi6lhFSSjQlsj+ihaGAiHWbvwMRb6RlrII2DvYi
   4WN811d17IOpdGW3Pvwf2at1RABK5lfidF1rt58wJCZTVfeKPczmikgH8
   V6pF3mlP6Vcp4EkKIZsDQ6oihgPdGA0Y+M85IHxzCagr+deoYflQw15ap
   /mSrQ0pihLRanbh8tlJBMKzy2N9/HQsS4tyRBvKSQwmLZcxGcqKNjAykU
   /oqvNowvoGxUy/wCmcbRuO1w63FM5iWLucPQTke9plzbCXkqUlKzKqWcq
   L0xPNIvZSIamPdWdf/ATORbavSfu7GQde7GpjZaSJiFq36wZ20ykh5NyM
   Q==;
X-CSE-ConnectionGUID: vtPLwvrcQQGfwizQq4yBng==
X-CSE-MsgGUID: Fn30Jx40S4aUKNZ7iL5W6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="32915619"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="32915619"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 18:19:50 -0800
X-CSE-ConnectionGUID: ssqBIPPdTCyApzyKzI0Mag==
X-CSE-MsgGUID: OuZU4fAWQGeJP6hiOUAiuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="92995691"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 29 Nov 2024 18:19:48 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHD4t-00001b-2j;
	Sat, 30 Nov 2024 02:19:26 +0000
Date: Sat, 30 Nov 2024 10:18:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/x86/kvm/x86.c:4872 kvm_x86_dev_get_attr() error: uninitialized
 symbol 'val'.
Message-ID: <202411301058.h6E4ivWl-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Paolo Bonzini <pbonzini@redhat.com>
CC: Michael Roth <michael.roth@amd.com>
CC: Isaku Yamahata <isaku.yamahata@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2ba9f676d0a2e408aef14d679984c26373bf37b7
commit: 546d714b0880f20572d21ece5b9544c0e37a7a49 KVM: introduce new vendor op for KVM_GET_DEVICE_ATTR
date:   8 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-161-20241130 (https://download.01.org/0day-ci/archive/20241130/202411301058.h6E4ivWl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411301058.h6E4ivWl-lkp@intel.com/

New smatch warnings:
arch/x86/kvm/x86.c:4872 kvm_x86_dev_get_attr() error: uninitialized symbol 'val'.

Old smatch warnings:
arch/x86/kvm/x86.c:3078 kvm_end_pvclock_update() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:3428 kvmclock_update_fn() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:5753 kvm_arch_tsc_set_attr() warn: check for integer overflow 'offset'
arch/x86/kvm/x86.c:5795 kvm_vcpu_ioctl_device_attr() error: uninitialized symbol 'r'.
arch/x86/kvm/x86.c:6478 kvm_arch_sync_dirty_log() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:6898 kvm_arch_suspend_notifier() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:7962 emulator_read_write() warn: missing error code? 'rc'
arch/x86/kvm/x86.c:9137 x86_emulate_instruction() warn: missing error code? 'r'
arch/x86/kvm/x86.c:9508 __kvmclock_cpufreq_notifier() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:9597 pvclock_gtod_update_fn() warn: iterator 'i' not incremented
arch/x86/include/asm/kvm-x86-ops.h:17 kvm_ops_update() warn: inconsistent indenting
arch/x86/kvm/x86.c:11878 kvm_arch_vcpu_guestdbg_update_apicv_inhibit() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:12461 kvm_arch_hardware_enable() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:12598 kvm_unload_vcpu_mmus() warn: iterator 'i' not incremented
arch/x86/kvm/x86.c:12848 kvm_arch_memslots_updated() warn: iterator 'i' not incremented

vim +/val +4872 arch/x86/kvm/x86.c

dd6e6312201811 Paolo Bonzini 2022-01-26  4861  
546d714b0880f2 Paolo Bonzini 2024-04-04  4862  static int kvm_x86_dev_get_attr(struct kvm_device_attr *attr)
dd6e6312201811 Paolo Bonzini 2022-01-26  4863  {
546d714b0880f2 Paolo Bonzini 2024-04-04  4864  	u64 __user *uaddr = u64_to_user_ptr(attr->addr);
546d714b0880f2 Paolo Bonzini 2024-04-04  4865  	int r;
546d714b0880f2 Paolo Bonzini 2024-04-04  4866  	u64 val;
546d714b0880f2 Paolo Bonzini 2024-04-04  4867  
546d714b0880f2 Paolo Bonzini 2024-04-04  4868  	r = __kvm_x86_dev_get_attr(attr, &val);
546d714b0880f2 Paolo Bonzini 2024-04-04  4869  	if (r < 0)
546d714b0880f2 Paolo Bonzini 2024-04-04  4870  		return r;
546d714b0880f2 Paolo Bonzini 2024-04-04  4871  
546d714b0880f2 Paolo Bonzini 2024-04-04 @4872  	if (put_user(val, uaddr))
546d714b0880f2 Paolo Bonzini 2024-04-04  4873  		return -EFAULT;
dd6e6312201811 Paolo Bonzini 2022-01-26  4874  
dd6e6312201811 Paolo Bonzini 2022-01-26  4875  	return 0;
dd6e6312201811 Paolo Bonzini 2022-01-26  4876  }
546d714b0880f2 Paolo Bonzini 2024-04-04  4877  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
