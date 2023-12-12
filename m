Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BD75D481
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Dec 2023 11:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VaLWKEzL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702380630; x=1733916630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lL/8bJukNYklp3FDWGRheiu+ONiGn6BB92fqh/xg1AI=;
  b=VaLWKEzLJQu2YjsXWo21k903gFxiTysC5JpemM7FGa7+8pWpghclbB/0
   TcR46+1rH2pJ6prqebdFt/1M7NkQ/2S9G6MV4TNh+bFk4H+t2hd3tCg8q
   fLE1rrpK5cTdeRMN9Cro2IoCzod9W2HS1IOE/lCUtS+Vf/uWXVLMklXQj
   jTPE4IB0dB2H6QKuGUxEY9lKK3/8Tv0hpgWDgfvXsq2r7E/3mns5VhNNH
   99ssWz8JgYsR4CIuLTi0am2LPGWBCYi5JpYIflCsLHPE20h929qG6+C7h
   UixcJyP/DCO0GFXpeBWBw/aBb3+nITBZJqlc6dRA1KX6MDqpK0611bj2T
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1632155"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="1632155"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 03:30:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="896889083"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="896889083"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Dec 2023 03:30:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rD0y1-000J6d-2q;
	Tue, 12 Dec 2023 11:30:25 +0000
Date: Tue, 12 Dec 2023 19:28:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [groeck-staging:hwmon-next 36/50] drivers/hwmon/max31827.c:394:16:
 sparse: sparse: dubious: x & !y
