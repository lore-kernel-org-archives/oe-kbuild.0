Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F2A15DBC1
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Jul 2025 21:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751663383; cv=none; b=aQa+9jeZoZJR8XrNhlhlrwa3AIQKDIpRMiLkwWaIx962+eccKCubrvvP8iLFSKNPTOcq3WC7g6nCjoDoObYCCwyfy0HeICoLssRDhLp44qM7bLnvq5RYoNOpz6yJ3U4r0Ca1HpKscRAHGaRGkcorV9LNqbhN7p3dSHEwVaUF8X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751663383; c=relaxed/simple;
	bh=Ks7m2MuHnJHJQx11EDAoPhif9ZbKGNmADaOvZfFHInQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VAnVs3TV+nGmMizjI6VbGczLQ3r2cT0N6a3h/PuBzGMjATl810nW9NESPIUqwQJ/YslHQ8asE/BLFwKlegT3nbu6f9WMDAUnHCFsQzzkdUjDfgXV5lFgm0G7enqBsrnBLj0ucLGM2XCrPkG4WmWKmva6Tsr8oS2E3DsCFNerDso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jn/xHOgV; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jn/xHOgV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751663382; x=1783199382;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Ks7m2MuHnJHJQx11EDAoPhif9ZbKGNmADaOvZfFHInQ=;
  b=Jn/xHOgVcbhPoBNL/dlhOYl89cL/9UrhfEtIj7g1vTbSIQcP19vhj0tD
   mTBUT9hACNsW3YQ8U8enHU129zcryhzxTCypzcRLsw/xNebe1vVsfCb2B
   ZQxypVDfSwOuHPawO+l7nHHBTGdSOeKQ98x+o5EinuP1O4G6Sxnd90QVG
   EvfEsX7/Tg6qxvfREkWPwVddIMkVdKQPiYp2H3W30Mq8p1VpmDY9qWgU0
   91E+o8xfJPySNgOWMZHTPGtig197Ujxg+RVJ3Fxw1nfVbN1259XrLun2O
   8dE7TNX249ITVqyeFFEpKDsKwar1ctqflF/GjejqoDGVrT+LlN+ulTATx
   g==;
X-CSE-ConnectionGUID: Y/eyNKKRS7mg+1olaR/MFA==
X-CSE-MsgGUID: QGbe5Jl6S2KgFGeXNeIdWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="53858334"
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="53858334"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 14:09:41 -0700
X-CSE-ConnectionGUID: vqoF3+rHTpWbXI9NszhYMg==
X-CSE-MsgGUID: hyPbahHwSBqCvTELQNhQtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,288,1744095600"; 
   d="scan'208";a="160385065"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Jul 2025 14:09:41 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXnf8-00044o-1Z;
	Fri, 04 Jul 2025 21:09:38 +0000
Date: Sat, 5 Jul 2025 05:09:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: gpio: Create a trivial GPIO schema
Message-ID: <202507050401.oWkQKXOC-lkp@intel.com>
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
In-Reply-To: <20250701225355.2977294-1-robh@kernel.org>
References: <20250701225355.2977294-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "Marek Behún" <kabel@kernel.org>
TO: Keguang Zhang <keguang.zhang@gmail.com>
TO: Heiko Stuebner <heiko@sntech.de>
TO: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-mips@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brgl/gpio/for-next]
[also build test WARNING on linus/master v6.16-rc4 next-20250704]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-gpio-Create-a-trivial-GPIO-schema/20250702-065536
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20250701225355.2977294-1-robh%40kernel.org
patch subject: [PATCH] dt-bindings: gpio: Create a trivial GPIO schema
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-051-20250702 (https://download.01.org/0day-ci/archive/20250705/202507050401.oWkQKXOC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507050401.oWkQKXOC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507050401.oWkQKXOC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:907.28-915.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
   arch/arm/boot/dts/nxp/imx/imx6dl-ts4900.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6dl-ts4900.dtb: gpio@28 (technologic,ts4900-gpio): 'ngpio' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-ts4900.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6dl-ts4900.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-ts4900.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:907.28-915.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
   arch/arm/boot/dts/nxp/imx/imx6q-ts4900.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-ts4900.dtb: gpio@28 (technologic,ts4900-gpio): 'ngpio' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-gpio.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-ts4900.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6q-ts4900.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-ts4900.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-ts4900.dtb: cpu@2 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-ts4900.dtb: cpu@3 (arm,cortex-a9): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'pu-supply', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
