Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24A4848E
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Jul 2024 22:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720650713; cv=none; b=oayYukXyBoG/iCd1SBLVm+2zq62eUYFLgpiW675yKCqEJ7G9tai4x4h5p2PU/NIcJMIECXPOd2BI8ornOatbrwKcTRCbtN0a6ylaTlfG1luHSJcuRbQ0+SdpkNSxIexUHcBMxWE+i8adfujal4YecwKx3xjoP1rVbqLjwJlDEA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720650713; c=relaxed/simple;
	bh=kdV7zUE4fngcd/8752pyPj2TG6HZUOnqhpYpGPnvleE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ii4JOlOiuLCyaxhYX3Jn1gUWwVEjRz4q1scIOma2YJQWXTJw+JQtayV9b6x37BWLf1qwJYYIRi1A9lsAJig/8ysWdvvrKClnlCdwzRGZyPj0lpwEm4TDqufqEBxiCwurr1mG/sjTDa3dTwDIJPqvOkIj7S1B5DkDB42rd8mwktE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CtD1ZjXk; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CtD1ZjXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720650711; x=1752186711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kdV7zUE4fngcd/8752pyPj2TG6HZUOnqhpYpGPnvleE=;
  b=CtD1ZjXk7oKCqLhc44szpGNHR0nwL1/b1Oboi/14DfxtZkXOh9iH2K++
   RCzUW4Vks8lDLK1MdHo+1rHnmsAxZqs4OVesKydgydzXlUcYP8uewOWb4
   IlzHf84jVNA5sa+gg0m2F8Y50USxD5E3c5cn1eQvGHsOMrtI768Qs524T
   gJNOCa+h8UfNKtQjq2eiNP8kXz9POBsdvG3fvH3GdYpKYP8JvWznJP4j0
   AlQQZ2Y1ftPSqu3rnq+fIqEaB43x2nFnWV1U/GPdi0io8zY8KMpC6LiXe
   3cfjfVloxboCLsQ/xwPPARQJyQM6z8z2KdKuadI3nogq+EGa8WI2AsvMZ
   Q==;
X-CSE-ConnectionGUID: gNGofIUwT4+KgCqHapOR5A==
X-CSE-MsgGUID: 2V+LcpapTveVHVIqS1QQ9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17622758"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="17622758"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 15:31:50 -0700
X-CSE-ConnectionGUID: Sapz7HRETVCOMid6a+Q/vg==
X-CSE-MsgGUID: /W7KQ3jdSXGYrgd/sqHN8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="52960803"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Jul 2024 15:31:49 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRfql-000YMy-0N;
	Wed, 10 Jul 2024 22:31:47 +0000
Date: Thu, 11 Jul 2024 06:30:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [freescale-fslc:6.6-2.0.x-imx 10988/11381]
 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml:85:1: [error]
 syntax error: found character '\t' that cannot start any token (syntax)
Message-ID: <202407110600.KKLKMT8D-lkp@intel.com>
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
TO: Otavio Salvador <otavio@ossystems.com.br>

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ee366aa641d84d61e265cd4f571394aa4e7d4e6d
commit: 01857629f4043ca54bb4b1a6e860fb69017e4d35 [10988/11381] LF-11850-1: dt-bindings: i2c: i2c-imx-lpi2c: add slave node
:::::: branch date: 6 hours ago
:::::: commit date: 3 months ago
config: arc-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407110600.KKLKMT8D-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407110600.KKLKMT8D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407110600.KKLKMT8D-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/firmware/arm,scmi.yaml:258:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/firmware/arm,scmi.yaml:259:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/firmware/nxp,isp-mu.yaml:14:1: [error] syntax error: could not find expected ':' (syntax)
   Documentation/devicetree/bindings/remoteproc/nxp,isp-rproc.yaml:68:21: [error] syntax error: mapping values are not allowed here (syntax)
   Documentation/devicetree/bindings/net/fsl,netc.yaml:62:9: [warning] wrong indentation: expected 6 but found 8 (indentation)
   Documentation/devicetree/bindings/net/fsl,netc.yaml:76:14: [warning] wrong indentation: expected 14 but found 13 (indentation)
   Documentation/devicetree/bindings/input/touchscreen/focaltech,fts.yaml:55:7: [error] no new line character at the end of file (new-line-at-end-of-file)
   Documentation/devicetree/bindings/mfd/nxp,imx-flexio.yaml:44:11: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/display/fsl,lcdif.yaml:65:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
   Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml:115:13: [error] syntax error: mapping values are not allowed here (syntax)
>> Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml:85:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:38:18: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:38:20: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:38:22: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:45:18: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:45:20: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:45:22: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:45:24: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:45:26: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:45:28: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:45:30: [warning] too few spaces after comma (commas)
--
>> Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml:85:1: found a tab character where an indentation space is expected
   Documentation/devicetree/bindings/mfd/rockchip,rk805.yaml: ^(DCDC_REG[1-4]|LDO_REG[1-3])$: Missing additionalProperties/unevaluatedProperties constraint
--
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml: ignoring, error parsing file
>> Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/phy/fsl,samsung-hdmi-phy.yaml: ignoring, error in schema: properties: clock-names
   Documentation/devicetree/bindings/firmware/nxp,isp-mu.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/remoteproc/nxp,isp-rproc.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/vendor-prefixes.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml: ignoring, error in schema: properties: out-default: description
   Documentation/devicetree/bindings/display/fsl,lcdif.yaml: ignoring, error parsing file
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/memory-region.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/memory-region.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/shared-dma-pool.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/framebuffer.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/framebuffer.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/reserved-memory.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/reserved-memory.yaml#'

vim +85 Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml

c217cf8136c5c3 Anson Huang         2020-06-04  69  
c217cf8136c5c3 Anson Huang         2020-06-04  70  examples:
c217cf8136c5c3 Anson Huang         2020-06-04  71    - |
c217cf8136c5c3 Anson Huang         2020-06-04  72      #include <dt-bindings/clock/imx7ulp-clock.h>
c217cf8136c5c3 Anson Huang         2020-06-04  73      #include <dt-bindings/interrupt-controller/arm-gic.h>
01857629f4043c Carlos Song         2024-04-02  74      #include <dt-bindings/i2c/i2c.h>
c217cf8136c5c3 Anson Huang         2020-06-04  75  
41c38c272e2cc0 Krzysztof Kozlowski 2020-09-17  76      i2c@40a50000 {
c217cf8136c5c3 Anson Huang         2020-06-04  77          compatible = "fsl,imx7ulp-lpi2c";
c217cf8136c5c3 Anson Huang         2020-06-04  78          reg = <0x40A50000 0x10000>;
c217cf8136c5c3 Anson Huang         2020-06-04  79          interrupt-parent = <&intc>;
c217cf8136c5c3 Anson Huang         2020-06-04  80          interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
c04c2819dc3d88 Peng Fan            2022-08-23  81          clocks = <&clks IMX7ULP_CLK_LPI2C7>,
c04c2819dc3d88 Peng Fan            2022-08-23  82                   <&clks IMX7ULP_CLK_NIC1_BUS_DIV>;
01857629f4043c Carlos Song         2024-04-02  83  
01857629f4043c Carlos Song         2024-04-02  84          eeprom@64 {
01857629f4043c Carlos Song         2024-04-02 @85  		      compatible = "linux,slave-24c02";

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
