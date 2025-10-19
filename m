Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62E3AD4B
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Oct 2025 07:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760859480; cv=none; b=sSBjsy1VKc7qLDxGyFgfGtk28lZwL36P5Y69rImls0CQJz0GyEEbruowLKv8C/YBgSBv8s3VED8p9c6q6i6va/oNeHqGe2bi7YTiAsnGVW+49UsFbMy4kHObcYvuwcIBrKTq8QkRR9khyb0YsxEIx2gvaLJo3guJ9CXK5Yb8UGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760859480; c=relaxed/simple;
	bh=8SMBhJoedT3ueNPEyYSiaOJo1Zm19QMM6PtUfxDfP+0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ETLzNBm3rQFae7uU3ds6cJcN+oS8yDqYk2X3FCdKT0H/AyI6Et4yMqjCQUjYII1FeCsojjRaOdHVoHhH6JQlfIgfLPN0kDMcZMUtygfYaehfYB+raEya83CadcBcT7osvMWlYeyF9nMOn7XvhILGHuVzNfEPiY5jJw2+rMNuGlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lKGVwrUc; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lKGVwrUc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760859479; x=1792395479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8SMBhJoedT3ueNPEyYSiaOJo1Zm19QMM6PtUfxDfP+0=;
  b=lKGVwrUcDmoIC7GMpqJp6Fc+uU0r11IDeKJK683diLImAP4Ervqbk7qk
   d8He+xHH6RZc2tWcjot5A6/QJl5r08Rr3QJ9sq0rcidqiTXqTECXm+T+U
   wCiEHFpQT1RPZcnhZf1qHogxrQqOgR2A4yjdTMBtzUCQ9QkZohI+oWsU8
   UjELa4LcrkI8mhCbl8gy6rWAmGe3lNXLK+d491QyVt3WBBqu2fFnwWJ64
   TqHOUk30ByW8buL0cApdHz3GZNM8FWXqUnP4YI/Uy/FvU+XlQHW9CqYXt
   E7JMXAmXgw9TGi0OnIt13GSJTNjjeA+3VnTScPVW7bMhEZGsg//2iPGGN
   w==;
X-CSE-ConnectionGUID: gUJODnWuRB+mGJu2291+Dw==
X-CSE-MsgGUID: e4rQUpnaSW6n2PZCdTCnnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63057583"
X-IronPort-AV: E=Sophos;i="6.19,240,1754982000"; 
   d="scan'208";a="63057583"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 00:37:58 -0700
X-CSE-ConnectionGUID: XoS6zrL4QI+Vyp3W+EUhbg==
X-CSE-MsgGUID: EbUw97rPQwOzg1b+7vetFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,240,1754982000"; 
   d="scan'208";a="182269138"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 19 Oct 2025 00:37:58 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vANyb-0008vF-2Z;
	Sun, 19 Oct 2025 07:37:38 +0000
Date: Sun, 19 Oct 2025 15:36:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 7/8] ARM: dts: remove undocumented clock-names for ov5642
Message-ID: <202510191532.zHYrbUbn-lkp@intel.com>
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
In-Reply-To: <20251014-imx6_dts_clean_2-v1-7-508b36e5a3fd@nxp.com>
References: <20251014-imx6_dts_clean_2-v1-7-508b36e5a3fd@nxp.com>
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
patch link:    https://lore.kernel.org/r/20251014-imx6_dts_clean_2-v1-7-508b36e5a3fd%40nxp.com
patch subject: [PATCH 7/8] ARM: dts: remove undocumented clock-names for ov5642
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-052-20251016 (https://download.01.org/0day-ci/archive/20251019/202510191532.zHYrbUbn-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510191532.zHYrbUbn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510191532.zHYrbUbn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6dl-sabrelite.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu1_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-sabrelite.dtb: ethernet@2188000 (fsl,imx6q-fec): mdio: Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-sabrelite.dtb: ethernet@2188000 (fsl,imx6q-fec): Unevaluated properties are not allowed ('mdio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml#
   arch/arm/boot/dts/nxp/imx/imx6dl-sabrelite.dtb: ethernet-phy (ethernet-phy-ieee802.3-c22): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6dl-sabrelite.dtb: camera@42 (ovti,ov5642): 'gp-gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5642.yaml#
--
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:281.4-284.29: Warning (interrupt_map): /soc/pcie@1ffc000:interrupt-map: Missing property '#address-cells' in node /soc/bus@2000000/gpc@20dc000, using 0 as fallback
   arch/arm/boot/dts/nxp/imx/imx6q-sabrelite.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-sabrelite.dtb: ethernet@2188000 (fsl,imx6q-fec): mdio: Unevaluated properties are not allowed ('ethernet-phy' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-sabrelite.dtb: ethernet@2188000 (fsl,imx6q-fec): Unevaluated properties are not allowed ('mdio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fec.yaml#
   arch/arm/boot/dts/nxp/imx/imx6q-sabrelite.dtb: ethernet-phy (ethernet-phy-ieee802.3-c22): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6q-sabrelite.dtb: camera@42 (ovti,ov5642): 'gp-gpios' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5642.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
