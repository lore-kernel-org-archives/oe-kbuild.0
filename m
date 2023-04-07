Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077057B
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Apr 2023 00:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680826291; x=1712362291;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JmlPtC05iNKqWFK4/Gzbo14vbjOl89gNMOnVAyB3Dmk=;
  b=fp+p/KcqfHewVDr7HieNAyDw381zwD2Zz+Diss9h9r2g2gXis4W/xdcE
   ziWrK0j1whyj2cnfnKv3Ri3izjIjpVYod84cjz02x3Txkze6uUsuQLFAO
   qduIN0vZMxmDQeIZ7piW5IoDcZUaaiKNi5UeBYG1XqovFMvxOCz5tHm6m
   8pse0cTlWjt/RKfowkNRmcWOqnEkY3SqErN1pwhJ4YCg7k320ZmTZQ5dx
   WdVVX5eYf9uFGk0pC4GF8ep/hKvgsaFfMoT6mjzxRe8ordhMXGt7vjNPq
   D85TxQT6w/NOr5WCWTmNjhEIT/53f3n4/gcrdel4ClnaKcfEYKk91TaTm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="429164969"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="429164969"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 17:11:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="664697714"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="664697714"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Apr 2023 17:11:18 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkZhG-000RvC-0D;
	Fri, 07 Apr 2023 00:11:18 +0000
Date: Fri, 7 Apr 2023 08:10:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] drm/vkms: add module parameter to set background color
Message-ID: <202304070814.lkxMsg96-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/vkms/vkms_composer.c:93:62: sparse: sparse: shift too big (32) for type unsigned long"
:::::: 

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
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: i386-randconfig-s001-20230403 (https://download.01.org/0day-ci/archive/20230407/202304070814.lkxMsg96-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/d725068207852d3b6a0dd795bf224422804101e1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ma-ra-Canal/drm-vkms-add-module-parameter-to-set-background-color/20230407-012233
        git checkout d725068207852d3b6a0dd795bf224422804101e1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/vkms/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304070814.lkxMsg96-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/vkms/vkms_composer.c:93:62: sparse: sparse: shift too big (32) for type unsigned long

vim +93 drivers/gpu/drm/vkms/vkms_composer.c

bc0d7fdefec62e0 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   70  
32a1648aca44090 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2021-04-24   71  /**
8ba1648567e289c drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   72   * @wb_frame_info: The writeback frame buffer metadata
8ba1648567e289c drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   73   * @crtc_state: The crtc state
8ba1648567e289c drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   74   * @crc32: The crc output of the final frame
8ba1648567e289c drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   75   * @output_buffer: A buffer of a row that will receive the result of the blend(s)
8ba1648567e289c drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   76   * @stage_buffer: The line with the pixels from plane being blend to the output
32a1648aca44090 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2021-04-24   77   *
8ba1648567e289c drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   78   * This function blends the pixels (Using the `pre_mul_alpha_blend`)
8ba1648567e289c drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   79   * from all planes, calculates the crc32 of the output from the former step,
8ba1648567e289c drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   80   * and, if necessary, convert and store the output to the writeback buffer.
32a1648aca44090 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2021-04-24   81   */
d725068207852d3 drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06   82  static void blend(struct vkms_device *vkms_dev,
d725068207852d3 drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06   83  		  struct vkms_writeback_job *wb,
8ba1648567e289c drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   84  		  struct vkms_crtc_state *crtc_state,
8ba1648567e289c drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   85  		  u32 *crc32, struct line_buffer *stage_buffer,
8ba1648567e289c drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   86  		  struct line_buffer *output_buffer, size_t row_size)
39cba5cf8c2c23c drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2020-08-25   87  {
8ba1648567e289c drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   88  	struct vkms_plane_state **plane = crtc_state->active_planes;
8ba1648567e289c drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   89  	u32 n_active_planes = crtc_state->num_active_planes;
39cba5cf8c2c23c drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2020-08-25   90  
d725068207852d3 drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06   91  	const struct pixel_argb_u16 background_color = {
d725068207852d3 drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06   92  		.a =  0xffff,
d725068207852d3 drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06  @93  		.r = (*vkms_dev->config->background_color >> 32) & 0xffff,
d725068207852d3 drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06   94  		.g = (*vkms_dev->config->background_color >> 16) & 0xffff,
d725068207852d3 drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06   95  		.b = *vkms_dev->config->background_color & 0xffff,
d725068207852d3 drivers/gpu/drm/vkms/vkms_composer.c Maíra Canal     2023-04-06   96  	};
32a1648aca44090 drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2021-04-24   97  
bc0d7fdefec62e0 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05   98  	size_t crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
39cba5cf8c2c23c drivers/gpu/drm/vkms/vkms_composer.c Melissa Wen     2020-08-25   99  
bc0d7fdefec62e0 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  100  	for (size_t y = 0; y < crtc_y_limit; y++) {
bc0d7fdefec62e0 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  101  		fill_background(&background_color, output_buffer);
bc0d7fdefec62e0 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  102  
bc0d7fdefec62e0 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  103  		/* The active planes are composed associatively in z-order. */
bc0d7fdefec62e0 drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  104  		for (size_t i = 0; i < n_active_planes; i++) {
8ba1648567e289c drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  105  			if (!check_y_limit(plane[i]->frame_info, y))
8ba1648567e289c drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  106  				continue;
8ba1648567e289c drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  107  
8ba1648567e289c drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  108  			plane[i]->plane_read(stage_buffer, plane[i]->frame_info, y);
8ba1648567e289c drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  109  			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
8ba1648567e289c drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  110  					    output_buffer);
db7f419c06d7cce drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed 2018-09-06  111  		}
8ba1648567e289c drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  112  
8ba1648567e289c drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  113  		*crc32 = crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
8ba1648567e289c drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  114  
8ba1648567e289c drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  115  		if (wb)
8ba1648567e289c drivers/gpu/drm/vkms/vkms_composer.c Igor Torrente   2022-09-05  116  			wb->wb_write(&wb->wb_frame_info, output_buffer, y);
db7f419c06d7cce drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed 2018-09-06  117  	}
db7f419c06d7cce drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed 2018-09-06  118  }
db7f419c06d7cce drivers/gpu/drm/vkms/vkms_crc.c      Haneen Mohammed 2018-09-06  119  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
