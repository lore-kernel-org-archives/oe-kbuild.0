Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA93A6FB9
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Sep 2024 02:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727489599; cv=none; b=GZxNIqJi5FpLdAPnECqV9nHdqwgV96e5cGIq+tyUArIo052tkeDyrrJwUsC+h0prrxw+WrdTSMYDMT5CnokX1P8WnM97KeD/fQrb5BwzAmAFDJru1xKuj7KWGXDKSAHvcLfJV81cyTaxULLfmhUCobbpPfjEvgzb7qgSQ/EsQh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727489599; c=relaxed/simple;
	bh=McYLLSQkU0a4gkCD8INtnMQ9PYW7H/T1dAY6zjxM8AU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C2OXhHI5R2WpTf78Jk53un7ONNLALvbxx3cYxYLbIDCRJs11GnZc4kgobehgGper147dV4aG4jtepbDiQxP2Cbl/kH2RQhjytbdSndI9FZVh86OIiej0ldP1if7S4m+giL+2peqBkDIh6VIVMgE6fKQiIOamvbd1TbbvBF22ypQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nWkLdiYB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nWkLdiYB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727489595; x=1759025595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=McYLLSQkU0a4gkCD8INtnMQ9PYW7H/T1dAY6zjxM8AU=;
  b=nWkLdiYBWgcVYG3D397W0bkMH0+3a5r+AG44K4acBKgSP7774tSh1iTy
   9d+Iu/z9ny/UKTcTJ0ttL0yDbzANCpfNTOj5Uubn1JPWmLgKCaFBn88iz
   yJZVFZM28YBNaOZpDOCJEgLQ40sDra9sumMI5AHnxfsk0F+9RsQ5kSvP0
   2sqRQTvlvtACHrtt1R4vcSLXRawg6X54WKpDGprgYiJFFKJs1oLbEWnhw
   R0VKR6DOm4gqT1vM40PnBBu6H79bNL3GgHeBYtIMx+FHxtTNcDQ7Cl075
   J4QjAYq4mBEzf0nyxX41KJbonHhUSHr09ZiPsFnJ/o9hDx8omLEVTyquE
   g==;
X-CSE-ConnectionGUID: 8pkZROKZTHuGH1Is79IY9g==
X-CSE-MsgGUID: gv0TvyhRTumRIBElzis9bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="44113565"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="44113565"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 19:13:14 -0700
X-CSE-ConnectionGUID: 2EzMqybwRfCSq3U5yI84pQ==
X-CSE-MsgGUID: 5x5oUK9fTWi/mfIgQUBIVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="76797418"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Sep 2024 19:11:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suMw4-000MqF-2a;
	Sat, 28 Sep 2024 02:11:52 +0000
Date: Sat, 28 Sep 2024 10:11:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 6/6] ASoC: codecs: Add NeoFidelity NTP8835 codec
Message-ID: <202409281054.DUTb5KxU-lkp@intel.com>
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
In-Reply-To: <20240925-ntp-amps-8918-8835-v3-6-e2459a8191a6@salutedevices.com>
References: <20240925-ntp-amps-8918-8835-v3-6-e2459a8191a6@salutedevices.com>
TO: Igor Prusov <ivprusov@salutedevices.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Jaroslav Kysela <perex@perex.cz>
TO: Takashi Iwai <tiwai@suse.com>
TO: Igor Prusov <ivprusov@salutedevices.com>
TO: Philipp Zabel <p.zabel@pengutronix.de>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-sound@vger.kernel.org
CC: kernel@salutedevices.com
CC: prusovigor@gmail.com

Hi Igor,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c7fbbb45ef78ff349d16923b516bc8667367d1a6]

url:    https://github.com/intel-lab-lkp/linux/commits/Igor-Prusov/dt-bindings-vendor-prefixes-Add-NeoFidelity-Inc/20240925-230818
base:   c7fbbb45ef78ff349d16923b516bc8667367d1a6
patch link:    https://lore.kernel.org/r/20240925-ntp-amps-8918-8835-v3-6-e2459a8191a6%40salutedevices.com
patch subject: [PATCH v3 6/6] ASoC: codecs: Add NeoFidelity NTP8835 codec
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: alpha-randconfig-r072-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281054.DUTb5KxU-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409281054.DUTb5KxU-lkp@intel.com/

smatch warnings:
sound/soc/codecs/ntp8835.c:431 ntp8835_i2c_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +431 sound/soc/codecs/ntp8835.c

