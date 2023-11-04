Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94EA3D78
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Nov 2023 03:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BC6in/km"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699068582; x=1730604582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GAajlvPyITAG2M+cZ8+imeu9l7Q81SCTmpCMbYW/FNg=;
  b=BC6in/km7Q2lKh+Fqu5JesgPlfyu99fmAF9rzXk/z7IC3VoIbmf99fdU
   /QJ1p9IX29epyFR9+dh1naB3iQoFur8ynDkwx11sATNdMYfykMRPIevwc
   /BhjjxuqG5Ua5yGHGS+gdfuYsXbYXL5+nex803C6ewuE3XvcditLA/e6C
   h8e2tOMfezt33X+wHWqntHQkMKNpQYJ3vubjMEha00WkXwI4duzCrejVU
   qvC720zrUWENgoQSWbeMO7wRlBwxBHcPglDL60yG9AKPB/3qGaDhihAh9
   DiYIjdJ4hvxNp6ItPVrqcQWm0/EzVW274UfIKoO4uWN8wXXC+hGr5tduq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1939520"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="1939520"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 20:29:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="832205382"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="832205382"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 03 Nov 2023 20:29:37 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz7Lq-0003Li-39;
	Sat, 04 Nov 2023 03:29:34 +0000
Date: Sat, 4 Nov 2023 11:28:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:458
 s6d7aa0_get_modes() warn: can 'ctx' even be NULL?
Message-ID: <202311041101.R8zFVG9t-lkp@intel.com>
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
head:   2c40c1c6adab90ee4660caf03722b3a3ec67767b
commit: 6a038f0183dd5d3e289f6c1fe6962de9b31f8fd2 drm/panel: samsung-s6d7aa0: use pointer for drm_mode in panel desc struct
date:   5 months ago
:::::: branch date: 86 minutes ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231104/202311041101.R8zFVG9t-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231104/202311041101.R8zFVG9t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311041101.R8zFVG9t-lkp@intel.com/

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
6a038f0183dd5d Artur Weber 2023-05-24  461  	mode = drm_mode_duplicate(connector->dev, ctx->desc->drm_mode);
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

:::::: The code at line 458 was first introduced by commit
:::::: 6810bb390282bb75801832f31d088236503fee89 drm/panel: Add Samsung S6D7AA0 panel controller driver

:::::: TO: Artur Weber <aweber.kernel@gmail.com>
:::::: CC: Neil Armstrong <neil.armstrong@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
