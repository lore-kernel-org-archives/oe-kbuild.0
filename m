Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F433260563
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Aug 2025 04:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755490223; cv=none; b=c9qGjp2OcU8Ckwnji8iW7RLu4l35+EFfiFBWUAnnsGEnsi+Ebau5FJJ31iFEtxM2wKjtXA/0oXxhRMcvs/vbF/zNyYbzaV4lLzfRP3BcfScp4WN0iRpHbN67bO/1V4X0P6cVI3Z+7uzvPPps6we5zZx7MnRzbPKH9koLyYy4iH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755490223; c=relaxed/simple;
	bh=K1Yb6okYwME8LhAmvcvwdSel4ArhJyTdHFSoLsC+PJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lJQ6YSD4A1gcEdIFT4TT33Rt8KnHQzDGy/SKStxIMjFosBGQ7upAr/2pHMARAdLEKXvHRBlyG3sDWrsFfHKKonpCpXmtaSy+/YaDjtXoaW2FA2zozq3Fr9EWchyGmsy51PoZZxsh14C7vARpOkgSecgl9Fdt4/cnfDTnr7TaXzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SS8KZIDW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SS8KZIDW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755490222; x=1787026222;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=K1Yb6okYwME8LhAmvcvwdSel4ArhJyTdHFSoLsC+PJQ=;
  b=SS8KZIDWXXJGroJwEfVpC/Eaan/sFI3ReBhmF7mjgfJnrSGO28cN1Cgg
   YkQiNdLKjXpNsyO5Sc9RC23bTh0KoXp/O8o/GTuMif2jnxTSinRCabeqc
   hWQxRQ+omTmveMVvy8dLulW1r+i79TcXoM4t6rwxyFCWO3W6oPRNK5PEq
   3lgxrCUCLMuXuZOcM0OgFmbF56XfP4YO1xx7qSAvpi6/LppPezfXGHDuY
   tZ3PsKDqt6wo/0w7lYR9uUQzzvHQE1YRafM/0XdS0WupfQFtqBj/vuWL3
   ql80Nb2oQBqOY3c3lDkCiYN8ZWcG0foMj/Zi7VjhJIcuY70C1wkG3iMYN
   g==;
X-CSE-ConnectionGUID: o5JQOSVtRnad8P3qXW29xg==
X-CSE-MsgGUID: vAOmcgbRR4+V6rkJM4T10A==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="68796654"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68796654"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 21:10:21 -0700
X-CSE-ConnectionGUID: OV/L525uTZKHgfKS0IHi0Q==
X-CSE-MsgGUID: DCpajj4DSn+hZ4IjzqAbyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167085514"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 17 Aug 2025 21:10:20 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unrCL-000DuF-22;
	Mon, 18 Aug 2025 04:10:17 +0000
Date: Mon, 18 Aug 2025 12:10:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] ARM: dts: imx6ul-tx6ul: Switch away from deprecated
 `phy-reset-gpios`
Message-ID: <202508181124.CdoFWn5c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250815-b4-tx6ul-dt-phy-rst-v1-1-9b65e315d9d3@prolan.hu>
References: <20250815-b4-tx6ul-dt-phy-rst-v1-1-9b65e315d9d3@prolan.hu>
TO: "Bence Csókás" <csokas.bence@prolan.hu>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Csaba Buday <buday.csaba@prolan.hu>
CC: "Bence Csókás" <csokas.bence@prolan.hu>

Hi Bence,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0cc53520e68bea7fb80fdc6bdf8d226d1b6a98d9]

url:    https://github.com/intel-lab-lkp/linux/commits/Bence-Cs-k-s/ARM-dts-imx6ul-tx6ul-Switch-away-from-deprecated-phy-reset-gpios/20250815-231955
base:   0cc53520e68bea7fb80fdc6bdf8d226d1b6a98d9
patch link:    https://lore.kernel.org/r/20250815-b4-tx6ul-dt-phy-rst-v1-1-9b65e315d9d3%40prolan.hu
patch subject: [PATCH] ARM: dts: imx6ul-tx6ul: Switch away from deprecated `phy-reset-gpios`
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-051-20250816 (https://download.01.org/0day-ci/archive/20250818/202508181124.CdoFWn5c-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508181124.CdoFWn5c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508181124.CdoFWn5c-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: / (karo,imx6ul-tx6ul): i2c-gpio: {'compatible': ['i2c-gpio'], '#address-cells': 1, '#size-cells': 0, 'pinctrl-names': ['default'], 'pinctrl-0': [[68]], 'sda-gpios': [[48, 1, 0]], 'scl-gpios': [[48, 0, 0]], 'clock-frequency': 400000, 'status': ['okay'], 'rtc@68': {'compatible': ['dallas,ds1339'], 'reg': [[104]], 'status': ['disabled']}} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-on-flash-bbt' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: ethernet-phy@0 (ethernet-phy-ieee802.3-c22): 'resets' is a dependency of 'reset-names'
   	from schema $id: http://devicetree.org/schemas/reset/reset.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: /soc/bus@2100000/i2c@21a4000/polytouch@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: touchscreen@48 (ti,tsc2007): 'wakeup-source' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): 'disp0' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): display: False schema does not allow [[61]]
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
   arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: lcdif@21c8000 (fsl,imx6ul-lcdif): lcd-supply: False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
