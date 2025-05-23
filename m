Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFBDC2F2
	for <oe-kbuild@lists.linux.dev>; Fri, 23 May 2025 13:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748008321; cv=none; b=Tz3r1NO+GS/SJ/LPXsfv4PEa+4J4hOvpEAzX2Cw4TDcEj1mBTqeoK3q4JbJa6llGIhPIynA/di/BAgptms86SATnU1MpZ8tCZZ3m6j6I+rfZHtph9Xrfpi+nz3/ky9yPizij1LE+rIjSuNO876qFD1Ewln+zls0NcIFuJiUV5eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748008321; c=relaxed/simple;
	bh=ThgsbHqZpQ9yh7ce1ACwYPzmsjuYxs8yF022Lds5+40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PPq4xUyncHM96W3XXigoe7I4YmuLp4vafJ1jNmrxmgY09CZGfpWjezSuSm4foFkB/RSYjH7GCIoHvGxA+c+5f9qReZp2e3JHW+flcylF1vkmBaQeB+lSfc8gPcHRlk7Tchct9VtYcBa4UP3fl+mp2hO9W5LYycDwgq0XcSRPv0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hvALXSxR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvALXSxR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748008319; x=1779544319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ThgsbHqZpQ9yh7ce1ACwYPzmsjuYxs8yF022Lds5+40=;
  b=hvALXSxRJY7f0C0zQN4o6Ni/egiPUeiPhHHpKACUYxoMBNoxkTecUzmD
   q7xbA9aXYI/UPmqH0XVXjJvv60JhYpxR9sMm1PnWEzYIfnJqQzqaK4GqK
   ljVyjHAUMZTZihli4PiZahoFmDzXSUmmHCQ9fwVf+7+vn6evtyt4Duy3v
   ww3Su2UI4oDDN4BF624JjkOLfJzPgi2byuwkLZdayuTW85xqfgZOCVFS2
   Ji2iPQt3a6UQlGXCsxBXzzd+PZhdRYWJlUv6in7juBpT83qcj2yefieti
   rlOsp+jumgvpUpgKKE/hhNrb7ek4HqksKOn2qIJxMxgf8GB9BNb5TtLQI
   g==;
X-CSE-ConnectionGUID: V1G31dcPSQSnG3e4jJcChg==
X-CSE-MsgGUID: c4Tq/pyiRZiuAtGAqAGSgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="60719680"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="60719680"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 06:51:57 -0700
X-CSE-ConnectionGUID: s/lNFWSXSVWHOxttYHIc9w==
X-CSE-MsgGUID: LtIBUiZESxScmtskCUW5vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="145999996"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 May 2025 06:51:56 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uISoU-000QQW-06;
	Fri, 23 May 2025 13:51:54 +0000
Date: Fri, 23 May 2025 21:51:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11628/13331] sound/soc/sdca/sdca_asoc.c:369
 entity_pde_event() error: uninitialized symbol 'from'.
