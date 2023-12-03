Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B765FA3B
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 06:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sh4S2LfK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585173; x=1733121173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1wzGkp9xTAroRHE38YlNLNJm/lpX1xj8rLWbR0PW/ZI=;
  b=Sh4S2LfK9iblm9jHufTRJl2RQ32925j/FjkGmru2/6egObKg3pXSGscZ
   z2HdNLxxgKzxNPn9J020X0kKw2vm2q7SjvluJ18BN3f1oWyDV5x7lrpEB
   XJXjbNDuyIcqomGLCGuwAVI5AmJ3dOPBAVOkaydVRPSCtwy0igEAsM6Mx
   343jWzlGvtFQ0XO+dFf17jIXwYyjtSOEtNE3oLJB8tlT0nXIJSg8CpYi7
   TsVYCAFO/BO05ohvl9ZxVSlGDmQDUl1bnQ1aPmYQwyA7pUgnl0a+fTKq9
   rHd92iOP5j8b5B3k0NBRVblQxUn68hQwRZbdM/JQ5MlhgvW5JhZ/6HQm9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="6906507"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="6906507"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:32:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="770191175"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="770191175"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 02 Dec 2023 22:32:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g20-0006Lk-26;
	Sun, 03 Dec 2023 06:32:44 +0000
Date: Sun, 3 Dec 2023 14:31:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/dsa/sja1105/sja1105_main.c:505 sja1105_init_avb_params()
 warn: is 'table->entries' large enough for 'struct
 sja1105_avb_params_entry'? 1
Message-ID: <202312030842.0cTtKdJg-lkp@intel.com>
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
head:   815fb87b753055df2d9e50f6cd80eb10235fe3e9
commit: 79d5511cc0eedbb2e49b543507d795f927db311b net: dsa: sja1105: unconditionally set DESTMETA and SRCMETA in AVB table
date:   3 years, 8 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 3 years, 8 months ago
config: i386-randconfig-141-20231030 (https://download.01.org/0day-ci/archive/20231203/202312030842.0cTtKdJg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312030842.0cTtKdJg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312030842.0cTtKdJg-lkp@intel.com/

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
