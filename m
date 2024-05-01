Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2C4FBEA
	for <oe-kbuild@lists.linux.dev>; Wed,  1 May 2024 17:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714584600; cv=none; b=oi7DgaHJYgxg7lZLETJlmM5xsL4V3pgB7FtGv77JkaOuXFoYqOrOi22Nejiq8imQZBSZPJXdCig9c0fpXt84Ph8rnzhb/svgTR1Yxv5h3BoF1Z35Eu94aWAakOb3vjvLawaBpWSJ2HoYowxJJLSW3/sc3DQhZikMkd5o8Zqxz+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714584600; c=relaxed/simple;
	bh=hV4AD7W9z+VMfg/IhguepetxdXYmhxQbrguxZSDFnz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LR8cnFfiWDVhi8P8azPrNxE6QtyzVzYHq855XHjw3/dsrImdTC1JM+uWF4NlL5dF8UHCNLWhZk5mo3OugpViObVWDIe5MJsvHC4zHkTVRf2Ezl82JvpFGxeHGd3i8BJRLAh/ZourGU49PSpa1mJ8H+GXmyY4asAPLFPgFY2sfEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LSWCfcA7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LSWCfcA7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714584598; x=1746120598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hV4AD7W9z+VMfg/IhguepetxdXYmhxQbrguxZSDFnz4=;
  b=LSWCfcA7WS56hkN6g88eGh+xNoLglsOecczsT8t7fxN7NfOuVS1p23tD
   6aaqxIUv15i8mB47XB1YgUa+uJCsRfnHc8hXVWnL7+jdWvx01hPN25cYg
   Jn89ILHARZaoGKfBbIoqUrjdFZrV4B+eIX2bmX4D1pwtokA36Ewaytnvr
   VNxE4QLZdLGw4kVQq3O+ulec8ynaVC2SLcumZptQ+5YggdaLPcb84n3Dy
   G424Y73Ha5Yy4WlEVWApBX8GF3MmmxuSCzJFtGjiALR5umg/3ZTSRojLL
   XVtr0e2Tvw/SixhrWrhz+YBlbLkTYuwNMH71aqWft+eav0S1cnmCd3TsK
   A==;
X-CSE-ConnectionGUID: afiHESNSQk+585sUxpaYAw==
X-CSE-MsgGUID: 8ubslGSNT8udltntHvGUiQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10448394"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="10448394"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 10:29:58 -0700
X-CSE-ConnectionGUID: jbsveMxYT0i6HD7ZE4tyLA==
X-CSE-MsgGUID: +oN3Pk1tTA6AJbO7fQqo1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="26857298"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 May 2024 10:29:56 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2DmE-0009p2-14;
	Wed, 01 May 2024 17:29:54 +0000
Date: Thu, 2 May 2024 01:29:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9793/10134] drivers/of/of_reserved_mem.c:463
 fdt_init_reserved_mem() error: uninitialized symbol 'nomap'.
