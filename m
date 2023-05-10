Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1B93D60
	for <oe-kbuild@lists.linux.dev>; Wed, 10 May 2023 17:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683740622; x=1715276622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xcz/Hy4MG+LoDUE1/JICLjcSh2vGXGwnDJ3Y1d88cig=;
  b=XoACvM8DxGrLEA8W1mZpLmsrwUX9tmG2Ag7YUOkyoXJ7Khm4Wv0QaO8n
   v0TtCgb4pKYmOQSla08dblWeu8Cdo97ZgLpOM6hi/rOh+C6ufCvsu+Afb
   mk6CRZanR9ErJgA9HrvF+uGzyXY1P9WIdiR3guVV+5a/QfETxDS6rLbYU
   bs2Xnuc9Lm571dq6/bDjGHUEWJPTW+aGfhzfm9RgiUdV3Ob70oR6+mbEP
   QDpRun/NcicUh6TgqfpOsSUroXwzeVOqY+0YjDpKfTYK7noIFImjtoj+v
   ZjOJS/esCl+Ti66NjxjhGnuUHEAE8k5iT3oVoNEyfe7c9pS/P/xZg7fXz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="329895827"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="329895827"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 10:43:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="676916660"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="676916660"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 10 May 2023 10:43:41 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwnqm-0003Tg-1e;
	Wed, 10 May 2023 17:43:40 +0000
Date: Thu, 11 May 2023 01:42:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/virt-to-pfn-v6-4-rc1 11/12]
 arch/arm64/include/asm/memory.h: asm-generic/memory_model.h is included more
 than once.
Message-ID: <202305110112.70JBwZ77-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/virt-to-pfn-v6-4-rc1
head:   2c9796d7393a139f2b658603859f3cb95f98fec6
commit: e9d83dd0dd653d3355fb5c7309ce964050c162ed [11/12] arm64: memory: Make virt_to_pfn() a static inline
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202305110112.70JBwZ77-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/arm64/include/asm/memory.h: asm-generic/memory_model.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
