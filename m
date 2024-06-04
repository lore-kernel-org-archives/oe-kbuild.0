Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E81533F6
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Jun 2024 03:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717471248; cv=none; b=cZskD/Ou6HCkMMq6ePmct7+0A3cfSl0Q/+CP1wMfHicIDGbptyPq2WUmWGXgGpYE8zBEojOAkjIdxHare6cw3+S5OoCEzsP6O0jo3fqcQxwKqEAOg/gSvybx4MoSqSQ13Td9z5AvbrMLRNAgR2ofRfr25fotX1v59rVCyXVEmkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717471248; c=relaxed/simple;
	bh=AQj0KJXrfitYkmiTPj12x4jj526E/OoTnfcRiGHPrEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h3FPw5DFatm07oXVFExhWhQQRHTlGmgQqqJhcas5SkarmJ+OLCAfAXQ7Wz+c8b/1ipok2tBV3++l/cBG7ATq0SY03PkxXdimRuuLWKFlFMsfJ38pe+586fuMSagLBwgHK9RfFaEEvNqGtozdqkCGoLhQkvmHbYkGFWQ71oZSvVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cr4LGUJ5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cr4LGUJ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717471246; x=1749007246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AQj0KJXrfitYkmiTPj12x4jj526E/OoTnfcRiGHPrEU=;
  b=cr4LGUJ5efl152Vk1PTeuMftRfTXMdc5oupQ1yOvpAz+jom2i6hOFykB
   ykwG8/84Afc3LV9XT7ZuXTx762tGQ8GrC0k+FZxOpc6C/l9xfR551mmkt
   rDc6qKE9+biCKBgE3V2arjHGp2hMzjgMZOY4zHCEWcOptI8jHoWs9s53a
   eakNzjLhXP+cTfZL1nd3A8aj45kl6/hMn1JstyIhuh5en/GYvJbohX345
   k6IK8Jg/+V3FEeYEEAps7TVr0RSS8yuZ/KgKmDI6n3y3Dn/1er1mXD4vE
   Zx+Jh8h8fgCcW9hkUm+FugIJRnzpgIA1/ws+ePIjraI1Y2Y6q3fslj8Pi
   Q==;
X-CSE-ConnectionGUID: MpIPpXvnS0eMCjMpJH8+4Q==
X-CSE-MsgGUID: MKbYZhUYQ7eESsXtX3RhUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="17827295"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="17827295"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 20:20:45 -0700
X-CSE-ConnectionGUID: 92EbIIvOTISMN5ZscPTlIw==
X-CSE-MsgGUID: n9BT4QRWTMuuXt11jr1mLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="37202785"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jun 2024 20:20:43 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEKj3-000MV1-1L;
	Tue, 04 Jun 2024 03:20:41 +0000
Date: Tue, 4 Jun 2024 11:19:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panic: Add a kmsg panic screen
Message-ID: <202406041051.KuVqtZCd-lkp@intel.com>
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
In-Reply-To: <20240603095343.39588-4-jfalempe@redhat.com>
References: <20240603095343.39588-4-jfalempe@redhat.com>
TO: Jocelyn Falempe <jfalempe@redhat.com>
TO: dri-devel@lists.freedesktop.org
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Daniel Vetter <daniel@ffwll.ch>
TO: Javier Martinez Canillas <javierm@redhat.com>
CC: Jocelyn Falempe <jfalempe@redhat.com>

Hi Jocelyn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 86266829ea755f737762ebda614c59b136c8feac]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-panic-only-draw-the-foreground-color-in-drm_panic_blit/20240603-181247
base:   86266829ea755f737762ebda614c59b136c8feac
patch link:    https://lore.kernel.org/r/20240603095343.39588-4-jfalempe%40redhat.com
patch subject: [PATCH v2 3/3] drm/panic: Add a kmsg panic screen
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: i386-randconfig-141-20240604 (https://download.01.org/0day-ci/archive/20240604/202406041051.KuVqtZCd-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406041051.KuVqtZCd-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_panic.c:531 draw_panic_static_kmsg() warn: variable dereferenced before check 'font' (see line 529)

vim +/font +531 drivers/gpu/drm/drm_panic.c

c259bba1e69ff2 Jocelyn Falempe 2024-06-03  514  
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  515  /*
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  516   * Draw the kmsg buffer to the screen, starting from the youngest message at the bottom,
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  517   * and going up until reaching the top of the screen.
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  518   */
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  519  static void draw_panic_static_kmsg(struct drm_scanout_buffer *sb)
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  520  {
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  521  	u32 fg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR, sb->format->format);
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  522  	u32 bg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR, sb->format->format);
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  523  	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  524  	struct drm_rect r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  525  	struct kmsg_dump_iter iter;
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  526  	char kmsg_buf[512];
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  527  	size_t kmsg_len;
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  528  	struct drm_panic_line line;
c259bba1e69ff2 Jocelyn Falempe 2024-06-03 @529  	int yoffset = sb->height - font->height - (sb->height % font->height) / 2;
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  530  
c259bba1e69ff2 Jocelyn Falempe 2024-06-03 @531  	if (!font)
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  532  		return;
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  533  
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  534  	/* Fill with the background color, and draw text on top */
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  535  	drm_panic_fill(sb, &r_screen, bg_color);
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  536  
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  537  	kmsg_dump_rewind(&iter);
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  538  	while (kmsg_dump_get_buffer(&iter, false, kmsg_buf, sizeof(kmsg_buf), &kmsg_len)) {
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  539  		char *start;
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  540  		char *end;
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  541  
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  542  		/* ignore terminating NUL and newline */
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  543  		start = kmsg_buf + kmsg_len - 2;
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  544  		end = kmsg_buf + kmsg_len - 1;
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  545  		while (start > kmsg_buf && yoffset >= 0) {
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  546  			while (start > kmsg_buf && *start != '\n')
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  547  				start--;
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  548  			/* don't count the newline character */
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  549  			line.txt = start + (start == kmsg_buf ? 0 : 1);
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  550  			line.len = end - line.txt;
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  551  
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  552  			yoffset = draw_line_with_wrap(sb, font, &line, yoffset, fg_color);
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  553  			end = start;
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  554  			start--;
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  555  		}
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  556  	}
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  557  }
c259bba1e69ff2 Jocelyn Falempe 2024-06-03  558  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
