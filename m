Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA97F288B5
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Nov 2024 02:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732675106; cv=none; b=PIj6OpKOdYKYgJU11VjjsJflbENe6dR2osrS11Mr9SWCiawa9lvEe4LlKeX+D84AgbazhkUAatOVmZsyYYC2pDDeO6jaWpJdo0audaf42zVp39Cr0fHECvOs5ABXtfnwaKD05smNcw0mYeH5B0PwYGpEIhEa7AqN3CYHiTGwgNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732675106; c=relaxed/simple;
	bh=GomlsVu5wrqCnwQHfDBV76E83h8Oa3U0MCaE6OjPfiA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dG60Fx4oSOoPXgiVOVDGangJRKrfDTwEze1lHXxXEKiLlZfcA8ktbbrBekwLmxfYZd43kzCPIb1ybtCYdq5OTVZyieDXQD2uezma4Z5lt5zKHwPiP5y1jr9LjnM04q+tyGK68GQ+qZ6a9+w3l+8HMBCpNFxY1ZZl0oKVeWFkQuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AbHPw2fq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AbHPw2fq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732675104; x=1764211104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GomlsVu5wrqCnwQHfDBV76E83h8Oa3U0MCaE6OjPfiA=;
  b=AbHPw2fqM5BYqEIAjZKIHSGGjxdQTULtNW5vTiYJD3WcHAN+UlKz1PxB
   2yZoL/R49W0/1Wik5Y+BQBVrgOvyHQ3T274flTCCO0sMIuiUp/lePIXh4
   JOaVaZ/W9EEDktPE8LKJN57kac8IkqTm9F4rv3F0elYjAQdwHFsKmrzqS
   g8S9KqiBboCWtH66XNYte5Le7fZfwjpkd1Ug91N92He0678PHOh1EoK+F
   ySIe7WpjVMWnJAxtV5F+7iOSe44LOmEUJb+SjcI4VGUFirpG2u7GHh/bP
   prcCHmkZ0dfoIghLlhmmp4e+xWvjamEO91nh4wWV3POHMniFt/jgDq6X6
   A==;
X-CSE-ConnectionGUID: uKFjCJVlQneNOU0DIVYQaw==
X-CSE-MsgGUID: HAIXvXmhQAuxDuoQsqSjpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="50390417"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="50390417"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 18:38:23 -0800
X-CSE-ConnectionGUID: i5bXtC7XRVeQHNAtyIs5gw==
X-CSE-MsgGUID: /hfme/hkR6O5LUiBOv5kTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="96851360"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Nov 2024 18:38:22 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tG7wZ-0007fe-1E;
	Wed, 27 Nov 2024 02:38:19 +0000
Date: Wed, 27 Nov 2024 10:37:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [thesofproject:topic/sof-dev 1/1] sound/soc/sof/ipc3-topology.c:1606
 sof_ipc3_widget_setup_comp_dai() warn: missing unwind goto?
