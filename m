Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8931822330F
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Aug 2025 22:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756076030; cv=none; b=UO4PSROzmy4luCE6n+cfkcePrikmqNnaebccqVGsIlOavW7s1I5/21G4evY2OsFT4ADeSjxjMdclZ8+h2hyjkmIF4bAF2ljNj1M80qz3V6nZNbv+5aDKqyDfthIR878i1GJo+0xB7ZDTkycKRSW2fv7W1kwSFEhOtlOrzVfP7lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756076030; c=relaxed/simple;
	bh=8lTQKJB3/4Y86gfrBnRTLfCIj6Cjm451KkaUx2OS6KY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D1EZI+kowT+ZjYszN0LqmLP8c5ht96LMHfHLOn9d3cceDxXbJ4c2BUZWQFmQmu6jPszIDwZSR+84HaelHVyvGeRir2MO0+jCgduWe3UNL7EKFa/FfAVFB0nGQYaQUYIJBpnurvNh72lVcEwIfvVunrjIHDxFBvjoLsBLmqxXDT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cTTw609Y; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTTw609Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756076028; x=1787612028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8lTQKJB3/4Y86gfrBnRTLfCIj6Cjm451KkaUx2OS6KY=;
  b=cTTw609Y9qSx90jNXT8HnUtly3/ZQu69glVmg2D0rXZxE0iYdJneDGzh
   ll9q1/OIo3gl+4XeCjVtgVa7FScR7OjWvI2RrQ1Qd2YuM2giykG1oQiPp
   QSLukyLxFWDHsPP/7td/gFZ3ajLitxscTltal1xG1OwbcHVrhoMz3eY/c
   eXk86LyMzEmWKuuAB9CIMeLILHWsl7v8M1Oh90K0NMSaZtDQ4NRsVCIXa
   ZLCmfQQIo0ltNNwIomR9F7kGeI5GNMUvV3DsiEtDc1XpuCBudfu5DHFdT
   325CaFgT18uxKBqbQOI0VcKMGcx4+pgiEkN7BCfLJr7wMwcBnDpMtSrt3
   g==;
X-CSE-ConnectionGUID: EtTX/ie3TzqO9atDWSf64A==
X-CSE-MsgGUID: CkZd23yoTuWe1d+wKzH2eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="61929583"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61929583"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 15:53:48 -0700
X-CSE-ConnectionGUID: Knk9FDWnQjaTxBR7v1c50A==
X-CSE-MsgGUID: eUU71A8JQjOeQTkQBTe7xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="206319438"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 Aug 2025 15:53:47 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqJa1-000NFH-00;
	Sun, 24 Aug 2025 22:53:34 +0000
Date: Mon, 25 Aug 2025 06:52:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] drm/stm: ltdc: unify log system
Message-ID: <202508250637.nLxtkS26-lkp@intel.com>
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
In-Reply-To: <20250821130356.883553-1-raphael.gallais-pou@foss.st.com>
References: <20250821130356.883553-1-raphael.gallais-pou@foss.st.com>
TO: "Raphael Gallais-Pou" <raphael.gallais-pou@foss.st.com>
TO: Yannick Fertre <yannick.fertre@foss.st.com>
TO: Philippe Cornu <philippe.cornu@foss.st.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Maxime Coquelin <mcoquelin.stm32@gmail.com>
TO: Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: dri-devel@lists.freedesktop.org
CC: linux-stm32@st-md-mailman.stormreply.com
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Raphael,

kernel test robot noticed the following build warnings:

[auto build test WARNING on atorgue-stm32/stm32-next]
[also build test WARNING on linus/master v6.17-rc3 next-20250822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raphael-Gallais-Pou/drm-stm-ltdc-unify-log-system/20250821-210930
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20250821130356.883553-1-raphael.gallais-pou%40foss.st.com
patch subject: [PATCH] drm/stm: ltdc: unify log system
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-r072-20250824 (https://download.01.org/0day-ci/archive/20250825/202508250637.nLxtkS26-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508250637.nLxtkS26-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/stm/ltdc.c:1150 ltdc_crtc_set_crc_source() warn: variable dereferenced before check 'crtc' (see line 1148)
drivers/gpu/drm/stm/ltdc.c:1174 ltdc_crtc_verify_crc_source() warn: variable dereferenced before check 'crtc' (see line 1172)

Old smatch warnings:
drivers/gpu/drm/stm/ltdc.c:937 ltdc_crtc_mode_set_nofb() warn: pm_runtime_get_sync() also returns 1 on success

vim +/crtc +1150 drivers/gpu/drm/stm/ltdc.c

b70fbfc7d5164a Thomas Zimmermann   2020-01-23  1142  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1143  static int ltdc_crtc_set_crc_source(struct drm_crtc *crtc, const char *source)
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1144  {
898a9e3f56db98 Raphael Gallais-Pou 2023-05-15  1145  	struct ltdc_device *ldev;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1146  	int ret;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1147  
fa2b2390600532 Raphael Gallais-Pou 2025-08-21 @1148  	drm_dbg_driver(crtc->dev, "\n");
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1149  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11 @1150  	if (!crtc)
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1151  		return -ENODEV;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1152  
898a9e3f56db98 Raphael Gallais-Pou 2023-05-15  1153  	ldev = crtc_to_ltdc(crtc);
898a9e3f56db98 Raphael Gallais-Pou 2023-05-15  1154  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1155  	if (source && strcmp(source, "auto") == 0) {
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1156  		ldev->crc_active = true;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1157  		ret = regmap_set_bits(ldev->regmap, LTDC_GCR, GCR_CRCEN);
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1158  	} else if (!source) {
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1159  		ldev->crc_active = false;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1160  		ret = regmap_clear_bits(ldev->regmap, LTDC_GCR, GCR_CRCEN);
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1161  	} else {
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1162  		ret = -EINVAL;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1163  	}
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1164  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1165  	ldev->crc_skip_count = 0;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1166  	return ret;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1167  }
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1168  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1169  static int ltdc_crtc_verify_crc_source(struct drm_crtc *crtc,
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1170  				       const char *source, size_t *values_cnt)
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1171  {
fa2b2390600532 Raphael Gallais-Pou 2025-08-21 @1172  	drm_dbg_driver(crtc->dev, "\n");
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1173  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11 @1174  	if (!crtc)
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1175  		return -ENODEV;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1176  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1177  	if (source && strcmp(source, "auto") != 0) {
fa2b2390600532 Raphael Gallais-Pou 2025-08-21  1178  		drm_dbg_driver(crtc->dev, "Unknown CRC source %s for %s\n",
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1179  			       source, crtc->name);
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1180  		return -EINVAL;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1181  	}
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1182  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1183  	*values_cnt = 1;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1184  	return 0;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1185  }
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1186  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
