Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49E81E4110
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Feb 2025 18:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739297928; cv=none; b=mDJqIaGgJIiLLGfjhn1h5XO3d7jE8QyvHydN/dmfeRM4hyVVzAIN/aTHWzwQba8UnX8fmW7iTOPcr3daKRNCthoW6NyxnwqyXP0S+oj/9mq+8OCZHhzR2AWSxhWl3ViUvSR+5R+qusSxlgPqp3/aAF510XeToYECXxQnsPkxFnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739297928; c=relaxed/simple;
	bh=/3/iGpgKv5lLiKOzLE0AC9m9U1c6yyPya73oEfIVVuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hN/8dVynXltxXDiLH7ewMamAV6oxX8WgivMmZsWvk8csHtgryR0v9KvJGDRiZjgAws7f8XVchvnos4zI+gewP8J1f+aWm8sQZkmxwf9M9YeeAAPNWwCKV/pLiHBR1EEgD+Cnrf/Qg89SbT/4QNNh05Ng1UsPJ4B7CLV1leoEQDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j6O/LXZQ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j6O/LXZQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739297927; x=1770833927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/3/iGpgKv5lLiKOzLE0AC9m9U1c6yyPya73oEfIVVuY=;
  b=j6O/LXZQlxLYpzlGBL7mRkSc7JPG4nIZjjvzGzuvtuZGRXdUYe+K3LKC
   /3i4uHJXEO3AYVvE0/RZ4sbZAdzjelmo9ivBxm6SWzRPKhmtWyV4UqGe6
   5DOQmknfjvk/fe+Li7Oz4dJ70OIHskr1Z/hTLONZdndPEDD5+912ZrHzr
   CKRstBczQ7ZHZzBiJ3wli9i5BCfyp625Jv39ZDXYwOQ0aPRw9pYk3e3yT
   YIz/88ryaSxRunClUlsdXm9e+bUmxb7kdMLKXClhql3awd9u/HTDDstLX
   eks+DhPBsLxC+qjgI/S8HcYyjWS31Wzb6FSoszTRimMrhR0di3/PsHsML
   w==;
X-CSE-ConnectionGUID: qAcDX43RTh6472X/TIXZcw==
X-CSE-MsgGUID: Boc8ZI5ZSY6rye/jAA+RfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50571813"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="50571813"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 10:18:46 -0800
X-CSE-ConnectionGUID: 0PjfbJpHRayEb13Q67fIOw==
X-CSE-MsgGUID: TXXa049EQVizvYwMr3bg/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="112799584"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Feb 2025 10:18:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thuqJ-0014YJ-05;
	Tue, 11 Feb 2025 18:18:43 +0000
Date: Wed, 12 Feb 2025 02:17:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rppt:kho/v4 12/14] kernel/kexec_handover.c:714
 kho_release_scratch() warn: iterator 'i' not incremented
Message-ID: <202502120217.2kEf7Xia-lkp@intel.com>
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
CC: Mike Rapoport <rppt@kernel.org>
TO: Alexander Graf <graf@amazon.com>
CC: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git kho/v4
head:   c46ab1adade1c0ece83ff5ad4c3aa57ea0126275
commit: 2201f6a39fa2540d835be3859cf650251641f920 [12/14] x86: Add KHO support
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-161-20250211 (https://download.01.org/0day-ci/archive/20250212/202502120217.2kEf7Xia-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502120217.2kEf7Xia-lkp@intel.com/

smatch warnings:
kernel/kexec_handover.c:714 kho_release_scratch() warn: iterator 'i' not incremented

vim +/i +714 kernel/kexec_handover.c

f5bf8db4b9b4b0 Alexander Graf 2024-01-17  701  
f5bf8db4b9b4b0 Alexander Graf 2024-01-17  702  static void __init kho_release_scratch(void)
f5bf8db4b9b4b0 Alexander Graf 2024-01-17  703  {
f5bf8db4b9b4b0 Alexander Graf 2024-01-17  704  	phys_addr_t start, end;
f5bf8db4b9b4b0 Alexander Graf 2024-01-17  705  	u64 i;
f5bf8db4b9b4b0 Alexander Graf 2024-01-17  706  
f5bf8db4b9b4b0 Alexander Graf 2024-01-17  707  	memmap_init_kho_scratch_pages();
f5bf8db4b9b4b0 Alexander Graf 2024-01-17  708  
f5bf8db4b9b4b0 Alexander Graf 2024-01-17  709  	/*
f5bf8db4b9b4b0 Alexander Graf 2024-01-17  710  	 * Mark scratch mem as CMA before we return it. That way we
f5bf8db4b9b4b0 Alexander Graf 2024-01-17  711  	 * ensure that no kernel allocations happen on it. That means
f5bf8db4b9b4b0 Alexander Graf 2024-01-17  712  	 * we can reuse it as scratch memory again later.
f5bf8db4b9b4b0 Alexander Graf 2024-01-17  713  	 */
f5bf8db4b9b4b0 Alexander Graf 2024-01-17 @714  	__for_each_mem_range(i, &memblock.memory, NULL, NUMA_NO_NODE,
f5bf8db4b9b4b0 Alexander Graf 2024-01-17  715  			     MEMBLOCK_KHO_SCRATCH, &start, &end, NULL) {
f5bf8db4b9b4b0 Alexander Graf 2024-01-17  716  		ulong start_pfn = pageblock_start_pfn(PFN_DOWN(start));
f5bf8db4b9b4b0 Alexander Graf 2024-01-17  717  		ulong end_pfn = pageblock_align(PFN_UP(end));
f5bf8db4b9b4b0 Alexander Graf 2024-01-17  718  		ulong pfn;
f5bf8db4b9b4b0 Alexander Graf 2024-01-17  719  
f5bf8db4b9b4b0 Alexander Graf 2024-01-17  720  		for (pfn = start_pfn; pfn < end_pfn; pfn += pageblock_nr_pages)
f5bf8db4b9b4b0 Alexander Graf 2024-01-17  721  			set_pageblock_migratetype(pfn_to_page(pfn), MIGRATE_CMA);
f5bf8db4b9b4b0 Alexander Graf 2024-01-17  722  	}
f5bf8db4b9b4b0 Alexander Graf 2024-01-17  723  }
f5bf8db4b9b4b0 Alexander Graf 2024-01-17  724  

:::::: The code at line 714 was first introduced by commit
:::::: f5bf8db4b9b4b0c11d3e340ba820a7f088cdd2cb kexec: Add KHO parsing support

:::::: TO: Alexander Graf <graf@amazon.com>
:::::: CC: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
