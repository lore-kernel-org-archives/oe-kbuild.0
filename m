Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35D71D523
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Nov 2023 19:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TlLsNQWB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699732410; x=1731268410;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ll0n/aNbEHLbddlAUeFqugJF3zwTcHFHzG9hpiBRKg0=;
  b=TlLsNQWBocRFbtVFvNjjYumFqTyRpGvVUAtTo7wmNia4x6pHRmucIJUD
   7+lP77DpYykzM9WIJWUMHcm2eyl0DHoHtDxBIIuVL/cawk7nmeUXp5o3E
   51NNbqHs6pyphPtMeXB8tIWyVH7H8xFc95QOG2LzvY8NHok0dZc2JFbhO
   lgDP2nnnQR3n+bBZSkmYde0B2+1zq0DwlJ9iYDC4OnVxOu6cYDPOfE5Ja
   Fkzat9WIhMD+wh521fKznOTxl2oA+rP/QTwNDJxCYLTSc3NrsvUFj86ey
   BkXNAxagZrQsQVOrgzsszV4KOHKO+cfvI9YPgMFFahLQ9cxUVoRMAh0xB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="389162978"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="389162978"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 11:53:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="907702382"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="907702382"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Nov 2023 11:53:28 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1u2o-000AiU-0t;
	Sat, 11 Nov 2023 19:53:26 +0000
Date: Sun, 12 Nov 2023 03:52:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/crypto/inside-secure/safexcel.c:1103:30: warning: '%d'
 directive output may be truncated writing between 1 and 10 bytes into a
 region of size 2
Message-ID: <202311120319.2ZVpDvrs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Pascal van Leeuwen <pvanleeuwen@insidesecure.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

