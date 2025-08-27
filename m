Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D88E2F0C76
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Aug 2025 21:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756331306; cv=none; b=HGJVk1+Iy7PUVWiRGJoBbvzSZDgGj3UvAfZpJFfpB62ArqTJaDkunEuwQnqkA+iZIdNWc67aG7iMmnrc8YFa/TqDojpJPinuim/4DU6YWe2b2zFxc233S7KGDEHq4gYrk2NJj00OghMwqrX3xebNmXZwBZklMH24J5AcEwAlQ1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756331306; c=relaxed/simple;
	bh=zG7EkFmgZbm4d08dthhBBUGRvS6C0v9tnyzsEg5RdQA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I7PXvkAAIBrEAsZuvpJOSWKe0MsURh45EHRYxGRrOgbiaoCLQMrL655TbiFTfK21MnAyUELynMb0X2bH6PknqOPlsdelOxUSLoODq9fuXKk+i6ko1AEz9w9nar88DOl09aWA2BKSeiZb0AnBRjOq9CrOMwOs1Ropgi0hjjd4jOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N8QHGQxI; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N8QHGQxI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756331305; x=1787867305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zG7EkFmgZbm4d08dthhBBUGRvS6C0v9tnyzsEg5RdQA=;
  b=N8QHGQxI5uJL4CoEP7UiHnUgvm20TMt1yht9h1MvTdJejiFm0XegMoYI
   JCRkIpiviw+BEFg02/l/TeyLC+coyKFYQXczDqXGAnRvk7FX33kaxVhfV
   ZPVB4yWOIZUFGGwRmsvf5Qh2tJP4pRPQ3mwiPoTpMLz+DyqQ+5HFEqoo5
   Uf5Yb9Syh+sxsHZLt/I78hcnZr/Fyz+6YoEJiJvHT1S2Gm3pKGO66NmBk
   sq6mdUJ12y6MiAY/Cg8XJjSJVqNNdmQYO9iZRqyvBkLNUCV11LZu8yIYM
   DW3mWMiAXAzDrx+39fdryzZTdTlwU6+fQ9fY8ope/ncgmIPzsVypHh3vr
   A==;
X-CSE-ConnectionGUID: BUdZNx7eQ2yFmxHeaFb21Q==
X-CSE-MsgGUID: DQHcDxnbQrqdzD+5OBVfeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58445194"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="58445194"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 14:48:24 -0700
X-CSE-ConnectionGUID: glcm5YYMRQOo1+wzgnsC1g==
X-CSE-MsgGUID: ci+ikMbSTyG271Gk+qeOjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="174278159"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 27 Aug 2025 14:48:22 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urO0C-000TF1-13;
	Wed, 27 Aug 2025 21:48:20 +0000
Date: Thu, 28 Aug 2025 05:48:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/memtest.c:78 do_one_pass() warn: iterator 'i' not incremented
Message-ID: <202508280538.fjNoEqi7-lkp@intel.com>
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
TO: Yuli Wang <wangyuli@uniontech.com>
CC: Huacai Chen <chenhuacai@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fab1beda7597fac1cecc01707d55eadb6bbe773c
commit: fb8e9f59d6f292c3d9fea6c155c22ea5fc3053ab LoongArch: Select ARCH_USE_MEMTEST
date:   4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: loongarch-randconfig-r072-20250825 (https://download.01.org/0day-ci/archive/20250828/202508280538.fjNoEqi7-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508280538.fjNoEqi7-lkp@intel.com/

smatch warnings:
mm/memtest.c:78 do_one_pass() warn: iterator 'i' not incremented

vim +/i +78 mm/memtest.c

1f067167a83d1c arch/x86/mm/memtest.c Yinghai Lu       2008-07-15  72  
7f70baeeb9e2d2 mm/memtest.c          Vladimir Murzin  2015-04-14  73  static void __init do_one_pass(u64 pattern, phys_addr_t start, phys_addr_t end)
bfb4dc0da45f8f arch/x86/mm/memtest.c Andreas Herrmann 2009-02-25  74  {
8d89ac808417e9 arch/x86/mm/memtest.c Tejun Heo        2011-07-12  75  	u64 i;
8d89ac808417e9 arch/x86/mm/memtest.c Tejun Heo        2011-07-12  76  	phys_addr_t this_start, this_end;
bfb4dc0da45f8f arch/x86/mm/memtest.c Andreas Herrmann 2009-02-25  77  
fc6daaf9315187 mm/memtest.c          Tony Luck        2015-06-24 @78  	for_each_free_mem_range(i, NUMA_NO_NODE, MEMBLOCK_NONE, &this_start,
fc6daaf9315187 mm/memtest.c          Tony Luck        2015-06-24  79  				&this_end, NULL) {
7f70baeeb9e2d2 mm/memtest.c          Vladimir Murzin  2015-04-14  80  		this_start = clamp(this_start, start, end);
7f70baeeb9e2d2 mm/memtest.c          Vladimir Murzin  2015-04-14  81  		this_end = clamp(this_end, start, end);
8d89ac808417e9 arch/x86/mm/memtest.c Tejun Heo        2011-07-12  82  		if (this_start < this_end) {
f373bafcad6883 mm/memtest.c          Vladimir Murzin  2015-09-08  83  			pr_info("  %pa - %pa pattern %016llx\n",
f373bafcad6883 mm/memtest.c          Vladimir Murzin  2015-09-08  84  				&this_start, &this_end, cpu_to_be64(pattern));
8d89ac808417e9 arch/x86/mm/memtest.c Tejun Heo        2011-07-12  85  			memtest(pattern, this_start, this_end - this_start);
8d89ac808417e9 arch/x86/mm/memtest.c Tejun Heo        2011-07-12  86  		}
bfb4dc0da45f8f arch/x86/mm/memtest.c Andreas Herrmann 2009-02-25  87  	}
bfb4dc0da45f8f arch/x86/mm/memtest.c Andreas Herrmann 2009-02-25  88  }
bfb4dc0da45f8f arch/x86/mm/memtest.c Andreas Herrmann 2009-02-25  89  

:::::: The code at line 78 was first introduced by commit
:::::: fc6daaf93151877748f8096af6b3fddb147f22d6 mm/memblock: add extra "flags" to memblock to allow selection of memory based on attribute

:::::: TO: Tony Luck <tony.luck@intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
