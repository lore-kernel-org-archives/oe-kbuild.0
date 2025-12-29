Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66722E7F3A
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Dec 2025 07:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766992127; cv=none; b=PiJ5pY80jEU4zPfZoIPGVYu7YpFyzIsbYeQ/WBdmfCbpWa+xemeKN+AMcy/iJBzGfqWO/UM3SitmpF3gBNVLKb9odttNDOnrr73gPnJVdU7tsUbUeGfAnvYvsxIPrFgdZPUstycu6m4DlGTot9bnkN8ARe//Bk4Bk9r9pfyBG5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766992127; c=relaxed/simple;
	bh=97lMpGEuU1xgezYUNIX2RzSlWXoVMbALaN1DpusWnWg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aEMXuq2n0QWZsYNoTjgd91I/rO6U71+tlvx/9UFRwKghvKt4M7v9wniNEzLk2+XmeJZ8OMVuoo3STa/OKu2LE46EZ4GZvbuxow9VnMQr6u1djDaMGaSOIpY3FixZRSvk0QiYE4NQC3T/rLDSEn0qKhJxgiVZmeJwa2YvbJmGrCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vu0ZX8ym; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vu0ZX8ym"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766992115; x=1798528115;
  h=date:from:to:cc:subject:message-id;
  bh=97lMpGEuU1xgezYUNIX2RzSlWXoVMbALaN1DpusWnWg=;
  b=Vu0ZX8ymlA/j9XKlEh05NS7v0YBN3U/Htx0R17ELCAzuOQiC51Fvrd6X
   Hi+DFUwnMadYD1fEO/gZTrubJmwp5WEUP0Mimvx0A6Yazg2D76xNOJT2v
   RXVTwpJiCAMSpjfV8UwVtjfOltINoqFSzIqk2i9/0b5mwg+9tLKqWOsmD
   e7y5g4b6D//2Tdl5ZRe70tTj9auT4K7XoX6GE++K2xG0u5J3oRDxZo2TW
   QT7WKjKjQUHWIvhOQi+pl+7Io4oF2ctmLRbalYNnXXY104UqHhuoDWcha
   9zydAxYuosjD4hz0HTfHgfB+FHaFZrHynvwOB7oDK3NeujUkbFegbaG94
   w==;
X-CSE-ConnectionGUID: Js+5zUH1RTSkSC/JXpepeQ==
X-CSE-MsgGUID: e+IKmpE7Rrq300D/QI3w9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68539849"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68539849"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2025 23:08:29 -0800
X-CSE-ConnectionGUID: 2SFnAXCnS4q1nJuPlT1DfA==
X-CSE-MsgGUID: S8QFBJbvSw+NkdbP9ZdLDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; 
   d="scan'208";a="201137836"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 28 Dec 2025 23:08:27 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1va7Me-0000000070l-2YbA;
	Mon, 29 Dec 2025 07:08:24 +0000
Date: Mon, 29 Dec 2025 15:07:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [paulmckrcu:dev.2025.12.16a 2/30] fs/userfaultfd.c:1534
 userfaultfd_unregister() warn: comparison of a potentially tagged address
 (userfaultfd_unregister, -2, __UNIQUE_ID_x__782)
