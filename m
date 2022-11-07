Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEBA184F
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Nov 2022 07:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667804745; x=1699340745;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nj9wp1baZJmwPnTXAUI45jLBrWaM3OSBX0H1qDXCK/Q=;
  b=fUvVUMUqaFldGl8t9LX2qG9MAegzKbcdb0mn6bZawh0BlaabU1lanlIt
   RT7/QIDstjNTCuRBv5znN6ws604yajgGuappRcW8bCQVpuBvaCS/Mh8Cc
   Fpz/s8djQYx8AUw5s5BSYUoZNVj+HwEYezyrLtsT+TrO0ZbFbNNELedPn
   BR9sr401SSkw5l2Lrmf5WKLbZ43QSPEMU4YyVr82RSKYn5+FWyNC4WeGs
   oBMi4UDlWykUMYV/jgezl/I6+RVZpygA1TU0lWMRZT7F+Pi1i6cuA/VkP
   6ZyzlAV6o4c+TgEsDWV2M6xjeUPL5QmCLckNHjbRVBmJtaeHFh8+cUAvG
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="290730459"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; 
   d="scan'208";a="290730459"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2022 23:05:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="704763840"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; 
   d="scan'208";a="704763840"
Received: from lkp-server01.sh.intel.com (HELO 462403710aa9) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Nov 2022 23:05:31 -0800
Received: from kbuild by 462403710aa9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1orwCI-0000Po-1q;
	Mon, 07 Nov 2022 07:05:30 +0000
Date: Mon, 7 Nov 2022 15:04:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/drm_format_helper.c:150:38: warning: Parameter 'dst'
 can be declared as pointer to const [constParameter]
