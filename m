Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8011BBBE5
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Dec 2025 03:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764904679; cv=none; b=WLeuVmVY65S41Le+4To/20k0VlUD0ap9mAmDzng6KLmCjFxT/0erKn+mVylSEbDBkq1nWU9qlpYMYC5zNk2mwRh9ANpOvW3FDjWEDUgyY6jKzzXkTYO/EAcXxeDmQALmX6Q3oHy86OXnYjVUEHM+0AMM255TXAcZoRkvdM05iJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764904679; c=relaxed/simple;
	bh=mSmKL8klT47EIRViyqx2wIndcuYz/4OFDbJ4wpIIsJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TSIhtXOfb+8GygEHcTDp5nwRDKRdXbWP3edtXadzeef6VR6KqiumK5cTxsfz8oflW0avIGxFgZWVo0myZN907EPruPyvD9bZwT6J9Ntm1xdHM7fEpnQAa8Hkj5RUZVKCBjbDSiagQf3XM7IdOCZytuMnTG7Mzxf3bDbqgWZH4/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A95vo17R; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A95vo17R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764904677; x=1796440677;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mSmKL8klT47EIRViyqx2wIndcuYz/4OFDbJ4wpIIsJc=;
  b=A95vo17RiR2XULLNlPOisW5YWOdPxka4il6BIBU9zwJZCOgcmvBbMp9p
   smR7zjYcBbldCOhg6cQA6/MH9/LiDrNvZxZ/W1o+IPBZU1QtM8QaeL5iv
   F2q34/sTx/He+4AwCYWR5my4vPh9kq3+PJOJ/MAnGp3sHkwVJj66R4e8n
   BLYeA8jqAptROryU0NmB/L2YuKfrTa85IcLCJm0L0jIlTECwYlFWZBsTM
   bne53jnkI0e0dVJ0IhPxvdwxD8MT7DKpFUKzdUDvgT2VuGEv3BIKyb+uw
   6hRLE6WjmOcd03Z/ndH/d1e4KqUEo+i9v8P7Y86KzDD7iaFPBgg9CJFmC
   w==;
X-CSE-ConnectionGUID: 3XhY6iFzR8O8RAC9mSSvDA==
X-CSE-MsgGUID: KDA4uq9LTSuYO0k0xPJo7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="65937724"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="65937724"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 19:17:54 -0800
X-CSE-ConnectionGUID: ALF1gaTGQGOIgV8E43Bskg==
X-CSE-MsgGUID: oYaDgX8WSuyo3ZsJAN1usg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="194235840"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Dec 2025 19:17:53 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRMKM-00000000EWt-2m2H;
	Fri, 05 Dec 2025 03:17:50 +0000
