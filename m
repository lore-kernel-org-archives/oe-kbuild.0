Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E46981AD2
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Sep 2024 05:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725601713; cv=none; b=LHY7mT/k6iNkRVCVQqqBKsuWGPo8NbNjVI4avpzqvtByxVpHcMNQaH6bp4JZz/wkj3gwa4rIl3LD7ZX6TIpei3tzF1mExkzK2VIQxvEE5Z3KVcUMCfoV8bf6ws4wsSCiempkzcuRmx8tZ229NZSP1Eqwki8DdL5L5hYy3PIrbaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725601713; c=relaxed/simple;
	bh=0lJza2a3PFsrHkDX6K4Czu8EoO9LS6b7eQhpgFGZvLI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YLvmRf/D/P6tUVQJ+Q5w6nJLdvzUGIgCIJ0N52jTuFlnmv7onmQwnZHiZk8TPajH0IsDzZfJNLfn3EE/bSOEjyqcEEn23BrxovrTTCE6yIxlVkATWmKbUkE94t3KiUtl/6QU0aKSMtIZWBRDCNnDmyc6Ps0ZL2gZgznLca7ntEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G5Eikcp+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G5Eikcp+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725601711; x=1757137711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0lJza2a3PFsrHkDX6K4Czu8EoO9LS6b7eQhpgFGZvLI=;
  b=G5Eikcp+rhwt6soOBNASAmfP3RExdRbhoB8tWljYZZipSDTwoA0Ymss5
   A51IrMEjqDfSBr7ImsaI+dye/uvi5nflFY3h3uiBUN0NAREJRNTSjyKfe
   U0i5d19iO2b8QO3/R+965Zt5BLCeDiqb19uH5uCkAkwXTgSEz5TN7o3JT
   BoEOTRKnDQtmeKmIFcDR1f9S4FoDqj0mOnwUmY3mXNztANw/4/pt+YaM1
   aKTWHQIIee5/2JaEMGqu566oN3ES+x8zbcSNEh/EQsaY8oBkW+ieVbiY4
   AD8cD8Q4lkezWKYEuhG4aWPd8zSh5nlhQNG1TF0janu9T7cnvPTHFxsL+
   w==;
X-CSE-ConnectionGUID: PWMaHfAKQnqwn1HxzuSFMw==
X-CSE-MsgGUID: T77xQARnT9GqAkZLTB9F5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24216759"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="24216759"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 22:48:28 -0700
X-CSE-ConnectionGUID: kYRISL5vRdazqrUIEYbpcQ==
X-CSE-MsgGUID: dtuXEPI9SA6aNYHg967QnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="65899077"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Sep 2024 22:48:26 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smRpY-000Aiz-1Y;
	Fri, 06 Sep 2024 05:48:24 +0000
Date: Fri, 6 Sep 2024 13:48:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [usb:usb-testing 29/42]
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: usbphy@5b100000: 'nxp,sim' is
 a required property
