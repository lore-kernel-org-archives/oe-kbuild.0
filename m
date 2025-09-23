Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4334C2741BC
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Sep 2025 02:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758595368; cv=none; b=pfMIlBTuk1B7TlLPhfnyGL3UrXc8hcklCp2+7AibFJk1YTnpCapEgXIdx49yGPUsaKexZXHvF2jRlahf20fzinSV8MabwyqHm39Qb37Aa73qxMDQ1g4gqD9NIdmW8uAK61+whIzQ348xH2fwJATjYtsvg/0y3xkmLyePzDqCpyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758595368; c=relaxed/simple;
	bh=+bQQUnyIZ4vAoOB7Bjv0ne4sEEcVaEqcxaKrCOUo83U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DxK9a81YEs7TX64sqA7gOnciKrAoIXefKwblKYGqsC9gChZFxjZ0IPPzlcJcJCDrKWjCEIzACDLaRi1rXIie4FWwdvH4OCaAK4fuTHqGWYz10kWQdO1mc4Hnw6DnHqd6jd1XJB2fSJe6NckOqA2hw5I6OlqPafDOAtiTgLj/82A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UTJndegQ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UTJndegQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758595366; x=1790131366;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+bQQUnyIZ4vAoOB7Bjv0ne4sEEcVaEqcxaKrCOUo83U=;
  b=UTJndegQRvhSlwxKjSjRt2lcju0zAEctRX+9am3XFPRn2nEghX9uNpca
   Vf5WFZ6Suq8BBEYeAyfO26VPSK4cVBLSP1X+XU9R788g8AdyL8sd50mq4
   BLBABvN6/HzEZQfxCwI9AzdTX3QJ5amO5/bHwd5AVGReKmnWP/OfnX5g8
   FbUGEf6F9hUYYqUsZZEacKsU1MD/Nh2Bt6rJUSRwj1Sn4giVtbOCIWOmu
   cAQ0FRGP7ILLhxldR6aNWHB7j5TQonL5vf/efT0CS+vUJjbqO+WFSMVju
   /v3xYXsuWI6Tq2JCjmx5mJRNDQZ+LpPhNKP479Pf/Dn0Tgsqs5yGhJ0Sg
   w==;
X-CSE-ConnectionGUID: 56EKQDveSGmRrbBecfHCZw==
X-CSE-MsgGUID: mFTuBm6IQISNt+Y/eSBAag==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="64691980"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="64691980"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 19:42:45 -0700
X-CSE-ConnectionGUID: /qTtztmETqysuMS6wHyAxA==
X-CSE-MsgGUID: TzyBZrArSV+fsA0sauaFyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="177427262"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Sep 2025 19:42:44 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0szK-0002gf-0G;
	Tue, 23 Sep 2025 02:42:42 +0000
Date: Tue, 23 Sep 2025 10:42:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] iio: temperature: add support for EMC1812
Message-ID: <202509231015.K3B5TN1Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250917-iio-emc1812-v1-2-0b1f74cea7ab@microchip.com>
References: <20250917-iio-emc1812-v1-2-0b1f74cea7ab@microchip.com>
TO: Marius Cristea <marius.cristea@microchip.com>
TO: Jonathan Cameron <jic23@kernel.org>
TO: David Lechner <dlechner@baylibre.com>
TO: "Nuno Sá" <nuno.sa@analog.com>
TO: Andy Shevchenko <andy@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-iio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Marius Cristea <marius.cristea@microchip.com>

