Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE9B1118B
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Jul 2023 10:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690539911; x=1722075911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G05ZPEddqdtud9eD4oQEnkNoFBH+dmMdfiUpI/+/IN0=;
  b=G8v64ah/FywpF5V7+dHS4xqnxY3yix4a/OAVsf/2hh2tvhee0xhZGEqz
   QbQTJVF0dbH89FkOln3h/cy7p3rrp8tlRvyGKwhD9/pRTMa5Nz3CgdIj5
   EyIKPbkbn2/7iDcTSCfeS7hCx/ec0YafvIn10OYLYbT2BwXZVZLalWgWi
   /aeo0eH2Is9MEjqqao0mVGv3J05peJ8VYBgUoBHnIrDZU9D6E5uNAWI0N
   OAftK+mvDyDhYH1sw96WvVLqiuQ2v6Yk14L58uPlp27ZYNbhTwzlXE4Tz
   XJ39BUJB4z/6736spz15WYeYHPQoLyBdUvXPbfJfeM8MNVhLk1dVveUw/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="434844512"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="434844512"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 03:25:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="704503781"
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200"; 
   d="scan'208";a="704503781"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 28 Jul 2023 03:25:09 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPKei-00035n-2p;
	Fri, 28 Jul 2023 10:25:08 +0000
Date: Fri, 28 Jul 2023 18:25:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202307281858.Z5bry3r7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/hid/hid-nintendo.c:1568:32: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>
References: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
TO: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
TO: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
TO: "'Christoph Hellwig'" <hch@infradead.org>
TO: "'Jason A. Donenfeld'" <Jason@zx2c4.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.5-rc3 next-20230728]
[cannot apply to next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Allow-min-max-clamp-if-the-arguments-have-the-same-signedness/20230725-204940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/a09512c8526b46759669d0b879144563%40AcuMS.aculab.com
patch subject: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the arguments have the same signedness.
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: sparc-randconfig-r091-20230727 (https://download.01.org/0day-ci/archive/20230728/202307281858.Z5bry3r7-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307281858.Z5bry3r7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307281858.Z5bry3r7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hid/hid-nintendo.c:1568:32: sparse: sparse: bad integer constant expression
>> drivers/hid/hid-nintendo.c:1568:32: sparse: sparse: static assertion failed: "clamp() low limit JOYCON_MIN_RUMBLE_LOW_FREQ greater than high limit JOYCON_MAX_RUMBLE_LOW_FREQ"
   drivers/hid/hid-nintendo.c:1571:32: sparse: sparse: bad integer constant expression
>> drivers/hid/hid-nintendo.c:1571:32: sparse: sparse: static assertion failed: "clamp() low limit JOYCON_MIN_RUMBLE_HIGH_FREQ greater than high limit JOYCON_MAX_RUMBLE_HIGH_FREQ"
   drivers/hid/hid-nintendo.c:1574:32: sparse: sparse: bad integer constant expression
   drivers/hid/hid-nintendo.c:1574:32: sparse: sparse: static assertion failed: "clamp() low limit JOYCON_MIN_RUMBLE_LOW_FREQ greater than high limit JOYCON_MAX_RUMBLE_LOW_FREQ"
   drivers/hid/hid-nintendo.c:1577:32: sparse: sparse: bad integer constant expression
   drivers/hid/hid-nintendo.c:1577:32: sparse: sparse: static assertion failed: "clamp() low limit JOYCON_MIN_RUMBLE_HIGH_FREQ greater than high limit JOYCON_MAX_RUMBLE_HIGH_FREQ"
--
>> sound/pci/emu10k1/emuproc.c:370:17: sparse: sparse: bad integer constant expression
>> sound/pci/emu10k1/emuproc.c:370:17: sparse: sparse: static assertion failed: "clamp() low limit 0 greater than high limit nspaces"

vim +1568 drivers/hid/hid-nintendo.c

c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11  1562  
c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11  1563  static void joycon_clamp_rumble_freqs(struct joycon_ctlr *ctlr)
c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11  1564  {
c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11  1565  	unsigned long flags;
c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11  1566  
c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11  1567  	spin_lock_irqsave(&ctlr->lock, flags);
c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11 @1568  	ctlr->rumble_ll_freq = clamp(ctlr->rumble_ll_freq,
c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11  1569  				     JOYCON_MIN_RUMBLE_LOW_FREQ,
c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11  1570  				     JOYCON_MAX_RUMBLE_LOW_FREQ);
c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11 @1571  	ctlr->rumble_lh_freq = clamp(ctlr->rumble_lh_freq,
c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11  1572  				     JOYCON_MIN_RUMBLE_HIGH_FREQ,
c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11  1573  				     JOYCON_MAX_RUMBLE_HIGH_FREQ);
c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11  1574  	ctlr->rumble_rl_freq = clamp(ctlr->rumble_rl_freq,
c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11  1575  				     JOYCON_MIN_RUMBLE_LOW_FREQ,
c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11  1576  				     JOYCON_MAX_RUMBLE_LOW_FREQ);
c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11  1577  	ctlr->rumble_rh_freq = clamp(ctlr->rumble_rh_freq,
c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11  1578  				     JOYCON_MIN_RUMBLE_HIGH_FREQ,
c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11  1579  				     JOYCON_MAX_RUMBLE_HIGH_FREQ);
c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11  1580  	spin_unlock_irqrestore(&ctlr->lock, flags);
c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11  1581  }
c4eae84feff3e6 Daniel J. Ogorchock 2021-09-11  1582  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