Date: Fri, 5 Dec 2025 11:17:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Introduce drm_crtc_vblank_prepare()
Message-ID: <202512051120.3HWHmkDI-lkp@intel.com>
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
[also build test WARNING on daeinki-drm-exynos/exynos-drm-next v6.18]
[cannot apply to drm-misc/drm-misc-next drm/drm-next drm-i915/for-linux-next drm-tip/drm-tip linus/master next-20251204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/sunpeng-li-amd-com/drm-amd-display-Implement-prepare_vblank_enable-callback/20251202-072501
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next-fixes
patch link:    https://lore.kernel.org/r/20251201231807.287414-1-sunpeng.li%40amd.com
patch subject: [PATCH v2 1/2] drm: Introduce drm_crtc_vblank_prepare()
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: nios2-randconfig-r071-20251204 (https://download.01.org/0day-ci/archive/20251205/202512051120.3HWHmkDI-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512051120.3HWHmkDI-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_vblank.c:1527 drm_crtc_vblank_on_config() warn: variable dereferenced before check 'crtc' (see line 1519)

vim +/crtc +1527 drivers/gpu/drm/drm_vblank.c

ed20151a7699bb Ville Syrjälä 2018-11-27  1502  
3ed4351a83ca05 Simona Vetter 2017-05-31  1503  /**
0d5040e406d2c4 Hamza Mahfooz 2024-07-25  1504   * drm_crtc_vblank_on_config - enable vblank events on a CRTC with custom
0d5040e406d2c4 Hamza Mahfooz 2024-07-25  1505   *     configuration options
3ed4351a83ca05 Simona Vetter 2017-05-31  1506   * @crtc: CRTC in question
0d5040e406d2c4 Hamza Mahfooz 2024-07-25  1507   * @config: Vblank configuration value
3ed4351a83ca05 Simona Vetter 2017-05-31  1508   *
0d5040e406d2c4 Hamza Mahfooz 2024-07-25  1509   * See drm_crtc_vblank_on(). In addition, this function allows you to provide a
0d5040e406d2c4 Hamza Mahfooz 2024-07-25  1510   * custom vblank configuration for a given CRTC.
0d5040e406d2c4 Hamza Mahfooz 2024-07-25  1511   *
0d5040e406d2c4 Hamza Mahfooz 2024-07-25  1512   * Note that @config is copied, the pointer does not need to stay valid beyond
0d5040e406d2c4 Hamza Mahfooz 2024-07-25  1513   * this function call. For details of the parameters see
0d5040e406d2c4 Hamza Mahfooz 2024-07-25  1514   * struct drm_vblank_crtc_config.
3ed4351a83ca05 Simona Vetter 2017-05-31  1515   */
0d5040e406d2c4 Hamza Mahfooz 2024-07-25  1516  void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
0d5040e406d2c4 Hamza Mahfooz 2024-07-25  1517  			       const struct drm_vblank_crtc_config *config)
3ed4351a83ca05 Simona Vetter 2017-05-31  1518  {
3ed4351a83ca05 Simona Vetter 2017-05-31 @1519  	struct drm_device *dev = crtc->dev;
3ed4351a83ca05 Simona Vetter 2017-05-31  1520  	unsigned int pipe = drm_crtc_index(crtc);
d12e36494dc2bf Ville Syrjälä 2024-04-08  1521  	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
38bd1e412d0aa4 Leo Li        2025-12-01  1522  	int ret;
3ed4351a83ca05 Simona Vetter 2017-05-31  1523  
5a4784f49b2dcf Sam Ravnborg  2020-05-23  1524  	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
3ed4351a83ca05 Simona Vetter 2017-05-31  1525  		return;
3ed4351a83ca05 Simona Vetter 2017-05-31  1526  
38bd1e412d0aa4 Leo Li        2025-12-01 @1527  	if (crtc) {
38bd1e412d0aa4 Leo Li        2025-12-01  1528  		ret = drm_crtc_vblank_prepare(crtc);
38bd1e412d0aa4 Leo Li        2025-12-01  1529  		drm_WARN_ON(dev, ret);
38bd1e412d0aa4 Leo Li        2025-12-01  1530  		if (ret)
38bd1e412d0aa4 Leo Li        2025-12-01  1531  			return;
38bd1e412d0aa4 Leo Li        2025-12-01  1532  	}
38bd1e412d0aa4 Leo Li        2025-12-01  1533  
92cc68e35863c1 Lyude Paul    2020-07-20  1534  	spin_lock_irq(&dev->vbl_lock);
02149a76d32bd8 Sam Ravnborg  2020-05-23  1535  	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
3ed4351a83ca05 Simona Vetter 2017-05-31  1536  		    pipe, vblank->enabled, vblank->inmodeset);
3ed4351a83ca05 Simona Vetter 2017-05-31  1537  
0d5040e406d2c4 Hamza Mahfooz 2024-07-25  1538  	vblank->config = *config;
0d5040e406d2c4 Hamza Mahfooz 2024-07-25  1539  
3ed4351a83ca05 Simona Vetter 2017-05-31  1540  	/* Drop our private "prevent drm_vblank_get" refcount */
3ed4351a83ca05 Simona Vetter 2017-05-31  1541  	if (vblank->inmodeset) {
3ed4351a83ca05 Simona Vetter 2017-05-31  1542  		atomic_dec(&vblank->refcount);
3ed4351a83ca05 Simona Vetter 2017-05-31  1543  		vblank->inmodeset = 0;
3ed4351a83ca05 Simona Vetter 2017-05-31  1544  	}
3ed4351a83ca05 Simona Vetter 2017-05-31  1545  
3ed4351a83ca05 Simona Vetter 2017-05-31  1546  	drm_reset_vblank_timestamp(dev, pipe);
3ed4351a83ca05 Simona Vetter 2017-05-31  1547  
3ed4351a83ca05 Simona Vetter 2017-05-31  1548  	/*
3ed4351a83ca05 Simona Vetter 2017-05-31  1549  	 * re-enable interrupts if there are users left, or the
3ed4351a83ca05 Simona Vetter 2017-05-31  1550  	 * user wishes vblank interrupts to be enabled all the time.
3ed4351a83ca05 Simona Vetter 2017-05-31  1551  	 */
0d5040e406d2c4 Hamza Mahfooz 2024-07-25  1552  	if (atomic_read(&vblank->refcount) != 0 || !vblank->config.offdelay_ms)
5a4784f49b2dcf Sam Ravnborg  2020-05-23  1553  		drm_WARN_ON(dev, drm_vblank_enable(dev, pipe));
92cc68e35863c1 Lyude Paul    2020-07-20  1554  	spin_unlock_irq(&dev->vbl_lock);
3ed4351a83ca05 Simona Vetter 2017-05-31  1555  }
0d5040e406d2c4 Hamza Mahfooz 2024-07-25  1556  EXPORT_SYMBOL(drm_crtc_vblank_on_config);
0d5040e406d2c4 Hamza Mahfooz 2024-07-25  1557  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
