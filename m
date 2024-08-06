Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D31917623C
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Aug 2024 23:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722986869; cv=none; b=YhYJzQweXu5TrOu6tbLwvIPDI6WKxY8MnvoOxgokIeEBtW5CK+Iboxn1kVeInYQJ4i7Ouh5XdK7gTSJ36b9e0gjxS9t2GVE0CO2nZ3uTh19bJD2ZeIZnDlJ0wlFP5KD63x/m6Ae6zbRbT7k72epHzH2rQaM6jUAYOCxFqNeRctI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722986869; c=relaxed/simple;
	bh=jzAZ7VPFgc7D5WBKNqrg0iA0R63aqSn4r6bDJjSSNuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eJI1/LamEV8E5nAGP+c+WFt5cASH5iBnmVvsE85rtJHfsrKS9b1w3jYFjjsVdQx8kn3jfKCMPNRJxOxAgktqCy8mCBm3Scc+Y2ryPleY/hHwo9GE1f+EOBuGEzPmOy8MuXzJW3Qf+5HCr9MYSjmGPYX5GczsScWX3KIRhmmsPm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ef6p9Nng; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ef6p9Nng"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722986867; x=1754522867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jzAZ7VPFgc7D5WBKNqrg0iA0R63aqSn4r6bDJjSSNuU=;
  b=Ef6p9Nngj9CUvmKQsojPpzZDdK4Q5Kv5ylfRvjIBCNlS1eEnX8XBov2m
   TagE1ZognYIl8e7UqE9R0xBVxs6CJdLuCC4QkziO+8eLgLpcdRLr729io
   aLRWgw+W8PYdOkSuHNG8YvLe1x4onDHwH4Hw7hjmZeUxW+JJUKg7GpS7l
   tjpM741/hDDt28pxpWzV/Fb3YbgEaPHbewRuB6WU76l4DiSDZ6zt10e9T
   ZgfsmLGmD7MpGwwGNSbu523MNUM/Pl/638NCXayMsPaP5f+X5b41e25md
   boopVSD49WSfWEbZVCo+a70C6oaJQ6/aDcnyKDI6hqZUh7+ZTKYXWhaWx
   Q==;
X-CSE-ConnectionGUID: hSw3hQTZT6Ge4JnTsRmC6w==
X-CSE-MsgGUID: YdHJNy2ETfi+A887apz64w==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="24826071"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="24826071"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 16:27:46 -0700
X-CSE-ConnectionGUID: WPT2Kn5oTiKJK73GFcnGfw==
X-CSE-MsgGUID: +gno0WERQTuseDWpV/F8LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="56523168"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 06 Aug 2024 16:27:45 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbTah-0004uW-0C;
	Tue, 06 Aug 2024 23:27:43 +0000
Date: Wed, 7 Aug 2024 07:26:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 9/9] arm64: dts: imx8mm-phygate: fix typo pinctrcl-0
Message-ID: <202408070701.y1IxKWsj-lkp@intel.com>
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
In-Reply-To: <20240805-fsl_dts_warning-v1-9-055653dd5c96@nxp.com>
References: <20240805-fsl_dts_warning-v1-9-055653dd5c96@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: imx@lists.linux.dev
CC: Frank Li <Frank.Li@nxp.com>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8400291e289ee6b2bf9779ff1c83a291501f017b]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/arm64-dts-layerscape-use-short-name-about-thermal-zone/20240806-002036
base:   8400291e289ee6b2bf9779ff1c83a291501f017b
patch link:    https://lore.kernel.org/r/20240805-fsl_dts_warning-v1-9-055653dd5c96%40nxp.com
patch subject: [PATCH 9/9] arm64: dts: imx8mm-phygate: fix typo pinctrcl-0
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: arm64-randconfig-051-20240806 (https://download.01.org/0day-ci/archive/20240807/202408070701.y1IxKWsj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408070701.y1IxKWsj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408070701.y1IxKWsj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs232.dtb: gpio@30220000: 'uart4_rs485_en' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/fsl-imx-gpio.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs232.dtb: uart4_rs485_en: $nodename:0: 'uart4_rs485_en' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
--
>> arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs485.dtb: gpio@30220000: 'uart4_rs485_en' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/fsl-imx-gpio.yaml#
   arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs485.dtb: uart4_rs485_en: $nodename:0: 'uart4_rs485_en' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
