Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96B9190498
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 22:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754605527; cv=none; b=FiCL1Hw6Mz1xVb80MchATC/alZqFbzihedFQtXoOoYRPKWlfquNg7z/+WEnU/ucEXiPn06s1rFe/bn92cN6Jr+F8Z/bheN1e3vraAYLsWNVM/YCIlqk6f8hUk6uQh1/yUGIm7yFuCNH6jRavdyP+LSGZ5tF0pNR0teuuKV7GmV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754605527; c=relaxed/simple;
	bh=/Vz73nZEGa+eRXL1E447oqgTm/Ts3QVACrmh/OZ8bao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H7sZsgZAfIaJ3KASPRIGNE+6MqFQ1gXertVhdS/ptZ+N8L7ZoHWRDNn+VbMf01qAr5x9mTV8oYqHuYqir8hfS7TCN1/Fscm1Fsi+jR6DPO5ATPCbfXht6soGDAMuz8BM7asuedvKelYkIKoAvDT4NDNjh8CS+2dITipmUWHPMiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lQWPKvJj; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQWPKvJj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754605525; x=1786141525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Vz73nZEGa+eRXL1E447oqgTm/Ts3QVACrmh/OZ8bao=;
  b=lQWPKvJjEFInvdJecY84zmqLFdELmp+p6asVf6SD0WPfC7H1kshonSFk
   CWsh8KXaRS6bEjFf9SL4UehY+goY/eYEr/VTRVvpew0baumjS5ifsB57b
   3sIQXrjHRjJNUKCQFNDzCdJVdJSClC5mt92erJ3j4usdXS2lwm5mOfwGj
   hlXXUOhxecQYKQfpjCXhZn6xHG2XdDFhW0lGSQEF6X1jUjY78caInxo+u
   oF+L5JEFsVIwWJd3eDl8Pnm5E3s6r5MnbUvJcOK7L1WCpqWwbxMlPX6ZH
   V7W0WBrPwzVchnIadDgvn2sj9ZJCj+uCjUdV3692oE/yP5xoi8CHsGsY7
   g==;
X-CSE-ConnectionGUID: pWvNzdHOR6KrlxCYVtuKGg==
X-CSE-MsgGUID: tEYUrNgLSoOmC3p5W1KPSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="57086445"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="57086445"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 15:25:24 -0700
X-CSE-ConnectionGUID: TtlAII6oSqSrxxkDnXLalg==
X-CSE-MsgGUID: V7b9q4/CR3GMKuAkYye+Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="196172784"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 07 Aug 2025 15:25:23 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk932-0003JW-0r;
	Thu, 07 Aug 2025 22:25:20 +0000
Date: Fri, 8 Aug 2025 06:24:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3] userfaultfd: opportunistic TLB-flush batching for
 present pages in MOVE
Message-ID: <202508080639.Cf7SyRwQ-lkp@intel.com>
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
In-Reply-To: <20250807103902.2242717-1-lokeshgidra@google.com>
References: <20250807103902.2242717-1-lokeshgidra@google.com>
TO: Lokesh Gidra <lokeshgidra@google.com>

Hi Lokesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6e64f4580381e32c06ee146ca807c555b8f73e24]

