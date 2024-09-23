Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDCB194A67
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Sep 2024 19:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727120085; cv=none; b=TSFgHC3UHDb149kxanJ/HpcGH1HuJ39NDhAKAhTC3mMAeMu9LnPhoCN3U7mOATEQolC02/kutpx2jzQICj+C9L+CLCnDsoNf9y2rh9Px4RIhVv23j/9mUees0fpE23sYpYGjOPG6Z+CGEMFY+7/80CDuOm3uOqwF+AOW1yvv3ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727120085; c=relaxed/simple;
	bh=kwuc8E2XOoMXkFE8yDRUCvWPjmokrkFhQ0pQbqYeO/o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YYu2vWgNVyEeBir3obekAWRz3WDKwekXeggvWzq0tNPOBHW817x7VGOHs3AhT5YFTReQJ/F37QomLUchDAQByYftveT1fJT8RW7TO92D58jJ8jho//OWqOat01RURBTiLvISqijunTB9tv2Agxfo5Ehonkj7ovjwaiLVAdXH72M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HlPvuw4Z; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HlPvuw4Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727120084; x=1758656084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kwuc8E2XOoMXkFE8yDRUCvWPjmokrkFhQ0pQbqYeO/o=;
  b=HlPvuw4ZbMAMAM1k9DbnyTjSxALMBgzdGPlxVSrL6BgXjatlNvd28Z+Z
   TVdv30T3QafNuGXDxoMOF7DQCHxhMbkF5vFWrnHip3WP/E9dmzkyPhJ/k
   UJ4xjU4VlwF1Vcp8npQxzaouvJtvRRvKIyNXQt2EzoLlvyiLWo4JhxqFS
   CVnpXhoPxHhrzTQmBazYs+BtDQ97nfQMiLX07f+SEFKgUfsaZuOwXEuBA
   bEFs+F+RAQCu3y0UN82QLAqsQpTYdBQCkkA2SJXb9vu+2xZTydAP0HXo3
   GsCdWISE4qkPWSYpiX4viSF0XPBBOUSxp71HTed5im+lKRmc3fYG9SIPD
   w==;
X-CSE-ConnectionGUID: wOFu/TcJReWAx5ixYk83bA==
X-CSE-MsgGUID: zOxozzlvR3OS/AQxhDiZcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26181197"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="26181197"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 12:34:43 -0700
X-CSE-ConnectionGUID: Akna4tF4T8uctTLq0zFd3w==
X-CSE-MsgGUID: qHRj/wynQIOdctmyS+q8yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="71441424"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Sep 2024 12:34:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssopT-000HXr-2f;
	Mon, 23 Sep 2024 19:34:39 +0000
Date: Tue, 24 Sep 2024 03:33:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:573
 atmel_hlcdc_plane_update_buffers() error: uninitialized symbol 'sr'.
Message-ID: <202409240320.MZPgi3Up-lkp@intel.com>
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
TO: Manikandan Muralidharan <manikandan.m@microchip.com>
CC: Sam Ravnborg <sam@ravnborg.org>
CC: Hari Prasath Gujulan Elango <Hari.PrasathGE@microchip.com>
CC: Durai Manickam KR <durai.manickamkr@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f8eb5bd9a818cc5f2a1e50b22b0091830b28cc36
commit: d498771b0b830140a70cb8118ee0ee522be94f39 drm: atmel_hlcdc: Add support for XLCDC using IP specific driver ops
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
config: sparc-randconfig-r071-20240923 (https://download.01.org/0day-ci/archive/20240924/202409240320.MZPgi3Up-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409240320.MZPgi3Up-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:573 atmel_hlcdc_plane_update_buffers() error: uninitialized symbol 'sr'.

vim +/sr +573 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c

d498771b0b8301 Manikandan Muralidharan 2024-04-24  555  
aa71584b323acf Manikandan Muralidharan 2024-04-24  556  static void atmel_hlcdc_plane_update_buffers(struct atmel_hlcdc_plane *plane,
aa71584b323acf Manikandan Muralidharan 2024-04-24  557  					     struct atmel_hlcdc_plane_state *state)
aa71584b323acf Manikandan Muralidharan 2024-04-24  558  {
aa71584b323acf Manikandan Muralidharan 2024-04-24  559  	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
aa71584b323acf Manikandan Muralidharan 2024-04-24  560  	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
aa71584b323acf Manikandan Muralidharan 2024-04-24  561  	struct drm_framebuffer *fb = state->base.fb;
aa71584b323acf Manikandan Muralidharan 2024-04-24  562  	u32 sr;
aa71584b323acf Manikandan Muralidharan 2024-04-24  563  	int i;
aa71584b323acf Manikandan Muralidharan 2024-04-24  564  
d498771b0b8301 Manikandan Muralidharan 2024-04-24  565  	if (!dc->desc->is_xlcdc)
aa71584b323acf Manikandan Muralidharan 2024-04-24  566  		sr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHSR);
aa71584b323acf Manikandan Muralidharan 2024-04-24  567  
aa71584b323acf Manikandan Muralidharan 2024-04-24  568  	for (i = 0; i < state->nplanes; i++) {
aa71584b323acf Manikandan Muralidharan 2024-04-24  569  		struct drm_gem_dma_object *gem = drm_fb_dma_get_gem_obj(fb, i);
aa71584b323acf Manikandan Muralidharan 2024-04-24  570  
aa71584b323acf Manikandan Muralidharan 2024-04-24  571  		state->dscrs[i]->addr = gem->dma_addr + state->offsets[i];
aa71584b323acf Manikandan Muralidharan 2024-04-24  572  
aa71584b323acf Manikandan Muralidharan 2024-04-24 @573  		dc->desc->ops->lcdc_update_buffers(plane, state, sr, i);
aa71584b323acf Manikandan Muralidharan 2024-04-24  574  
9a45d33cdf82f1 Boris Brezillon         2017-02-06  575  		if (desc->layout.xstride[i])
9a45d33cdf82f1 Boris Brezillon         2017-02-06  576  			atmel_hlcdc_layer_write_cfg(&plane->layer,
9a45d33cdf82f1 Boris Brezillon         2017-02-06  577  						    desc->layout.xstride[i],
9a45d33cdf82f1 Boris Brezillon         2017-02-06  578  						    state->xstride[i]);
9a45d33cdf82f1 Boris Brezillon         2017-02-06  579  
9a45d33cdf82f1 Boris Brezillon         2017-02-06  580  		if (desc->layout.pstride[i])
9a45d33cdf82f1 Boris Brezillon         2017-02-06  581  			atmel_hlcdc_layer_write_cfg(&plane->layer,
9a45d33cdf82f1 Boris Brezillon         2017-02-06  582  						    desc->layout.pstride[i],
2389fc1305fc1e Boris Brezillon         2015-02-05  583  						    state->pstride[i]);
1a396789f65a22 Boris Brezillon         2015-01-06  584  	}
1a396789f65a22 Boris Brezillon         2015-01-06  585  }
1a396789f65a22 Boris Brezillon         2015-01-06  586  

:::::: The code at line 573 was first introduced by commit
:::::: aa71584b323acf62f42844e4f1b4d472b7958a0b drm: atmel-hlcdc: add driver ops to differentiate HLCDC and XLCDC IP

:::::: TO: Manikandan Muralidharan <manikandan.m@microchip.com>
:::::: CC: Sam Ravnborg <sam@ravnborg.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
