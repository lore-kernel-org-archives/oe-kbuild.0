Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B182DF14B
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 02:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765593414; cv=none; b=RO8W69FhGcbDqPspGIwhE95CZBUi5Qp78Qd7krko3cJrLy8NSrQzHs4hz+j/efGqlDAJyLfLHSVrdvRWorgl5ifOQ8H/t5p7kYHl4tMvvduMWXgmptK0zYMOxsKQ4Wa5gQnKS7LpVq4D4WxkydNzFJ2n4PJyL0bNwBRg3/UQysw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765593414; c=relaxed/simple;
	bh=4q71BS4+aeio5FWTtaVY5cz7kzNIa8l3WCqDP8WeC5A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gVirnbfKsMpOJVVEjAk1CwA67Ee4FMn/2foEKE12ME6ZywFC41qRSim/MldeOXF9EULvcsspA2XjaOHC3JFlUdY/rvGf6hZe1g3Gvr2eoY9UWfRVwsVLGKwYFQ5EpA/TWmVfxfjbSmZORR4LZAGjxDQ1xiep27QRMzkbAngUUN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cd+wbCLg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cd+wbCLg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765593413; x=1797129413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4q71BS4+aeio5FWTtaVY5cz7kzNIa8l3WCqDP8WeC5A=;
  b=cd+wbCLgF5cddg30+4NYKUSKMD2wGk1cU06S8emVY2gRvHI9a5WqWR3O
   VX2FMpm0mwl5Khm1sj2X3ELcnsIvLvFiRRMD5LJTgabzrN+pSd0ODDHUk
   sDZ1Yhn7SpUN3XGBNsjRNaCfc9jiWLpnABi2IBd8oJ7Q9qEv9hU4ET7ki
   X59HEpVRILqWZqdj38UXAy2IhmARTb+PNdwYhxLUfxhPnerMVjDGC7nbo
   C2KlOMrAbfEIE4HyOM4lfFo6yAfye9YBnOlZdKW/VI4Z6fOI1ziRK4z9Q
   +AL02wfJcwsX10uaARewt6F0vrBVpxx/t5HIjeBbRIXwCwSp6TcMO0zrY
   w==;
X-CSE-ConnectionGUID: sf8bRpO9RrCHLwSWFSBFfw==
X-CSE-MsgGUID: ERJbqzfgSBysDDY+SLjiaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="66768944"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="66768944"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 18:36:52 -0800
X-CSE-ConnectionGUID: fok2u8+MQgSk8X+65xrluQ==
X-CSE-MsgGUID: mFokT7OnSvG/A461UJgyKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="196993425"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Dec 2025 18:36:51 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUFV2-000000006wd-2yNw;
	Sat, 13 Dec 2025 02:36:48 +0000
Date: Sat, 13 Dec 2025 10:36:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/sitronix/st7571-i2c.c:371
 st7571_fb_update_rect_grayscale() error: uninitialized symbol 'x1'.
Message-ID: <202512131018.EMFVoWke-lkp@intel.com>
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
TO: Marcus Folkesson <marcus.folkesson@gmail.com>
CC: Javier Martinez Canillas <javierm@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 9b8f32002cddf792fc6657c6f084585c7af1a858 drm/sitronix: move tiny Sitronix drivers to their own subdir
date:   7 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-r073-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131018.EMFVoWke-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131018.EMFVoWke-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/sitronix/st7571-i2c.c:371 st7571_fb_update_rect_grayscale() error: uninitialized symbol 'x1'.

Old smatch warnings:
drivers/gpu/drm/sitronix/st7571-i2c.c:214 st7571_send_command_list() error: uninitialized symbol 'ret'.
drivers/gpu/drm/sitronix/st7571-i2c.c:371 st7571_fb_update_rect_grayscale() error: uninitialized symbol 'x2'.

vim +/x1 +371 drivers/gpu/drm/sitronix/st7571-i2c.c

4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  343  
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  344  static int st7571_fb_update_rect_grayscale(struct drm_framebuffer *fb, struct drm_rect *rect)
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  345  {
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  346  	struct st7571_device *st7571 = drm_to_st7571(fb->dev);
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  347  	u32 format = fb->format->format;
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  348  	char *row = st7571->row;
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  349  	int x1;
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  350  	int x2;
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  351  
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  352  	/* Align y to display page boundaries */
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  353  	rect->y1 = round_down(rect->y1, ST7571_PAGE_HEIGHT);
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  354  	rect->y2 = min_t(unsigned int, round_up(rect->y2, ST7571_PAGE_HEIGHT), st7571->nlines);
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  355  
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  356  	switch (format) {
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  357  	case DRM_FORMAT_XRGB8888:
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  358  		/* Threated as monochrome (R1) */
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  359  		fallthrough;
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  360  	case DRM_FORMAT_R1:
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  361  		x1 = rect->x1;
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  362  		x2 = rect->x2;
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  363  		break;
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  364  	case DRM_FORMAT_R2:
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  365  		x1 = rect->x1 * 2;
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  366  		x2 = rect->x2 * 2;
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  367  		break;
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  368  	}
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  369  
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  370  	for (int y = rect->y1; y < rect->y2; y += ST7571_PAGE_HEIGHT) {
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23 @371  		for (int x = x1; x < x2; x++)
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  372  			row[x] = st7571_transform_xy(st7571->hwbuf, x, y);
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  373  
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  374  		st7571_set_position(st7571, rect->x1, y);
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  375  
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  376  		/* TODO: Investige why we can't write multiple bytes at once */
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  377  		for (int x = x1; x < x2; x++) {
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  378  			regmap_bulk_write(st7571->regmap, ST7571_DATA_MODE, row + x, 1);
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  379  
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  380  			/*
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  381  			 * As the display supports grayscale, all pixels must be written as two bits
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  382  			 * even if the format is monochrome.
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  383  			 *
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  384  			 * The bit values maps to the following grayscale:
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  385  			 * 0 0 = White
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  386  			 * 0 1 = Light gray
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  387  			 * 1 0 = Dark gray
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  388  			 * 1 1 = Black
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  389  			 *
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  390  			 * For monochrome formats, write the same value twice to get
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  391  			 * either a black or white pixel.
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  392  			 */
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  393  			if (format == DRM_FORMAT_R1 || format == DRM_FORMAT_XRGB8888)
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  394  				regmap_bulk_write(st7571->regmap, ST7571_DATA_MODE, row + x, 1);
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  395  		}
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  396  	}
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  397  
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  398  	return 0;
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  399  }
4b35f0f41ee295 drivers/gpu/drm/tiny/st7571-i2c.c Marcus Folkesson 2025-04-23  400  

:::::: The code at line 371 was first introduced by commit
:::::: 4b35f0f41ee295059c46a6f4ae97e4b5b8f10d9e drm/st7571-i2c: add support for Sitronix ST7571 LCD controller

:::::: TO: Marcus Folkesson <marcus.folkesson@gmail.com>
:::::: CC: Javier Martinez Canillas <javierm@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
