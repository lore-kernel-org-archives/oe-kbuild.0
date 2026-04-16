Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332E83EAC6B
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Apr 2026 19:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776369090; cv=none; b=oX6UsfIXEHAqIlKPerdTkEQmQvLajqjQRwxwby3pmPI+yA1GDxxtk/tEnrMjE16jxTm3sdx0R8rD6HyJ6BOer+GQMalUdNICxn82YvBdPjSEDxwEWkv2UXzGhij4Raf1u12pftATwAQl654Jrldaa/v6pcSrRFZFs7mDoQdpG+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776369090; c=relaxed/simple;
	bh=fRjVQzHEnqJhcv2nyMgVRst7Rq6wA2kbLEMGZFilnVQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i5iIyWzWCsfT/aNswSjVh2p2qDrrDvlH0NWQvagj+ZaF9HbuMsphiVb2XDXzfgVKjyiaZAL6MugHa74vNctGIoJpxMNTWuDEnKuapbOsMKUbGmLLe3UDYpE50J7Cadwcu5GsSa/I2w+rj6FvShyuoyQkQnIJBP2EYEyWeCk7+cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DObe1ubE; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DObe1ubE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776369082; x=1807905082;
  h=date:from:to:cc:subject:message-id;
  bh=fRjVQzHEnqJhcv2nyMgVRst7Rq6wA2kbLEMGZFilnVQ=;
  b=DObe1ubE6TjqVtbGCELSAiGeHETtC2Uk0mdCM+8rrNBW678CeFBmZN59
   r+JMWC+OZdc2mCEzd/9Io2XRNI7bYly3fQdjMxF58KTpI375apOFT92iV
   rIUDOWBOXUnIt0Vkss6IgRCl33b5r2Gr1z7vGunwqHSHdw2ft1kJLoFUW
   x/ddJUYv1p/KPRqJKnnekAWpYenW0wnxpMurxn57H52I8PZziwnoviFFi
   LhoZjTEc1B1Z5XB8vvSsvcbckadE9KcHz9iAFN5goDNNX7C5TqcHNi2hx
   MrIS1IZ6Y2PM38n4QHyh5MRQSX8IBM8lMLHIzfAHkUQ5s+VL9dTSaGnrF
   A==;
X-CSE-ConnectionGUID: l60BGh9DTTaXawekf1L4hg==
X-CSE-MsgGUID: A/8aCcr3TYuN+u5/RurI6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="100028919"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="100028919"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 12:51:18 -0700
X-CSE-ConnectionGUID: 02qttbmYQpGuM8LC2NF0cw==
X-CSE-MsgGUID: SxE2f9koQx++QnzmEL+mRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="227688589"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Apr 2026 12:51:16 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDSk6-000000001ta-0qMd;
	Thu, 16 Apr 2026 19:51:14 +0000
Date: Fri, 17 Apr 2026 03:50:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/migrate.c:543 migration_entry_wait_huge() warn:
 inconsistent returns 'ptl'.
