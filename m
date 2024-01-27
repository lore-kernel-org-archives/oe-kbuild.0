Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856D264A
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Jan 2024 14:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706365869; cv=none; b=PSbfWkXt4rzk9xCecSWI6cQRfnturnpmbUDraycK07oF2eYLOw8/iPDbp/TAmpmVijVbyxmwbU6FURBXWspPs7pnRiWquUtM82IHfUY+jS99VLxvHydAehXGlPE5M1OECRU9OXLM0PDWLVFHWlAbR02UIRcvvnnRGrYmV33/WaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706365869; c=relaxed/simple;
	bh=1kRRGapMChOgwZm3TnlOKRZrDH9MEs7/RxCgRcGn60U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OKsVfyGdbbdKI4Z3PKLemAMbUjOACbFSbxEoNaM69GKhc/nrPAd3KppZDBOykeqMd3wknqP3UpJz3GNpDU5HEZQlBQI5TGg1qbktBkQ6WhiVsE1/u1IjnQyHV5/cdOsWN2KnbV2C65F3KBAoUDeK4WQSs5vXlWw6ZaoTRcpghfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DT0iqALa; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DT0iqALa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706365866; x=1737901866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1kRRGapMChOgwZm3TnlOKRZrDH9MEs7/RxCgRcGn60U=;
  b=DT0iqALaXc8W1cjKum1IfifINZGTlJRL9yEGc5xk90GSkQ7EJP1lmtyh
   QpsFG0Gx3EfmRIIjJdNywjFfq/DUr2V1rfj643rgQGU/2YyM7nbBs8ZdM
   rQUHzwgdiUFJVGAen/JPnyFe46SOpCG0bx0HPbWjHzaMOpDCLrJQmY0JA
   R4ikJqpOa0vS+xAodMTSb1pwSFPFtx206LI8OSmkZnLBVoKKkn106Q7JU
   To8gB9fFIx9UZxtTah2HStyx0q19fGNCIQungDJ+j/4TPjPEA3y0wfE3J
   U9OE0925N0hOmo1AFFk1mnYaL8qtQ8MkIsJrS3NBfrU89cXldufDVBHE2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="401547361"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="401547361"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 06:31:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="29358908"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jan 2024 06:31:04 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTji2-0002PS-0C;
	Sat, 27 Jan 2024 14:31:02 +0000
Date: Sat, 27 Jan 2024 22:30:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: sound/soc/starfive/jh7110_tdm.c:198:16-18: WARNING opportunity for
 max()
Message-ID: <202401272205.TWGHvmpR-lkp@intel.com>
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
TO: Walker Chen <walker.chen@starfivetech.com>
CC: Mark Brown <broonie@kernel.org>
CC: Claudiu Beznea <claudiu.beznea@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3a5879d495b226d0404098e3564462d5f1daa33b
commit: fd4762b6b5cfa27bf44f5d624ce74b7dce4a479c ASoC: starfive: Add JH7110 TDM driver
date:   8 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 8 months ago
config: openrisc-randconfig-r053-20240127 (https://download.01.org/0day-ci/archive/20240127/202401272205.TWGHvmpR-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401272205.TWGHvmpR-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/soc/starfive/jh7110_tdm.c:198:16-18: WARNING opportunity for max()
   sound/soc/starfive/jh7110_tdm.c:203:20-22: WARNING opportunity for max()

vim +198 sound/soc/starfive/jh7110_tdm.c

fd4762b6b5cfa2 Walker Chen 2023-05-26  193  
fd4762b6b5cfa2 Walker Chen 2023-05-26  194  static int jh7110_tdm_syncdiv(struct jh7110_tdm_dev *tdm)
fd4762b6b5cfa2 Walker Chen 2023-05-26  195  {
fd4762b6b5cfa2 Walker Chen 2023-05-26  196  	u32 sl, sscale, syncdiv;
fd4762b6b5cfa2 Walker Chen 2023-05-26  197  
fd4762b6b5cfa2 Walker Chen 2023-05-26 @198  	if (tdm->rx.sl >= tdm->tx.sl)
fd4762b6b5cfa2 Walker Chen 2023-05-26  199  		sl = tdm->rx.sl;
fd4762b6b5cfa2 Walker Chen 2023-05-26  200  	else
fd4762b6b5cfa2 Walker Chen 2023-05-26  201  		sl = tdm->tx.sl;
fd4762b6b5cfa2 Walker Chen 2023-05-26  202  
fd4762b6b5cfa2 Walker Chen 2023-05-26  203  	if (tdm->rx.sscale >= tdm->tx.sscale)
fd4762b6b5cfa2 Walker Chen 2023-05-26  204  		sscale = tdm->rx.sscale;
fd4762b6b5cfa2 Walker Chen 2023-05-26  205  	else
fd4762b6b5cfa2 Walker Chen 2023-05-26  206  		sscale = tdm->tx.sscale;
fd4762b6b5cfa2 Walker Chen 2023-05-26  207  
fd4762b6b5cfa2 Walker Chen 2023-05-26  208  	syncdiv = tdm->pcmclk / tdm->samplerate - 1;
fd4762b6b5cfa2 Walker Chen 2023-05-26  209  
fd4762b6b5cfa2 Walker Chen 2023-05-26  210  	if ((syncdiv + 1) < (sl * sscale)) {
fd4762b6b5cfa2 Walker Chen 2023-05-26  211  		dev_err(tdm->dev, "Failed to set syncdiv!\n");
fd4762b6b5cfa2 Walker Chen 2023-05-26  212  		return -EINVAL;
fd4762b6b5cfa2 Walker Chen 2023-05-26  213  	}
fd4762b6b5cfa2 Walker Chen 2023-05-26  214  
fd4762b6b5cfa2 Walker Chen 2023-05-26  215  	if (tdm->syncm == TDM_SYNCM_LONG &&
fd4762b6b5cfa2 Walker Chen 2023-05-26  216  	    (tdm->rx.sscale <= 1 || tdm->tx.sscale <= 1) &&
fd4762b6b5cfa2 Walker Chen 2023-05-26  217  	    ((syncdiv + 1) <= sl)) {
fd4762b6b5cfa2 Walker Chen 2023-05-26  218  		dev_err(tdm->dev, "Wrong syncdiv! It must be (syncdiv+1) > max[tx.sl, rx.sl]\n");
fd4762b6b5cfa2 Walker Chen 2023-05-26  219  		return -EINVAL;
fd4762b6b5cfa2 Walker Chen 2023-05-26  220  	}
fd4762b6b5cfa2 Walker Chen 2023-05-26  221  
fd4762b6b5cfa2 Walker Chen 2023-05-26  222  	jh7110_tdm_writel(tdm, TDM_PCMDIV, syncdiv);
fd4762b6b5cfa2 Walker Chen 2023-05-26  223  	return 0;
fd4762b6b5cfa2 Walker Chen 2023-05-26  224  }
fd4762b6b5cfa2 Walker Chen 2023-05-26  225  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