Message-ID: <202411271005.h44CowIa-lkp@intel.com>
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
TO: Bard Liao <yung-chuan.liao@linux.intel.com>
CC: Ranjani Sridharan <ranjani.sridharan@intel.com>

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   414dc9543a7292dac30f2614001718afce5eef9f
commit: 3592316d9f108d6ebbf655dede9feac9620557f2 [1/1] ASoC: SOF: ipc3-topology: Convert the topology pin index to ALH dai index
:::::: branch date: 8 hours ago
:::::: commit date: 4 weeks ago
config: nios2-randconfig-r073-20241126 (https://download.01.org/0day-ci/archive/20241127/202411271005.h44CowIa-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411271005.h44CowIa-lkp@intel.com/

smatch warnings:
sound/soc/sof/ipc3-topology.c:1606 sof_ipc3_widget_setup_comp_dai() warn: missing unwind goto?

vim +1606 sound/soc/sof/ipc3-topology.c

a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1557  
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1558  static int sof_ipc3_widget_setup_comp_dai(struct snd_sof_widget *swidget)
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1559  {
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1560  	struct snd_soc_component *scomp = swidget->scomp;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1561  	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1562  	struct snd_sof_dai *dai = swidget->private;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1563  	struct sof_dai_private_data *private;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1564  	struct sof_ipc_comp_dai *comp_dai;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1565  	size_t ipc_size = sizeof(*comp_dai);
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1566  	struct sof_ipc_dai_config *config;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1567  	struct snd_sof_dai_link *slink;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1568  	int ret;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1569  
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1570  	private = kzalloc(sizeof(*private), GFP_KERNEL);
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1571  	if (!private)
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1572  		return -ENOMEM;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1573  
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1574  	dai->private = private;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1575  
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1576  	private->comp_dai = sof_comp_alloc(swidget, &ipc_size, swidget->pipeline_id);
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1577  	if (!private->comp_dai) {
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1578  		ret = -ENOMEM;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1579  		goto free;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1580  	}
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1581  
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1582  	/* configure dai IPC message */
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1583  	comp_dai = private->comp_dai;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1584  	comp_dai->comp.type = SOF_COMP_DAI;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1585  	comp_dai->config.hdr.size = sizeof(comp_dai->config);
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1586  
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1587  	/* parse one set of DAI tokens */
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1588  	ret = sof_update_ipc_object(scomp, comp_dai, SOF_DAI_TOKENS, swidget->tuples,
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1589  				    swidget->num_tuples, sizeof(*comp_dai), 1);
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1590  	if (ret < 0)
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1591  		goto free;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1592  
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1593  	/* update comp_tokens */
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1594  	ret = sof_update_ipc_object(scomp, &comp_dai->config, SOF_COMP_TOKENS,
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1595  				    swidget->tuples, swidget->num_tuples,
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1596  				    sizeof(comp_dai->config), 1);
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1597  	if (ret < 0)
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1598  		goto free;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1599  
3592316d9f108d Bard Liao            2024-10-29  1600  	/* Subtract the base to match the FW dai index. */
3592316d9f108d Bard Liao            2024-10-29  1601  	if (comp_dai->type == SOF_DAI_INTEL_ALH) {
3592316d9f108d Bard Liao            2024-10-29  1602  		if (comp_dai->dai_index < INTEL_ALH_DAI_INDEX_BASE) {
3592316d9f108d Bard Liao            2024-10-29  1603  			dev_err(sdev->dev,
3592316d9f108d Bard Liao            2024-10-29  1604  				"Invalid ALH dai index %d, only Pin numbers >= %d can be used\n",
3592316d9f108d Bard Liao            2024-10-29  1605  				comp_dai->dai_index, INTEL_ALH_DAI_INDEX_BASE);
3592316d9f108d Bard Liao            2024-10-29 @1606  			return -EINVAL;
3592316d9f108d Bard Liao            2024-10-29  1607  		}
3592316d9f108d Bard Liao            2024-10-29  1608  		comp_dai->dai_index -= INTEL_ALH_DAI_INDEX_BASE;
3592316d9f108d Bard Liao            2024-10-29  1609  	}
3592316d9f108d Bard Liao            2024-10-29  1610  
884a48099f2b93 Pierre-Louis Bossart 2022-06-13  1611  	dev_dbg(scomp->dev, "dai %s: type %d index %d\n",
884a48099f2b93 Pierre-Louis Bossart 2022-06-13  1612  		swidget->widget->name, comp_dai->type, comp_dai->dai_index);
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1613  	sof_dbg_comp_config(scomp, &comp_dai->config);
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1614  
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1615  	/* now update DAI config */
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1616  	list_for_each_entry(slink, &sdev->dai_link_list, list) {
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1617  		struct sof_ipc_dai_config common_config;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1618  		int i;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1619  
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1620  		if (strcmp(slink->link->name, dai->name))
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1621  			continue;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1622  
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1623  		/* Reserve memory for all hw configs, eventually freed by widget */
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1624  		config = kcalloc(slink->num_hw_configs, sizeof(*config), GFP_KERNEL);
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1625  		if (!config) {
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1626  			ret = -ENOMEM;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1627  			goto free_comp;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1628  		}
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1629  
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1630  		/* parse one set of DAI link tokens */
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1631  		ret = sof_update_ipc_object(scomp, &common_config, SOF_DAI_LINK_TOKENS,
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1632  					    slink->tuples, slink->num_tuples,
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1633  					    sizeof(common_config), 1);
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1634  		if (ret < 0)
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1635  			goto free_config;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1636  
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1637  		for (i = 0; i < slink->num_hw_configs; i++) {
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1638  			config[i].hdr.cmd = SOF_IPC_GLB_DAI_MSG | SOF_IPC_DAI_CONFIG;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1639  			config[i].format = le32_to_cpu(slink->hw_configs[i].fmt);
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1640  			config[i].type = common_config.type;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1641  			config[i].dai_index = comp_dai->dai_index;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1642  		}
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1643  
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1644  		switch (common_config.type) {
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1645  		case SOF_DAI_INTEL_SSP:
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1646  			ret = sof_link_ssp_load(scomp, slink, config, dai);
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1647  			break;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1648  		case SOF_DAI_INTEL_DMIC:
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1649  			ret = sof_link_dmic_load(scomp, slink, config, dai);
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1650  			break;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1651  		case SOF_DAI_INTEL_HDA:
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1652  			ret = sof_link_hda_load(scomp, slink, config, dai);
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1653  			break;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1654  		case SOF_DAI_INTEL_ALH:
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1655  			ret = sof_link_alh_load(scomp, slink, config, dai);
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1656  			break;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1657  		case SOF_DAI_IMX_SAI:
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1658  			ret = sof_link_sai_load(scomp, slink, config, dai);
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1659  			break;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1660  		case SOF_DAI_IMX_ESAI:
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1661  			ret = sof_link_esai_load(scomp, slink, config, dai);
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1662  			break;
50b2bedcda7503 Daniel Baluta        2023-08-01  1663  		case SOF_DAI_IMX_MICFIL:
50b2bedcda7503 Daniel Baluta        2023-08-01  1664  			ret = sof_link_micfil_load(scomp, slink, config, dai);
50b2bedcda7503 Daniel Baluta        2023-08-01  1665  			break;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1666  		case SOF_DAI_AMD_BT:
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1667  			ret = sof_link_acp_bt_load(scomp, slink, config, dai);
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1668  			break;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1669  		case SOF_DAI_AMD_SP:
8df17302f925ef V sujith kumar Reddy 2022-10-12  1670  		case SOF_DAI_AMD_SP_VIRTUAL:
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1671  			ret = sof_link_acp_sp_load(scomp, slink, config, dai);
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1672  			break;
a9f1f32992e744 V sujith kumar Reddy 2022-03-24  1673  		case SOF_DAI_AMD_HS:
8df17302f925ef V sujith kumar Reddy 2022-10-12  1674  		case SOF_DAI_AMD_HS_VIRTUAL:
a9f1f32992e744 V sujith kumar Reddy 2022-03-24  1675  			ret = sof_link_acp_hs_load(scomp, slink, config, dai);
a9f1f32992e744 V sujith kumar Reddy 2022-03-24  1676  			break;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1677  		case SOF_DAI_AMD_DMIC:
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1678  			ret = sof_link_acp_dmic_load(scomp, slink, config, dai);
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1679  			break;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1680  		case SOF_DAI_MEDIATEK_AFE:
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1681  			ret = sof_link_afe_load(scomp, slink, config, dai);
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1682  			break;
f4f841b6338299 Vijendar Mukunda     2023-11-06  1683  		case SOF_DAI_AMD_SDW:
f4f841b6338299 Vijendar Mukunda     2023-11-06  1684  			ret = sof_link_acp_sdw_load(scomp, slink, config, dai);
f4f841b6338299 Vijendar Mukunda     2023-11-06  1685  			break;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1686  		default:
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1687  			break;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1688  		}
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1689  		if (ret < 0) {
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1690  			dev_err(scomp->dev, "failed to load config for dai %s\n", dai->name);
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1691  			goto free_config;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1692  		}
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1693  
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1694  		kfree(config);
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1695  	}
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1696  
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1697  	return 0;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1698  free_config:
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1699  	kfree(config);
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1700  free_comp:
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1701  	kfree(comp_dai);
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1702  free:
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1703  	kfree(private);
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1704  	dai->private = NULL;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1705  	return ret;
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1706  }
a86a91dc9eefa3 Ranjani Sridharan    2021-12-04  1707  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
