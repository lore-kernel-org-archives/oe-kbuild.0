Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D67728B3E7
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 23:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765581402; cv=none; b=mGD2znkowtXqH3W+ad02T5luPEnNrfINJYkUqAf16v0ozbkKkcExYZKrdn7eHbWxuPJcTIQ5bup5Z2SPWRCH7iDnt0ojFfMJZ8TrmKhKhI74N8MhWOqq40zz5R7fBSZ1KAD4gOnJaXLYok1XkJupgpolLUXkwSP+DB+E5HnlDrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765581402; c=relaxed/simple;
	bh=QdyiZ+WCyMJzAHXnAOqBs0ggSPwPJeihXh+8I/Iw/Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GXN1pH56a4FhivQ0oAO2tNDLwmcopfA6L/x+//45osnZS6adsNapghAFSG8ruLtcaNKtgddeQtbjhwiGy9JL9+u2b5ABpZ4mPR3BumDBOc7sYRfCZhlmcr2/a8sHlLeQRrQkLR+F97rQd441zMJggGCB0HDItuEM/+G2t8SwT3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nWFQnPVd; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nWFQnPVd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765581401; x=1797117401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QdyiZ+WCyMJzAHXnAOqBs0ggSPwPJeihXh+8I/Iw/Uw=;
  b=nWFQnPVdbsFt/aCUwUefdRuYCtbx1vVC5+gRr0tHgxPFn1S4R8qIxFTA
   4o3dMuZblLU0cWfs8UORcYz6SZzJLz/C+4GwEYtV79/QBtgwK5z/5+bSZ
   h/HlUFlD8IGiGABs92nQORCc09H8fOwYErn04ZUdHR1C/KuvruOaN1R2s
   W+6hFtn0266ET+aT1zKuHHleFcpPIVeG6MLDUnl1fHt0W1RdiAZkpS0xs
   zn4TP5/DAhbe9EDqcrHbDgjgyfAQIxXOBypnt37xmQ2CnyVNT5qJF5deu
   wCLrfr1DWjPmZCq2nSyP0YvgJANavbTmtuZMW2QwTHEolHP+25F3ttlDU
   A==;
X-CSE-ConnectionGUID: PvlAdzwDR/KJNUUyGwLjbg==
X-CSE-MsgGUID: APAhiKm0StSVcAiTzVTtvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67472667"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="67472667"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 15:16:40 -0800
X-CSE-ConnectionGUID: 4JUW0t9jSE2xTd8+rQ6dgw==
X-CSE-MsgGUID: OfGIAPfOTfu7lTdNKTMI1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="201621025"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Dec 2025 15:16:38 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUCNI-000000006kw-1sYM;
	Fri, 12 Dec 2025 23:16:36 +0000
Date: Sat, 13 Dec 2025 07:15:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/sdca/sdca_asoc.c:381 entity_pde_event() error:
 uninitialized symbol 'poll_us'.
Message-ID: <202512130749.Yq1y2hjQ-lkp@intel.com>
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
TO: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 2c8b3a8e6aa877583e5dc2f669a8adc896a771d4 ASoC: SDCA: Create DAPM widgets and routes from DisCo
date:   7 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-r073-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130749.Yq1y2hjQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512130749.Yq1y2hjQ-lkp@intel.com/

New smatch warnings:
sound/soc/sdca/sdca_asoc.c:381 entity_pde_event() error: uninitialized symbol 'poll_us'.

Old smatch warnings:
sound/soc/sdca/sdca_asoc.c:369 entity_pde_event() error: uninitialized symbol 'from'.
sound/soc/sdca/sdca_asoc.c:369 entity_pde_event() error: uninitialized symbol 'to'.
sound/soc/sdca/sdca_asoc.c:386 entity_pde_event() error: uninitialized symbol 'to'.

vim +/poll_us +381 sound/soc/sdca/sdca_asoc.c

2c8b3a8e6aa8775 Charles Keepax 2025-05-16  340  
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  341  static int entity_pde_event(struct snd_soc_dapm_widget *widget,
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  342  			    struct snd_kcontrol *kctl, int event)
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  343  {
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  344  	struct snd_soc_component *component = widget->dapm->component;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  345  	struct sdca_entity *entity = widget->priv;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  346  	static const int polls = 100;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  347  	unsigned int reg, val;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  348  	int from, to, i;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  349  	int poll_us;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  350  	int ret;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  351  
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  352  	if (!component)
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  353  		return -EIO;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  354  
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  355  	switch (event) {
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  356  	case SND_SOC_DAPM_POST_PMD:
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  357  		from = widget->on_val;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  358  		to = widget->off_val;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  359  		break;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  360  	case SND_SOC_DAPM_POST_PMU:
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  361  		from = widget->off_val;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  362  		to = widget->on_val;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  363  		break;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  364  	}
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  365  
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  366  	for (i = 0; i < entity->pde.num_max_delay; i++) {
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  367  		struct sdca_pde_delay *delay = &entity->pde.max_delay[i];
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  368  
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  369  		if (delay->from_ps == from && delay->to_ps == to) {
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  370  			poll_us = delay->us / polls;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  371  			break;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  372  		}
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  373  	}
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  374  
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  375  	reg = SDW_SDCA_CTL(SDW_SDCA_CTL_FUNC(widget->reg),
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  376  			   SDW_SDCA_CTL_ENT(widget->reg),
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  377  			   SDCA_CTL_PDE_ACTUAL_PS, 0);
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  378  
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  379  	for (i = 0; i < polls; i++) {
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  380  		if (i)
2c8b3a8e6aa8775 Charles Keepax 2025-05-16 @381  			fsleep(poll_us);
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  382  
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  383  		ret = regmap_read(component->regmap, reg, &val);
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  384  		if (ret)
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  385  			return ret;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  386  		else if (val == to)
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  387  			return 0;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  388  	}
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  389  
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  390  	dev_err(component->dev, "%s: power transition failed: %x\n",
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  391  		entity->label, val);
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  392  	return -ETIMEDOUT;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  393  }
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  394  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
