Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1072110F4
	for <oe-kbuild@lists.linux.dev>; Wed, 29 May 2024 03:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716954831; cv=none; b=YJrIpDfNRFXpxU6l1bE7PJbefmYFXSxoZRYxNhLB+AIz4W1ewBOo/qOstkpwyK8n3e/QsRGnfuHXxNIr6MzRsYD9QTdbATFsVlowF2qM84CqEZ5KSLAD+Tt4xeeg4beY14hA6Hm5ei4bI4ExsTrnM+paVm26xYqaow4rHN2ZRUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716954831; c=relaxed/simple;
	bh=UEZPndS6/T5YHylthPNLjqhH2h+pqQH7WmoQsSy2wMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p7sj2l8ZizzR4GDDOgKpBOOek3sLGOncic39HVYQdvTD/DUcBkfY9VnGw0LZY5x+fJKwkVPeWoizKMXwTK2WUq4sr9kP4/ha4cgw5VGXPlkm21YPyesnLKThBfEg2sE0dGWqlWYKj8WF50OaDtTp7DdqyzIOj8wMjaiV5mJtlRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PnsH/5D+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PnsH/5D+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716954830; x=1748490830;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UEZPndS6/T5YHylthPNLjqhH2h+pqQH7WmoQsSy2wMY=;
  b=PnsH/5D+yqmq7g+IRlUut0G/P1ZvjjAiC8/xR9nb0C3DMn3IDbgVzU2r
   xT329wtuksAaSfLTd0HDC7lD+ehbZB8o9aQRpAOra/p5Aa80BmsOQAZmQ
   TaihA1eA3qHIJ2+7/nss6pPQBQFdXy0heXhqxwuFjjIl4rx79QJXSGoOz
   IHWOzTbS9lbBa1IEyiAMipqVfhq8/pObFT5v1MUOsc1cj5P2fpCnmQhsj
   3fBJclOTN3do7xQ9akeJ23BCom00AhItZumbNhq+A3H8ryLcI8nZljCaQ
   6GSN3Ylx35UEYbDwsja/s4PrZ+KM1r63yHNK/muf1jJR0qHj717UR4u7I
   A==;
X-CSE-ConnectionGUID: ci4L1SLfTruJ49C7Nau8Sw==
X-CSE-MsgGUID: G7KWM71dT2W2BCqCL7wVOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13185428"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="13185428"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 20:53:50 -0700
X-CSE-ConnectionGUID: rPd5NUmOQP+0yq/plOu+vQ==
X-CSE-MsgGUID: Tm9pXWEoSWGILxVtqFoeGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="40120749"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 28 May 2024 20:53:48 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCAN5-000D59-0H;
	Wed, 29 May 2024 03:53:16 +0000
Date: Wed, 29 May 2024 11:52:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1 2/2] iio: adc: ti-ads1119: Add driver
Message-ID: <202405291150.r5z8TZYu-lkp@intel.com>
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
In-Reply-To: <20240527154050.24975-3-francesco@dolcini.it>
References: <20240527154050.24975-3-francesco@dolcini.it>
TO: Francesco Dolcini <francesco@dolcini.it>
TO: Jonathan Cameron <jic23@kernel.org>
TO: "Lars-Peter Clausen" <lars@metafoo.de>
TO: Francesco Dolcini <francesco@dolcini.it>
TO: "João Paulo Gonçalves" <jpaulo.silvagoncalves@gmail.com>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: linux-iio@vger.kernel.org

Hi Francesco,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on linus/master v6.10-rc1 next-20240528]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Francesco-Dolcini/dt-bindings-iio-adc-add-ti-ads1119/20240527-234431
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20240527154050.24975-3-francesco%40dolcini.it
patch subject: [PATCH v1 2/2] iio: adc: ti-ads1119: Add driver
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-r071-20240529 (https://download.01.org/0day-ci/archive/20240529/202405291150.r5z8TZYu-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405291150.r5z8TZYu-lkp@intel.com/

New smatch warnings:
drivers/iio/adc/ti-ads1119.c:629 ads1119_alloc_and_config_channels() warn: potentially one past the end of array 'st->channels_cfg[index]'
drivers/iio/adc/ti-ads1119.c:629 ads1119_alloc_and_config_channels() warn: potentially one past the end of array 'st->channels_cfg[index]'
drivers/iio/adc/ti-ads1119.c:653 ads1119_get_configs() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
drivers/iio/adc/ti-ads1119.c:632 ads1119_alloc_and_config_channels() warn: potentially one past the end of array 'st->channels_cfg[index]'
drivers/iio/adc/ti-ads1119.c:632 ads1119_alloc_and_config_channels() warn: potentially one past the end of array 'st->channels_cfg[index]'

vim +629 drivers/iio/adc/ti-ads1119.c

14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  598  
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  599  static int ads1119_alloc_and_config_channels(struct ads1119_state *st)
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  600  {
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  601  	struct device *dev = &st->client->dev;
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  602  	int num_channels, gain, datarate;
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  603  	struct fwnode_handle *node;
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  604  	int ret, index;
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  605  
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  606  	/* Last channel is not a hw channel (timestamp) */
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  607  	num_channels = st->data->num_channels - 1;
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  608  
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  609  	st->channels_cfg = devm_kcalloc(dev, num_channels,
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  610  					sizeof(*st->channels_cfg),
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  611  					GFP_KERNEL);
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  612  	if (!st->channels_cfg)
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  613  		return -ENOMEM;
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  614  
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  615  	for (index = 0; index < num_channels; index++) {
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  616  		st->channels_cfg[index].gain = ADS1119_DEFAULT_GAIN;
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  617  		st->channels_cfg[index].datarate = ADS1119_DEFAULT_DATARATE;
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  618  	}
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  619  
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  620  	device_for_each_child_node(dev, node) {
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  621  		ret = fwnode_property_read_u32(node, "reg", &index);
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  622  		if (ret) {
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  623  			fwnode_handle_put(node);
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  624  			return dev_err_probe(dev, ret,
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  625  					     "Failed to configure channels\n");
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  626  		}
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  627  
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  628  		if (!fwnode_property_read_u32(node, "ti,gain", &gain))
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27 @629  			st->channels_cfg[index].gain = gain;
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  630  
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  631  		if (!fwnode_property_read_u32(node, "ti,datarate", &datarate))
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  632  			st->channels_cfg[index].datarate = datarate;
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  633  
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  634  		dev_dbg(dev, "channel config %d: gain %d, datarate %d\n",
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  635  			index, st->channels_cfg[index].gain,
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  636  			st->channels_cfg[index].datarate);
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  637  	}
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  638  
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  639  	return 0;
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  640  }
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  641  
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  642  static int ads1119_get_configs(struct ads1119_state *st)
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  643  {
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  644  	struct device *dev = &st->client->dev;
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  645  
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  646  	st->vref = devm_regulator_get_optional(dev, "vref");
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  647  	if (IS_ERR(st->vref))
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  648  		return dev_err_probe(dev, PTR_ERR(st->vref),
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  649  				     "Failed to get vref\n");
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  650  
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  651  	st->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  652  	if (IS_ERR(st->reset_gpio))
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27 @653  		return dev_err_probe(dev, PTR_ERR(st->vref),
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  654  				     "Failed to get reset gpio\n");
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  655  
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  656  	return ads1119_alloc_and_config_channels(st);
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  657  }
14caaeae0e22b3 João Paulo Gonçalves 2024-05-27  658  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
