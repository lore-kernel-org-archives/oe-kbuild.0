Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730A920EC
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Feb 2023 12:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677413879; x=1708949879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5nHYxC2JZ1qsjfbJNH77Jy5lXusDg8kNnaMTBtONscY=;
  b=aSW/KVjbi1n5XifvqhUODaxDQbLHYJAmybsVzwwyb+cKED6P/EHy8jbZ
   YgPkCUdeVy3Hv8+0dpsjWk+E6mLE22bOTqYkxA9/ySRKstG2+dwnDzE9D
   d3HBXARq4o8U0wsjQhPGLThvwnd3eIqjVrUppXrLAOjDb73DYZT1ugEv9
   yiZbOTVr0BwTNZB3PA5cScWOfgkI9p3Dslf6kJqU72jDmNQH3ctMl179j
   0OQqD7EBC0dKfFuDgr3QHUmz7e2g6TEe4hEqbjG6SHeztOy8Um84cnJ1N
   1ODWcv4y/NNNcO+WB1ARXXHmcyjd5IghkJWx2pDwYL7IyVEBFNcXPTp8G
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="419975782"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="419975782"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 04:17:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="623265416"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="623265416"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 26 Feb 2023 04:17:57 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWFyW-0003k7-3C;
	Sun, 26 Feb 2023 12:17:56 +0000
Date: Sun, 26 Feb 2023 20:17:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split 11/30]
 arch/hexagon/include/asm/page.h: asm/mem-layout.h is included more than
 once.
Message-ID: <202302262038.UXo9ljvP-lkp@intel.com>
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
commit: 00b68620a99582d03ba1c5430d474963f31b575e [11/30] Hexagon: Make pfn accessors statics inlines
:::::: branch date: 2 days ago
:::::: commit date: 6 weeks ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302262038.UXo9ljvP-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/hexagon/include/asm/page.h: asm/mem-layout.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
