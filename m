Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D662264D6
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 02:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768788695; cv=none; b=Jqu25aZt6pOy/87jccJrfX5TzABV+SKHuilB/WA9VueMglZA7f782G7VUaOFP8KIYnQdiOuR8SX9vlteNEVExD6nDIH6EENPg7wXWFWDXVB81ZcPNHJKPOQE2wUUxtN89uNx3Ly9Q8Aja/iibZ7xtpG9XME77dnBJwLra33fbQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768788695; c=relaxed/simple;
	bh=UF7hnD/uvL4ZiTKKlgYhtO+8D07pue21vVp9Sg79++E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ECVU55bRlKnFYRY3DYz0iRKPK0dHqrztpq2yqoY89MMxtQQxyNagYBVOjraltBo5YJUnuqUrl8fDI3TPvOf34IuDDcSSST7mCvytSi8xdD5Im0H0i4OixfBCBpaDccuoLEBxxZ4VThE0m0BBGCb8Du7wjrOysKYAxVbDlXpkTXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=faCS6ol8; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="faCS6ol8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768788694; x=1800324694;
  h=date:from:to:cc:subject:message-id;
  bh=UF7hnD/uvL4ZiTKKlgYhtO+8D07pue21vVp9Sg79++E=;
  b=faCS6ol8nJ3RbZkxX/dRmv5886Xvil/uJ3XYtMr4+YbmZRA1onp/qKup
   ln1K4bavC0PPMT61awjnG/V+6IXAwwI/irrBO18fsTq4aPv42/GgDkU+y
   5Ydy7cw0481lzO1NivysvfEolJWJHkZJMa4N3MPbvGBPGk2cndX/BpG5h
   EN6vkcMrmO1wx8/CTnqVDx8Wmd8ygGf/B+0X1lxOhaR83vG+maEX5SaWp
   AeIJRXItiJuFBa7Onkqbi1sAAbTz9Mtmdmsi2ylsNFv25hByBI5FknCCi
   Mj3u5iPZ3TV7+9bH95lopmzRCm+k53CYAenswSzkWS697y5MAfM1LXT3N
   g==;
X-CSE-ConnectionGUID: XcjBlNE3QdmEjlbgOPaXzQ==
X-CSE-MsgGUID: hTF6E9JKSCSljFO6m/8KaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="92669586"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="92669586"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 18:11:33 -0800
X-CSE-ConnectionGUID: TlJKszCPThu+vjgDIElq3Q==
X-CSE-MsgGUID: IN1UYEBkTBCbYqDrWRkhNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="243311804"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jan 2026 18:11:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhejp-00000000NM5-3D2U;
	Mon, 19 Jan 2026 02:11:29 +0000
Date: Mon, 19 Jan 2026 10:11:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rppt:uffd/refactor/v0.2 8/11] mm/userfaultfd.c:589
 mfill_atomic_pte_continue() error: uninitialized symbol 'ret'.
