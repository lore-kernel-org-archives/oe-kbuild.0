Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEA9398
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Sep 2023 04:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694667007; x=1726203007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=84EBgmoC/06FXEXZjQ8be+jYImA8uqVk/hfgsAK5LKA=;
  b=nGX+GB9Mzj3OXs2p5hxC5h1KunyRNPwuqJcdZha4ekshptH+DU5ZlNZc
   tTpWviuM8sK9q+sQ19bBH9AfbtwpBhIwANS2XpnmLfEh0lHYKSw1Veby7
   cju7dhcjLCS6J1/dr9VjdbZarhW/rqymC/UsZrWCEZ6v/FZoWZKPI8GS3
   9m7eNJuHkNTFrJELzK0SuQz/vWieHPF5/t14iEEEKpyYVUnPYo1QDk9ns
   WmuWxmQrJB7iBPENYASCCFiiNp5cz0PGFfs3P4XZEhmCyyjST88z8ICi3
   MmVg/Sg+hO96atsuzrUir8Vf3WiAlsVkffhn3cXwGYKnQroVNoYnYatYX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="378775265"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="378775265"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 21:49:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="779483828"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="779483828"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 13 Sep 2023 21:49:57 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgeId-0001Ar-15;
	Thu, 14 Sep 2023 04:49:55 +0000
Date: Thu, 14 Sep 2023 12:49:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/4] hwmon: max31827: Handle new properties from the
 devicetree
