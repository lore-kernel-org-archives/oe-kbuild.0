Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD011843
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 06:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQuoeXCI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585176; x=1733121176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gXq29ir8R0SfiQ6rJmcU09j8cApLGW6TUQadANjQTAA=;
  b=hQuoeXCI8vay+R/YV3gCENa5pnSjaNTO0+WNJXsKdHYEjgdUlqwfmz6k
   f+UN7GmI0qVji6+NEl5w/aRfRQaEknJrLCaDuNdEkI/kBzK6Visc66ehe
   VpxGZ6n1y4FueK0tQgJ3ztRIJ73vkPBocgRJlUC5U4AMaJaKnqUAbtZ1G
   V1POgW6aG7o/0H0upyX6JYV90UGQ/6BZww9HnR7AzVD69gMx3blWIcGds
   KWNO/2GnuNz5PaRhY5wgjvlEInoB9ZGQAJzykcigAJEyS950DA4O4TaQS
   Q60DbDccCibLJzsyAzTzomcZirTkyIX62XTOqYgVOWoAMptgiy7tTjmZy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="6906523"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="6906523"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:32:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="770191182"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="770191182"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 02 Dec 2023 22:32:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g20-0006LY-1j;
	Sun, 03 Dec 2023 06:32:44 +0000
Date: Sun, 3 Dec 2023 14:32:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/dsa/sja1105/sja1105_main.c:493
 sja1105_init_l2_forwarding_params() warn: is 'table->entries' large enough
 for 'struct sja1105_l2_forwarding_params_entry'? 0
Message-ID: <202312031206.bbZUi0iq-lkp@intel.com>
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
head:   968f35f4ab1c0966ceb39af3c89f2e24afedf878
commit: 1bf658eefe38cc26801b5861bbb6dbf3259ba8c1 net: dsa: sja1105: allow the frame buffer size to be customized
date:   2 years, 6 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 2 years, 6 months ago
config: i386-randconfig-141-20231030 (https://download.01.org/0day-ci/archive/20231203/202312031206.bbZUi0iq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312031206.bbZUi0iq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312031206.bbZUi0iq-lkp@intel.com/

New smatch warnings:
drivers/net/dsa/sja1105/sja1105_main.c:493 sja1105_init_l2_forwarding_params() warn: is 'table->entries' large enough for 'struct sja1105_l2_forwarding_params_entry'? 0

Old smatch warnings:
drivers/net/dsa/sja1105/sja1105_main.c:193 sja1105_init_mii_settings() warn: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:196 sja1105_init_mii_settings() warn: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:202 sja1105_init_mii_settings() warn: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:207 sja1105_init_mii_settings() warn: is 'table->entries' large enough for 'struct sja1105_xmii_params_entry'? 0
drivers/net/dsa/sja1105/sja1105_main.c:634 sja1105_init_avb_params() warn: is 'table->entries' large enough for 'struct sja1105_avb_params_entry'? 0

vim +493 drivers/net/dsa/sja1105/sja1105_main.c

8aa9ebccae8762 Vladimir Oltean 2019-05-02  469  
8aa9ebccae8762 Vladimir Oltean 2019-05-02  470  static int sja1105_init_l2_forwarding_params(struct sja1105_private *priv)
8aa9ebccae8762 Vladimir Oltean 2019-05-02  471  {
1bf658eefe38cc Vladimir Oltean 2021-05-24  472  	struct sja1105_l2_forwarding_params_entry *l2fwd_params;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  473  	struct sja1105_table *table;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  474  
8aa9ebccae8762 Vladimir Oltean 2019-05-02  475  	table = &priv->static_config.tables[BLK_IDX_L2_FORWARDING_PARAMS];
8aa9ebccae8762 Vladimir Oltean 2019-05-02  476  
8aa9ebccae8762 Vladimir Oltean 2019-05-02  477  	if (table->entry_count) {
8aa9ebccae8762 Vladimir Oltean 2019-05-02  478  		kfree(table->entries);
8aa9ebccae8762 Vladimir Oltean 2019-05-02  479  		table->entry_count = 0;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  480  	}
8aa9ebccae8762 Vladimir Oltean 2019-05-02  481  
fd6f2c257b0bc0 Vladimir Oltean 2021-05-24  482  	table->entries = kcalloc(table->ops->max_entry_count,
8aa9ebccae8762 Vladimir Oltean 2019-05-02  483  				 table->ops->unpacked_entry_size, GFP_KERNEL);
8aa9ebccae8762 Vladimir Oltean 2019-05-02  484  	if (!table->entries)
8aa9ebccae8762 Vladimir Oltean 2019-05-02  485  		return -ENOMEM;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  486  
fd6f2c257b0bc0 Vladimir Oltean 2021-05-24  487  	table->entry_count = table->ops->max_entry_count;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  488  
8aa9ebccae8762 Vladimir Oltean 2019-05-02  489  	/* This table only has a single entry */
1bf658eefe38cc Vladimir Oltean 2021-05-24  490  	l2fwd_params = table->entries;
1bf658eefe38cc Vladimir Oltean 2021-05-24  491  
1bf658eefe38cc Vladimir Oltean 2021-05-24  492  	/* Disallow dynamic reconfiguration of vlan_pmap */
1bf658eefe38cc Vladimir Oltean 2021-05-24 @493  	l2fwd_params->max_dynp = 0;
1bf658eefe38cc Vladimir Oltean 2021-05-24  494  	/* Use a single memory partition for all ingress queues */
1bf658eefe38cc Vladimir Oltean 2021-05-24  495  	l2fwd_params->part_spc[0] = priv->info->max_frame_mem;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  496  
8aa9ebccae8762 Vladimir Oltean 2019-05-02  497  	return 0;
8aa9ebccae8762 Vladimir Oltean 2019-05-02  498  }
8aa9ebccae8762 Vladimir Oltean 2019-05-02  499  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
