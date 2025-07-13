Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAFA3FB1B
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Jul 2025 11:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752405275; cv=none; b=ALVlieWQhyvEVRE2Arfu5AvP+/kdiwcmUHIGebMQIzl+qU5JjVb7Nj14wDt7dW2/icQj4cCCYvSMKqE3mlNgpUcmHMJvTz6zqSLtIm0rmHWfMBjBpWXIHJ+rZgzZmMn569/ebz13PI/R+lPk31BUs5hu+vD3+D+yVN6+QWUwo4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752405275; c=relaxed/simple;
	bh=OMKGLsLQw1kaWyVfyMHSN6ZUJHBvO9Ey+65N6V9JHM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F8XDTLoid0L+AB6ry8yOQvqbDszd12+ybRCn5OVthV0MS5ms6PbSv9CznIWVxrfXtsy5TjzQUK9WqTtu+pbaEX/lV21rfcLx+2Jwpea+I5fK9NZflCZvuwzM8NNWsKqfnTtlUkSjybgI4c/w7tDistuNkUzH2mwiQkE77S0o+Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bS4uZ19W; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bS4uZ19W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752405273; x=1783941273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OMKGLsLQw1kaWyVfyMHSN6ZUJHBvO9Ey+65N6V9JHM0=;
  b=bS4uZ19WMeac8pYf3AKlZAlhI7aGTM32vcnVoRPX2PpfJkcnqa+z9SRO
   oOcU8l9rBNrSGjfjbLsYB+WPa1jM65A5xVbK9sZETgkyKyt2b1vu5BlWW
   ilAXFFaF79krp/+Z/A8ls3T98Uks2j61a0uFNGGi9eE9+4RVg9al3Eutd
   D/MKoaM9taaAZ1bGsCZ2BanPl5c2bnNncSUXP0ZpXJax9kqsaCUOlENpd
   mQSbQlgkMkhMSgqMRKS00OEZ5P/yuVQZC3WpadO1AtdEWcDyksQK/+wdq
   6VvEAO1owbCz95ucgqBNMsawPVoIapB5+3xnOT3ODKmWxwjsaGD2G0eJ6
   g==;
X-CSE-ConnectionGUID: 6qmuLHbSSSCj463jMjOdSw==
X-CSE-MsgGUID: iagKF361TQmqsjhcNCl8rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54561491"
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="54561491"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2025 04:14:32 -0700
X-CSE-ConnectionGUID: 9/23T8sBQJyHiyvdXP350w==
X-CSE-MsgGUID: ND6QD1CKR0291wgqNwfvlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,308,1744095600"; 
   d="scan'208";a="187706026"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jul 2025 04:14:31 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uauf7-000835-0A;
	Sun, 13 Jul 2025 11:14:29 +0000
Date: Sun, 13 Jul 2025 19:13:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [shawnguo:imx/dt64 71/85]
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: jpegdec@4c500000
 (nxp,imx95-jpgdec): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202507131950.TFLs4B3A-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
