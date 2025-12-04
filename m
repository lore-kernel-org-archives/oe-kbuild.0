Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F86FA55
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Dec 2025 03:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764820010; cv=none; b=HuCosVU+aZptfB4ATNTTrGfjw/psQrRVaGSdyJYqk4VmnCqk2JrWopc9rNzqgS0Shv4QT9OCOQttZjfCoOJ96/iuHCDG2yxFEZeOxiiJ1DNhaVNqWdj+dKBHY1jWE/mHeP9iZYGnRZLRoDDj6uiAsyMgHgmMh+v8KRFF986XFw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764820010; c=relaxed/simple;
	bh=xl3E6wNQKAeaSmmmODzi4oM17SRlMLtkhoBaX81GdHU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IRT+bRfqnVWxLYz9yJ9dQwoZtgBcMRidXzNdl8F4iJw7D94PosYAa+gSIElbp+++hGmG5kLjC36MKV11zfDAOoFoT5lc4d/8rUVLDcGIUzzyTE5mOY5rcsrTMnntwCFzDsibwL4xTDwHcDHaRzcMQKV5uzqPPrgYVPWWBQlRSWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FGkFfiFr; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FGkFfiFr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764820008; x=1796356008;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xl3E6wNQKAeaSmmmODzi4oM17SRlMLtkhoBaX81GdHU=;
  b=FGkFfiFrEWaD4QwLlHBSqu/BrDcxhAFFAy3vm3bUw+BpwXMpLEaMLDfH
   UIFVu3SrjMQaZY75mDraT/gi36+j1ZLwjCiCiNQk9Rdbfq+rE1uqmPCyM
   OlJ6dIPfJK77GfEXN5H2HdBHf5/w+lsX1Ep77eTUZMdW4B7mR8OqvLVtx
   eTitFvdtF9CxZJHUM4MT3AR2fv0sN5K3q5RB/Jor35f0BxEW/XDQENWCh
   wW4UCvNmbJobp6j8bgj6RxGzebH2ZVrlLJVfSG0YcQw97lm41oJ7hDG1s
   1qrPnJwJm1iNjvRrvQSQ11aUT72SSc4tI1jRzTEnZbAn07Dz4ifUikV1c
   Q==;
X-CSE-ConnectionGUID: KoPQckAUQpWQFJmhZCVCgw==
X-CSE-MsgGUID: 63b69mjHRx6wLMVpAmgGjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66556089"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="66556089"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 19:46:47 -0800
X-CSE-ConnectionGUID: mhOQSLhoRiKraULNUNrTTg==
X-CSE-MsgGUID: vgkP4gbvRxOn1n54Eu+WNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="194694225"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Dec 2025 19:46:46 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vR0Il-00000000DPj-2GmS;
	Thu, 04 Dec 2025 03:46:43 +0000
