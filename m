Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAAF749C
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Mar 2025 02:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743040820; cv=none; b=ohYaIkVTdk1yQNIWyIhRXCMOplNqkmOxddYoHvq8khufwr9kC8Xg1AZvhVh9FPueN+xNmkCfje4mMIx7TqvZgfOa07x+sKi64E1yR4puz8zNXCSe33HKVbPNWdnpCw9Lo/zc5n4zjI12GG3Cu/MpauEq0TU7IaIA/7Wo+5hLO5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743040820; c=relaxed/simple;
	bh=VOzJdh+ZFmpP17WaeJR8BT2aEE1tuLO8ejTGpw0CvsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QzPXEGFiCs7aPn7JQepWfZWekQtrQJVTODxWSyPzPJZIF+ud/tIbAxGB2YSHF/Jt7nAi3JxN/vROE8u+H3OfnA2jUXENz+C0HS21cuXasWTeRo4cBu4XRH21ZTJdH2X8cJkrd5dBirvx4buzEicg1WC9hFdx4qJZ5B7EgI7u4Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KFV5Zz+q; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KFV5Zz+q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743040817; x=1774576817;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VOzJdh+ZFmpP17WaeJR8BT2aEE1tuLO8ejTGpw0CvsQ=;
  b=KFV5Zz+q0PUFSIosUHdFKQP3eq4OuHLRTBUL1MAexjAcjX23LiROaOZk
   N88tIlVQjGTDdoKQglpwEMD5MGZhnNP6xqKCPSjDucou8wTkpl8bMkFli
   QAzmaMFwFdsiJ5jouL9jFEWA3UAV/AkjRzFnrnvrLIcWgAQ0ewZjrZKkA
   K2jaB0CLsRTg/uvm62L3EurS/C857mog1COOqzDE1ZhNIU8vbo6ssHttx
   94iGYJWYd/xVohK9QrnKAJMUfwIzF2DIBluUWy/kjHkuVy28eX1lmdp4A
   Ij+pHNpeUDIXR7CzcCZcwsj1CfjHVovQdVfJ/DdqZD6PUloJO8Xvn65Ns
   g==;
X-CSE-ConnectionGUID: HiiZc5KHRWWAndAlvK9xxg==
X-CSE-MsgGUID: mnaNPPTFRKaw65HvBZ3doA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48008791"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="48008791"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 19:00:17 -0700
X-CSE-ConnectionGUID: DTZJziskQJ258Dz5+ByCRA==
X-CSE-MsgGUID: Bv8Q3rL3RjuzP4d6vikgdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="125931181"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 26 Mar 2025 19:00:15 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txcX1-0006HL-15;
	Thu, 27 Mar 2025 01:59:51 +0000
Date: Thu, 27 Mar 2025 09:59:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in
 copy_page_range()
