Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C5733993
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Jan 2026 01:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768440281; cv=none; b=r+jRPdEU6V70EhnxRxrmWShe1Hryb0OihMvR1FQ4GikBN3PSkED1V3VAuBdM6KK3M9iKzNhfQip2faEnvXXJ0vZvBbhQ/IR3MNOdy2zWfS1jo4V6CLRnM8zyO4izlOcNm0pj/m5UKry+LOdY67BI2RT8r+2fidn/6ub/cRyZOLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768440281; c=relaxed/simple;
	bh=5BHJAlEjdyCub+lfnTtGrubyOUl5C2P38V7B70+s4dI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jnSlI7racVl9nMaTET0hKi309l1phYl2dZsMe4gUxUX3zbbXDtLoqU6ZRuwRawGX3xxPV73P4agIsCNvYCjDcIF0HoWHA9Wl+VaTBhUH9IEQWUFPcw4nTrjRo972OAUer+ldY18OrAeA1augHaQLFJ7SRIFkLRxH8NYHkQ6a3EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ba5Y/QhD; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ba5Y/QhD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768440280; x=1799976280;
  h=date:from:to:cc:subject:message-id;
  bh=5BHJAlEjdyCub+lfnTtGrubyOUl5C2P38V7B70+s4dI=;
  b=ba5Y/QhD3I3Ws/LUHLHZD8UQKFjHLFxfwk17x3UKybraBBvLt2wTa/bs
   a6D7lPAQWNXqP7Zwbe1npz91nJ3sBdwrbmcUtlsWBb+ilhK286wtynRxW
   VLqkW2kZkK0UY39Iz2Y3+HTF4edFafW03TWTyCwl0J+vCJLaNoLNHcT7f
   bCEIwxyGCLwc5CftrCS5R4JG0DBfg+tkqHRe+uob8cshwTY3+FmrCfMWt
   WIiYE2tLqJ9/3noG3ucSUQspOPmoIjRILPLRpwdy7ffg+xa6amerjkBr9
   8AJe4XJhc/HvAu+Glk7QLTGd1S/TeVHEOVVA13zf/Wm+uZf2Uxlgse+Xm
   Q==;
X-CSE-ConnectionGUID: DI4zHC3dR5KoFkV1zpGV7g==
X-CSE-MsgGUID: a9pGs8N3T26Zuki0tlM3ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="68759082"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="68759082"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 17:24:39 -0800
X-CSE-ConnectionGUID: 8qJ604zuRXmoGSy7bYoA8A==
X-CSE-MsgGUID: Vhjzs9J4TX6cpBBN4ssuBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="209334054"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Jan 2026 17:24:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgC6E-00000000HJW-0NSv;
	Thu, 15 Jan 2026 01:24:34 +0000
Date: Thu, 15 Jan 2026 09:24:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/x86/kernel/crash.c:387 crash_setup_memmap_entries()
 warn: we never enter this loop
