Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C951DF728
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 09:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730970307; cv=none; b=CREz9kjLTDUWzDr2JR1/lD3ydcqCV4BSktkTrODx00Zm91RKQnyUmcWQQtVMgFc7zukK7/o6ihpqppmHVWhhwG2Ph1uVR6jYL1s9UwX2DL2jmMEfw7ynPmLudHVsMXBaRc1KTZ+3HXaI64CZH1naKCfXbwX9i6qzuglGuP1uQ+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730970307; c=relaxed/simple;
	bh=0pt9bgurEJEiAG3hY496J9aCxpi3cN2pTeAU/6WzvkM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OVpHaZ87zIaxBhmzGF9WiRzaCADbILDlWyfQxTNZQ33a1eh23m2nSpnpEP9YonIfjnkZrQcJLh5lBE/ryDpd0iI54wp2u2s7eJMXzo9hXih6+NVf1wzYBFEDe2iIvRdzD6LXc8hCxvDCLvZxRJCWsex3RBwbb0GT/2knewSxYb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ceC8vb0m; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ceC8vb0m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730970305; x=1762506305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0pt9bgurEJEiAG3hY496J9aCxpi3cN2pTeAU/6WzvkM=;
  b=ceC8vb0m5R6/7apokBSc911PrKF+0RXoxCaHSw2S0R8Y/BeMKAT49ftY
   NMJyugSYcjBzHWn9cNQuHlk/wuvZB6nLSecJYo//hWO2D4rRUFtDkJIGG
   nO75KEtvFrab8mBQYprFKUUhjYlx1QWxGsx+fvGAvrlpDWORU4WPSr29x
   rcPVawtiB8QpY8lBe/6VUt3tD9Zj+KYBUPnSEIb2ifxIxvoBL7/JU0Grs
   7B/NJ12Ka2QUHtDMk3BMYVWuPR8Pp/ttCFZLIkgDVtaqKjLPe2GiroH1q
   OMJ60sv32LhrmkT/69q6nUNXtJBSZFm565jG+Rpq9p5AZBcYjjl4YUMdl
   Q==;
X-CSE-ConnectionGUID: YONRHMivRgCttn6IrD3K1A==
X-CSE-MsgGUID: Di2kNbRwT/ShgO6ywEnl8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="41397847"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="41397847"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 01:05:05 -0800
X-CSE-ConnectionGUID: CDGNyGyMQGqehA28mH+Lpg==
X-CSE-MsgGUID: E/zny348RzuAapTcx2yqQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="89803010"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Nov 2024 01:05:04 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8yRp-000q2I-37;
	Thu, 07 Nov 2024 09:05:01 +0000
Date: Thu, 7 Nov 2024 17:04:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 3/3] arm64: dts: imx8mp: add aristainetos3 board
 support
Message-ID: <202411071615.Mkb2BtsZ-lkp@intel.com>
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
In-Reply-To: <20241105064206.43626-4-hs@denx.de>
References: <20241105064206.43626-4-hs@denx.de>
TO: Heiko Schocher <hs@denx.de>
TO: linux-kernel@vger.kernel.org
CC: Heiko Schocher <hs@denx.de>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Fabio Estevam <festevam@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: Rob Herring <robh@kernel.org>
CC: Sascha Hauer <s.hauer@pengutronix.de>
CC: Shawn Guo <shawnguo2@yeah.net>
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org

Hi Heiko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linusw-pinctrl/devel linusw-pinctrl/for-next linus/master v6.12-rc6 next-20241106]
[cannot apply to shawnguo/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiko-Schocher/dt-bindings-arm-fsl-Add-ABB-SoM-and-carrier/20241105-144340
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241105064206.43626-4-hs%40denx.de
patch subject: [PATCH v3 3/3] arm64: dts: imx8mp: add aristainetos3 board support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20241106 (https://download.01.org/0day-ci/archive/20241107/202411071615.Mkb2BtsZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411071615.Mkb2BtsZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411071615.Mkb2BtsZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: /soc@0/bus@30800000/i2c@30a30000/tlc59108@40: failed to match any schema with compatible: ['ti,tlc59108']
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: serial@30a60000: rs485-rts-delay:0: 0 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/serial/fsl-imx-uart.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: serial@30a60000: rs485-rts-delay:1: 0 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/serial/fsl-imx-uart.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: serial@30a60000: Unevaluated properties are not allowed ('linux,rs485-enabled-at-boot-time', 'rs485-rts-active-low', 'rs485-rts-delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/fsl-imx-uart.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: pcie-ep@33800000: reg: [[864026624, 4194304], [402653184, 134217728]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb: pcie-ep@33800000: reg-names: ['dbi', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
