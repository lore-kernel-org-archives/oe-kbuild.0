Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755B72144BA
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Dec 2024 13:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734010476; cv=none; b=owCGuhRXbKN2Um4SIyyYtrZEmbYgaaL8azH/9JM44fdsVZa6mJdS+WSxO48F/rrjOhesArlVcv8dbGsKzKpCEDYopu+zcMsC1EouX+X/81FsEe/JCQIqLEm013Bk+zRzv4XdmpBpt+2Hnal5Bs4ZE1Hmh3JiaETT6zg/uMmE0Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734010476; c=relaxed/simple;
	bh=Bq8pK9a2Yn25hDbf/YggtgK4miQ93f7DyiebCfix3h0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HltHVaHe0ec/p7C6bSmvoAU3nG76LuQHNrLXXYHLhbflzwn1LfNn0CRoqE1DiFMWznrievdIyc0nDoMf7l6rFKPV8/d8RSjExxNKVjbuKXgnODCRR5kyRPmrG3edbh9wwHvZeeic89FiHZnRHvCVGlhe2onIgXE9ASUMAgUC5cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVC6zWCp; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVC6zWCp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734010474; x=1765546474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bq8pK9a2Yn25hDbf/YggtgK4miQ93f7DyiebCfix3h0=;
  b=AVC6zWCpZevqwA5NrW74poJp1pwRfSUNIrI9F6ah3ROkkIn8vgYY4aDp
   oyoE2Yh4gMoC6U1ijdYY53fSd4ac9Sv1ZmBz/oJZNENDtgIPJ0bi38dzl
   qBMdoRnpL8fc+T6u4mWTNDyDnxjYEsKzUDMvF+JztQeeeoQWjujGzWtFi
   M2/rLoesH8j1argbm3OPXClzHRlydxT/RqbVU/moElUftdaeJg92JhhZZ
   DtbmaDGFDat9T7rObQ/b6X4wJNTRpFffAfY51iHCD/rb3dZ6U/93Gv6Vg
   keB7RddOzyaMApJAulRm7nXWmR2TBNoeJ2XwsxJvpz/sz6cpai7Wfw2gq
   A==;
X-CSE-ConnectionGUID: XslfEFF+SwiyFsNifRry+w==
X-CSE-MsgGUID: s9c6iiFuSqmju8HmpKxLyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34332642"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="34332642"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 05:34:33 -0800
X-CSE-ConnectionGUID: ZyOesoUZSY6/BdtjmukAdw==
X-CSE-MsgGUID: HcPeLKD5RqSI9/jM8CUE0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97026141"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Dec 2024 05:34:33 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLjKn-0007s9-2z;
	Thu, 12 Dec 2024 13:34:29 +0000
Date: Thu, 12 Dec 2024 21:34:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kvm/../../../virt/kvm/kvm_main.c:327
 kvm_make_all_cpus_request() warn: iterator 'i' not incremented
Message-ID: <202412122149.3N9zBbXb-lkp@intel.com>
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
head:   231825b2e1ff6ba799c5eaf396d3ab2354e37c6b
commit: 82e9c84d8712e8d29278a37aaa9aa767d50a16da KVM: Remove kvm_make_all_cpus_request_except()
date:   7 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-r073-20241207 (https://download.01.org/0day-ci/archive/20241212/202412122149.3N9zBbXb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412122149.3N9zBbXb-lkp@intel.com/

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

7053df4edb3ae3a virt/kvm/kvm_main.c    Vitaly Kuznetsov      2018-05-16  313  
82e9c84d8712e8d virt/kvm/kvm_main.c    Venkatesh Srinivas    2024-04-04  314  bool kvm_make_all_cpus_request(struct kvm *kvm, unsigned int req)
7053df4edb3ae3a virt/kvm/kvm_main.c    Vitaly Kuznetsov      2018-05-16  315  {
ae0946cd3601752 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  316  	struct kvm_vcpu *vcpu;
baff59ccdc657d2 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  317  	struct cpumask *cpus;
46808a4cb89708c virt/kvm/kvm_main.c    Marc Zyngier          2021-11-16  318  	unsigned long i;
7053df4edb3ae3a virt/kvm/kvm_main.c    Vitaly Kuznetsov      2018-05-16  319  	bool called;
46808a4cb89708c virt/kvm/kvm_main.c    Marc Zyngier          2021-11-16  320  	int me;
7053df4edb3ae3a virt/kvm/kvm_main.c    Vitaly Kuznetsov      2018-05-16  321  
ae0946cd3601752 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  322  	me = get_cpu();
ae0946cd3601752 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  323  
baff59ccdc657d2 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  324  	cpus = this_cpu_cpumask_var_ptr(cpu_kick_mask);
baff59ccdc657d2 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  325  	cpumask_clear(cpus);
baff59ccdc657d2 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  326  
82e9c84d8712e8d virt/kvm/kvm_main.c    Venkatesh Srinivas    2024-04-04 @327  	kvm_for_each_vcpu(i, vcpu, kvm)
b56bd8e03cf4d59 virt/kvm/kvm_main.c    Jinrong Liang         2022-01-25  328  		kvm_make_vcpu_request(vcpu, req, cpus, me);
ae0946cd3601752 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  329  
ae0946cd3601752 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  330  	called = kvm_kick_many_cpus(cpus, !!(req & KVM_REQUEST_WAIT));
ae0946cd3601752 virt/kvm/kvm_main.c    Vitaly Kuznetsov      2021-09-03  331  	put_cpu();
7053df4edb3ae3a virt/kvm/kvm_main.c    Vitaly Kuznetsov      2018-05-16  332  
498468961ed6f62 virt/kvm/kvm_main.c    Rusty Russell         2008-12-08  333  	return called;
d9e368d61263055 drivers/kvm/kvm_main.c Avi Kivity            2007-06-07  334  }
a2486020a82eefa virt/kvm/kvm_main.c    Marcelo Tosatti       2021-05-26  335  EXPORT_SYMBOL_GPL(kvm_make_all_cpus_request);
54163a346d4a0a1 virt/kvm/kvm_main.c    Suravee Suthikulpanit 2020-05-06  336  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
