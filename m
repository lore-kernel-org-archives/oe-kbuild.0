Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F761B3939
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Jul 2025 20:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752265757; cv=none; b=JPTr+xSeALiI7Ogon+5ohcW6c5F05LMQTKfkbVNULTiUvlFhMeOBqYCdfQ5fh5fUoqakF752qHM75a7CR/N0ZX0ryMlXmSv9nNlBeSRtkvVvitoMatMbtaN2LnsGA4y+/bPjfOt7w7h/xW2BkB2SEynHvw42X/yDWvPhI9Mkq/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752265757; c=relaxed/simple;
	bh=tNVC9KLVJ/AmTJ1m2eTfsbE9eFyyM37iSMVI3Aa4TZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hs1E9znVZLd5IyLLBeJ8QmCUNlhnEz19sTJxoMgZ2Cziys2wGWVFnnxJuiuuH8VdLrSNfWK6DPldBYoxlRAcwvaqFl+LvgUbshfEUo099XLw0w3gZv/S1JzuwVtG5+UVbeznsHTU8hVPbIIcV6E/4L6s0RD1wIKT4vdj0EpMaiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tc+IFTGY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tc+IFTGY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752265756; x=1783801756;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tNVC9KLVJ/AmTJ1m2eTfsbE9eFyyM37iSMVI3Aa4TZ4=;
  b=Tc+IFTGY5dkKaHJCDVo+wcLeDXlbgG/Wb4PbzqNhad/1SciuU3fViuhQ
   qkxpo9DSqSOS91gqvU/MCvCW1drqyYZe6jnriWAw7Cn6Fn0yiK4pJQG1d
   6XU+ej7Z45n0GX+mBAo0H4hlpLibvvoVITRR7dFW8yovC7Up2cY6DAkFP
   yD93npKoZ/MaIUsslRTKloKr1a/lb5aG0TSz5SFkOyjIvIiAKo/dWdIH6
   EW28WlFNfy+1xuIhHah84I/x5lJStiKaZYAntvVWTr8JdiF2TRd5yXEZB
   nH0au+Be+PKC/niEFg/JPffKnPASvadUbFScZW92jnf8DWvQxVVa4yYTH
   Q==;
X-CSE-ConnectionGUID: /He/u3kaS9akJaYVcinhyw==
X-CSE-MsgGUID: H+QTHau5SimuvycbVuFHDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53788901"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; 
   d="scan'208";a="53788901"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 13:29:15 -0700
X-CSE-ConnectionGUID: J6W5DaPZSO2QmfN7zZwgqw==
X-CSE-MsgGUID: T1wd4cUdToq7GhDfAId4NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; 
   d="scan'208";a="156936139"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Jul 2025 13:29:13 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaKMp-0006lr-22;
	Fri, 11 Jul 2025 20:29:11 +0000
Date: Sat, 12 Jul 2025 04:28:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-new 203/214] mm/mremap.c:1829 remap_move() error:
 uninitialized symbol 'last_end'.
Message-ID: <202507120401.DCzwzjow-lkp@intel.com>
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
TO: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   9911a6d0676c211ea4df7eb8fe82ee6a0bb64fb4
commit: f1d4bfd28bb6e2e82f5fc58c7a0e17b7e15bba29 [203/214] mm/mremap: permit mremap() move of multiple VMAs
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: x86_64-randconfig-161-20250711 (https://download.01.org/0day-ci/archive/20250712/202507120401.DCzwzjow-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507120401.DCzwzjow-lkp@intel.com/

smatch warnings:
mm/mremap.c:1829 remap_move() error: uninitialized symbol 'last_end'.

vim +/last_end +1829 mm/mremap.c

97f50f9adaa533 Lorenzo Stoakes 2025-07-10  1784  
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1785  static unsigned long remap_move(struct vma_remap_struct *vrm)
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1786  {
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1787  	struct vm_area_struct *vma;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1788  	unsigned long start = vrm->addr;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1789  	unsigned long end = vrm->addr + vrm->old_len;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1790  	unsigned long new_addr = vrm->new_addr;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1791  	unsigned long prev_addr = start;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1792  	VMA_ITERATOR(vmi, current->mm, start);
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1793  	unsigned long res = -EFAULT;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1794  	unsigned long last_end;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1795  
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1796  	/*
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1797  	 * When moving VMAs we allow for batched moves across multiple VMAs,
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1798  	 * with all VMAs in the input range [addr, addr + old_len) being moved
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1799  	 * (and split as necessary).
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1800  	 */
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1801  	for_each_vma_range(vmi, vma, end) {
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1802  		/* Account for start, end not aligned with VMA start, end. */
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1803  		unsigned long addr = max(vma->vm_start, start);
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1804  		unsigned long len = min(end, vma->vm_end) - addr;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1805  		unsigned long offset, res_vma;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1806  
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1807  		/* Merged with self, move on. */
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1808  		if (vrm->multi_vma && prev_addr == addr)
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1809  			continue;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1810  
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1811  		/*
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1812  		 * To sensibly move multiple VMAs, accounting for the fact that
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1813  		 * get_unmapped_area() may align even MAP_FIXED moves, we simply
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1814  		 * attempt to move such that the gaps between source VMAs remain
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1815  		 * consistent in destination VMAs, e.g.:
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1816  		 *
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1817  		 *           X        Y                       X        Y
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1818  		 *         <--->     <->                    <--->     <->
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1819  		 * |-------|   |-----| |-----|      |-------|   |-----| |-----|
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1820  		 * |   A   |   |  B  | |  C  | ---> |   A'  |   |  B' | |  C' |
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1821  		 * |-------|   |-----| |-----|      |-------|   |-----| |-----|
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1822  		 *                               new_addr
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1823  		 *
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1824  		 * Now, new_addr may be altered even with MREMAP_FIXED set, due
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1825  		 * to e.g. alignment changes from get_unmapped_area().
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1826  		 *
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1827  		 * So we map B' at A'->vm_end + X, and C' at B'->vm_end + Y.
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1828  		 */
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10 @1829  		offset = vrm->multi_vma ? vma->vm_start - last_end : 0;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1830  		last_end = vma->vm_end;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1831  
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1832  		vrm->vma = vma;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1833  		vrm->addr = addr;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1834  		vrm->new_addr = new_addr + offset;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1835  		vrm->old_len = vrm->new_len = len;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1836  
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1837  		res_vma = check_prep_vma(vrm);
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1838  		if (!res_vma)
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1839  			res_vma = mremap_to(vrm);
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1840  		if (IS_ERR_VALUE(res_vma))
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1841  			return res_vma;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1842  
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1843  		/* mmap lock is only dropped on shrink. */
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1844  		VM_WARN_ON_ONCE(!vrm->mmap_locked);
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1845  		/* This is a move, no expand should occur. */
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1846  		VM_WARN_ON_ONCE(vrm->populate_expand);
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1847  
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1848  		if (!vrm->multi_vma)
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1849  			res = res_vma;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1850  
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1851  		if (vrm->vmi_needs_reset) {
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1852  			vma_iter_reset(&vmi);
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1853  			vrm->vmi_needs_reset = false;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1854  		}
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1855  		vrm->multi_vma = true;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1856  		prev_addr = addr;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1857  		new_addr = res_vma + vrm->new_len;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1858  	}
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1859  
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1860  	return res;
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1861  }
f1d4bfd28bb6e2 Lorenzo Stoakes 2025-07-10  1862  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