TO: Frank Li <Frank.Li@nxp.com>
CC: Shawn Guo <shawnguo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/dt64
head:   4f25d7f1439f12233768dce853260b8302424d16
commit: 153c039a73572752efa0035a49b8f2af8ef3aadc [71/85] arm64: dts: imx95: add jpeg encode and decode nodes
:::::: branch date: 10 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-054-20250712 (https://download.01.org/0day-ci/archive/20250713/202507131950.TFLs4B3A-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250713/202507131950.TFLs4B3A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507131950.TFLs4B3A-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
   arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
   arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: jpegdec@4c500000 (nxp,imx95-jpgdec): compatible: 'oneOf' conditional failed, one must be fixed:
   	'nxp,imx95-jpgdec' is not one of ['nxp,imx8qxp-jpgdec', 'nxp,imx8qxp-jpgenc']
   	'nxp,imx8qm-jpgdec' was expected
   	'nxp,imx8qm-jpgenc' was expected
   	'nxp,imx8qxp-jpgenc' was expected
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: jpegdec@4c500000 (nxp,imx95-jpgdec): power-domains: [[69, 21]] is too short
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: /soc/jpegdec@4c500000: failed to match any schema with compatible: ['nxp,imx95-jpgdec', 'nxp,imx8qxp-jpgdec']
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: jpegenc@4c550000 (nxp,imx95-jpgenc): compatible: 'oneOf' conditional failed, one must be fixed:
   	'nxp,imx95-jpgenc' is not one of ['nxp,imx8qxp-jpgdec', 'nxp,imx8qxp-jpgenc']
   	'nxp,imx8qm-jpgdec' was expected
   	'nxp,imx8qm-jpgenc' was expected
   	'nxp,imx8qxp-jpgdec' was expected
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: jpegenc@4c550000 (nxp,imx95-jpgenc): power-domains: [[69, 21]] is too short
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb: /soc/jpegenc@4c550000: failed to match any schema with compatible: ['nxp,imx95-jpgenc', 'nxp,imx8qxp-jpgenc']
--
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: jpegdec@4c500000 (nxp,imx95-jpgdec): compatible: 'oneOf' conditional failed, one must be fixed:
   	'nxp,imx95-jpgdec' is not one of ['nxp,imx8qxp-jpgdec', 'nxp,imx8qxp-jpgenc']
   	'nxp,imx8qm-jpgdec' was expected
   	'nxp,imx8qm-jpgenc' was expected
   	'nxp,imx8qxp-jpgenc' was expected
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: jpegdec@4c500000 (nxp,imx95-jpgdec): power-domains: [[73, 21]] is too short
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: /soc/jpegdec@4c500000: failed to match any schema with compatible: ['nxp,imx95-jpgdec', 'nxp,imx8qxp-jpgdec']
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: jpegenc@4c550000 (nxp,imx95-jpgenc): compatible: 'oneOf' conditional failed, one must be fixed:
   	'nxp,imx95-jpgenc' is not one of ['nxp,imx8qxp-jpgdec', 'nxp,imx8qxp-jpgenc']
   	'nxp,imx8qm-jpgdec' was expected
   	'nxp,imx8qm-jpgenc' was expected
   	'nxp,imx8qxp-jpgdec' was expected
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: jpegenc@4c550000 (nxp,imx95-jpgenc): power-domains: [[73, 21]] is too short
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: /soc/jpegenc@4c550000: failed to match any schema with compatible: ['nxp,imx95-jpgenc', 'nxp,imx8qxp-jpgenc']
--
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts:54.18-57.4: Warning (unique_unit_address_if_enabled): /memory@80000000: duplicate unit-address (also used in node /cm7-cpu@80000000)
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: jpegdec@4c500000 (nxp,imx95-jpgdec): compatible: 'oneOf' conditional failed, one must be fixed:
   	'nxp,imx95-jpgdec' is not one of ['nxp,imx8qxp-jpgdec', 'nxp,imx8qxp-jpgenc']
   	'nxp,imx8qm-jpgdec' was expected
   	'nxp,imx8qm-jpgenc' was expected
   	'nxp,imx8qxp-jpgenc' was expected
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: jpegdec@4c500000 (nxp,imx95-jpgdec): power-domains: [[74, 21]] is too short
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: /soc/jpegdec@4c500000: failed to match any schema with compatible: ['nxp,imx95-jpgdec', 'nxp,imx8qxp-jpgdec']
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: jpegenc@4c550000 (nxp,imx95-jpgenc): compatible: 'oneOf' conditional failed, one must be fixed:
   	'nxp,imx95-jpgenc' is not one of ['nxp,imx8qxp-jpgdec', 'nxp,imx8qxp-jpgenc']
   	'nxp,imx8qm-jpgdec' was expected
   	'nxp,imx8qm-jpgenc' was expected
   	'nxp,imx8qxp-jpgdec' was expected
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: jpegenc@4c550000 (nxp,imx95-jpgenc): power-domains: [[74, 21]] is too short
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: /soc/jpegenc@4c550000: failed to match any schema with compatible: ['nxp,imx95-jpgenc', 'nxp,imx8qxp-jpgenc']
--
   arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi:276.9-288.5: Warning (graph_child_address): /soc/bus@42000000/i2c@42530000/dp-bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: scmi (arm,scmi): Unevaluated properties are not allowed ('linux,code' was unexpected)
   	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#
   arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: scmi (arm,scmi): Unevaluated properties are not allowed ('protocol@81', 'protocol@84' were unexpected)
   	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#
   arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: pcie@4c300000 (fsl,imx95-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
   arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: pcie@4c380000 (fsl,imx95-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: jpegdec@4c500000 (nxp,imx95-jpgdec): compatible: 'oneOf' conditional failed, one must be fixed:
   	'nxp,imx95-jpgdec' is not one of ['nxp,imx8qxp-jpgdec', 'nxp,imx8qxp-jpgenc']
   	'nxp,imx8qm-jpgdec' was expected
   	'nxp,imx8qm-jpgenc' was expected
   	'nxp,imx8qxp-jpgenc' was expected
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: jpegdec@4c500000 (nxp,imx95-jpgdec): power-domains: [[63, 21]] is too short
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: /soc/jpegdec@4c500000: failed to match any schema with compatible: ['nxp,imx95-jpgdec', 'nxp,imx8qxp-jpgdec']
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: jpegenc@4c550000 (nxp,imx95-jpgenc): compatible: 'oneOf' conditional failed, one must be fixed:
   	'nxp,imx95-jpgenc' is not one of ['nxp,imx8qxp-jpgdec', 'nxp,imx8qxp-jpgenc']
   	'nxp,imx8qm-jpgdec' was expected
   	'nxp,imx8qm-jpgenc' was expected
   	'nxp,imx8qxp-jpgdec' was expected
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: jpegenc@4c550000 (nxp,imx95-jpgenc): power-domains: [[63, 21]] is too short
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: /soc/jpegenc@4c550000: failed to match any schema with compatible: ['nxp,imx95-jpgenc', 'nxp,imx8qxp-jpgenc']
--
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
   arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: jpegdec@4c500000 (nxp,imx95-jpgdec): compatible: 'oneOf' conditional failed, one must be fixed:
   	'nxp,imx95-jpgdec' is not one of ['nxp,imx8qxp-jpgdec', 'nxp,imx8qxp-jpgenc']
   	'nxp,imx8qm-jpgdec' was expected
   	'nxp,imx8qm-jpgenc' was expected
   	'nxp,imx8qxp-jpgenc' was expected
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: jpegdec@4c500000 (nxp,imx95-jpgdec): power-domains: [[69, 21]] is too short
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: /soc/jpegdec@4c500000: failed to match any schema with compatible: ['nxp,imx95-jpgdec', 'nxp,imx8qxp-jpgdec']
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: jpegenc@4c550000 (nxp,imx95-jpgenc): compatible: 'oneOf' conditional failed, one must be fixed:
   	'nxp,imx95-jpgenc' is not one of ['nxp,imx8qxp-jpgdec', 'nxp,imx8qxp-jpgenc']
   	'nxp,imx8qm-jpgdec' was expected
   	'nxp,imx8qm-jpgenc' was expected
   	'nxp,imx8qxp-jpgdec' was expected
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: jpegenc@4c550000 (nxp,imx95-jpgenc): power-domains: [[69, 21]] is too short
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb: /soc/jpegenc@4c550000: failed to match any schema with compatible: ['nxp,imx95-jpgenc', 'nxp,imx8qxp-jpgenc']
--
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: jpegdec@4c500000 (nxp,imx95-jpgdec): compatible: 'oneOf' conditional failed, one must be fixed:
   	'nxp,imx95-jpgdec' is not one of ['nxp,imx8qxp-jpgdec', 'nxp,imx8qxp-jpgenc']
   	'nxp,imx8qm-jpgdec' was expected
   	'nxp,imx8qm-jpgenc' was expected
   	'nxp,imx8qxp-jpgenc' was expected
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: jpegdec@4c500000 (nxp,imx95-jpgdec): power-domains: [[73, 21]] is too short
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: /soc/jpegdec@4c500000: failed to match any schema with compatible: ['nxp,imx95-jpgdec', 'nxp,imx8qxp-jpgdec']
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: jpegenc@4c550000 (nxp,imx95-jpgenc): compatible: 'oneOf' conditional failed, one must be fixed:
   	'nxp,imx95-jpgenc' is not one of ['nxp,imx8qxp-jpgdec', 'nxp,imx8qxp-jpgenc']
   	'nxp,imx8qm-jpgdec' was expected
   	'nxp,imx8qm-jpgenc' was expected
   	'nxp,imx8qxp-jpgdec' was expected
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: jpegenc@4c550000 (nxp,imx95-jpgenc): power-domains: [[73, 21]] is too short
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie0-ep.dtb: /soc/jpegenc@4c550000: failed to match any schema with compatible: ['nxp,imx95-jpgenc', 'nxp,imx8qxp-jpgenc']
--
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): Unevaluated properties are not allowed ('fsl,phy-pcs-tx-deemph-3p5db-attenuation-db' was unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: phy@4c1f0040 (fsl,imx95-usb-phy): fsl,phy-pcs-tx-deemph-3p5db-attenuation-db: 17 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/property-units.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: jpegdec@4c500000 (nxp,imx95-jpgdec): compatible: 'oneOf' conditional failed, one must be fixed:
   	'nxp,imx95-jpgdec' is not one of ['nxp,imx8qxp-jpgdec', 'nxp,imx8qxp-jpgenc']
   	'nxp,imx8qm-jpgdec' was expected
   	'nxp,imx8qm-jpgenc' was expected
   	'nxp,imx8qxp-jpgenc' was expected
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: jpegdec@4c500000 (nxp,imx95-jpgdec): power-domains: [[73, 21]] is too short
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: /soc/jpegdec@4c500000: failed to match any schema with compatible: ['nxp,imx95-jpgdec', 'nxp,imx8qxp-jpgdec']
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: jpegenc@4c550000 (nxp,imx95-jpgenc): compatible: 'oneOf' conditional failed, one must be fixed:
   	'nxp,imx95-jpgenc' is not one of ['nxp,imx8qxp-jpgdec', 'nxp,imx8qxp-jpgenc']
   	'nxp,imx8qm-jpgdec' was expected
   	'nxp,imx8qm-jpgenc' was expected
   	'nxp,imx8qxp-jpgdec' was expected
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: jpegenc@4c550000 (nxp,imx95-jpgenc): power-domains: [[73, 21]] is too short
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk-pcie1-ep.dtb: /soc/jpegenc@4c550000: failed to match any schema with compatible: ['nxp,imx95-jpgenc', 'nxp,imx8qxp-jpgenc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
