Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B6E409632
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Jun 2026 08:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780475356; cv=none; b=KRSt1BAhqqxZINbV7AIIkApEqRcwYIHEWl5lIDYRfSjG++YQBj3ZsTW8Dhq0x1aCw/leGXPGRjpasAZYiGfxs3/tXfpjHujj2ZQxWLVqZhJdEVyur50oE/dtO5K73ZHRSy5SuvsV1Gbcy3G+0rtqWljYzs7eYfajt6/wzCHAf68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780475356; c=relaxed/simple;
	bh=yrGjxP/sraAdACSf5TgtdRz/rQZNU7LZmLbBz1R+ENo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TJtQClFckAYRpz93apTgVe/FVb14t2Ph1Z2LJmAYnOOx9p0yl5+BKszJMvkllGxE7ztZycr36HEFeeCneMnmj61R2suK8HlOXWuhm8VlZB0/V5VUyrPobA7iZAg7F7GcAdi9J/0SV+5C/suUl+AfwePsy3GUxXfQNG56K49waPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RBDlVdaA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RBDlVdaA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780475355; x=1812011355;
  h=date:from:to:cc:subject:message-id;
  bh=yrGjxP/sraAdACSf5TgtdRz/rQZNU7LZmLbBz1R+ENo=;
  b=RBDlVdaA5ij/U1YSnPRrl0iefcw9fGP0E4YqZFbFcXKmwgD6t6R17oBT
   OV5HicXTOUwIY7fRsrKfIFcFij1ZTsPmiquvMlZjLKeV4kYdl5an5KbOQ
   ZPV8kRtbQl3IPwIWM1O4TxQS/334R4x4JPDqz0flTZYcUlmAAnf1D9ZdZ
   8uYeKgQfWPImX0dub8VafrcbXB1oTcaig17mcDG0L1hCd6Z5HiMSDQbGq
   LpUa445NrtqXR3Sy2ArzvIzyy7KQobLktbek922oAG8e6YCCOpg8QGFfR
   0nP1oJVIKE180kIaHb5h+iRiR3DZVbR8K+TEygWHzwrrVR0RZJwNf1Fdn
   w==;
X-CSE-ConnectionGUID: TaiHqDihTOqdOzpdBdraHw==
X-CSE-MsgGUID: yF/6dhpTR9GDfsV2n7UCpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91848497"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="91848497"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 01:29:14 -0700
X-CSE-ConnectionGUID: FOpNjTplRn+gFMiHhVgQiA==
X-CSE-MsgGUID: bgSmn9ZDRA+nc95qB1023Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="244000426"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Jun 2026 01:29:12 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUgyM-00000000D9Q-1tDw;
	Wed, 03 Jun 2026 08:29:10 +0000
Date: Wed, 03 Jun 2026 16:28:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kas:uffd/v6 15/21] mm/userfaultfd.c:2223
 vma_can_userfault() warn: bitwise AND condition is false here
