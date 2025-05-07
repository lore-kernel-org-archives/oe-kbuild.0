Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F47828A417
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 13:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626359; cv=none; b=kuml+67GMDKuRujiZKPaJwojM8qkabQtpKldJRadNff2BM5FXkPRtiFonV1yn3pOcJKHNd13o6o0Pqahwz+EXqQ9jeHu8QtrAZkJXp6dWfgETEkRt4+erxoUH44SmXkO/QQAYsRttqdUIaykUJG7NCuhqqPvLBNqHbcCpdPjz2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626359; c=relaxed/simple;
	bh=h34aVVYo820LFnNZyzIPORR4sLkhqmwqwOBBZkdVu7o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j5yxAuyyWxDjbiTQCGxhjX8qkVIDgHGo343t7Hwcm7QcjwmMRBgZPFvajUiPjEE0ZKx5IMBGxXaNb4RfzRbAG3QU8uSpUTEROQ9BZtoWDhvsLCXgf6zbLNIYWimt3yBvfRk0zeXKcolAyiwrkyTTId50Z7fO6Y6UlgGM4BPFKkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z71AaezG; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z71AaezG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746626357; x=1778162357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h34aVVYo820LFnNZyzIPORR4sLkhqmwqwOBBZkdVu7o=;
  b=Z71AaezG9tAx3rjCcuau5HQv5riVnLN2KlEjiVDcjCYaqGPVScq7JGXS
   3atG+Vr1V0tXq2Wp24pAFilWEshVF+NJ3NTDcNSxbsb7TfhKDH5oyalP4
   JOIsi+Cf5H4KkVE1AoJw+MpD2B60lAIu6h+HvXBrssjAnhBNeNezzRMB7
   NvGJ/iInS63CJimcmNxATyeK1RxVO/jssLvw+HNPHTf2xLYDyvPAHZZER
   dgCX08U7CLHYbT8pmtUQE9MxRo0OCLx6rjQbTN6ho2Nz14Oedw88C7eWj
   4Ut/7fxMKDUiuHPyQM2MKUjdI/RiVfxVpNSvvOGZNEylU4Xt4jWuH33Kw
   w==;
X-CSE-ConnectionGUID: UY02zDPATtqn8bEwEK5u5w==
X-CSE-MsgGUID: gouXuASsRbKM4cGJ9ib8XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59015280"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="59015280"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 06:59:17 -0700
X-CSE-ConnectionGUID: ykd2kfcVRnqljIxxhW/mzw==
X-CSE-MsgGUID: dBqUXG8fRJiOHuOseQXzCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="166895175"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 07 May 2025 06:59:15 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCfIn-0007vi-0F;
	Wed, 07 May 2025 13:59:13 +0000
Date: Wed, 7 May 2025 21:58:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5127/9308] drivers/gpu/drm/tiny/st7571-i2c.c:214
 st7571_send_command_list() error: uninitialized symbol 'ret'.
