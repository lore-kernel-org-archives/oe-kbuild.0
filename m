Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5B41CF84
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Sep 2023 16:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694707233; x=1726243233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Av29HZQkTNBZTxu+4+8M8WBACNdB0vsezA/f850/Enk=;
  b=ETHLk7Oc+zWY2MfMUkRFnoxPmaixk07z6ZXWn37ALX2EJ7nCec3c8xWP
   I+rnfFPSKMGhwANlY3hiio1akmeMSOH3a7BAsExp3dtyI3rtoB+mEWLDD
   3GPDm7aTpS+DlxiceFen0GS4L5q08K3xVqOVW5XHfA2elC8/DxZJ8SxWl
   tAO8veZpQ9u/NCEje9ZT3gWOjTx7wOgtX9oXDikQUf54Wt1ejiURfIGuW
   oTTjj14KNSfK50Bla1cdAInKmuxLu5ljpnLnfBxrSvRlhsFrVX/1MuG66
   SUs1zxwSm7lPiSjVMIO1VmOAXtf73mXMTXbR83JdgTuX5O9l7sTm9gfaG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="369294435"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="369294435"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 09:00:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="747801005"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="747801005"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 14 Sep 2023 09:00:29 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgolX-0001mk-2F;
	Thu, 14 Sep 2023 16:00:27 +0000
Date: Fri, 15 Sep 2023 00:00:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/3] userfaultfd: UFFDIO_REMAP uABI
Message-ID: <202309142309.BK8T9rG6-lkp@intel.com>
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
In-Reply-To: <20230914152620.2743033-3-surenb@google.com>
References: <20230914152620.2743033-3-surenb@google.com>
TO: Suren Baghdasaryan <surenb@google.com>

Hi Suren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/userfaultfd-UFFDIO_REMAP-rmap-preparation/20230914-232739
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230914152620.2743033-3-surenb%40google.com
patch subject: [PATCH 2/3] userfaultfd: UFFDIO_REMAP uABI
:::::: branch date: 27 minutes ago
:::::: commit date: 27 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20230914/202309142309.BK8T9rG6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309142309.BK8T9rG6-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#66: fs/userfaultfd.c:2065:
+	BUG_ON(!ret);

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#225: mm/huge_memory.c:1991:
+	BUG_ON(!pmd_trans_huge(src_pmdval));

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#226: mm/huge_memory.c:1992:
+	BUG_ON(!pmd_none(dst_pmdval));

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#227: mm/huge_memory.c:1993:
+	BUG_ON(!spin_is_locked(src_ptl));

WARNING: Where possible, use lockdep_assert_held instead of assertions based on spin_is_locked
#227: mm/huge_memory.c:1993:
+	BUG_ON(!spin_is_locked(src_ptl));

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#230: mm/huge_memory.c:1996:
+	BUG_ON(src_addr & ~HPAGE_PMD_MASK);

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#231: mm/huge_memory.c:1997:
+	BUG_ON(dst_addr & ~HPAGE_PMD_MASK);

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#234: mm/huge_memory.c:2000:
+	BUG_ON(!PageHead(src_page));

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#235: mm/huge_memory.c:2001:
+	BUG_ON(!PageAnon(src_page));

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#279: mm/huge_memory.c:2045:
+	BUG_ON(!PageHead(src_page));

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#280: mm/huge_memory.c:2046:
+	BUG_ON(!PageAnon(src_page));

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#290: mm/huge_memory.c:2056:
+		BUG_ON(1);

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#423: mm/userfaultfd.c:929:
+	BUG_ON(pmd_none(*dst_pmd));

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#424: mm/userfaultfd.c:930:
+	BUG_ON(pmd_none(*src_pmd));

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#425: mm/userfaultfd.c:931:
+	BUG_ON(pmd_trans_huge(*dst_pmd));

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#426: mm/userfaultfd.c:932:
+	BUG_ON(pmd_trans_huge(*src_pmd));

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#519: mm/userfaultfd.c:1025:
+		BUG_ON(!folio_test_anon(src_folio));

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#531: mm/userfaultfd.c:1037:
+			BUG_ON(1);

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#603: mm/userfaultfd.c:1109:
+			BUG_ON(1);

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#717: mm/userfaultfd.c:1223:
+	BUG_ON(src_start & ~PAGE_MASK);

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#718: mm/userfaultfd.c:1224:
+	BUG_ON(dst_start & ~PAGE_MASK);

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#719: mm/userfaultfd.c:1225:
+	BUG_ON(len & ~PAGE_MASK);

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#722: mm/userfaultfd.c:1228:
+	BUG_ON(src_start + len <= src_start);

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#723: mm/userfaultfd.c:1229:
+	BUG_ON(dst_start + len <= dst_start);

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#800: mm/userfaultfd.c:1306:
+		BUG_ON(dst_addr >= dst_start + len);

WARNING: Prefer 'fallthrough;' over fallthrough comment
#846: mm/userfaultfd.c:1352:
+				/* Fall through */

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#920: mm/userfaultfd.c:1426:
+	BUG_ON(moved < 0);

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#921: mm/userfaultfd.c:1427:
+	BUG_ON(err > 0);

WARNING: Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants
#922: mm/userfaultfd.c:1428:
+	BUG_ON(!moved && !err);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