Hi Marius,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Marius-Cristea/dt-bindings-iio-temperature-add-support-for-EMC1812/20250917-202833
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250917-iio-emc1812-v1-2-0b1f74cea7ab%40microchip.com
patch subject: [PATCH 2/2] iio: temperature: add support for EMC1812
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: powerpc64-randconfig-r071-20250922 (https://download.01.org/0day-ci/archive/20250923/202509231015.K3B5TN1Q-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cafc064fc7a96b3979a023ddae1da2b499d6c954)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509231015.K3B5TN1Q-lkp@intel.com/

smatch warnings:
drivers/iio/temperature/emc1812.c:645 emc1812_parse_fw_config() warn: passing zero to 'dev_err_probe'

vim +/dev_err_probe +645 drivers/iio/temperature/emc1812.c

56c661fffa897b2 Marius Cristea 2025-09-17  610  
56c661fffa897b2 Marius Cristea 2025-09-17  611  static int emc1812_parse_fw_config(struct emc1812_priv *priv, struct device *dev,
56c661fffa897b2 Marius Cristea 2025-09-17  612  				   int device_nr_channels)
56c661fffa897b2 Marius Cristea 2025-09-17  613  {
56c661fffa897b2 Marius Cristea 2025-09-17  614  	unsigned int reg_nr, iio_idx, tmp;
56c661fffa897b2 Marius Cristea 2025-09-17  615  	int ret;
56c661fffa897b2 Marius Cristea 2025-09-17  616  
56c661fffa897b2 Marius Cristea 2025-09-17  617  	priv->apdd_en = device_property_read_bool(dev, "microchip,enable-anti-parallel");
56c661fffa897b2 Marius Cristea 2025-09-17  618  	priv->recd12_en = device_property_read_bool(dev, "microchip,parasitic-res-on-channel1-2");
56c661fffa897b2 Marius Cristea 2025-09-17  619  	priv->recd34_en = device_property_read_bool(dev, "microchip,parasitic-res-on-channel3-4");
56c661fffa897b2 Marius Cristea 2025-09-17  620  
56c661fffa897b2 Marius Cristea 2025-09-17  621  	memset32(priv->beta_values, 16, ARRAY_SIZE(priv->beta_values));
56c661fffa897b2 Marius Cristea 2025-09-17  622  	device_property_read_u32(dev, "microchip,beta1", &priv->beta_values[0]);
56c661fffa897b2 Marius Cristea 2025-09-17  623  	device_property_read_u32(dev, "microchip,beta2", &priv->beta_values[1]);
56c661fffa897b2 Marius Cristea 2025-09-17  624  	if (priv->beta_values[0] > 16 || priv->beta_values[1] > 16)
56c661fffa897b2 Marius Cristea 2025-09-17  625  		return dev_err_probe(dev, -EINVAL, "Invalid beta value\n");
56c661fffa897b2 Marius Cristea 2025-09-17  626  
56c661fffa897b2 Marius Cristea 2025-09-17  627  	priv->num_channels = device_get_child_node_count(dev) + 1;
56c661fffa897b2 Marius Cristea 2025-09-17  628  
56c661fffa897b2 Marius Cristea 2025-09-17  629  	if (priv->num_channels > priv->chip->phys_channels)
56c661fffa897b2 Marius Cristea 2025-09-17  630  		return dev_err_probe(dev, -E2BIG, "More channels than the chip supports\n");
56c661fffa897b2 Marius Cristea 2025-09-17  631  
56c661fffa897b2 Marius Cristea 2025-09-17  632  	priv->iio_chan[0] = EMC1812_CHAN(0, 0, EMC1812_CH_ADDR(0));
56c661fffa897b2 Marius Cristea 2025-09-17  633  
56c661fffa897b2 Marius Cristea 2025-09-17  634  	priv->labels[0] = "internal_diode";
56c661fffa897b2 Marius Cristea 2025-09-17  635  	iio_idx = 1;
56c661fffa897b2 Marius Cristea 2025-09-17  636  	device_for_each_child_node_scoped(dev, child) {
56c661fffa897b2 Marius Cristea 2025-09-17  637  		ret = fwnode_property_read_u32(child, "reg", &reg_nr);
56c661fffa897b2 Marius Cristea 2025-09-17  638  		if (ret || reg_nr >= priv->chip->phys_channels)
56c661fffa897b2 Marius Cristea 2025-09-17  639  			return dev_err_probe(dev, -EINVAL,
56c661fffa897b2 Marius Cristea 2025-09-17  640  				     "The index of the channels does not match the chip\n");
56c661fffa897b2 Marius Cristea 2025-09-17  641  
56c661fffa897b2 Marius Cristea 2025-09-17  642  		ret = fwnode_property_read_u32(child, "microchip,ideality-factor", &tmp);
56c661fffa897b2 Marius Cristea 2025-09-17  643  		if (ret == 0) {
56c661fffa897b2 Marius Cristea 2025-09-17  644  			if (tmp < 8  || tmp > 63)
56c661fffa897b2 Marius Cristea 2025-09-17 @645  				return dev_err_probe(dev, ret, "Invalid ideality value\n");
56c661fffa897b2 Marius Cristea 2025-09-17  646  			priv->ideality_value[reg_nr - 1] = tmp;
56c661fffa897b2 Marius Cristea 2025-09-17  647  		} else {
56c661fffa897b2 Marius Cristea 2025-09-17  648  			priv->ideality_value[reg_nr - 1] = 18;
56c661fffa897b2 Marius Cristea 2025-09-17  649  		}
56c661fffa897b2 Marius Cristea 2025-09-17  650  
56c661fffa897b2 Marius Cristea 2025-09-17  651  		fwnode_property_read_string(child, "label", &priv->labels[reg_nr]);
56c661fffa897b2 Marius Cristea 2025-09-17  652  
56c661fffa897b2 Marius Cristea 2025-09-17  653  		priv->iio_chan[iio_idx++] = EMC1812_CHAN(reg_nr, reg_nr, EMC1812_CH_ADDR(reg_nr));
56c661fffa897b2 Marius Cristea 2025-09-17  654  	}
56c661fffa897b2 Marius Cristea 2025-09-17  655  
56c661fffa897b2 Marius Cristea 2025-09-17  656  	return 0;
56c661fffa897b2 Marius Cristea 2025-09-17  657  }
56c661fffa897b2 Marius Cristea 2025-09-17  658  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
