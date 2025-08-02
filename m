Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DEF1F09A3
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Aug 2025 23:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754178238; cv=none; b=lNVgE4wHati0vxgrC/LLubda44pzXdjH9V56X8BYwH2kyll+kfUzcehzGusVsjNQEwito98mPJD/utdvemFBLiheK1JWQCQWhyzkflrdR4fSHQzRVXDHU5hWHU19Us39e+Fl3gvkaHFF9GMSx9HHQKGeNoWv4lhByUxszGwkEc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754178238; c=relaxed/simple;
	bh=mMJcRKuMSNHZzNLgmtpqcv9Y99FpE9XUHTwODGXaBiA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MA7HZ4WZnogWIGtMu7yBxUCy+4rgcI4DLUJcMr9MTehfvwwhd8M3XEFYE2wGqu6mK3Zo+xqi4B4OZroL3Tiz6rMR/UduvE+FfldIw4C8s2x2HjOnRe5cFKz30a7Ifp15OHGnkauE2FJacPgV5OnKkB00hg2yk+vIWnf5BgYTDFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bknbS+UY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bknbS+UY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754178237; x=1785714237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mMJcRKuMSNHZzNLgmtpqcv9Y99FpE9XUHTwODGXaBiA=;
  b=bknbS+UYqoOV0JRZG+i2Ww99X8YiwupyiqQE9P67DppQq4Yy1N6kxcdQ
   dDMj4xV09eXexvJSaeztpjHrCsqBSxXtnAQXbSczVgUONNr928z6MOTil
   1w8ibLpQekUuPEs5FU1OV+OGuJYAL8qzAECRZ9DSKabUSH4OVi0dfa3qI
   UzVqafyRulaTOXFVi1buw7g9Ggo57+1sF5XEIJ2tYD+Op6yicpR1ckQbV
   dSQqp/T/U24WpPjUnoyoQUc8kHUBjY9jhisUCB/G/n8pPXosNgihIBjTD
   pOmqPgOSEIsFJD9SWoampYtXjSEQohye6htvihMCzFQy0y9U5STtuut3P
   Q==;
X-CSE-ConnectionGUID: IXxUAlaeQ96yqa3gpAcMkA==
X-CSE-MsgGUID: wpVtHLSqT0e0LIQfOoiwrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="56374712"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56374712"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 16:43:56 -0700
X-CSE-ConnectionGUID: V1EI8d8ORpGlWEh063CB2g==
X-CSE-MsgGUID: OVk4DejyR+S0F4hdPRBkYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168064390"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Aug 2025 16:43:55 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiLtI-0005ee-1Y;
	Sat, 02 Aug 2025 23:43:52 +0000
Date: Sun, 3 Aug 2025 07:43:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mripard:drm/tidss/field-api 12/60]
 arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtb: lcd
 (lincolntech,lcd185-101ct): compatible: ['lincolntech,lcd185-101ct',
 'panel-simple'] is too long
Message-ID: <202508030737.boWPgSuV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Aradhya Bhatia <a-bhatia1@ti.com>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git drm/tidss/field-api
head:   8e7aa9647fd4168ea2115bb34ca99eade5b0c751
commit: 0a3beea5c650fcd3363683e7c5b7008de0a0bcbe [12/60] arm64: dts: ti: Add LincolnTech OLDI LCD-185 Overlay for AM625-BeaglePlay
:::::: branch date: 4 days ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-051-20250802 (https://download.01.org/0day-ci/archive/20250803/202508030737.boWPgSuV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250803/202508030737.boWPgSuV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508030737.boWPgSuV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtb: lcd (lincolntech,lcd185-101ct): compatible: ['lincolntech,lcd185-101ct', 'panel-simple'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtb: lcd (lincolntech,lcd185-101ct): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
   arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtb: lcd (lincolntech,lcd185-101ct): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-beagleplay-lincolntech-lcd185-panel.dtb: /lcd: failed to match any schema with compatible: ['lincolntech,lcd185-101ct', 'panel-simple']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
