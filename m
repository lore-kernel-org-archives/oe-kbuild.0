Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8B8210B
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Nov 2023 23:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GjcI2w25"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699398242; x=1730934242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nm43T0HB6HytrOzoZG6Go/gxmX1z9RSnCI4IzFL2eK4=;
  b=GjcI2w25ZoOfWR+qT9eDN3sLFBdxP59n/45f81jZIh4WI42sHc7XyAzv
   JCCOUHOlhMg8xH3bba3AorIz3/21XJ84rqEuym3rQTr56C5eKUE00iRRp
   JbkeBy7uIaEqUTDezenZ3xl6kbT7iWjDsu/ukQyYieSvi+cniirM/9XYM
   kNo7uUQK9EkIy8UPstEmDoOhaD0mELwYWwbvNgceuXW2CiqKlmkLpmqIo
   rfjMXdx4SS3h81r701DTdhxQawnh5N90phR5KCeL0Ca433pzf39EpXUbv
   D8kzlzD+EvuNwh+IP8eSxKCxNxPsZ19SDL+GWwMAOom3JClJgcIa3iKwq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="8294047"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="8294047"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 15:04:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="1010072955"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="1010072955"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Nov 2023 15:03:59 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0V6z-0007Sp-1K;
	Tue, 07 Nov 2023 23:03:57 +0000
Date: Wed, 8 Nov 2023 07:02:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/dsa/sja1105/sja1105_main.c:505 sja1105_init_avb_params()
 warn: is 'table->entries' large enough for 'struct
 sja1105_avb_params_entry'? 1
Message-ID: <202311080652.OG3NH2mG-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Vladimir Oltean <vladimir.oltean@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   13d88ac54ddd1011b6e94443958e798aa06eb835
commit: 79d5511cc0eedbb2e49b543507d795f927db311b net: dsa: sja1105: unconditionally set DESTMETA and SRCMETA in AVB table
date:   3 years, 8 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 3 years, 8 months ago
config: i386-randconfig-141-20231030 (https://download.01.org/0day-ci/archive/20231108/202311080652.OG3NH2mG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231108/202311080652.OG3NH2mG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311080652.OG3NH2mG-lkp@intel.com/

New smatch warnings:
drivers/net/dsa/sja1105/sja1105_main.c:505 sja1105_init_avb_params() warn: is 'table->entries' large enough for 'struct sja1105_avb_params_entry'? 1

Old smatch warnings:
drivers/net/dsa/sja1105/sja1105_main.c:186 sja1105_init_mii_settings() warn: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 1
drivers/net/dsa/sja1105/sja1105_main.c:189 sja1105_init_mii_settings() warn: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 1
drivers/net/dsa/sja1105/sja1105_main.c:195 sja1105_init_mii_settings() warn: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 1
drivers/net/dsa/sja1105/sja1105_main.c:200 sja1105_init_mii_settings() warn: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 1
drivers/net/dsa/sja1105/sja1105_main.c:1640 sja1105_static_config_reload() warn: bitwise AND condition is false here

vim +505 drivers/net/dsa/sja1105/sja1105_main.c

8aa9ebccae8762 Vladimir Oltean 2019-05-02  481  
79d5511cc0eedb Vladimir Oltean 2020-03-24  482  static int sja1105_init_avb_params(struct sja1105_private *priv)
79d5511cc0eedb Vladimir Oltean 2020-03-24  483  {
79d5511cc0eedb Vladimir Oltean 2020-03-24  484  	struct sja1105_avb_params_entry *avb;
79d5511cc0eedb Vladimir Oltean 2020-03-24  485  	struct sja1105_table *table;
79d5511cc0eedb Vladimir Oltean 2020-03-24  486  
79d5511cc0eedb Vladimir Oltean 2020-03-24  487  	table = &priv->static_config.tables[BLK_IDX_AVB_PARAMS];
79d5511cc0eedb Vladimir Oltean 2020-03-24  488  
79d5511cc0eedb Vladimir Oltean 2020-03-24  489  	/* Discard previous AVB Parameters Table */
79d5511cc0eedb Vladimir Oltean 2020-03-24  490  	if (table->entry_count) {
79d5511cc0eedb Vladimir Oltean 2020-03-24  491  		kfree(table->entries);
79d5511cc0eedb Vladimir Oltean 2020-03-24  492  		table->entry_count = 0;
79d5511cc0eedb Vladimir Oltean 2020-03-24  493  	}
79d5511cc0eedb Vladimir Oltean 2020-03-24  494  
79d5511cc0eedb Vladimir Oltean 2020-03-24  495  	table->entries = kcalloc(SJA1105_MAX_AVB_PARAMS_COUNT,
79d5511cc0eedb Vladimir Oltean 2020-03-24  496  				 table->ops->unpacked_entry_size, GFP_KERNEL);
79d5511cc0eedb Vladimir Oltean 2020-03-24  497  	if (!table->entries)
79d5511cc0eedb Vladimir Oltean 2020-03-24  498  		return -ENOMEM;
79d5511cc0eedb Vladimir Oltean 2020-03-24  499  
79d5511cc0eedb Vladimir Oltean 2020-03-24  500  	table->entry_count = SJA1105_MAX_AVB_PARAMS_COUNT;
79d5511cc0eedb Vladimir Oltean 2020-03-24  501  
79d5511cc0eedb Vladimir Oltean 2020-03-24  502  	avb = table->entries;
79d5511cc0eedb Vladimir Oltean 2020-03-24  503  
79d5511cc0eedb Vladimir Oltean 2020-03-24  504  	/* Configure the MAC addresses for meta frames */
79d5511cc0eedb Vladimir Oltean 2020-03-24 @505  	avb->destmeta = SJA1105_META_DMAC;
79d5511cc0eedb Vladimir Oltean 2020-03-24  506  	avb->srcmeta  = SJA1105_META_SMAC;
79d5511cc0eedb Vladimir Oltean 2020-03-24  507  
79d5511cc0eedb Vladimir Oltean 2020-03-24  508  	return 0;
79d5511cc0eedb Vladimir Oltean 2020-03-24  509  }
79d5511cc0eedb Vladimir Oltean 2020-03-24  510  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
