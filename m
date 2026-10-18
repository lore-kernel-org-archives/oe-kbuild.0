Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4754CF46F
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Oct 2026 07:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309958; cv=none; b=rcsdYP7bIsBOH6MnfIM4qH7ggPdIxFcdkCfXV70l+2gQdksuZ/IxiZoZQWxl2yx15mCf2cZCzp2CsA/yP/WScm49nMT0OiZdyAl0LhvmIttoLpaSdALE7ZbcStrhE3f54tN3Ky31cPJwOwKX3sb1SE8Px5+Kh/dTrnGhv0IBXNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309958; c=relaxed/simple;
	bh=QsxfrIicnVL4l0F3W1yHpOW/fjO5e9LdH0dT0n0Slvk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EcznfwBBi8XL4T1MeJJEZjaRYLJyEBWdoCbkqwczXstrlJdh1A8Zt2UovVCttgT5dYYfVjUVo5ov2R/CGyRXSJ6seWy677O64cUJ2scJTtzXt/nT/Ej3GTSayQfuNELDZNdMyVE4JLQdWU8KU0w4cMYhOZ3t0vCzpwefWILhlwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oHt3Q9O8; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oHt3Q9O8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309955; x=1823845955;
  h=date:from:to:cc:subject:message-id;
  bh=QsxfrIicnVL4l0F3W1yHpOW/fjO5e9LdH0dT0n0Slvk=;
  b=oHt3Q9O8m8RV3qXzuLzdo6k5KeuY+XslgA5OZguM0jjvM9tywIYnR5AZ
   wWyvYiq67wIEHxoxo1Xyp2QFQWyNGCPma6VRurOOgLSax/onD+qdi+GII
   FjubVHOJ6jy6gv3CmmeGXSysCSnTphCpmvuUtX+HqTLW9XqaEMi7wZFah
   9epgONKfdRBEEa/owi389Xu7DKlFas5ZvhGsMXTxaNWhBQkF6uCtTgaaj
   bQY51ddWtpu5P0afIs0V2e4FmVbFOvfopruvRY3xfZqexBd1sDHxQV5m6
   LVkiQXiTsoerHbcsbAUvgQgeJSMZ2N0L4d7FRbfrjFa4mEJHW5YpXWkrM
   Q==;
X-CSE-ConnectionGUID: DDdoTdRuSIKD8+AYLBHyOQ==
X-CSE-MsgGUID: 14b0lYydSke9dJiKBpxpQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="908837"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="908837"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:35 -0700
X-CSE-ConnectionGUID: Jbt3fXIkRyqlwA+2OS1vuA==
X-CSE-MsgGUID: JKEHbkbqTIa6Q8GZ4XEt8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="4115528"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 18 Oct 2026 00:52:34 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh1-000000004vs-3con;
	Sun, 18 Oct 2026 07:52:31 +0000
Date: Sun, 18 Oct 2026 09:50:37 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [broonie-sound:for-7.4 65/72]
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c:1610 mtk_dai_etdm_startup() warn:
 missing unwind goto?
