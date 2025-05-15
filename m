Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D143D1401B
	for <oe-kbuild@lists.linux.dev>; Thu, 15 May 2025 02:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747277276; cv=none; b=ts5XIYwKhxYWYJGbv3o1+oSkS8wge25KM9pu+6kpdBODJUREuWlimiJiVhCVgoHKuglAUQIdDgfz5fT5QWysi8w0W6GWYsHPyz4FVs0sUnlUg1Iot/Gwbrv6P8lJA061IhNsYO03bypdGubq3U2mUMEYbPzoogXEduAIuCAr62g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747277276; c=relaxed/simple;
	bh=NG1MgjwWxeZSNT186jqYSJsH1+GWG4cbTSogrAcuuvg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KZiDZPGm9+BEWK+VtMbLt6PLKywDpbFR1R9iJb1B/U5N0aW1vaXeypzMcUX9Oe3OzvGDKXd4CrUAMbfWjokhkyLPZWOQLjTBZOvrX5rsRtEsZ766EzyefSUF7TYg9Bxebep9sYoRvA6GRwXLMjphE5tZ1r25vgOEGITBrSS4UMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eSsd32iG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eSsd32iG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747277274; x=1778813274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NG1MgjwWxeZSNT186jqYSJsH1+GWG4cbTSogrAcuuvg=;
  b=eSsd32iG7JoJaGk+eZX559GisEOOAqcpM5gp875voN4iPv3+M4rdLQZs
   FLQQDnj2Pe3RcsaEk2AaJQmubRCbceXnGO+FVQ9EBLZAs81uu07y65ewl
   hPmtfKiQ9x4JFsmVmwqnQEMGDXtTZKdYNfrwKQp3xCjJHjkJ/ufk/ETkQ
   p00gdxHsNyIx+tUE9s24ClMXWbVfykEQPQFONlcyLhpEg4miF1JEjFBWz
   6hDAGCVqyxoNZ12wK0rol4OTGYqK480HzlZ6B0xwrcTKqdJBwSvV6Eijf
   Kuu6Hv4bbl7cpS7WfADROKbkU5TiLqaC/P2XOfmgamtyQ/8KGV1iebYhP
   w==;
X-CSE-ConnectionGUID: HY9FsZZ4QpyQhH1q5s0sdw==
X-CSE-MsgGUID: IB9eFtrFT9q1+6XAt1+QXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="51838758"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="51838758"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 19:47:48 -0700
X-CSE-ConnectionGUID: AtMj1KmDTFig4T7Jri6xlA==
X-CSE-MsgGUID: xFgXwNAhQ7yPDPUBGiGtag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="139123955"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 May 2025 19:47:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFOdJ-000Hnf-2b;
	Thu, 15 May 2025 02:47:41 +0000
Date: Thu, 15 May 2025 10:47:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sean-jc:x86/dynamic_mmu_page_hash 65/66]
 arch/x86/kvm/svm/svm.c:5640:2: error: call to '__compiletime_assert_550'
 declared with 'error' attribute: BUILD_BUG_ON failed:
 get_order(sizeof(struct kvm_svm)) < 2 && !IS_ENABLED(CONFIG_DEBUG_KERNEL) &&
 !IS_ENABLED(CONFIG_KASAN)
Message-ID: <202505151034.9fu9WdRg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Sean Christopherson <seanjc@google.com>

tree:   https://github.com/sean-jc/linux x86/dynamic_mmu_page_hash
head:   ffadf534604c2d8ed89af07098ae9f60f9f7f137
commit: 032ffa65cd624bfc7248533d1e3b68ce4daf446f [65/66] KVM: x86: Use kvzalloc() to allocate VM struct
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-buildonly-randconfig-003-20250515 (https://download.01.org/0day-ci/archive/20250515/202505151034.9fu9WdRg-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151034.9fu9WdRg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505151034.9fu9WdRg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/svm/svm.c:5640:2: error: call to '__compiletime_assert_550' declared with 'error' attribute: BUILD_BUG_ON failed: get_order(sizeof(struct kvm_svm)) < 2 && !IS_ENABLED(CONFIG_DEBUG_KERNEL) && !IS_ENABLED(CONFIG_KASAN)
    5640 |         KVM_SANITY_CHECK_VM_STRUCT_SIZE(kvm_svm);
         |         ^
   arch/x86/kvm/x86.h:76:2: note: expanded from macro 'KVM_SANITY_CHECK_VM_STRUCT_SIZE'
      76 |         BUILD_BUG_ON(get_order(sizeof(struct x)) < 2 &&                                 \
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:545:2: note: expanded from macro '_compiletime_assert'
     545 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:538:4: note: expanded from macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:17:1: note: expanded from here
      17 | __compiletime_assert_550
         | ^
   1 error generated.


vim +5640 arch/x86/kvm/svm/svm.c

baeb4de7ad12b7 arch/x86/kvm/svm/svm.c Sean Christopherson 2023-07-21  5635  
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity          2006-12-10  5636  static int __init svm_init(void)
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity          2006-12-10  5637  {
4f8396b96a9fc6 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-11-30  5638  	int r;
4f8396b96a9fc6 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-11-30  5639  
032ffa65cd624b arch/x86/kvm/svm/svm.c Sean Christopherson 2025-04-21 @5640  	KVM_SANITY_CHECK_VM_STRUCT_SIZE(kvm_svm);
032ffa65cd624b arch/x86/kvm/svm/svm.c Sean Christopherson 2025-04-21  5641  
d07f46f9f51afc arch/x86/kvm/svm/svm.c Tom Lendacky        2020-09-07  5642  	__unused_size_checks();
d07f46f9f51afc arch/x86/kvm/svm/svm.c Tom Lendacky        2020-09-07  5643  
d4193132497574 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-11-30  5644  	if (!kvm_is_svm_supported())
d4193132497574 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-11-30  5645  		return -EOPNOTSUPP;
d4193132497574 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-11-30  5646  
4f8396b96a9fc6 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-11-30  5647  	r = kvm_x86_vendor_init(&svm_init_ops);
4f8396b96a9fc6 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-11-30  5648  	if (r)
4f8396b96a9fc6 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-11-30  5649  		return r;
4f8396b96a9fc6 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-11-30  5650  
4f8396b96a9fc6 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-11-30  5651  	/*
4f8396b96a9fc6 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-11-30  5652  	 * Common KVM initialization _must_ come last, after this, /dev/kvm is
4f8396b96a9fc6 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-11-30  5653  	 * exposed to userspace!
4f8396b96a9fc6 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-11-30  5654  	 */
81a1cf9f89a6b7 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-11-30  5655  	r = kvm_init(sizeof(struct vcpu_svm), __alignof__(struct vcpu_svm),
81a1cf9f89a6b7 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-11-30  5656  		     THIS_MODULE);
4f8396b96a9fc6 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-11-30  5657  	if (r)
4f8396b96a9fc6 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-11-30  5658  		goto err_kvm_init;
4f8396b96a9fc6 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-11-30  5659  
4f8396b96a9fc6 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-11-30  5660  	return 0;
4f8396b96a9fc6 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-11-30  5661  
4f8396b96a9fc6 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-11-30  5662  err_kvm_init:
baeb4de7ad12b7 arch/x86/kvm/svm/svm.c Sean Christopherson 2023-07-21  5663  	__svm_exit();
4f8396b96a9fc6 arch/x86/kvm/svm/svm.c Sean Christopherson 2022-11-30  5664  	return r;
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity          2006-12-10  5665  }
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity          2006-12-10  5666  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
