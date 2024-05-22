Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043F020332
	for <oe-kbuild@lists.linux.dev>; Wed, 22 May 2024 14:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716389750; cv=none; b=G8Abp6VagpVTdHrmRO+LhoBqlZJDkG0aHpV6Zq5+r16yVmxM5yv6A76iyBPHYHX41z0LKYBMk+w6GWI01sEn3t+JsVhOr5+VKvhPxiDZmawIFhj0Jr3p9NW6SPY20fXqsxAXO2OMLYx3LckJHnOrTtvLkV3qWK5RMHFWGBRxjzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716389750; c=relaxed/simple;
	bh=f6Ya+K9a/5QOXZgPw9fYUyHhoFLzQI8nk6RbHi42tNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l8ig8CLyuzGOw16wIQXTrqRMu1247Q0F/3eEd6J6mTVrawqPCDzmeYUp6DNQonnIl68+OwDPFwF2M6Xq0ulgPsVtnczycIdVu4Eb6odd+QIYhbfNNrY+qrKtfuCAK/0WbtkjAJKa0yIwL0tMWTWPc37F9wUS7Bk4BtZjuvmBgTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eD6SwlZn; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eD6SwlZn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716389748; x=1747925748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f6Ya+K9a/5QOXZgPw9fYUyHhoFLzQI8nk6RbHi42tNc=;
  b=eD6SwlZn7unwFYvqOXQLjeC7UkFxHdlGKLqfgrnFh+S0n5bOA0QNs+1O
   UQmOvqpxMU6+P/ZlT/S5Ju89xhZ1mXGBsSEpp3fxXpACDjsq0tkCdjwT9
   62uSR2slEiLgophA9V1kE0s0PjpyKeHwr/Ng5pGYGOTKpPdalIH2vfc4j
   4srKjFZ7YOT4bthGClcUFIFKvIn3fAVAQLDEtwqW+p4bG4xGFfHwtDaqE
   U1CLhLr3UVXw69ggyNtnJ7dSuGhtxX9Fenjl/c1pmysJ99M1MbXSyLgKY
   IXbx9Ue4wrUziqFP8tU6iUKnixufDKJabj/CcOFfoAyJwH0HcxJLg0FvA
   g==;
X-CSE-ConnectionGUID: 5vmQhKQmQnmPR4DSSAc5gw==
X-CSE-MsgGUID: Lp+BwVaaRRO0H4zcKsFAMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="30151984"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="30151984"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 07:55:47 -0700
X-CSE-ConnectionGUID: DqopauGpTmODrrJCZka9aA==
X-CSE-MsgGUID: +tqiW/l1TLGnJRn9m7cTlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="33760549"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 22 May 2024 07:55:46 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9nNP-0001ez-2D;
	Wed, 22 May 2024 14:55:40 +0000
Date: Wed, 22 May 2024 22:55:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] drm/bridge: adv7511:  Fix Intermittent EDID failures
Message-ID: <202405222253.p3vRbJDH-lkp@intel.com>
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
In-Reply-To: <20240521011614.496421-1-aford173@gmail.com>
References: <20240521011614.496421-1-aford173@gmail.com>
TO: Adam Ford <aford173@gmail.com>
TO: dri-devel@lists.freedesktop.org
CC: dmitry.baryshkov@linaro.org
CC: ictor.liu@nxp.com
CC: sui.jingfeng@linux.dev
CC: aford@beaconembedded.com
CC: Adam Ford <aford173@gmail.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>
CC: Robert Foss <rfoss@kernel.org>
CC: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
CC: Jonas Karlman <jonas@kwiboo.se>
CC: Jernej Skrabec <jernej.skrabec@gmail.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Maxime Ripard <mripard@kernel.org>
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: David Airlie <airlied@gmail.com>
CC: Daniel Vetter <daniel@ffwll.ch>
CC: linux-kernel@vger.kernel.org

Hi Adam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-tip/drm-tip linus/master drm-intel/for-linux-next-fixes v6.9 next-20240522]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Adam-Ford/drm-bridge-adv7511-Fix-Intermittent-EDID-failures/20240521-091841
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240521011614.496421-1-aford173%40gmail.com
patch subject: [PATCH] drm/bridge: adv7511:  Fix Intermittent EDID failures
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240522 (https://download.01.org/0day-ci/archive/20240522/202405222253.p3vRbJDH-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405222253.p3vRbJDH-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/bridge/adv7511/adv7511_drv.c:507 adv7511_irq_process() error: uninitialized symbol 'cec_status'.

vim +/cec_status +507 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c

3b1b975003e4a3 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c Hans Verkuil       2017-10-07  505  
2d0835b065781a drivers/gpu/drm/bridge/adv7511/adv7511_drv.c Adam Ford          2024-05-20  506  	/* If there is no IRQ to handle, exit indicating no IRQ data */
2d0835b065781a drivers/gpu/drm/bridge/adv7511/adv7511_drv.c Adam Ford          2024-05-20 @507  	if (irq_status == IRQ_HANDLED || cec_status == IRQ_HANDLED)
2d0835b065781a drivers/gpu/drm/bridge/adv7511/adv7511_drv.c Adam Ford          2024-05-20  508  		return IRQ_HANDLED;
2d0835b065781a drivers/gpu/drm/bridge/adv7511/adv7511_drv.c Adam Ford          2024-05-20  509  
2d0835b065781a drivers/gpu/drm/bridge/adv7511/adv7511_drv.c Adam Ford          2024-05-20  510  	return IRQ_NONE;
a5241289c4139f drivers/gpu/drm/i2c/adv7511.c                Laurent Pinchart   2015-02-18  511  }
9c8af882bf1230 drivers/gpu/drm/i2c/adv7511.c                Lars-Peter Clausen 2012-03-05  512  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