Message-ID: <202601191012.4KSae2SF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Mike Rapoport <rppt@kernel.org>
TO: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git uffd/refactor/v0.2
head:   2db3a86a6de3247449e068d998305d26481c5522
commit: 629131e835ff52775f59108aa49795ce35e442d4 [8/11] userfaultfd, shmem: use a VMA callback to handle UFFDIO_CONTINUE
:::::: branch date: 7 hours ago
:::::: commit date: 10 hours ago
config: x86_64-randconfig-161-20260119 (https://download.01.org/0day-ci/archive/20260119/202601191012.4KSae2SF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601191012.4KSae2SF-lkp@intel.com/

smatch warnings:
mm/userfaultfd.c:589 mfill_atomic_pte_continue() error: uninitialized symbol 'ret'.

vim +/ret +589 mm/userfaultfd.c

c1a4de99fada21 Andrea Arcangeli          2015-09-04  568  
153132571f0204 Axel Rasmussen            2021-06-30  569  /* Handles UFFDIO_CONTINUE for all shmem VMAs (shared or private). */
375eb8947b4c3c Mike Rapoport (Microsoft  2026-01-11  570) static int mfill_atomic_pte_continue(struct mfill_state *state)
153132571f0204 Axel Rasmussen            2021-06-30  571  {
375eb8947b4c3c Mike Rapoport (Microsoft  2026-01-11  572) 	struct vm_area_struct *dst_vma = state->vma;
629131e835ff52 Mike Rapoport (Microsoft  2025-11-15  573) 	const struct vm_uffd_ops *ops = vma_uffd_ops(dst_vma);
375eb8947b4c3c Mike Rapoport (Microsoft  2026-01-11  574) 	unsigned long dst_addr = state->dst_addr;
153132571f0204 Axel Rasmussen            2021-06-30  575  	pgoff_t pgoff = linear_page_index(dst_vma, dst_addr);
375eb8947b4c3c Mike Rapoport (Microsoft  2026-01-11  576) 	struct inode *inode = file_inode(dst_vma->vm_file);
375eb8947b4c3c Mike Rapoport (Microsoft  2026-01-11  577) 	uffd_flags_t flags = state->flags;
375eb8947b4c3c Mike Rapoport (Microsoft  2026-01-11  578) 	pmd_t *dst_pmd = state->pmd;
12acf4fbc4f78b Matthew Wilcox (Oracle    2022-09-02  579) 	struct folio *folio;
153132571f0204 Axel Rasmussen            2021-06-30  580  	struct page *page;
153132571f0204 Axel Rasmussen            2021-06-30  581  	int ret;
153132571f0204 Axel Rasmussen            2021-06-30  582  
629131e835ff52 Mike Rapoport (Microsoft  2025-11-15  583) 	if (!ops)
629131e835ff52 Mike Rapoport (Microsoft  2025-11-15  584) 		return -EOPNOTSUPP;
629131e835ff52 Mike Rapoport (Microsoft  2025-11-15  585) 
629131e835ff52 Mike Rapoport (Microsoft  2025-11-15  586) 	folio = ops->get_folio_noalloc(inode, pgoff);
12acf4fbc4f78b Matthew Wilcox (Oracle    2022-09-02  587) 	/* Our caller expects us to return -EFAULT if we failed to find folio */
629131e835ff52 Mike Rapoport (Microsoft  2025-11-15  588) 	if (IS_ERR_OR_NULL(folio)) {
629131e835ff52 Mike Rapoport (Microsoft  2025-11-15 @589) 		if (ret == -ENOENT || !folio)
153132571f0204 Axel Rasmussen            2021-06-30  590  			ret = -EFAULT;
629131e835ff52 Mike Rapoport (Microsoft  2025-11-15  591) 		return -EFAULT;
153132571f0204 Axel Rasmussen            2021-06-30  592  	}
153132571f0204 Axel Rasmussen            2021-06-30  593  
12acf4fbc4f78b Matthew Wilcox (Oracle    2022-09-02  594) 	page = folio_file_page(folio, pgoff);
a7605426666196 Yang Shi                  2022-01-14  595  	if (PageHWPoison(page)) {
a7605426666196 Yang Shi                  2022-01-14  596  		ret = -EIO;
a7605426666196 Yang Shi                  2022-01-14  597  		goto out_release;
a7605426666196 Yang Shi                  2022-01-14  598  	}
a7605426666196 Yang Shi                  2022-01-14  599  
61c5004022f56c Axel Rasmussen            2023-03-14  600  	ret = mfill_atomic_install_pte(dst_pmd, dst_vma, dst_addr,
d9712937037e0c Axel Rasmussen            2023-03-14  601  				       page, false, flags);
153132571f0204 Axel Rasmussen            2021-06-30  602  	if (ret)
153132571f0204 Axel Rasmussen            2021-06-30  603  		goto out_release;
153132571f0204 Axel Rasmussen            2021-06-30  604  
12acf4fbc4f78b Matthew Wilcox (Oracle    2022-09-02  605) 	folio_unlock(folio);
629131e835ff52 Mike Rapoport (Microsoft  2025-11-15  606) 	return 0;
629131e835ff52 Mike Rapoport (Microsoft  2025-11-15  607) 
153132571f0204 Axel Rasmussen            2021-06-30  608  out_release:
12acf4fbc4f78b Matthew Wilcox (Oracle    2022-09-02  609) 	folio_unlock(folio);
12acf4fbc4f78b Matthew Wilcox (Oracle    2022-09-02  610) 	folio_put(folio);
629131e835ff52 Mike Rapoport (Microsoft  2025-11-15  611) 	return ret;
153132571f0204 Axel Rasmussen            2021-06-30  612  }
153132571f0204 Axel Rasmussen            2021-06-30  613  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
