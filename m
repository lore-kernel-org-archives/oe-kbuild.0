Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750906F06A
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Jul 2025 16:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752336059; cv=none; b=dSYam05PFBtB1ar9w5R1FhJ1fPeTR4stvAFivpfwJdXHP5twR8zQ2U8FMWWqHcXNJ/bfODWhE1gvjiiHKNhuZSrYBMV7PMCgneQxHZQCMmeI2Gcplr7KmCFUJcCUpuccSrYqGGNJYL29svf+dX1wq3SUIzO4m2axUIRpr6kxVBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752336059; c=relaxed/simple;
	bh=ejQZHcg2sPJK1GdIlBpnOkfA+iEmaFaCoN/6PQtw4NA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tq7WLWv75ZMvRCQZB048YQtc5kiVzjjvyUh7VMnMVMThq/+VwCIhVZfZzSKOwsU1XW+c6+fih3qcMwoe5kkGN206fgCf62CBS82mfv4bHyaSvXp9TZPEt3mNMON1ABI1R4cz/iYZAo/BlXSIfbGPPZngHEAMX1iz58hsMb3WmP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ATxj8jqM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ATxj8jqM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752336057; x=1783872057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ejQZHcg2sPJK1GdIlBpnOkfA+iEmaFaCoN/6PQtw4NA=;
  b=ATxj8jqMsIW/AZ0muZuBViE0Q9duo75m+9gggNB8F1bE5cY/xzdRh5jz
   dXNTViUr470f1DmrJq1pehJ3vUTxO23bjg0koN/xeFguz7O+XahZAzWCL
   TcWRCgvh2fGKyJgjwW0qRrzWhiV3HRYKnVGEzMU4QqnNhC2xZrtkVGdrD
   8j2b+02Uz5SwPIjAc0x44K1AiB61xOgANpXHJCJoP7h6D1pEQs9IQjkG7
   iZAXoGOB6cCbA30FUIWXuBhhn2gYm+D2fRAXZ+jqzGiZs7UTOSyDQly7t
   spE+pUKZr0F0ypCqyxMrrDnfyeT7p4emRn1EMWg+oLhLbuOPnRIQvFbok
   w==;
X-CSE-ConnectionGUID: EWKxm8XeT6KhJ3zZcMQLfg==
X-CSE-MsgGUID: WgUQaaI7TUaB2CmMtYWTgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54470606"
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="54470606"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 09:00:56 -0700
X-CSE-ConnectionGUID: Bhrr7MR6Qg2sTodbo045Xw==
X-CSE-MsgGUID: Z8Gj++sVRxmb5duPH2Es+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="180275398"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Jul 2025 09:00:55 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uacej-0007Rt-0N;
	Sat, 12 Jul 2025 16:00:53 +0000
Date: Sun, 13 Jul 2025 00:00:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/huge_memory.c:930 hugepage_init() error: uninitialized symbol
 'hugepage_kobj'.
