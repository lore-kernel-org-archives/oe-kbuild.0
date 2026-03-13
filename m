Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2A931F9A8
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Mar 2026 08:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773388874; cv=none; b=N+4MP9yTZJW1MiPAgiccm8DhM/T3nzpUOyAh6YNczzp+Wdf5zzn1RTLebgsr1ydNSMI9JNNgol7lqfiiDj6wnvucWc8hPrCIIbj0l48k7zDsH0DjR9tc0TN54RAiiqBWsR4fypyG3R6ylZuP65q8dmCpRT0vDhe83SJo3iRz1vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773388874; c=relaxed/simple;
	bh=HtbSf3jJ6tuMRoIjDWm/KSy24JaElXHFGu2xvpCwUkY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XP0WMhgQyyGYFZ6jXCLxO2QVKmUm58f/VRpfB9VPWVRlm6/Pt8TyT2hl9GfsA7TLDfnhLOI+zOVc6d4WJcDFExsKFK7bOWnUC+nu1vn2peMJJwXnssJVcDPpRfOobjxguh1++6EfBao00idAAtV23ReNSgqAH56e50AbM4Eca3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=enOVcAi8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="enOVcAi8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773388873; x=1804924873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HtbSf3jJ6tuMRoIjDWm/KSy24JaElXHFGu2xvpCwUkY=;
  b=enOVcAi8JfMRe+hctwvoiRBfRLqGkUSj+K1wCXDh7HTP5X3JIQ/Pl8Ss
   CpfqliGjXqAYpd4fKA7nITFgwoL6S4vDg1QouiEqg5S9Z1F2eJmhofKyb
   JrVghyLqq7F5xDITy9SQbN4GI9vpqB1YZaD/CWi0K9W+aEBvzrhximcgZ
   6DSG3YY92Sv6rY/24tMnCUF/RMmPhXvKDbgymOLkPHN2fJ7AcAMPZdQE3
   VO6G3XtzP0f4dZVsDOpjmPfJEVBHmBO13u+Uio4FJnJyoRVBLOXNtDWEW
   HjDbAspPx5s7ivxSAjDcO3uBF3QMSz4dbph7wpO3QdFIg7U7yOZguZl8M
   A==;
X-CSE-ConnectionGUID: PqYqfkakTOuS1Cys23u4WQ==
X-CSE-MsgGUID: gKaV2nQrQYySNSjjDnQuXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85974370"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="85974370"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 01:01:12 -0700
X-CSE-ConnectionGUID: pE28Y8N0TRicxxVfbEXQ2Q==
X-CSE-MsgGUID: Wa919/n9RuOelJuB5b0jBg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 13 Mar 2026 01:01:11 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0xSH-000000003dr-1PQw;
	Fri, 13 Mar 2026 08:01:09 +0000
Date: Fri, 13 Mar 2026 09:00:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/2] lib/idr: fix memory leak in ida_alloc_range()
 error path
Message-ID: <202603130809.cCY2uVmK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260312181948.20020-3-objecting@objecting.org>
References: <20260312181948.20020-3-objecting@objecting.org>
TO: Josh Law <hlcj1234567@gmail.com>
TO: Matthew Wilcox <willy@infradead.org>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: linux-fsdevel@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Josh Law <objecting@objecting.org>

Hi Josh,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on akpm-mm/mm-everything linus/master v7.0-rc3 next-20260312]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Josh-Law/lib-idr-fix-infinite-loop-in-idr_get_next/20260313-143607
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20260312181948.20020-3-objecting%40objecting.org
patch subject: [PATCH v3 2/2] lib/idr: fix memory leak in ida_alloc_range() error path
:::::: branch date: 74 minutes ago
:::::: commit date: 74 minutes ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260313/202603130809.cCY2uVmK-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260313/202603130809.cCY2uVmK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603130809.cCY2uVmK-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   idr-test.c: In function 'user_ida_checks':
>> idr-test.c:546:9: error: implicit declaration of function 'ida_check_leak'; did you mean 'ida_check_leaf'? [-Wimplicit-function-declaration]
     546 |         ida_check_leak();
         |         ^~~~~~~~~~~~~~
         |         ida_check_leaf
   idr-test.c: At top level:
>> idr-test.c:563:13: warning: conflicting types for 'ida_check_leak'; have 'void(void)'
     563 | static void ida_check_leak(void)
         |             ^~~~~~~~~~~~~~
>> idr-test.c:563:13: error: static declaration of 'ida_check_leak' follows non-static declaration
   idr-test.c:546:9: note: previous implicit declaration of 'ida_check_leak' with type 'void(void)'
     546 |         ida_check_leak();
         |         ^~~~~~~~~~~~~~
>> idr-test.c:563:13: warning: 'ida_check_leak' defined but not used [-Wunused-function]
     563 | static void ida_check_leak(void)
         |             ^~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