Message-ID: <202604170344.KEXYFXqz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Lorenzo,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1d51b370a0f8f642f4fc84c795fbedac0fcdbbd2
commit: 03bfbc3ad6e496fb576ca9ace08211943232fdf9 mm: remove is_hugetlb_entry_[migration, hwpoisoned]()
date:   5 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-r072-20260416 (https://download.01.org/0day-ci/archive/20260417/202604170344.KEXYFXqz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 03bfbc3ad6e4 ("mm: remove is_hugetlb_entry_[migration, hwpoisoned]()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604170344.KEXYFXqz-lkp@intel.com/

smatch warnings:
mm/migrate.c:543 migration_entry_wait_huge() warn: inconsistent returns 'ptl'.

vim +/ptl +543 mm/migrate.c

30dad30922ccc7 Naoya Horiguchi  2013-06-12  507  
ad1ac596e8a8c4 Miaohe Lin       2022-05-30  508  #ifdef CONFIG_HUGETLB_PAGE
fcd48540d18887 Peter Xu         2022-12-16  509  /*
fcd48540d18887 Peter Xu         2022-12-16  510   * The vma read lock must be held upon entry. Holding that lock prevents either
fcd48540d18887 Peter Xu         2022-12-16  511   * the pte or the ptl from being freed.
fcd48540d18887 Peter Xu         2022-12-16  512   *
fcd48540d18887 Peter Xu         2022-12-16  513   * This function will release the vma lock before returning.
fcd48540d18887 Peter Xu         2022-12-16  514   */
e6c0c03245b14d Christophe Leroy 2024-07-02  515  void migration_entry_wait_huge(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
ad1ac596e8a8c4 Miaohe Lin       2022-05-30  516  {
0cb8fd4d14165a Hugh Dickins     2023-06-08  517  	spinlock_t *ptl = huge_pte_lockptr(hstate_vma(vma), vma->vm_mm, ptep);
03bfbc3ad6e496 Lorenzo Stoakes  2025-11-10  518  	softleaf_t entry;
ad1ac596e8a8c4 Miaohe Lin       2022-05-30  519  	pte_t pte;
ad1ac596e8a8c4 Miaohe Lin       2022-05-30  520  
fcd48540d18887 Peter Xu         2022-12-16  521  	hugetlb_vma_assert_locked(vma);
ad1ac596e8a8c4 Miaohe Lin       2022-05-30  522  	spin_lock(ptl);
e6c0c03245b14d Christophe Leroy 2024-07-02  523  	pte = huge_ptep_get(vma->vm_mm, addr, ptep);
ad1ac596e8a8c4 Miaohe Lin       2022-05-30  524  
03bfbc3ad6e496 Lorenzo Stoakes  2025-11-10  525  	if (huge_pte_none(pte))
03bfbc3ad6e496 Lorenzo Stoakes  2025-11-10  526  		goto fail;
03bfbc3ad6e496 Lorenzo Stoakes  2025-11-10  527  
03bfbc3ad6e496 Lorenzo Stoakes  2025-11-10  528  	entry = softleaf_from_pte(pte);
03bfbc3ad6e496 Lorenzo Stoakes  2025-11-10  529  	if (softleaf_is_migration(entry)) {
fcd48540d18887 Peter Xu         2022-12-16  530  		/*
fcd48540d18887 Peter Xu         2022-12-16  531  		 * If migration entry existed, safe to release vma lock
fcd48540d18887 Peter Xu         2022-12-16  532  		 * here because the pgtable page won't be freed without the
fcd48540d18887 Peter Xu         2022-12-16  533  		 * pgtable lock released.  See comment right above pgtable
fcd48540d18887 Peter Xu         2022-12-16  534  		 * lock release in migration_entry_wait_on_locked().
fcd48540d18887 Peter Xu         2022-12-16  535  		 */
fcd48540d18887 Peter Xu         2022-12-16  536  		hugetlb_vma_unlock_read(vma);
0cb8fd4d14165a Hugh Dickins     2023-06-08  537  		migration_entry_wait_on_locked(pte_to_swp_entry(pte), ptl);
03bfbc3ad6e496 Lorenzo Stoakes  2025-11-10  538  		return;
fcd48540d18887 Peter Xu         2022-12-16  539  	}
03bfbc3ad6e496 Lorenzo Stoakes  2025-11-10  540  
03bfbc3ad6e496 Lorenzo Stoakes  2025-11-10  541  fail:
03bfbc3ad6e496 Lorenzo Stoakes  2025-11-10  542  	spin_unlock(ptl);
03bfbc3ad6e496 Lorenzo Stoakes  2025-11-10 @543  	hugetlb_vma_unlock_read(vma);
30dad30922ccc7 Naoya Horiguchi  2013-06-12  544  }
ad1ac596e8a8c4 Miaohe Lin       2022-05-30  545  #endif
30dad30922ccc7 Naoya Horiguchi  2013-06-12  546  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