Message-ID: <202405020127.3ncxx3EI-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Oreoluwa Babatunde <quic_obabatun@quicinc.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f68868ba718e30594165879cc3020607165b0761
commit: 2acef04ad57cab44b33001542791fc93f81cadf1 [9793/10134] of: reserved_mem: Remove the use of phandle from the reserved_mem APIs
:::::: branch date: 7 hours ago
:::::: commit date: 25 hours ago
config: i386-randconfig-141-20240501 (https://download.01.org/0day-ci/archive/20240502/202405020127.3ncxx3EI-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405020127.3ncxx3EI-lkp@intel.com/

smatch warnings:
drivers/of/of_reserved_mem.c:463 fdt_init_reserved_mem() error: uninitialized symbol 'nomap'.

vim +/nomap +463 drivers/of/of_reserved_mem.c

ae1add247bf8c2 Mitchel Humpherys  2015-09-15  426  
3f0c8206644836 Marek Szyprowski   2014-02-28  427  /**
c8813f7ec01c67 chenqiwu           2020-05-11  428   * fdt_init_reserved_mem() - allocate and init all saved reserved memory regions
3f0c8206644836 Marek Szyprowski   2014-02-28  429   */
3f0c8206644836 Marek Szyprowski   2014-02-28  430  void __init fdt_init_reserved_mem(void)
3f0c8206644836 Marek Szyprowski   2014-02-28  431  {
3f0c8206644836 Marek Szyprowski   2014-02-28  432  	int i;
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  433  
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  434  	/* check for overlapping reserved regions */
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  435  	__rmem_check_for_overlap();
ae1add247bf8c2 Mitchel Humpherys  2015-09-15  436  
3f0c8206644836 Marek Szyprowski   2014-02-28  437  	for (i = 0; i < reserved_mem_count; i++) {
3f0c8206644836 Marek Szyprowski   2014-02-28  438  		struct reserved_mem *rmem = &reserved_mem[i];
3f0c8206644836 Marek Szyprowski   2014-02-28  439  		unsigned long node = rmem->fdt_node;
3f0c8206644836 Marek Szyprowski   2014-02-28  440  		int err = 0;
6f1188b4ac7577 Yue Hu             2020-07-30  441  		bool nomap;
3f0c8206644836 Marek Szyprowski   2014-02-28  442  
3f0c8206644836 Marek Szyprowski   2014-02-28  443  		if (rmem->size == 0)
3f0c8206644836 Marek Szyprowski   2014-02-28  444  			err = __reserved_mem_alloc_size(node, rmem->name,
3f0c8206644836 Marek Szyprowski   2014-02-28  445  						 &rmem->base, &rmem->size);
d0b8ed47e83a22 pierre Kuo         2019-02-19  446  		if (err == 0) {
d0b8ed47e83a22 pierre Kuo         2019-02-19  447  			err = __reserved_mem_init_node(rmem);
d0b8ed47e83a22 pierre Kuo         2019-02-19  448  			if (err != 0 && err != -ENOENT) {
d0b8ed47e83a22 pierre Kuo         2019-02-19  449  				pr_info("node %s compatible matching fail\n",
d0b8ed47e83a22 pierre Kuo         2019-02-19  450  					rmem->name);
2acef04ad57cab Oreoluwa Babatunde 2024-04-22  451  
2acef04ad57cab Oreoluwa Babatunde 2024-04-22  452  				nomap = of_get_flat_dt_prop(node, "no-map", NULL) != NULL;
d0b8ed47e83a22 pierre Kuo         2019-02-19  453  				if (nomap)
7b25995f5319ad Dong Aisheng       2021-06-11  454  					memblock_clear_nomap(rmem->base, rmem->size);
3c6867a12a224d Dong Aisheng       2021-06-11  455  				else
3ecc68349bbab6 Mike Rapoport      2021-11-05  456  					memblock_phys_free(rmem->base,
3ecc68349bbab6 Mike Rapoport      2021-11-05  457  							   rmem->size);
aeb9267eb6b1df Martin Liu         2023-02-10  458  			} else {
aeb9267eb6b1df Martin Liu         2023-02-10  459  				phys_addr_t end = rmem->base + rmem->size - 1;
aeb9267eb6b1df Martin Liu         2023-02-10  460  				bool reusable =
aeb9267eb6b1df Martin Liu         2023-02-10  461  					(of_get_flat_dt_prop(node, "reusable", NULL)) != NULL;
aeb9267eb6b1df Martin Liu         2023-02-10  462  
6ee7afbabcee4d Geert Uytterhoeven 2023-02-16 @463  				pr_info("%pa..%pa (%lu KiB) %s %s %s\n",
aeb9267eb6b1df Martin Liu         2023-02-10  464  					&rmem->base, &end, (unsigned long)(rmem->size / SZ_1K),
aeb9267eb6b1df Martin Liu         2023-02-10  465  					nomap ? "nomap" : "map",
aeb9267eb6b1df Martin Liu         2023-02-10  466  					reusable ? "reusable" : "non-reusable",
aeb9267eb6b1df Martin Liu         2023-02-10  467  					rmem->name ? rmem->name : "unknown");
d0b8ed47e83a22 pierre Kuo         2019-02-19  468  			}
d0b8ed47e83a22 pierre Kuo         2019-02-19  469  		}
3f0c8206644836 Marek Szyprowski   2014-02-28  470  	}
3f0c8206644836 Marek Szyprowski   2014-02-28  471  }
9dcfee01930e6c Marek Szyprowski   2014-07-14  472  

:::::: The code at line 463 was first introduced by commit
:::::: 6ee7afbabcee4d54024c46f8fc74314c69a04613 of: reserved_mem: Use proper binary prefix

:::::: TO: Geert Uytterhoeven <geert+renesas@glider.be>
:::::: CC: Rob Herring <robh@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