Message-ID: <202610180401.HuIoGPEA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: bui duc phuc <phucduc.bui@gmail.com>
CC: Mark Brown <broonie@kernel.org>
CC: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4
head:   ba982c33278c1fc739c8c220f410d6539de9d9b9
commit: 8e67c67f3fd2505b8b7a9dd38d8dabe47273490d [65/72] ASoC: mediatek: mt8195: Fix ETDM startup error handling
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: nios2-randconfig-r2202-20261017 (https://download.01.org/0day-ci/archive/20261018/202610180401.HuIoGPEA-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610180401.HuIoGPEA-lkp@intel.com/

smatch warnings:
sound/soc/mediatek/mt8195/mt8195-dai-etdm.c:1610 mtk_dai_etdm_startup() warn: missing unwind goto?

vim +1610 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c

1de9a54acafba2 Trevor Wu    2021-08-19  1567  
1de9a54acafba2 Trevor Wu    2021-08-19  1568  /* dai ops */
1de9a54acafba2 Trevor Wu    2021-08-19  1569  static int mtk_dai_etdm_startup(struct snd_pcm_substream *substream,
1de9a54acafba2 Trevor Wu    2021-08-19  1570  				struct snd_soc_dai *dai)
1de9a54acafba2 Trevor Wu    2021-08-19  1571  {
1de9a54acafba2 Trevor Wu    2021-08-19  1572  	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
1de9a54acafba2 Trevor Wu    2021-08-19  1573  	struct mt8195_afe_private *afe_priv = afe->platform_priv;
1de9a54acafba2 Trevor Wu    2021-08-19  1574  	struct mtk_dai_etdm_priv *mst_etdm_data;
1de9a54acafba2 Trevor Wu    2021-08-19  1575  	int cg_id;
1de9a54acafba2 Trevor Wu    2021-08-19  1576  	int mst_dai_id;
1de9a54acafba2 Trevor Wu    2021-08-19  1577  	int slv_dai_id;
8e67c67f3fd250 bui duc phuc 2026-10-14  1578  	int i, ret;
1de9a54acafba2 Trevor Wu    2021-08-19  1579  
1de9a54acafba2 Trevor Wu    2021-08-19  1580  	if (is_cowork_mode(dai)) {
1de9a54acafba2 Trevor Wu    2021-08-19  1581  		mst_dai_id = get_etdm_cowork_master_id(dai);
ff728899065922 Trevor Wu    2023-03-07  1582  		if (!mt8195_afe_etdm_is_valid(mst_dai_id))
ff728899065922 Trevor Wu    2023-03-07  1583  			return -EINVAL;
1de9a54acafba2 Trevor Wu    2021-08-19  1584  
8e67c67f3fd250 bui duc phuc 2026-10-14  1585  		ret = mtk_dai_etdm_enable_mclk(afe, mst_dai_id);
8e67c67f3fd250 bui duc phuc 2026-10-14  1586  		if (ret)
8e67c67f3fd250 bui duc phuc 2026-10-14  1587  			return ret;
1de9a54acafba2 Trevor Wu    2021-08-19  1588  		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(mst_dai_id);
8e67c67f3fd250 bui duc phuc 2026-10-14  1589  		if (cg_id >= 0) {
8e67c67f3fd250 bui duc phuc 2026-10-14  1590  			ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
8e67c67f3fd250 bui duc phuc 2026-10-14  1591  			if (ret)
8e67c67f3fd250 bui duc phuc 2026-10-14  1592  				goto err_disable_mclk;
8e67c67f3fd250 bui duc phuc 2026-10-14  1593  		}
1de9a54acafba2 Trevor Wu    2021-08-19  1594  
1de9a54acafba2 Trevor Wu    2021-08-19  1595  		mst_etdm_data = afe_priv->dai_priv[mst_dai_id];
1de9a54acafba2 Trevor Wu    2021-08-19  1596  
1de9a54acafba2 Trevor Wu    2021-08-19  1597  		for (i = 0; i < mst_etdm_data->cowork_slv_count; i++) {
1de9a54acafba2 Trevor Wu    2021-08-19  1598  			slv_dai_id = mst_etdm_data->cowork_slv_id[i];
1de9a54acafba2 Trevor Wu    2021-08-19  1599  			cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(slv_dai_id);
8e67c67f3fd250 bui duc phuc 2026-10-14  1600  			if (cg_id >= 0) {
8e67c67f3fd250 bui duc phuc 2026-10-14  1601  				ret = mt8195_afe_enable_clk(afe,
1de9a54acafba2 Trevor Wu    2021-08-19  1602  							    afe_priv->clk[cg_id]);
8e67c67f3fd250 bui duc phuc 2026-10-14  1603  				if (ret)
8e67c67f3fd250 bui duc phuc 2026-10-14  1604  					goto err_disable_slv_clk;
8e67c67f3fd250 bui duc phuc 2026-10-14  1605  			}
1de9a54acafba2 Trevor Wu    2021-08-19  1606  		}
1de9a54acafba2 Trevor Wu    2021-08-19  1607  	} else {
8e67c67f3fd250 bui duc phuc 2026-10-14  1608  		ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
8e67c67f3fd250 bui duc phuc 2026-10-14  1609  		if (ret)
8e67c67f3fd250 bui duc phuc 2026-10-14 @1610  			return ret;
1de9a54acafba2 Trevor Wu    2021-08-19  1611  
1de9a54acafba2 Trevor Wu    2021-08-19  1612  		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(dai->id);
8e67c67f3fd250 bui duc phuc 2026-10-14  1613  		if (cg_id >= 0) {
8e67c67f3fd250 bui duc phuc 2026-10-14  1614  			ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
8e67c67f3fd250 bui duc phuc 2026-10-14  1615  			if (ret)
8e67c67f3fd250 bui duc phuc 2026-10-14  1616  				goto err_disable_mclk;
8e67c67f3fd250 bui duc phuc 2026-10-14  1617  		}
1de9a54acafba2 Trevor Wu    2021-08-19  1618  	}
1de9a54acafba2 Trevor Wu    2021-08-19  1619  
1de9a54acafba2 Trevor Wu    2021-08-19  1620  	return 0;
8e67c67f3fd250 bui duc phuc 2026-10-14  1621  
8e67c67f3fd250 bui duc phuc 2026-10-14  1622  err_disable_slv_clk:
8e67c67f3fd250 bui duc phuc 2026-10-14  1623  	while (--i >= 0) {
8e67c67f3fd250 bui duc phuc 2026-10-14  1624  		slv_dai_id = mst_etdm_data->cowork_slv_id[i];
8e67c67f3fd250 bui duc phuc 2026-10-14  1625  		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(slv_dai_id);
8e67c67f3fd250 bui duc phuc 2026-10-14  1626  		if (cg_id >= 0)
8e67c67f3fd250 bui duc phuc 2026-10-14  1627  			mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
8e67c67f3fd250 bui duc phuc 2026-10-14  1628  	}
8e67c67f3fd250 bui duc phuc 2026-10-14  1629  
8e67c67f3fd250 bui duc phuc 2026-10-14  1630  	cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(mst_dai_id);
8e67c67f3fd250 bui duc phuc 2026-10-14  1631  	if (cg_id >= 0)
8e67c67f3fd250 bui duc phuc 2026-10-14  1632  		mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
8e67c67f3fd250 bui duc phuc 2026-10-14  1633  
8e67c67f3fd250 bui duc phuc 2026-10-14  1634  err_disable_mclk:
8e67c67f3fd250 bui duc phuc 2026-10-14  1635  	mtk_dai_etdm_disable_mclk(afe, is_cowork_mode(dai) ? mst_dai_id : dai->id);
8e67c67f3fd250 bui duc phuc 2026-10-14  1636  
8e67c67f3fd250 bui duc phuc 2026-10-14  1637  	return ret;
1de9a54acafba2 Trevor Wu    2021-08-19  1638  }
1de9a54acafba2 Trevor Wu    2021-08-19  1639  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
