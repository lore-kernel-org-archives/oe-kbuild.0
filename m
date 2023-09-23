Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054B37F9
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Sep 2023 05:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695447650; x=1726983650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o1k61xH7PFFUpV5Emk2swvB2GAl8grHQFjQOSipPLzY=;
  b=WHqzUkfrA4DOtKdleGK1aUrigPLZR1aPF+O01Qxe++b8Z9PrjeKVIHCK
   YN2URPh4FJtJulwvwz2D42RFuFS3Doyd5dFT8+R21S157Efjj9TquzN6Q
   DtO8ud2JjBaTLehaafivwljUmnhlc215qstwqSqz18TyuY/QQPe0eTsML
   wFTlROldl81au7XWuwfcdahfNqpWXZT+SLGnsKyIQQXEacOnVde5PWWU6
   UfR/Pns1y5mvCcw7ne1/Hgb5ZCvMkcud4ENkx2Br480WSclKm7755C3uu
   fYWdC4htdsvy0PX3x6FprWdesOrudxVTue+0UzuFATFHw+i7YqSiQwLRG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="366049017"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="366049017"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2023 22:40:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="697438146"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; 
   d="scan'208";a="697438146"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 22 Sep 2023 22:40:48 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjvNl-0001pP-2C;
	Sat, 23 Sep 2023 05:40:45 +0000
Date: Sat, 23 Sep 2023 13:39:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/3] userfaultfd: UFFDIO_REMAP uABI
Message-ID: <202309231327.hct9ErwZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "checkpatch"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230923013148.1390521-3-surenb@google.com>
References: <20230923013148.1390521-3-surenb@google.com>
TO: Suren Baghdasaryan <surenb@google.com>

Hi Suren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/userfaultfd-UFFDIO_REMAP-rmap-preparation/20230923-093351
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230923013148.1390521-3-surenb%40google.com
patch subject: [PATCH v2 2/3] userfaultfd: UFFDIO_REMAP uABI
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20230923/202309231327.hct9ErwZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309231327.hct9ErwZ-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#79: fs/userfaultfd.c:2078:
+	BUG_ON(!ret);

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#233: mm/huge_memory.c:1987:
+	BUG_ON(!spin_is_locked(src_ptl));

WARNING: Where possible, use lockdep_assert_held instead of assertions based on spin_is_locked
#233: mm/huge_memory.c:1987:
+	BUG_ON(!spin_is_locked(src_ptl));

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#237: mm/huge_memory.c:1991:
+	BUG_ON(!pmd_trans_huge(src_pmdval));

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#238: mm/huge_memory.c:1992:
+	BUG_ON(!pmd_none(dst_pmdval));

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#239: mm/huge_memory.c:1993:
+	BUG_ON(src_addr & ~HPAGE_PMD_MASK);

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#240: mm/huge_memory.c:1994:
+	BUG_ON(dst_addr & ~HPAGE_PMD_MASK);

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#292: mm/huge_memory.c:2046:
+	BUG_ON(!folio_test_head(src_folio));

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#293: mm/huge_memory.c:2047:
+	BUG_ON(!folio_test_anon(src_folio));

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#417: mm/userfaultfd.c:902:
+	BUG_ON(!folio_test_anon(src_folio));

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#523: mm/userfaultfd.c:1008:
+	BUG_ON(pmd_none(*dst_pmd));

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#524: mm/userfaultfd.c:1009:
+	BUG_ON(pmd_none(*src_pmd));

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#525: mm/userfaultfd.c:1010:
+	BUG_ON(pmd_trans_huge(*dst_pmd));

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#526: mm/userfaultfd.c:1011:
+	BUG_ON(pmd_trans_huge(*src_pmd));

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#790: mm/userfaultfd.c:1275:
+	BUG_ON(src_start & ~PAGE_MASK);

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#791: mm/userfaultfd.c:1276:
+	BUG_ON(dst_start & ~PAGE_MASK);

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#792: mm/userfaultfd.c:1277:
+	BUG_ON(len & ~PAGE_MASK);

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#795: mm/userfaultfd.c:1280:
+	BUG_ON(src_start + len <= src_start);

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#796: mm/userfaultfd.c:1281:
+	BUG_ON(dst_start + len <= dst_start);

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#835: mm/userfaultfd.c:1320:
+		BUG_ON(dst_addr >= dst_start + len);

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#945: mm/userfaultfd.c:1430:
+	BUG_ON(moved < 0);

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#946: mm/userfaultfd.c:1431:
+	BUG_ON(err > 0);

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#947: mm/userfaultfd.c:1432:
+	BUG_ON(!moved && !err);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