Message-ID: <202409061350.nYcn723w-lkp@intel.com>
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
CC: linux-usb@vger.kernel.org
TO: Xu Yang <xu.yang_2@nxp.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   9c0c11bb87b09a8b7cdc21ca1090e7b36abe9d09
commit: d40ae4cdd9a400dea9dff3408b8c8983c45e943f [29/42] dt-bindings: phy: mxs-usb-phy: add nxp,sim property
:::::: branch date: 15 hours ago
:::::: commit date: 3 days ago
config: arm64-randconfig-052-20240905 (https://download.01.org/0day-ci/archive/20240906/202409061350.nYcn723w-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev16+gc51125d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409061350.nYcn723w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409061350.nYcn723w-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: usbphy@5b100000: 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
   arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: dma-controller@5b810000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-dma-apbh', 'fsl,imx28-dma-apbh'] is too long
   	'fsl,imx8qxp-dma-apbh' is not one of ['fsl,imx6q-dma-apbh', 'fsl,imx6sx-dma-apbh', 'fsl,imx7d-dma-apbh']
   	'fsl,imx8qxp-dma-apbh' is not one of ['fsl,imx23-dma-apbh', 'fsl,imx23-dma-apbx', 'fsl,imx28-dma-apbh', 'fsl,imx28-dma-apbx']
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mxs-dma.yaml#
   arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: dma-controller@5b810000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mxs-dma.yaml#
   arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: /bus@5b000000/dma-controller@5b810000: failed to match any schema with compatible: ['fsl,imx8qxp-dma-apbh', 'fsl,imx28-dma-apbh']
--
   arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: jpegdec@58400000: 'slot' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
   arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: jpegenc@58450000: 'slot' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: usbphy@5b100000: 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
   arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: dma-controller@5b810000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-dma-apbh', 'fsl,imx28-dma-apbh'] is too long
   	'fsl,imx8qxp-dma-apbh' is not one of ['fsl,imx6q-dma-apbh', 'fsl,imx6sx-dma-apbh', 'fsl,imx7d-dma-apbh']
   	'fsl,imx8qxp-dma-apbh' is not one of ['fsl,imx23-dma-apbh', 'fsl,imx23-dma-apbx', 'fsl,imx28-dma-apbh', 'fsl,imx28-dma-apbx']
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mxs-dma.yaml#
   arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: dma-controller@5b810000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mxs-dma.yaml#
   arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dtb: /bus@5b000000/dma-controller@5b810000: failed to match any schema with compatible: ['fsl,imx8qxp-dma-apbh', 'fsl,imx28-dma-apbh']
--
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: jpegdec@58400000: 'slot' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: jpegenc@58450000: 'slot' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: usbphy@5b100000: 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: dma-controller@5b810000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-dma-apbh', 'fsl,imx28-dma-apbh'] is too long
   	'fsl,imx8qxp-dma-apbh' is not one of ['fsl,imx6q-dma-apbh', 'fsl,imx6sx-dma-apbh', 'fsl,imx7d-dma-apbh']
   	'fsl,imx8qxp-dma-apbh' is not one of ['fsl,imx23-dma-apbh', 'fsl,imx23-dma-apbx', 'fsl,imx28-dma-apbh', 'fsl,imx28-dma-apbx']
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mxs-dma.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: dma-controller@5b810000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mxs-dma.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: /bus@5b000000/dma-controller@5b810000: failed to match any schema with compatible: ['fsl,imx8qxp-dma-apbh', 'fsl,imx28-dma-apbh']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: /touchscreen: failed to match any schema with compatible: ['toradex,vf50-touchscreen']
--
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: jpegdec@58400000: 'slot' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: jpegenc@58450000: 'slot' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: usbphy@5b100000: 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: dma-controller@5b810000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-dma-apbh', 'fsl,imx28-dma-apbh'] is too long
   	'fsl,imx8qxp-dma-apbh' is not one of ['fsl,imx6q-dma-apbh', 'fsl,imx6sx-dma-apbh', 'fsl,imx7d-dma-apbh']
   	'fsl,imx8qxp-dma-apbh' is not one of ['fsl,imx23-dma-apbh', 'fsl,imx23-dma-apbx', 'fsl,imx28-dma-apbh', 'fsl,imx28-dma-apbx']
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mxs-dma.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: dma-controller@5b810000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mxs-dma.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: /bus@5b000000/dma-controller@5b810000: failed to match any schema with compatible: ['fsl,imx8qxp-dma-apbh', 'fsl,imx28-dma-apbh']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dtb: /touchscreen: failed to match any schema with compatible: ['toradex,vf50-touchscreen']
--
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: jpegdec@58400000: 'slot' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: jpegenc@58450000: 'slot' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: usbphy@5b100000: 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: dma-controller@5b810000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-dma-apbh', 'fsl,imx28-dma-apbh'] is too long
   	'fsl,imx8qxp-dma-apbh' is not one of ['fsl,imx6q-dma-apbh', 'fsl,imx6sx-dma-apbh', 'fsl,imx7d-dma-apbh']
   	'fsl,imx8qxp-dma-apbh' is not one of ['fsl,imx23-dma-apbh', 'fsl,imx23-dma-apbx', 'fsl,imx28-dma-apbh', 'fsl,imx28-dma-apbx']
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mxs-dma.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: dma-controller@5b810000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mxs-dma.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: /bus@5b000000/dma-controller@5b810000: failed to match any schema with compatible: ['fsl,imx8qxp-dma-apbh', 'fsl,imx28-dma-apbh']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-ixora-v1.1.dtb: /touchscreen: failed to match any schema with compatible: ['toradex,vf50-touchscreen']
--
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: jpegdec@58400000: 'slot' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: jpegenc@58450000: 'slot' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: usbphy@5b100000: 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: dma-controller@5b810000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-dma-apbh', 'fsl,imx28-dma-apbh'] is too long
   	'fsl,imx8qxp-dma-apbh' is not one of ['fsl,imx6q-dma-apbh', 'fsl,imx6sx-dma-apbh', 'fsl,imx7d-dma-apbh']
   	'fsl,imx8qxp-dma-apbh' is not one of ['fsl,imx23-dma-apbh', 'fsl,imx23-dma-apbx', 'fsl,imx28-dma-apbh', 'fsl,imx28-dma-apbx']
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mxs-dma.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: dma-controller@5b810000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mxs-dma.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: /bus@5b000000/dma-controller@5b810000: failed to match any schema with compatible: ['fsl,imx8qxp-dma-apbh', 'fsl,imx28-dma-apbh']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval.dtb: /touchscreen: failed to match any schema with compatible: ['toradex,vf50-touchscreen']
--
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: jpegdec@58400000: 'slot' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: jpegenc@58450000: 'slot' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: usbphy@5b100000: 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: dma-controller@5b810000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-dma-apbh', 'fsl,imx28-dma-apbh'] is too long
   	'fsl,imx8qxp-dma-apbh' is not one of ['fsl,imx6q-dma-apbh', 'fsl,imx6sx-dma-apbh', 'fsl,imx7d-dma-apbh']
   	'fsl,imx8qxp-dma-apbh' is not one of ['fsl,imx23-dma-apbh', 'fsl,imx23-dma-apbx', 'fsl,imx28-dma-apbh', 'fsl,imx28-dma-apbx']
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mxs-dma.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: dma-controller@5b810000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mxs-dma.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: /bus@5b000000/dma-controller@5b810000: failed to match any schema with compatible: ['fsl,imx8qxp-dma-apbh', 'fsl,imx28-dma-apbh']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dtb: /touchscreen: failed to match any schema with compatible: ['toradex,vf50-touchscreen']
--
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: jpegdec@58400000: 'slot' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: jpegenc@58450000: 'slot' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: usbphy@5b100000: 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: dma-controller@5b810000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-dma-apbh', 'fsl,imx28-dma-apbh'] is too long
   	'fsl,imx8qxp-dma-apbh' is not one of ['fsl,imx6q-dma-apbh', 'fsl,imx6sx-dma-apbh', 'fsl,imx7d-dma-apbh']
   	'fsl,imx8qxp-dma-apbh' is not one of ['fsl,imx23-dma-apbh', 'fsl,imx23-dma-apbx', 'fsl,imx28-dma-apbh', 'fsl,imx28-dma-apbx']
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mxs-dma.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: dma-controller@5b810000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mxs-dma.yaml#
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: /bus@5b000000/dma-controller@5b810000: failed to match any schema with compatible: ['fsl,imx8qxp-dma-apbh', 'fsl,imx28-dma-apbh']
   arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-ixora-v1.1.dtb: /touchscreen: failed to match any schema with compatible: ['toradex,vf50-touchscreen']
--
   arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: jpegdec@58400000: 'slot' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: jpegenc@58450000: 'slot' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#
>> arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: usbphy@5b100000: 'nxp,sim' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/fsl,mxs-usbphy.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: dma-controller@5b810000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx8qxp-dma-apbh', 'fsl,imx28-dma-apbh'] is too long
   	'fsl,imx8qxp-dma-apbh' is not one of ['fsl,imx6q-dma-apbh', 'fsl,imx6sx-dma-apbh', 'fsl,imx7d-dma-apbh']
   	'fsl,imx8qxp-dma-apbh' is not one of ['fsl,imx23-dma-apbh', 'fsl,imx23-dma-apbx', 'fsl,imx28-dma-apbh', 'fsl,imx28-dma-apbx']
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mxs-dma.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: dma-controller@5b810000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dma/fsl,mxs-dma.yaml#
   arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dtb: /bus@5b000000/dma-controller@5b810000: failed to match any schema with compatible: ['fsl,imx8qxp-dma-apbh', 'fsl,imx28-dma-apbh']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
