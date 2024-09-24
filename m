Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDAA13B7BC
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Sep 2024 21:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727215065; cv=none; b=dD7KhO0KKnKBakRD0aCXvNL0NWd7TPg4bJSeDDdeJmfcta6Sd6vaE31XKdTDYxEDqntUcv1xx63rQho/JyT2QhWjSezG0AVUCeOczSwwTZKUVeM7+pZvTjCFYZxT83DI1I1qT3INy63eEyLDVERLLY5JXy/sCO6JNQrLcaV/dm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727215065; c=relaxed/simple;
	bh=1XKSusZugGYWwaIET0+eUbFsKytH8xMlNPnMh7aJNmo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kb6HgM1kIi4ZIxEHzNE3pyI1cqCbYavnzht3XaqITcWpsMte3wnVaQNBVpDFMTba/2jWKth5r8+dlHufJ7BaXV47tt0u7pHYeESbljCpGZSnuyGFYSXA7p98vDErh9k3ULEuvEoJf9ZO3SdTT5KGgzf5oT62MGQX/Yo3ZlbKp2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KRwPl6Ou; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KRwPl6Ou"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727215063; x=1758751063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1XKSusZugGYWwaIET0+eUbFsKytH8xMlNPnMh7aJNmo=;
  b=KRwPl6OukBw0zEQJldk+l5ZP0XL4sa6atgdgRQLeCA6y8QweYU7ZdfcC
   DHBp+qC2YTDzUvGd0rN4xHfZGxWetNA7hVWFYL33WEQQGpwstg5j4U8wx
   9Yw3gj+1PcuYEKts/CWmaTgM4opa8hub7GF1YI8BGK4o0GWdr4nKJrxw+
   2sz5yFD5wu8DnxHkRN4QGf/4FQwyusFK7sSB5M1bIwaM+yJ3wworyWRs9
   564lnaHfeLXJklpAUwN6ol4I91EFRgj3U4JvHJM18mzIh48u/m3GxUg/D
   4Cg0xCKAviTRC5ZxuXjPaLY1+uY4UgonzZz9ahSs81z+YYbYWXxcBE0am
   w==;
X-CSE-ConnectionGUID: wdfhZ7XyQhaaftGrms5l4w==
X-CSE-MsgGUID: VAszmzwWTvq/7vzBXgiYzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26188157"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="26188157"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 14:57:43 -0700
X-CSE-ConnectionGUID: gB79hX31R/+2vNpwafA2ew==
X-CSE-MsgGUID: OrVZCqcHQqaCcqaAm6h1tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; 
   d="scan'208";a="76485960"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Sep 2024 14:57:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stDXO-000Is9-3C;
	Tue, 24 Sep 2024 21:57:38 +0000
Date: Wed, 25 Sep 2024 05:56:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/s390/kvm/../../../virt/kvm/kvm_main.c:327
 kvm_make_all_cpus_request() warn: iterator 'i' not incremented
Message-ID: <202409250520.I0rywglK-lkp@intel.com>
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
head:   6fa6588e5964473356f0e2a02093ea42a5b3fd56
commit: 82e9c84d8712e8d29278a37aaa9aa767d50a16da KVM: Remove kvm_make_all_cpus_request_except()
date:   5 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 months ago
config: s390-randconfig-r071-20240922 (https://download.01.org/0day-ci/archive/20240925/202409250520.I0rywglK-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409250520.I0rywglK-lkp@intel.com/

New smatch warnings:
arch/s390/kvm/../../../virt/kvm/kvm_main.c:327 kvm_make_all_cpus_request() warn: iterator 'i' not incremented

Old smatch warnings:
arch/s390/kvm/../../../virt/kvm/kvm_main.c:518 kvm_destroy_vcpus() warn: iterator 'i' not incremented
arch/s390/kvm/../../../virt/kvm/kvm_main.c:1730 kvm_commit_memory_region() error: we previously assumed 'old' could be null (see line 1723)
arch/s390/kvm/../../../virt/kvm/kvm_main.c:1732 kvm_commit_memory_region() error: we previously assumed 'new' could be null (see line 1724)
include/linux/kvm_host.h:979 kvm_get_vcpu_by_id() warn: iterator 'i' not incremented
arch/s390/kvm/../../../virt/kvm/kvm_main.c:4947 kvm_vm_ioctl_reset_dirty_pages() warn: iterator 'i' not incremented
arch/s390/kvm/../../../virt/kvm/kvm_main.c:6076 kvm_get_stat_per_vcpu() warn: iterator 'i' not incremented
arch/s390/kvm/../../../virt/kvm/kvm_main.c:6087 kvm_clear_stat_per_vcpu() warn: iterator 'i' not incremented

vim +/i +327 arch/s390/kvm/../../../virt/kvm/kvm_main.c

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
