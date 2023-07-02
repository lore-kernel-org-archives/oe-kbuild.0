Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B63D191
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Jul 2023 00:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688256267; x=1719792267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mG4bW/Jkic+sMfWpK1ZRzF6HcNPKQ02yF11rE7gfPT4=;
  b=m6q8c8lLUlFUSVl1fr4gCskJHxV2mq/fXS9pdEye4i79lxOmAI7ax6Xc
   M4TXsT7Yu371+747wADvRbcVBHetnJn7M2TwFqUUdPOsZMUsVsVt8DYk9
   gvORVzITFTguGhKdJefU3Z/knde4drAzYwoQA/AMAPYzFTxnvCw/f9a3x
   mPcchiGfLq7bUDzeN79O50Cwze+uWw1YuBCDsExxZh+o69XgkDopLKF+i
   4nJOeytcentJfulYnH84JQgO2euGzRe2EuM7y4YCMClxtIdiIla95AJlr
   md5KXJCyrxUPEqjCoIg44YM+RRsECIhXnPH2i34FnmGI2wYIHM2a3YMMY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10758"; a="365218526"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="365218526"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2023 17:04:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10758"; a="1048645523"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; 
   d="scan'208";a="1048645523"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Jul 2023 17:04:24 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFkZj-000GLB-2l;
	Sun, 02 Jul 2023 00:04:23 +0000
Date: Sun, 2 Jul 2023 08:04:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /tmp/ccEmJcDd.s:357: Error: invalid literal constant: pool needs to
 be closer
Message-ID: <202307020725.d66WUNFs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: /tmp/ccEmJcDd.s:357: Error: invalid literal constant: pool needs to be closer"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dfab92f27c600fea3cadc6e2cb39f092024e1fef
commit: 09f6b27d5ddd9ad0ec096d1b0f8decdacc70f0f8 ARM: dove: multiplatform support
date:   1 year, 3 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 1 year, 3 months ago
config: arm-randconfig-r092-20230702 (https://download.01.org/0day-ci/archive/20230702/202307020725.d66WUNFs-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230702/202307020725.d66WUNFs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307020725.d66WUNFs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/topology.h:33,
                    from include/linux/irq.h:19,
                    from include/asm-generic/hardirq.h:17,
                    from arch/arm/include/asm/hardirq.h:10,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/trace_recursion.h:5,
                    from include/linux/ftrace.h:10,
                    from include/linux/kprobes.h:28,
                    from arch/arm/probes/kprobes/core.c:17:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1404:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1404 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1390:27: note: 'mem_section' declared here
    1390 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   /tmp/ccEmJcDd.s: Assembler messages:
>> /tmp/ccEmJcDd.s:357: Error: invalid literal constant: pool needs to be closer

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
