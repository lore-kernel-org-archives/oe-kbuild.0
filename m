Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE27650
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Nov 2023 01:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CKywICo2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699406225; x=1730942225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cQZH8uO9eQwi141MDLAElh7OavVd78Xfg1KhQUQn0ww=;
  b=CKywICo24skGpHX0h/MXSjpLLEZeGsi5/yAYZPPpBZtw65N6ZccQ8x2y
   lCNJ1XdtHyK6HEK+lH2BzVAFTJhIaCVEwT6MhVKkBBPxFNKLA9uUiXKEX
   42SpRWrXcAf/PkMPtiIcvgtTIDr2u1ij82uQ56HQyrFRbAuYfA1Gu+CJJ
   t+ULIB/DqnVmIMUP7zfe4LhhNVekon1clvzHjZ1EHVWaPSmm+umBo9EDe
   11Jr1Z748h5OHw3mudkBrF2H7zRGi/QZX2JGIjnFWIOcuzafy/TRWagBx
   /wZHgzLeag3/35W1ZEqP2qFgG4cJw7L6Mou3K6u47dqmf4sQL1cxDB2Aw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="2598042"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="2598042"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 17:17:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="1010098095"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="1010098095"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Nov 2023 17:17:03 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0XBl-0007Xw-1F;
	Wed, 08 Nov 2023 01:17:01 +0000
Date: Wed, 8 Nov 2023 09:16:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/dsa/sja1105/sja1105_main.c:493
 sja1105_init_l2_forwarding_params() warn: is 'table->entries' large enough
 for 'struct sja1105_l2_forwarding_params_entry'? 0
Message-ID: <202311080909.Q9fA8v8L-lkp@intel.com>
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
commit: 1bf658eefe38cc26801b5861bbb6dbf3259ba8c1 net: dsa: sja1105: allow the frame buffer size to be customized
date:   2 years, 5 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 2 years, 5 months ago
config: i386-randconfig-141-20231030 (https://download.01.org/0day-ci/archive/20231108/202311080909.Q9fA8v8L-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231108/202311080909.Q9fA8v8L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311080909.Q9fA8v8L-lkp@intel.com/

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
