Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84D516FF4E
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Sep 2024 03:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727408696; cv=none; b=qVvziPZP2iXdD7W0d9x0uFBShT8+2/9+S6tIxpmEn6wZ47ZnLXKS0+UqYCQrWYiYQO0ttObXE8f8w3/aTf6KSNSGJ22HDcspMwMRGSkIcUNZ6V8nbGq2hfEQ8TIGpZg5cGoU807W/Te+GrDh8NYAY01TnoZGif5YMvWqQdqKjUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727408696; c=relaxed/simple;
	bh=gp2l4i2nizvEnRH7YpH5n82Q3noEvzgjw4ZsjfP5+qM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mczgN+0g9bHELk+HTJzocGAC1+y6+p9IFDMrzOb8IlPRfneJOPxoA8Qj1OBiEEi/bt4ygH27+6MYsxROtODun15vi93P7BwyGveYV2NVmw6bb8RkSTuHUVc4SNK6P/zUAFO6TYL5yzx2oqbNh7jdnnbBOuG2nHDk/nOtRgyYCnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QLtzcq71; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QLtzcq71"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727408695; x=1758944695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gp2l4i2nizvEnRH7YpH5n82Q3noEvzgjw4ZsjfP5+qM=;
  b=QLtzcq71A2n1jJJeH7OmE6IlG+EKjYpsWlII1c7WG/kt0t3L5QGGcEO2
   IrIS0dUCyiOV0apJMqw+DZJgN4D/nmIkBklLEMXC3m/kA0rNMOrSSlJwq
   lJ5XEHubIaXA3S75u9K/+TNql095bV1TxWG4ZhaUEWEiLSIclzA08M7LJ
   YpleRxyMGTwz+fPdh08k140Ym5BrsbdLNZ3UfNpy2FbtKcBTeklFEuQYN
   BW/p5ACbONLrUuEPanSeISljXhxXgsF/ALH1D0E7kweeBd9heKeLJYYi0
   6byVRt/gIHclIOVCCupSVmHvBzjdhSKRsU4Yjx3jt3leOvl1crACpvwss
   Q==;
X-CSE-ConnectionGUID: O0g1l4uiRTq8lWvJ3+lbpA==
X-CSE-MsgGUID: Q0+G/27bRmKU05ZmqHHXJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37902468"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="37902468"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 20:44:54 -0700
X-CSE-ConnectionGUID: Yn4V1ThBTKu8ueH4EcND4Q==
X-CSE-MsgGUID: /wwvO4EdRSi2DhiN4P7QSQ==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="76902770"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Sep 2024 20:44:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su1uV-000LQV-0F;
	Fri, 27 Sep 2024 03:44:51 +0000
Date: Fri, 27 Sep 2024 11:44:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cip:linux-4.19.y-cip 6919/30000]
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c:687:22: warning: no previous
 prototype for 'rcar_du_crtc_mode_valid'
Message-ID: <202409271134.DyCm0IxA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "cip tree"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip
head:   95b722b3ebb739e01ce712254a92789f843917e3
commit: c91507b765b769d6930a2aab363bfb7b704b819e [6919/30000] drm: rcar-du: Add interlaced feature flag
:::::: branch date: 3 days ago
:::::: commit date: 5 years ago
config: arm-randconfig-004-20240927 (https://download.01.org/0day-ci/archive/20240927/202409271134.DyCm0IxA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271134.DyCm0IxA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409271134.DyCm0IxA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/rcar-du/rcar_du_crtc.c:687:22: warning: no previous prototype for 'rcar_du_crtc_mode_valid' [-Wmissing-prototypes]
     687 | enum drm_mode_status rcar_du_crtc_mode_valid(struct drm_crtc *crtc,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/rcar_du_crtc_mode_valid +687 drivers/gpu/drm/rcar-du/rcar_du_crtc.c

920888a2d56f0e Laurent Pinchart 2015-02-18  686  
c91507b765b769 Kieran Bingham   2019-09-17 @687  enum drm_mode_status rcar_du_crtc_mode_valid(struct drm_crtc *crtc,
c91507b765b769 Kieran Bingham   2019-09-17  688  				   const struct drm_display_mode *mode)
c91507b765b769 Kieran Bingham   2019-09-17  689  {
c91507b765b769 Kieran Bingham   2019-09-17  690  	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
c91507b765b769 Kieran Bingham   2019-09-17  691  	struct rcar_du_device *rcdu = rcrtc->group->dev;
c91507b765b769 Kieran Bingham   2019-09-17  692  	bool interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE;
c91507b765b769 Kieran Bingham   2019-09-17  693  
c91507b765b769 Kieran Bingham   2019-09-17  694  	if (interlaced && !rcar_du_has(rcdu, RCAR_DU_FEATURE_INTERLACED))
c91507b765b769 Kieran Bingham   2019-09-17  695  		return MODE_NO_INTERLACE;
c91507b765b769 Kieran Bingham   2019-09-17  696  
c91507b765b769 Kieran Bingham   2019-09-17  697  	return MODE_OK;
c91507b765b769 Kieran Bingham   2019-09-17  698  }
c91507b765b769 Kieran Bingham   2019-09-17  699  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
