Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB7820C49C
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Dec 2024 16:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733328139; cv=none; b=mqfO2Qcl6WzaJuD8cKo0OyktxsPVwvUwciWWs8UwKAIiGzcZd0c+3kwBENZdP4HcCyxTP8xQxFK8nnaksU+vajZWd6cCDp3ZTK4pjF6StXr5pBDNJrEOzQC+sle0FOoa/dYBCSSU59Y0EHUpmLAWQn1FJPxDYD3PgXzNUicosv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733328139; c=relaxed/simple;
	bh=6OZQ9v/W/MZJPT3zDsV3UkVxfyVe0YpAstbvPTiRcmc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tROhj5mbUGAhtWm3NknKN/zZbP5r8hr9TlIF3MrLFIC7z+gcIFgkUDePiRlWFUUgKlPDM4n5Pn/V8XbFyTZ2bMQNdyqsV9B7Ujw41absq7knr5ezgnVmpxhSD40whQlr8OM5hBdYcvx8UCR7Y290kZZULEdw+MflJaDdgL6UGrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QbLW+hlp; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbLW+hlp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733328137; x=1764864137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6OZQ9v/W/MZJPT3zDsV3UkVxfyVe0YpAstbvPTiRcmc=;
  b=QbLW+hlpW9rp2pezm70pVCY9EbQHT61NqDXzgk5joRIbsg9hx0zXmpGq
   Icafd7AjcRORKUbi3+iKHM+YAZoJiatafwcPkrL1nM6iSrQrns25gzEkn
   wjCS3B4PXX3D/egXOXm8S4iAsbhaZDpcjEBXY5xiqDfFp2V36BMR1qtgF
   dFTwVpLcJR+oXzAxg9idGsyqtGoTmTKXoxiZEXEyoN/C/YkGSloS1C2TY
   dGbcRtao14qoy0JlesPTrWQ72gTBS9jdwpKBbDtl2/jxR7dP06S1EOQni
   uxCHkDrBVhb7LzSAaVv/7uX7DBPgjFK/4FbnITtijpMcO3xiy/sqdiuzr
   g==;
X-CSE-ConnectionGUID: WPGyIiHhSuiYhLA6URHQ0w==
X-CSE-MsgGUID: rEc5EH0vTgKpoppG7aqwAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44632327"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44632327"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 08:02:17 -0800
X-CSE-ConnectionGUID: gy1v3qDRQ+OIgheOsHvOJg==
X-CSE-MsgGUID: xdiqc+dETJ+UhbFXvG8U+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="98785140"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 04 Dec 2024 08:02:16 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIrpN-0003EK-1z;
	Wed, 04 Dec 2024 16:02:13 +0000
Date: Thu, 5 Dec 2024 00:01:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-drivers:topic/renesas-overlays-v6.13-rc1 8/159]
 arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: thermal-zones:
 litcpu-reg-thermal:trips:phandle: 287 is not of type 'object'
Message-ID: <202412042353.sfhRnvPR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only scripts/Makefile.* file changed"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-renesas-soc@vger.kernel.org
TO: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git topic/renesas-overlays-v6.13-rc1
head:   a48936ee46cd2afd08e4b81aaae14c8e791fdfe6
commit: bcbede4b77f674b6140af1faaab0308872bc7136 [8/159] kbuild: Enable DT symbols when CONFIG_OF_OVERLAY is used
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: arm64-randconfig-052-20241204 (https://download.01.org/0day-ci/archive/20241204/202412042353.sfhRnvPR-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412042353.sfhRnvPR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412042353.sfhRnvPR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: pcie@0,0: wifi@0,0:interrupts:0: [8, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: usb@fe800000: 'extcon' does not match any of the regexes: '^usb@', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: usb@fe900000: 'extcon' does not match any of the regexes: '^usb@', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: thermal-zones: bigcpu-reg-thermal:trips:phandle: 283 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: thermal-zones: litcpu-reg-thermal:trips:phandle: 287 is not of type 'object'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: /sound: failed to match any schema with compatible: ['rockchip,rk3399-gru-sound']
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1608.20-1674.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl: i3c1_sda:i3c1_sdam1-pu:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl: pwm2:pwm2m1-ch1:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl: pwm2:pwm2m0-ch4:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl: pwm2:pwm2m1-ch5:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl: pwm2:pwm2m1-ch6:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl: pwm2:pwm2m1-ch0:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl: pwm2:pwm2m1-ch3:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl: pwm2:pwm2m0-ch2:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl: pwm2:pwm2m1-ch2:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl: pwm2:pwm2m0-ch3:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl: pwm0:pwm0m1-ch1:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl: i3c1:i3c1m1-xfer:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl: i3c1:i3c1m1-xfer:rockchip,pins:1:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pinctrl: pwm1:pwm1m1-ch5:rockchip,pins:0:2: 14 is greater than the maximum of 13
   	from schema $id: http://devicetree.org/schemas/pinctrl/rockchip,pinctrl.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