Hi Pascal,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3ca112b71f35dd5d99fc4571a56b5fc6f0c15814
commit: 0f6e5c8234778f7dadf5789ce85ac1e062ebed9f crypto: inside-secure - make driver selectable for non-Marvell hardware
date:   4 years, 2 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 4 years, 2 months ago
config: x86_64-randconfig-r011-20230829 (https://download.01.org/0day-ci/archive/20231112/202311120319.2ZVpDvrs-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311120319.2ZVpDvrs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311120319.2ZVpDvrs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/inside-secure/safexcel.c: In function 'safexcel_probe':
>> drivers/crypto/inside-secure/safexcel.c:1103:30: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 2 [-Wformat-truncation=]
      snprintf(irq_name, 6, "ring%d", i);
                                 ^~
   drivers/crypto/inside-secure/safexcel.c:1103:25: note: directive argument in the range [0, 2147483647]
      snprintf(irq_name, 6, "ring%d", i);
                            ^~~~~~~~
   drivers/crypto/inside-secure/safexcel.c:1103:3: note: 'snprintf' output between 6 and 15 bytes into a destination of size 6
      snprintf(irq_name, 6, "ring%d", i);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/inside-secure/safexcel.c:1116:32: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 2 [-Wformat-truncation=]
      snprintf(wq_name, 9, "wq_ring%d", i);
                                   ^~
   drivers/crypto/inside-secure/safexcel.c:1116:24: note: directive argument in the range [0, 2147483647]
      snprintf(wq_name, 9, "wq_ring%d", i);
                           ^~~~~~~~~~~
   drivers/crypto/inside-secure/safexcel.c:1116:3: note: 'snprintf' output between 9 and 18 bytes into a destination of size 9
      snprintf(wq_name, 9, "wq_ring%d", i);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1103 drivers/crypto/inside-secure/safexcel.c

871df319bd48ac Antoine Tenart     2017-12-14   998  
1b44c5a60c137e Antoine Tenart     2017-05-24   999  static int safexcel_probe(struct platform_device *pdev)
1b44c5a60c137e Antoine Tenart     2017-05-24  1000  {
1b44c5a60c137e Antoine Tenart     2017-05-24  1001  	struct device *dev = &pdev->dev;
1b44c5a60c137e Antoine Tenart     2017-05-24  1002  	struct safexcel_crypto_priv *priv;
1b44c5a60c137e Antoine Tenart     2017-05-24  1003  	int i, ret;
1b44c5a60c137e Antoine Tenart     2017-05-24  1004  
1b44c5a60c137e Antoine Tenart     2017-05-24  1005  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
1b44c5a60c137e Antoine Tenart     2017-05-24  1006  	if (!priv)
1b44c5a60c137e Antoine Tenart     2017-05-24  1007  		return -ENOMEM;
1b44c5a60c137e Antoine Tenart     2017-05-24  1008  
1b44c5a60c137e Antoine Tenart     2017-05-24  1009  	priv->dev = dev;
871df319bd48ac Antoine Tenart     2017-12-14  1010  	priv->version = (enum safexcel_eip_version)of_device_get_match_data(dev);
871df319bd48ac Antoine Tenart     2017-12-14  1011  
5eb0911894b17e Antoine Tenart     2018-06-28  1012  	if (priv->version == EIP197B || priv->version == EIP197D)
53c83e915ce8b2 Antoine Tenart     2018-06-28  1013  		priv->flags |= EIP197_TRC_CACHE;
53c83e915ce8b2 Antoine Tenart     2018-06-28  1014  
871df319bd48ac Antoine Tenart     2017-12-14  1015  	safexcel_init_register_offsets(priv);
1b44c5a60c137e Antoine Tenart     2017-05-24  1016  
f8dab5575b76ea YueHaibing         2019-08-02  1017  	priv->base = devm_platform_ioremap_resource(pdev, 0);
1b44c5a60c137e Antoine Tenart     2017-05-24  1018  	if (IS_ERR(priv->base)) {
1b44c5a60c137e Antoine Tenart     2017-05-24  1019  		dev_err(dev, "failed to get resource\n");
1b44c5a60c137e Antoine Tenart     2017-05-24  1020  		return PTR_ERR(priv->base);
1b44c5a60c137e Antoine Tenart     2017-05-24  1021  	}
1b44c5a60c137e Antoine Tenart     2017-05-24  1022  
f962eb46e7a9b9 Gregory CLEMENT    2018-03-13  1023  	priv->clk = devm_clk_get(&pdev->dev, NULL);
5b37689653cbe7 Gregory CLEMENT    2018-03-13  1024  	ret = PTR_ERR_OR_ZERO(priv->clk);
5b37689653cbe7 Gregory CLEMENT    2018-03-13  1025  	/* The clock isn't mandatory */
5b37689653cbe7 Gregory CLEMENT    2018-03-13  1026  	if  (ret != -ENOENT) {
5b37689653cbe7 Gregory CLEMENT    2018-03-13  1027  		if (ret)
5b37689653cbe7 Gregory CLEMENT    2018-03-13  1028  			return ret;
5b37689653cbe7 Gregory CLEMENT    2018-03-13  1029  
1b44c5a60c137e Antoine Tenart     2017-05-24  1030  		ret = clk_prepare_enable(priv->clk);
1b44c5a60c137e Antoine Tenart     2017-05-24  1031  		if (ret) {
1b44c5a60c137e Antoine Tenart     2017-05-24  1032  			dev_err(dev, "unable to enable clk (%d)\n", ret);
1b44c5a60c137e Antoine Tenart     2017-05-24  1033  			return ret;
1b44c5a60c137e Antoine Tenart     2017-05-24  1034  		}
1b44c5a60c137e Antoine Tenart     2017-05-24  1035  	}
1b44c5a60c137e Antoine Tenart     2017-05-24  1036  
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1037  	priv->reg_clk = devm_clk_get(&pdev->dev, "reg");
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1038  	ret = PTR_ERR_OR_ZERO(priv->reg_clk);
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1039  	/* The clock isn't mandatory */
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1040  	if  (ret != -ENOENT) {
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1041  		if (ret)
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1042  			goto err_core_clk;
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1043  
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1044  		ret = clk_prepare_enable(priv->reg_clk);
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1045  		if (ret) {
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1046  			dev_err(dev, "unable to enable reg clk (%d)\n", ret);
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1047  			goto err_core_clk;
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1048  		}
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1049  	}
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1050  
a2069aacbe58a8 Antoine Tenart     2017-06-23  1051  	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
1b44c5a60c137e Antoine Tenart     2017-05-24  1052  	if (ret)
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1053  		goto err_reg_clk;
1b44c5a60c137e Antoine Tenart     2017-05-24  1054  
1b44c5a60c137e Antoine Tenart     2017-05-24  1055  	priv->context_pool = dmam_pool_create("safexcel-context", dev,
1b44c5a60c137e Antoine Tenart     2017-05-24  1056  					      sizeof(struct safexcel_context_record),
1b44c5a60c137e Antoine Tenart     2017-05-24  1057  					      1, 0);
1b44c5a60c137e Antoine Tenart     2017-05-24  1058  	if (!priv->context_pool) {
1b44c5a60c137e Antoine Tenart     2017-05-24  1059  		ret = -ENOMEM;
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1060  		goto err_reg_clk;
1b44c5a60c137e Antoine Tenart     2017-05-24  1061  	}
1b44c5a60c137e Antoine Tenart     2017-05-24  1062  
1b44c5a60c137e Antoine Tenart     2017-05-24  1063  	safexcel_configure(priv);
1b44c5a60c137e Antoine Tenart     2017-05-24  1064  
329e09893909d4 Kees Cook          2018-10-05  1065  	priv->ring = devm_kcalloc(dev, priv->config.rings,
329e09893909d4 Kees Cook          2018-10-05  1066  				  sizeof(*priv->ring),
18e0e95b82e444 Ofer Heifetz       2018-06-28  1067  				  GFP_KERNEL);
18e0e95b82e444 Ofer Heifetz       2018-06-28  1068  	if (!priv->ring) {
18e0e95b82e444 Ofer Heifetz       2018-06-28  1069  		ret = -ENOMEM;
18e0e95b82e444 Ofer Heifetz       2018-06-28  1070  		goto err_reg_clk;
18e0e95b82e444 Ofer Heifetz       2018-06-28  1071  	}
18e0e95b82e444 Ofer Heifetz       2018-06-28  1072  
1b44c5a60c137e Antoine Tenart     2017-05-24  1073  	for (i = 0; i < priv->config.rings; i++) {
1b44c5a60c137e Antoine Tenart     2017-05-24  1074  		char irq_name[6] = {0}; /* "ringX\0" */
1b44c5a60c137e Antoine Tenart     2017-05-24  1075  		char wq_name[9] = {0}; /* "wq_ringX\0" */
1b44c5a60c137e Antoine Tenart     2017-05-24  1076  		int irq;
1b44c5a60c137e Antoine Tenart     2017-05-24  1077  		struct safexcel_ring_irq_data *ring_irq;
1b44c5a60c137e Antoine Tenart     2017-05-24  1078  
1b44c5a60c137e Antoine Tenart     2017-05-24  1079  		ret = safexcel_init_ring_descriptors(priv,
1b44c5a60c137e Antoine Tenart     2017-05-24  1080  						     &priv->ring[i].cdr,
1b44c5a60c137e Antoine Tenart     2017-05-24  1081  						     &priv->ring[i].rdr);
1b44c5a60c137e Antoine Tenart     2017-05-24  1082  		if (ret)
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1083  			goto err_reg_clk;
1b44c5a60c137e Antoine Tenart     2017-05-24  1084  
329e09893909d4 Kees Cook          2018-10-05  1085  		priv->ring[i].rdr_req = devm_kcalloc(dev,
329e09893909d4 Kees Cook          2018-10-05  1086  			EIP197_DEFAULT_RING_SIZE,
329e09893909d4 Kees Cook          2018-10-05  1087  			sizeof(priv->ring[i].rdr_req),
9744fec95f0674 Ofer Heifetz       2018-06-28  1088  			GFP_KERNEL);
9744fec95f0674 Ofer Heifetz       2018-06-28  1089  		if (!priv->ring[i].rdr_req) {
9744fec95f0674 Ofer Heifetz       2018-06-28  1090  			ret = -ENOMEM;
9744fec95f0674 Ofer Heifetz       2018-06-28  1091  			goto err_reg_clk;
9744fec95f0674 Ofer Heifetz       2018-06-28  1092  		}
9744fec95f0674 Ofer Heifetz       2018-06-28  1093  
1b44c5a60c137e Antoine Tenart     2017-05-24  1094  		ring_irq = devm_kzalloc(dev, sizeof(*ring_irq), GFP_KERNEL);
1b44c5a60c137e Antoine Tenart     2017-05-24  1095  		if (!ring_irq) {
1b44c5a60c137e Antoine Tenart     2017-05-24  1096  			ret = -ENOMEM;
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1097  			goto err_reg_clk;
1b44c5a60c137e Antoine Tenart     2017-05-24  1098  		}
1b44c5a60c137e Antoine Tenart     2017-05-24  1099  
1b44c5a60c137e Antoine Tenart     2017-05-24  1100  		ring_irq->priv = priv;
1b44c5a60c137e Antoine Tenart     2017-05-24  1101  		ring_irq->ring = i;
1b44c5a60c137e Antoine Tenart     2017-05-24  1102  
1b44c5a60c137e Antoine Tenart     2017-05-24 @1103  		snprintf(irq_name, 6, "ring%d", i);
1b44c5a60c137e Antoine Tenart     2017-05-24  1104  		irq = safexcel_request_ring_irq(pdev, irq_name, safexcel_irq_ring,
69ee4dd5ea8ce0 Antoine Tenart     2017-12-14  1105  						safexcel_irq_ring_thread,
1b44c5a60c137e Antoine Tenart     2017-05-24  1106  						ring_irq);
b7d65fe18129e2 Christophe Jaillet 2017-08-15  1107  		if (irq < 0) {
b7d65fe18129e2 Christophe Jaillet 2017-08-15  1108  			ret = irq;
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1109  			goto err_reg_clk;
b7d65fe18129e2 Christophe Jaillet 2017-08-15  1110  		}
1b44c5a60c137e Antoine Tenart     2017-05-24  1111  
1b44c5a60c137e Antoine Tenart     2017-05-24  1112  		priv->ring[i].work_data.priv = priv;
1b44c5a60c137e Antoine Tenart     2017-05-24  1113  		priv->ring[i].work_data.ring = i;
8472e778108cc6 Antoine Tenart     2017-12-14  1114  		INIT_WORK(&priv->ring[i].work_data.work, safexcel_dequeue_work);
1b44c5a60c137e Antoine Tenart     2017-05-24  1115  
1b44c5a60c137e Antoine Tenart     2017-05-24  1116  		snprintf(wq_name, 9, "wq_ring%d", i);
1b44c5a60c137e Antoine Tenart     2017-05-24  1117  		priv->ring[i].workqueue = create_singlethread_workqueue(wq_name);
1b44c5a60c137e Antoine Tenart     2017-05-24  1118  		if (!priv->ring[i].workqueue) {
1b44c5a60c137e Antoine Tenart     2017-05-24  1119  			ret = -ENOMEM;
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1120  			goto err_reg_clk;
1b44c5a60c137e Antoine Tenart     2017-05-24  1121  		}
1b44c5a60c137e Antoine Tenart     2017-05-24  1122  
f7268c538b3d84 Antoine Tenart     2018-02-13  1123  		priv->ring[i].requests = 0;
dc7e28a3286ed4 Antoine Tenart     2017-12-14  1124  		priv->ring[i].busy = false;
dc7e28a3286ed4 Antoine Tenart     2017-12-14  1125  
86671abbbbfc95 Antoine Tenart     2017-06-15  1126  		crypto_init_queue(&priv->ring[i].queue,
86671abbbbfc95 Antoine Tenart     2017-06-15  1127  				  EIP197_DEFAULT_RING_SIZE);
86671abbbbfc95 Antoine Tenart     2017-06-15  1128  
1b44c5a60c137e Antoine Tenart     2017-05-24  1129  		spin_lock_init(&priv->ring[i].lock);
86671abbbbfc95 Antoine Tenart     2017-06-15  1130  		spin_lock_init(&priv->ring[i].queue_lock);
1b44c5a60c137e Antoine Tenart     2017-05-24  1131  	}
1b44c5a60c137e Antoine Tenart     2017-05-24  1132  
1b44c5a60c137e Antoine Tenart     2017-05-24  1133  	platform_set_drvdata(pdev, priv);
1b44c5a60c137e Antoine Tenart     2017-05-24  1134  	atomic_set(&priv->ring_used, 0);
1b44c5a60c137e Antoine Tenart     2017-05-24  1135  
1b44c5a60c137e Antoine Tenart     2017-05-24  1136  	ret = safexcel_hw_init(priv);
1b44c5a60c137e Antoine Tenart     2017-05-24  1137  	if (ret) {
1b44c5a60c137e Antoine Tenart     2017-05-24  1138  		dev_err(dev, "EIP h/w init failed (%d)\n", ret);
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1139  		goto err_reg_clk;
1b44c5a60c137e Antoine Tenart     2017-05-24  1140  	}
1b44c5a60c137e Antoine Tenart     2017-05-24  1141  
1b44c5a60c137e Antoine Tenart     2017-05-24  1142  	ret = safexcel_register_algorithms(priv);
1b44c5a60c137e Antoine Tenart     2017-05-24  1143  	if (ret) {
1b44c5a60c137e Antoine Tenart     2017-05-24  1144  		dev_err(dev, "Failed to register algorithms (%d)\n", ret);
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1145  		goto err_reg_clk;
1b44c5a60c137e Antoine Tenart     2017-05-24  1146  	}
1b44c5a60c137e Antoine Tenart     2017-05-24  1147  
1b44c5a60c137e Antoine Tenart     2017-05-24  1148  	return 0;
1b44c5a60c137e Antoine Tenart     2017-05-24  1149  
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1150  err_reg_clk:
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1151  	clk_disable_unprepare(priv->reg_clk);
1d17cbfbb55cd8 Gregory CLEMENT    2018-03-13  1152  err_core_clk:
1b44c5a60c137e Antoine Tenart     2017-05-24  1153  	clk_disable_unprepare(priv->clk);
1b44c5a60c137e Antoine Tenart     2017-05-24  1154  	return ret;
1b44c5a60c137e Antoine Tenart     2017-05-24  1155  }
1b44c5a60c137e Antoine Tenart     2017-05-24  1156  

:::::: The code at line 1103 was first introduced by commit
:::::: 1b44c5a60c137e5fd0c2c8b86e58fdbc9cd181ce crypto: inside-secure - add SafeXcel EIP197 crypto engine driver

:::::: TO: Antoine Ténart <antoine.tenart@free-electrons.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
