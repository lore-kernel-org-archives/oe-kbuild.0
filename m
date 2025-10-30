Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEE0194A65
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Oct 2025 13:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761832552; cv=none; b=ueP2n2fxdH4l2QiPoi9+C3CydwMmuh3j5wiG97avtjE9wJQ3hpv6Kv2D5PzVb8bnWa48seSgR3gz9HaHRcNzEtTm0nkM3NLqVY19cR+s7U3c5avZ17WkYG+nKxwz5IQAqMNDG0RpiR+mq/pEEFFfOwp4Ra4NG0MHlCEb3W7bmj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761832552; c=relaxed/simple;
	bh=eEKrn6+P+nfUmpWCfzt6qqfGIkqEvNG8JOw/wK0u/9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CGXBguWlTjURIIPz1ejaCU09n71tBr22oCzr9IBvxGf1pI1DfXNZwpaXJtmOC6bjRtG7sbNLC2pq2RWHHL4ylh4KdwzRb3XT+safgVeUcdt0vFSj5RoJWN+inHafZ4YwnFyDeT6M0uGL1w7otcJicBtEVzSxyAaaryPGGU2ImRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zdfj2Fyk; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zdfj2Fyk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761832549; x=1793368549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eEKrn6+P+nfUmpWCfzt6qqfGIkqEvNG8JOw/wK0u/9s=;
  b=Zdfj2FykxURT/fX9WEvq1h/cZNvJpkf8GhtQTb9R8dDqewtnh1FMGObE
   KUVVomgN80pw+DVM0gUGrtkElxz3ASdqkVd7EhxGdy1zd7aB4cll1kb/s
   2ilpdE7r5WXGG7K+jNR919OGbbYI9whcehT8pjhrZtOB/JlzDEg5x5IoB
   iGa3t3u/ITpYRezrw8JlTVRuFjXYdOpgGLFBWOVPyfyzRNno8GtqEWNl1
   kNUq1w2cZsI3g3ga8YaWNaC9BeD7mA+bn9SlmEvbxed2ViFNDyBzz7QsS
   2+7bEkUo67iLOwqrcMtTyckUzHKRamLkFy2YpgYi5k+zBhtEB7c/QK7Wd
   w==;
X-CSE-ConnectionGUID: /PqSTjEYSgCm5ygVtc5wiA==
X-CSE-MsgGUID: U15py6dRSSOmYI/hyelmEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="86600187"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="86600187"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 06:55:49 -0700
X-CSE-ConnectionGUID: E/Ya35NTQ0i3WivUq/R5dA==
X-CSE-MsgGUID: 4UDSHOGMQ/6d5Y6tkWj3Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="190319633"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 30 Oct 2025 06:55:44 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vET7H-000M4C-1T;
	Thu, 30 Oct 2025 13:55:04 +0000
Date: Thu, 30 Oct 2025 21:55:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 5/6] drm/sitronix/st7571: split up the driver into a
 common and an i2c part
Message-ID: <202510302121.g9BHuXb7-lkp@intel.com>
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
In-Reply-To: <20251024-st7571-split-v1-5-d3092b98130f@gmail.com>
References: <20251024-st7571-split-v1-5-d3092b98130f@gmail.com>
TO: Marcus Folkesson <marcus.folkesson@gmail.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
CC: dri-devel@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org
CC: Marcus Folkesson <marcus.folkesson@gmail.com>

Hi Marcus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7e73cefd2bede5408d1aeb6145261b62d85d23be]