Message-ID: <202309141207.ONsvOJbh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/hwmon/max31827.c:414:16: sparse: sparse: dubious: x & !y"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230913152135.457892-4-daniel.matyas@analog.com>
References: <20230913152135.457892-4-daniel.matyas@analog.com>
TO: Daniel Matyas <daniel.matyas@analog.com>
CC: Daniel Matyas <daniel.matyas@analog.com>
CC: Jean Delvare <jdelvare@suse.com>
CC: Guenter Roeck <linux@roeck-us.net>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Jonathan Corbet <corbet@lwn.net>
CC: linux-hwmon@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-doc@vger.kernel.org

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.6-rc1 next-20230913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Matyas/hwmon-max31827-Make-code-cleaner/20230913-232729
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20230913152135.457892-4-daniel.matyas%40analog.com
patch subject: [PATCH 3/4] hwmon: max31827: Handle new properties from the devicetree
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: x86_64-randconfig-121-20230914 (https://download.01.org/0day-ci/archive/20230914/202309141207.ONsvOJbh-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309141207.ONsvOJbh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309141207.ONsvOJbh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/max31827.c:414:16: sparse: sparse: dubious: x & !y
   drivers/hwmon/max31827.c:426:24: sparse: sparse: dubious: x & !y

vim +414 drivers/hwmon/max31827.c

e0b6a7b273eb37 Daniel Matyas 2023-09-13  395  
e0b6a7b273eb37 Daniel Matyas 2023-09-13  396  static int max31827_init_client(struct max31827_state *st,
e0b6a7b273eb37 Daniel Matyas 2023-09-13  397  				struct fwnode_handle *fwnode)
16d60ba8fdc4c6 Daniel Matyas 2023-05-24  398  {
e0b6a7b273eb37 Daniel Matyas 2023-09-13  399  	bool prop;
e0b6a7b273eb37 Daniel Matyas 2023-09-13  400  	u32 data, lsb_idx;
e0b6a7b273eb37 Daniel Matyas 2023-09-13  401  	unsigned int res = 0;
e0b6a7b273eb37 Daniel Matyas 2023-09-13  402  	enum chips type;
e0b6a7b273eb37 Daniel Matyas 2023-09-13  403  	int ret;
e0b6a7b273eb37 Daniel Matyas 2023-09-13  404  
16d60ba8fdc4c6 Daniel Matyas 2023-05-24  405  	st->enable = true;
e0b6a7b273eb37 Daniel Matyas 2023-09-13  406  	res |= MAX31827_DEVICE_ENABLE(1);
16d60ba8fdc4c6 Daniel Matyas 2023-05-24  407  
e0b6a7b273eb37 Daniel Matyas 2023-09-13  408  	res |= MAX31827_CONFIGURATION_RESOLUTION_MASK;
e0b6a7b273eb37 Daniel Matyas 2023-09-13  409  
e0b6a7b273eb37 Daniel Matyas 2023-09-13  410  	prop = fwnode_property_read_bool(fwnode, "adi,comp-int");
e0b6a7b273eb37 Daniel Matyas 2023-09-13  411  	res |= FIELD_PREP(MAX31827_CONFIGURATION_COMP_INT_MASK, prop);
e0b6a7b273eb37 Daniel Matyas 2023-09-13  412  
e0b6a7b273eb37 Daniel Matyas 2023-09-13  413  	prop = fwnode_property_read_bool(fwnode, "adi,timeout-enable");
e0b6a7b273eb37 Daniel Matyas 2023-09-13 @414  	res |= FIELD_PREP(MAX31827_CONFIGURATION_TIMEOUT_MASK, !prop);
e0b6a7b273eb37 Daniel Matyas 2023-09-13  415  
e0b6a7b273eb37 Daniel Matyas 2023-09-13  416  	if (st->client->dev.of_node)
e0b6a7b273eb37 Daniel Matyas 2023-09-13  417  		type = (enum chips)of_device_get_match_data(&st->client->dev);
e0b6a7b273eb37 Daniel Matyas 2023-09-13  418  	else
e0b6a7b273eb37 Daniel Matyas 2023-09-13  419  		type = i2c_match_id(max31827_i2c_ids, st->client)->driver_data;
e0b6a7b273eb37 Daniel Matyas 2023-09-13  420  
e0b6a7b273eb37 Daniel Matyas 2023-09-13  421  	if (fwnode_property_present(fwnode, "adi,alrm-pol")) {
e0b6a7b273eb37 Daniel Matyas 2023-09-13  422  		ret = fwnode_property_read_u32(fwnode, "adi,alrm-pol", &data);
e0b6a7b273eb37 Daniel Matyas 2023-09-13  423  		if (ret)
e0b6a7b273eb37 Daniel Matyas 2023-09-13  424  			return ret;
e0b6a7b273eb37 Daniel Matyas 2023-09-13  425  
e0b6a7b273eb37 Daniel Matyas 2023-09-13  426  		res |= FIELD_PREP(MAX31827_CONFIGURATION_ALRM_POL_MASK, !!data);
e0b6a7b273eb37 Daniel Matyas 2023-09-13  427  	} else {
e0b6a7b273eb37 Daniel Matyas 2023-09-13  428  		switch (type) {
e0b6a7b273eb37 Daniel Matyas 2023-09-13  429  		case max31827:
e0b6a7b273eb37 Daniel Matyas 2023-09-13  430  		case max31828:
e0b6a7b273eb37 Daniel Matyas 2023-09-13  431  			res |= FIELD_PREP(MAX31827_CONFIGURATION_ALRM_POL_MASK,
e0b6a7b273eb37 Daniel Matyas 2023-09-13  432  					  0x0);
e0b6a7b273eb37 Daniel Matyas 2023-09-13  433  			break;
e0b6a7b273eb37 Daniel Matyas 2023-09-13  434  		case max31829:
e0b6a7b273eb37 Daniel Matyas 2023-09-13  435  			res |= FIELD_PREP(MAX31827_CONFIGURATION_ALRM_POL_MASK,
e0b6a7b273eb37 Daniel Matyas 2023-09-13  436  					  0x1);
e0b6a7b273eb37 Daniel Matyas 2023-09-13  437  			break;
e0b6a7b273eb37 Daniel Matyas 2023-09-13  438  		default:
e0b6a7b273eb37 Daniel Matyas 2023-09-13  439  			return -EOPNOTSUPP;
e0b6a7b273eb37 Daniel Matyas 2023-09-13  440  		}
e0b6a7b273eb37 Daniel Matyas 2023-09-13  441  	}
e0b6a7b273eb37 Daniel Matyas 2023-09-13  442  
e0b6a7b273eb37 Daniel Matyas 2023-09-13  443  	if (fwnode_property_present(fwnode, "adi,flt-q")) {
e0b6a7b273eb37 Daniel Matyas 2023-09-13  444  		ret = fwnode_property_read_u32(fwnode, "adi,flt-q", &data);
e0b6a7b273eb37 Daniel Matyas 2023-09-13  445  		if (ret)
e0b6a7b273eb37 Daniel Matyas 2023-09-13  446  			return ret;
e0b6a7b273eb37 Daniel Matyas 2023-09-13  447  
e0b6a7b273eb37 Daniel Matyas 2023-09-13  448  		/*
e0b6a7b273eb37 Daniel Matyas 2023-09-13  449  		 * Convert the desired fault queue into register bits.
e0b6a7b273eb37 Daniel Matyas 2023-09-13  450  		 */
e0b6a7b273eb37 Daniel Matyas 2023-09-13  451  		lsb_idx = max31827__bf_shf(data);
e0b6a7b273eb37 Daniel Matyas 2023-09-13  452  		if (lsb_idx > 3 || data != BIT(lsb_idx)) {
e0b6a7b273eb37 Daniel Matyas 2023-09-13  453  			dev_err(&st->client->dev, "Invalid data in fault queue\n");
e0b6a7b273eb37 Daniel Matyas 2023-09-13  454  			return -EOPNOTSUPP;
e0b6a7b273eb37 Daniel Matyas 2023-09-13  455  		}
e0b6a7b273eb37 Daniel Matyas 2023-09-13  456  
e0b6a7b273eb37 Daniel Matyas 2023-09-13  457  		res |= FIELD_PREP(MAX31827_CONFIGURATION_FLT_Q_MASK, lsb_idx);
e0b6a7b273eb37 Daniel Matyas 2023-09-13  458  	} else {
e0b6a7b273eb37 Daniel Matyas 2023-09-13  459  		switch (type) {
e0b6a7b273eb37 Daniel Matyas 2023-09-13  460  		case max31827:
e0b6a7b273eb37 Daniel Matyas 2023-09-13  461  			res |= FIELD_PREP(MAX31827_CONFIGURATION_FLT_Q_MASK,
e0b6a7b273eb37 Daniel Matyas 2023-09-13  462  					  MAX31827_FLT_Q_1);
e0b6a7b273eb37 Daniel Matyas 2023-09-13  463  			break;
e0b6a7b273eb37 Daniel Matyas 2023-09-13  464  		case max31828:
e0b6a7b273eb37 Daniel Matyas 2023-09-13  465  		case max31829:
e0b6a7b273eb37 Daniel Matyas 2023-09-13  466  			res |= FIELD_PREP(MAX31827_CONFIGURATION_FLT_Q_MASK,
e0b6a7b273eb37 Daniel Matyas 2023-09-13  467  					  MAX31827_FLT_Q_4);
e0b6a7b273eb37 Daniel Matyas 2023-09-13  468  			break;
e0b6a7b273eb37 Daniel Matyas 2023-09-13  469  		default:
e0b6a7b273eb37 Daniel Matyas 2023-09-13  470  			return -EOPNOTSUPP;
e0b6a7b273eb37 Daniel Matyas 2023-09-13  471  		}
e0b6a7b273eb37 Daniel Matyas 2023-09-13  472  	}
e0b6a7b273eb37 Daniel Matyas 2023-09-13  473  
e0b6a7b273eb37 Daniel Matyas 2023-09-13  474  	return regmap_write(st->regmap, MAX31827_CONFIGURATION_REG, res);
16d60ba8fdc4c6 Daniel Matyas 2023-05-24  475  }
16d60ba8fdc4c6 Daniel Matyas 2023-05-24  476  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
