Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBDA1DB52D
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Dec 2024 15:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734448000; cv=none; b=WA2CnLlGAMDj4P4gWx0CCvpbP/5XqqLVg6/ThXMrlmez2mus3Vn6LHtsJWeqPvOBz6b7VXj46I9qOoPkl4TWD/WaJOSHlW2HA5QtVZnTs56xfbRzMSSsffNd58zUWqCUl45c5vxAADzcuBG8VFl9vE66SBb1IAifsbWsW5J5Qr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734448000; c=relaxed/simple;
	bh=KW3ga5nnV+MxRiFvRCi00C15Qk0uzo8H05OrteeJGOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hBPhqY3X5bj85aAbxt8DYz+pubZhaiQ5qmB00f3CqfDExGeP4FKnzI7S3Suw4POnpGmOFpsbFSjEO3zmbEDhrZMb9CEGmJp4QIUMJ/HDcaeoeoodLkBrALgHN13YlqXP4bp/n09olIbkti+HPoelmXWQni3PgLTZIkTcJnZjrKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zdkcfphz; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zdkcfphz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734447998; x=1765983998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KW3ga5nnV+MxRiFvRCi00C15Qk0uzo8H05OrteeJGOc=;
  b=ZdkcfphzRM5jG7Yrb924FNqnMsZ2SpG5CBqNAO4WgL5EUwJVW/z5kNFr
   xbKzdwnvVEfuY6nuHFaW3jutdfWPKNJe8AZabYM0PM0eN8Bh9+mgHN5ys
   boc9Xju5C9t8ngker0kVOWSWshYbdJqJfDirqm2gOepuHQX1dx72Avht7
   l2GRZ2HLFAmutg3FRYiEwICdEHgBcjguRFjlW+ynQDf0YtDSQPyoIbnQ8
   2Q5EoRRJUVS9/SbUHce/QDFJ0bFWDZVh7U0uhRvE2nweTOc7j1WFejjJT
   axN9D5o87MS6Ktx5CgsoZYx5JzgKjFWG8VsDqkZbSq/oP6rjzjoqNF26l
   A==;
X-CSE-ConnectionGUID: fUhsELH6RNaEUg7kHQ/T9w==
X-CSE-MsgGUID: AhYNQeUlTQerSqVKCOsnsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="38655499"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="38655499"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 07:06:38 -0800
X-CSE-ConnectionGUID: VUUiQCxeQziVBiXiRaP7wQ==
X-CSE-MsgGUID: zK+yLwdpSGKcKIRggI8PyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="102572043"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Dec 2024 07:06:37 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNZ9e-000F5M-02;
	Tue, 17 Dec 2024 15:06:34 +0000
Date: Tue, 17 Dec 2024 23:06:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/i2c/muxes/i2c-mux-mule.c:98:1-23: WARNING: Function
 "for_each_child_of_node" should have of_node_put() before return around line
 103.
