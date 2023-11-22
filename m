Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B581056B83
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Nov 2023 15:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f8nFMTvF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700667988; x=1732203988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IDCaCm9ewtc8fFwVSS1AbOBsPMYvHV5Mrx+jiY5XMLU=;
  b=f8nFMTvFJcW9s4Zpak/++WIoo1+XcrUp4W6Pm2Z1LstsEdfrmNXcnQTs
   mZoFY2z8JgEicW19uqTZbdjKtlbhb5f4OOeZe2BlRs+jktszkDlM7Nx2r
   XIjW8AHazlkPeH3RwvGYjJtzcRXhlC3gDGBZX+yY7kSxOjnVUFZGdWFGj
   LJg0+bu3ebB45DYEXgg7XJkhxjebXHIfst9C3258DnEt4W4/WyVmQUN0s
   hk3vM0a6md46/ZVif2wMi7KWsi4uzfVYzX9kid3kcfSL86bDmh1P6gqiF
   xxZ7K6uqFagJ6U6K3a7uSxedlOMVOBue71ruOtE5Jj1D6R4yJLsuocZGh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="13623156"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="13623156"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 07:46:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="8510499"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Nov 2023 07:46:23 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5pQj-0000dN-1w;
	Wed, 22 Nov 2023 15:46:21 +0000
Date: Wed, 22 Nov 2023 23:45:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/memory/omap-gpmc.c:1073 gpmc_alloc_waitpin() warn: passing
 zero to 'PTR_ERR'
Message-ID: <202311222138.Ufxo6jiP-lkp@intel.com>
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
TO: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Roger Quadros <rogerq@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c2d5304e6c648ebcf653bace7e51e0e6742e46c8
commit: 89aed3cd5cb951113b766cddd9c2df43cfbdafd5 memory: omap-gpmc: wait pin additions
date:   1 year, 1 month ago
:::::: branch date: 17 hours ago
:::::: commit date: 1 year, 1 month ago
config: mips-randconfig-r081-20231121 (https://download.01.org/0day-ci/archive/20231122/202311222138.Ufxo6jiP-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231122/202311222138.Ufxo6jiP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311222138.Ufxo6jiP-lkp@intel.com/

smatch warnings:
drivers/memory/omap-gpmc.c:1073 gpmc_alloc_waitpin() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1073 drivers/memory/omap-gpmc.c

89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1050  
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1051  static int gpmc_alloc_waitpin(struct gpmc_device *gpmc,
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1052  			      struct gpmc_settings *p)
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1053  {
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1054  	int ret;
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1055  	struct gpmc_waitpin *waitpin;
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1056  	struct gpio_desc *waitpin_desc;
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1057  
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1058  	if (!gpmc_is_valid_waitpin(p->wait_pin))
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1059  		return -EINVAL;
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1060  
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1061  	waitpin = &gpmc->waitpins[p->wait_pin];
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1062  
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1063  	if (!waitpin->desc) {
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1064  		/* Reserve the GPIO for wait pin usage.
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1065  		 * GPIO polarity doesn't matter here. Wait pin polarity
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1066  		 * is set in GPMC_CONFIG register.
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1067  		 */
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1068  		waitpin_desc = gpiochip_request_own_desc(&gpmc->gpio_chip,
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1069  							 p->wait_pin, "WAITPIN",
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1070  							 GPIO_ACTIVE_HIGH,
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1071  							 GPIOD_IN);
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1072  
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02 @1073  		ret = PTR_ERR(waitpin_desc);
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1074  		if (IS_ERR(waitpin_desc) && ret != -EBUSY)
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1075  			return ret;
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1076  
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1077  		/* New wait pin */
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1078  		waitpin->desc = waitpin_desc;
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1079  		waitpin->pin = p->wait_pin;
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1080  		waitpin->polarity = p->wait_pin_polarity;
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1081  	} else {
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1082  		/* Shared wait pin */
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1083  		if (p->wait_pin_polarity != waitpin->polarity ||
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1084  		    p->wait_pin != waitpin->pin) {
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1085  			dev_err(gpmc->dev,
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1086  				"shared-wait-pin: invalid configuration\n");
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1087  			return -EINVAL;
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1088  		}
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1089  		dev_info(gpmc->dev, "shared wait-pin: %d\n", waitpin->pin);
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1090  	}
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1091  
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1092  	return 0;
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1093  }
89aed3cd5cb951 Benedikt Niedermayr 2022-11-02  1094  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