Message-ID: <202601150925.7wtxhlrF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jiri Bohac <jbohac@suse.cz>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   944aacb68baf7624ab8d277d0ebf07f025ca137c
commit: bf8be1c3610829056e5445282ca92ca7b7a4ba7b x86: implement crashkernel cma reservation
date:   6 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-r073-20260115 (https://download.01.org/0day-ci/archive/20260115/202601150925.7wtxhlrF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601150925.7wtxhlrF-lkp@intel.com/

New smatch warnings:
arch/x86/kernel/crash.c:387 crash_setup_memmap_entries() warn: we never enter this loop

Old smatch warnings:
arch/x86/kernel/crash.c:205 elf_header_exclude_ranges() warn: we never enter this loop

vim +387 arch/x86/kernel/crash.c

5eb3f60554216b Coiby Xu        2025-05-02  314  
dd5f726076cc76 Vivek Goyal     2014-08-08  315  /* Prepare memory map for crash dump kernel */
dd5f726076cc76 Vivek Goyal     2014-08-08  316  int crash_setup_memmap_entries(struct kimage *image, struct boot_params *params)
dd5f726076cc76 Vivek Goyal     2014-08-08  317  {
5eb3f60554216b Coiby Xu        2025-05-02  318  	unsigned int nr_ranges = 0;
dd5f726076cc76 Vivek Goyal     2014-08-08  319  	int i, ret = 0;
dd5f726076cc76 Vivek Goyal     2014-08-08  320  	unsigned long flags;
8ec67d97bff592 Ingo Molnar     2017-01-27  321  	struct e820_entry ei;
dd5f726076cc76 Vivek Goyal     2014-08-08  322  	struct crash_memmap_data cmd;
dd5f726076cc76 Vivek Goyal     2014-08-08  323  	struct crash_mem *cmem;
dd5f726076cc76 Vivek Goyal     2014-08-08  324  
5eb3f60554216b Coiby Xu        2025-05-02  325  	/*
5eb3f60554216b Coiby Xu        2025-05-02  326  	 * Using random kexec_buf for passing dm crypt keys may cause a range
5eb3f60554216b Coiby Xu        2025-05-02  327  	 * split. So use two slots here.
5eb3f60554216b Coiby Xu        2025-05-02  328  	 */
5eb3f60554216b Coiby Xu        2025-05-02  329  	nr_ranges = 2;
5eb3f60554216b Coiby Xu        2025-05-02  330  	cmem = vzalloc(struct_size(cmem, ranges, nr_ranges));
dd5f726076cc76 Vivek Goyal     2014-08-08  331  	if (!cmem)
dd5f726076cc76 Vivek Goyal     2014-08-08  332  		return -ENOMEM;
dd5f726076cc76 Vivek Goyal     2014-08-08  333  
5eb3f60554216b Coiby Xu        2025-05-02  334  	cmem->max_nr_ranges = nr_ranges;
5eb3f60554216b Coiby Xu        2025-05-02  335  	cmem->nr_ranges = 0;
5eb3f60554216b Coiby Xu        2025-05-02  336  
dd5f726076cc76 Vivek Goyal     2014-08-08  337  	memset(&cmd, 0, sizeof(struct crash_memmap_data));
dd5f726076cc76 Vivek Goyal     2014-08-08  338  	cmd.params = params;
dd5f726076cc76 Vivek Goyal     2014-08-08  339  
7c321eb2b843bf Lianbo Jiang    2019-11-08  340  	/* Add the low 1M */
7c321eb2b843bf Lianbo Jiang    2019-11-08  341  	cmd.type = E820_TYPE_RAM;
7c321eb2b843bf Lianbo Jiang    2019-11-08  342  	flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
7c321eb2b843bf Lianbo Jiang    2019-11-08  343  	walk_iomem_res_desc(IORES_DESC_NONE, flags, 0, (1<<20)-1, &cmd,
7c321eb2b843bf Lianbo Jiang    2019-11-08  344  			    memmap_entry_callback);
dd5f726076cc76 Vivek Goyal     2014-08-08  345  
dd5f726076cc76 Vivek Goyal     2014-08-08  346  	/* Add ACPI tables */
09821ff1d50a1e Ingo Molnar     2017-01-28  347  	cmd.type = E820_TYPE_ACPI;
dd5f726076cc76 Vivek Goyal     2014-08-08  348  	flags = IORESOURCE_MEM | IORESOURCE_BUSY;
f0f4711aa16b82 Toshi Kani      2016-01-26  349  	walk_iomem_res_desc(IORES_DESC_ACPI_TABLES, flags, 0, -1, &cmd,
dd5f726076cc76 Vivek Goyal     2014-08-08  350  			    memmap_entry_callback);
dd5f726076cc76 Vivek Goyal     2014-08-08  351  
dd5f726076cc76 Vivek Goyal     2014-08-08  352  	/* Add ACPI Non-volatile Storage */
09821ff1d50a1e Ingo Molnar     2017-01-28  353  	cmd.type = E820_TYPE_NVS;
f0f4711aa16b82 Toshi Kani      2016-01-26  354  	walk_iomem_res_desc(IORES_DESC_ACPI_NV_STORAGE, flags, 0, -1, &cmd,
dd5f726076cc76 Vivek Goyal     2014-08-08  355  			    memmap_entry_callback);
dd5f726076cc76 Vivek Goyal     2014-08-08  356  
980621daf368f2 Lianbo Jiang    2019-04-23  357  	/* Add e820 reserved ranges */
980621daf368f2 Lianbo Jiang    2019-04-23  358  	cmd.type = E820_TYPE_RESERVED;
980621daf368f2 Lianbo Jiang    2019-04-23  359  	flags = IORESOURCE_MEM;
980621daf368f2 Lianbo Jiang    2019-04-23  360  	walk_iomem_res_desc(IORES_DESC_RESERVED, flags, 0, -1, &cmd,
980621daf368f2 Lianbo Jiang    2019-04-23  361  			    memmap_entry_callback);
980621daf368f2 Lianbo Jiang    2019-04-23  362  
dd5f726076cc76 Vivek Goyal     2014-08-08  363  	/* Add crashk_low_res region */
dd5f726076cc76 Vivek Goyal     2014-08-08  364  	if (crashk_low_res.end) {
dd5f726076cc76 Vivek Goyal     2014-08-08  365  		ei.addr = crashk_low_res.start;
1429b568ad7194 Julia Lawall    2020-01-01  366  		ei.size = resource_size(&crashk_low_res);
09821ff1d50a1e Ingo Molnar     2017-01-28  367  		ei.type = E820_TYPE_RAM;
dd5f726076cc76 Vivek Goyal     2014-08-08  368  		add_e820_entry(params, &ei);
dd5f726076cc76 Vivek Goyal     2014-08-08  369  	}
dd5f726076cc76 Vivek Goyal     2014-08-08  370  
dd5f726076cc76 Vivek Goyal     2014-08-08  371  	/* Exclude some ranges from crashk_res and add rest to memmap */
9eff303725da65 Borislav Petkov 2019-11-14  372  	ret = memmap_exclude_ranges(image, cmem, crashk_res.start, crashk_res.end);
dd5f726076cc76 Vivek Goyal     2014-08-08  373  	if (ret)
dd5f726076cc76 Vivek Goyal     2014-08-08  374  		goto out;
dd5f726076cc76 Vivek Goyal     2014-08-08  375  
dd5f726076cc76 Vivek Goyal     2014-08-08  376  	for (i = 0; i < cmem->nr_ranges; i++) {
dd5f726076cc76 Vivek Goyal     2014-08-08  377  		ei.size = cmem->ranges[i].end - cmem->ranges[i].start + 1;
dd5f726076cc76 Vivek Goyal     2014-08-08  378  
dd5f726076cc76 Vivek Goyal     2014-08-08  379  		/* If entry is less than a page, skip it */
dd5f726076cc76 Vivek Goyal     2014-08-08  380  		if (ei.size < PAGE_SIZE)
dd5f726076cc76 Vivek Goyal     2014-08-08  381  			continue;
dd5f726076cc76 Vivek Goyal     2014-08-08  382  		ei.addr = cmem->ranges[i].start;
09821ff1d50a1e Ingo Molnar     2017-01-28  383  		ei.type = E820_TYPE_RAM;
dd5f726076cc76 Vivek Goyal     2014-08-08  384  		add_e820_entry(params, &ei);
dd5f726076cc76 Vivek Goyal     2014-08-08  385  	}
dd5f726076cc76 Vivek Goyal     2014-08-08  386  
bf8be1c3610829 Jiri Bohac      2025-06-12 @387  	for (i = 0; i < crashk_cma_cnt; ++i) {
bf8be1c3610829 Jiri Bohac      2025-06-12  388  		ei.addr = crashk_cma_ranges[i].start;
bf8be1c3610829 Jiri Bohac      2025-06-12  389  		ei.size = crashk_cma_ranges[i].end -
bf8be1c3610829 Jiri Bohac      2025-06-12  390  			  crashk_cma_ranges[i].start + 1;
bf8be1c3610829 Jiri Bohac      2025-06-12  391  		ei.type = E820_TYPE_RAM;
bf8be1c3610829 Jiri Bohac      2025-06-12  392  		add_e820_entry(params, &ei);
bf8be1c3610829 Jiri Bohac      2025-06-12  393  	}
bf8be1c3610829 Jiri Bohac      2025-06-12  394  
dd5f726076cc76 Vivek Goyal     2014-08-08  395  out:
dd5f726076cc76 Vivek Goyal     2014-08-08  396  	vfree(cmem);
dd5f726076cc76 Vivek Goyal     2014-08-08  397  	return ret;
dd5f726076cc76 Vivek Goyal     2014-08-08  398  }
dd5f726076cc76 Vivek Goyal     2014-08-08  399  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
