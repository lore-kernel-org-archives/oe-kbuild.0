Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C0019918
	for <oe-kbuild@lists.linux.dev>; Tue,  9 May 2023 21:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683669303; x=1715205303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eWYbEPr8mfgxw75M3YO3sCPcseO1sT+04Gv36+Bla6I=;
  b=VEvgdbpF2Rik4w65eVFlYrI6Edpv7ARKfhIVxP6iRzxc0GVM7J8v1B+h
   pVuRrfVBypQDa6GaGkPxes4tMpzmsDYOEImjzJgW1QbA8O9C/F//9srvV
   /aA+5iqnnUXN/y1OObv5TEYk89YNbiTASpmIAadfA54+09DURyilxvSPC
   pRpTAnTeGZN55U8ZInW6xpOr9cam7cUoU8Ql+w++ixh+aM2gikJ+P6yUK
   yBjTXaogsu6m8eI1eWEiMkpgG8S8GOosqR/QHhTsIEefJKlYNkya1DsFm
   EQGx37s1EkaSE0Dx0geEF10uZ8CfAFzkzUO4cXyPVOmrSNrP767osF1XU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="347524689"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="347524689"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 14:54:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="873344151"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="873344151"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 09 May 2023 14:54:52 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwVIK-0002Xs-0a;
	Tue, 09 May 2023 21:54:52 +0000
Date: Wed, 10 May 2023 05:54:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 4/4] drm/mgag200: Use DMA to copy the framebuffer to the
 VRAM
Message-ID: <202305100554.Q6f2fDlx-lkp@intel.com>
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
In-Reply-To: <20230505124337.854845-5-jfalempe@redhat.com>
References: <20230505124337.854845-5-jfalempe@redhat.com>
TO: Jocelyn Falempe <jfalempe@redhat.com>
TO: dri-devel@lists.freedesktop.org
TO: tzimmermann@suse.de
TO: airlied@redhat.com
TO: javierm@redhat.com
TO: lyude@redhat.com
CC: Jocelyn Falempe <jfalempe@redhat.com>

Hi Jocelyn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 457391b0380335d5e9a5babdec90ac53928b23b4]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-mgag200-Rename-constant-MGAREG_Status-to-MGAREG_STATUS/20230505-204705
base:   457391b0380335d5e9a5babdec90ac53928b23b4
patch link:    https://lore.kernel.org/r/20230505124337.854845-5-jfalempe%40redhat.com
patch subject: [PATCH 4/4] drm/mgag200: Use DMA to copy the framebuffer to the VRAM
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230510/202305100554.Q6f2fDlx-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305100554.Q6f2fDlx-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/mgag200/mgag200_mode.c:419 mgag200_dwg_setup() error: uninitialized symbol 'maccess'.

vim +/maccess +419 drivers/gpu/drm/mgag200/mgag200_mode.c

414c453106255b Dave Airlie     2012-04-17  400  
b3cab0043427ad Jocelyn Falempe 2023-05-05  401  static void mgag200_dwg_setup(struct mga_device *mdev, struct drm_framebuffer *fb)
b3cab0043427ad Jocelyn Falempe 2023-05-05  402  {
b3cab0043427ad Jocelyn Falempe 2023-05-05  403  	u32 maccess;
b3cab0043427ad Jocelyn Falempe 2023-05-05  404  
b3cab0043427ad Jocelyn Falempe 2023-05-05  405  	drm_dbg(&mdev->base, "Setup DWG with %dx%d %p4cc\n",
b3cab0043427ad Jocelyn Falempe 2023-05-05  406  		fb->width, fb->height, &fb->format->format);
b3cab0043427ad Jocelyn Falempe 2023-05-05  407  
b3cab0043427ad Jocelyn Falempe 2023-05-05  408  	switch (fb->format->format) {
b3cab0043427ad Jocelyn Falempe 2023-05-05  409  	case DRM_FORMAT_RGB565:
b3cab0043427ad Jocelyn Falempe 2023-05-05  410  		maccess = MGAMAC_PW16;
b3cab0043427ad Jocelyn Falempe 2023-05-05  411  		break;
b3cab0043427ad Jocelyn Falempe 2023-05-05  412  	case DRM_FORMAT_RGB888:
b3cab0043427ad Jocelyn Falempe 2023-05-05  413  		maccess = MGAMAC_PW24;
b3cab0043427ad Jocelyn Falempe 2023-05-05  414  		break;
b3cab0043427ad Jocelyn Falempe 2023-05-05  415  	case DRM_FORMAT_XRGB8888:
b3cab0043427ad Jocelyn Falempe 2023-05-05  416  		maccess = MGAMAC_PW32;
b3cab0043427ad Jocelyn Falempe 2023-05-05  417  		break;
b3cab0043427ad Jocelyn Falempe 2023-05-05  418  	}
b3cab0043427ad Jocelyn Falempe 2023-05-05 @419  	WREG32(MGAREG_MACCESS, maccess);
b3cab0043427ad Jocelyn Falempe 2023-05-05  420  
b3cab0043427ad Jocelyn Falempe 2023-05-05  421  	/* Framebuffer width in pixel */
b3cab0043427ad Jocelyn Falempe 2023-05-05  422  	WREG32(MGAREG_PITCH, fb->width);
b3cab0043427ad Jocelyn Falempe 2023-05-05  423  
b3cab0043427ad Jocelyn Falempe 2023-05-05  424  	/* Sane default value for the drawing engine registers */
b3cab0043427ad Jocelyn Falempe 2023-05-05  425  	WREG32(MGAREG_DSTORG, 0);
b3cab0043427ad Jocelyn Falempe 2023-05-05  426  	WREG32(MGAREG_YDSTORG, 0);
b3cab0043427ad Jocelyn Falempe 2023-05-05  427  	WREG32(MGAREG_SRCORG, 0);
b3cab0043427ad Jocelyn Falempe 2023-05-05  428  	WREG32(MGAREG_CXBNDRY, 0x0FFF0000);
b3cab0043427ad Jocelyn Falempe 2023-05-05  429  	WREG32(MGAREG_YTOP, 0);
b3cab0043427ad Jocelyn Falempe 2023-05-05  430  	WREG32(MGAREG_YBOT, 0x00FFFFFF);
b3cab0043427ad Jocelyn Falempe 2023-05-05  431  
b3cab0043427ad Jocelyn Falempe 2023-05-05  432  	/* Activate blit mode DMA, only write the low part of the register */
b3cab0043427ad Jocelyn Falempe 2023-05-05  433  	WREG8(MGAREG_OPMODE, MGAOPM_DMA_BLIT);
b3cab0043427ad Jocelyn Falempe 2023-05-05  434  }
b3cab0043427ad Jocelyn Falempe 2023-05-05  435  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
