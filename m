Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2342FC866
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Oct 2025 16:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760115425; cv=none; b=GD//c4aADHu+xIWwPpKQghcdY2GbfwpWxsRNbGq2+Sa8ALjh9B0fKDrhLLn34QXqNdeDeIjaLYtpHIBmrAqY3mGG/6wSQZGOC+GoccdXWfatyJI/J1BXCkO7uxWiymZ9PXru4+taVAxb5BTgDTTSr0kPVAOUi1U44e9rte0EPSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760115425; c=relaxed/simple;
	bh=taMctmK//5nKddkK31TXu6V4xuI+ehRKldGGAmpxZCg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oUVMH17s3jVXMLDYNwdrOu2dWS2QYoGuokiuLNWx8mXU361kTdmYv4L+EiLDJS1JQpsPV0HGn07exsLefYjuF+oeNy93J1iWyuJLrS7v4O+Imu/46Kuusczms2wyjd4NWgGEpBTHVwe4Xe5SJwqDSYMLEO3LJu82MpxmCNCvEmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J4/svi1Q; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J4/svi1Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760115424; x=1791651424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=taMctmK//5nKddkK31TXu6V4xuI+ehRKldGGAmpxZCg=;
  b=J4/svi1QGF6TQnS6KI2Z6y2Jx4Y5wHJBYLP3cvULH85znUNeBx4p8SaT
   tMXbR3r3gPiWcBQpenEx19He2KAYiTy1H+iXwKyXAV5VzLZyhe4r4IR/v
   mRQQ/WhdQHvedDFnk8P7pHOQL/C046mTdG5KPnCiFDA5yOMEoKUbpKjiv
   9cRFaqycLGrl1+p1uPUVbtwqtFs+hb5Vlw6FDL0eyxBRPReaYBDqokL2a
   Kqt5LdRE+Ch/G0qUlvZWDmiw6C+4giyD+Ru1v9rgZEp8+ZUp0F1zx8inO
   vp1J47bixkMWfVaDQIy9Qf2jVDvqldMMZauW+tmmgWeKVXhhuGigNv3R6
   A==;
X-CSE-ConnectionGUID: L6XiguGgTj+jLL9HNrt93g==
X-CSE-MsgGUID: GVfiJAuTTdmi7gHwP9QWsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="62367661"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="62367661"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 09:57:03 -0700
X-CSE-ConnectionGUID: BBhTAnPISpClW7GO4GVL3Q==
X-CSE-MsgGUID: fHTL+8lnS6GxmxnIneHiPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="180703375"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Oct 2025 09:57:01 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7GQN-0002yp-2b;
	Fri, 10 Oct 2025 16:56:59 +0000
Date: Sat, 11 Oct 2025 00:56:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-new 114/114] mm/vmalloc.c:191 vmap_pmd_range() error:
 uninitialized symbol 'err'.
