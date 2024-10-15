Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FC31E633B
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Oct 2024 10:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728988504; cv=none; b=SUuc8aG3zXzjMBaYIMOccldgnLbApJQi2mqmDYAm9ugdz44wtiHf52xHrCB/JPlfNA2dtJWrnNMQuZbEBWqOagVZ6weOgKsOvxY7a6D/C5okTK6kyrKxVqSuun38g4fTEGte8K2j1tEhHg4dCY9UT4rnJJk4TCFV601rgawGamE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728988504; c=relaxed/simple;
	bh=SUUQHzal75GBDij2L259hQWR4JJwJg80oX6oxddhY/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HVfPon80s4J2WkRb+0r90/fGBIL1XP7s6EBGx/1rVgy1SDESMTC9EQEYqIc6O8kUxk1+GQDShNMscYHnhGA1gPBznNKx05pRtRTRk7ep8HjKnkxA2n3YaR/oz3+x5g30tpIaSc9ozUeU0sXOfFiB2cehd5UtCWQxyCwA8BRX37Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qtah4T/v; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qtah4T/v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728988503; x=1760524503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SUUQHzal75GBDij2L259hQWR4JJwJg80oX6oxddhY/w=;
  b=Qtah4T/vr4r0LasL3x2DRrQwSbnO5bnF/Ni5fHd2b4NXa1jzcSWP63Su
   CdThtctb1xU5qFReedLvvRdMLV+92u2j+WYIiryQLBBIojtB/cNRHYTdp
   VckCRBYVTxWdq0wdYC9MKrct8MyyFp5e/OmiS5zhSdVIyeyuL33LQdogq
   uM9RomK+QWh5ciKA9PnH6jgsGKS855w8B1TjIkI6yrNTExAvuOVGbuJzQ
   NRcLGr1tpRnZSeilh/PWSP5wfq00n252DiD2ZscKLANi57bKmUj/7Kvgb
   tlKp4kOEAwQLeb83vACTDdsNywE+YqIPlF86KeL8mOibOvV3EhHETLorY
   A==;
X-CSE-ConnectionGUID: KcbNhrqOS2uNeZMShsP9gw==
X-CSE-MsgGUID: YMDkmi1URayo9CagF0ebrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39495271"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39495271"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 03:34:49 -0700
X-CSE-ConnectionGUID: dDNO+t2eSIG++Re8x1YVdA==
X-CSE-MsgGUID: 4XhWAuLUSXaXuFy8ItZb5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="82904944"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Oct 2024 03:34:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0et2-000Hyf-1e;
	Tue, 15 Oct 2024 10:34:44 +0000
Date: Tue, 15 Oct 2024 18:34:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-unstable 81/150] fs/userfaultfd.c:1479
 userfaultfd_unregister() warn: comparison of a potentially tagged address
 (userfaultfd_unregister, -2, __UNIQUE_ID_x_634)
