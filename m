Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFE933FD
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Apr 2025 02:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743821616; cv=none; b=IOZVu4Tmt707ktokP147AO88FhgpCIVivBz4JigQ3EW9GDBkUsUZYp1NEGCCkQik3fx5TtKSxl1y4LBk50oih8HKKnRJ03kGhZxPC8Vttzlk6AqgIdFvMxFR7ZlfYiSUZWSTF00aF32i4lnvADoUKwjwOQtHQ/v8zOgzHTtYw6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743821616; c=relaxed/simple;
	bh=utn1moEs7IM9wiIy+0Mz4L53GkHjgEj2lYV9E3ntVII=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PVw55Oz7vaGS1bY6Xe3l/1xhcj2qtmAMvl0LRrYoopnTR28IH7OsPIW9iuE6eaYzOBYA9WkKIP1Ra+PVkeYaNxmStZkUD7PB29P/2cGWDrXNdsN+16PnX5gmKmPz6go2E+Foxpf4c3qQjWd+G1CWBCF52S8IFrcrdFXeZ3Sz7Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OCnFWpTi; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OCnFWpTi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743821614; x=1775357614;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=utn1moEs7IM9wiIy+0Mz4L53GkHjgEj2lYV9E3ntVII=;
  b=OCnFWpTiABBi+vUkVeMVspJRhCxUfpmw5OQ5ab5ffcsKwIs0ka6hO1pj
   ayOCJzspU4+qia/cuDgz3v86VN/TQoEpi/eJ6aYg4jHwua/1ZvRMiNMbS
   JFhMAQlTVZkXWMZ3Q4fK5PJynsvxGUNebDx4LLLOofjfJwt7Up7Dg85rX
   eP9QtIQAbnFwwZ1D1D2cGVPwOgf8zsSRpzDncLMnxql+J27GIHCbNtspG
   UdCUjkJ7cGXI/q77B8P81PHToQHVyU9skPM+bbA9siP1iqLi/V6F46vs5
   T1HM3+7FNzhgu1GoLUpGzD7kJ9ibofuxZXzO/YNgBFTw9vTfgs1kt5OsZ
   w==;
X-CSE-ConnectionGUID: 2P/UnnQ9QeeddUk8UFN79g==
X-CSE-MsgGUID: tDMGFHkCShCZg0QYI7KVuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="48925287"
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="48925287"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 19:53:34 -0700
X-CSE-ConnectionGUID: 9e+vSBsiSVKpI5Nn+PZ/xw==
X-CSE-MsgGUID: qlDfc0FxTJeHPI9sgc/4Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="131612040"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Apr 2025 19:53:32 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0tez-0001kp-29;
	Sat, 05 Apr 2025 02:53:29 +0000
Date: Sat, 5 Apr 2025 10:53:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/omapdrm/omap_crtc.c:171:21-27: opportunity for
 str_enable_disable(enable)