Message-ID: <202510110050.VG9YKMRK-lkp@intel.com>
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
TO: Yadong Qi <yadong.qi@linux.alibaba.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Huang Ying <ying.huang@linux.alibaba.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   dbf0247637dd0601a462793035bdd0b416b30e36
commit: dbf0247637dd0601a462793035bdd0b416b30e36 [114/114] mm: vmalloc: WARN_ON if mapping size is not PAGE_SIZE aligned
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: sparc-randconfig-r071-20251010 (https://download.01.org/0day-ci/archive/20251011/202510110050.VG9YKMRK-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510110050.VG9YKMRK-lkp@intel.com/

smatch warnings:
mm/vmalloc.c:191 vmap_pmd_range() error: uninitialized symbol 'err'.
mm/vmalloc.c:243 vmap_pud_range() error: uninitialized symbol 'err'.
mm/vmalloc.c:295 vmap_p4d_range() error: uninitialized symbol 'err'.

vim +/err +191 mm/vmalloc.c

5e9e3d777b99aa Nicholas Piggin 2021-04-29  166  
5e9e3d777b99aa Nicholas Piggin 2021-04-29  167  static int vmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
5e9e3d777b99aa Nicholas Piggin 2021-04-29  168  			phys_addr_t phys_addr, pgprot_t prot,
5e9e3d777b99aa Nicholas Piggin 2021-04-29  169  			unsigned int max_page_shift, pgtbl_mod_mask *mask)
5e9e3d777b99aa Nicholas Piggin 2021-04-29  170  {
5e9e3d777b99aa Nicholas Piggin 2021-04-29  171  	pmd_t *pmd;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  172  	unsigned long next;
dbf0247637dd06 Yadong Qi       2025-10-10  173  	int err;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  174  
5e9e3d777b99aa Nicholas Piggin 2021-04-29  175  	pmd = pmd_alloc_track(&init_mm, pud, addr, mask);
5e9e3d777b99aa Nicholas Piggin 2021-04-29  176  	if (!pmd)
5e9e3d777b99aa Nicholas Piggin 2021-04-29  177  		return -ENOMEM;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  178  	do {
5e9e3d777b99aa Nicholas Piggin 2021-04-29  179  		next = pmd_addr_end(addr, end);
5e9e3d777b99aa Nicholas Piggin 2021-04-29  180  
5e9e3d777b99aa Nicholas Piggin 2021-04-29  181  		if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot,
5e9e3d777b99aa Nicholas Piggin 2021-04-29  182  					max_page_shift)) {
5e9e3d777b99aa Nicholas Piggin 2021-04-29  183  			*mask |= PGTBL_PMD_MODIFIED;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  184  			continue;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  185  		}
5e9e3d777b99aa Nicholas Piggin 2021-04-29  186  
dbf0247637dd06 Yadong Qi       2025-10-10  187  		err = vmap_pte_range(pmd, addr, next, phys_addr, prot, max_page_shift, mask);
dbf0247637dd06 Yadong Qi       2025-10-10  188  		if (err)
dbf0247637dd06 Yadong Qi       2025-10-10  189  			break;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  190  	} while (pmd++, phys_addr += (next - addr), addr = next, addr != end);
dbf0247637dd06 Yadong Qi       2025-10-10 @191  	return err;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  192  }
5e9e3d777b99aa Nicholas Piggin 2021-04-29  193  
5e9e3d777b99aa Nicholas Piggin 2021-04-29  194  static int vmap_try_huge_pud(pud_t *pud, unsigned long addr, unsigned long end,
5e9e3d777b99aa Nicholas Piggin 2021-04-29  195  			phys_addr_t phys_addr, pgprot_t prot,
5e9e3d777b99aa Nicholas Piggin 2021-04-29  196  			unsigned int max_page_shift)
5e9e3d777b99aa Nicholas Piggin 2021-04-29  197  {
5e9e3d777b99aa Nicholas Piggin 2021-04-29  198  	if (max_page_shift < PUD_SHIFT)
5e9e3d777b99aa Nicholas Piggin 2021-04-29  199  		return 0;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  200  
5e9e3d777b99aa Nicholas Piggin 2021-04-29  201  	if (!arch_vmap_pud_supported(prot))
5e9e3d777b99aa Nicholas Piggin 2021-04-29  202  		return 0;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  203  
5e9e3d777b99aa Nicholas Piggin 2021-04-29  204  	if ((end - addr) != PUD_SIZE)
5e9e3d777b99aa Nicholas Piggin 2021-04-29  205  		return 0;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  206  
5e9e3d777b99aa Nicholas Piggin 2021-04-29  207  	if (!IS_ALIGNED(addr, PUD_SIZE))
5e9e3d777b99aa Nicholas Piggin 2021-04-29  208  		return 0;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  209  
5e9e3d777b99aa Nicholas Piggin 2021-04-29  210  	if (!IS_ALIGNED(phys_addr, PUD_SIZE))
5e9e3d777b99aa Nicholas Piggin 2021-04-29  211  		return 0;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  212  
5e9e3d777b99aa Nicholas Piggin 2021-04-29  213  	if (pud_present(*pud) && !pud_free_pmd_page(pud, addr))
5e9e3d777b99aa Nicholas Piggin 2021-04-29  214  		return 0;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  215  
5e9e3d777b99aa Nicholas Piggin 2021-04-29  216  	return pud_set_huge(pud, phys_addr, prot);
5e9e3d777b99aa Nicholas Piggin 2021-04-29  217  }
5e9e3d777b99aa Nicholas Piggin 2021-04-29  218  
5e9e3d777b99aa Nicholas Piggin 2021-04-29  219  static int vmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
5e9e3d777b99aa Nicholas Piggin 2021-04-29  220  			phys_addr_t phys_addr, pgprot_t prot,
5e9e3d777b99aa Nicholas Piggin 2021-04-29  221  			unsigned int max_page_shift, pgtbl_mod_mask *mask)
5e9e3d777b99aa Nicholas Piggin 2021-04-29  222  {
5e9e3d777b99aa Nicholas Piggin 2021-04-29  223  	pud_t *pud;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  224  	unsigned long next;
dbf0247637dd06 Yadong Qi       2025-10-10  225  	int err;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  226  
5e9e3d777b99aa Nicholas Piggin 2021-04-29  227  	pud = pud_alloc_track(&init_mm, p4d, addr, mask);
5e9e3d777b99aa Nicholas Piggin 2021-04-29  228  	if (!pud)
5e9e3d777b99aa Nicholas Piggin 2021-04-29  229  		return -ENOMEM;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  230  	do {
5e9e3d777b99aa Nicholas Piggin 2021-04-29  231  		next = pud_addr_end(addr, end);
5e9e3d777b99aa Nicholas Piggin 2021-04-29  232  
5e9e3d777b99aa Nicholas Piggin 2021-04-29  233  		if (vmap_try_huge_pud(pud, addr, next, phys_addr, prot,
5e9e3d777b99aa Nicholas Piggin 2021-04-29  234  					max_page_shift)) {
5e9e3d777b99aa Nicholas Piggin 2021-04-29  235  			*mask |= PGTBL_PUD_MODIFIED;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  236  			continue;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  237  		}
5e9e3d777b99aa Nicholas Piggin 2021-04-29  238  
dbf0247637dd06 Yadong Qi       2025-10-10  239  		err = vmap_pmd_range(pud, addr, next, phys_addr, prot, max_page_shift, mask);
dbf0247637dd06 Yadong Qi       2025-10-10  240  		if (err)
dbf0247637dd06 Yadong Qi       2025-10-10  241  			break;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  242  	} while (pud++, phys_addr += (next - addr), addr = next, addr != end);
dbf0247637dd06 Yadong Qi       2025-10-10 @243  	return err;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  244  }
5e9e3d777b99aa Nicholas Piggin 2021-04-29  245  
5e9e3d777b99aa Nicholas Piggin 2021-04-29  246  static int vmap_try_huge_p4d(p4d_t *p4d, unsigned long addr, unsigned long end,
5e9e3d777b99aa Nicholas Piggin 2021-04-29  247  			phys_addr_t phys_addr, pgprot_t prot,
5e9e3d777b99aa Nicholas Piggin 2021-04-29  248  			unsigned int max_page_shift)
5e9e3d777b99aa Nicholas Piggin 2021-04-29  249  {
5e9e3d777b99aa Nicholas Piggin 2021-04-29  250  	if (max_page_shift < P4D_SHIFT)
5e9e3d777b99aa Nicholas Piggin 2021-04-29  251  		return 0;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  252  
5e9e3d777b99aa Nicholas Piggin 2021-04-29  253  	if (!arch_vmap_p4d_supported(prot))
5e9e3d777b99aa Nicholas Piggin 2021-04-29  254  		return 0;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  255  
5e9e3d777b99aa Nicholas Piggin 2021-04-29  256  	if ((end - addr) != P4D_SIZE)
5e9e3d777b99aa Nicholas Piggin 2021-04-29  257  		return 0;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  258  
5e9e3d777b99aa Nicholas Piggin 2021-04-29  259  	if (!IS_ALIGNED(addr, P4D_SIZE))
5e9e3d777b99aa Nicholas Piggin 2021-04-29  260  		return 0;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  261  
5e9e3d777b99aa Nicholas Piggin 2021-04-29  262  	if (!IS_ALIGNED(phys_addr, P4D_SIZE))
5e9e3d777b99aa Nicholas Piggin 2021-04-29  263  		return 0;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  264  
5e9e3d777b99aa Nicholas Piggin 2021-04-29  265  	if (p4d_present(*p4d) && !p4d_free_pud_page(p4d, addr))
5e9e3d777b99aa Nicholas Piggin 2021-04-29  266  		return 0;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  267  
5e9e3d777b99aa Nicholas Piggin 2021-04-29  268  	return p4d_set_huge(p4d, phys_addr, prot);
5e9e3d777b99aa Nicholas Piggin 2021-04-29  269  }
5e9e3d777b99aa Nicholas Piggin 2021-04-29  270  
5e9e3d777b99aa Nicholas Piggin 2021-04-29  271  static int vmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
5e9e3d777b99aa Nicholas Piggin 2021-04-29  272  			phys_addr_t phys_addr, pgprot_t prot,
5e9e3d777b99aa Nicholas Piggin 2021-04-29  273  			unsigned int max_page_shift, pgtbl_mod_mask *mask)
5e9e3d777b99aa Nicholas Piggin 2021-04-29  274  {
5e9e3d777b99aa Nicholas Piggin 2021-04-29  275  	p4d_t *p4d;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  276  	unsigned long next;
dbf0247637dd06 Yadong Qi       2025-10-10  277  	int err;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  278  
5e9e3d777b99aa Nicholas Piggin 2021-04-29  279  	p4d = p4d_alloc_track(&init_mm, pgd, addr, mask);
5e9e3d777b99aa Nicholas Piggin 2021-04-29  280  	if (!p4d)
5e9e3d777b99aa Nicholas Piggin 2021-04-29  281  		return -ENOMEM;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  282  	do {
5e9e3d777b99aa Nicholas Piggin 2021-04-29  283  		next = p4d_addr_end(addr, end);
5e9e3d777b99aa Nicholas Piggin 2021-04-29  284  
5e9e3d777b99aa Nicholas Piggin 2021-04-29  285  		if (vmap_try_huge_p4d(p4d, addr, next, phys_addr, prot,
5e9e3d777b99aa Nicholas Piggin 2021-04-29  286  					max_page_shift)) {
5e9e3d777b99aa Nicholas Piggin 2021-04-29  287  			*mask |= PGTBL_P4D_MODIFIED;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  288  			continue;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  289  		}
5e9e3d777b99aa Nicholas Piggin 2021-04-29  290  
dbf0247637dd06 Yadong Qi       2025-10-10  291  		err = vmap_pud_range(p4d, addr, next, phys_addr, prot, max_page_shift, mask);
dbf0247637dd06 Yadong Qi       2025-10-10  292  		if (err)
dbf0247637dd06 Yadong Qi       2025-10-10  293  			break;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  294  	} while (p4d++, phys_addr += (next - addr), addr = next, addr != end);
dbf0247637dd06 Yadong Qi       2025-10-10 @295  	return err;
5e9e3d777b99aa Nicholas Piggin 2021-04-29  296  }
5e9e3d777b99aa Nicholas Piggin 2021-04-29  297  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