Message-ID: <202412172333.KjRpCGLb-lkp@intel.com>
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
TO: Farouk Bouabid <farouk.bouabid@cherry.de>
CC: Andi Shyti <andi.shyti@kernel.org>
CC: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f44d154d6e3d633d4c49a5d6aed8a0e4684ae25e
commit: d0f8e97866bf258b420ebf2b46755399ca01e585 i2c: muxes: add support for tsd,mule-i2c multiplexer
date:   3 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-104-20241217 (https://download.01.org/0day-ci/archive/20241217/202412172333.KjRpCGLb-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412172333.KjRpCGLb-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/i2c/muxes/i2c-mux-mule.c:98:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 103.
   drivers/i2c/muxes/i2c-mux-mule.c:98:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 122.

vim +/for_each_child_of_node +98 drivers/i2c/muxes/i2c-mux-mule.c

d0f8e97866bf25 Farouk Bouabid 2024-09-06   43  
d0f8e97866bf25 Farouk Bouabid 2024-09-06   44  static int mule_i2c_mux_probe(struct platform_device *pdev)
d0f8e97866bf25 Farouk Bouabid 2024-09-06   45  {
d0f8e97866bf25 Farouk Bouabid 2024-09-06   46  	struct device *mux_dev = &pdev->dev;
d0f8e97866bf25 Farouk Bouabid 2024-09-06   47  	struct mule_i2c_reg_mux *priv;
d0f8e97866bf25 Farouk Bouabid 2024-09-06   48  	struct i2c_client *client;
d0f8e97866bf25 Farouk Bouabid 2024-09-06   49  	struct i2c_mux_core *muxc;
d0f8e97866bf25 Farouk Bouabid 2024-09-06   50  	struct device_node *dev;
d0f8e97866bf25 Farouk Bouabid 2024-09-06   51  	unsigned int readback;
d0f8e97866bf25 Farouk Bouabid 2024-09-06   52  	int ndev, ret;
d0f8e97866bf25 Farouk Bouabid 2024-09-06   53  	bool old_fw;
d0f8e97866bf25 Farouk Bouabid 2024-09-06   54  
d0f8e97866bf25 Farouk Bouabid 2024-09-06   55  	/* Count devices on the mux */
d0f8e97866bf25 Farouk Bouabid 2024-09-06   56  	ndev = of_get_child_count(mux_dev->of_node);
d0f8e97866bf25 Farouk Bouabid 2024-09-06   57  	dev_dbg(mux_dev, "%d devices on the mux\n", ndev);
d0f8e97866bf25 Farouk Bouabid 2024-09-06   58  
d0f8e97866bf25 Farouk Bouabid 2024-09-06   59  	client = to_i2c_client(mux_dev->parent);
d0f8e97866bf25 Farouk Bouabid 2024-09-06   60  
d0f8e97866bf25 Farouk Bouabid 2024-09-06   61  	muxc = i2c_mux_alloc(client->adapter, mux_dev, ndev, sizeof(*priv),
d0f8e97866bf25 Farouk Bouabid 2024-09-06   62  			     I2C_MUX_LOCKED, mule_i2c_mux_select, mule_i2c_mux_deselect);
d0f8e97866bf25 Farouk Bouabid 2024-09-06   63  	if (!muxc)
d0f8e97866bf25 Farouk Bouabid 2024-09-06   64  		return -ENOMEM;
d0f8e97866bf25 Farouk Bouabid 2024-09-06   65  
d0f8e97866bf25 Farouk Bouabid 2024-09-06   66  	priv = i2c_mux_priv(muxc);
d0f8e97866bf25 Farouk Bouabid 2024-09-06   67  
d0f8e97866bf25 Farouk Bouabid 2024-09-06   68  	priv->regmap = dev_get_regmap(mux_dev->parent, NULL);
d0f8e97866bf25 Farouk Bouabid 2024-09-06   69  	if (IS_ERR(priv->regmap))
d0f8e97866bf25 Farouk Bouabid 2024-09-06   70  		return dev_err_probe(mux_dev, PTR_ERR(priv->regmap),
d0f8e97866bf25 Farouk Bouabid 2024-09-06   71  				     "No parent i2c register map\n");
d0f8e97866bf25 Farouk Bouabid 2024-09-06   72  
d0f8e97866bf25 Farouk Bouabid 2024-09-06   73  	platform_set_drvdata(pdev, muxc);
d0f8e97866bf25 Farouk Bouabid 2024-09-06   74  
d0f8e97866bf25 Farouk Bouabid 2024-09-06   75  	/*
d0f8e97866bf25 Farouk Bouabid 2024-09-06   76  	 * MULE_I2C_MUX_DEFAULT_DEV is guaranteed to exist on all old and new
d0f8e97866bf25 Farouk Bouabid 2024-09-06   77  	 * mule fw. Mule fw without mux support will accept write ops to the
d0f8e97866bf25 Farouk Bouabid 2024-09-06   78  	 * config register, but readback returns 0xff (register not updated).
d0f8e97866bf25 Farouk Bouabid 2024-09-06   79  	 */
d0f8e97866bf25 Farouk Bouabid 2024-09-06   80  	ret = mule_i2c_mux_select(muxc, MULE_I2C_MUX_DEFAULT_DEV);
d0f8e97866bf25 Farouk Bouabid 2024-09-06   81  	if (ret)
d0f8e97866bf25 Farouk Bouabid 2024-09-06   82  		return dev_err_probe(mux_dev, ret,
d0f8e97866bf25 Farouk Bouabid 2024-09-06   83  				     "Failed to write config register\n");
d0f8e97866bf25 Farouk Bouabid 2024-09-06   84  
d0f8e97866bf25 Farouk Bouabid 2024-09-06   85  	ret = regmap_read(priv->regmap, MULE_I2C_MUX_CONFIG_REG, &readback);
d0f8e97866bf25 Farouk Bouabid 2024-09-06   86  	if (ret)
d0f8e97866bf25 Farouk Bouabid 2024-09-06   87  		return dev_err_probe(mux_dev, ret,
d0f8e97866bf25 Farouk Bouabid 2024-09-06   88  				     "Failed to read config register\n");
d0f8e97866bf25 Farouk Bouabid 2024-09-06   89  
d0f8e97866bf25 Farouk Bouabid 2024-09-06   90  	old_fw = (readback != MULE_I2C_MUX_DEFAULT_DEV);
d0f8e97866bf25 Farouk Bouabid 2024-09-06   91  
d0f8e97866bf25 Farouk Bouabid 2024-09-06   92  	ret = devm_add_action_or_reset(mux_dev, mule_i2c_mux_remove, muxc);
d0f8e97866bf25 Farouk Bouabid 2024-09-06   93  	if (ret)
d0f8e97866bf25 Farouk Bouabid 2024-09-06   94  		return dev_err_probe(mux_dev, ret,
d0f8e97866bf25 Farouk Bouabid 2024-09-06   95  				     "Failed to register mux remove\n");
d0f8e97866bf25 Farouk Bouabid 2024-09-06   96  
d0f8e97866bf25 Farouk Bouabid 2024-09-06   97  	/* Create device adapters */
d0f8e97866bf25 Farouk Bouabid 2024-09-06  @98  	for_each_child_of_node(mux_dev->of_node, dev) {
d0f8e97866bf25 Farouk Bouabid 2024-09-06   99  		u32 reg;
d0f8e97866bf25 Farouk Bouabid 2024-09-06  100  
d0f8e97866bf25 Farouk Bouabid 2024-09-06  101  		ret = of_property_read_u32(dev, "reg", &reg);
d0f8e97866bf25 Farouk Bouabid 2024-09-06  102  		if (ret)
d0f8e97866bf25 Farouk Bouabid 2024-09-06 @103  			return dev_err_probe(mux_dev, ret,
d0f8e97866bf25 Farouk Bouabid 2024-09-06  104  					     "No reg property found for %s\n",
d0f8e97866bf25 Farouk Bouabid 2024-09-06  105  					     of_node_full_name(dev));
d0f8e97866bf25 Farouk Bouabid 2024-09-06  106  
d0f8e97866bf25 Farouk Bouabid 2024-09-06  107  		if (old_fw && reg != 0) {
d0f8e97866bf25 Farouk Bouabid 2024-09-06  108  			dev_warn(mux_dev,
d0f8e97866bf25 Farouk Bouabid 2024-09-06  109  				 "Mux is not supported, please update Mule FW\n");
d0f8e97866bf25 Farouk Bouabid 2024-09-06  110  			continue;
d0f8e97866bf25 Farouk Bouabid 2024-09-06  111  		}
d0f8e97866bf25 Farouk Bouabid 2024-09-06  112  
d0f8e97866bf25 Farouk Bouabid 2024-09-06  113  		ret = mule_i2c_mux_select(muxc, reg);
d0f8e97866bf25 Farouk Bouabid 2024-09-06  114  		if (ret) {
d0f8e97866bf25 Farouk Bouabid 2024-09-06  115  			dev_warn(mux_dev,
d0f8e97866bf25 Farouk Bouabid 2024-09-06  116  				 "Device %d not supported, please update Mule FW\n", reg);
d0f8e97866bf25 Farouk Bouabid 2024-09-06  117  			continue;
d0f8e97866bf25 Farouk Bouabid 2024-09-06  118  		}
d0f8e97866bf25 Farouk Bouabid 2024-09-06  119  
d0f8e97866bf25 Farouk Bouabid 2024-09-06  120  		ret = i2c_mux_add_adapter(muxc, 0, reg);
d0f8e97866bf25 Farouk Bouabid 2024-09-06  121  		if (ret)
d0f8e97866bf25 Farouk Bouabid 2024-09-06  122  			return ret;
d0f8e97866bf25 Farouk Bouabid 2024-09-06  123  	}
d0f8e97866bf25 Farouk Bouabid 2024-09-06  124  
d0f8e97866bf25 Farouk Bouabid 2024-09-06  125  	mule_i2c_mux_deselect(muxc, MULE_I2C_MUX_DEFAULT_DEV);
d0f8e97866bf25 Farouk Bouabid 2024-09-06  126  
d0f8e97866bf25 Farouk Bouabid 2024-09-06  127  	return 0;
d0f8e97866bf25 Farouk Bouabid 2024-09-06  128  }
d0f8e97866bf25 Farouk Bouabid 2024-09-06  129  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