Message-ID: <202504051012.sy4roz9L-lkp@intel.com>
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
TO: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f867ba24d3665d9ac9d9ef1f51844eb4479b291
commit: dc6fcaaba5a5411237d042a26c4d46689f3346bb drm/omap: Allow build with COMPILE_TEST=y
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-r053-20250404 (https://download.01.org/0day-ci/archive/20250405/202504051012.sy4roz9L-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202504051012.sy4roz9L-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/omapdrm/omap_crtc.c:171:21-27: opportunity for str_enable_disable(enable)
--
>> drivers/gpu/drm/omapdrm/omap_encoder.c:109:13-22: ERROR: invalid reference to the index variable of the iterator on line 84

vim +171 drivers/gpu/drm/omapdrm/omap_crtc.c

f5f9454c2145fa drivers/staging/omapdrm/omap_crtc.c Rob Clark         2012-12-04  107  
4029755e2a411c drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-05-28  108  /* Called only from the encoder enable/disable and suspend/resume handlers. */
05ec6128935639 drivers/gpu/drm/omapdrm/omap_crtc.c Tomi Valkeinen    2020-12-15  109  void omap_crtc_set_enabled(struct drm_crtc *crtc, bool enable)
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  110  {
1bb418bffdd6f9 drivers/gpu/drm/omapdrm/omap_crtc.c Sebastian Reichel 2019-05-23  111  	struct omap_crtc_state *omap_state = to_omap_crtc_state(crtc->state);
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  112  	struct drm_device *dev = crtc->dev;
9f759225e42b00 drivers/gpu/drm/omapdrm/omap_crtc.c Tomi Valkeinen    2015-11-05  113  	struct omap_drm_private *priv = dev->dev_private;
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  114  	struct omap_crtc *omap_crtc = to_omap_crtc(crtc);
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  115  	enum omap_channel channel = omap_crtc->channel;
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  116  	struct omap_irq_wait *wait;
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  117  	u32 framedone_irq, vsync_irq;
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  118  	int ret;
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  119  
03af8157aac6db drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2016-04-18  120  	if (WARN_ON(omap_crtc->enabled == enable))
03af8157aac6db drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2016-04-18  121  		return;
03af8157aac6db drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2016-04-18  122  
1bb418bffdd6f9 drivers/gpu/drm/omapdrm/omap_crtc.c Sebastian Reichel 2019-05-23  123  	if (omap_state->manually_updated) {
1bb418bffdd6f9 drivers/gpu/drm/omapdrm/omap_crtc.c Sebastian Reichel 2019-05-23  124  		omap_irq_enable_framedone(crtc, enable);
1bb418bffdd6f9 drivers/gpu/drm/omapdrm/omap_crtc.c Sebastian Reichel 2019-05-23  125  		omap_crtc->enabled = enable;
1bb418bffdd6f9 drivers/gpu/drm/omapdrm/omap_crtc.c Sebastian Reichel 2019-05-23  126  		return;
1bb418bffdd6f9 drivers/gpu/drm/omapdrm/omap_crtc.c Sebastian Reichel 2019-05-23  127  	}
1bb418bffdd6f9 drivers/gpu/drm/omapdrm/omap_crtc.c Sebastian Reichel 2019-05-23  128  
0dbfc396672025 drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2018-12-10  129  	if (omap_crtc->pipe->output->type == OMAP_DISPLAY_TYPE_HDMI) {
dac62bcafeaa4f drivers/gpu/drm/omapdrm/omap_crtc.c Tomi Valkeinen    2020-12-15  130  		dispc_mgr_enable(priv->dispc, channel, enable);
f933a3a93b2d74 drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2016-04-18  131  		omap_crtc->enabled = enable;
4e4b53ceb59301 drivers/gpu/drm/omapdrm/omap_crtc.c Tomi Valkeinen    2015-03-24  132  		return;
4e4b53ceb59301 drivers/gpu/drm/omapdrm/omap_crtc.c Tomi Valkeinen    2015-03-24  133  	}
4e4b53ceb59301 drivers/gpu/drm/omapdrm/omap_crtc.c Tomi Valkeinen    2015-03-24  134  
ef4222838846fd drivers/gpu/drm/omapdrm/omap_crtc.c Tomi Valkeinen    2015-02-26  135  	if (omap_crtc->channel == OMAP_DSS_CHANNEL_DIGIT) {
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  136  		/*
ef4222838846fd drivers/gpu/drm/omapdrm/omap_crtc.c Tomi Valkeinen    2015-02-26  137  		 * Digit output produces some sync lost interrupts during the
ef4222838846fd drivers/gpu/drm/omapdrm/omap_crtc.c Tomi Valkeinen    2015-02-26  138  		 * first frame when enabling, so we need to ignore those.
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  139  		 */
a36af73f5e825c drivers/gpu/drm/omapdrm/omap_crtc.c Tomi Valkeinen    2015-02-26  140  		omap_crtc->ignore_digit_sync_lost = true;
ef4222838846fd drivers/gpu/drm/omapdrm/omap_crtc.c Tomi Valkeinen    2015-02-26  141  	}
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  142  
dac62bcafeaa4f drivers/gpu/drm/omapdrm/omap_crtc.c Tomi Valkeinen    2020-12-15  143  	framedone_irq = dispc_mgr_get_framedone_irq(priv->dispc,
50638ae569dc09 drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2018-02-13  144  							       channel);
dac62bcafeaa4f drivers/gpu/drm/omapdrm/omap_crtc.c Tomi Valkeinen    2020-12-15  145  	vsync_irq = dispc_mgr_get_vsync_irq(priv->dispc, channel);
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  146  
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  147  	if (enable) {
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  148  		wait = omap_irq_wait_init(dev, vsync_irq, 1);
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  149  	} else {
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  150  		/*
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  151  		 * When we disable the digit output, we need to wait for
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  152  		 * FRAMEDONE to know that DISPC has finished with the output.
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  153  		 *
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  154  		 * OMAP2/3 does not have FRAMEDONE irq for digit output, and in
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  155  		 * that case we need to use vsync interrupt, and wait for both
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  156  		 * even and odd frames.
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  157  		 */
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  158  
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  159  		if (framedone_irq)
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  160  			wait = omap_irq_wait_init(dev, framedone_irq, 1);
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  161  		else
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  162  			wait = omap_irq_wait_init(dev, vsync_irq, 2);
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  163  	}
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  164  
dac62bcafeaa4f drivers/gpu/drm/omapdrm/omap_crtc.c Tomi Valkeinen    2020-12-15  165  	dispc_mgr_enable(priv->dispc, channel, enable);
f933a3a93b2d74 drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2016-04-18  166  	omap_crtc->enabled = enable;
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  167  
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  168  	ret = omap_irq_wait(dev, wait, msecs_to_jiffies(100));
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  169  	if (ret) {
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  170  		dev_err(dev->dev, "%s: timeout waiting for %s\n",
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15 @171  				omap_crtc->name, enable ? "enable" : "disable");
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  172  	}
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  173  
ef4222838846fd drivers/gpu/drm/omapdrm/omap_crtc.c Tomi Valkeinen    2015-02-26  174  	if (omap_crtc->channel == OMAP_DSS_CHANNEL_DIGIT) {
a36af73f5e825c drivers/gpu/drm/omapdrm/omap_crtc.c Tomi Valkeinen    2015-02-26  175  		omap_crtc->ignore_digit_sync_lost = false;
a36af73f5e825c drivers/gpu/drm/omapdrm/omap_crtc.c Tomi Valkeinen    2015-02-26  176  		/* make sure the irq handler sees the value above */
a36af73f5e825c drivers/gpu/drm/omapdrm/omap_crtc.c Tomi Valkeinen    2015-02-26  177  		mb();
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  178  	}
ef4222838846fd drivers/gpu/drm/omapdrm/omap_crtc.c Tomi Valkeinen    2015-02-26  179  }
8472b5708ebaab drivers/gpu/drm/omapdrm/omap_crtc.c Laurent Pinchart  2015-01-15  180  

:::::: The code at line 171 was first introduced by commit
:::::: 8472b5708ebaabf4568fe53672db7567e94c4c65 drm: omapdrm: Avoid function forward declaration in omap_crtc.c

:::::: TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
:::::: CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