Message-ID: <202606031635.Gea5Zgd6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
CC: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git uffd/v6
head:   677aa40b35f0206d766e3a56fc30602fbe6d87db
commit: 8543ebc943dc3a2f0849caf3389fb5f2b89b8f6c [15/21] userfaultfd: add UFFDIO_REGISTER_MODE_RWP and UFFDIO_RWPROTECT plumbing
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: nios2-randconfig-r071-20260603 (https://download.01.org/0day-ci/archive/20260603/202606031635.Gea5Zgd6-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606031635.Gea5Zgd6-lkp@intel.com/

smatch warnings:
mm/userfaultfd.c:2223 vma_can_userfault() warn: bitwise AND condition is false here

vim +2223 mm/userfaultfd.c

a17c7d8fd2b097a Lorenzo Stoakes           2024-07-29  2187  
305b2c73219da36 Mike Rapoport (Microsoft  2026-05-23  2188) static bool vma_can_userfault(struct vm_area_struct *vma, vm_flags_t vm_flags,
a5bb8669872b6b8 Mike Rapoport (Microsoft  2026-04-02  2189) 		       bool wp_async)
a5bb8669872b6b8 Mike Rapoport (Microsoft  2026-04-02  2190) {
0f48947c4232c93 Mike Rapoport (Microsoft  2026-04-02  2191) 	const struct vm_uffd_ops *ops = vma_uffd_ops(vma);
a5bb8669872b6b8 Mike Rapoport (Microsoft  2026-04-02  2192) 
a5bb8669872b6b8 Mike Rapoport (Microsoft  2026-04-02  2193) 	if (vma->vm_flags & VM_DROPPABLE)
a5bb8669872b6b8 Mike Rapoport (Microsoft  2026-04-02  2194) 		return false;
a5bb8669872b6b8 Mike Rapoport (Microsoft  2026-04-02  2195) 
0f48947c4232c93 Mike Rapoport (Microsoft  2026-04-02  2196) 	vm_flags &= __VM_UFFD_FLAGS;
a5bb8669872b6b8 Mike Rapoport (Microsoft  2026-04-02  2197) 
a5bb8669872b6b8 Mike Rapoport (Microsoft  2026-04-02  2198) 	/*
0f48947c4232c93 Mike Rapoport (Microsoft  2026-04-02  2199) 	 * If WP is the only mode enabled and context is wp async, allow any
a5bb8669872b6b8 Mike Rapoport (Microsoft  2026-04-02  2200) 	 * memory type.
a5bb8669872b6b8 Mike Rapoport (Microsoft  2026-04-02  2201) 	 */
a5bb8669872b6b8 Mike Rapoport (Microsoft  2026-04-02  2202) 	if (wp_async && (vm_flags == VM_UFFD_WP))
a5bb8669872b6b8 Mike Rapoport (Microsoft  2026-04-02  2203) 		return true;
a5bb8669872b6b8 Mike Rapoport (Microsoft  2026-04-02  2204) 
0f48947c4232c93 Mike Rapoport (Microsoft  2026-04-02  2205) 	/* For any other mode reject VMAs that don't implement vm_uffd_ops */
0f48947c4232c93 Mike Rapoport (Microsoft  2026-04-02  2206) 	if (!ops)
0f48947c4232c93 Mike Rapoport (Microsoft  2026-04-02  2207) 		return false;
0f48947c4232c93 Mike Rapoport (Microsoft  2026-04-02  2208) 
a5bb8669872b6b8 Mike Rapoport (Microsoft  2026-04-02  2209) 	/*
a5bb8669872b6b8 Mike Rapoport (Microsoft  2026-04-02  2210) 	 * If user requested uffd-wp but not enabled pte markers for
0f48947c4232c93 Mike Rapoport (Microsoft  2026-04-02  2211) 	 * uffd-wp, then only anonymous memory is supported
a5bb8669872b6b8 Mike Rapoport (Microsoft  2026-04-02  2212) 	 */
a5bb8669872b6b8 Mike Rapoport (Microsoft  2026-04-02  2213) 	if (!uffd_supports_wp_marker() && (vm_flags & VM_UFFD_WP) &&
a5bb8669872b6b8 Mike Rapoport (Microsoft  2026-04-02  2214) 	    !vma_is_anonymous(vma))
a5bb8669872b6b8 Mike Rapoport (Microsoft  2026-04-02  2215) 		return false;
a5bb8669872b6b8 Mike Rapoport (Microsoft  2026-04-02  2216) 
8543ebc943dc3a2 Kiryl Shutsemau (Meta     2026-04-18  2217) 	/*
8543ebc943dc3a2 Kiryl Shutsemau (Meta     2026-04-18  2218) 	 * RWP uses protnone as an access-tracking marker. PROT_NONE VMAs
8543ebc943dc3a2 Kiryl Shutsemau (Meta     2026-04-18  2219) 	 * have vm_page_prot == PAGE_NONE, so RWP resolution can't make a
8543ebc943dc3a2 Kiryl Shutsemau (Meta     2026-04-18  2220) 	 * page accessible -- the next access would fault again. Reject up
8543ebc943dc3a2 Kiryl Shutsemau (Meta     2026-04-18  2221) 	 * front instead of letting FOLL_FORCE loop on protnone+uffd PTEs.
8543ebc943dc3a2 Kiryl Shutsemau (Meta     2026-04-18  2222) 	 */
8543ebc943dc3a2 Kiryl Shutsemau (Meta     2026-04-18 @2223) 	if ((vm_flags & VM_UFFD_RWP) && !vma_is_accessible(vma))
8543ebc943dc3a2 Kiryl Shutsemau (Meta     2026-04-18  2224) 		return false;
8543ebc943dc3a2 Kiryl Shutsemau (Meta     2026-04-18  2225) 
0f48947c4232c93 Mike Rapoport (Microsoft  2026-04-02  2226) 	return ops->can_userfault(vma, vm_flags);
a5bb8669872b6b8 Mike Rapoport (Microsoft  2026-04-02  2227) }
a5bb8669872b6b8 Mike Rapoport (Microsoft  2026-04-02  2228) 

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
