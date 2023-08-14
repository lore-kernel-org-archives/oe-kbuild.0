Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE79CA4B
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Aug 2023 19:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692042895; x=1723578895;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p1eVqHml22KXULKHsRdvgtJoN24jeTcyWPIbwruaZeQ=;
  b=CZCaLXJmh1rsktqifz3lVphOkPokDEuTU0TNBL0E2ycKvgmb4f01zq+C
   S3IzMtt2M7R2WzTWjLEHEuLrIt0V4KQXQxo+dxSuwklBj4c/FLQNNWGs5
   50BlQ9VUuVBHXSnzMupITW69JqTSFPi0Nq/adFuiPihK42Ucw6waGfjyd
   8pLKKlqLPt7PK/vqzz15P02Gyi3Lz7dsRB8GLDkEbzaCW9X9K1ygxVaIk
   ScyCgj0nmtUk8AjKNZpLVIYo9D3qxsXbamtEkvDGzn2GCtCLjOe6fyTpW
   fdb/MYH+WMvFqMjlDB11v5g3DfsCHixG9q2EqeVbvBX0QqJ6dQZ8atWPV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="438459812"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="438459812"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 12:54:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="1064191768"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="1064191768"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 14 Aug 2023 12:54:53 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVdeO-0000Nb-1f;
	Mon, 14 Aug 2023 19:54:52 +0000
Date: Tue, 15 Aug 2023 03:53:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [broonie-ci:v2_20230808_kuninori_morimoto_gx_asoc_merge_dai_call_back_functions_into_ops
 56/179] sound/soc/codecs/aw88261.c:1246 aw88261_i2c_probe() warn: passing
 zero to 'dev_err_probe'
Message-ID: <202308150315.CvOTIOKm-lkp@intel.com>
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
TO: Weidong Wang <wangweidong.a@awinic.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v2_20230808_kuninori_morimoto_gx_asoc_merge_dai_call_back_functions_into_ops
head:   8e1eb11cd4579decc8e928be2face7c43f2a9c67
commit: 028a2ae256916eeae1040049d2d0129535ace60e [56/179] ASoC: codecs: Add aw88261 amplifier driver
:::::: branch date: 8 hours ago
:::::: commit date: 7 days ago
config: nios2-randconfig-m031-20230814 (https://download.01.org/0day-ci/archive/20230815/202308150315.CvOTIOKm-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150315.CvOTIOKm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308150315.CvOTIOKm-lkp@intel.com/

New smatch warnings:
sound/soc/codecs/aw88261.c:1246 aw88261_i2c_probe() warn: passing zero to 'dev_err_probe'

Old smatch warnings:
sound/soc/codecs/aw88261.c:660 aw88261_reg_update() error: uninitialized symbol 'ret'.

vim +/dev_err_probe +1246 sound/soc/codecs/aw88261.c

028a2ae256916e Weidong Wang 2023-08-04  1238  
028a2ae256916e Weidong Wang 2023-08-04  1239  static int aw88261_i2c_probe(struct i2c_client *i2c)
028a2ae256916e Weidong Wang 2023-08-04  1240  {
028a2ae256916e Weidong Wang 2023-08-04  1241  	struct aw88261 *aw88261;
028a2ae256916e Weidong Wang 2023-08-04  1242  	int ret;
028a2ae256916e Weidong Wang 2023-08-04  1243  
028a2ae256916e Weidong Wang 2023-08-04  1244  	ret = i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C);
028a2ae256916e Weidong Wang 2023-08-04  1245  	if (!ret)
028a2ae256916e Weidong Wang 2023-08-04 @1246  		return dev_err_probe(&i2c->dev, ret, "check_functionality failed");
028a2ae256916e Weidong Wang 2023-08-04  1247  
028a2ae256916e Weidong Wang 2023-08-04  1248  	aw88261 = devm_kzalloc(&i2c->dev, sizeof(*aw88261), GFP_KERNEL);
028a2ae256916e Weidong Wang 2023-08-04  1249  	if (!aw88261)
028a2ae256916e Weidong Wang 2023-08-04  1250  		return -ENOMEM;
028a2ae256916e Weidong Wang 2023-08-04  1251  
028a2ae256916e Weidong Wang 2023-08-04  1252  	mutex_init(&aw88261->lock);
028a2ae256916e Weidong Wang 2023-08-04  1253  
028a2ae256916e Weidong Wang 2023-08-04  1254  	i2c_set_clientdata(i2c, aw88261);
028a2ae256916e Weidong Wang 2023-08-04  1255  
028a2ae256916e Weidong Wang 2023-08-04  1256  	aw88261->reset_gpio = devm_gpiod_get_optional(&i2c->dev, "reset", GPIOD_OUT_LOW);
028a2ae256916e Weidong Wang 2023-08-04  1257  	if (IS_ERR(aw88261->reset_gpio))
028a2ae256916e Weidong Wang 2023-08-04  1258  		dev_info(&i2c->dev, "reset gpio not defined\n");
028a2ae256916e Weidong Wang 2023-08-04  1259  	else
028a2ae256916e Weidong Wang 2023-08-04  1260  		aw88261_hw_reset(aw88261);
028a2ae256916e Weidong Wang 2023-08-04  1261  
028a2ae256916e Weidong Wang 2023-08-04  1262  	aw88261->regmap = devm_regmap_init_i2c(i2c, &aw88261_remap_config);
028a2ae256916e Weidong Wang 2023-08-04  1263  	if (IS_ERR(aw88261->regmap)) {
028a2ae256916e Weidong Wang 2023-08-04  1264  		ret = PTR_ERR(aw88261->regmap);
028a2ae256916e Weidong Wang 2023-08-04  1265  		return dev_err_probe(&i2c->dev, ret, "failed to init regmap: %d\n", ret);
028a2ae256916e Weidong Wang 2023-08-04  1266  	}
028a2ae256916e Weidong Wang 2023-08-04  1267  
028a2ae256916e Weidong Wang 2023-08-04  1268  	/* aw pa init */
028a2ae256916e Weidong Wang 2023-08-04  1269  	ret = aw88261_init(&aw88261, i2c, aw88261->regmap);
028a2ae256916e Weidong Wang 2023-08-04  1270  	if (ret)
028a2ae256916e Weidong Wang 2023-08-04  1271  		return ret;
028a2ae256916e Weidong Wang 2023-08-04  1272  
028a2ae256916e Weidong Wang 2023-08-04  1273  	ret = devm_snd_soc_register_component(&i2c->dev,
028a2ae256916e Weidong Wang 2023-08-04  1274  			&soc_codec_dev_aw88261,
028a2ae256916e Weidong Wang 2023-08-04  1275  			aw88261_dai, ARRAY_SIZE(aw88261_dai));
028a2ae256916e Weidong Wang 2023-08-04  1276  	if (ret)
028a2ae256916e Weidong Wang 2023-08-04  1277  		dev_err(&i2c->dev, "failed to register aw88261: %d", ret);
028a2ae256916e Weidong Wang 2023-08-04  1278  
028a2ae256916e Weidong Wang 2023-08-04  1279  	return ret;
028a2ae256916e Weidong Wang 2023-08-04  1280  }
028a2ae256916e Weidong Wang 2023-08-04  1281  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
