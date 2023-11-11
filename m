Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE233C16
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Nov 2023 02:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fAcEJJCY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699668185; x=1731204185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DG56ZK6s+tEr2en6Tr+ckyjBMn5XfE8XPSelqx0CJLQ=;
  b=fAcEJJCYjaWwZRHwgxE3WxRZXZNL8RddEevoXN+PfXDhlMT7szfPt4v/
   p2DOHIh6MHRoy7Rx0rTxuK7C3YBOTzz3+lsds3GkJ/rvgtHXRa8acR84X
   J89vvmlIY5/XDfEkraEZvz80YVcLzXgCEQc1ruhqrCrSnZAd88ec3uqiA
   LQm1gfS4eKlmcNFSE/U1DozkwfrK6HQUuok1IjjeoymthGEJXRf03BZ44
   KedSX4hmW9adEuu+iNUeI0Mr3A2y9HY4WbSXLizJWxzlyJ1GuROnqb0ba
   m5eF4adwzumU1wPnUg8MdzFYngd8YZLOo+fTN3cnc1z12yCw/o2nR2SYG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="380638384"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="380638384"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 18:03:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="740281591"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="740281591"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 10 Nov 2023 18:03:03 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1dKu-000A8k-37;
	Sat, 11 Nov 2023 02:03:00 +0000
Date: Sat, 11 Nov 2023 10:02:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v7 2/2] rtc: max31335: add driver support
Message-ID: <202311110943.V2lcrQlf-lkp@intel.com>
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
In-Reply-To: <20231109101449.8347-2-antoniu.miclaus@analog.com>
References: <20231109101449.8347-2-antoniu.miclaus@analog.com>
TO: Antoniu Miclaus <antoniu.miclaus@analog.com>
TO: Antoniu Miclaus <antoniu.miclaus@analog.com>
TO: Alessandro Zummo <a.zummo@towertech.it>
TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Jean Delvare <jdelvare@suse.com>
TO: Guenter Roeck <linux@roeck-us.net>
TO: linux-rtc@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-hwmon@vger.kernel.org

Hi Antoniu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on abelloni/rtc-next]
[also build test WARNING on linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Antoniu-Miclaus/rtc-max31335-add-driver-support/20231109-231755
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20231109101449.8347-2-antoniu.miclaus%40analog.com
patch subject: [PATCH v7 2/2] rtc: max31335: add driver support
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: i386-randconfig-141-20231111 (https://download.01.org/0day-ci/archive/20231111/202311110943.V2lcrQlf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311110943.V2lcrQlf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311110943.V2lcrQlf-lkp@intel.com/

smatch warnings:
drivers/rtc/rtc-max31335.c:415 max31335_trickle_charger_setup() error: uninitialized symbol 'trickle_cfg'.

vim +/trickle_cfg +415 drivers/rtc/rtc-max31335.c

d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  382  
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  383  static int max31335_trickle_charger_setup(struct device *dev,
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  384  					  struct max31335_data *max31335)
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  385  {
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  386  	u32 ohms, chargeable;
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  387  	int i, trickle_cfg;
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  388  	const char *diode;
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  389  
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  390  	if (device_property_read_u32(dev, "aux-voltage-chargeable",
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  391  				     &chargeable))
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  392  		return 0;
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  393  
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  394  	if (device_property_read_u32(dev, "trickle-resistor-ohms", &ohms))
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  395  		return 0;
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  396  
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  397  	if (device_property_read_string(dev, "adi,tc-diode", &diode))
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  398  		return 0;
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  399  
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  400  	if (!strcmp(diode, "schottky"))
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  401  		trickle_cfg = MAX31335_TRICKLE_SCHOTTKY_DIODE;
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  402  	else if (!strcmp(diode, "standard+schottky"))
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  403  		trickle_cfg = MAX31335_TRICKLE_STANDARD_DIODE;
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  404  	else
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  405  		dev_err_probe(dev, -EINVAL, "Invalid tc-diode value: %s\n",
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  406  			      diode);
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  407  
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  408  	for (i = 0; i < ARRAY_SIZE(max31335_trickle_resistors); i++)
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  409  		if (ohms == max31335_trickle_resistors[i])
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  410  			break;
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  411  
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  412  	if (i >= ARRAY_SIZE(max31335_trickle_resistors))
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  413  		return 0;
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  414  
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09 @415  	i = i + trickle_cfg;
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  416  
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  417  	return regmap_write(max31335->regmap, MAX31335_TRICKLE_REG,
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  418  			    FIELD_PREP(MAX31335_TRICKLE_REG_TRICKLE, i) |
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  419  			    FIELD_PREP(MAX31335_TRICKLE_REG_EN_TRICKLE,
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  420  				       chargeable));
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  421  }
d76a0d3a61615e5 Antoniu Miclaus 2023-11-09  422  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
