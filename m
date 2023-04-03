Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600BD364
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Apr 2023 04:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680497990; x=1712033990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZARAW94rOABJgeEJch+vVDKIPiI4QreiMmDsBTGdGfc=;
  b=e+yrVmFBP8yx184xl0IL/RlIHMVu7NoQvoVkku/1YB/8YSl7RNVUDoZY
   73/Qg4hIKkMum26LLNHl3pJD3Y79c1pcrS2u9DwW3Gid6wfFDd733DgUE
   RR8oSYChPXe5uE91LsvD7CDOow69V5F4cWbgAltfy18HXH9kyJIR/lbJB
   BrsdTfqaQt6GQa64KLffryN8orHfZ7KoVPp2Ds4BnufRE/ac7dzX6nQoy
   Wrm6Gepp3aS4X6/z18Ly/DihoTtCq15BKhOefZMgoabSRbmSI3IYhQOPm
   yKI+j+4yoltwvzTyh7+1Xkt0WUMu7dQAYT5uxdbJVoy3v7K8Pfn2C+iP6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="404563353"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; 
   d="scan'208";a="404563353"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 21:59:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="931875186"
X-IronPort-AV: E=Sophos;i="5.98,314,1673942400"; 
   d="scan'208";a="931875186"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Apr 2023 21:59:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjCIF-000Nzl-11;
	Mon, 03 Apr 2023 04:59:47 +0000
Date: Mon, 3 Apr 2023 12:59:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/codecs/wm8731.c:599 wm8731_init() warn: missing error
 code? 'ret'