Message-ID: <202410151806.jyTA2lFc-lkp@intel.com>
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
TO: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   d4e7ab0ed929645bee32538532039d3d451efb00
commit: 4d52e63bbea25e8f1cc6bbd4e659b6f00f451fc4 [81/150] mm: migrate LRU_REFS_MASK bits in folio_migrate_flags
:::::: branch date: 15 hours ago
:::::: commit date: 5 days ago
config: arm64-randconfig-r071-20241015 (https://download.01.org/0day-ci/archive/20241015/202410151806.jyTA2lFc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410151806.jyTA2lFc-lkp@intel.com/

New smatch warnings:
fs/userfaultfd.c:1479 userfaultfd_unregister() warn: comparison of a potentially tagged address (userfaultfd_unregister, -2, __UNIQUE_ID_x_634)

Old smatch warnings:
fs/userfaultfd.c:1317 userfaultfd_register() warn: comparison of a potentially tagged address (userfaultfd_register, -2, end)
fs/userfaultfd.c:1459 userfaultfd_unregister() warn: comparison of a potentially tagged address (userfaultfd_unregister, -2, start)
fs/userfaultfd.c:1477 userfaultfd_unregister() warn: comparison of a potentially tagged address (userfaultfd_unregister, -2, start)

vim +1479 fs/userfaultfd.c

86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1384  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1385  static int userfaultfd_unregister(struct userfaultfd_ctx *ctx,
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1386  				  unsigned long arg)
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1387  {
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1388  	struct mm_struct *mm = ctx->mm;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1389  	struct vm_area_struct *vma, *prev, *cur;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1390  	int ret;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1391  	struct uffdio_range uffdio_unregister;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1392  	bool found;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1393  	unsigned long start, end, vma_end;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1394  	const void __user *buf = (void __user *)arg;
11a9b90274f6a5 Liam R. Howlett     2023-01-20  1395  	struct vma_iterator vmi;
d61ea1cb009532 Peter Xu            2023-08-21  1396  	bool wp_async = userfaultfd_wp_async_ctx(ctx);
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1397  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1398  	ret = -EFAULT;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1399  	if (copy_from_user(&uffdio_unregister, buf, sizeof(uffdio_unregister)))
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1400  		goto out;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1401  
e71e2ace5721a8 Peter Collingbourne 2021-07-23  1402  	ret = validate_range(mm, uffdio_unregister.start,
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1403  			     uffdio_unregister.len);
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1404  	if (ret)
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1405  		goto out;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1406  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1407  	start = uffdio_unregister.start;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1408  	end = start + uffdio_unregister.len;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1409  
d2005e3f41d4f9 Oleg Nesterov       2016-05-20  1410  	ret = -ENOMEM;
d2005e3f41d4f9 Oleg Nesterov       2016-05-20  1411  	if (!mmget_not_zero(mm))
d2005e3f41d4f9 Oleg Nesterov       2016-05-20  1412  		goto out;
d2005e3f41d4f9 Oleg Nesterov       2016-05-20  1413  
d8ed45c5dcd455 Michel Lespinasse   2020-06-08  1414  	mmap_write_lock(mm);
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1415  	ret = -EINVAL;
11a9b90274f6a5 Liam R. Howlett     2023-01-20  1416  	vma_iter_init(&vmi, mm, start);
11a9b90274f6a5 Liam R. Howlett     2023-01-20  1417  	vma = vma_find(&vmi, end);
11a9b90274f6a5 Liam R. Howlett     2023-01-20  1418  	if (!vma)
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1419  		goto out_unlock;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1420  
cab350afcbc9c8 Mike Kravetz        2017-02-22  1421  	/*
cab350afcbc9c8 Mike Kravetz        2017-02-22  1422  	 * If the first vma contains huge pages, make sure start address
cab350afcbc9c8 Mike Kravetz        2017-02-22  1423  	 * is aligned to huge page size.
cab350afcbc9c8 Mike Kravetz        2017-02-22  1424  	 */
cab350afcbc9c8 Mike Kravetz        2017-02-22  1425  	if (is_vm_hugetlb_page(vma)) {
cab350afcbc9c8 Mike Kravetz        2017-02-22  1426  		unsigned long vma_hpagesize = vma_kernel_pagesize(vma);
cab350afcbc9c8 Mike Kravetz        2017-02-22  1427  
cab350afcbc9c8 Mike Kravetz        2017-02-22  1428  		if (start & (vma_hpagesize - 1))
cab350afcbc9c8 Mike Kravetz        2017-02-22  1429  			goto out_unlock;
cab350afcbc9c8 Mike Kravetz        2017-02-22  1430  	}
cab350afcbc9c8 Mike Kravetz        2017-02-22  1431  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1432  	/*
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1433  	 * Search for not compatible vmas.
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1434  	 */
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1435  	found = false;
11a9b90274f6a5 Liam R. Howlett     2023-01-20  1436  	cur = vma;
11a9b90274f6a5 Liam R. Howlett     2023-01-20  1437  	do {
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1438  		cond_resched();
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1439  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1440  		BUG_ON(!!cur->vm_userfaultfd_ctx.ctx ^
7677f7fd8be766 Axel Rasmussen      2021-05-04  1441  		       !!(cur->vm_flags & __VM_UFFD_FLAGS));
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1442  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1443  		/*
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1444  		 * Check not compatible vmas, not strictly required
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1445  		 * here as not compatible vmas cannot have an
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1446  		 * userfaultfd_ctx registered on them, but this
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1447  		 * provides for more strict behavior to notice
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1448  		 * unregistration errors.
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1449  		 */
d61ea1cb009532 Peter Xu            2023-08-21  1450  		if (!vma_can_userfault(cur, cur->vm_flags, wp_async))
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1451  			goto out_unlock;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1452  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1453  		found = true;
11a9b90274f6a5 Liam R. Howlett     2023-01-20  1454  	} for_each_vma_range(vmi, cur, end);
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1455  	BUG_ON(!found);
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1456  
11a9b90274f6a5 Liam R. Howlett     2023-01-20  1457  	vma_iter_set(&vmi, start);
11a9b90274f6a5 Liam R. Howlett     2023-01-20  1458  	prev = vma_prev(&vmi);
270aa010620697 Peter Xu            2023-05-17  1459  	if (vma->vm_start < start)
270aa010620697 Peter Xu            2023-05-17  1460  		prev = vma;
270aa010620697 Peter Xu            2023-05-17  1461  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1462  	ret = 0;
11a9b90274f6a5 Liam R. Howlett     2023-01-20  1463  	for_each_vma_range(vmi, vma, end) {
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1464  		cond_resched();
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1465  
d61ea1cb009532 Peter Xu            2023-08-21  1466  		BUG_ON(!vma_can_userfault(vma, vma->vm_flags, wp_async));
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1467  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1468  		/*
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1469  		 * Nothing to do: this vma is already registered into this
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1470  		 * userfaultfd and with the right tracking mode too.
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1471  		 */
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1472  		if (!vma->vm_userfaultfd_ctx.ctx)
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1473  			goto skip;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1474  
01e881f5a1fca4 Andrea Arcangeli    2018-12-14  1475  		WARN_ON(!(vma->vm_flags & VM_MAYWRITE));
01e881f5a1fca4 Andrea Arcangeli    2018-12-14  1476  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1477  		if (vma->vm_start > start)
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1478  			start = vma->vm_start;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04 @1479  		vma_end = min(end, vma->vm_end);
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1480  
09fa5296a40d01 Andrea Arcangeli    2017-02-22  1481  		if (userfaultfd_missing(vma)) {
09fa5296a40d01 Andrea Arcangeli    2017-02-22  1482  			/*
09fa5296a40d01 Andrea Arcangeli    2017-02-22  1483  			 * Wake any concurrent pending userfault while
09fa5296a40d01 Andrea Arcangeli    2017-02-22  1484  			 * we unregister, so they will not hang
09fa5296a40d01 Andrea Arcangeli    2017-02-22  1485  			 * permanently and it avoids userland to call
09fa5296a40d01 Andrea Arcangeli    2017-02-22  1486  			 * UFFDIO_WAKE explicitly.
09fa5296a40d01 Andrea Arcangeli    2017-02-22  1487  			 */
09fa5296a40d01 Andrea Arcangeli    2017-02-22  1488  			struct userfaultfd_wake_range range;
09fa5296a40d01 Andrea Arcangeli    2017-02-22  1489  			range.start = start;
09fa5296a40d01 Andrea Arcangeli    2017-02-22  1490  			range.len = vma_end - start;
09fa5296a40d01 Andrea Arcangeli    2017-02-22  1491  			wake_userfault(vma->vm_userfaultfd_ctx.ctx, &range);
09fa5296a40d01 Andrea Arcangeli    2017-02-22  1492  		}
09fa5296a40d01 Andrea Arcangeli    2017-02-22  1493  
a17c7d8fd2b097 Lorenzo Stoakes     2024-07-29  1494  		vma = userfaultfd_clear_vma(&vmi, prev, vma,
a17c7d8fd2b097 Lorenzo Stoakes     2024-07-29  1495  					    start, vma_end);
94d7d923395129 Lorenzo Stoakes     2023-10-11  1496  		if (IS_ERR(vma)) {
94d7d923395129 Lorenzo Stoakes     2023-10-11  1497  			ret = PTR_ERR(vma);
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1498  			break;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1499  		}
94d7d923395129 Lorenzo Stoakes     2023-10-11  1500  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1501  	skip:
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1502  		prev = vma;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1503  		start = vma->vm_end;
11a9b90274f6a5 Liam R. Howlett     2023-01-20  1504  	}
11a9b90274f6a5 Liam R. Howlett     2023-01-20  1505  
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1506  out_unlock:
d8ed45c5dcd455 Michel Lespinasse   2020-06-08  1507  	mmap_write_unlock(mm);
d2005e3f41d4f9 Oleg Nesterov       2016-05-20  1508  	mmput(mm);
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1509  out:
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1510  	return ret;
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1511  }
86039bd3b4e6a1 Andrea Arcangeli    2015-09-04  1512  

:::::: The code at line 1479 was first introduced by commit
:::::: 86039bd3b4e6a1129318cbfed4e0a6e001656635 userfaultfd: add new syscall to provide memory externalization

:::::: TO: Andrea Arcangeli <aarcange@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