Date: Thu, 4 Dec 2025 11:46:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Introduce drm_crtc_vblank_prepare()
Message-ID: <202512041153.nYks4oYu-lkp@intel.com>
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
In-Reply-To: <20251201231807.287414-1-sunpeng.li@amd.com>
References: <20251201231807.287414-1-sunpeng.li@amd.com>
TO: sunpeng.li@amd.com
TO: amd-gfx@lists.freedesktop.org
TO: dri-devel@lists.freedesktop.org
CC: Harry.Wentland@amd.com
CC: Nicholas.Kazlauskas@amd.com
CC: simona@ffwll.ch
CC: airlied@gmail.com
CC: Leo Li <sunpeng.li@amd.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-i915/for-linux-next-fixes]
[also build test WARNING on daeinki-drm-exynos/exynos-drm-next linus/master v6.18]
[cannot apply to drm-misc/drm-misc-next drm/drm-next drm-i915/for-linux-next drm-tip/drm-tip next-20251203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/sunpeng-li-amd-com/drm-amd-display-Implement-prepare_vblank_enable-callback/20251202-072501
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next-fixes
patch link:    https://lore.kernel.org/r/20251201231807.287414-1-sunpeng.li%40amd.com
patch subject: [PATCH v2 1/2] drm: Introduce drm_crtc_vblank_prepare()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: nios2-randconfig-r071-20251204 (https://download.01.org/0day-ci/archive/20251204/202512041153.nYks4oYu-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512041153.nYks4oYu-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_vblank.c:1527 drm_crtc_vblank_on_config() warn: variable dereferenced before check 'crtc' (see line 1519)

vim +/crtc +1527 drivers/gpu/drm/drm_vblank.c

ed20151a7699bb2 Ville Syrjälä 2018-11-27  1502  
3ed4351a83ca05d Simona Vetter 2017-05-31  1503  /**
0d5040e406d2c44 Hamza Mahfooz 2024-07-25  1504   * drm_crtc_vblank_on_config - enable vblank events on a CRTC with custom
0d5040e406d2c44 Hamza Mahfooz 2024-07-25  1505   *     configuration options
3ed4351a83ca05d Simona Vetter 2017-05-31  1506   * @crtc: CRTC in question
0d5040e406d2c44 Hamza Mahfooz 2024-07-25  1507   * @config: Vblank configuration value
3ed4351a83ca05d Simona Vetter 2017-05-31  1508   *
0d5040e406d2c44 Hamza Mahfooz 2024-07-25  1509   * See drm_crtc_vblank_on(). In addition, this function allows you to provide a
0d5040e406d2c44 Hamza Mahfooz 2024-07-25  1510   * custom vblank configuration for a given CRTC.
0d5040e406d2c44 Hamza Mahfooz 2024-07-25  1511   *
0d5040e406d2c44 Hamza Mahfooz 2024-07-25  1512   * Note that @config is copied, the pointer does not need to stay valid beyond
0d5040e406d2c44 Hamza Mahfooz 2024-07-25  1513   * this function call. For details of the parameters see
0d5040e406d2c44 Hamza Mahfooz 2024-07-25  1514   * struct drm_vblank_crtc_config.
3ed4351a83ca05d Simona Vetter 2017-05-31  1515   */
0d5040e406d2c44 Hamza Mahfooz 2024-07-25  1516  void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
0d5040e406d2c44 Hamza Mahfooz 2024-07-25  1517  			       const struct drm_vblank_crtc_config *config)
3ed4351a83ca05d Simona Vetter 2017-05-31  1518  {
3ed4351a83ca05d Simona Vetter 2017-05-31 @1519  	struct drm_device *dev = crtc->dev;
3ed4351a83ca05d Simona Vetter 2017-05-31  1520  	unsigned int pipe = drm_crtc_index(crtc);
d12e36494dc2bf2 Ville Syrjälä 2024-04-08  1521  	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
38bd1e412d0aa4b Leo Li        2025-12-01  1522  	int ret;
3ed4351a83ca05d Simona Vetter 2017-05-31  1523  
5a4784f49b2dcff Sam Ravnborg  2020-05-23  1524  	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
3ed4351a83ca05d Simona Vetter 2017-05-31  1525  		return;
3ed4351a83ca05d Simona Vetter 2017-05-31  1526  
38bd1e412d0aa4b Leo Li        2025-12-01 @1527  	if (crtc) {
38bd1e412d0aa4b Leo Li        2025-12-01  1528  		ret = drm_crtc_vblank_prepare(crtc);
38bd1e412d0aa4b Leo Li        2025-12-01  1529  		drm_WARN_ON(dev, ret);
38bd1e412d0aa4b Leo Li        2025-12-01  1530  		if (ret)
38bd1e412d0aa4b Leo Li        2025-12-01  1531  			return;
38bd1e412d0aa4b Leo Li        2025-12-01  1532  	}
38bd1e412d0aa4b Leo Li        2025-12-01  1533  
92cc68e35863c1c Lyude Paul    2020-07-20  1534  	spin_lock_irq(&dev->vbl_lock);
02149a76d32bd8f Sam Ravnborg  2020-05-23  1535  	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
3ed4351a83ca05d Simona Vetter 2017-05-31  1536  		    pipe, vblank->enabled, vblank->inmodeset);
3ed4351a83ca05d Simona Vetter 2017-05-31  1537  
0d5040e406d2c44 Hamza Mahfooz 2024-07-25  1538  	vblank->config = *config;
0d5040e406d2c44 Hamza Mahfooz 2024-07-25  1539  
3ed4351a83ca05d Simona Vetter 2017-05-31  1540  	/* Drop our private "prevent drm_vblank_get" refcount */
3ed4351a83ca05d Simona Vetter 2017-05-31  1541  	if (vblank->inmodeset) {
3ed4351a83ca05d Simona Vetter 2017-05-31  1542  		atomic_dec(&vblank->refcount);
3ed4351a83ca05d Simona Vetter 2017-05-31  1543  		vblank->inmodeset = 0;
3ed4351a83ca05d Simona Vetter 2017-05-31  1544  	}
3ed4351a83ca05d Simona Vetter 2017-05-31  1545  
3ed4351a83ca05d Simona Vetter 2017-05-31  1546  	drm_reset_vblank_timestamp(dev, pipe);
3ed4351a83ca05d Simona Vetter 2017-05-31  1547  
3ed4351a83ca05d Simona Vetter 2017-05-31  1548  	/*
3ed4351a83ca05d Simona Vetter 2017-05-31  1549  	 * re-enable interrupts if there are users left, or the
3ed4351a83ca05d Simona Vetter 2017-05-31  1550  	 * user wishes vblank interrupts to be enabled all the time.
3ed4351a83ca05d Simona Vetter 2017-05-31  1551  	 */
0d5040e406d2c44 Hamza Mahfooz 2024-07-25  1552  	if (atomic_read(&vblank->refcount) != 0 || !vblank->config.offdelay_ms)
5a4784f49b2dcff Sam Ravnborg  2020-05-23  1553  		drm_WARN_ON(dev, drm_vblank_enable(dev, pipe));
92cc68e35863c1c Lyude Paul    2020-07-20  1554  	spin_unlock_irq(&dev->vbl_lock);
3ed4351a83ca05d Simona Vetter 2017-05-31  1555  }
0d5040e406d2c44 Hamza Mahfooz 2024-07-25  1556  EXPORT_SYMBOL(drm_crtc_vblank_on_config);
0d5040e406d2c44 Hamza Mahfooz 2024-07-25  1557  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
