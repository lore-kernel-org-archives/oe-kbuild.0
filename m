Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59F11C27
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Oct 2022 20:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666902595; x=1698438595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3zwCyQDJnCe6XyOgPs0F4dlX90iVxIYn2Zsn9hhlY+U=;
  b=X74g5DJgbiQUt0a0SLlOiq+YYXuHpEOzWPCYHp7mk/h9XfrrCqYFiGL1
   9T+nXH94VaJppBN0/vTcD8kBnM1Z2UArWbPkoH2DNT2wN42cIy+hp0Z0c
   xNRLgDhtDl2e3b2N7NFPO5qtRlD6Gy5ufRrkvRR2NLP4dZU5uAiDsnGiU
   yfnbTUAXnj5/k0WOdi8Rrs7KLv6B8rKYIZWj8cN4KEx7vxBrDpyEGkd0a
   8DSKrswgkwyG06a3zez8J01mXCj899Tx4EeGvDZ501vy52HgcPMOH9wI7
   DLHkUqd+/Ok9RimgBnzS+d44HEQZ7RHz6WXzLS1PsvyTmX5ASJXXsfz92
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="295744412"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; 
   d="scan'208";a="295744412"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2022 13:29:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="583688932"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; 
   d="scan'208";a="583688932"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 27 Oct 2022 13:29:49 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oo9Vc-00099B-2a;
	Thu, 27 Oct 2022 20:29:48 +0000
Date: Fri, 28 Oct 2022 04:29:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:kernel-in-vmalloc-v6.1-rc1-just-ttbr0-split 7/27]
 arch/arm64/include/asm/memory.h: asm-generic/memory_model.h is included more
 than once.
Message-ID: <202210280418.1hkjDusW-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.1-rc1-just-ttbr0-split
head:   8a91d11f9adbeb4d1b408837ae134e5b0a371050
commit: a012d8bcd245d06442e892b7ceba211d02b3269a [7/27] arm64: memory: Make virt_to_pfn() a static inline
:::::: branch date: 6 hours ago
:::::: commit date: 9 days ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> arch/arm64/include/asm/memory.h: asm-generic/memory_model.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
