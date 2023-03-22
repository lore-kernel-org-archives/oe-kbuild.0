Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1880EA0
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Mar 2023 00:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679444525; x=1710980525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BO2SEJuN9eirY7SqALzCfyVg8e3uR1bg4liDN0EvCzg=;
  b=fvvL4thpa0W40nWYT94EVCFeaNs7dYPRAXSLHDez0ebv9AHXT8SElv32
   SKJPVhVJyFELCIHct31qKMalRcKMMSV3GxBmatQQo+26v2ENikqYnqNe/
   +L3aG4PzYhP9FrQEsHArAQ55J9MEU5JwYCuzDCtvJuavBDLm+iS2xKXAc
   Jmb7uLEwIaU0NxeKyP8tAmCjll9PRsYhOBksYM0S3RnNnPWJUU/Zm5GQl
   3AMM9viHAA99+ofg2gzmW16BA8nOy/N/LsLRTmCUCoIldOnxBmZRRV+RP
   wb7+ejT2+CCOr1KN5rzKWPIUGabmAn/WbNdYflfD2+b5JZIwDrZ2Q1pnx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="340628074"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="340628074"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 17:22:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="927635682"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="927635682"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 21 Mar 2023 17:22:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pemEs-000Cao-1x;
	Wed, 22 Mar 2023 00:22:02 +0000
Date: Wed, 22 Mar 2023 08:21:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:x86/shstk 20/40] arch/x86/mm/pgtable.c:886 pte_mkwrite() warn:
 bitwise AND condition is false here
Message-ID: <202303220815.PvE3vjSP-lkp@intel.com>
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
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230322/202303220815.PvE3vjSP-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303220815.PvE3vjSP-lkp@intel.com/

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