Message-ID: <202507122309.7IUCjjtB-lkp@intel.com>
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
TO: Arnd Bergmann <arnd@arndb.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   379f604cc3dc2c865dc2b13d81faa166b6df59ec
commit: 4496e1c1354bd4837bcc1414f6e1a4d042857903 crash_dump, nvme: select CONFIGFS_FS as built-in
date:   7 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 7 weeks ago
config: s390-randconfig-r073-20250712 (https://download.01.org/0day-ci/archive/20250712/202507122309.7IUCjjtB-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507122309.7IUCjjtB-lkp@intel.com/

smatch warnings:
mm/huge_memory.c:930 hugepage_init() error: uninitialized symbol 'hugepage_kobj'.

vim +/hugepage_kobj +930 mm/huge_memory.c

54d917295b8366 Qi Zheng           2023-09-11  882  
569e55900a5c3c Shaohua Li         2012-01-12  883  static int __init hugepage_init(void)
569e55900a5c3c Shaohua Li         2012-01-12  884  {
569e55900a5c3c Shaohua Li         2012-01-12  885  	int err;
569e55900a5c3c Shaohua Li         2012-01-12  886  	struct kobject *hugepage_kobj;
569e55900a5c3c Shaohua Li         2012-01-12  887  
569e55900a5c3c Shaohua Li         2012-01-12  888  	if (!has_transparent_hugepage()) {
3c556d2425b040 Peter Xu           2023-03-15  889  		transparent_hugepage_flags = 1 << TRANSPARENT_HUGEPAGE_UNSUPPORTED;
569e55900a5c3c Shaohua Li         2012-01-12  890  		return -EINVAL;
569e55900a5c3c Shaohua Li         2012-01-12  891  	}
569e55900a5c3c Shaohua Li         2012-01-12  892  
ff20c2e0acc5ad Kirill A. Shutemov 2016-03-01  893  	/*
ff20c2e0acc5ad Kirill A. Shutemov 2016-03-01  894  	 * hugepages can't be allocated by the buddy allocator
ff20c2e0acc5ad Kirill A. Shutemov 2016-03-01  895  	 */
5e0a760b44417f Kirill A. Shutemov 2023-12-28  896  	MAYBE_BUILD_BUG_ON(HPAGE_PMD_ORDER > MAX_PAGE_ORDER);
ff20c2e0acc5ad Kirill A. Shutemov 2016-03-01  897  
569e55900a5c3c Shaohua Li         2012-01-12  898  	err = hugepage_init_sysfs(&hugepage_kobj);
569e55900a5c3c Shaohua Li         2012-01-12  899  	if (err)
65ebb64f4d2ce8 Kirill A. Shutemov 2015-04-15  900  		goto err_sysfs;
ba76149f47d8c9 Andrea Arcangeli   2011-01-13  901  
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  902  	err = khugepaged_init();
ba76149f47d8c9 Andrea Arcangeli   2011-01-13  903  	if (err)
65ebb64f4d2ce8 Kirill A. Shutemov 2015-04-15  904  		goto err_slab;
ba76149f47d8c9 Andrea Arcangeli   2011-01-13  905  
54d917295b8366 Qi Zheng           2023-09-11  906  	err = thp_shrinker_init();
9a982250f773cc Kirill A. Shutemov 2016-01-15  907  	if (err)
54d917295b8366 Qi Zheng           2023-09-11  908  		goto err_shrinker;
97ae17497e996f Kirill A. Shutemov 2012-12-12  909  
97562cd243298a Rik van Riel       2011-01-13  910  	/*
97562cd243298a Rik van Riel       2011-01-13  911  	 * By default disable transparent hugepages on smaller systems,
97562cd243298a Rik van Riel       2011-01-13  912  	 * where the extra memory used could hurt more than TLB overhead
97562cd243298a Rik van Riel       2011-01-13  913  	 * is likely to save.  The admin can still enable it through /sys.
97562cd243298a Rik van Riel       2011-01-13  914  	 */
ca79b0c211af63 Arun KS            2018-12-28  915  	if (totalram_pages() < (512 << (20 - PAGE_SHIFT))) {
97562cd243298a Rik van Riel       2011-01-13  916  		transparent_hugepage_flags = 0;
79553da293d38d Kirill A. Shutemov 2015-04-15  917  		return 0;
79553da293d38d Kirill A. Shutemov 2015-04-15  918  	}
97562cd243298a Rik van Riel       2011-01-13  919  
79553da293d38d Kirill A. Shutemov 2015-04-15  920  	err = start_stop_khugepaged();
65ebb64f4d2ce8 Kirill A. Shutemov 2015-04-15  921  	if (err)
65ebb64f4d2ce8 Kirill A. Shutemov 2015-04-15  922  		goto err_khugepaged;
ba76149f47d8c9 Andrea Arcangeli   2011-01-13  923  
569e55900a5c3c Shaohua Li         2012-01-12  924  	return 0;
65ebb64f4d2ce8 Kirill A. Shutemov 2015-04-15  925  err_khugepaged:
54d917295b8366 Qi Zheng           2023-09-11  926  	thp_shrinker_exit();
54d917295b8366 Qi Zheng           2023-09-11  927  err_shrinker:
b46e756f5e4703 Kirill A. Shutemov 2016-07-26  928  	khugepaged_destroy();
65ebb64f4d2ce8 Kirill A. Shutemov 2015-04-15  929  err_slab:
569e55900a5c3c Shaohua Li         2012-01-12 @930  	hugepage_exit_sysfs(hugepage_kobj);
65ebb64f4d2ce8 Kirill A. Shutemov 2015-04-15  931  err_sysfs:
ba76149f47d8c9 Andrea Arcangeli   2011-01-13  932  	return err;
71e3aac0724ffe Andrea Arcangeli   2011-01-13  933  }
a64fb3cd610c8e Paul Gortmaker     2014-01-23  934  subsys_initcall(hugepage_init);
71e3aac0724ffe Andrea Arcangeli   2011-01-13  935  

:::::: The code at line 930 was first introduced by commit
:::::: 569e55900a5c3c30de6e25c3f259ae7c7dbadb96 thp: improve the error code path

:::::: TO: Shaohua Li <shaohua.li@intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
