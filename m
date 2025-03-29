Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E3941C85
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Mar 2025 11:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743249329; cv=none; b=YrYsTGcV6S7dW/tXg9Pj79cjZA86e6oibLxJkoHWrrJVlZUmMo5ObP+OhFE9MbZ6/Xaj5VKb3FCeqt9/YHuNphnrDlaVv7wpjuI9eNHXaGPGxaDpRh7G+srTfmn6yFDGw7hDCA+nU6dm9J5FPtAMpjSEs2wzAoSjem3Hw+YpTf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743249329; c=relaxed/simple;
	bh=4TT/fjhVgIyJIqA8EaxLnTtCcVf/478OoskkYRNKIjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TLHNVbIfDot/luwrcdjRiYJDtpfwM2id4Cdr30f8+FKvJIUqqho+FIpaC3VWRivl45DErF/3Uem2lmVakNiJAOverpMcQX11TJ6S+xbV2PzJmuG8+svC7c9gfK3CvsYybELAK3lLbpknfh/pghojs8EOd+azl1NAfdJwQRIcyBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bwyg/O2H; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bwyg/O2H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743249327; x=1774785327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4TT/fjhVgIyJIqA8EaxLnTtCcVf/478OoskkYRNKIjM=;
  b=bwyg/O2HkziynfFhHJ0NffI8x8bubOWY+rI7Sz0rIKYZ0wiFunv15Yra
   jEpjnXAZZzTnGE/VuDBDGdXZrWsqqIOQbaHdp+zACTkdpgjUBKWE4fz0B
   nfGdHC1//4I9w87nM/njwc2Imcywb4DB6d6Pe/H7BHJiU04nzB3LqGQ2K
   uTZ9A7YR2z4MUGAtEePFxxxN0NdOOS1RXz0P8LBfCoacfd0egsR7sEQht
   Prydd4xtMTtA5nAWvQbxOhTIf2mBGwJJsTZNj8Wd73mL7PCEesvAUEfZw
   qB8SaX+ZaHFDIVw0NEcGDRZqirNNduhq6A+rsZc3etYdo1A6rmhkXRPeR
   w==;
X-CSE-ConnectionGUID: MNCkaSS4QM6/WOaM7ZA7Eg==
X-CSE-MsgGUID: 2quzfEp4RNKBort0mLmwyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="48383414"
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="48383414"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 04:55:27 -0700
X-CSE-ConnectionGUID: Epn48A1CS2OD72HkaN647A==
X-CSE-MsgGUID: dSqA1N/+QbuKFBTWWcqesg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="156664962"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 29 Mar 2025 04:55:25 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyUmZ-00085O-1V;
	Sat, 29 Mar 2025 11:55:23 +0000
Date: Sat, 29 Mar 2025 19:54:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] arm64: dts: add imx8mp-libra-rdk-fpsc LVDS panel
 overlay
Message-ID: <202503291909.G5LSDZf0-lkp@intel.com>
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
In-Reply-To: <20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-3-28324c7f81fa@phytec.de>
References: <20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-3-28324c7f81fa@phytec.de>
TO: Yannic Moog <y.moog@phytec.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
CC: upstream@lists.phytec.de
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: Benjamin Hahn <b.hahn@phytec.de>
CC: Jan Remmet <j.remmet@phytec.de>
CC: Teresa Remmet <t.remmet@phytec.de>
CC: Yashwanth Varakala <y.varakala@phytec.de>
CC: Yannic Moog <y.moog@phytec.de>

Hi Yannic,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 90453dc4dee29b96b9162895f45776bc25526e07]

url:    https://github.com/intel-lab-lkp/linux/commits/Yannic-Moog/dt-bindings-add-imx8mp-libra-rdk-fpsc/20250328-210746
base:   90453dc4dee29b96b9162895f45776bc25526e07
patch link:    https://lore.kernel.org/r/20250328-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v1-3-28324c7f81fa%40phytec.de
patch subject: [PATCH 3/3] arm64: dts: add imx8mp-libra-rdk-fpsc LVDS panel overlay
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: arm64-randconfig-051-20250329 (https://download.01.org/0day-ci/archive/20250329/202503291909.G5LSDZf0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503291909.G5LSDZf0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503291909.G5LSDZf0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds.dtb: clock-controller@30e20000: clocks: [[2, 284], [2, 123], [2, 124], [2, 125], [2, 127], [2, 128], [2, 182], [2, 321]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds.dtb: clock-controller@30e20000: clock-names: ['ahb', 'sai1', 'sai2', 'sai3', 'sai5', 'sai6', 'sai7', 'axi'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/imx8mp-audiomix.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
