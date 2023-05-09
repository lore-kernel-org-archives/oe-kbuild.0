Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B9719903
	for <oe-kbuild@lists.linux.dev>; Tue,  9 May 2023 20:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683664912; x=1715200912;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CWtsPg98P8uPiJxyX9fW0EvRpNnACHRHEZCGT0RixQM=;
  b=ELnoOEq4Sr2ydXu9kp3Fkt7SCBTUDGoy/4RjlD+RmjXe/KTpUV4LpsUi
   UZ+1aoAJ+xu2LkpwnEa1RZ6ZiNbRM/h+UXQfB8i6xwNxjEMnhr4g8kHma
   RgepkaMNxsNPWlL1N+ElX87C8jEvPfOZrisD/d674O48IpCsQ53xt7xW/
   /JRjuF7uY99gXHuN8viTqTnJFr/nfySpmiGuxxLwKOskEMZLSyykld7Et
   wwtFGBBsPQuGzjFOpbzoS5f+8Y1OPdtCxTwFENnCrlkhzY5/n+6E2QZVR
   dBsxl47+85+5xztdIblCuvvjUOsTdIlesOm826ZSfiF2RqfeplWbGVDTr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="350079711"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="350079711"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 13:41:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="649484627"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="649484627"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 May 2023 13:41:48 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwU9b-0002Tm-3C;
	Tue, 09 May 2023 20:41:47 +0000
Date: Wed, 10 May 2023 04:41:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [drm-misc:drm-misc-next 2/5]
 drivers/gpu/drm/vkms/vkms_composer.c:120 blend() error: uninitialized symbol
 'y_pos'.
Message-ID: <202305100429.0cmOp7M6-lkp@intel.com>
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
CC: dri-devel@lists.freedesktop.org
TO: "Maíra Canal" <mcanal@igalia.com>
CC: Melissa Wen <mwen@igalia.com>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   ff32fcca64437f679a2bf1c0a19d5def389a18e2
commit: 1ce76fae2bc14dd776b0c237456d8bd117c0e617 [2/5] drm/vkms: add reflect-y and rotate-180 property
:::::: branch date: 8 hours ago
:::::: commit date: 32 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230510/202305100429.0cmOp7M6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305100429.0cmOp7M6-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/vkms/vkms_composer.c:120 blend() error: uninitialized symbol 'y_pos'.

vim +/y_pos +120 drivers/gpu/drm/vkms/vkms_composer.c

bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   77  
32a1648aca4409 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2021-04-24   78  /**
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   79   * @wb_frame_info: The writeback frame buffer metadata
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   80   * @crtc_state: The crtc state
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   81   * @crc32: The crc output of the final frame
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   82   * @output_buffer: A buffer of a row that will receive the result of the blend(s)
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   83   * @stage_buffer: The line with the pixels from plane being blend to the output
32a1648aca4409 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2021-04-24   84   *
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   85   * This function blends the pixels (Using the `pre_mul_alpha_blend`)
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   86   * from all planes, calculates the crc32 of the output from the former step,
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   87   * and, if necessary, convert and store the output to the writeback buffer.
32a1648aca4409 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2021-04-24   88   */
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   89  static void blend(struct vkms_writeback_job *wb,
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   90  		  struct vkms_crtc_state *crtc_state,
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   91  		  u32 *crc32, struct line_buffer *stage_buffer,
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   92  		  struct line_buffer *output_buffer, size_t row_size)
39cba5cf8c2c23 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2020-08-25   93  {
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   94  	struct vkms_plane_state **plane = crtc_state->active_planes;
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   95  	u32 n_active_planes = crtc_state->num_active_planes;
1ce76fae2bc14d drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-18   96  	int y_pos;
39cba5cf8c2c23 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2020-08-25   97  
bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   98  	const struct pixel_argb_u16 background_color = { .a = 0xffff };
32a1648aca4409 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2021-04-24   99  
bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  100  	size_t crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
39cba5cf8c2c23 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2020-08-25  101  
bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  102  	for (size_t y = 0; y < crtc_y_limit; y++) {
bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  103  		fill_background(&background_color, output_buffer);
bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  104  
bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  105  		/* The active planes are composed associatively in z-order. */
bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  106  		for (size_t i = 0; i < n_active_planes; i++) {
1ce76fae2bc14d drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-18  107  			y_pos = get_y_pos(plane[i]->frame_info, y);
1ce76fae2bc14d drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-18  108  
1ce76fae2bc14d drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-18  109  			if (!check_y_limit(plane[i]->frame_info, y_pos))
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  110  				continue;
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  111  
1ce76fae2bc14d drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-18  112  			vkms_compose_row(stage_buffer, plane[i], y_pos);
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  113  			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  114  					    output_buffer);
db7f419c06d7cc drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed 2018-09-06  115  		}
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  116  
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  117  		*crc32 = crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  118  
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  119  		if (wb)
1ce76fae2bc14d drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-18 @120  			wb->wb_write(&wb->wb_frame_info, output_buffer, y_pos);
db7f419c06d7cc drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed 2018-09-06  121  	}
db7f419c06d7cc drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed 2018-09-06  122  }
db7f419c06d7cc drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed 2018-09-06  123  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