Message-ID: <202304031220.ZcAQu78l-lkp@intel.com>
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
TO: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7e364e56293bb98cae1b55fd835f5991c4e96e7d
commit: 8875d104af6c237bfedb47309afd938984a3c05b ASoC: wm8731: Factor our MCLK and mutex initialisation
date:   12 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 12 months ago
config: parisc-randconfig-m041-20230403 (https://download.01.org/0day-ci/archive/20230403/202304031220.ZcAQu78l-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304031220.ZcAQu78l-lkp@intel.com/

smatch warnings:
sound/soc/codecs/wm8731.c:599 wm8731_init() warn: missing error code? 'ret'

vim +/ret +599 sound/soc/codecs/wm8731.c

5f1b9d1e424b91 Mark Brown     2022-03-25  586  
5f1b9d1e424b91 Mark Brown     2022-03-25  587  static int wm8731_init(struct device *dev, struct wm8731_priv *wm8731)
40e0aa64660b4e Richard Purdie 2006-10-06  588  {
f0fba2ad1b6b53 Liam Girdwood  2010-03-17  589  	int ret = 0, i;
a8035c8f044778 Mark Brown     2009-02-16  590  
8875d104af6c23 Mark Brown     2022-03-25  591  	wm8731->mclk = devm_clk_get(dev, "mclk");
8875d104af6c23 Mark Brown     2022-03-25  592  	if (IS_ERR(wm8731->mclk)) {
8875d104af6c23 Mark Brown     2022-03-25  593  		ret = PTR_ERR(wm8731->mclk);
8875d104af6c23 Mark Brown     2022-03-25  594  		if (ret == -ENOENT) {
8875d104af6c23 Mark Brown     2022-03-25  595  			wm8731->mclk = NULL;
8875d104af6c23 Mark Brown     2022-03-25  596  			dev_warn(dev, "Assuming static MCLK\n");
8875d104af6c23 Mark Brown     2022-03-25  597  		} else {
8875d104af6c23 Mark Brown     2022-03-25  598  			dev_err(dev, "Failed to get MCLK: %d\n", ret);
8875d104af6c23 Mark Brown     2022-03-25 @599  			return ret;
8875d104af6c23 Mark Brown     2022-03-25  600  		}
8875d104af6c23 Mark Brown     2022-03-25  601  	}
8875d104af6c23 Mark Brown     2022-03-25  602  
8875d104af6c23 Mark Brown     2022-03-25  603  	mutex_init(&wm8731->lock);
8875d104af6c23 Mark Brown     2022-03-25  604  
7dea7c01dac9b7 Mark Brown     2009-10-26  605  	for (i = 0; i < ARRAY_SIZE(wm8731->supplies); i++)
7dea7c01dac9b7 Mark Brown     2009-10-26  606  		wm8731->supplies[i].supply = wm8731_supply_names[i];
7dea7c01dac9b7 Mark Brown     2009-10-26  607  
6702dfcc571d96 Sergey Kiselev 2015-06-05  608  	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(wm8731->supplies),
7dea7c01dac9b7 Mark Brown     2009-10-26  609  				 wm8731->supplies);
7dea7c01dac9b7 Mark Brown     2009-10-26  610  	if (ret != 0) {
6702dfcc571d96 Sergey Kiselev 2015-06-05  611  		dev_err(dev, "Failed to request supplies: %d\n", ret);
f0fba2ad1b6b53 Liam Girdwood  2010-03-17  612  		return ret;
7dea7c01dac9b7 Mark Brown     2009-10-26  613  	}
7dea7c01dac9b7 Mark Brown     2009-10-26  614  
7dea7c01dac9b7 Mark Brown     2009-10-26  615  	ret = regulator_bulk_enable(ARRAY_SIZE(wm8731->supplies),
7dea7c01dac9b7 Mark Brown     2009-10-26  616  				    wm8731->supplies);
7dea7c01dac9b7 Mark Brown     2009-10-26  617  	if (ret != 0) {
6702dfcc571d96 Sergey Kiselev 2015-06-05  618  		dev_err(dev, "Failed to enable supplies: %d\n", ret);
3598aad5470deb Fabio Estevam  2014-04-24  619  		return ret;
7dea7c01dac9b7 Mark Brown     2009-10-26  620  	}
7dea7c01dac9b7 Mark Brown     2009-10-26  621  
6702dfcc571d96 Sergey Kiselev 2015-06-05  622  	ret = wm8731_reset(wm8731->regmap);
519cf2df5fb50c Mark Brown     2009-02-18  623  	if (ret < 0) {
6702dfcc571d96 Sergey Kiselev 2015-06-05  624  		dev_err(dev, "Failed to issue reset: %d\n", ret);
7dea7c01dac9b7 Mark Brown     2009-10-26  625  		goto err_regulator_enable;
519cf2df5fb50c Mark Brown     2009-02-18  626  	}
519cf2df5fb50c Mark Brown     2009-02-18  627  
6702dfcc571d96 Sergey Kiselev 2015-06-05  628  	/* Clear POWEROFF, keep everything else disabled */
6702dfcc571d96 Sergey Kiselev 2015-06-05  629  	regmap_write(wm8731->regmap, WM8731_PWR, 0x7f);
5998102b9095fd Mark Brown     2009-02-16  630  
5998102b9095fd Mark Brown     2009-02-16  631  	/* Latch the update bits */
6702dfcc571d96 Sergey Kiselev 2015-06-05  632  	regmap_update_bits(wm8731->regmap, WM8731_LOUT1V, 0x100, 0);
6702dfcc571d96 Sergey Kiselev 2015-06-05  633  	regmap_update_bits(wm8731->regmap, WM8731_ROUT1V, 0x100, 0);
6702dfcc571d96 Sergey Kiselev 2015-06-05  634  	regmap_update_bits(wm8731->regmap, WM8731_LINVOL, 0x100, 0);
6702dfcc571d96 Sergey Kiselev 2015-06-05  635  	regmap_update_bits(wm8731->regmap, WM8731_RINVOL, 0x100, 0);
5998102b9095fd Mark Brown     2009-02-16  636  
ce3bdaa8710c10 Mark Brown     2009-02-19  637  	/* Disable bypass path by default */
6702dfcc571d96 Sergey Kiselev 2015-06-05  638  	regmap_update_bits(wm8731->regmap, WM8731_APANA, 0x8, 0);
ce3bdaa8710c10 Mark Brown     2009-02-19  639  
6702dfcc571d96 Sergey Kiselev 2015-06-05  640  	regcache_mark_dirty(wm8731->regmap);
fe5422fc4ac221 Mark Brown     2009-07-05  641  
3f4fb905510911 Mark Brown     2022-03-25  642  	ret = devm_snd_soc_register_component(dev,
3f4fb905510911 Mark Brown     2022-03-25  643  			&soc_component_dev_wm8731, &wm8731_dai, 1);
3f4fb905510911 Mark Brown     2022-03-25  644  	if (ret != 0) {
3f4fb905510911 Mark Brown     2022-03-25  645  		dev_err(dev, "Failed to register CODEC: %d\n", ret);
3f4fb905510911 Mark Brown     2022-03-25  646  		goto err_regulator_enable;
3f4fb905510911 Mark Brown     2022-03-25  647  	}
3f4fb905510911 Mark Brown     2022-03-25  648  
3f4fb905510911 Mark Brown     2022-03-25  649  	return 0;
3f4fb905510911 Mark Brown     2022-03-25  650  
7dea7c01dac9b7 Mark Brown     2009-10-26  651  err_regulator_enable:
6702dfcc571d96 Sergey Kiselev 2015-06-05  652  	/* Regulators will be enabled by bias management */
7dea7c01dac9b7 Mark Brown     2009-10-26  653  	regulator_bulk_disable(ARRAY_SIZE(wm8731->supplies), wm8731->supplies);
f0fba2ad1b6b53 Liam Girdwood  2010-03-17  654  
fe5422fc4ac221 Mark Brown     2009-07-05  655  	return ret;
a8035c8f044778 Mark Brown     2009-02-16  656  }
a8035c8f044778 Mark Brown     2009-02-16  657  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