url:    https://github.com/intel-lab-lkp/linux/commits/Lokesh-Gidra/userfaultfd-opportunistic-TLB-flush-batching-for-present-pages-in-MOVE/20250807-184025
base:   6e64f4580381e32c06ee146ca807c555b8f73e24
patch link:    https://lore.kernel.org/r/20250807103902.2242717-1-lokeshgidra%40google.com
patch subject: [PATCH v3] userfaultfd: opportunistic TLB-flush batching for present pages in MOVE
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: openrisc-randconfig-r071-20250808 (https://download.01.org/0day-ci/archive/20250808/202508080639.Cf7SyRwQ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508080639.Cf7SyRwQ-lkp@intel.com/

smatch warnings:
mm/userfaultfd.c:1959 move_pages() error: uninitialized symbol 'step_size'.

vim +/step_size +1959 mm/userfaultfd.c

adef440691bab82 Andrea Arcangeli        2023-12-06  1725  
adef440691bab82 Andrea Arcangeli        2023-12-06  1726  /**
adef440691bab82 Andrea Arcangeli        2023-12-06  1727   * move_pages - move arbitrary anonymous pages of an existing vma
adef440691bab82 Andrea Arcangeli        2023-12-06  1728   * @ctx: pointer to the userfaultfd context
adef440691bab82 Andrea Arcangeli        2023-12-06  1729   * @dst_start: start of the destination virtual memory range
adef440691bab82 Andrea Arcangeli        2023-12-06  1730   * @src_start: start of the source virtual memory range
adef440691bab82 Andrea Arcangeli        2023-12-06  1731   * @len: length of the virtual memory range
adef440691bab82 Andrea Arcangeli        2023-12-06  1732   * @mode: flags from uffdio_move.mode
adef440691bab82 Andrea Arcangeli        2023-12-06  1733   *
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1734   * It will either use the mmap_lock in read mode or per-vma locks
adef440691bab82 Andrea Arcangeli        2023-12-06  1735   *
adef440691bab82 Andrea Arcangeli        2023-12-06  1736   * move_pages() remaps arbitrary anonymous pages atomically in zero
adef440691bab82 Andrea Arcangeli        2023-12-06  1737   * copy. It only works on non shared anonymous pages because those can
adef440691bab82 Andrea Arcangeli        2023-12-06  1738   * be relocated without generating non linear anon_vmas in the rmap
adef440691bab82 Andrea Arcangeli        2023-12-06  1739   * code.
adef440691bab82 Andrea Arcangeli        2023-12-06  1740   *
adef440691bab82 Andrea Arcangeli        2023-12-06  1741   * It provides a zero copy mechanism to handle userspace page faults.
adef440691bab82 Andrea Arcangeli        2023-12-06  1742   * The source vma pages should have mapcount == 1, which can be
adef440691bab82 Andrea Arcangeli        2023-12-06  1743   * enforced by using madvise(MADV_DONTFORK) on src vma.
adef440691bab82 Andrea Arcangeli        2023-12-06  1744   *
adef440691bab82 Andrea Arcangeli        2023-12-06  1745   * The thread receiving the page during the userland page fault
adef440691bab82 Andrea Arcangeli        2023-12-06  1746   * will receive the faulting page in the source vma through the network,
adef440691bab82 Andrea Arcangeli        2023-12-06  1747   * storage or any other I/O device (MADV_DONTFORK in the source vma
adef440691bab82 Andrea Arcangeli        2023-12-06  1748   * avoids move_pages() to fail with -EBUSY if the process forks before
adef440691bab82 Andrea Arcangeli        2023-12-06  1749   * move_pages() is called), then it will call move_pages() to map the
adef440691bab82 Andrea Arcangeli        2023-12-06  1750   * page in the faulting address in the destination vma.
adef440691bab82 Andrea Arcangeli        2023-12-06  1751   *
adef440691bab82 Andrea Arcangeli        2023-12-06  1752   * This userfaultfd command works purely via pagetables, so it's the
adef440691bab82 Andrea Arcangeli        2023-12-06  1753   * most efficient way to move physical non shared anonymous pages
adef440691bab82 Andrea Arcangeli        2023-12-06  1754   * across different virtual addresses. Unlike mremap()/mmap()/munmap()
adef440691bab82 Andrea Arcangeli        2023-12-06  1755   * it does not create any new vmas. The mapping in the destination
adef440691bab82 Andrea Arcangeli        2023-12-06  1756   * address is atomic.
adef440691bab82 Andrea Arcangeli        2023-12-06  1757   *
adef440691bab82 Andrea Arcangeli        2023-12-06  1758   * It only works if the vma protection bits are identical from the
adef440691bab82 Andrea Arcangeli        2023-12-06  1759   * source and destination vma.
adef440691bab82 Andrea Arcangeli        2023-12-06  1760   *
adef440691bab82 Andrea Arcangeli        2023-12-06  1761   * It can remap non shared anonymous pages within the same vma too.
adef440691bab82 Andrea Arcangeli        2023-12-06  1762   *
adef440691bab82 Andrea Arcangeli        2023-12-06  1763   * If the source virtual memory range has any unmapped holes, or if
adef440691bab82 Andrea Arcangeli        2023-12-06  1764   * the destination virtual memory range is not a whole unmapped hole,
adef440691bab82 Andrea Arcangeli        2023-12-06  1765   * move_pages() will fail respectively with -ENOENT or -EEXIST. This
adef440691bab82 Andrea Arcangeli        2023-12-06  1766   * provides a very strict behavior to avoid any chance of memory
adef440691bab82 Andrea Arcangeli        2023-12-06  1767   * corruption going unnoticed if there are userland race conditions.
adef440691bab82 Andrea Arcangeli        2023-12-06  1768   * Only one thread should resolve the userland page fault at any given
adef440691bab82 Andrea Arcangeli        2023-12-06  1769   * time for any given faulting address. This means that if two threads
adef440691bab82 Andrea Arcangeli        2023-12-06  1770   * try to both call move_pages() on the same destination address at the
adef440691bab82 Andrea Arcangeli        2023-12-06  1771   * same time, the second thread will get an explicit error from this
adef440691bab82 Andrea Arcangeli        2023-12-06  1772   * command.
adef440691bab82 Andrea Arcangeli        2023-12-06  1773   *
adef440691bab82 Andrea Arcangeli        2023-12-06  1774   * The command retval will return "len" is successful. The command
adef440691bab82 Andrea Arcangeli        2023-12-06  1775   * however can be interrupted by fatal signals or errors. If
adef440691bab82 Andrea Arcangeli        2023-12-06  1776   * interrupted it will return the number of bytes successfully
adef440691bab82 Andrea Arcangeli        2023-12-06  1777   * remapped before the interruption if any, or the negative error if
adef440691bab82 Andrea Arcangeli        2023-12-06  1778   * none. It will never return zero. Either it will return an error or
adef440691bab82 Andrea Arcangeli        2023-12-06  1779   * an amount of bytes successfully moved. If the retval reports a
adef440691bab82 Andrea Arcangeli        2023-12-06  1780   * "short" remap, the move_pages() command should be repeated by
adef440691bab82 Andrea Arcangeli        2023-12-06  1781   * userland with src+retval, dst+reval, len-retval if it wants to know
adef440691bab82 Andrea Arcangeli        2023-12-06  1782   * about the error that interrupted it.
adef440691bab82 Andrea Arcangeli        2023-12-06  1783   *
adef440691bab82 Andrea Arcangeli        2023-12-06  1784   * The UFFDIO_MOVE_MODE_ALLOW_SRC_HOLES flag can be specified to
adef440691bab82 Andrea Arcangeli        2023-12-06  1785   * prevent -ENOENT errors to materialize if there are holes in the
adef440691bab82 Andrea Arcangeli        2023-12-06  1786   * source virtual range that is being remapped. The holes will be
adef440691bab82 Andrea Arcangeli        2023-12-06  1787   * accounted as successfully remapped in the retval of the
adef440691bab82 Andrea Arcangeli        2023-12-06  1788   * command. This is mostly useful to remap hugepage naturally aligned
adef440691bab82 Andrea Arcangeli        2023-12-06  1789   * virtual regions without knowing if there are transparent hugepage
adef440691bab82 Andrea Arcangeli        2023-12-06  1790   * in the regions or not, but preventing the risk of having to split
adef440691bab82 Andrea Arcangeli        2023-12-06  1791   * the hugepmd during the remap.
adef440691bab82 Andrea Arcangeli        2023-12-06  1792   *
adef440691bab82 Andrea Arcangeli        2023-12-06  1793   * If there's any rmap walk that is taking the anon_vma locks without
adef440691bab82 Andrea Arcangeli        2023-12-06  1794   * first obtaining the folio lock (the only current instance is
adef440691bab82 Andrea Arcangeli        2023-12-06  1795   * folio_referenced), they will have to verify if the folio->mapping
adef440691bab82 Andrea Arcangeli        2023-12-06  1796   * has changed after taking the anon_vma lock. If it changed they
adef440691bab82 Andrea Arcangeli        2023-12-06  1797   * should release the lock and retry obtaining a new anon_vma, because
adef440691bab82 Andrea Arcangeli        2023-12-06  1798   * it means the anon_vma was changed by move_pages() before the lock
adef440691bab82 Andrea Arcangeli        2023-12-06  1799   * could be obtained. This is the only additional complexity added to
adef440691bab82 Andrea Arcangeli        2023-12-06  1800   * the rmap code to provide this anonymous page remapping functionality.
adef440691bab82 Andrea Arcangeli        2023-12-06  1801   */
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1802  ssize_t move_pages(struct userfaultfd_ctx *ctx, unsigned long dst_start,
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1803  		   unsigned long src_start, unsigned long len, __u64 mode)
adef440691bab82 Andrea Arcangeli        2023-12-06  1804  {
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1805  	struct mm_struct *mm = ctx->mm;
adef440691bab82 Andrea Arcangeli        2023-12-06  1806  	struct vm_area_struct *src_vma, *dst_vma;
3abf06e0c484867 Lokesh Gidra            2025-08-07  1807  	unsigned long src_addr, dst_addr, src_end;
adef440691bab82 Andrea Arcangeli        2023-12-06  1808  	pmd_t *src_pmd, *dst_pmd;
adef440691bab82 Andrea Arcangeli        2023-12-06  1809  	long err = -EINVAL;
adef440691bab82 Andrea Arcangeli        2023-12-06  1810  	ssize_t moved = 0;
adef440691bab82 Andrea Arcangeli        2023-12-06  1811  
adef440691bab82 Andrea Arcangeli        2023-12-06  1812  	/* Sanitize the command parameters. */
31defc3b01d907e Tal Zussman             2025-06-19  1813  	VM_WARN_ON_ONCE(src_start & ~PAGE_MASK);
31defc3b01d907e Tal Zussman             2025-06-19  1814  	VM_WARN_ON_ONCE(dst_start & ~PAGE_MASK);
31defc3b01d907e Tal Zussman             2025-06-19  1815  	VM_WARN_ON_ONCE(len & ~PAGE_MASK);
adef440691bab82 Andrea Arcangeli        2023-12-06  1816  
adef440691bab82 Andrea Arcangeli        2023-12-06  1817  	/* Does the address range wrap, or is the span zero-sized? */
31defc3b01d907e Tal Zussman             2025-06-19  1818  	VM_WARN_ON_ONCE(src_start + len < src_start);
31defc3b01d907e Tal Zussman             2025-06-19  1819  	VM_WARN_ON_ONCE(dst_start + len < dst_start);
adef440691bab82 Andrea Arcangeli        2023-12-06  1820  
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1821  	err = uffd_move_lock(mm, dst_start, src_start, &dst_vma, &src_vma);
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1822  	if (err)
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1823  		goto out;
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1824  
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1825  	/* Re-check after taking map_changing_lock */
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1826  	err = -EAGAIN;
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1827  	down_read(&ctx->map_changing_lock);
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1828  	if (likely(atomic_read(&ctx->mmap_changing)))
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1829  		goto out_unlock;
adef440691bab82 Andrea Arcangeli        2023-12-06  1830  	/*
adef440691bab82 Andrea Arcangeli        2023-12-06  1831  	 * Make sure the vma is not shared, that the src and dst remap
adef440691bab82 Andrea Arcangeli        2023-12-06  1832  	 * ranges are both valid and fully within a single existing
adef440691bab82 Andrea Arcangeli        2023-12-06  1833  	 * vma.
adef440691bab82 Andrea Arcangeli        2023-12-06  1834  	 */
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1835  	err = -EINVAL;
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1836  	if (src_vma->vm_flags & VM_SHARED)
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1837  		goto out_unlock;
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1838  	if (src_start + len > src_vma->vm_end)
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1839  		goto out_unlock;
adef440691bab82 Andrea Arcangeli        2023-12-06  1840  
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1841  	if (dst_vma->vm_flags & VM_SHARED)
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1842  		goto out_unlock;
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1843  	if (dst_start + len > dst_vma->vm_end)
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1844  		goto out_unlock;
adef440691bab82 Andrea Arcangeli        2023-12-06  1845  
adef440691bab82 Andrea Arcangeli        2023-12-06  1846  	err = validate_move_areas(ctx, src_vma, dst_vma);
adef440691bab82 Andrea Arcangeli        2023-12-06  1847  	if (err)
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1848  		goto out_unlock;
adef440691bab82 Andrea Arcangeli        2023-12-06  1849  
3abf06e0c484867 Lokesh Gidra            2025-08-07  1850  	for (src_addr = src_start, dst_addr = dst_start, src_end = src_start + len;
3abf06e0c484867 Lokesh Gidra            2025-08-07  1851  	     src_addr < src_end;) {
adef440691bab82 Andrea Arcangeli        2023-12-06  1852  		spinlock_t *ptl;
adef440691bab82 Andrea Arcangeli        2023-12-06  1853  		pmd_t dst_pmdval;
adef440691bab82 Andrea Arcangeli        2023-12-06  1854  		unsigned long step_size;
adef440691bab82 Andrea Arcangeli        2023-12-06  1855  
adef440691bab82 Andrea Arcangeli        2023-12-06  1856  		/*
adef440691bab82 Andrea Arcangeli        2023-12-06  1857  		 * Below works because anonymous area would not have a
adef440691bab82 Andrea Arcangeli        2023-12-06  1858  		 * transparent huge PUD. If file-backed support is added,
adef440691bab82 Andrea Arcangeli        2023-12-06  1859  		 * that case would need to be handled here.
adef440691bab82 Andrea Arcangeli        2023-12-06  1860  		 */
adef440691bab82 Andrea Arcangeli        2023-12-06  1861  		src_pmd = mm_find_pmd(mm, src_addr);
adef440691bab82 Andrea Arcangeli        2023-12-06  1862  		if (unlikely(!src_pmd)) {
adef440691bab82 Andrea Arcangeli        2023-12-06  1863  			if (!(mode & UFFDIO_MOVE_MODE_ALLOW_SRC_HOLES)) {
adef440691bab82 Andrea Arcangeli        2023-12-06  1864  				err = -ENOENT;
adef440691bab82 Andrea Arcangeli        2023-12-06  1865  				break;
adef440691bab82 Andrea Arcangeli        2023-12-06  1866  			}
adef440691bab82 Andrea Arcangeli        2023-12-06  1867  			src_pmd = mm_alloc_pmd(mm, src_addr);
adef440691bab82 Andrea Arcangeli        2023-12-06  1868  			if (unlikely(!src_pmd)) {
adef440691bab82 Andrea Arcangeli        2023-12-06  1869  				err = -ENOMEM;
adef440691bab82 Andrea Arcangeli        2023-12-06  1870  				break;
adef440691bab82 Andrea Arcangeli        2023-12-06  1871  			}
adef440691bab82 Andrea Arcangeli        2023-12-06  1872  		}
adef440691bab82 Andrea Arcangeli        2023-12-06  1873  		dst_pmd = mm_alloc_pmd(mm, dst_addr);
adef440691bab82 Andrea Arcangeli        2023-12-06  1874  		if (unlikely(!dst_pmd)) {
adef440691bab82 Andrea Arcangeli        2023-12-06  1875  			err = -ENOMEM;
adef440691bab82 Andrea Arcangeli        2023-12-06  1876  			break;
adef440691bab82 Andrea Arcangeli        2023-12-06  1877  		}
adef440691bab82 Andrea Arcangeli        2023-12-06  1878  
adef440691bab82 Andrea Arcangeli        2023-12-06  1879  		dst_pmdval = pmdp_get_lockless(dst_pmd);
adef440691bab82 Andrea Arcangeli        2023-12-06  1880  		/*
adef440691bab82 Andrea Arcangeli        2023-12-06  1881  		 * If the dst_pmd is mapped as THP don't override it and just
adef440691bab82 Andrea Arcangeli        2023-12-06  1882  		 * be strict. If dst_pmd changes into TPH after this check, the
adef440691bab82 Andrea Arcangeli        2023-12-06  1883  		 * move_pages_huge_pmd() will detect the change and retry
adef440691bab82 Andrea Arcangeli        2023-12-06  1884  		 * while move_pages_pte() will detect the change and fail.
adef440691bab82 Andrea Arcangeli        2023-12-06  1885  		 */
adef440691bab82 Andrea Arcangeli        2023-12-06  1886  		if (unlikely(pmd_trans_huge(dst_pmdval))) {
adef440691bab82 Andrea Arcangeli        2023-12-06  1887  			err = -EEXIST;
adef440691bab82 Andrea Arcangeli        2023-12-06  1888  			break;
adef440691bab82 Andrea Arcangeli        2023-12-06  1889  		}
adef440691bab82 Andrea Arcangeli        2023-12-06  1890  
adef440691bab82 Andrea Arcangeli        2023-12-06  1891  		ptl = pmd_trans_huge_lock(src_pmd, src_vma);
adef440691bab82 Andrea Arcangeli        2023-12-06  1892  		if (ptl) {
adef440691bab82 Andrea Arcangeli        2023-12-06  1893  			/* Check if we can move the pmd without splitting it. */
adef440691bab82 Andrea Arcangeli        2023-12-06  1894  			if (move_splits_huge_pmd(dst_addr, src_addr, src_start + len) ||
adef440691bab82 Andrea Arcangeli        2023-12-06  1895  			    !pmd_none(dst_pmdval)) {
e06d03d5590ae1c Matthew Wilcox (Oracle  2024-03-26  1896) 				struct folio *folio = pmd_folio(*src_pmd);
adef440691bab82 Andrea Arcangeli        2023-12-06  1897  
5beaee54a324ba1 Matthew Wilcox (Oracle  2024-03-26  1898) 				if (!folio || (!is_huge_zero_folio(folio) &&
eb1521dad8f391d Suren Baghdasaryan      2024-01-31  1899  					       !PageAnonExclusive(&folio->page))) {
adef440691bab82 Andrea Arcangeli        2023-12-06  1900  					spin_unlock(ptl);
adef440691bab82 Andrea Arcangeli        2023-12-06  1901  					err = -EBUSY;
adef440691bab82 Andrea Arcangeli        2023-12-06  1902  					break;
adef440691bab82 Andrea Arcangeli        2023-12-06  1903  				}
adef440691bab82 Andrea Arcangeli        2023-12-06  1904  
adef440691bab82 Andrea Arcangeli        2023-12-06  1905  				spin_unlock(ptl);
adef440691bab82 Andrea Arcangeli        2023-12-06  1906  				split_huge_pmd(src_vma, src_pmd, src_addr);
adef440691bab82 Andrea Arcangeli        2023-12-06  1907  				/* The folio will be split by move_pages_pte() */
adef440691bab82 Andrea Arcangeli        2023-12-06  1908  				continue;
adef440691bab82 Andrea Arcangeli        2023-12-06  1909  			}
adef440691bab82 Andrea Arcangeli        2023-12-06  1910  
adef440691bab82 Andrea Arcangeli        2023-12-06  1911  			err = move_pages_huge_pmd(mm, dst_pmd, src_pmd,
adef440691bab82 Andrea Arcangeli        2023-12-06  1912  						  dst_pmdval, dst_vma, src_vma,
adef440691bab82 Andrea Arcangeli        2023-12-06  1913  						  dst_addr, src_addr);
adef440691bab82 Andrea Arcangeli        2023-12-06  1914  			step_size = HPAGE_PMD_SIZE;
adef440691bab82 Andrea Arcangeli        2023-12-06  1915  		} else {
3abf06e0c484867 Lokesh Gidra            2025-08-07  1916  			long ret;
3abf06e0c484867 Lokesh Gidra            2025-08-07  1917  
adef440691bab82 Andrea Arcangeli        2023-12-06  1918  			if (pmd_none(*src_pmd)) {
adef440691bab82 Andrea Arcangeli        2023-12-06  1919  				if (!(mode & UFFDIO_MOVE_MODE_ALLOW_SRC_HOLES)) {
adef440691bab82 Andrea Arcangeli        2023-12-06  1920  					err = -ENOENT;
adef440691bab82 Andrea Arcangeli        2023-12-06  1921  					break;
adef440691bab82 Andrea Arcangeli        2023-12-06  1922  				}
adef440691bab82 Andrea Arcangeli        2023-12-06  1923  				if (unlikely(__pte_alloc(mm, src_pmd))) {
adef440691bab82 Andrea Arcangeli        2023-12-06  1924  					err = -ENOMEM;
adef440691bab82 Andrea Arcangeli        2023-12-06  1925  					break;
adef440691bab82 Andrea Arcangeli        2023-12-06  1926  				}
adef440691bab82 Andrea Arcangeli        2023-12-06  1927  			}
adef440691bab82 Andrea Arcangeli        2023-12-06  1928  
adef440691bab82 Andrea Arcangeli        2023-12-06  1929  			if (unlikely(pte_alloc(mm, dst_pmd))) {
adef440691bab82 Andrea Arcangeli        2023-12-06  1930  				err = -ENOMEM;
adef440691bab82 Andrea Arcangeli        2023-12-06  1931  				break;
adef440691bab82 Andrea Arcangeli        2023-12-06  1932  			}
adef440691bab82 Andrea Arcangeli        2023-12-06  1933  
3abf06e0c484867 Lokesh Gidra            2025-08-07  1934  			ret = move_pages_ptes(mm, dst_pmd, src_pmd,
3abf06e0c484867 Lokesh Gidra            2025-08-07  1935  					      dst_vma, src_vma, dst_addr,
3abf06e0c484867 Lokesh Gidra            2025-08-07  1936  					      src_addr, src_end - src_addr, mode);
3abf06e0c484867 Lokesh Gidra            2025-08-07  1937  			if (ret > 0)
3abf06e0c484867 Lokesh Gidra            2025-08-07  1938  				step_size = ret;
3abf06e0c484867 Lokesh Gidra            2025-08-07  1939  			else
3abf06e0c484867 Lokesh Gidra            2025-08-07  1940  				err = ret;
adef440691bab82 Andrea Arcangeli        2023-12-06  1941  		}
adef440691bab82 Andrea Arcangeli        2023-12-06  1942  
adef440691bab82 Andrea Arcangeli        2023-12-06  1943  		cond_resched();
adef440691bab82 Andrea Arcangeli        2023-12-06  1944  
adef440691bab82 Andrea Arcangeli        2023-12-06  1945  		if (fatal_signal_pending(current)) {
adef440691bab82 Andrea Arcangeli        2023-12-06  1946  			/* Do not override an error */
adef440691bab82 Andrea Arcangeli        2023-12-06  1947  			if (!err || err == -EAGAIN)
adef440691bab82 Andrea Arcangeli        2023-12-06  1948  				err = -EINTR;
adef440691bab82 Andrea Arcangeli        2023-12-06  1949  			break;
adef440691bab82 Andrea Arcangeli        2023-12-06  1950  		}
adef440691bab82 Andrea Arcangeli        2023-12-06  1951  
adef440691bab82 Andrea Arcangeli        2023-12-06  1952  		if (err) {
adef440691bab82 Andrea Arcangeli        2023-12-06  1953  			if (err == -EAGAIN)
adef440691bab82 Andrea Arcangeli        2023-12-06  1954  				continue;
adef440691bab82 Andrea Arcangeli        2023-12-06  1955  			break;
adef440691bab82 Andrea Arcangeli        2023-12-06  1956  		}
adef440691bab82 Andrea Arcangeli        2023-12-06  1957  
adef440691bab82 Andrea Arcangeli        2023-12-06  1958  		/* Proceed to the next page */
adef440691bab82 Andrea Arcangeli        2023-12-06 @1959  		dst_addr += step_size;
adef440691bab82 Andrea Arcangeli        2023-12-06  1960  		src_addr += step_size;
adef440691bab82 Andrea Arcangeli        2023-12-06  1961  		moved += step_size;
adef440691bab82 Andrea Arcangeli        2023-12-06  1962  	}
adef440691bab82 Andrea Arcangeli        2023-12-06  1963  
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1964  out_unlock:
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1965  	up_read(&ctx->map_changing_lock);
867a43a34ff8a38 Lokesh Gidra            2024-02-15  1966  	uffd_move_unlock(dst_vma, src_vma);
adef440691bab82 Andrea Arcangeli        2023-12-06  1967  out:
31defc3b01d907e Tal Zussman             2025-06-19  1968  	VM_WARN_ON_ONCE(moved < 0);
31defc3b01d907e Tal Zussman             2025-06-19  1969  	VM_WARN_ON_ONCE(err > 0);
31defc3b01d907e Tal Zussman             2025-06-19  1970  	VM_WARN_ON_ONCE(!moved && !err);
adef440691bab82 Andrea Arcangeli        2023-12-06  1971  	return moved ? moved : err;
adef440691bab82 Andrea Arcangeli        2023-12-06  1972  }
a17c7d8fd2b097a Lorenzo Stoakes         2024-07-29  1973  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
