Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47ABF3128D7
	for <oe-kbuild@lists.linux.dev>; Tue,  5 May 2026 08:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777970460; cv=none; b=GRHFBBbkI2VXcIONX5p5s5wi9nUOTS8OnPaE+XZdci3nEajFaq/vWdkXtrCcEe4VCWUuX0bwgNT2+7yZkdMOxI3oXiMc5MftL7ackiL5DIh5w6bniB44+mNw9HB6e70/sZq/Sj/Rh4/T08GZ7bBry6+tHwBFpdfMzTnnM9V5YLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777970460; c=relaxed/simple;
	bh=g4mLWRfv2/vrZt7Dpf9IBisgB5y/0VwgnIS4PY8dYbQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u2zgqCCqyNPqeL5gaJO2uNx4DYeDXtx3iW8+JCjuAtRWy464F4Ncr1BeEjuL2iFRkSM30v3/zpNw0jdf/zedPTdF9GqaD+SW41PUrjw/d1mf9REGqkHZnZajlHoi4D69fw/vbBXL0Qt+4qw004UF/hSobcvsD2qIy7D5QqNw3m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N97/vMpZ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N97/vMpZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777970459; x=1809506459;
  h=date:from:to:cc:subject:message-id;
  bh=g4mLWRfv2/vrZt7Dpf9IBisgB5y/0VwgnIS4PY8dYbQ=;
  b=N97/vMpZ3W7DCSKFBPcXFvtPW0WppfOX6otkxrbUL1MU4xNrgPTbw+39
   gVB3qIlNoO8rpdkLMO1YH/Hh5dCzMcf/gIHsjJkvR4YolpuvE1b2Suryl
   noKSGutHk0DGB3CeFi7Cu7cKZXwN1IFVFCvvqk8ocILtBvmtDk9fyLXhV
   vf1l1tnuwhNf4DF5f6sJQ46tQsIsePMa+pj7++iYs4eVqPdjyTjt/7k0X
   ABDOXiM7awzRRgZNav74SmKVyVmS9pa5nV3vM0kXabKuY7VLGnvhD2sLL
   +9DchJDQIqedmSKVqP66jciXsqJjbld2OSle9xVZYKe0f37wMSJfFMWFq
   Q==;
X-CSE-ConnectionGUID: qOxnziaHRFCzynGL8gBQOw==
X-CSE-MsgGUID: U7TmOcZATBKO5waSyoAizQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78740854"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="78740854"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 01:40:58 -0700
X-CSE-ConnectionGUID: Jll0VO/sSFCfIJMRRKnU8g==
X-CSE-MsgGUID: /aGR6ClOSzq6iFRAj1F0HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="229269268"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 05 May 2026 01:40:56 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKBKo-000000006CL-2pVf;
	Tue, 05 May 2026 08:40:54 +0000
Date: Tue, 05 May 2026 10:40:14 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sean-jc:svm/x2avic_msr_interception 5/5]
 x86/xapic_state_test.c:355:39: error: implicit declaration of function
 'is_accelerated_reg'
Message-ID: <202605051030.EFM7zn31-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sean Christopherson <seanjc@google.com>

tree:   https://github.com/sean-jc/linux svm/x2avic_msr_interception
head:   0bfccf7b3c9c632982160c7be0c6735944b01b24
commit: 0bfccf7b3c9c632982160c7be0c6735944b01b24 [5/5] KVM: selftests: Add hacky test to verify x2APIC MSR interception
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260505/202605051030.EFM7zn31-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605051030.EFM7zn31-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605051030.EFM7zn31-lkp@intel.com/

Note: the sean-jc/svm/x2avic_msr_interception HEAD 0bfccf7b3c9c632982160c7be0c6735944b01b24 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   x86/xapic_state_test.c: In function 'test_x2apic_msr_intercepts':
>> x86/xapic_state_test.c:355:39: error: implicit declaration of function 'is_accelerated_reg' [-Wimplicit-function-declaration]
     355 |                         if (fault || !is_accelerated_reg(reg, write)) {
         |                                       ^~~~~~~~~~~~~~~~~~
   At top level:
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
