Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB60713D8A8
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Jun 2024 07:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719386224; cv=none; b=eOQBaSsUby5j69ZD7LJ/HUKe5ASx5CE4a3K1A+bdC3DFPofG1UPDs2BuUaBQgZus0olzGbBQLIS6ROQYPBS531wAeUCu2EzRE/aHF4QYLJVfBqnDEKjQm717Q/XxjubpCFlM1wARkmxGKsO2+Wl3hbvMQyNjMabDL2ZLm2SDSjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719386224; c=relaxed/simple;
	bh=SL+moepN0WGDD2H+5t4qj0u5jFJ3PvOsUsXY9dm4igQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cAfTnlWt3zxnBfvxn+XE78byjFD4SVsLoC3yQwzWgiCKxF6ZynIRGIUO7GYX6zmwMMYfegycvWH9QQWmLyr6n9NaDjuSNokHtniMeKhZu5spmnC1VF/AaztISDhh78YSMyGcAig1tRrizbqqtmOodtA6lbxPKYdjoX4UeRxSadY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EcRH/ErL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EcRH/ErL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719386223; x=1750922223;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SL+moepN0WGDD2H+5t4qj0u5jFJ3PvOsUsXY9dm4igQ=;
  b=EcRH/ErLppHzoKZUHfiHgDz+yU1AoqQK+e7gy6BKmJQCXGdqS8KvrOb0
   Kb8+BGwZrZgfox/8e6kP6fEaUOcjXfYZfW3bfy+7swvfgo+Y2O3ziJr2G
   UQCyyCd/a3Rc+anQAPub+74OUo7kmwXK51+oVLj3rBVOnbV8Rei28UxCO
   x2fCYHp/h08uKrDTzZi7NTrdNEKMrVDh7ouXi1NGV9e34PPNP6nZVJRIz
   NfaPNAdgv3bMyH2DojA4aUbb4wAnywrIoRRwgorZS/+QH5omlF/T/iWs6
   KEYItvSfVMbR1dwx6d6Vx0FeELaZ9ZQewhooHQfUwwpG4J/KbYWzU3yEb
   Q==;
X-CSE-ConnectionGUID: fFr6bY7NRZeRVvdeMsBu4w==
X-CSE-MsgGUID: eZAoHWnYQu+HyhAkrzbEww==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16263690"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="16263690"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 00:17:03 -0700
X-CSE-ConnectionGUID: t776si93SQ6Xp3Chsr8xSQ==
X-CSE-MsgGUID: O4lxn5DVRmmTGNk2/kdAiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="44022454"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 Jun 2024 00:17:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMMtm-000F50-2w;
	Wed, 26 Jun 2024 07:16:58 +0000
Date: Wed, 26 Jun 2024 15:16:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4298/8232]
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c:366 sharp_panel_remove()
 error: we previously assumed 'sharp' could be null (see line 365)
Message-ID: <202406261525.SkhtM3ZV-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Douglas Anderson <dianders@chromium.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
commit: d7d473d8464e7b9931c0b19f68ea0df807e01b4c [4298/8232] drm/panel: sharp-lq101r1sx01: Don't call disable at shutdown/remove
:::::: branch date: 15 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-161-20240626 (https://download.01.org/0day-ci/archive/20240626/202406261525.SkhtM3ZV-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406261525.SkhtM3ZV-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c:366 sharp_panel_remove() error: we previously assumed 'sharp' could be null (see line 365)

vim +/sharp +366 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c

1976dbca047ed7 Thierry Reding   2014-08-01  354  
79abca2b399009 Uwe Kleine-König 2022-07-08  355  static void sharp_panel_remove(struct mipi_dsi_device *dsi)
1976dbca047ed7 Thierry Reding   2014-08-01  356  {
1976dbca047ed7 Thierry Reding   2014-08-01  357  	struct sharp_panel *sharp = mipi_dsi_get_drvdata(dsi);
1976dbca047ed7 Thierry Reding   2014-08-01  358  	int err;
1976dbca047ed7 Thierry Reding   2014-08-01  359  
1976dbca047ed7 Thierry Reding   2014-08-01  360  	err = mipi_dsi_detach(dsi);
1976dbca047ed7 Thierry Reding   2014-08-01  361  	if (err < 0)
1976dbca047ed7 Thierry Reding   2014-08-01  362  		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", err);
1976dbca047ed7 Thierry Reding   2014-08-01  363  
d7d473d8464e7b Douglas Anderson 2024-06-04  364  	/* only detach from host for the DSI-LINK2 interface */
1976dbca047ed7 Thierry Reding   2014-08-01 @365  	if (!sharp)
d7d473d8464e7b Douglas Anderson 2024-06-04 @366  		sharp_panel_del(sharp);
1976dbca047ed7 Thierry Reding   2014-08-01  367  }
1976dbca047ed7 Thierry Reding   2014-08-01  368  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
