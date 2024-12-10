Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41643233129
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Dec 2024 02:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733798109; cv=none; b=iItv8xeRc1qZl2NEBRjhghCz2/2qB0yusQ9t9XBftskYsK40caIIwp5EHOHTrw/qcNIVDOc2fYi2BbpeepSdiSuot/2Pkp3IR5rotr32s8BxYNcbvwMEo0JUCnaBjENRg+sebTLP200LKPfOBZ3EFytZwc7vPo1+4zRVL63kmoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733798109; c=relaxed/simple;
	bh=Xk6nm9eC1Uh63kLfnmZ0N9dv3qrYc15vmTa2C2y/1TE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mfURVrkAc1eQRcronh4zpYHuCktAAP/ACKSTz1tOe994mKEB0VN6hkL1ItRCcraZH9gAZePuKvp2Gg/lUwPma7AbHNtTufRHsFSWe+94l6499VA2cPJQ4osGKD4xHwgkYjj3K4UygpNWt5SEQVif0jY/+OOUXPXocGwHUHsy47A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YbJ+CkKG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YbJ+CkKG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733798107; x=1765334107;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Xk6nm9eC1Uh63kLfnmZ0N9dv3qrYc15vmTa2C2y/1TE=;
  b=YbJ+CkKGfMXx9XA4WRfBFnjnsyzm9Rx4gql2VEvOWSgYD4eXyyVfZhqa
   6V04UoqH1z8uhuZx44FCfxAq2Zg/Qwx6PZNuz7xw96zRFS6fP7M9lmaL1
   cSNx2S6FN888XdXvO8hBn5Z2hDcub6WcaPNEbweF2bVODwqDTcp2kRo/r
   JYa3TctLn8wxWpEpo2aLot7BNJyMful88RrRHvyQmuzCl2qogK7//VINt
   VsxPHh3dQSJALKeqc2Jm8j2mizho0cJknusRS9Cfwg+eGRBWTJfY2oNuC
   UM5qVKx1kKGQ0QbYw3fcbBZrSeK/p6ktNBWkUPn/nptrMP8f+M28WHfi9
   Q==;
X-CSE-ConnectionGUID: wFxf+lzhSVyzHwT8MBRuvA==
X-CSE-MsgGUID: xaFP7A6hSAayIWS/tkdfIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34047902"
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="34047902"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 18:35:06 -0800
X-CSE-ConnectionGUID: BQpzMRTpSDKwjmfzSI3ftA==
X-CSE-MsgGUID: BlkfIW6oRDOFF47iPIlesw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,221,1728975600"; 
   d="scan'208";a="126157383"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Dec 2024 18:35:05 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKq5W-00052X-2w;
	Tue, 10 Dec 2024 02:35:02 +0000
Date: Tue, 10 Dec 2024 10:34:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 507/2442]
 drivers/gpu/drm/i915/display/intel_ddi.c:755:8-10: WARNING: possible
 condition with no effect (if == else)