c4c94fd2babcb9 Igor Prusov 2024-09-25  411  
c4c94fd2babcb9 Igor Prusov 2024-09-25  412  static int ntp8835_i2c_probe(struct i2c_client *i2c)
c4c94fd2babcb9 Igor Prusov 2024-09-25  413  {
c4c94fd2babcb9 Igor Prusov 2024-09-25  414  	struct ntp8835_priv *ntp8835;
c4c94fd2babcb9 Igor Prusov 2024-09-25  415  	struct regmap *regmap;
c4c94fd2babcb9 Igor Prusov 2024-09-25  416  	int ret;
c4c94fd2babcb9 Igor Prusov 2024-09-25  417  
c4c94fd2babcb9 Igor Prusov 2024-09-25  418  	ntp8835 = devm_kzalloc(&i2c->dev, sizeof(*ntp8835), GFP_KERNEL);
c4c94fd2babcb9 Igor Prusov 2024-09-25  419  	if (!ntp8835)
c4c94fd2babcb9 Igor Prusov 2024-09-25  420  		return -ENOMEM;
c4c94fd2babcb9 Igor Prusov 2024-09-25  421  
c4c94fd2babcb9 Igor Prusov 2024-09-25  422  	ntp8835->i2c = i2c;
c4c94fd2babcb9 Igor Prusov 2024-09-25  423  
c4c94fd2babcb9 Igor Prusov 2024-09-25  424  	ntp8835->reset = devm_reset_control_get_shared(&i2c->dev, NULL);
c4c94fd2babcb9 Igor Prusov 2024-09-25  425  	if (IS_ERR(ntp8835->reset))
c4c94fd2babcb9 Igor Prusov 2024-09-25  426  		return dev_err_probe(&i2c->dev, PTR_ERR(ntp8835->reset),
c4c94fd2babcb9 Igor Prusov 2024-09-25  427  				     "Failed to get reset\n");
c4c94fd2babcb9 Igor Prusov 2024-09-25  428  
c4c94fd2babcb9 Igor Prusov 2024-09-25  429  	ret = reset_control_deassert(ntp8835->reset);
c4c94fd2babcb9 Igor Prusov 2024-09-25  430  	if (ret)
c4c94fd2babcb9 Igor Prusov 2024-09-25 @431  		return dev_err_probe(&i2c->dev, PTR_ERR(ntp8835->reset),
c4c94fd2babcb9 Igor Prusov 2024-09-25  432  				     "Failed to deassert reset\n");
c4c94fd2babcb9 Igor Prusov 2024-09-25  433  
c4c94fd2babcb9 Igor Prusov 2024-09-25  434  	dev_set_drvdata(&i2c->dev, ntp8835);
c4c94fd2babcb9 Igor Prusov 2024-09-25  435  
c4c94fd2babcb9 Igor Prusov 2024-09-25  436  	ntp8835_reset_gpio(ntp8835);
c4c94fd2babcb9 Igor Prusov 2024-09-25  437  
c4c94fd2babcb9 Igor Prusov 2024-09-25  438  	regmap = devm_regmap_init_i2c(i2c, &ntp8835_regmap);
c4c94fd2babcb9 Igor Prusov 2024-09-25  439  	if (IS_ERR(regmap))
c4c94fd2babcb9 Igor Prusov 2024-09-25  440  		return dev_err_probe(&i2c->dev, PTR_ERR(regmap),
c4c94fd2babcb9 Igor Prusov 2024-09-25  441  				     "Failed to allocate regmap\n");
c4c94fd2babcb9 Igor Prusov 2024-09-25  442  
c4c94fd2babcb9 Igor Prusov 2024-09-25  443  	ret = devm_snd_soc_register_component(&i2c->dev, &soc_component_ntp8835,
c4c94fd2babcb9 Igor Prusov 2024-09-25  444  					      &ntp8835_dai, 1);
c4c94fd2babcb9 Igor Prusov 2024-09-25  445  	if (ret)
c4c94fd2babcb9 Igor Prusov 2024-09-25  446  		return dev_err_probe(&i2c->dev, ret,
c4c94fd2babcb9 Igor Prusov 2024-09-25  447  				     "Failed to register component\n");
c4c94fd2babcb9 Igor Prusov 2024-09-25  448  
c4c94fd2babcb9 Igor Prusov 2024-09-25  449  	ntp8835->mclk = devm_clk_get_enabled(&i2c->dev, "mclk");
c4c94fd2babcb9 Igor Prusov 2024-09-25  450  	if (IS_ERR(ntp8835->mclk))
c4c94fd2babcb9 Igor Prusov 2024-09-25  451  		return dev_err_probe(&i2c->dev, PTR_ERR(ntp8835->mclk), "failed to get mclk\n");
c4c94fd2babcb9 Igor Prusov 2024-09-25  452  
c4c94fd2babcb9 Igor Prusov 2024-09-25  453  	return 0;
c4c94fd2babcb9 Igor Prusov 2024-09-25  454  }
c4c94fd2babcb9 Igor Prusov 2024-09-25  455  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
