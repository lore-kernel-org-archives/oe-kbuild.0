Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F80650276
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Oct 2025 10:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760782214; cv=none; b=jBGNS3aBpr+ZCa5/fma2J7X/XblvzBCACTQKW0bv5kdgVyEaC+QpCH/B/llcHoBcCX1wPH1hxH/Z9pnBfFO4Nbb7eRJoxrIvr3yFt7NPhRRQSiYCY01aQkAwpZpYj2ZWkm8lITMwp9ttq4vMTqiTnPynH7IqdFznUEGjbD2eFd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760782214; c=relaxed/simple;
	bh=jejTM2cfEOei0XPvlpDJ2Cs135JtTjAq+eJcTYFRat8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d+2Si5FQbucE0bmp8lxbL00jfOHSlq3vCXjg+6WaJuVrBOYy/nMN6ALf5i+6UM6rP0Xv0jD9llRR+ueGHkTMeszAZVKZnIqVt2MzxMjMvv1zr+Gve8+pN5WdrYTa85dFSHj2AAw8JUWwujVQje4zQovNDxNGmSlX/NQrTHwM6SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YO85XGEY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YO85XGEY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760782212; x=1792318212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jejTM2cfEOei0XPvlpDJ2Cs135JtTjAq+eJcTYFRat8=;
  b=YO85XGEYZDCAU9PqhYjqTkkP9lmDZPIWtcMv26rORmwGj3T62GFDueLa
   k8jNSRyh3fiA+w5WdY5ZgDWIkFc6OvvpiJwEyn/HGK4wcCjxrJ84pmh8L
   znDerzERm4ym5OKKQJDucyVs17KZz80IZuliL3w9U3jXHyd2XEiCdnz+C
   uOgSXcZsUjDmCo7mwf1msMMkNGpurj6ldc9dqqyrNy8rZV5eTOZZ9gIfR
   49s090QQ/GwdAnbmWN3Fmq40mO0YA9tGLqFmgQOEnNVN7D48PLgnn/N9q
   vms6WextjXGJMeheY2NTGPBz2+DrSmg6hU7pA0H+PGDeFm4G7kURt18wH
   g==;
X-CSE-ConnectionGUID: jc5s+akVRgetJsJcpHfX0Q==
X-CSE-MsgGUID: ntDD/b3oSlOC8WBAH0mtHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="66852498"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="66852498"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 03:10:12 -0700
X-CSE-ConnectionGUID: K1WjtU1uQoGpSlPS7dckkQ==
X-CSE-MsgGUID: /SmarG0sTxW420eudUOlYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="182887153"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 18 Oct 2025 03:10:11 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA3t3-0008D5-09;
	Sat, 18 Oct 2025 10:10:09 +0000
Date: Sat, 18 Oct 2025 18:09:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/8] ARM: dts: imx6qdl-skov-cpu fix typo interrupt
Message-ID: <202510181737.YpvLs7w5-lkp@intel.com>
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
In-Reply-To: <20251014-imx6_dts_clean_2-v1-3-508b36e5a3fd@nxp.com>
References: <20251014-imx6_dts_clean_2-v1-3-508b36e5a3fd@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: Christoph Niedermaier <cniedermaier@dh-electronics.com>
TO: Marek Vasut <marex@denx.de>
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: kernel@dh-electronics.com
CC: Frank Li <Frank.Li@nxp.com>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 13863a59e410cab46d26751941980dc8f088b9b3]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/ARM-dts-imx-add-power-supply-for-lcd-panel/20251015-034433
base:   13863a59e410cab46d26751941980dc8f088b9b3
patch link:    https://lore.kernel.org/r/20251014-imx6_dts_clean_2-v1-3-508b36e5a3fd%40nxp.com
patch subject: [PATCH 3/8] ARM: dts: imx6qdl-skov-cpu fix typo interrupt
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-052-20251016 (https://download.01.org/0day-ci/archive/20251018/202510181737.YpvLs7w5-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510181737.YpvLs7w5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510181737.YpvLs7w5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: clock-controller@20c4000 (fsl,imx6q-ccm): clock-names:0: 'osc' was expected
   	from schema $id: http://devicetree.org/schemas/clock/imx6q-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: clock-controller@20c4000 (fsl,imx6q-ccm): clock-names: ['enet_ref_pad'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx6q-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: clock-controller@20c4000 (fsl,imx6q-ccm): clocks: [[31]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx6q-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: switch@0 (microchip,ksz8873): pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: switch@0 (microchip,ksz8873): Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt6.dtb: clock-controller@20c4000 (fsl,imx6q-ccm): clock-names:0: 'osc' was expected
   	from schema $id: http://devicetree.org/schemas/clock/imx6q-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt6.dtb: clock-controller@20c4000 (fsl,imx6q-ccm): clock-names: ['enet_ref_pad'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx6q-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt6.dtb: clock-controller@20c4000 (fsl,imx6q-ccm): clocks: [[31]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx6q-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt6.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt6.dtb: switch@0 (microchip,ksz8873): pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt6.dtb: switch@0 (microchip,ksz8873): Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt2.dtb: clock-controller@20c4000 (fsl,imx6q-ccm): clock-names:0: 'osc' was expected
   	from schema $id: http://devicetree.org/schemas/clock/imx6q-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt2.dtb: clock-controller@20c4000 (fsl,imx6q-ccm): clock-names: ['enet_ref_pad'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx6q-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt2.dtb: clock-controller@20c4000 (fsl,imx6q-ccm): clocks: [[38]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx6q-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt2.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt2.dtb: switch@0 (microchip,ksz8873): pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt2.dtb: switch@0 (microchip,ksz8873): Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt6.dtb: clock-controller@20c4000 (fsl,imx6q-ccm): clock-names:0: 'osc' was expected
   	from schema $id: http://devicetree.org/schemas/clock/imx6q-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt6.dtb: clock-controller@20c4000 (fsl,imx6q-ccm): clock-names: ['enet_ref_pad'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx6q-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt6.dtb: clock-controller@20c4000 (fsl,imx6q-ccm): clocks: [[38]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx6q-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt6.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt6.dtb: switch@0 (microchip,ksz8873): pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-skov-revc-lt6.dtb: switch@0 (microchip,ksz8873): Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6q-skov-reve-mi1010ait-1cp1.dtb: clock-controller@20c4000 (fsl,imx6q-ccm): clock-names:0: 'osc' was expected
   	from schema $id: http://devicetree.org/schemas/clock/imx6q-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-reve-mi1010ait-1cp1.dtb: clock-controller@20c4000 (fsl,imx6q-ccm): clock-names: ['enet_ref_pad'] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx6q-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-reve-mi1010ait-1cp1.dtb: clock-controller@20c4000 (fsl,imx6q-ccm): clocks: [[37]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/imx6q-clock.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-reve-mi1010ait-1cp1.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-skov-reve-mi1010ait-1cp1.dtb: switch@0 (microchip,ksz8873): pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-skov-reve-mi1010ait-1cp1.dtb: switch@0 (microchip,ksz8873): Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
