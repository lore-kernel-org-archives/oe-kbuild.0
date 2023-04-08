Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECC41841
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Apr 2023 12:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680956510; x=1712492510;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wCzrGUfsom9ztq7rszGHZAqxf3xJOsSM+N4WLlJlXoc=;
  b=nUc21Rw6sCjH1Pno6NJNW7csVdHSwkzChUXoarAozoFe0Ji5w1fA7Qje
   UcuJw1zq3SFh1378xRD45i1noiAy6Hk6yOgm8esDaGhXzpNj4/Z98ZNr3
   PoAOP6cdOtZxjR44cMMOPcqwgEi1iSyEHXmQPyiTv2YxXY44L5inK6s86
   vJl0EbYp4xlg4sE/6nCAYX/ZF53RfBlwIYxZaaQCOdupKADPPTHubjioS
   r0DaxKR1naUMWf1ONVwXSLbVV4nD1vDaodHRLYArPz4MTrGggmFn2Euxr
   61erV3EhbuWbd6kP9cJbejBAQ3X+LXuq1r4AhFCX96Uzn4r+amoafIyU9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="322769825"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="322769825"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2023 05:21:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="681274317"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="681274317"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 08 Apr 2023 05:21:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pl7Zj-000TiR-20;
	Sat, 08 Apr 2023 12:21:47 +0000
Date: Sat, 8 Apr 2023 20:20:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] drm/vkms: add module parameter to set background color
Message-ID: <202304082018.PXAwWhse-lkp@intel.com>
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
In-Reply-To: <20230406172002.124456-1-mcanal@igalia.com>
References: <20230406172002.124456-1-mcanal@igalia.com>
TO: "Maíra Canal" <mcanal@igalia.com>
TO: David Airlie <airlied@gmail.com>
TO: Daniel Vetter <daniel@ffwll.ch>
TO: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
TO: Melissa Wen <mwen@igalia.com>
TO: Haneen Mohammed <hamohammed.sa@gmail.com>
TO: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
CC: "Maíra Canal" <mcanal@igalia.com>
CC: dri-devel@lists.freedesktop.org

Hi Maíra,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ma-ra-Canal/drm-vkms-add-module-parameter-to-set-background-color/20230407-012233
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230406172002.124456-1-mcanal%40igalia.com
patch subject: [PATCH] drm/vkms: add module parameter to set background color
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-m031-20230403 (https://download.01.org/0day-ci/archive/20230408/202304082018.PXAwWhse-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304082018.PXAwWhse-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/vkms/vkms_composer.c:93 blend() warn: right shifting more than type allows 32 vs 32

vim +93 drivers/gpu/drm/vkms/vkms_composer.c

bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   70  
32a1648aca4409 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2021-04-24   71  /**
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   72   * @wb_frame_info: The writeback frame buffer metadata
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   73   * @crtc_state: The crtc state
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   74   * @crc32: The crc output of the final frame
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   75   * @output_buffer: A buffer of a row that will receive the result of the blend(s)
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   76   * @stage_buffer: The line with the pixels from plane being blend to the output
32a1648aca4409 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2021-04-24   77   *
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   78   * This function blends the pixels (Using the `pre_mul_alpha_blend`)
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   79   * from all planes, calculates the crc32 of the output from the former step,
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   80   * and, if necessary, convert and store the output to the writeback buffer.
32a1648aca4409 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2021-04-24   81   */
d725068207852d drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06   82  static void blend(struct vkms_device *vkms_dev,
d725068207852d drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06   83  		  struct vkms_writeback_job *wb,
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   84  		  struct vkms_crtc_state *crtc_state,
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   85  		  u32 *crc32, struct line_buffer *stage_buffer,
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   86  		  struct line_buffer *output_buffer, size_t row_size)
39cba5cf8c2c23 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2020-08-25   87  {
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   88  	struct vkms_plane_state **plane = crtc_state->active_planes;
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   89  	u32 n_active_planes = crtc_state->num_active_planes;
39cba5cf8c2c23 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2020-08-25   90  
d725068207852d drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06   91  	const struct pixel_argb_u16 background_color = {
d725068207852d drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06   92  		.a =  0xffff,
d725068207852d drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06  @93  		.r = (*vkms_dev->config->background_color >> 32) & 0xffff,
d725068207852d drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06   94  		.g = (*vkms_dev->config->background_color >> 16) & 0xffff,
d725068207852d drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06   95  		.b = *vkms_dev->config->background_color & 0xffff,
d725068207852d drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06   96  	};
32a1648aca4409 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2021-04-24   97  
bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   98  	size_t crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
39cba5cf8c2c23 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2020-08-25   99  
bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  100  	for (size_t y = 0; y < crtc_y_limit; y++) {
bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  101  		fill_background(&background_color, output_buffer);
bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  102  
bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  103  		/* The active planes are composed associatively in z-order. */
bc0d7fdefec62e drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  104  		for (size_t i = 0; i < n_active_planes; i++) {
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  105  			if (!check_y_limit(plane[i]->frame_info, y))
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  106  				continue;
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  107  
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  108  			plane[i]->plane_read(stage_buffer, plane[i]->frame_info, y);
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  109  			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  110  					    output_buffer);
db7f419c06d7cc drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed 2018-09-06  111  		}
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  112  
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  113  		*crc32 = crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  114  
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  115  		if (wb)
8ba1648567e289 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  116  			wb->wb_write(&wb->wb_frame_info, output_buffer, y);
db7f419c06d7cc drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed 2018-09-06  117  	}
db7f419c06d7cc drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed 2018-09-06  118  }
db7f419c06d7cc drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed 2018-09-06  119  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
