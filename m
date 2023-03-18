Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414167494
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Mar 2023 22:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679176916; x=1710712916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bMRPLapwAVBn2BEVWCuo7Dor0GIfMyxVceyspD0ARMc=;
  b=YtYvvmFIV6EJbWvfcBtcneWKqSvIQ/VYCT91baj2R1j5aI+A4p7fGt3O
   fflnr0RFvSNibmrWvUuIUi4KtlVbVu5ttC6jRXHmHhQ1urGc8/lM8mpAC
   EkERPS+T4V0nuF7ZzUqIVUpLiIx2nicCzrFN/vcgaWMxmgC+orN7+sTJl
   ItcWROxITYlgUkMGjP9b0s6QHTM5uhtlr/1NYNPUWHiq7foN2JeqRzF9U
   dpB1Tmm2SPeTBzU3vEi8eKc6ljIp0TpGWzwB29fojfwej9zSD19xD4qHu
   TTHyQ9eBD7IAvt4xjhPUEmHGdkNiNNn+PaHYZAuf2Y1fuGeZkU5E4rBPZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="318864731"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="318864731"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 15:01:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="926534201"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="926534201"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 18 Mar 2023 15:01:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdecc-000AHm-10;
	Sat, 18 Mar 2023 22:01:54 +0000
Date: Sun, 19 Mar 2023 06:01:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
 11/31] arch/hexagon/include/asm/page.h: asm/mem-layout.h is included more
 than once.
Message-ID: <202303190507.Sbnb1jll-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
head:   961fd7e75191ae82383f80c1dfd97559f14965b8
commit: 00b68620a99582d03ba1c5430d474963f31b575e [11/31] Hexagon: Make pfn accessors statics inlines
:::::: branch date: 10 days ago
:::::: commit date: 9 weeks ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303190507.Sbnb1jll-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/hexagon/include/asm/page.h: asm/mem-layout.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
