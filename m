Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0459323AD
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Mar 2023 09:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679478393; x=1711014393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XjumlXAsLqHB4Mw1UeZaTyFLY44ynAvohLnJlPNJI0o=;
  b=BUPrSzRlqVYhlqwAJqjw8eUWneRVjejRQr0DwbE4RbHEwToNsQDhosme
   EvmfucbMsCLifAwyKsSOZHvRd+A8CLLgDEiRV1IcZnkMkiltMvGesMKZd
   C8+LEpJUxPsz67r/pHqMqIbCGOllpBNIrOOxETpQGE6bIVSChwIUHNV3i
   1UbRUjq3ZyNLtAOoxu1z/F5jTBUs9ElpHBUJC3WT4vLQbSqYtcvRGe8Sz
   Rrzq5syW9usFmma86Q6fsYBgV01s7VEJKKmQ3QQ2fxQtsi5ipgv18yqHL
   PidlMKEQdmoKC+XLWEZeF3rktjK6PTJN4wb//y/rUllbL2LFCCxfj0xsM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="341530668"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="341530668"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 02:46:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="927770875"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="927770875"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Mar 2023 02:46:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pev39-000D8g-0T;
	Wed, 22 Mar 2023 09:46:31 +0000
Date: Wed, 22 Mar 2023 17:45:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:x86/shstk 20/40] arch/x86/mm/pgtable.c:886 pte_mkwrite() warn:
 bitwise AND condition is false here
Message-ID: <202303221730.usl3ok51-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Rick Edgecombe <rick.p.edgecombe@intel.com>
CC: Dave Hansen <dave.hansen@linux.intel.com>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/shstk
head:   b642e9e5f0dc797f543b431d4ba910a3da72a074
commit: a1d44091f03ed23e7e137eaeea3424996c7d72eb [20/40] x86/mm: Teach pte_mkwrite() about stack memory
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230322/202303221730.usl3ok51-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303221730.usl3ok51-lkp@intel.com/

New smatch warnings:
arch/x86/mm/pgtable.c:886 pte_mkwrite() warn: bitwise AND condition is false here
arch/x86/mm/pgtable.c:899 pmd_mkwrite() warn: bitwise AND condition is false here

Old smatch warnings:
arch/x86/mm/pgtable.c:281 pgd_mop_up_pmds() warn: we never enter this loop
arch/x86/mm/pgtable.c:305 pgd_prepopulate_pmd() warn: we never enter this loop

vim +886 arch/x86/mm/pgtable.c

a1d44091f03ed2 Rick Edgecombe 2023-03-18  883  
a1d44091f03ed2 Rick Edgecombe 2023-03-18  884  pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma)
a1d44091f03ed2 Rick Edgecombe 2023-03-18  885  {
a1d44091f03ed2 Rick Edgecombe 2023-03-18 @886  	if (vma->vm_flags & VM_SHADOW_STACK)
a1d44091f03ed2 Rick Edgecombe 2023-03-18  887  		return pte_mkwrite_shstk(pte);
a1d44091f03ed2 Rick Edgecombe 2023-03-18  888  
a1d44091f03ed2 Rick Edgecombe 2023-03-18  889  	pte = pte_mkwrite_kernel(pte);
a1d44091f03ed2 Rick Edgecombe 2023-03-18  890  
a1d44091f03ed2 Rick Edgecombe 2023-03-18  891  	if (pte_dirty(pte))
a1d44091f03ed2 Rick Edgecombe 2023-03-18  892  		pte = pte_clear_saveddirty(pte);
a1d44091f03ed2 Rick Edgecombe 2023-03-18  893  
a1d44091f03ed2 Rick Edgecombe 2023-03-18  894  	return pte;
a1d44091f03ed2 Rick Edgecombe 2023-03-18  895  }
a1d44091f03ed2 Rick Edgecombe 2023-03-18  896  
a1d44091f03ed2 Rick Edgecombe 2023-03-18  897  pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma)
a1d44091f03ed2 Rick Edgecombe 2023-03-18  898  {
a1d44091f03ed2 Rick Edgecombe 2023-03-18 @899  	if (vma->vm_flags & VM_SHADOW_STACK)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
