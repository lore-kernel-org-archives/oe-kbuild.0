Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546666FD0
	for <oe-kbuild@lists.linux.dev>; Wed, 10 May 2023 20:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683751668; x=1715287668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5/VSPcGKBqlHwyU75vrwURODCSWjZr9bgZbIbSqPn2k=;
  b=UYIpAk+Jb3W6VzUv3mgMjFYkiyOFgbAMUKaf+sVbg+52ZEhObTIOgKiv
   pb5py7z/91NE7bJngtLXN21WO0KzLrc4d6m8z3tlS74WM5ChcZnqMQp23
   6js3oWU/n+KH9zWGPXI3V2d9mEVfeXLyt6hk9M11rOfCSo8SSOqFs4jqm
   bbo/Z8CShq7mV7UNq7sJ6/okvqXlgjSakyNNcQbjXGDKwlA0qsEeMMqaa
   LHg6+E1YM/OKWNdhMxXdorkQSrYL4MUUoiqA6GzrH6+3dD3z0SbDh6c54
   veACCV0IYFlrq/4Al401gMUc2W+h+FE3EY81GrrmfpS/OEwDgDmmX3WDr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="329936423"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="329936423"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 13:47:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="823674692"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="823674692"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 May 2023 13:47:46 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwqiv-0003Yq-10;
	Wed, 10 May 2023 20:47:45 +0000
Date: Thu, 11 May 2023 04:47:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] cfg80211: S1G rate information and calculations
Message-ID: <202305110435.EhEiLYWA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230504024923.1925530-1-gilad.itzkovitch@morsemicro.com>
References: <20230504024923.1925530-1-gilad.itzkovitch@morsemicro.com>
TO: Gilad Itzkovitch <gilad.itzkovitch@morsemicro.com>
TO: johannes@sipsolutions.net
CC: linux-wireless@vger.kernel.org
CC: quic_jjohnson@quicinc.com
CC: Gilad Itzkovitch <gilad.itzkovitch@morsemicro.com>

Hi Gilad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 28b17f6270f182e22cdad5a0fdc4979031e4486a]

url:    https://github.com/intel-lab-lkp/linux/commits/Gilad-Itzkovitch/cfg80211-S1G-rate-information-and-calculations/20230504-105056
base:   28b17f6270f182e22cdad5a0fdc4979031e4486a
patch link:    https://lore.kernel.org/r/20230504024923.1925530-1-gilad.itzkovitch%40morsemicro.com
patch subject: [PATCH] cfg80211: S1G rate information and calculations
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: microblaze-randconfig-m031-20230509 (https://download.01.org/0day-ci/archive/20230511/202305110435.EhEiLYWA-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305110435.EhEiLYWA-lkp@intel.com/

New smatch warnings:
net/wireless/util.c:1744 cfg80211_calculate_bitrate_s1g() error: buffer overflow 'base[idx]' 11 <= 11

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:85 current_thread_info() error: uninitialized symbol 'sp'.

vim +1744 net/wireless/util.c

cfb14110acf87b Veerendranath Jakkam 2022-02-14  1648  
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1649  static u32 cfg80211_calculate_bitrate_s1g(struct rate_info *rate)
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1650  {
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1651  	/* For 1, 2, 4, 8 and 16 MHz channels */
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1652  	static const u32 base[5][11] = {
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1653  		{  300000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1654  		   600000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1655  		   900000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1656  		  1200000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1657  		  1800000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1658  		  2400000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1659  		  2700000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1660  		  3000000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1661  		  3600000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1662  		  4000000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1663  		  /* MCS 10 supported in 1 MHz only */
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1664  		  150000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1665  		},
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1666  		{  650000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1667  		  1300000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1668  		  1950000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1669  		  2600000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1670  		  3900000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1671  		  5200000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1672  		  5850000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1673  		  6500000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1674  		  7800000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1675  		  /* MCS 9 not valid */
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1676  		},
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1677  		{  1350000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1678  		   2700000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1679  		   4050000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1680  		   5400000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1681  		   8100000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1682  		  10800000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1683  		  12150000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1684  		  13500000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1685  		  16200000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1686  		  18000000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1687  		},
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1688  		{  2925000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1689  		   5850000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1690  		   8775000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1691  		  11700000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1692  		  17550000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1693  		  23400000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1694  		  26325000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1695  		  29250000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1696  		  35100000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1697  		  39000000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1698  		},
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1699  		{  8580000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1700  		  11700000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1701  		  17550000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1702  		  23400000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1703  		  35100000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1704  		  46800000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1705  		  52650000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1706  		  58500000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1707  		  70200000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1708  		  78000000,
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1709  		},
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1710  	};
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1711  	u32 bitrate;
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1712  	/* default is 1 MHz index */
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1713  	int idx = 0;
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1714  
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1715  	if (rate->mcs > 11)
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1716  		goto warn;
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1717  
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1718  	switch (rate->bw) {
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1719  	case RATE_INFO_BW_16:
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1720  		idx = 4;
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1721  		break;
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1722  	case RATE_INFO_BW_8:
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1723  		idx = 3;
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1724  		break;
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1725  	case RATE_INFO_BW_4:
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1726  		idx = 2;
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1727  		break;
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1728  	case RATE_INFO_BW_2:
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1729  		idx = 1;
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1730  		break;
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1731  	case RATE_INFO_BW_1:
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1732  		idx = 0;
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1733  		break;
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1734  	case RATE_INFO_BW_5:
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1735  	case RATE_INFO_BW_10:
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1736  	case RATE_INFO_BW_20:
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1737  	case RATE_INFO_BW_40:
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1738  	case RATE_INFO_BW_80:
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1739  	case RATE_INFO_BW_160:
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1740  	default:
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1741  		goto warn;
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1742  	}
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1743  
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04 @1744  	bitrate = base[idx][rate->mcs];
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1745  	bitrate *= rate->nss;
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1746  
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1747  	if (rate->flags & RATE_INFO_FLAGS_SHORT_GI)
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1748  		bitrate = (bitrate / 9) * 10;
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1749  	/* do NOT round down here */
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1750  	return (bitrate + 50000) / 100000;
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1751  warn:
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1752  	WARN_ONCE(1, "invalid rate bw=%d, mcs=%d, nss=%d\n",
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1753  		  rate->bw, rate->mcs, rate->nss);
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1754  	return 0;
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1755  }
d973f1b0d4a136 Gilad Itzkovitch     2023-05-04  1756  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