Message-ID: <202512291441.6ViIJ47b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://github.com/paulmckrcu/linux dev.2025.12.16a
head:   c43d7370c02f0ba0fe7510d2baf861ca7a5fd168
commit: 1ac50ec62874025381a864f784583dbdc30dcc7c [2/30] rcu: Re-implement RCU Tasks Trace in terms of SRCU-fast
:::::: branch date: 7 hours ago
:::::: commit date: 12 days ago
config: arm64-randconfig-r072-20251229 (https://download.01.org/0day-ci/archive/20251229/202512291441.6ViIJ47b-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512291441.6ViIJ47b-lkp@intel.com/

New smatch warnings:
fs/userfaultfd.c:1534 userfaultfd_unregister() warn: comparison of a potentially tagged address (userfaultfd_unregister, -2, __UNIQUE_ID_x__782)

Old smatch warnings:
fs/userfaultfd.c:1367 userfaultfd_register() warn: comparison of a potentially tagged address (userfaultfd_register, -2, end)
fs/userfaultfd.c:1517 userfaultfd_unregister() warn: comparison of a potentially tagged address (userfaultfd_unregister, -2, start)
fs/userfaultfd.c:1532 userfaultfd_unregister() warn: comparison of a potentially tagged address (userfaultfd_unregister, -2, start)

vim +1534 fs/userfaultfd.c

86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1434  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1435  static int userfaultfd_unregister(struct userfaultfd_ctx *ctx,
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1436  				  unsigned long arg)
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1437  {
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1438  	struct mm_struct *mm = ctx->mm;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1439  	struct vm_area_struct *vma, *prev, *cur;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1440  	int ret;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1441  	struct uffdio_range uffdio_unregister;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1442  	bool found;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1443  	unsigned long start, end, vma_end;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1444  	const void __user *buf = (void __user *)arg;
11a9b90274f6a5 Liam R. Howlett     2023-01-20  1445  	struct vma_iterator vmi;
d61ea1cb009532 Peter Xu            2023-08-21  1446  	bool wp_async = userfaultfd_wp_async_ctx(ctx);
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1447  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1448  	ret = -EFAULT;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1449  	if (copy_from_user(&uffdio_unregister, buf, sizeof(uffdio_unregister)))
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1450  		goto out;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1451  
e71e2ace5721a8 Peter Collingbourne 2021-07-23  1452  	ret = validate_range(mm, uffdio_unregister.start,
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1453  			     uffdio_unregister.len);
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1454  	if (ret)
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1455  		goto out;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1456  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1457  	start = uffdio_unregister.start;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1458  	end = start + uffdio_unregister.len;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1459  
d2005e3f41d4f9 Oleg Nesterov       2016-05-20  1460  	ret = -ENOMEM;
d2005e3f41d4f9 Oleg Nesterov       2016-05-20  1461  	if (!mmget_not_zero(mm))
d2005e3f41d4f9 Oleg Nesterov       2016-05-20  1462  		goto out;
d2005e3f41d4f9 Oleg Nesterov       2016-05-20  1463  
d8ed45c5dcd455 Michel Lespinasse   2020-06-08  1464  	mmap_write_lock(mm);
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1465  	ret = -EINVAL;
11a9b90274f6a5 Liam R. Howlett     2023-01-20  1466  	vma_iter_init(&vmi, mm, start);
11a9b90274f6a5 Liam R. Howlett     2023-01-20  1467  	vma = vma_find(&vmi, end);
11a9b90274f6a5 Liam R. Howlett     2023-01-20  1468  	if (!vma)
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1469  		goto out_unlock;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1470  
cab350afcbc9c8 Mike Kravetz        2017-02-22  1471  	/*
cab350afcbc9c8 Mike Kravetz        2017-02-22  1472  	 * If the first vma contains huge pages, make sure start address
cab350afcbc9c8 Mike Kravetz        2017-02-22  1473  	 * is aligned to huge page size.
cab350afcbc9c8 Mike Kravetz        2017-02-22  1474  	 */
cab350afcbc9c8 Mike Kravetz        2017-02-22  1475  	if (is_vm_hugetlb_page(vma)) {
cab350afcbc9c8 Mike Kravetz        2017-02-22  1476  		unsigned long vma_hpagesize = vma_kernel_pagesize(vma);
cab350afcbc9c8 Mike Kravetz        2017-02-22  1477  
cab350afcbc9c8 Mike Kravetz        2017-02-22  1478  		if (start & (vma_hpagesize - 1))
cab350afcbc9c8 Mike Kravetz        2017-02-22  1479  			goto out_unlock;
cab350afcbc9c8 Mike Kravetz        2017-02-22  1480  	}
cab350afcbc9c8 Mike Kravetz        2017-02-22  1481  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1482  	/*
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1483  	 * Search for not compatible vmas.
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1484  	 */
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1485  	found = false;
11a9b90274f6a5 Liam R. Howlett     2023-01-20  1486  	cur = vma;
11a9b90274f6a5 Liam R. Howlett     2023-01-20  1487  	do {
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1488  		cond_resched();
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1489  
31defc3b01d907 Tal Zussman         2025-06-19  1490  		VM_WARN_ON_ONCE(!!cur->vm_userfaultfd_ctx.ctx ^
7677f7fd8be766 Axel Rasmussen      2021-05-04  1491  				!!(cur->vm_flags & __VM_UFFD_FLAGS));
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1492  
23ec90eb122faa Tal Zussman         2025-06-19  1493  		/*
23ec90eb122faa Tal Zussman         2025-06-19  1494  		 * Prevent unregistering through a different userfaultfd than
23ec90eb122faa Tal Zussman         2025-06-19  1495  		 * the one used for registration.
23ec90eb122faa Tal Zussman         2025-06-19  1496  		 */
23ec90eb122faa Tal Zussman         2025-06-19  1497  		if (cur->vm_userfaultfd_ctx.ctx &&
23ec90eb122faa Tal Zussman         2025-06-19  1498  		    cur->vm_userfaultfd_ctx.ctx != ctx)
23ec90eb122faa Tal Zussman         2025-06-19  1499  			goto out_unlock;
23ec90eb122faa Tal Zussman         2025-06-19  1500  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1501  		/*
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1502  		 * Check not compatible vmas, not strictly required
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1503  		 * here as not compatible vmas cannot have an
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1504  		 * userfaultfd_ctx registered on them, but this
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1505  		 * provides for more strict behavior to notice
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1506  		 * unregistration errors.
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1507  		 */
d61ea1cb009532 Peter Xu            2023-08-21  1508  		if (!vma_can_userfault(cur, cur->vm_flags, wp_async))
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1509  			goto out_unlock;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1510  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1511  		found = true;
11a9b90274f6a5 Liam R. Howlett     2023-01-20  1512  	} for_each_vma_range(vmi, cur, end);
31defc3b01d907 Tal Zussman         2025-06-19  1513  	VM_WARN_ON_ONCE(!found);
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1514  
11a9b90274f6a5 Liam R. Howlett     2023-01-20  1515  	vma_iter_set(&vmi, start);
11a9b90274f6a5 Liam R. Howlett     2023-01-20  1516  	prev = vma_prev(&vmi);
270aa010620697 Peter Xu            2023-05-17  1517  	if (vma->vm_start < start)
270aa010620697 Peter Xu            2023-05-17  1518  		prev = vma;
270aa010620697 Peter Xu            2023-05-17  1519  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1520  	ret = 0;
11a9b90274f6a5 Liam R. Howlett     2023-01-20  1521  	for_each_vma_range(vmi, vma, end) {
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1522  		cond_resched();
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1523  
23ec90eb122faa Tal Zussman         2025-06-19  1524  		/* VMA not registered with userfaultfd. */
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1525  		if (!vma->vm_userfaultfd_ctx.ctx)
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1526  			goto skip;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1527  
23ec90eb122faa Tal Zussman         2025-06-19  1528  		VM_WARN_ON_ONCE(vma->vm_userfaultfd_ctx.ctx != ctx);
23ec90eb122faa Tal Zussman         2025-06-19  1529  		VM_WARN_ON_ONCE(!vma_can_userfault(vma, vma->vm_flags, wp_async));
31defc3b01d907 Tal Zussman         2025-06-19  1530  		VM_WARN_ON_ONCE(!(vma->vm_flags & VM_MAYWRITE));
01e881f5a1fca4 Andrea Arcangeli    2018-12-14  1531  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1532  		if (vma->vm_start > start)
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1533  			start = vma->vm_start;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04 @1534  		vma_end = min(end, vma->vm_end);
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1535  
09fa5296a40d01 Andrea Arcangeli    2017-02-22  1536  		if (userfaultfd_missing(vma)) {
09fa5296a40d01 Andrea Arcangeli    2017-02-22  1537  			/*
09fa5296a40d01 Andrea Arcangeli    2017-02-22  1538  			 * Wake any concurrent pending userfault while
09fa5296a40d01 Andrea Arcangeli    2017-02-22  1539  			 * we unregister, so they will not hang
09fa5296a40d01 Andrea Arcangeli    2017-02-22  1540  			 * permanently and it avoids userland to call
09fa5296a40d01 Andrea Arcangeli    2017-02-22  1541  			 * UFFDIO_WAKE explicitly.
09fa5296a40d01 Andrea Arcangeli    2017-02-22  1542  			 */
09fa5296a40d01 Andrea Arcangeli    2017-02-22  1543  			struct userfaultfd_wake_range range;
09fa5296a40d01 Andrea Arcangeli    2017-02-22  1544  			range.start = start;
09fa5296a40d01 Andrea Arcangeli    2017-02-22  1545  			range.len = vma_end - start;
09fa5296a40d01 Andrea Arcangeli    2017-02-22  1546  			wake_userfault(vma->vm_userfaultfd_ctx.ctx, &range);
09fa5296a40d01 Andrea Arcangeli    2017-02-22  1547  		}
09fa5296a40d01 Andrea Arcangeli    2017-02-22  1548  
a17c7d8fd2b097 Lorenzo Stoakes     2024-07-29  1549  		vma = userfaultfd_clear_vma(&vmi, prev, vma,
a17c7d8fd2b097 Lorenzo Stoakes     2024-07-29  1550  					    start, vma_end);
94d7d923395129 Lorenzo Stoakes     2023-10-11  1551  		if (IS_ERR(vma)) {
94d7d923395129 Lorenzo Stoakes     2023-10-11  1552  			ret = PTR_ERR(vma);
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1553  			break;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1554  		}
94d7d923395129 Lorenzo Stoakes     2023-10-11  1555  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1556  	skip:
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1557  		prev = vma;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1558  		start = vma->vm_end;
11a9b90274f6a5 Liam R. Howlett     2023-01-20  1559  	}
11a9b90274f6a5 Liam R. Howlett     2023-01-20  1560  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1561  out_unlock:
d8ed45c5dcd455 Michel Lespinasse   2020-06-08  1562  	mmap_write_unlock(mm);
d2005e3f41d4f9 Oleg Nesterov       2016-05-20  1563  	mmput(mm);
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1564  out:
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1565  	return ret;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1566  }
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1567  

:::::: The code at line 1534 was first introduced by commit
:::::: 86039bd3b4e6a1129318cbfed4e0a6e001656635 userfaultfd: add new syscall to provide memory externalization

:::::: TO: Andrea Arcangeli <aarcange@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
