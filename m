Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA282C0303
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 03:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765596900; cv=none; b=PzZ0+Zqh332gLy3CDMnWwUTTCBtoBhR2WClCt7aS/yDdtRT2ljHh6/qmTaOvgSSsqQ08b/QaHq2JPlyyty0AFeUyaSav6w2zVnwaHm6nWYyiCbmYXPYGqE2cJeY41jftlD+fxX/d4akblqu3AlPDToKHsbVdsyI9nXzhoilpJZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765596900; c=relaxed/simple;
	bh=Nz6qNTs/zLC/Mm0X4zfer92a9o6smf6uhwxBxnGOCuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eundykhr0Bn4XFTB1enZu5wrhP87pkOQCfFgfxT+TTJPpLOxN5GUJAPF+/te8ZCbCVE8kLloWw5h56vJOcjQ2ehx8s5bDIyYsE3nwBqgP5ETtK2ejuTypDb7kffylhGVaH2pnC5xq/CEsQFLrVQRs3cRPt94XslgEXgiSBn/ZxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EG8227m7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EG8227m7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765596898; x=1797132898;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nz6qNTs/zLC/Mm0X4zfer92a9o6smf6uhwxBxnGOCuI=;
  b=EG8227m75YvTyYffH2WhQPAG5EJBE1oHogUtEnUkPv8+KxIunSxpcA50
   9KgFdBR1kPS/IS+d064dei93zZfz+2Drr3pymr1/7Bt9WVAaUpm1Fylwm
   LiXYNYgOYbYpwt5MteWBRCHeIWgtYs2mp0V+PaxYo6Yf+roxcDmqjSFiu
   +sfyRnZA7uV7/Jz1qogp7ZR7p3A8Sa0Sf7vcsnpx8fakZGjCqrsNDz3SN
   MAKNR7BvnMV7wKVY9KRVv3G3yK8i1/FRJil2+PP8wCuHoFumJ4Ras4Ge8
   KKW3lnlqm+C9S/fIkB0a1ZPlJt3v98aflJL2LjvQ+KxD/jngCfzMIq2Di
   Q==;
X-CSE-ConnectionGUID: fwE80HU6RNuCeIY0cEfCUA==
X-CSE-MsgGUID: ZZ8uJnGnQEGv2nv4jE0Kbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78235813"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="78235813"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 19:34:55 -0800
X-CSE-ConnectionGUID: Q4t+WVjSTUKYnqCwZBPNWA==
X-CSE-MsgGUID: mtqVroziSjKYV9rmcgmh1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="196315676"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Dec 2025 19:34:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUGPE-000000006zu-1b9x;
	Sat, 13 Dec 2025 03:34:52 +0000
Date: Sat, 13 Dec 2025 11:34:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/sitronix/st7571-i2c.c:371
 st7571_fb_update_rect_grayscale() error: uninitialized symbol 'x2'.
Message-ID: <202512131133.pPJb0B2h-lkp@intel.com>
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
:::::: branch date: 17 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-141-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131133.pPJb0B2h-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131133.pPJb0B2h-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/sitronix/st7571-i2c.c:371 st7571_fb_update_rect_grayscale() error: uninitialized symbol 'x2'.

Old smatch warnings:
drivers/gpu/drm/sitronix/st7571-i2c.c:214 st7571_send_command_list() error: uninitialized symbol 'ret'.
drivers/gpu/drm/sitronix/st7571-i2c.c:371 st7571_fb_update_rect_grayscale() error: uninitialized symbol 'x1'.

vim +/x2 +371 drivers/gpu/drm/sitronix/st7571-i2c.c

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
