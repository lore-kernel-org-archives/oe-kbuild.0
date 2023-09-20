Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE1B41A9B
	for <oe-kbuild@lists.linux.dev>; Wed, 20 Sep 2023 20:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695242596; x=1726778596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=en9uX0+fJyxCV3FNQ3Sgnq05BuGQYIAMKXuS9ubwN+g=;
  b=F2baai4vdixx72fE0nBLmE55FqBzFCm305FXtirbnm3Lty21evSO1ux+
   8Mv1EHHHKHYmJY6ktUpPQiJ+/oVV9s5jx+pGbFAHuFOlKihVMHlL8juRC
   9xzl62zl+yp3A/D8sIUBJV0QK8X8hI3eG7RY5mJbXiXv9MLUoCjKAiHlu
   6GrsqIpTO+mEmvARDruGuegczC4OdIFni6PZdR493t5rjdcIscFaT8mZ3
   VisiBDgLsT3OB+P0RGs0WodFC6pV9gkRfvmV64BIvERPImHlFH6E6D+8d
   kxG2MjT6//mWP0t3tt9aCabJmnepgI/kS2yOC2MLFJhU71MbZsvnMKseW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="359719573"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="359719573"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 13:43:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="740361233"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="740361233"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 20 Sep 2023 13:43:12 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qj42P-00098O-2f;
	Wed, 20 Sep 2023 20:43:09 +0000
