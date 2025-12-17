Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C196F274FD3
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 07:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765956260; cv=none; b=VPxAuhdT8P+iu6LxrtDztHWSRJVy67C1+QVN3UVQW5u30jrP1xoM6Z972ot4FWZ/kuNwtZVDUgaMAJdZJTOFqgmYvvDrkQNlgSFFp8auywpWDgaQn/7ZFOAW+0lPldIlRoOGnnYMI3oMHe5aoSgcl5AR4lvJmide91vmniT1RQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765956260; c=relaxed/simple;
	bh=i/j6p+XHMMpMw2eolOSqWuk0hNKIq+jdtm213wIFfu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nplVC7+vTybNUjTK24ho8ydFd8eE8WaJdQoiXnwgZuHq1xao38SL9dpooKD7307JdoRDX1kAxVMwINJCebheMxwNu3c9zPK+1wcn8wFvRFsc15/rdNG9Jn7EEFWatD0tsuo2JThaYihXfFueoK5ZSbBbXsr0HPszO0A9R2sfUV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WkPPqNnw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WkPPqNnw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765956259; x=1797492259;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=i/j6p+XHMMpMw2eolOSqWuk0hNKIq+jdtm213wIFfu8=;
  b=WkPPqNnwEZEQTlC5p/zmMdIksZOZWlqJKjpKaLLYRTbWlK2y3OIc7bG+
   lYD1nAAmtlO/llH9lGdiyX7UAIRwqZp3btZHPecPdoMqO4jDMYOYYInqe
   Rdeue8p6hIncUB76x67Neb2209lGo4K4tWNW2ga5by0/g/masuXt+0DRJ
   6eJXHtxkOJ5ygQlwB84S8Q5sezNiimRXq7C2Bk6DRLe0jWD3DFVSNTEeC
   g7ICzN8pYoj7m1/t+q4/oQIHuiCuvvVsxfnEqaUXdG1acHryr2VwuUesz
   r9wx+YAF5xsmrb73gTbZ82h5NrMDlJdcbnWVNZe9D40CljJP3E6ATfTDi
   A==;
X-CSE-ConnectionGUID: icegkTGQQZ6qllEeB/9wjw==
X-CSE-MsgGUID: Fdp9mtQWSPKvppGo4m1ZrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="79006727"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="79006727"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 23:24:18 -0800
X-CSE-ConnectionGUID: zszDwyJ6S125PCbiv4urYA==
X-CSE-MsgGUID: oeMB/xuMSKadFjduMCDPkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="198117850"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Dec 2025 23:24:17 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVltO-0000000009F-2noP;
	Wed, 17 Dec 2025 07:24:14 +0000
Date: Wed, 17 Dec 2025 15:23:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/i915/display/intel_ddi.c:755:8-10: WARNING: possible
 condition with no effect (if == else)
Message-ID: <202512171532.WiFOwSxE-lkp@intel.com>
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
TO: Jani Nikula <jani.nikula@intel.com>
CC: Imre Deak <imre.deak@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: 68148b8ee1f213204528a603729e648f4de3be8c drm/i915/ddi: refactor intel_ddi_connector_get_hw_state()
date:   1 year, 1 month ago
:::::: branch date: 3 hours ago
:::::: commit date: 1 year, 1 month ago
config: i386-randconfig-051-20251216 (https://download.01.org/0day-ci/archive/20251217/202512171532.WiFOwSxE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512171532.WiFOwSxE-lkp@intel.com/

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
