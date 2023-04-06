Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1F52F3A
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Apr 2023 22:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680821359; x=1712357359;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Dyo7NU3Qe4D1oy3pCLnOm2thUQbcO3c1cYQDbWqikyg=;
  b=QTlw59hIFFkhMyIqVOR01pMGsB1IKFx3iYNr6mGsIwHJw/jazYPJnhn7
   L4aJS2i63Xcbx4MvHYEuya+t1pwOhfat/lIlUOpzRDjezoJ2FN6Nc4rwl
   ax9IaikmpM9c1X4F4LgSlSmjK4edKwQrl1dfF8REIbVLXO+zGDdF8VW1v
   U0WbT0Eik66uEgfcZG7c2VZqaP+82xFIsGq13BXM73C5au5wd6GrzjRD4
   iFknyQ88INls2EqGekOHcMZTvqdmeEy/e+S42FbaJXKQfn5A8TgNOV0Sw
   ObKyPpROwBYByBzCj3VwXaQyycRnRLyE38JNDPWWG019fJRuR+o4WgY5R
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="323234356"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="323234356"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 15:49:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="689854399"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="689854399"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 Apr 2023 15:49:17 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkYPs-000Rss-2L;
	Thu, 06 Apr 2023 22:49:16 +0000
Date: Fri, 7 Apr 2023 06:48:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/6] drm/vkms: add rotate-0 and rotate-180 properties
Message-ID: <202304070608.Pq53jjZ9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230406130138.70752-2-mcanal@igalia.com>
References: <20230406130138.70752-2-mcanal@igalia.com>
TO: "Maíra Canal" <mcanal@igalia.com>
TO: David Airlie <airlied@gmail.com>
TO: Daniel Vetter <daniel@ffwll.ch>
TO: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
TO: Melissa Wen <mwen@igalia.com>
TO: Haneen Mohammed <hamohammed.sa@gmail.com>
CC: "Maíra Canal" <mcanal@igalia.com>
CC: dri-devel@lists.freedesktop.org

Hi Maíra,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ma-ra-Canal/drm-vkms-add-rotate-0-and-rotate-180-properties/20230406-213126
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230406130138.70752-2-mcanal%40igalia.com
patch subject: [PATCH 1/6] drm/vkms: add rotate-0 and rotate-180 properties
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230407/202304070608.Pq53jjZ9-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304070608.Pq53jjZ9-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/vkms/vkms_composer.c:139 blend() error: uninitialized symbol 'y_pos'.

vim +/y_pos +139 drivers/gpu/drm/vkms/vkms_composer.c

bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   96  
32a1648aca4409 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2021-04-24   97  /**
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   98   * @wb_frame_info: The writeback frame buffer metadata
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   99   * @crtc_state: The crtc state
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  100   * @crc32: The crc output of the final frame
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  101   * @output_buffer: A buffer of a row that will receive the result of the blend(s)
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  102   * @stage_buffer: The line with the pixels from plane being blend to the output
32a1648aca4409 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2021-04-24  103   *
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  104   * This function blends the pixels (Using the `pre_mul_alpha_blend`)
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  105   * from all planes, calculates the crc32 of the output from the former step,
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  106   * and, if necessary, convert and store the output to the writeback buffer.
32a1648aca4409 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2021-04-24  107   */
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  108  static void blend(struct vkms_writeback_job *wb,
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  109  		  struct vkms_crtc_state *crtc_state,
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  110  		  u32 *crc32, struct line_buffer *stage_buffer,
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  111  		  struct line_buffer *output_buffer, size_t row_size)
39cba5cf8c2c23 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2020-08-25  112  {
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  113  	struct vkms_plane_state **plane = crtc_state->active_planes;
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  114  	u32 n_active_planes = crtc_state->num_active_planes;
0e60cb8ca9ac9d drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06  115  	int y_pos;
39cba5cf8c2c23 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2020-08-25  116  
bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  117  	const struct pixel_argb_u16 background_color = { .a = 0xffff };
32a1648aca4409 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2021-04-24  118  
bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  119  	size_t crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
39cba5cf8c2c23 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2020-08-25  120  
bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  121  	for (size_t y = 0; y < crtc_y_limit; y++) {
bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  122  		fill_background(&background_color, output_buffer);
bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  123  
bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  124  		/* The active planes are composed associatively in z-order. */
bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  125  		for (size_t i = 0; i < n_active_planes; i++) {
0e60cb8ca9ac9d drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06  126  			y_pos = get_y_pos(plane[i]->frame_info, y);
0e60cb8ca9ac9d drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06  127  
0e60cb8ca9ac9d drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06  128  			if (!check_y_limit(plane[i]->frame_info, y_pos))
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  129  				continue;
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  130  
0e60cb8ca9ac9d drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06  131  			plane[i]->plane_read(stage_buffer, plane[i]->frame_info, y_pos);
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  132  			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  133  					    output_buffer);
db7f419c06d7cc drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed 2018-09-06  134  		}
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  135  
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  136  		*crc32 = crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  137  
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  138  		if (wb)
0e60cb8ca9ac9d drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06 @139  			wb->wb_write(&wb->wb_frame_info, output_buffer, y_pos);
db7f419c06d7cc drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed 2018-09-06  140  	}
db7f419c06d7cc drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed 2018-09-06  141  }
db7f419c06d7cc drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed 2018-09-06  142  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
