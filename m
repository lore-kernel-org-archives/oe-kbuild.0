Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6E11114
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Jul 2023 01:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689472634; x=1721008634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6J4G7TjVYBQGXtV0xA3BeBCJEZtI+U1LwZeYy793D4E=;
  b=Z9RbswzMLND6ATN9qaXUrh4qTT36zJfABVmD/RJdz524GdHgdEDZf7Eo
   4Ggv4Vimsely1BmgLhdK34MMXnMgL5X8+QI6U0XXGHmyay+QyUPEyoLnz
   651njBxZ+N0DBxoPK0Af3bn3cLDDEi6u043LvBfF0GdSt3//Af13vXXNL
   cm8hy/RvbCDp+3WB/sI035wwnMBVFqrdcnPx6Jrv/0MeitvwJc9jAPfC2
   4Q6ymn1MJWAdEAg2Thhxdy4nNt3xGNR2qoxcJqDdcUwOQ5lUcnt5NrJ3c
   TPO4Jd/GxBYMyEpmMak6sl6Fz3tlTKmZfOLpy2Wc/z17hoxkipjcWhZZu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="452095648"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="452095648"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 18:57:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="752471093"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="752471093"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 15 Jul 2023 18:57:09 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKr0W-0008Sb-2k;
	Sun, 16 Jul 2023 01:57:08 +0000
Date: Sun, 16 Jul 2023 09:56:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:458
 s6d7aa0_get_modes() warn: can 'ctx' even be NULL?
Message-ID: <202307160903.gO8Yr4Sb-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Artur Weber <aweber.kernel@gmail.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   831fe284d8275987596b7d640518dddba5735f61
commit: 6810bb390282bb75801832f31d088236503fee89 drm/panel: Add Samsung S6D7AA0 panel controller driver
date:   8 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 8 weeks ago
config: x86_64-randconfig-m001-20230716 (https://download.01.org/0day-ci/archive/20230716/202307160903.gO8Yr4Sb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307160903.gO8Yr4Sb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307160903.gO8Yr4Sb-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:458 s6d7aa0_get_modes() warn: can 'ctx' even be NULL?

vim +/ctx +458 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c

6810bb390282bb Artur Weber 2023-05-19  450  
6810bb390282bb Artur Weber 2023-05-19  451  static int s6d7aa0_get_modes(struct drm_panel *panel,
6810bb390282bb Artur Weber 2023-05-19  452  					struct drm_connector *connector)
6810bb390282bb Artur Weber 2023-05-19  453  {
6810bb390282bb Artur Weber 2023-05-19  454  	struct drm_display_mode *mode;
6810bb390282bb Artur Weber 2023-05-19  455  	struct s6d7aa0 *ctx;
6810bb390282bb Artur Weber 2023-05-19  456  
6810bb390282bb Artur Weber 2023-05-19  457  	ctx = container_of(panel, struct s6d7aa0, panel);
6810bb390282bb Artur Weber 2023-05-19 @458  	if (!ctx)
6810bb390282bb Artur Weber 2023-05-19  459  		return -EINVAL;
6810bb390282bb Artur Weber 2023-05-19  460  
6810bb390282bb Artur Weber 2023-05-19  461  	mode = drm_mode_duplicate(connector->dev, &ctx->desc->drm_mode);
6810bb390282bb Artur Weber 2023-05-19  462  	if (!mode)
6810bb390282bb Artur Weber 2023-05-19  463  		return -ENOMEM;
6810bb390282bb Artur Weber 2023-05-19  464  
6810bb390282bb Artur Weber 2023-05-19  465  	drm_mode_set_name(mode);
6810bb390282bb Artur Weber 2023-05-19  466  
6810bb390282bb Artur Weber 2023-05-19  467  	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
6810bb390282bb Artur Weber 2023-05-19  468  	connector->display_info.width_mm = mode->width_mm;
6810bb390282bb Artur Weber 2023-05-19  469  	connector->display_info.height_mm = mode->height_mm;
6810bb390282bb Artur Weber 2023-05-19  470  	connector->display_info.bus_flags = ctx->desc->bus_flags;
6810bb390282bb Artur Weber 2023-05-19  471  	drm_mode_probed_add(connector, mode);
6810bb390282bb Artur Weber 2023-05-19  472  
6810bb390282bb Artur Weber 2023-05-19  473  	return 1;
6810bb390282bb Artur Weber 2023-05-19  474  }
6810bb390282bb Artur Weber 2023-05-19  475  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