url:    https://github.com/intel-lab-lkp/linux/commits/Marcus-Folkesson/drm-sitronix-st7571-i2c-rename-struct-drm_device-in-st7571_device/20251024-192347
base:   7e73cefd2bede5408d1aeb6145261b62d85d23be
patch link:    https://lore.kernel.org/r/20251024-st7571-split-v1-5-d3092b98130f%40gmail.com
patch subject: [PATCH 5/6] drm/sitronix/st7571: split up the driver into a common and an i2c part
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: um-randconfig-r073-20251025 (https://download.01.org/0day-ci/archive/20251030/202510302121.g9BHuXb7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510302121.g9BHuXb7-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/sitronix/st7571.c:99 st7571_send_command_list() error: uninitialized symbol 'ret'.
drivers/gpu/drm/sitronix/st7571.c:257 st7571_fb_update_rect_grayscale() error: uninitialized symbol 'x1'.
drivers/gpu/drm/sitronix/st7571.c:257 st7571_fb_update_rect_grayscale() error: uninitialized symbol 'x2'.

vim +/ret +99 drivers/gpu/drm/sitronix/st7571.c

b6a4754f3a5418 Marcus Folkesson 2025-10-24   87  
b6a4754f3a5418 Marcus Folkesson 2025-10-24   88  static int st7571_send_command_list(struct st7571_device *st7571,
b6a4754f3a5418 Marcus Folkesson 2025-10-24   89  				    const u8 *cmd_list, size_t len)
b6a4754f3a5418 Marcus Folkesson 2025-10-24   90  {
b6a4754f3a5418 Marcus Folkesson 2025-10-24   91  	int ret;
b6a4754f3a5418 Marcus Folkesson 2025-10-24   92  
b6a4754f3a5418 Marcus Folkesson 2025-10-24   93  	for (int i = 0; i < len; i++) {
b6a4754f3a5418 Marcus Folkesson 2025-10-24   94  		ret = regmap_write(st7571->regmap, ST7571_COMMAND_MODE, cmd_list[i]);
b6a4754f3a5418 Marcus Folkesson 2025-10-24   95  		if (ret < 0)
b6a4754f3a5418 Marcus Folkesson 2025-10-24   96  			return ret;
b6a4754f3a5418 Marcus Folkesson 2025-10-24   97  	}
b6a4754f3a5418 Marcus Folkesson 2025-10-24   98  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  @99  	return ret;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  100  }
b6a4754f3a5418 Marcus Folkesson 2025-10-24  101  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  102  static inline u8 st7571_transform_xy(const char *p, int x, int y, u8 bpp)
b6a4754f3a5418 Marcus Folkesson 2025-10-24  103  {
b6a4754f3a5418 Marcus Folkesson 2025-10-24  104  	int xrest = x % 8;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  105  	u8 result = 0;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  106  	u8 row_len = 16 * bpp;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  107  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  108  	/*
b6a4754f3a5418 Marcus Folkesson 2025-10-24  109  	 * Transforms an (x, y) pixel coordinate into a vertical 8-bit
b6a4754f3a5418 Marcus Folkesson 2025-10-24  110  	 * column from the framebuffer. It calculates the corresponding byte in the
b6a4754f3a5418 Marcus Folkesson 2025-10-24  111  	 * framebuffer, extracts the bit at the given x position across 8 consecutive
b6a4754f3a5418 Marcus Folkesson 2025-10-24  112  	 * rows, and packs those bits into a single byte.
b6a4754f3a5418 Marcus Folkesson 2025-10-24  113  	 *
b6a4754f3a5418 Marcus Folkesson 2025-10-24  114  	 * Return an 8-bit value representing a vertical column of pixels.
b6a4754f3a5418 Marcus Folkesson 2025-10-24  115  	 */
b6a4754f3a5418 Marcus Folkesson 2025-10-24  116  	x = x / 8;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  117  	y = (y / 8) * 8;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  118  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  119  	for (int i = 0; i < 8; i++) {
b6a4754f3a5418 Marcus Folkesson 2025-10-24  120  		int row_idx = y + i;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  121  		u8 byte = p[row_idx * row_len + x];
b6a4754f3a5418 Marcus Folkesson 2025-10-24  122  		u8 bit = (byte >> xrest) & 1;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  123  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  124  		result |= (bit << i);
b6a4754f3a5418 Marcus Folkesson 2025-10-24  125  	}
b6a4754f3a5418 Marcus Folkesson 2025-10-24  126  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  127  	return result;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  128  }
b6a4754f3a5418 Marcus Folkesson 2025-10-24  129  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  130  static int st7571_set_position(struct st7571_device *st7571, int x, int y)
b6a4754f3a5418 Marcus Folkesson 2025-10-24  131  {
b6a4754f3a5418 Marcus Folkesson 2025-10-24  132  	u8 cmd_list[] = {
b6a4754f3a5418 Marcus Folkesson 2025-10-24  133  		ST7571_SET_COLUMN_LSB(x),
b6a4754f3a5418 Marcus Folkesson 2025-10-24  134  		ST7571_SET_COLUMN_MSB(x),
b6a4754f3a5418 Marcus Folkesson 2025-10-24  135  		ST7571_SET_PAGE(y / ST7571_PAGE_HEIGHT),
b6a4754f3a5418 Marcus Folkesson 2025-10-24  136  	};
b6a4754f3a5418 Marcus Folkesson 2025-10-24  137  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  138  	return st7571_send_command_list(st7571, cmd_list, ARRAY_SIZE(cmd_list));
b6a4754f3a5418 Marcus Folkesson 2025-10-24  139  }
b6a4754f3a5418 Marcus Folkesson 2025-10-24  140  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  141  static int st7571_fb_clear_screen(struct st7571_device *st7571)
b6a4754f3a5418 Marcus Folkesson 2025-10-24  142  {
b6a4754f3a5418 Marcus Folkesson 2025-10-24  143  	u32 npixels = st7571->ncols * round_up(st7571->nlines, ST7571_PAGE_HEIGHT) * st7571->bpp;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  144  	char pixelvalue = 0x00;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  145  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  146  	st7571_set_position(st7571, 0, 0);
b6a4754f3a5418 Marcus Folkesson 2025-10-24  147  	for (int i = 0; i < npixels; i++)
b6a4754f3a5418 Marcus Folkesson 2025-10-24  148  		regmap_bulk_write(st7571->regmap, ST7571_DATA_MODE, &pixelvalue, 1);
b6a4754f3a5418 Marcus Folkesson 2025-10-24  149  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  150  	return 0;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  151  }
b6a4754f3a5418 Marcus Folkesson 2025-10-24  152  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  153  static void st7571_prepare_buffer_monochrome(struct st7571_device *st7571,
b6a4754f3a5418 Marcus Folkesson 2025-10-24  154  					     const struct iosys_map *vmap,
b6a4754f3a5418 Marcus Folkesson 2025-10-24  155  					     struct drm_framebuffer *fb,
b6a4754f3a5418 Marcus Folkesson 2025-10-24  156  					     struct drm_rect *rect,
b6a4754f3a5418 Marcus Folkesson 2025-10-24  157  					     struct drm_format_conv_state *fmtcnv_state)
b6a4754f3a5418 Marcus Folkesson 2025-10-24  158  {
b6a4754f3a5418 Marcus Folkesson 2025-10-24  159  	unsigned int dst_pitch;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  160  	struct iosys_map dst;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  161  	u32 size;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  162  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  163  	switch (fb->format->format) {
b6a4754f3a5418 Marcus Folkesson 2025-10-24  164  	case DRM_FORMAT_XRGB8888:
b6a4754f3a5418 Marcus Folkesson 2025-10-24  165  		dst_pitch = DIV_ROUND_UP(drm_rect_width(rect), 8);
b6a4754f3a5418 Marcus Folkesson 2025-10-24  166  		iosys_map_set_vaddr(&dst, st7571->hwbuf);
b6a4754f3a5418 Marcus Folkesson 2025-10-24  167  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  168  		drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
b6a4754f3a5418 Marcus Folkesson 2025-10-24  169  		break;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  170  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  171  	case DRM_FORMAT_R1:
b6a4754f3a5418 Marcus Folkesson 2025-10-24  172  		size = (rect->x2 - rect->x1) * (rect->y2 - rect->y1) / 8;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  173  		memcpy(st7571->hwbuf, vmap->vaddr, size);
b6a4754f3a5418 Marcus Folkesson 2025-10-24  174  		break;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  175  	}
b6a4754f3a5418 Marcus Folkesson 2025-10-24  176  }
b6a4754f3a5418 Marcus Folkesson 2025-10-24  177  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  178  static void st7571_prepare_buffer_grayscale(struct st7571_device *st7571,
b6a4754f3a5418 Marcus Folkesson 2025-10-24  179  					    const struct iosys_map *vmap,
b6a4754f3a5418 Marcus Folkesson 2025-10-24  180  					    struct drm_framebuffer *fb,
b6a4754f3a5418 Marcus Folkesson 2025-10-24  181  					    struct drm_rect *rect,
b6a4754f3a5418 Marcus Folkesson 2025-10-24  182  					    struct drm_format_conv_state *fmtcnv_state)
b6a4754f3a5418 Marcus Folkesson 2025-10-24  183  {
b6a4754f3a5418 Marcus Folkesson 2025-10-24  184  	u32 size = (rect->x2 - rect->x1) * (rect->y2 - rect->y1) / 8;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  185  	unsigned int dst_pitch;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  186  	struct iosys_map dst;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  187  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  188  	switch (fb->format->format) {
b6a4754f3a5418 Marcus Folkesson 2025-10-24  189  	case DRM_FORMAT_XRGB8888:
b6a4754f3a5418 Marcus Folkesson 2025-10-24  190  		dst_pitch = DIV_ROUND_UP(drm_rect_width(rect), 4);
b6a4754f3a5418 Marcus Folkesson 2025-10-24  191  		iosys_map_set_vaddr(&dst, st7571->hwbuf);
b6a4754f3a5418 Marcus Folkesson 2025-10-24  192  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  193  		drm_fb_xrgb8888_to_gray2(&dst, &dst_pitch, vmap, fb, rect, fmtcnv_state);
b6a4754f3a5418 Marcus Folkesson 2025-10-24  194  		break;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  195  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  196  	case DRM_FORMAT_R1:
b6a4754f3a5418 Marcus Folkesson 2025-10-24  197  		size = (rect->x2 - rect->x1) * (rect->y2 - rect->y1) / 8;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  198  		memcpy(st7571->hwbuf, vmap->vaddr, size);
b6a4754f3a5418 Marcus Folkesson 2025-10-24  199  		break;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  200  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  201  	case DRM_FORMAT_R2:
b6a4754f3a5418 Marcus Folkesson 2025-10-24  202  		size = (rect->x2 - rect->x1) * (rect->y2 - rect->y1) / 4;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  203  		memcpy(st7571->hwbuf, vmap->vaddr, size);
b6a4754f3a5418 Marcus Folkesson 2025-10-24  204  		break;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  205  	}
b6a4754f3a5418 Marcus Folkesson 2025-10-24  206  }
b6a4754f3a5418 Marcus Folkesson 2025-10-24  207  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  208  static int st7571_fb_update_rect_monochrome(struct drm_framebuffer *fb, struct drm_rect *rect)
b6a4754f3a5418 Marcus Folkesson 2025-10-24  209  {
b6a4754f3a5418 Marcus Folkesson 2025-10-24  210  	struct st7571_device *st7571 = drm_to_st7571(fb->dev);
b6a4754f3a5418 Marcus Folkesson 2025-10-24  211  	char *row = st7571->row;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  212  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  213  	/* Align y to display page boundaries */
b6a4754f3a5418 Marcus Folkesson 2025-10-24  214  	rect->y1 = round_down(rect->y1, ST7571_PAGE_HEIGHT);
b6a4754f3a5418 Marcus Folkesson 2025-10-24  215  	rect->y2 = min_t(unsigned int, round_up(rect->y2, ST7571_PAGE_HEIGHT), st7571->nlines);
b6a4754f3a5418 Marcus Folkesson 2025-10-24  216  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  217  	for (int y = rect->y1; y < rect->y2; y += ST7571_PAGE_HEIGHT) {
b6a4754f3a5418 Marcus Folkesson 2025-10-24  218  		for (int x = rect->x1; x < rect->x2; x++)
b6a4754f3a5418 Marcus Folkesson 2025-10-24  219  			row[x] = st7571_transform_xy(st7571->hwbuf, x, y, 1);
b6a4754f3a5418 Marcus Folkesson 2025-10-24  220  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  221  		st7571_set_position(st7571, rect->x1, y);
b6a4754f3a5418 Marcus Folkesson 2025-10-24  222  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  223  		/* TODO: Investige why we can't write multiple bytes at once */
b6a4754f3a5418 Marcus Folkesson 2025-10-24  224  		for (int x = rect->x1; x < rect->x2; x++)
b6a4754f3a5418 Marcus Folkesson 2025-10-24  225  			regmap_bulk_write(st7571->regmap, ST7571_DATA_MODE, row + x, 1);
b6a4754f3a5418 Marcus Folkesson 2025-10-24  226  	}
b6a4754f3a5418 Marcus Folkesson 2025-10-24  227  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  228  	return 0;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  229  }
b6a4754f3a5418 Marcus Folkesson 2025-10-24  230  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  231  static int st7571_fb_update_rect_grayscale(struct drm_framebuffer *fb, struct drm_rect *rect)
b6a4754f3a5418 Marcus Folkesson 2025-10-24  232  {
b6a4754f3a5418 Marcus Folkesson 2025-10-24  233  	struct st7571_device *st7571 = drm_to_st7571(fb->dev);
b6a4754f3a5418 Marcus Folkesson 2025-10-24  234  	u32 format = fb->format->format;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  235  	char *row = st7571->row;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  236  	int x1;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  237  	int x2;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  238  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  239  	/* Align y to display page boundaries */
b6a4754f3a5418 Marcus Folkesson 2025-10-24  240  	rect->y1 = round_down(rect->y1, ST7571_PAGE_HEIGHT);
b6a4754f3a5418 Marcus Folkesson 2025-10-24  241  	rect->y2 = min_t(unsigned int, round_up(rect->y2, ST7571_PAGE_HEIGHT), st7571->nlines);
b6a4754f3a5418 Marcus Folkesson 2025-10-24  242  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  243  	switch (format) {
b6a4754f3a5418 Marcus Folkesson 2025-10-24  244  	case DRM_FORMAT_R1:
b6a4754f3a5418 Marcus Folkesson 2025-10-24  245  		x1 = rect->x1 * 1;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  246  		x2 = rect->x2 * 1;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  247  		break;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  248  	case DRM_FORMAT_R2:
b6a4754f3a5418 Marcus Folkesson 2025-10-24  249  		fallthrough;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  250  	case DRM_FORMAT_XRGB8888:
b6a4754f3a5418 Marcus Folkesson 2025-10-24  251  		x1 = rect->x1 * 2;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  252  		x2 = rect->x2 * 2;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  253  		break;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  254  	}
b6a4754f3a5418 Marcus Folkesson 2025-10-24  255  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  256  	for (int y = rect->y1; y < rect->y2; y += ST7571_PAGE_HEIGHT) {
b6a4754f3a5418 Marcus Folkesson 2025-10-24 @257  		for (int x = x1; x < x2; x++)
b6a4754f3a5418 Marcus Folkesson 2025-10-24  258  			row[x] = st7571_transform_xy(st7571->hwbuf, x, y, 2);
b6a4754f3a5418 Marcus Folkesson 2025-10-24  259  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  260  		st7571_set_position(st7571, rect->x1, y);
b6a4754f3a5418 Marcus Folkesson 2025-10-24  261  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  262  		/* TODO: Investige why we can't write multiple bytes at once */
b6a4754f3a5418 Marcus Folkesson 2025-10-24  263  		for (int x = x1; x < x2; x++) {
b6a4754f3a5418 Marcus Folkesson 2025-10-24  264  			regmap_bulk_write(st7571->regmap, ST7571_DATA_MODE, row + x, 1);
b6a4754f3a5418 Marcus Folkesson 2025-10-24  265  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  266  			/*
b6a4754f3a5418 Marcus Folkesson 2025-10-24  267  			 * As the display supports grayscale, all pixels must be written as two bits
b6a4754f3a5418 Marcus Folkesson 2025-10-24  268  			 * even if the format is monochrome.
b6a4754f3a5418 Marcus Folkesson 2025-10-24  269  			 *
b6a4754f3a5418 Marcus Folkesson 2025-10-24  270  			 * The bit values maps to the following grayscale:
b6a4754f3a5418 Marcus Folkesson 2025-10-24  271  			 * 0 0 = Black
b6a4754f3a5418 Marcus Folkesson 2025-10-24  272  			 * 0 1 = Dark gray
b6a4754f3a5418 Marcus Folkesson 2025-10-24  273  			 * 1 0 = Light gray
b6a4754f3a5418 Marcus Folkesson 2025-10-24  274  			 * 1 1 = White
b6a4754f3a5418 Marcus Folkesson 2025-10-24  275  			 *
b6a4754f3a5418 Marcus Folkesson 2025-10-24  276  			 * For monochrome formats, write the same value twice to get
b6a4754f3a5418 Marcus Folkesson 2025-10-24  277  			 * either a black or white pixel.
b6a4754f3a5418 Marcus Folkesson 2025-10-24  278  			 */
b6a4754f3a5418 Marcus Folkesson 2025-10-24  279  			if (format == DRM_FORMAT_R1)
b6a4754f3a5418 Marcus Folkesson 2025-10-24  280  				regmap_bulk_write(st7571->regmap, ST7571_DATA_MODE, row + x, 1);
b6a4754f3a5418 Marcus Folkesson 2025-10-24  281  		}
b6a4754f3a5418 Marcus Folkesson 2025-10-24  282  	}
b6a4754f3a5418 Marcus Folkesson 2025-10-24  283  
b6a4754f3a5418 Marcus Folkesson 2025-10-24  284  	return 0;
b6a4754f3a5418 Marcus Folkesson 2025-10-24  285  }
b6a4754f3a5418 Marcus Folkesson 2025-10-24  286  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
