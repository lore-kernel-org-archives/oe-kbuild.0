Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2DF3EBF10
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 21:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769291381; cv=none; b=GqdUfJxYaMh9zlUjgxqYFKy2ZuH/13XaV9UvLl7i4EkoVjXihnCsPKJPuB22mg9OGkLfHCZtYHnn4f/K6vI/LO2HtBVGXHZEkvFMTbd7ypSeSkzugGWYojd+icRwsOBX3fPdoLsD5hIZu53MKIcTi9wtPxGPQYy1+H5FOpZSDNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769291381; c=relaxed/simple;
	bh=c364JQ1ax0/7awhZgkg/Zv8CXhvlNCpfMJDbF3pXshw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o+y35Snn+SjiDwm4xxTjZsyczHMqBA2cCWsbKHtzKfKJsPlv/1Z+0iZ+vtTaRo7akPoY4l3Z35q7Y/xfKafatFtRpwGLgLB41kVDnEWKGB8JQUB+4Ph6fQc11zBPbA9r5kYdzfPhgpcpSSXzrjwZyucViFvL05aU2fnKj9bi82I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EVV7X4kJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EVV7X4kJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769291380; x=1800827380;
  h=date:from:to:cc:subject:message-id;
  bh=c364JQ1ax0/7awhZgkg/Zv8CXhvlNCpfMJDbF3pXshw=;
  b=EVV7X4kJFVyxAlhdgYKe5rYP9Cn4ZFLuYVuZZuM1Fxk27pMFeq4iCS0j
   IhvWKRP/E/q2DewWoebdEprKaWm3ZJe2yzZNbefYSs5LxH2avnha4AO+l
   Qco83EIUodg8tsnJK8WnZCNHaesHMtpqPpOMxP8C09L/qJCnDsK6tBo04
   wXjGAF4FIkMIeTog8BIZVgNaRUzqbC6UCkZUQlDc42ixMZUjaaPO9982Y
   HnYpkvOZZi4qv7M4/YdGuNMTzQ0L8EEoEM1cZTGgQgmYE4yTSCK7Y7M7v
   mGTWJrPkIklxq2svcacPvSuljikSv5d45W9A9q4KOg7T82zQiMbqx8vkT
   g==;
X-CSE-ConnectionGUID: 85UXctF7QQG2VELZvFnibw==
X-CSE-MsgGUID: kXMubsN/Q3+X21IQpDN+Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="81226141"
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="81226141"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 13:49:39 -0800
X-CSE-ConnectionGUID: xyJrEBbUTZytysebf3JlDg==
X-CSE-MsgGUID: /ynLXc4OSg2P3BWt0SkKtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,251,1763452800"; 
   d="scan'208";a="211442930"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Jan 2026 13:49:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjlVe-00000000VZO-3rcz;
	Sat, 24 Jan 2026 21:49:34 +0000
Date: Sun, 25 Jan 2026 05:48:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sean-jc:x86/tdx_huge_sept 40/47]
 arch/x86/kvm/mmu/tdp_mmu.c:1485 tdp_mmu_alloc_sp_for_split() error:
 dereferencing freed memory 'sp' (line 1483)
Message-ID: <202601250549.1WtInTxT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sean Christopherson <seanjc@google.com>

tree:   https://github.com/sean-jc/linux x86/tdx_huge_sept
head:   4277c23972d92102c257f4d22acd908a47c0d69e
commit: b1b08e9b2efc1b59d94433702c6c4669cbd86ba4 [40/47] KVM: x86/mmu: Add Dynamic PAMT support to vCPU-induced page split
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: x86_64-randconfig-161-20260124 (https://download.01.org/0day-ci/archive/20260125/202601250549.1WtInTxT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601250549.1WtInTxT-lkp@intel.com/

smatch warnings:
arch/x86/kvm/mmu/tdp_mmu.c:1485 tdp_mmu_alloc_sp_for_split() error: dereferencing freed memory 'sp' (line 1483)

vim +/sp +1485 arch/x86/kvm/mmu/tdp_mmu.c

a6a0b05da9f37ff Ben Gardon          2020-10-14  1456  
4957bdc853d5f9d Isaku Yamahata      2026-01-21  1457  static struct kvm_mmu_page *tdp_mmu_alloc_sp_for_split(struct tdp_iter *iter)
a3fe5dbda0a4bb7 David Matlack       2022-01-19  1458  {
a3fe5dbda0a4bb7 David Matlack       2022-01-19  1459  	struct kvm_mmu_page *sp;
a3fe5dbda0a4bb7 David Matlack       2022-01-19  1460  
e1c04f7a9f4213c David Matlack       2024-06-11  1461  	sp = kmem_cache_zalloc(mmu_page_header_cache, GFP_KERNEL_ACCOUNT);
a3fe5dbda0a4bb7 David Matlack       2022-01-19  1462  	if (!sp)
a3fe5dbda0a4bb7 David Matlack       2022-01-19  1463  		return NULL;
a3fe5dbda0a4bb7 David Matlack       2022-01-19  1464  
e1c04f7a9f4213c David Matlack       2024-06-11  1465  	sp->spt = (void *)get_zeroed_page(GFP_KERNEL_ACCOUNT);
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1466  	if (!sp->spt)
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1467  		goto err_spt;
a3fe5dbda0a4bb7 David Matlack       2022-01-19  1468  
4957bdc853d5f9d Isaku Yamahata      2026-01-21  1469  	if (is_mirror_sptep(iter->sptep)) {
4957bdc853d5f9d Isaku Yamahata      2026-01-21  1470  		sp->external_spt = (void *)kvm_x86_call(alloc_external_sp)(GFP_KERNEL_ACCOUNT);
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1471  		if (!sp->external_spt)
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1472  			goto err_external_spt;
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1473  
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1474  		if (kvm_x86_call(topup_external_cache)(kvm_get_running_vcpu(), 1))
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1475  			goto err_external_split;
4957bdc853d5f9d Isaku Yamahata      2026-01-21  1476  	}
4957bdc853d5f9d Isaku Yamahata      2026-01-21  1477  
a3fe5dbda0a4bb7 David Matlack       2022-01-19  1478  	return sp;
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1479  
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1480  err_external_split:
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1481  	kvm_x86_call(free_external_sp)((unsigned long)sp->external_spt);
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1482  err_spt:
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22 @1483  	kmem_cache_free(mmu_page_header_cache, sp);
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1484  err_external_spt:
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22 @1485  	free_page((unsigned long)sp->spt);
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1486  	return NULL;
b1b08e9b2efc1b5 Sean Christopherson 2026-01-22  1487  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