Message-ID: <202505232114.fzI50qL1-lkp@intel.com>
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
TO: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   176e917e010cb7dcc605f11d2bc33f304292482b
commit: 2c8b3a8e6aa877583e5dc2f669a8adc896a771d4 [11628/13331] ASoC: SDCA: Create DAPM widgets and routes from DisCo
:::::: branch date: 6 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20250523 (https://download.01.org/0day-ci/archive/20250523/202505232114.fzI50qL1-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505232114.fzI50qL1-lkp@intel.com/

New smatch warnings:
sound/soc/sdca/sdca_asoc.c:369 entity_pde_event() error: uninitialized symbol 'from'.
sound/soc/sdca/sdca_asoc.c:369 entity_pde_event() error: uninitialized symbol 'to'.
sound/soc/sdca/sdca_asoc.c:381 entity_pde_event() error: uninitialized symbol 'poll_us'.

Old smatch warnings:
sound/soc/sdca/sdca_asoc.c:386 entity_pde_event() error: uninitialized symbol 'to'.

vim +/from +369 sound/soc/sdca/sdca_asoc.c

2c8b3a8e6aa877 Charles Keepax 2025-05-16  340  
2c8b3a8e6aa877 Charles Keepax 2025-05-16  341  static int entity_pde_event(struct snd_soc_dapm_widget *widget,
2c8b3a8e6aa877 Charles Keepax 2025-05-16  342  			    struct snd_kcontrol *kctl, int event)
2c8b3a8e6aa877 Charles Keepax 2025-05-16  343  {
2c8b3a8e6aa877 Charles Keepax 2025-05-16  344  	struct snd_soc_component *component = widget->dapm->component;
2c8b3a8e6aa877 Charles Keepax 2025-05-16  345  	struct sdca_entity *entity = widget->priv;
2c8b3a8e6aa877 Charles Keepax 2025-05-16  346  	static const int polls = 100;
2c8b3a8e6aa877 Charles Keepax 2025-05-16  347  	unsigned int reg, val;
2c8b3a8e6aa877 Charles Keepax 2025-05-16  348  	int from, to, i;
2c8b3a8e6aa877 Charles Keepax 2025-05-16  349  	int poll_us;
2c8b3a8e6aa877 Charles Keepax 2025-05-16  350  	int ret;
2c8b3a8e6aa877 Charles Keepax 2025-05-16  351  
2c8b3a8e6aa877 Charles Keepax 2025-05-16  352  	if (!component)
2c8b3a8e6aa877 Charles Keepax 2025-05-16  353  		return -EIO;
2c8b3a8e6aa877 Charles Keepax 2025-05-16  354  
2c8b3a8e6aa877 Charles Keepax 2025-05-16  355  	switch (event) {
2c8b3a8e6aa877 Charles Keepax 2025-05-16  356  	case SND_SOC_DAPM_POST_PMD:
2c8b3a8e6aa877 Charles Keepax 2025-05-16  357  		from = widget->on_val;
2c8b3a8e6aa877 Charles Keepax 2025-05-16  358  		to = widget->off_val;
2c8b3a8e6aa877 Charles Keepax 2025-05-16  359  		break;
2c8b3a8e6aa877 Charles Keepax 2025-05-16  360  	case SND_SOC_DAPM_POST_PMU:
2c8b3a8e6aa877 Charles Keepax 2025-05-16  361  		from = widget->off_val;
2c8b3a8e6aa877 Charles Keepax 2025-05-16  362  		to = widget->on_val;
2c8b3a8e6aa877 Charles Keepax 2025-05-16  363  		break;
2c8b3a8e6aa877 Charles Keepax 2025-05-16  364  	}
2c8b3a8e6aa877 Charles Keepax 2025-05-16  365  
2c8b3a8e6aa877 Charles Keepax 2025-05-16  366  	for (i = 0; i < entity->pde.num_max_delay; i++) {
2c8b3a8e6aa877 Charles Keepax 2025-05-16  367  		struct sdca_pde_delay *delay = &entity->pde.max_delay[i];
2c8b3a8e6aa877 Charles Keepax 2025-05-16  368  
2c8b3a8e6aa877 Charles Keepax 2025-05-16 @369  		if (delay->from_ps == from && delay->to_ps == to) {
2c8b3a8e6aa877 Charles Keepax 2025-05-16  370  			poll_us = delay->us / polls;
2c8b3a8e6aa877 Charles Keepax 2025-05-16  371  			break;
2c8b3a8e6aa877 Charles Keepax 2025-05-16  372  		}
2c8b3a8e6aa877 Charles Keepax 2025-05-16  373  	}
2c8b3a8e6aa877 Charles Keepax 2025-05-16  374  
2c8b3a8e6aa877 Charles Keepax 2025-05-16  375  	reg = SDW_SDCA_CTL(SDW_SDCA_CTL_FUNC(widget->reg),
2c8b3a8e6aa877 Charles Keepax 2025-05-16  376  			   SDW_SDCA_CTL_ENT(widget->reg),
2c8b3a8e6aa877 Charles Keepax 2025-05-16  377  			   SDCA_CTL_PDE_ACTUAL_PS, 0);
2c8b3a8e6aa877 Charles Keepax 2025-05-16  378  
2c8b3a8e6aa877 Charles Keepax 2025-05-16  379  	for (i = 0; i < polls; i++) {
2c8b3a8e6aa877 Charles Keepax 2025-05-16  380  		if (i)
2c8b3a8e6aa877 Charles Keepax 2025-05-16 @381  			fsleep(poll_us);
2c8b3a8e6aa877 Charles Keepax 2025-05-16  382  
2c8b3a8e6aa877 Charles Keepax 2025-05-16  383  		ret = regmap_read(component->regmap, reg, &val);
2c8b3a8e6aa877 Charles Keepax 2025-05-16  384  		if (ret)
2c8b3a8e6aa877 Charles Keepax 2025-05-16  385  			return ret;
2c8b3a8e6aa877 Charles Keepax 2025-05-16  386  		else if (val == to)
2c8b3a8e6aa877 Charles Keepax 2025-05-16  387  			return 0;
2c8b3a8e6aa877 Charles Keepax 2025-05-16  388  	}
2c8b3a8e6aa877 Charles Keepax 2025-05-16  389  
2c8b3a8e6aa877 Charles Keepax 2025-05-16  390  	dev_err(component->dev, "%s: power transition failed: %x\n",
2c8b3a8e6aa877 Charles Keepax 2025-05-16  391  		entity->label, val);
2c8b3a8e6aa877 Charles Keepax 2025-05-16  392  	return -ETIMEDOUT;
2c8b3a8e6aa877 Charles Keepax 2025-05-16  393  }
2c8b3a8e6aa877 Charles Keepax 2025-05-16  394  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
