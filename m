Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7CD30C371
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Oct 2025 16:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760632947; cv=none; b=ea6RFS+mb7QWO4r67cJgs/oVS42FhOlXMSAcLB7LdUB7aCaBng3Q/n+i6Ew0Jic8Swl1Nl6XhcQ04J8/5DVsefHGM+QPodwZDqvKvqtRMYGa50YhnH7fs9zTj5VxbOfIL2zNMaKReJ8/57RgwUT05jeNgzaHd18oogd4CvxNg/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760632947; c=relaxed/simple;
	bh=9x8SkHO58JnoMtQxlYUSRhrr7DMXe2owybDIhbmeBPc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RW/BTVgqOgnI3+y1B4VVaZ6yVy7662+Nfq1QKFS39QVDRadxz4EG1D9fJorU9hia62pJMem+oLxLu59tmYxQrUCmXOnFKly3xySxe2aCSHnUwNpuuQ9YWwCdGWdRRdwK7ZrpirC8XuBc4/DbfmC4+mUDkItc5pjxmostGxCl94A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PO0hHhEf; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PO0hHhEf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760632945; x=1792168945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9x8SkHO58JnoMtQxlYUSRhrr7DMXe2owybDIhbmeBPc=;
  b=PO0hHhEfS/Xz/XyTh+K1XROB9PtnSBpO/0Tt3UpSqg8rOzX12sxZ23Kd
   TwOimAEkAmOgIK9q6dIPRbrncM68QvQZ/DAu4RTUNCcA95y6HQozXv47M
   iKrNr3I2+JQQju3/q4ukKOnQmVMewFbe9Yck2NHE0WCWwterZB2I6WEqn
   BMQ3/vWJlCewWEqgpu20qYwglNYakiy3osQeBNDgX9ubAlsDLkj8xe9cA
   IuWnZb/X++nKuzR1ZZg3WLzRXUQH4qeQ+zPbF96YbaX9Ty1l1JUn7BC9O
   HeNDK1XN4yg1vnts3iuv/0sfmWK6/VyEr2uHzxEr07WcA+u8mDCEx3UF1
   Q==;
X-CSE-ConnectionGUID: 3e4TZeDsR7O1ncw/lcT9UQ==
X-CSE-MsgGUID: riyIufQ0S3uvpd7BDyW7Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62736853"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="62736853"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 09:42:25 -0700
X-CSE-ConnectionGUID: 4PSSu/9MRmO/Lo5yG/d0bQ==
X-CSE-MsgGUID: OASLyKv4QhGKhQI5y5RLEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="182185779"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 16 Oct 2025 09:42:23 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9R3S-000533-25;
	Thu, 16 Oct 2025 16:42:19 +0000
Date: Fri, 17 Oct 2025 00:42:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/8] ARM: dts: imx6qdl-skov-cpu fix typo interrupt
Message-ID: <202510170017.MFLBsqtp-lkp@intel.com>
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
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-052-20251016 (https://download.01.org/0day-ci/archive/20251017/202510170017.MFLBsqtp-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510170017.MFLBsqtp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510170017.MFLBsqtp-lkp@intel.com/

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