Message-ID: <202505072151.8hpMcKVq-lkp@intel.com>
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
TO: Marcus Folkesson <marcus.folkesson@gmail.com>
CC: Javier Martinez Canillas <javierm@redhat.com>
CC: Thomas Zimmermann <tzimmrmann@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: 4b35f0f41ee295059c46a6f4ae97e4b5b8f10d9e [5127/9308] drm/st7571-i2c: add support for Sitronix ST7571 LCD controller
:::::: branch date: 6 hours ago
:::::: commit date: 2 weeks ago
config: loongarch-randconfig-r071-20250502 (https://download.01.org/0day-ci/archive/20250507/202505072151.8hpMcKVq-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505072151.8hpMcKVq-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/tiny/st7571-i2c.c:214 st7571_send_command_list() error: uninitialized symbol 'ret'.
drivers/gpu/drm/tiny/st7571-i2c.c:371 st7571_fb_update_rect_grayscale() error: uninitialized symbol 'x1'.
drivers/gpu/drm/tiny/st7571-i2c.c:371 st7571_fb_update_rect_grayscale() error: uninitialized symbol 'x2'.

vim +/ret +214 drivers/gpu/drm/tiny/st7571-i2c.c

4b35f0f41ee295 Marcus Folkesson 2025-04-23  202  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  203  static int st7571_send_command_list(struct st7571_device *st7571,
4b35f0f41ee295 Marcus Folkesson 2025-04-23  204  				    const u8 *cmd_list, size_t len)
4b35f0f41ee295 Marcus Folkesson 2025-04-23  205  {
4b35f0f41ee295 Marcus Folkesson 2025-04-23  206  	int ret;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  207  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  208  	for (int i = 0; i < len; i++) {
4b35f0f41ee295 Marcus Folkesson 2025-04-23  209  		ret = regmap_write(st7571->regmap, ST7571_COMMAND_MODE, cmd_list[i]);
4b35f0f41ee295 Marcus Folkesson 2025-04-23  210  		if (ret < 0)
4b35f0f41ee295 Marcus Folkesson 2025-04-23  211  			return ret;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  212  	}
4b35f0f41ee295 Marcus Folkesson 2025-04-23  213  
4b35f0f41ee295 Marcus Folkesson 2025-04-23 @214  	return ret;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  215  }
4b35f0f41ee295 Marcus Folkesson 2025-04-23  216  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  217  static inline u8 st7571_transform_xy(const char *p, int x, int y)
4b35f0f41ee295 Marcus Folkesson 2025-04-23  218  {
4b35f0f41ee295 Marcus Folkesson 2025-04-23  219  	int xrest = x % 8;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  220  	u8 result = 0;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  221  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  222  	/*
4b35f0f41ee295 Marcus Folkesson 2025-04-23  223  	 * Transforms an (x, y) pixel coordinate into a vertical 8-bit
4b35f0f41ee295 Marcus Folkesson 2025-04-23  224  	 * column from the framebuffer. It calculates the corresponding byte in the
4b35f0f41ee295 Marcus Folkesson 2025-04-23  225  	 * framebuffer, extracts the bit at the given x position across 8 consecutive
4b35f0f41ee295 Marcus Folkesson 2025-04-23  226  	 * rows, and packs those bits into a single byte.
4b35f0f41ee295 Marcus Folkesson 2025-04-23  227  	 *
4b35f0f41ee295 Marcus Folkesson 2025-04-23  228  	 * Return an 8-bit value representing a vertical column of pixels.
4b35f0f41ee295 Marcus Folkesson 2025-04-23  229  	 */
4b35f0f41ee295 Marcus Folkesson 2025-04-23  230  	x = x / 8;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  231  	y = (y / 8) * 8;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  232  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  233  	for (int i = 0; i < 8; i++) {
4b35f0f41ee295 Marcus Folkesson 2025-04-23  234  		int row_idx = y + i;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  235  		u8 byte = p[row_idx * 16 + x];
4b35f0f41ee295 Marcus Folkesson 2025-04-23  236  		u8 bit = (byte >> xrest) & 1;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  237  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  238  		result |= (bit << i);
4b35f0f41ee295 Marcus Folkesson 2025-04-23  239  	}
4b35f0f41ee295 Marcus Folkesson 2025-04-23  240  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  241  	return result;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  242  }
4b35f0f41ee295 Marcus Folkesson 2025-04-23  243  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  244  static int st7571_set_position(struct st7571_device *st7571, int x, int y)
4b35f0f41ee295 Marcus Folkesson 2025-04-23  245  {
4b35f0f41ee295 Marcus Folkesson 2025-04-23  246  	u8 cmd_list[] = {
4b35f0f41ee295 Marcus Folkesson 2025-04-23  247  		ST7571_SET_COLUMN_LSB(x),
4b35f0f41ee295 Marcus Folkesson 2025-04-23  248  		ST7571_SET_COLUMN_MSB(x),
4b35f0f41ee295 Marcus Folkesson 2025-04-23  249  		ST7571_SET_PAGE(y / ST7571_PAGE_HEIGHT),
4b35f0f41ee295 Marcus Folkesson 2025-04-23  250  	};
4b35f0f41ee295 Marcus Folkesson 2025-04-23  251  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  252  	return st7571_send_command_list(st7571, cmd_list, ARRAY_SIZE(cmd_list));
4b35f0f41ee295 Marcus Folkesson 2025-04-23  253  }
4b35f0f41ee295 Marcus Folkesson 2025-04-23  254  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  255  static int st7571_fb_clear_screen(struct st7571_device *st7571)
4b35f0f41ee295 Marcus Folkesson 2025-04-23  256  {
4b35f0f41ee295 Marcus Folkesson 2025-04-23  257  	u32 npixels = st7571->ncols * round_up(st7571->nlines, ST7571_PAGE_HEIGHT) * st7571->bpp;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  258  	char pixelvalue = 0x00;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  259  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  260  	for (int i = 0; i < npixels; i++)
4b35f0f41ee295 Marcus Folkesson 2025-04-23  261  		regmap_bulk_write(st7571->regmap, ST7571_DATA_MODE, &pixelvalue, 1);
4b35f0f41ee295 Marcus Folkesson 2025-04-23  262  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  263  	return 0;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  264  }
4b35f0f41ee295 Marcus Folkesson 2025-04-23  265  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  266  static void st7571_prepare_buffer_monochrome(struct st7571_device *st7571,
4b35f0f41ee295 Marcus Folkesson 2025-04-23  267  					     const struct iosys_map *vmap,
4b35f0f41ee295 Marcus Folkesson 2025-04-23  268  					     struct drm_framebuffer *fb,
4b35f0f41ee295 Marcus Folkesson 2025-04-23  269  					     struct drm_rect *rect,
4b35f0f41ee295 Marcus Folkesson 2025-04-23  270  					     struct drm_format_conv_state *fmtcnv_state)
4b35f0f41ee295 Marcus Folkesson 2025-04-23  271  {
4b35f0f41ee295 Marcus Folkesson 2025-04-23  272  	unsigned int dst_pitch;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  273  	struct iosys_map dst;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  274  	u32 size;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  275  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  276  	switch (fb->format->format) {
4b35f0f41ee295 Marcus Folkesson 2025-04-23  277  	case DRM_FORMAT_XRGB8888:
4b35f0f41ee295 Marcus Folkesson 2025-04-23  278  		dst_pitch = DIV_ROUND_UP(drm_rect_width(rect), 8);
4b35f0f41ee295 Marcus Folkesson 2025-04-23  279  		iosys_map_set_vaddr(&dst, st7571->hwbuf);
4b35f0f41ee295 Marcus Folkesson 2025-04-23  280  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  281  		drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
4b35f0f41ee295 Marcus Folkesson 2025-04-23  282  		break;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  283  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  284  	case DRM_FORMAT_R1:
4b35f0f41ee295 Marcus Folkesson 2025-04-23  285  		size = (rect->x2 - rect->x1) * (rect->y2 - rect->y1) / 8;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  286  		memcpy(st7571->hwbuf, vmap->vaddr, size);
4b35f0f41ee295 Marcus Folkesson 2025-04-23  287  		break;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  288  	}
4b35f0f41ee295 Marcus Folkesson 2025-04-23  289  }
4b35f0f41ee295 Marcus Folkesson 2025-04-23  290  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  291  static void st7571_prepare_buffer_grayscale(struct st7571_device *st7571,
4b35f0f41ee295 Marcus Folkesson 2025-04-23  292  					    const struct iosys_map *vmap,
4b35f0f41ee295 Marcus Folkesson 2025-04-23  293  					    struct drm_framebuffer *fb,
4b35f0f41ee295 Marcus Folkesson 2025-04-23  294  					    struct drm_rect *rect,
4b35f0f41ee295 Marcus Folkesson 2025-04-23  295  					    struct drm_format_conv_state *fmtcnv_state)
4b35f0f41ee295 Marcus Folkesson 2025-04-23  296  {
4b35f0f41ee295 Marcus Folkesson 2025-04-23  297  	u32 size = (rect->x2 - rect->x1) * (rect->y2 - rect->y1) / 8;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  298  	unsigned int dst_pitch;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  299  	struct iosys_map dst;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  300  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  301  	switch (fb->format->format) {
4b35f0f41ee295 Marcus Folkesson 2025-04-23  302  	case DRM_FORMAT_XRGB8888: /* Only support XRGB8888 in monochrome mode */
4b35f0f41ee295 Marcus Folkesson 2025-04-23  303  		dst_pitch = DIV_ROUND_UP(drm_rect_width(rect), 8);
4b35f0f41ee295 Marcus Folkesson 2025-04-23  304  		iosys_map_set_vaddr(&dst, st7571->hwbuf);
4b35f0f41ee295 Marcus Folkesson 2025-04-23  305  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  306  		drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
4b35f0f41ee295 Marcus Folkesson 2025-04-23  307  		break;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  308  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  309  	case DRM_FORMAT_R1:
4b35f0f41ee295 Marcus Folkesson 2025-04-23  310  		size = (rect->x2 - rect->x1) * (rect->y2 - rect->y1) / 8;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  311  		memcpy(st7571->hwbuf, vmap->vaddr, size);
4b35f0f41ee295 Marcus Folkesson 2025-04-23  312  		break;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  313  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  314  	case DRM_FORMAT_R2:
4b35f0f41ee295 Marcus Folkesson 2025-04-23  315  		size = (rect->x2 - rect->x1) * (rect->y2 - rect->y1) / 4;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  316  		memcpy(st7571->hwbuf, vmap->vaddr, size);
4b35f0f41ee295 Marcus Folkesson 2025-04-23  317  		break;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  318  	};
4b35f0f41ee295 Marcus Folkesson 2025-04-23  319  }
4b35f0f41ee295 Marcus Folkesson 2025-04-23  320  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  321  static int st7571_fb_update_rect_monochrome(struct drm_framebuffer *fb, struct drm_rect *rect)
4b35f0f41ee295 Marcus Folkesson 2025-04-23  322  {
4b35f0f41ee295 Marcus Folkesson 2025-04-23  323  	struct st7571_device *st7571 = drm_to_st7571(fb->dev);
4b35f0f41ee295 Marcus Folkesson 2025-04-23  324  	char *row = st7571->row;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  325  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  326  	/* Align y to display page boundaries */
4b35f0f41ee295 Marcus Folkesson 2025-04-23  327  	rect->y1 = round_down(rect->y1, ST7571_PAGE_HEIGHT);
4b35f0f41ee295 Marcus Folkesson 2025-04-23  328  	rect->y2 = min_t(unsigned int, round_up(rect->y2, ST7571_PAGE_HEIGHT), st7571->nlines);
4b35f0f41ee295 Marcus Folkesson 2025-04-23  329  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  330  	for (int y = rect->y1; y < rect->y2; y += ST7571_PAGE_HEIGHT) {
4b35f0f41ee295 Marcus Folkesson 2025-04-23  331  		for (int x = rect->x1; x < rect->x2; x++)
4b35f0f41ee295 Marcus Folkesson 2025-04-23  332  			row[x] = st7571_transform_xy(st7571->hwbuf, x, y);
4b35f0f41ee295 Marcus Folkesson 2025-04-23  333  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  334  		st7571_set_position(st7571, rect->x1, y);
4b35f0f41ee295 Marcus Folkesson 2025-04-23  335  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  336  		/* TODO: Investige why we can't write multiple bytes at once */
4b35f0f41ee295 Marcus Folkesson 2025-04-23  337  		for (int x = rect->x1; x < rect->x2; x++)
4b35f0f41ee295 Marcus Folkesson 2025-04-23  338  			regmap_bulk_write(st7571->regmap, ST7571_DATA_MODE, row + x, 1);
4b35f0f41ee295 Marcus Folkesson 2025-04-23  339  	}
4b35f0f41ee295 Marcus Folkesson 2025-04-23  340  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  341  	return 0;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  342  }
4b35f0f41ee295 Marcus Folkesson 2025-04-23  343  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  344  static int st7571_fb_update_rect_grayscale(struct drm_framebuffer *fb, struct drm_rect *rect)
4b35f0f41ee295 Marcus Folkesson 2025-04-23  345  {
4b35f0f41ee295 Marcus Folkesson 2025-04-23  346  	struct st7571_device *st7571 = drm_to_st7571(fb->dev);
4b35f0f41ee295 Marcus Folkesson 2025-04-23  347  	u32 format = fb->format->format;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  348  	char *row = st7571->row;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  349  	int x1;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  350  	int x2;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  351  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  352  	/* Align y to display page boundaries */
4b35f0f41ee295 Marcus Folkesson 2025-04-23  353  	rect->y1 = round_down(rect->y1, ST7571_PAGE_HEIGHT);
4b35f0f41ee295 Marcus Folkesson 2025-04-23  354  	rect->y2 = min_t(unsigned int, round_up(rect->y2, ST7571_PAGE_HEIGHT), st7571->nlines);
4b35f0f41ee295 Marcus Folkesson 2025-04-23  355  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  356  	switch (format) {
4b35f0f41ee295 Marcus Folkesson 2025-04-23  357  	case DRM_FORMAT_XRGB8888:
4b35f0f41ee295 Marcus Folkesson 2025-04-23  358  		/* Threated as monochrome (R1) */
4b35f0f41ee295 Marcus Folkesson 2025-04-23  359  		fallthrough;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  360  	case DRM_FORMAT_R1:
4b35f0f41ee295 Marcus Folkesson 2025-04-23  361  		x1 = rect->x1;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  362  		x2 = rect->x2;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  363  		break;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  364  	case DRM_FORMAT_R2:
4b35f0f41ee295 Marcus Folkesson 2025-04-23  365  		x1 = rect->x1 * 2;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  366  		x2 = rect->x2 * 2;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  367  		break;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  368  	}
4b35f0f41ee295 Marcus Folkesson 2025-04-23  369  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  370  	for (int y = rect->y1; y < rect->y2; y += ST7571_PAGE_HEIGHT) {
4b35f0f41ee295 Marcus Folkesson 2025-04-23 @371  		for (int x = x1; x < x2; x++)
4b35f0f41ee295 Marcus Folkesson 2025-04-23  372  			row[x] = st7571_transform_xy(st7571->hwbuf, x, y);
4b35f0f41ee295 Marcus Folkesson 2025-04-23  373  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  374  		st7571_set_position(st7571, rect->x1, y);
4b35f0f41ee295 Marcus Folkesson 2025-04-23  375  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  376  		/* TODO: Investige why we can't write multiple bytes at once */
4b35f0f41ee295 Marcus Folkesson 2025-04-23  377  		for (int x = x1; x < x2; x++) {
4b35f0f41ee295 Marcus Folkesson 2025-04-23  378  			regmap_bulk_write(st7571->regmap, ST7571_DATA_MODE, row + x, 1);
4b35f0f41ee295 Marcus Folkesson 2025-04-23  379  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  380  			/*
4b35f0f41ee295 Marcus Folkesson 2025-04-23  381  			 * As the display supports grayscale, all pixels must be written as two bits
4b35f0f41ee295 Marcus Folkesson 2025-04-23  382  			 * even if the format is monochrome.
4b35f0f41ee295 Marcus Folkesson 2025-04-23  383  			 *
4b35f0f41ee295 Marcus Folkesson 2025-04-23  384  			 * The bit values maps to the following grayscale:
4b35f0f41ee295 Marcus Folkesson 2025-04-23  385  			 * 0 0 = White
4b35f0f41ee295 Marcus Folkesson 2025-04-23  386  			 * 0 1 = Light gray
4b35f0f41ee295 Marcus Folkesson 2025-04-23  387  			 * 1 0 = Dark gray
4b35f0f41ee295 Marcus Folkesson 2025-04-23  388  			 * 1 1 = Black
4b35f0f41ee295 Marcus Folkesson 2025-04-23  389  			 *
4b35f0f41ee295 Marcus Folkesson 2025-04-23  390  			 * For monochrome formats, write the same value twice to get
4b35f0f41ee295 Marcus Folkesson 2025-04-23  391  			 * either a black or white pixel.
4b35f0f41ee295 Marcus Folkesson 2025-04-23  392  			 */
4b35f0f41ee295 Marcus Folkesson 2025-04-23  393  			if (format == DRM_FORMAT_R1 || format == DRM_FORMAT_XRGB8888)
4b35f0f41ee295 Marcus Folkesson 2025-04-23  394  				regmap_bulk_write(st7571->regmap, ST7571_DATA_MODE, row + x, 1);
4b35f0f41ee295 Marcus Folkesson 2025-04-23  395  		}
4b35f0f41ee295 Marcus Folkesson 2025-04-23  396  	}
4b35f0f41ee295 Marcus Folkesson 2025-04-23  397  
4b35f0f41ee295 Marcus Folkesson 2025-04-23  398  	return 0;
4b35f0f41ee295 Marcus Folkesson 2025-04-23  399  }
4b35f0f41ee295 Marcus Folkesson 2025-04-23  400  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