Message-ID: <202211071508.0TbCxRt4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/drm_format_helper.c:150:38: warning: Parameter 'dst' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Thomas Zimmermann <tzimmermann@suse.de>
CC: Sam Ravnborg <sam@ravnborg.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0c4d9fc9cc9462659728d168387191387e903cc
commit: edbe262acf92c986ad9a1f594ae3b4f3d3373133 drm/format-helper: Merge drm_fb_memcpy() and drm_fb_memcpy_toio()
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout edbe262acf92c986ad9a1f594ae3b4f3d3373133
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/drm_format_helper.c:150:38: warning: Parameter 'dst' can be declared as pointer to const [constParameter]
   void drm_fb_memcpy(struct iosys_map *dst, const unsigned int *dst_pitch,
                                        ^

vim +/dst +150 drivers/gpu/drm/drm_format_helper.c

cce6bedb38ed08 Thomas Zimmermann 2022-04-27  131  
7415287e1f3675 Gerd Hoffmann     2019-04-05  132  /**
7415287e1f3675 Gerd Hoffmann     2019-04-05  133   * drm_fb_memcpy - Copy clip buffer
edbe262acf92c9 Thomas Zimmermann 2022-08-08  134   * @dst: Array of destination buffers
edbe262acf92c9 Thomas Zimmermann 2022-08-08  135   * @dst_pitch: Array of numbers of bytes between the start of two consecutive scanlines
edbe262acf92c9 Thomas Zimmermann 2022-08-08  136   *             within @dst; can be NULL if scanlines are stored next to each other.
edbe262acf92c9 Thomas Zimmermann 2022-08-08  137   * @vmap: Array of source buffers
7415287e1f3675 Gerd Hoffmann     2019-04-05  138   * @fb: DRM framebuffer
7415287e1f3675 Gerd Hoffmann     2019-04-05  139   * @clip: Clip rectangle area to copy
26f024f54ab69a Gerd Hoffmann     2019-04-05  140   *
edbe262acf92c9 Thomas Zimmermann 2022-08-08  141   * This function copies parts of a framebuffer to display memory. Destination and
edbe262acf92c9 Thomas Zimmermann 2022-08-08  142   * framebuffer formats must match. No conversion takes place. The parameters @dst,
edbe262acf92c9 Thomas Zimmermann 2022-08-08  143   * @dst_pitch and @vmap refer to arrays. Each array must have at least as many entries
edbe262acf92c9 Thomas Zimmermann 2022-08-08  144   * as there are planes in @fb's format. Each entry stores the value for the format's
edbe262acf92c9 Thomas Zimmermann 2022-08-08  145   * respective color plane at the same index.
edbe262acf92c9 Thomas Zimmermann 2022-08-08  146   *
edbe262acf92c9 Thomas Zimmermann 2022-08-08  147   * This function does not apply clipping on @dst (i.e. the destination is at the
edbe262acf92c9 Thomas Zimmermann 2022-08-08  148   * top-left corner).
7415287e1f3675 Gerd Hoffmann     2019-04-05  149   */
edbe262acf92c9 Thomas Zimmermann 2022-08-08 @150  void drm_fb_memcpy(struct iosys_map *dst, const unsigned int *dst_pitch,
edbe262acf92c9 Thomas Zimmermann 2022-08-08  151  		   const struct iosys_map *vmap, const struct drm_framebuffer *fb,
edbe262acf92c9 Thomas Zimmermann 2022-08-08  152  		   const struct drm_rect *clip)
7415287e1f3675 Gerd Hoffmann     2019-04-05  153  {
edbe262acf92c9 Thomas Zimmermann 2022-08-08  154  	static const unsigned int default_dst_pitch[DRM_FORMAT_MAX_PLANES] = {
edbe262acf92c9 Thomas Zimmermann 2022-08-08  155  		0, 0, 0, 0
edbe262acf92c9 Thomas Zimmermann 2022-08-08  156  	};
7415287e1f3675 Gerd Hoffmann     2019-04-05  157  
edbe262acf92c9 Thomas Zimmermann 2022-08-08  158  	const struct drm_format_info *format = fb->format;
edbe262acf92c9 Thomas Zimmermann 2022-08-08  159  	unsigned int i, y, lines = drm_rect_height(clip);
27bd66dd6419c4 Thomas Zimmermann 2021-11-10  160  
edbe262acf92c9 Thomas Zimmermann 2022-08-08  161  	if (!dst_pitch)
edbe262acf92c9 Thomas Zimmermann 2022-08-08  162  		dst_pitch = default_dst_pitch;
7415287e1f3675 Gerd Hoffmann     2019-04-05  163  
edbe262acf92c9 Thomas Zimmermann 2022-08-08  164  	for (i = 0; i < format->num_planes; ++i) {
edbe262acf92c9 Thomas Zimmermann 2022-08-08  165  		unsigned int bpp_i = drm_format_info_bpp(format, i);
edbe262acf92c9 Thomas Zimmermann 2022-08-08  166  		unsigned int cpp_i = DIV_ROUND_UP(bpp_i, 8);
edbe262acf92c9 Thomas Zimmermann 2022-08-08  167  		size_t len_i = DIV_ROUND_UP(drm_rect_width(clip) * bpp_i, 8);
edbe262acf92c9 Thomas Zimmermann 2022-08-08  168  		unsigned int dst_pitch_i = dst_pitch[i];
edbe262acf92c9 Thomas Zimmermann 2022-08-08  169  		struct iosys_map dst_i = dst[i];
edbe262acf92c9 Thomas Zimmermann 2022-08-08  170  		struct iosys_map vmap_i = vmap[i];
26f024f54ab69a Gerd Hoffmann     2019-04-05  171  
edbe262acf92c9 Thomas Zimmermann 2022-08-08  172  		if (!dst_pitch_i)
edbe262acf92c9 Thomas Zimmermann 2022-08-08  173  			dst_pitch_i = len_i;
27bd66dd6419c4 Thomas Zimmermann 2021-11-10  174  
edbe262acf92c9 Thomas Zimmermann 2022-08-08  175  		iosys_map_incr(&vmap_i, clip_offset(clip, fb->pitches[i], cpp_i));
bf4f6d16c89466 Gerd Hoffmann     2019-04-10  176  		for (y = 0; y < lines; y++) {
edbe262acf92c9 Thomas Zimmermann 2022-08-08  177  			/* TODO: handle vmap_i in I/O memory here */
edbe262acf92c9 Thomas Zimmermann 2022-08-08  178  			iosys_map_memcpy_to(&dst_i, 0, vmap_i.vaddr, len_i);
edbe262acf92c9 Thomas Zimmermann 2022-08-08  179  			iosys_map_incr(&vmap_i, fb->pitches[i]);
edbe262acf92c9 Thomas Zimmermann 2022-08-08  180  			iosys_map_incr(&dst_i, dst_pitch_i);
bf4f6d16c89466 Gerd Hoffmann     2019-04-10  181  		}
26f024f54ab69a Gerd Hoffmann     2019-04-05  182  	}
edbe262acf92c9 Thomas Zimmermann 2022-08-08  183  }
edbe262acf92c9 Thomas Zimmermann 2022-08-08  184  EXPORT_SYMBOL(drm_fb_memcpy);
26f024f54ab69a Gerd Hoffmann     2019-04-05  185  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