Message-ID: <202412101045.678MrmJR-lkp@intel.com>
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
TO: Jani Nikula <jani.nikula@intel.com>
CC: Imre Deak <imre.deak@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d1486dca38afd08ca279ae94eb3a397f10737824
commit: 68148b8ee1f213204528a603729e648f4de3be8c [507/2442] drm/i915/ddi: refactor intel_ddi_connector_get_hw_state()
:::::: branch date: 20 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-103-20241209 (https://download.01.org/0day-ci/archive/20241210/202412101045.678MrmJR-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412101045.678MrmJR-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_ddi.c:755:8-10: WARNING: possible condition with no effect (if == else)

vim +755 drivers/gpu/drm/i915/display/intel_ddi.c

2320175feb74a11 drivers/gpu/drm/i915/intel_ddi.c         Sean Paul       2018-01-08  715  
bcbc889bc44a781 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    2012-10-26  716  bool intel_ddi_connector_get_hw_state(struct intel_connector *intel_connector)
bcbc889bc44a781 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    2012-10-26  717  {
bd3b470e040ec56 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     2024-11-11  718  	struct intel_display *display = to_intel_display(intel_connector);
bd3b470e040ec56 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     2024-11-11  719  	struct drm_i915_private *dev_priv = to_i915(display->drm);
fa7edcd25cd0ffd drivers/gpu/drm/i915/display/intel_ddi.c Ville Syrjälä   2019-12-04  720  	struct intel_encoder *encoder = intel_attached_encoder(intel_connector);
bcbc889bc44a781 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    2012-10-26  721  	int type = intel_connector->base.connector_type;
0fce04c8764bd0d drivers/gpu/drm/i915/intel_ddi.c         Ville Syrjälä   2017-10-27  722  	enum port port = encoder->port;
bcbc889bc44a781 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    2012-10-26  723  	enum transcoder cpu_transcoder;
0e6e0be4c952372 drivers/gpu/drm/i915/intel_ddi.c         Chris Wilson    2019-01-14  724  	intel_wakeref_t wakeref;
0e6e0be4c952372 drivers/gpu/drm/i915/intel_ddi.c         Chris Wilson    2019-01-14  725  	enum pipe pipe = 0;
68148b8ee1f2132 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     2024-11-20  726  	u32 ddi_mode;
e27daab49718e32 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak       2016-02-12  727  	bool ret;
bcbc889bc44a781 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    2012-10-26  728  
0e6e0be4c952372 drivers/gpu/drm/i915/intel_ddi.c         Chris Wilson    2019-01-14  729  	wakeref = intel_display_power_get_if_enabled(dev_priv,
0e6e0be4c952372 drivers/gpu/drm/i915/intel_ddi.c         Chris Wilson    2019-01-14  730  						     encoder->power_domain);
0e6e0be4c952372 drivers/gpu/drm/i915/intel_ddi.c         Chris Wilson    2019-01-14  731  	if (!wakeref)
882244a34040881 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    2014-04-01  732  		return false;
882244a34040881 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    2014-04-01  733  
1524e93e1eb42e5 drivers/gpu/drm/i915/intel_ddi.c         Shashank Sharma 2017-03-09  734  	if (!encoder->get_hw_state(encoder, &pipe)) {
e27daab49718e32 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak       2016-02-12  735  		ret = false;
e27daab49718e32 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak       2016-02-12  736  		goto out;
e27daab49718e32 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak       2016-02-12  737  	}
bcbc889bc44a781 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    2012-10-26  738  
10cf8e755a9ac79 drivers/gpu/drm/i915/display/intel_ddi.c Ville Syrjälä   2020-03-18  739  	if (HAS_TRANSCODER(dev_priv, TRANSCODER_EDP) && port == PORT_A)
bcbc889bc44a781 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    2012-10-26  740  		cpu_transcoder = TRANSCODER_EDP;
bcbc889bc44a781 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    2012-10-26  741  	else
1a240d4de2ccf40 drivers/gpu/drm/i915/intel_ddi.c         Simona Vetter   2012-11-29  742  		cpu_transcoder = (enum transcoder) pipe;
bcbc889bc44a781 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    2012-10-26  743  
68148b8ee1f2132 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     2024-11-20  744  	ddi_mode = intel_de_read(dev_priv, TRANS_DDI_FUNC_CTL(dev_priv, cpu_transcoder)) &
68148b8ee1f2132 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     2024-11-20  745  		TRANS_DDI_MODE_SELECT_MASK;
bcbc889bc44a781 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    2012-10-26  746  
68148b8ee1f2132 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     2024-11-20  747  	if (ddi_mode == TRANS_DDI_MODE_SELECT_HDMI ||
68148b8ee1f2132 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     2024-11-20  748  	    ddi_mode == TRANS_DDI_MODE_SELECT_DVI) {
e27daab49718e32 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak       2016-02-12  749  		ret = type == DRM_MODE_CONNECTOR_HDMIA;
68148b8ee1f2132 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     2024-11-20  750  	} else if (ddi_mode == TRANS_DDI_MODE_SELECT_FDI_OR_128B132B && !HAS_DP20(display)) {
68148b8ee1f2132 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     2024-11-20  751  		ret = type == DRM_MODE_CONNECTOR_VGA;
68148b8ee1f2132 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     2024-11-20  752  	} else if (ddi_mode == TRANS_DDI_MODE_SELECT_DP_SST) {
e27daab49718e32 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak       2016-02-12  753  		ret = type == DRM_MODE_CONNECTOR_eDP ||
e27daab49718e32 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak       2016-02-12  754  			type == DRM_MODE_CONNECTOR_DisplayPort;
68148b8ee1f2132 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     2024-11-20 @755  	} else if (ddi_mode == TRANS_DDI_MODE_SELECT_DP_MST ||
68148b8ee1f2132 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     2024-11-20  756  		   (ddi_mode == TRANS_DDI_MODE_SELECT_FDI_OR_128B132B && HAS_DP20(display))) {
68148b8ee1f2132 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     2024-11-20  757  		/*
68148b8ee1f2132 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     2024-11-20  758  		 * If the transcoder is in MST state then connector isn't
68148b8ee1f2132 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     2024-11-20  759  		 * connected.
68148b8ee1f2132 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     2024-11-20  760  		 */
652135940ee20e2 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     2021-09-09  761  		ret = false;
68148b8ee1f2132 drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     2024-11-20  762  	} else {
e27daab49718e32 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak       2016-02-12  763  		ret = false;
bcbc889bc44a781 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    2012-10-26  764  	}
e27daab49718e32 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak       2016-02-12  765  
e27daab49718e32 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak       2016-02-12  766  out:
0e6e0be4c952372 drivers/gpu/drm/i915/intel_ddi.c         Chris Wilson    2019-01-14  767  	intel_display_power_put(dev_priv, encoder->power_domain, wakeref);
e27daab49718e32 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak       2016-02-12  768  
e27daab49718e32 drivers/gpu/drm/i915/intel_ddi.c         Imre Deak       2016-02-12  769  	return ret;
bcbc889bc44a781 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    2012-10-26  770  }
bcbc889bc44a781 drivers/gpu/drm/i915/intel_ddi.c         Paulo Zanoni    2012-10-26  771  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