Message-ID: <202503270941.IFILyNCX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250325191951.471185-1-david@redhat.com>
References: <20250325191951.471185-1-david@redhat.com>
TO: David Hildenbrand <david@redhat.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 38fec10eb60d687e30c8c6b5420d86e8149f7557]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Hildenbrand/x86-mm-pat-Fix-VM_PAT-handling-when-fork-fails-in-copy_page_range/20250326-032200
base:   38fec10eb60d687e30c8c6b5420d86e8149f7557
patch link:    https://lore.kernel.org/r/20250325191951.471185-1-david%40redhat.com
patch subject: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in copy_page_range()
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: hexagon-randconfig-r073-20250327 (https://download.01.org/0day-ci/archive/20250327/202503270941.IFILyNCX-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503270941.IFILyNCX-lkp@intel.com/

smatch warnings:
mm/memory.c:1428 copy_page_range() error: uninitialized symbol 'pfn'.

vim +/pfn +1428 mm/memory.c

c56d1b62cce836 Peter Xu                      2022-05-12  1360  
c78f463649d60f Peter Xu                      2020-10-13  1361  int
c78f463649d60f Peter Xu                      2020-10-13  1362  copy_page_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
^1da177e4c3f41 Linus Torvalds                2005-04-16  1363  {
^1da177e4c3f41 Linus Torvalds                2005-04-16  1364  	pgd_t *src_pgd, *dst_pgd;
c78f463649d60f Peter Xu                      2020-10-13  1365  	unsigned long addr = src_vma->vm_start;
c78f463649d60f Peter Xu                      2020-10-13  1366  	unsigned long end = src_vma->vm_end;
c78f463649d60f Peter Xu                      2020-10-13  1367  	struct mm_struct *dst_mm = dst_vma->vm_mm;
c78f463649d60f Peter Xu                      2020-10-13  1368  	struct mm_struct *src_mm = src_vma->vm_mm;
ac46d4f3c43241 Jérôme Glisse                 2018-12-28  1369  	struct mmu_notifier_range range;
ebd5c0670e88d9 David Hildenbrand             2025-03-25  1370  	unsigned long next, pfn;
2ec74c3ef2d8c5 Sagi Grimberg                 2012-10-08  1371  	bool is_cow;
cddb8a5c14aa89 Andrea Arcangeli              2008-07-28  1372  	int ret;
^1da177e4c3f41 Linus Torvalds                2005-04-16  1373  
c56d1b62cce836 Peter Xu                      2022-05-12  1374  	if (!vma_needs_copy(dst_vma, src_vma))
d992895ba2b27c Nicholas Piggin               2005-08-28  1375  		return 0;
d992895ba2b27c Nicholas Piggin               2005-08-28  1376  
c78f463649d60f Peter Xu                      2020-10-13  1377  	if (is_vm_hugetlb_page(src_vma))
bc70fbf269fdff Peter Xu                      2022-05-12  1378  		return copy_hugetlb_page_range(dst_mm, src_mm, dst_vma, src_vma);
^1da177e4c3f41 Linus Torvalds                2005-04-16  1379  
c78f463649d60f Peter Xu                      2020-10-13  1380  	if (unlikely(src_vma->vm_flags & VM_PFNMAP)) {
ebd5c0670e88d9 David Hildenbrand             2025-03-25  1381  		ret = track_pfn_copy(dst_vma, src_vma, &pfn);
2ab640379a0ab4 venkatesh.pallipadi@intel.com 2008-12-18  1382  		if (ret)
2ab640379a0ab4 venkatesh.pallipadi@intel.com 2008-12-18  1383  			return ret;
2ab640379a0ab4 venkatesh.pallipadi@intel.com 2008-12-18  1384  	}
2ab640379a0ab4 venkatesh.pallipadi@intel.com 2008-12-18  1385  
cddb8a5c14aa89 Andrea Arcangeli              2008-07-28  1386  	/*
cddb8a5c14aa89 Andrea Arcangeli              2008-07-28  1387  	 * We need to invalidate the secondary MMU mappings only when
cddb8a5c14aa89 Andrea Arcangeli              2008-07-28  1388  	 * there could be a permission downgrade on the ptes of the
cddb8a5c14aa89 Andrea Arcangeli              2008-07-28  1389  	 * parent mm. And a permission downgrade will only happen if
cddb8a5c14aa89 Andrea Arcangeli              2008-07-28  1390  	 * is_cow_mapping() returns true.
cddb8a5c14aa89 Andrea Arcangeli              2008-07-28  1391  	 */
c78f463649d60f Peter Xu                      2020-10-13  1392  	is_cow = is_cow_mapping(src_vma->vm_flags);
ac46d4f3c43241 Jérôme Glisse                 2018-12-28  1393  
ac46d4f3c43241 Jérôme Glisse                 2018-12-28  1394  	if (is_cow) {
7269f999934b28 Jérôme Glisse                 2019-05-13  1395  		mmu_notifier_range_init(&range, MMU_NOTIFY_PROTECTION_PAGE,
7d4a8be0c4b2b7 Alistair Popple               2023-01-10  1396  					0, src_mm, addr, end);
ac46d4f3c43241 Jérôme Glisse                 2018-12-28  1397  		mmu_notifier_invalidate_range_start(&range);
57efa1fe595769 Jason Gunthorpe               2020-12-14  1398  		/*
57efa1fe595769 Jason Gunthorpe               2020-12-14  1399  		 * Disabling preemption is not needed for the write side, as
57efa1fe595769 Jason Gunthorpe               2020-12-14  1400  		 * the read side doesn't spin, but goes to the mmap_lock.
57efa1fe595769 Jason Gunthorpe               2020-12-14  1401  		 *
57efa1fe595769 Jason Gunthorpe               2020-12-14  1402  		 * Use the raw variant of the seqcount_t write API to avoid
57efa1fe595769 Jason Gunthorpe               2020-12-14  1403  		 * lockdep complaining about preemptibility.
57efa1fe595769 Jason Gunthorpe               2020-12-14  1404  		 */
e727bfd5e73a35 Suren Baghdasaryan            2023-08-04  1405  		vma_assert_write_locked(src_vma);
57efa1fe595769 Jason Gunthorpe               2020-12-14  1406  		raw_write_seqcount_begin(&src_mm->write_protect_seq);
ac46d4f3c43241 Jérôme Glisse                 2018-12-28  1407  	}
cddb8a5c14aa89 Andrea Arcangeli              2008-07-28  1408  
cddb8a5c14aa89 Andrea Arcangeli              2008-07-28  1409  	ret = 0;
^1da177e4c3f41 Linus Torvalds                2005-04-16  1410  	dst_pgd = pgd_offset(dst_mm, addr);
^1da177e4c3f41 Linus Torvalds                2005-04-16  1411  	src_pgd = pgd_offset(src_mm, addr);
^1da177e4c3f41 Linus Torvalds                2005-04-16  1412  	do {
^1da177e4c3f41 Linus Torvalds                2005-04-16  1413  		next = pgd_addr_end(addr, end);
^1da177e4c3f41 Linus Torvalds                2005-04-16  1414  		if (pgd_none_or_clear_bad(src_pgd))
^1da177e4c3f41 Linus Torvalds                2005-04-16  1415  			continue;
c78f463649d60f Peter Xu                      2020-10-13  1416  		if (unlikely(copy_p4d_range(dst_vma, src_vma, dst_pgd, src_pgd,
c78f463649d60f Peter Xu                      2020-10-13  1417  					    addr, next))) {
cddb8a5c14aa89 Andrea Arcangeli              2008-07-28  1418  			ret = -ENOMEM;
cddb8a5c14aa89 Andrea Arcangeli              2008-07-28  1419  			break;
cddb8a5c14aa89 Andrea Arcangeli              2008-07-28  1420  		}
^1da177e4c3f41 Linus Torvalds                2005-04-16  1421  	} while (dst_pgd++, src_pgd++, addr = next, addr != end);
cddb8a5c14aa89 Andrea Arcangeli              2008-07-28  1422  
57efa1fe595769 Jason Gunthorpe               2020-12-14  1423  	if (is_cow) {
57efa1fe595769 Jason Gunthorpe               2020-12-14  1424  		raw_write_seqcount_end(&src_mm->write_protect_seq);
ac46d4f3c43241 Jérôme Glisse                 2018-12-28  1425  		mmu_notifier_invalidate_range_end(&range);
57efa1fe595769 Jason Gunthorpe               2020-12-14  1426  	}
ebd5c0670e88d9 David Hildenbrand             2025-03-25  1427  	if (ret && unlikely(src_vma->vm_flags & VM_PFNMAP))
ebd5c0670e88d9 David Hildenbrand             2025-03-25 @1428  		untrack_pfn_copy(dst_vma, pfn);
cddb8a5c14aa89 Andrea Arcangeli              2008-07-28  1429  	return ret;
^1da177e4c3f41 Linus Torvalds                2005-04-16  1430  }
^1da177e4c3f41 Linus Torvalds                2005-04-16  1431  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