Date: Thu, 21 Sep 2023 04:42:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next v4 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202309210403.Jjt9vT1Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2045:35: sparse: sparse: too long token expansion"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <fe7e6c542e094bfca655abcd323c1c98@AcuMS.aculab.com>
References: <fe7e6c542e094bfca655abcd323c1c98@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
CC: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
CC: "'Christoph Hellwig'" <hch@infradead.org>
CC: "'Jason A. Donenfeld'" <Jason@zx2c4.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linux/master]
[also build test WARNING on linus/master v6.6-rc2]
[cannot apply to next-20230918 next-20230920]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Add-umin-a-b-and-umax-a-b/20230918-162441
base:   linux/master
patch link:    https://lore.kernel.org/r/fe7e6c542e094bfca655abcd323c1c98%40AcuMS.aculab.com
patch subject: [PATCH next v4 2/5] minmax: Allow min()/max()/clamp() if the arguments have the same signedness.
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-062-20230920 (https://download.01.org/0day-ci/archive/20230921/202309210403.Jjt9vT1Z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309210403.Jjt9vT1Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309210403.Jjt9vT1Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2045:35: sparse: sparse: too long token expansion
>> drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2045:35: sparse: sparse: too long token expansion
   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:4543:32: sparse: sparse: too long token expansion
   drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:4543:32: sparse: sparse: too long token expansion
--
>> drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c:3247:28: sparse: sparse: too long token expansion
>> drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c:3247:28: sparse: sparse: too long token expansion
--
>> drivers/net/wireless/ath/ath11k/mac.c:4701:15: sparse: sparse: too long token expansion
>> drivers/net/wireless/ath/ath11k/mac.c:4701:15: sparse: sparse: too long token expansion
   drivers/net/wireless/ath/ath11k/mac.c:8381:23: sparse: sparse: too long token expansion
   drivers/net/wireless/ath/ath11k/mac.c:8381:23: sparse: sparse: too long token expansion
--
>> drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c:1133:29: sparse: sparse: too long token expansion
>> drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c:1133:29: sparse: sparse: too long token expansion
>> drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c:1133:29: sparse: sparse: too long token expansion
>> drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c:1133:29: sparse: sparse: too long token expansion

vim +2045 drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c

ec6ba945211b1c drivers/net/bnx2x/bnx2x_cmn.c                   Vladislav Zolotarov 2010-12-13  2021  
1191cb83489e6e drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c Eric Dumazet        2012-04-27  2022  static void bnx2x_set_rx_buf_size(struct bnx2x *bp)
a8c94b9188bf60 drivers/net/bnx2x/bnx2x_cmn.c                   Vladislav Zolotarov 2011-02-06  2023  {
a8c94b9188bf60 drivers/net/bnx2x/bnx2x_cmn.c                   Vladislav Zolotarov 2011-02-06  2024  	int i;
a8c94b9188bf60 drivers/net/bnx2x/bnx2x_cmn.c                   Vladislav Zolotarov 2011-02-06  2025  
a8c94b9188bf60 drivers/net/bnx2x/bnx2x_cmn.c                   Vladislav Zolotarov 2011-02-06  2026  	for_each_queue(bp, i) {
a8c94b9188bf60 drivers/net/bnx2x/bnx2x_cmn.c                   Vladislav Zolotarov 2011-02-06  2027  		struct bnx2x_fastpath *fp = &bp->fp[i];
e52fcb2462ac48 drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c Eric Dumazet        2011-11-14  2028  		u32 mtu;
a8c94b9188bf60 drivers/net/bnx2x/bnx2x_cmn.c                   Vladislav Zolotarov 2011-02-06  2029  
a8c94b9188bf60 drivers/net/bnx2x/bnx2x_cmn.c                   Vladislav Zolotarov 2011-02-06  2030  		/* Always use a mini-jumbo MTU for the FCoE L2 ring */
a8c94b9188bf60 drivers/net/bnx2x/bnx2x_cmn.c                   Vladislav Zolotarov 2011-02-06  2031  		if (IS_FCOE_IDX(i))
a8c94b9188bf60 drivers/net/bnx2x/bnx2x_cmn.c                   Vladislav Zolotarov 2011-02-06  2032  			/*
a8c94b9188bf60 drivers/net/bnx2x/bnx2x_cmn.c                   Vladislav Zolotarov 2011-02-06  2033  			 * Although there are no IP frames expected to arrive to
a8c94b9188bf60 drivers/net/bnx2x/bnx2x_cmn.c                   Vladislav Zolotarov 2011-02-06  2034  			 * this ring we still want to add an
a8c94b9188bf60 drivers/net/bnx2x/bnx2x_cmn.c                   Vladislav Zolotarov 2011-02-06  2035  			 * IP_HEADER_ALIGNMENT_PADDING to prevent a buffer
a8c94b9188bf60 drivers/net/bnx2x/bnx2x_cmn.c                   Vladislav Zolotarov 2011-02-06  2036  			 * overrun attack.
a8c94b9188bf60 drivers/net/bnx2x/bnx2x_cmn.c                   Vladislav Zolotarov 2011-02-06  2037  			 */
e52fcb2462ac48 drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c Eric Dumazet        2011-11-14  2038  			mtu = BNX2X_FCOE_MINI_JUMBO_MTU;
a8c94b9188bf60 drivers/net/bnx2x/bnx2x_cmn.c                   Vladislav Zolotarov 2011-02-06  2039  		else
e52fcb2462ac48 drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c Eric Dumazet        2011-11-14  2040  			mtu = bp->dev->mtu;
e52fcb2462ac48 drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c Eric Dumazet        2011-11-14  2041  		fp->rx_buf_size = BNX2X_FW_RX_ALIGN_START +
e52fcb2462ac48 drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c Eric Dumazet        2011-11-14  2042  				  IP_HEADER_ALIGNMENT_PADDING +
e1c6dccaf3af29 drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c Jarod Wilson        2016-10-17  2043  				  ETH_OVERHEAD +
e52fcb2462ac48 drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c Eric Dumazet        2011-11-14  2044  				  mtu +
e52fcb2462ac48 drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c Eric Dumazet        2011-11-14 @2045  				  BNX2X_FW_RX_ALIGN_END;
9b70de6d026688 drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c Scott Wood          2017-04-28  2046  		fp->rx_buf_size = SKB_DATA_ALIGN(fp->rx_buf_size);
16a5fd9265e757 drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c Yuval Mintz         2013-06-02  2047  		/* Note : rx_buf_size doesn't take into account NET_SKB_PAD */
d46d132cc0212e drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c Eric Dumazet        2012-12-10  2048  		if (fp->rx_buf_size + NET_SKB_PAD <= PAGE_SIZE)
d46d132cc0212e drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c Eric Dumazet        2012-12-10  2049  			fp->rx_frag_size = fp->rx_buf_size + NET_SKB_PAD;
d46d132cc0212e drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c Eric Dumazet        2012-12-10  2050  		else
d46d132cc0212e drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c Eric Dumazet        2012-12-10  2051  			fp->rx_frag_size = 0;
619c5cb6885b93 drivers/net/bnx2x/bnx2x_cmn.c                   Vlad Zolotarov      2011-06-14  2052  	}
a8c94b9188bf60 drivers/net/bnx2x/bnx2x_cmn.c                   Vladislav Zolotarov 2011-02-06  2053  }
619c5cb6885b93 drivers/net/bnx2x/bnx2x_cmn.c                   Vlad Zolotarov      2011-06-14  2054  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
