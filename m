Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3BC2C08C0
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 20:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766090073; cv=none; b=F5XJ/l3dXkf+U9FWza/9zccEnTRmB8zIQoV5J+gjhXnR3NBW+ScUfm4EUlOVzL3tCIpsEOeMH8vhhgoY4ZyAF0ZKB59L4ezowBf5+VEteKGKDm3h2j1VX3v9tP418Svuhtg/zb187zkNWjH6dQYBKBpw7XTd2YziAAMwvZMH6ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766090073; c=relaxed/simple;
	bh=UHHh8ZGqgEcJfIrdbp7YZrFg2wJxsqpxWqnw+dHupYo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lZXIqYiKn0PZ/4FE3GuqoJjuAWnkDL/Ibw9eXFsVHffkVWTzMUwGGqB+X6aK79YZ0Aelg/9KnuYNgK5xKIau2Btlt+6K0wbMQ5zO1onStcfTCLjo7VI56zoGK23UcldT0lZWw99N0HZ+7zCP2cR0gjTBq33fdbFzI5RA4GUVoLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fzrkZ1ij; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fzrkZ1ij"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766090071; x=1797626071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UHHh8ZGqgEcJfIrdbp7YZrFg2wJxsqpxWqnw+dHupYo=;
  b=fzrkZ1ij6suVqxpY+NEf9WKZRc/u03o3lwL1Zo/7jSsaDWDqw7DIanpY
   TYJOtZTDEsM7xMyAAFhn8mlmFw2MTqHdB/2u3ELlcEBw7LxameTYgvu9h
   JbcAnFc90rH9D7VSPwnrLUo1hvphgJjipdqtzcWr1ycSnlE2hWRxsrIDB
   J8RuHWukvpe1umgs6Vgd1ejXABMM4u1uhaQ5qkBgfFru054YSq5FBEXOj
   EJGdwa6pAL6IYici1hZOiH0R2isW5ZfMSqYhRYutgHw1+WmToC2DRFrnD
   ErvQKz99g9Ou8/sdoAVvWIjNFceWL4A2a5ji3YSCaZ3q/DFJukNwZhnMx
   w==;
X-CSE-ConnectionGUID: pMmZTHunQH2D88XqNpsYMw==
X-CSE-MsgGUID: 1hInIsAkSMSebgu170FhJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78768807"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="78768807"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 12:34:30 -0800
X-CSE-ConnectionGUID: xO7JAFWySUOmWlKH8F2IQQ==
X-CSE-MsgGUID: 92epcoOXT4G9LjqG+nPqvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="203085488"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Dec 2025 12:34:29 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWKhe-000000002cj-330A;
	Thu, 18 Dec 2025 20:34:26 +0000
Date: Fri, 19 Dec 2025 04:33:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/x86/kernel/crash.c:205 elf_header_exclude_ranges() warn: we
 never enter this loop
Message-ID: <202512190414.AOXweMca-lkp@intel.com>
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
TO: Jiri Bohac <jbohac@suse.cz>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: bf8be1c3610829056e5445282ca92ca7b7a4ba7b x86: implement crashkernel cma reservation
date:   5 months ago
:::::: branch date: 2 days ago
:::::: commit date: 5 months ago
config: i386-randconfig-141-20251219 (https://download.01.org/0day-ci/archive/20251219/202512190414.AOXweMca-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512190414.AOXweMca-lkp@intel.com/

smatch warnings:
arch/x86/kernel/crash.c:205 elf_header_exclude_ranges() warn: we never enter this loop

vim +205 arch/x86/kernel/crash.c

dd5f726076cc76 Vivek Goyal     2014-08-08  179  
dd5f726076cc76 Vivek Goyal     2014-08-08  180  /*
dd5f726076cc76 Vivek Goyal     2014-08-08  181   * Look for any unwanted ranges between mstart, mend and remove them. This
8d5f894a3108ac AKASHI Takahiro 2018-04-13  182   * might lead to split and split ranges are put in cmem->ranges[] array
dd5f726076cc76 Vivek Goyal     2014-08-08  183   */
8d5f894a3108ac AKASHI Takahiro 2018-04-13  184  static int elf_header_exclude_ranges(struct crash_mem *cmem)
dd5f726076cc76 Vivek Goyal     2014-08-08  185  {
dd5f726076cc76 Vivek Goyal     2014-08-08  186  	int ret = 0;
bf8be1c3610829 Jiri Bohac      2025-06-12  187  	int i;
dd5f726076cc76 Vivek Goyal     2014-08-08  188  
7c321eb2b843bf Lianbo Jiang    2019-11-08  189  	/* Exclude the low 1M because it is always reserved */
61bb219f9d83c1 Yuntao Wang     2024-01-02  190  	ret = crash_exclude_mem_range(cmem, 0, SZ_1M - 1);
7c321eb2b843bf Lianbo Jiang    2019-11-08  191  	if (ret)
7c321eb2b843bf Lianbo Jiang    2019-11-08  192  		return ret;
7c321eb2b843bf Lianbo Jiang    2019-11-08  193  
dd5f726076cc76 Vivek Goyal     2014-08-08  194  	/* Exclude crashkernel region */
babac4a84a8884 AKASHI Takahiro 2018-04-13  195  	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
dd5f726076cc76 Vivek Goyal     2014-08-08  196  	if (ret)
dd5f726076cc76 Vivek Goyal     2014-08-08  197  		return ret;
dd5f726076cc76 Vivek Goyal     2014-08-08  198  
9eff303725da65 Borislav Petkov 2019-11-14  199  	if (crashk_low_res.end)
babac4a84a8884 AKASHI Takahiro 2018-04-13  200  		ret = crash_exclude_mem_range(cmem, crashk_low_res.start,
babac4a84a8884 AKASHI Takahiro 2018-04-13  201  					      crashk_low_res.end);
bf8be1c3610829 Jiri Bohac      2025-06-12  202  	if (ret)
bf8be1c3610829 Jiri Bohac      2025-06-12  203  		return ret;
dd5f726076cc76 Vivek Goyal     2014-08-08  204  
bf8be1c3610829 Jiri Bohac      2025-06-12 @205  	for (i = 0; i < crashk_cma_cnt; ++i) {
bf8be1c3610829 Jiri Bohac      2025-06-12  206  		ret = crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
bf8be1c3610829 Jiri Bohac      2025-06-12  207  					      crashk_cma_ranges[i].end);
bf8be1c3610829 Jiri Bohac      2025-06-12  208  		if (ret)
dd5f726076cc76 Vivek Goyal     2014-08-08  209  			return ret;
dd5f726076cc76 Vivek Goyal     2014-08-08  210  	}
dd5f726076cc76 Vivek Goyal     2014-08-08  211  
bf8be1c3610829 Jiri Bohac      2025-06-12  212  	return 0;
bf8be1c3610829 Jiri Bohac      2025-06-12  213  }
bf8be1c3610829 Jiri Bohac      2025-06-12  214  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
