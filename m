Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3B638DD3
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Oct 2024 12:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729946167; cv=none; b=WoUfVY85q7zp2+57SEf1B0PbA1bksV14cfGP5l06ZFQzz3yQGhIeTqLKwallz0JyufGky/VQIklOAbKjV2JIC6R8r/f3ojcFjpBIcvXCf9yRNO3YzwMxjrxQh3RE+oSJpvA29jNia6N15l+nSC9ITLufRlvlVVRg2ZeCKHZWJsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729946167; c=relaxed/simple;
	bh=Uz1hNeeXxfl6EW+mpHX46+aHo6BXYwarCOOUMfiI+lU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KTrACM3tJbC9dYgKx0lWd8Ko64I55I3E0AHUMlNzFZvnl4gY+94BDRInerR/pnE+cINTuko+1pMLt0m5cgUr7nYye5HmGJfCetZv3Lu3MB8xiJs1jHPtxMkWL1jfYiLBM0Mexhu9VdYYsUUExd5kMQLRqN3FmsHUDNuwMjdeXwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XlwnpXBT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XlwnpXBT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729946164; x=1761482164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uz1hNeeXxfl6EW+mpHX46+aHo6BXYwarCOOUMfiI+lU=;
  b=XlwnpXBTeujljT/SJHRmnZ88F2yqbDGwh4cvJaYiJAArQTKi5rIHG8ql
   q1J49oFnAGbUrfeEGJpttJPVfLH/n4W20ldIpHMy+Y0KG2euRyuzpQoyH
   HnG2rXNkt0iS7XHaiOe+KgcOpe1MqLGtBew/tsepwjjjYCuP9udhMDqwO
   d+4A5oNtm7cqOKRilH58Jl6+c6T11SfVUlUjz6PMxcmEscm8X5rNbKkJm
   JGuMiuv9/WaI9mAjhBAMXpScfDAv2PRQTsUND0L0NNk1Uk/2Eo8NvOnyn
   aK+JEyDh1nn/uw4Nd6E65YIL4Su1VSz149s231CG+PIzgEKp25IxQ976g
   A==;
X-CSE-ConnectionGUID: WYF1oBmIRzyU1biBXw2cjg==
X-CSE-MsgGUID: ujpsM+SKRTCzGONTNDkfsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29469272"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29469272"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 05:36:03 -0700
X-CSE-ConnectionGUID: wZysWG5VQw+xYxJjPFc9cw==
X-CSE-MsgGUID: JYA+sMX/SOivMVZTW0POMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; 
   d="scan'208";a="80808688"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Oct 2024 05:36:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4g1Q-000Zdx-0C;
	Sat, 26 Oct 2024 12:36:00 +0000
Date: Sat, 26 Oct 2024 20:35:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
Message-ID: <202410262052.CRR7XezU-lkp@intel.com>
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
In-Reply-To: <20241024095539.1637280-3-herve.codina@bootlin.com>
References: <20241024095539.1637280-3-herve.codina@bootlin.com>
TO: Herve Codina <herve.codina@bootlin.com>
TO: Andrzej Hajda <andrzej.hajda@intel.com>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Robert Foss <rfoss@kernel.org>
TO: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
TO: Jonas Karlman <jonas@kwiboo.se>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Marek Vasut <marex@denx.de>
CC: dri-devel@lists.freedesktop.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: Herve Codina <herve.codina@bootlin.com>

Hi Herve,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on drm-misc/drm-misc-next linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herve-Codina/dt-bindings-display-bridge-sn65dsi83-Add-interrupt/20241024-175758
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241024095539.1637280-3-herve.codina%40bootlin.com
patch subject: [PATCH 2/2] drm: bridge: ti-sn65dsi83: Add error recovery mechanism
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: csky-randconfig-r073-20241026 (https://download.01.org/0day-ci/archive/20241026/202410262052.CRR7XezU-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410262052.CRR7XezU-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/bridge/ti-sn65dsi83.c:360 sn65dsi83_reset_pipeline() error: uninitialized symbol 'state'.

vim +/state +360 drivers/gpu/drm/bridge/ti-sn65dsi83.c

ceb515ba29ba6b Marek Vasut  2021-06-07  329  
caeb909b9ed830 Herve Codina 2024-10-24  330  static int sn65dsi83_reset_pipeline(struct sn65dsi83 *sn65dsi83)
caeb909b9ed830 Herve Codina 2024-10-24  331  {
caeb909b9ed830 Herve Codina 2024-10-24  332  	struct drm_device *dev = sn65dsi83->bridge.dev;
caeb909b9ed830 Herve Codina 2024-10-24  333  	struct drm_modeset_acquire_ctx ctx;
caeb909b9ed830 Herve Codina 2024-10-24  334  	struct drm_atomic_state *state;
caeb909b9ed830 Herve Codina 2024-10-24  335  	int err;
caeb909b9ed830 Herve Codina 2024-10-24  336  
caeb909b9ed830 Herve Codina 2024-10-24  337  	/* Use operation done in drm_atomic_helper_suspend() followed by
caeb909b9ed830 Herve Codina 2024-10-24  338  	 * operation done in drm_atomic_helper_resume() but without releasing
caeb909b9ed830 Herve Codina 2024-10-24  339  	 * the lock between suspend()/resume()
caeb909b9ed830 Herve Codina 2024-10-24  340  	 */
caeb909b9ed830 Herve Codina 2024-10-24  341  
caeb909b9ed830 Herve Codina 2024-10-24  342  	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, err);
caeb909b9ed830 Herve Codina 2024-10-24  343  
caeb909b9ed830 Herve Codina 2024-10-24  344  	state = drm_atomic_helper_duplicate_state(dev, &ctx);
caeb909b9ed830 Herve Codina 2024-10-24  345  	if (IS_ERR(state)) {
caeb909b9ed830 Herve Codina 2024-10-24  346  		err = PTR_ERR(state);
caeb909b9ed830 Herve Codina 2024-10-24  347  		goto unlock;
caeb909b9ed830 Herve Codina 2024-10-24  348  	}
caeb909b9ed830 Herve Codina 2024-10-24  349  
caeb909b9ed830 Herve Codina 2024-10-24  350  	err = drm_atomic_helper_disable_all(dev, &ctx);
caeb909b9ed830 Herve Codina 2024-10-24  351  	if (err < 0)
caeb909b9ed830 Herve Codina 2024-10-24  352  		goto unlock;
caeb909b9ed830 Herve Codina 2024-10-24  353  
caeb909b9ed830 Herve Codina 2024-10-24  354  	drm_mode_config_reset(dev);
caeb909b9ed830 Herve Codina 2024-10-24  355  
caeb909b9ed830 Herve Codina 2024-10-24  356  	err = drm_atomic_helper_commit_duplicated_state(state, &ctx);
caeb909b9ed830 Herve Codina 2024-10-24  357  
caeb909b9ed830 Herve Codina 2024-10-24  358  unlock:
caeb909b9ed830 Herve Codina 2024-10-24  359  	DRM_MODESET_LOCK_ALL_END(dev, ctx, err);
caeb909b9ed830 Herve Codina 2024-10-24 @360  	if (!IS_ERR(state))
caeb909b9ed830 Herve Codina 2024-10-24  361  		drm_atomic_state_put(state);
caeb909b9ed830 Herve Codina 2024-10-24  362  	return err;
caeb909b9ed830 Herve Codina 2024-10-24  363  }
caeb909b9ed830 Herve Codina 2024-10-24  364  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
