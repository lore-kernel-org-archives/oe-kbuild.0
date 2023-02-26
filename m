Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67C37B
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Feb 2023 08:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677399713; x=1708935713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EC5rqMQD7ZpVt20dbiEFzlC0nwWd1mYVwkrDQTnXXmE=;
  b=a2CZXwy70PnljL6ajHgDyewLE++XgbN7xKrzY8UHcxebMg4QPFvJE87B
   W3hBrVT3QFODgFi7Mr92f2Un7fSX/FdjvRUr3xwQf6isCmzjZEjJjj2zg
   Sp5XFxWHrPfBal3CzUvElOWBfTUwUuOtc8Sm878BAM2sXExjcNXPC9VZ8
   FzQeGWEnUzLL3zMC4icFgazd5hxl1FrIEu6+NuTh5/GJlbdtdVetHCXQS
   ooCCTouPDo6wSNayt8wyD3W2x5J84QlnmeGPvvyK9DAB4wiuU+7VN02f5
   qGokk3RyHtkwNs4fu/2Txi56Foo6QxT6gvb56ZB6GdkOY6YxXU6S+EPfa
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="321937140"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="321937140"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 00:21:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="666624320"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="666624320"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 26 Feb 2023 00:21:52 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWCI3-0003eB-24;
	Sun, 26 Feb 2023 08:21:51 +0000
Date: Sun, 26 Feb 2023 16:20:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split 7/30]
 arch/arm64/include/asm/memory.h: asm-generic/memory_model.h is included more
 than once.
Message-ID: <202302261608.NVfBDIOp-lkp@intel.com>
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
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
head:   35ac5a9a53d2554bda395cdfa3236d278715caac
commit: 6e863d123cc67f8fb660aa54f971a01ddc56b5b2 [7/30] arm64: memory: Make virt_to_pfn() a static inline
:::::: branch date: 2 days ago
:::::: commit date: 6 weeks ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302261608.NVfBDIOp-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/arm64/include/asm/memory.h: asm-generic/memory_model.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
