Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E4E14659C
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jul 2024 03:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722309082; cv=none; b=Lm2jxwTkT11RvlEMapVT3znF+SEF27nEbiKtBDjmUR2n/PpgXH7f2VwBrmjo+HKnHdybxo6D0I6eklgPDdR4J78hfjOcI7+KiVQYlh4uY90tUBuOjIvVKzD2X1QwBp3EUEvZCtIPT64QpacHFGb2TyRtTxe0rtJxAcDaS5pusqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722309082; c=relaxed/simple;
	bh=9DGmR/FASB6RMZFrB+nuCqxGOCZs0hk7sWoSgD8ZfnY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XEory+pHdycXDTRuop85MgVSkIIERm5MFNDwVQ5UWXGfP1uRvfjGtwtjW84nVeGvPt/jIm2M7jtm+SQ2kcCtVaUpKigJMfksjKRyToc5/QTIjrdMjsre/4In5qaIBia3UICLFEZRnAK/mLoOMlF2sCP1NyueQVZN0WIabyhP3XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QkiS2JrZ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QkiS2JrZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722309080; x=1753845080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9DGmR/FASB6RMZFrB+nuCqxGOCZs0hk7sWoSgD8ZfnY=;
  b=QkiS2JrZpQByTvTxIYHEiEtHsWVq2cAYU2jXggbrITY9Ho/v0YIuozRw
   uShxxquWntXMVP/tmAgRNsycJ9KtO0daw98FWU6PD9H4oAdmFgkstExzY
   BnSNEgfUP5Y4Cr7xovXkPVZfi1FDc0os5DlGBETOfeZBb7ijYtXonYsQt
   b6SpOnWmODAZxzctVIzyFfHKPDVmPDccVYHN300Lyd2QXP7DF0XqMxBwK
   LDQE4/pZk63dAL9l8ze8IpVJAxE034bqYEm0UE0VdOjV5wpIkBE9PO4dn
   RtO+f0JPAgwpEok334OP1MdQNtA3t/vfeWbZQYv6vBgXnLRg517oWRewk
   Q==;
X-CSE-ConnectionGUID: MEk2Ax2wQISYY6TDhwJiJQ==
X-CSE-MsgGUID: wtwan2WcQOOQX/OwCwpcCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20050014"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="20050014"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 20:11:20 -0700
X-CSE-ConnectionGUID: fZj95EoiSpyg8Yjo8DZIFA==
X-CSE-MsgGUID: Ol16Ke9FQMm3FXRQafv+Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="54152980"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Jul 2024 20:11:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYdGe-000sPS-0N;
	Tue, 30 Jul 2024 03:11:16 +0000
Date: Tue, 30 Jul 2024 11:10:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linyunsheng:page_frag_cache_v12 2/7] mm/page_alloc.o: warning:
 objtool: __free_pages+0x34: unreachable instruction
Message-ID: <202407301110.sS5i57RI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yunsheng Lin <linyunsheng@huawei.com>

tree:   https://github.com/gestionlin/linux.git page_frag_cache_v12
head:   6df818aaf9213eb10cbde211ac87c61f0db7f27c
commit: 77350a2e8cd72d6ac9031d6162d6534086fe1a24 [2/7] mm: move the page fragment allocator from page_alloc into its own file
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: loongarch-randconfig-001-20240730 (https://download.01.org/0day-ci/archive/20240730/202407301110.sS5i57RI-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407301110.sS5i57RI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407301110.sS5i57RI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from mm/page_alloc.c:19:
   include/linux/swapops.h: In function 'swp_entry_to_pmd':
   arch/loongarch/include/asm/pgtable.h:290:34: warning: missing braces around initializer [-Wmissing-braces]
     290 | #define __swp_entry_to_pmd(x)   ((pmd_t) { (x).val | _PAGE_HUGE })
         |                                  ^
   include/linux/swapops.h:556:16: note: in expansion of macro '__swp_entry_to_pmd'
     556 |         return __swp_entry_to_pmd(arch_entry);
         |                ^~~~~~~~~~~~~~~~~~
   mm/page_alloc.o: warning: objtool: const_folio_flags+0x30: unreachable instruction
   mm/page_alloc.o: warning: objtool: set_page_refcounted+0x34: unreachable instruction
   mm/page_alloc.o: warning: objtool: split_page+0x3c: unreachable instruction
   mm/page_alloc.o: warning: objtool: __del_page_from_free_list+0xcc: unreachable instruction
   mm/page_alloc.o: warning: objtool: __free_one_page+0x84: unreachable instruction
   mm/page_alloc.o: warning: objtool: __free_pages_ok+0xb0: unreachable instruction
   mm/page_alloc.o: warning: objtool: __move_freepages_block+0xcc: unreachable instruction
   mm/page_alloc.o: warning: objtool: free_pages_prepare+0x8c: unreachable instruction
   mm/page_alloc.o: warning: objtool: rmqueue+0x3f4: unreachable instruction
   mm/page_alloc.o: warning: objtool: free_unref_page+0xe4: unreachable instruction
>> mm/page_alloc.o: warning: objtool: __free_pages+0x34: unreachable instruction
   mm/page_alloc.o: warning: objtool: free_unref_folios+0xf0: unreachable instruction
   mm/page_alloc.o: warning: objtool: __folio_alloc_noprof+0x48: unreachable instruction
   mm/page_alloc.o: warning: objtool: free_reserved_area+0xa8: unreachable instruction
   mm/page_alloc.o: warning: objtool: __free_pages_core+0x54: unreachable instruction


objdump-func vmlinux.o __free_pages:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
