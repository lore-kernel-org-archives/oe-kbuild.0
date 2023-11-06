Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9BB199B7
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 12:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JfZCf9W2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699272147; x=1730808147;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wTEFV3y7W09FiXhK+fUXkmzHKN+JB+ZuCl7a5fAeLdk=;
  b=JfZCf9W2jV/Wg4lOua7w05EhOsR12XlCapr4PDckHhO2zjqOKH6fLAlw
   rwy9Sd5Cg20X6XiiaoNKDmDHWKQLmBHcMJrb+UoF61fZ2ta9Q1W1elTlt
   GGEf5Ztgqx6+W2aex8Vd/mt493xwI5/hNtym4f4m1SsJanuVSVEr0dSFb
   g2q63s90G5UBw47nz6B2jnLqyykwRiyEXXEX15wtHjBiSZACS333xpLup
   58MWG1R5aCk/xWihYtpPterigT5lOSRQwhKqGOxs1bEIW0kH4wNrzGI0A
   L9YwZln0hxIsxrYY0ytyQS5i+mI8rh7wqz4oQd1grKlJZLC868xtesln9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="392128209"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="392128209"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 04:02:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="755829735"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="755829735"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 Nov 2023 04:02:25 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzyJC-0006Nv-2M;
	Mon, 06 Nov 2023 12:02:22 +0000
Date: Mon, 6 Nov 2023 20:01:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/vkms/vkms_composer.c:120 blend() error:
 uninitialized symbol 'y_pos'.
Message-ID: <202311061956.03UtCLsE-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Maíra Canal" <mcanal@igalia.com>
CC: Melissa Wen <mwen@igalia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2f51b3516dade79269ff45eae2a7668ae711b25
commit: 1ce76fae2bc14dd776b0c237456d8bd117c0e617 drm/vkms: add reflect-y and rotate-180 property
date:   6 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231106/202311061956.03UtCLsE-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311061956.03UtCLsE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311061956.03UtCLsE-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
