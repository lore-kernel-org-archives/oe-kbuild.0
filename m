Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523EF197A68
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Feb 2025 05:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739598306; cv=none; b=ELUfSWPIwfCJORnVIr5Eo+M2RD+Vv8ORCvfh+VQFdUoRmmPYERTqgq/ziSLqBED/iXFuIGUNUxlFvU6N9bQC3e90wkre0fqAFWjAsK1FSIKwqXrp63opQgi8vaoPkS1Cycag0FTaTo/y5dXMCGe0fsQ3aTFn0i74cHVqDbWX58E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739598306; c=relaxed/simple;
	bh=CveEZiwTsUmEBItDaL898AlaFcxwG/TwE61+aNYD4c8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RS8b/XKVivKpwKrzucBpMmFiPRorfbxuEHkB/C+bIV6cPSikgGZ1IjjpdAqrUbH1WN0v55N2PrXxLGdbek1lO5F90F5mNa74j9FBRUkDvbo6AxwD37RffRgg36MCtE3n3uHNyDQnP6xgPCnut9f3u9V24jtRNTAQixV6XeGLI7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BmyOPIsh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BmyOPIsh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739598304; x=1771134304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CveEZiwTsUmEBItDaL898AlaFcxwG/TwE61+aNYD4c8=;
  b=BmyOPIshOLSQxvt6Z0CIjxGScSAFY3lMsrYpjC3S/4wvRiRmX8gV837d
   y4JroqTacb2TEihThpew60ZfnVKix7IEvdqGG7uDRgtCHAUkXKw/Vzxh7
   8xe6teoJqQ1ti4ON5YbG2lqeigCjm9xwDo+FrJswUX0hniXv2V0kb+MZJ
   e85oDCfRhlvLjHlUcOsEoiYdAgHdjRd2za5JHaZwYgEhMuQtzHPKek0AO
   janvE9Hq/P8m0nCouYhPURHosLnCX1nlLWOeUML7RRRsq3wlwQW5nUH5G
   ZU1wV7Asu6haslrk7nOJC+8TRBxhTpvzZKmuz8r6QXFD6bpFEle9YSFF9
   Q==;
X-CSE-ConnectionGUID: wMQsqARpQD2XBA11XZ5IxQ==
X-CSE-MsgGUID: P1BrnpOMSaGxViCls8+aqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="27947134"
X-IronPort-AV: E=Sophos;i="6.13,288,1732608000"; 
   d="scan'208";a="27947134"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 21:45:03 -0800
X-CSE-ConnectionGUID: cxOeGUiZTACL/YPlNAzcNw==
X-CSE-MsgGUID: CDKxUYIrTniqk3saP5bWvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117779275"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Feb 2025 21:45:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjAz6-001AXL-19;
	Sat, 15 Feb 2025 05:45:00 +0000
Date: Sat, 15 Feb 2025 13:44:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/kvm/../../../virt/kvm/kvm_main.c:327
 kvm_make_all_cpus_request() warn: iterator 'i' not incremented
Message-ID: <202502151337.2w4rGHFg-lkp@intel.com>
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
TO: Venkatesh Srinivas <venkateshs@chromium.org>
CC: Sean Christopherson <seanjc@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   78a632a2086c5d5468b0e088a97b26e47c569567
commit: 82e9c84d8712e8d29278a37aaa9aa767d50a16da KVM: Remove kvm_make_all_cpus_request_except()
date:   10 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 10 months ago
config: riscv-randconfig-r073-20250213 (https://download.01.org/0day-ci/archive/20250215/202502151337.2w4rGHFg-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502151337.2w4rGHFg-lkp@intel.com/

New smatch warnings:
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:327 kvm_make_all_cpus_request() warn: iterator 'i' not incremented

Old smatch warnings:
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:518 kvm_destroy_vcpus() warn: iterator 'i' not incremented
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1730 kvm_commit_memory_region() error: we previously assumed 'old' could be null (see line 1723)
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1732 kvm_commit_memory_region() error: we previously assumed 'new' could be null (see line 1724)
arch/riscv/include/asm/atomic.h:203 arch_atomic_fetch_add_unless() warn: inconsistent indenting
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:3604 kvm_clear_guest() warn: unsigned '_x' is never less than zero.
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4135 kvm_vcpu_fault() warn: unsigned '_x' is never less than zero.
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4142 kvm_vcpu_fault() warn: unsigned '_x' is never less than zero.
include/linux/kvm_host.h:979 kvm_get_vcpu_by_id() warn: iterator 'i' not incremented
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4947 kvm_vm_ioctl_reset_dirty_pages() warn: iterator 'i' not incremented
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:6076 kvm_get_stat_per_vcpu() warn: iterator 'i' not incremented
arch/riscv/kvm/../../../virt/kvm/kvm_main.c:6087 kvm_clear_stat_per_vcpu() warn: iterator 'i' not incremented

vim +/i +327 arch/riscv/kvm/../../../virt/kvm/kvm_main.c

7053df4edb3ae3 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2018-05-16  313  
82e9c84d8712e8 virt/kvm/kvm_main.c    Venkatesh Srinivas    2024-04-04  314  bool kvm_make_all_cpus_request(struct kvm *kvm, unsigned int req)
7053df4edb3ae3 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2018-05-16  315  {
ae0946cd360175 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  316  	struct kvm_vcpu *vcpu;
baff59ccdc657d virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  317  	struct cpumask *cpus;
46808a4cb89708 virt/kvm/kvm_main.c    Marc Zyngier          2021-11-16  318  	unsigned long i;
7053df4edb3ae3 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2018-05-16  319  	bool called;
46808a4cb89708 virt/kvm/kvm_main.c    Marc Zyngier          2021-11-16  320  	int me;
7053df4edb3ae3 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2018-05-16  321  
ae0946cd360175 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  322  	me = get_cpu();
ae0946cd360175 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  323  
baff59ccdc657d virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  324  	cpus = this_cpu_cpumask_var_ptr(cpu_kick_mask);
baff59ccdc657d virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  325  	cpumask_clear(cpus);
baff59ccdc657d virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  326  
82e9c84d8712e8 virt/kvm/kvm_main.c    Venkatesh Srinivas    2024-04-04 @327  	kvm_for_each_vcpu(i, vcpu, kvm)
b56bd8e03cf4d5 virt/kvm/kvm_main.c    Jinrong Liang         2022-01-25  328  		kvm_make_vcpu_request(vcpu, req, cpus, me);
ae0946cd360175 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  329  
ae0946cd360175 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  330  	called = kvm_kick_many_cpus(cpus, !!(req & KVM_REQUEST_WAIT));
ae0946cd360175 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  331  	put_cpu();
7053df4edb3ae3 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2018-05-16  332  
498468961ed6f6 virt/kvm/kvm_main.c    Rusty Russell         2008-12-08  333  	return called;
d9e368d6126305 drivers/kvm/kvm_main.c Avi Kivity            2007-06-07  334  }
a2486020a82eef virt/kvm/kvm_main.c    Marcelo Tosatti       2021-05-26  335  EXPORT_SYMBOL_GPL(kvm_make_all_cpus_request);
54163a346d4a0a virt/kvm/kvm_main.c    Suravee Suthikulpanit 2020-05-06  336  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