Message-ID: <202312121916.hewzIGp5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/hwmon/max31827.c:394:16: sparse: sparse: dubious: x & !y"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-hwmon@vger.kernel.org
TO: Daniel Matyas <daniel.matyas@analog.com>
CC: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   62a991b3fcc9529c1a905ee42a4d860c31ca606a
commit: 88548710d2aed71677f7594a78219bf081d4297f [36/50] hwmon: (max31827) Handle new properties from the devicetree
:::::: branch date: 6 hours ago
:::::: commit date: 21 hours ago
config: arc-randconfig-r131-20231212 (https://download.01.org/0day-ci/archive/20231212/202312121916.hewzIGp5-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231212/202312121916.hewzIGp5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312121916.hewzIGp5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/max31827.c:394:16: sparse: sparse: dubious: x & !y
   drivers/hwmon/max31827.c:401:24: sparse: sparse: dubious: x & !y

vim +394 drivers/hwmon/max31827.c

16d60ba8fdc4c6 Daniel Matyas 2023-05-24  373  
88548710d2aed7 Daniel Matyas 2023-10-31  374  static int max31827_init_client(struct max31827_state *st,
88548710d2aed7 Daniel Matyas 2023-10-31  375  				struct device *dev)
16d60ba8fdc4c6 Daniel Matyas 2023-05-24  376  {
88548710d2aed7 Daniel Matyas 2023-10-31  377  	struct fwnode_handle *fwnode;
88548710d2aed7 Daniel Matyas 2023-10-31  378  	unsigned int res = 0;
88548710d2aed7 Daniel Matyas 2023-10-31  379  	u32 data, lsb_idx;
88548710d2aed7 Daniel Matyas 2023-10-31  380  	bool prop;
88548710d2aed7 Daniel Matyas 2023-10-31  381  	int ret;
88548710d2aed7 Daniel Matyas 2023-10-31  382  
88548710d2aed7 Daniel Matyas 2023-10-31  383  	fwnode = dev_fwnode(dev);
88548710d2aed7 Daniel Matyas 2023-10-31  384  
16d60ba8fdc4c6 Daniel Matyas 2023-05-24  385  	st->enable = true;
88548710d2aed7 Daniel Matyas 2023-10-31  386  	res |= MAX31827_DEVICE_ENABLE(1);
16d60ba8fdc4c6 Daniel Matyas 2023-05-24  387  
88548710d2aed7 Daniel Matyas 2023-10-31  388  	res |= MAX31827_CONFIGURATION_RESOLUTION_MASK;
88548710d2aed7 Daniel Matyas 2023-10-31  389  
88548710d2aed7 Daniel Matyas 2023-10-31  390  	prop = fwnode_property_read_bool(fwnode, "adi,comp-int");
88548710d2aed7 Daniel Matyas 2023-10-31  391  	res |= FIELD_PREP(MAX31827_CONFIGURATION_COMP_INT_MASK, prop);
88548710d2aed7 Daniel Matyas 2023-10-31  392  
88548710d2aed7 Daniel Matyas 2023-10-31  393  	prop = fwnode_property_read_bool(fwnode, "adi,timeout-enable");
88548710d2aed7 Daniel Matyas 2023-10-31 @394  	res |= FIELD_PREP(MAX31827_CONFIGURATION_TIMEOUT_MASK, !prop);
88548710d2aed7 Daniel Matyas 2023-10-31  395  
88548710d2aed7 Daniel Matyas 2023-10-31  396  	if (fwnode_property_present(fwnode, "adi,alarm-pol")) {
88548710d2aed7 Daniel Matyas 2023-10-31  397  		ret = fwnode_property_read_u32(fwnode, "adi,alarm-pol", &data);
88548710d2aed7 Daniel Matyas 2023-10-31  398  		if (ret)
88548710d2aed7 Daniel Matyas 2023-10-31  399  			return ret;
88548710d2aed7 Daniel Matyas 2023-10-31  400  
88548710d2aed7 Daniel Matyas 2023-10-31  401  		res |= FIELD_PREP(MAX31827_CONFIGURATION_ALRM_POL_MASK, !!data);
88548710d2aed7 Daniel Matyas 2023-10-31  402  	} else {
88548710d2aed7 Daniel Matyas 2023-10-31  403  		/*
88548710d2aed7 Daniel Matyas 2023-10-31  404  		 * Set default value.
88548710d2aed7 Daniel Matyas 2023-10-31  405  		 */
88548710d2aed7 Daniel Matyas 2023-10-31  406  		res |= FIELD_PREP(MAX31827_CONFIGURATION_ALRM_POL_MASK,
88548710d2aed7 Daniel Matyas 2023-10-31  407  				  MAX31827_ALRM_POL_LOW);
88548710d2aed7 Daniel Matyas 2023-10-31  408  	}
88548710d2aed7 Daniel Matyas 2023-10-31  409  
88548710d2aed7 Daniel Matyas 2023-10-31  410  	if (fwnode_property_present(fwnode, "adi,fault-q")) {
88548710d2aed7 Daniel Matyas 2023-10-31  411  		ret = fwnode_property_read_u32(fwnode, "adi,fault-q", &data);
88548710d2aed7 Daniel Matyas 2023-10-31  412  		if (ret)
88548710d2aed7 Daniel Matyas 2023-10-31  413  			return ret;
88548710d2aed7 Daniel Matyas 2023-10-31  414  
88548710d2aed7 Daniel Matyas 2023-10-31  415  		/*
88548710d2aed7 Daniel Matyas 2023-10-31  416  		 * Convert the desired fault queue into register bits.
88548710d2aed7 Daniel Matyas 2023-10-31  417  		 */
88548710d2aed7 Daniel Matyas 2023-10-31  418  		if (data != 0)
88548710d2aed7 Daniel Matyas 2023-10-31  419  			lsb_idx = __ffs(data);
88548710d2aed7 Daniel Matyas 2023-10-31  420  
88548710d2aed7 Daniel Matyas 2023-10-31  421  		if (hweight32(data) != 1 || lsb_idx > 4) {
88548710d2aed7 Daniel Matyas 2023-10-31  422  			dev_err(dev, "Invalid data in adi,fault-q\n");
88548710d2aed7 Daniel Matyas 2023-10-31  423  			return -EINVAL;
88548710d2aed7 Daniel Matyas 2023-10-31  424  		}
88548710d2aed7 Daniel Matyas 2023-10-31  425  
88548710d2aed7 Daniel Matyas 2023-10-31  426  		res |= FIELD_PREP(MAX31827_CONFIGURATION_FLT_Q_MASK, lsb_idx);
88548710d2aed7 Daniel Matyas 2023-10-31  427  	} else {
88548710d2aed7 Daniel Matyas 2023-10-31  428  		/*
88548710d2aed7 Daniel Matyas 2023-10-31  429  		 * Set default value.
88548710d2aed7 Daniel Matyas 2023-10-31  430  		 */
88548710d2aed7 Daniel Matyas 2023-10-31  431  		res |= FIELD_PREP(MAX31827_CONFIGURATION_FLT_Q_MASK,
88548710d2aed7 Daniel Matyas 2023-10-31  432  				  MAX31827_FLT_Q_1);
88548710d2aed7 Daniel Matyas 2023-10-31  433  	}
88548710d2aed7 Daniel Matyas 2023-10-31  434  
88548710d2aed7 Daniel Matyas 2023-10-31  435  	return regmap_write(st->regmap, MAX31827_CONFIGURATION_REG, res);
16d60ba8fdc4c6 Daniel Matyas 2023-05-24  436  }
16d60ba8fdc4c6 Daniel Matyas 2023-05-24  437  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
