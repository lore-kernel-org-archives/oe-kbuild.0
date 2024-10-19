Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D8A17DE36
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Oct 2024 11:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729338515; cv=none; b=YLB5JzfNhK52S6zk9zTnQCByff3cASr1fxmAzwJVxPJFLhMQ4Hp9MpA/gsoP6sHQfjPWk0aw7ZpGlc52S4lWkNLQXxcksOILKTGWKNxDAzOGeE4IPxLajOCWmkOoUkXvKmc17qnpzA+ChvVbfAqAu/cKuRIFgkK8hBKzyDpONQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729338515; c=relaxed/simple;
	bh=VL2qoHkHN0ECtOrIKkOb71y+pXjb8Sv9ZXHH/v/PJ1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qozMrQuIvnFfat9l3rjHGH7Rfe+QxNmu9vszA1+8Tn3a9ZdobEzVm1jP5tVzg4BpX3ZzDwjw5EC9sCiNORNF+63WIVaNs3W5NsMSu8wkQ2Cb7ZNpNzuSKfBE4sQlDUvKexDVtKQlEgBflasnXVPz2zcdBooAy21CBQekeKqm61E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dtjZTGKj; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dtjZTGKj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729338513; x=1760874513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VL2qoHkHN0ECtOrIKkOb71y+pXjb8Sv9ZXHH/v/PJ1o=;
  b=dtjZTGKjw3MbPxfrFSEJICkmcoqk+7PckLStLjYt8JhskOvTmHTYcYdo
   OF4IoqUOYSWpcF4gt5s7Hf1GkjYsN3IH9aNmqWiP9IG84CWub4jQWajQe
   4UeNSIYDXPSCCKHY5pKAQmXV6uW05PBQVUzHIIhPaaH94w35C1WFGxjKp
   V7smnzTeJrnh1pC/0nEtm8Qp74wZwOITyffYrSOWvQxQd6/2Wv8RI2J3M
   ifSy1h3gfoB1MOWAxwh2OS8SUjO3TnedH2wjuJkXgFfPlfua2L+SynzSn
   jc9GhCgSmyddenbZMUYRt2MBWhjbst6u0KBOxbRI4WapZTaIFO6uJR/e9
   A==;
X-CSE-ConnectionGUID: KzG1TJVATXWuumMCSGwvPA==
X-CSE-MsgGUID: XVBYhsOGR2yW60q6KUO/FA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32550622"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32550622"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 04:48:33 -0700
X-CSE-ConnectionGUID: EbMnPblRR/OWveEmljJm5Q==
X-CSE-MsgGUID: 73PVA7imR6C8xjxTvH3cMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="79025047"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Oct 2024 04:48:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t27wa-000Owt-1L;
	Sat, 19 Oct 2024 11:48:28 +0000
Date: Sat, 19 Oct 2024 19:48:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kvm/../../../virt/kvm/kvm_main.c:327
 kvm_make_all_cpus_request() warn: iterator 'i' not incremented
Message-ID: <202410191921.o1MBmoq8-lkp@intel.com>
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
head:   3d5ad2d4eca337e80f38df77de89614aa5aaceb9
commit: 82e9c84d8712e8d29278a37aaa9aa767d50a16da KVM: Remove kvm_make_all_cpus_request_except()
date:   6 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-r071-20241015 (https://download.01.org/0day-ci/archive/20241019/202410191921.o1MBmoq8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410191921.o1MBmoq8-lkp@intel.com/

New smatch warnings:
arch/arm64/kvm/../../../virt/kvm/kvm_main.c:327 kvm_make_all_cpus_request() warn: iterator 'i' not incremented

Old smatch warnings:
arch/arm64/kvm/../../../virt/kvm/kvm_main.c:518 kvm_destroy_vcpus() warn: iterator 'i' not incremented
arch/arm64/kvm/../../../virt/kvm/kvm_main.c:1730 kvm_commit_memory_region() error: we previously assumed 'old' could be null (see line 1723)
arch/arm64/kvm/../../../virt/kvm/kvm_main.c:1732 kvm_commit_memory_region() error: we previously assumed 'new' could be null (see line 1724)
include/linux/kvm_host.h:979 kvm_get_vcpu_by_id() warn: iterator 'i' not incremented
arch/arm64/kvm/../../../virt/kvm/kvm_main.c:4947 kvm_vm_ioctl_reset_dirty_pages() warn: iterator 'i' not incremented
arch/arm64/kvm/../../../virt/kvm/kvm_main.c:6076 kvm_get_stat_per_vcpu() warn: iterator 'i' not incremented
arch/arm64/kvm/../../../virt/kvm/kvm_main.c:6087 kvm_clear_stat_per_vcpu() warn: iterator 'i' not incremented

vim +/i +327 arch/arm64/kvm/../../../virt/kvm/kvm_main.c

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
