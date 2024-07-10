Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5111C6F31C
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Jul 2024 18:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720637684; cv=none; b=hEIJeT98bbrN0YoHHnYGgaFW9IUWHLSvEIrP+9hrHz4cPftnZbIAe6XfLCRzULLMCJ5v5OCRT0+DNmlvI/M1zRJz8wscJplF7JbO05frZojXHWtcpy2Ps8u4A6SOCnRIJe+dEAhmqH1F8mdKVsuevBT7e+k5Am0mUx8zeKZf+hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720637684; c=relaxed/simple;
	bh=ehDcvvIdvJAZpPWswdf6dBVaf8OZuzZRe+VlJVv9qfY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VmuJlAm7h3ihpt1on+d2bYj67UUSvZUb3EU4QXu0R2MmQKxLXtOrVCs93EIxhBMo8a2rNbY4TtpMUheXPu8NMEY8XQRdNGF0bLR0FTZOdf8vmaVwz3bfzXpSSzp8a/ugglEjvtuWXLvjLHQf+3xxk1mhy6fNXOJzQBTDxzlZdMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PxrnCeWB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PxrnCeWB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720637682; x=1752173682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ehDcvvIdvJAZpPWswdf6dBVaf8OZuzZRe+VlJVv9qfY=;
  b=PxrnCeWB+spvhSd1AHiS596CyQF3WPDmTOKu/5V2SZlh/l9j19LIB3/e
   q2KV+eGk9I3JCwaiWMlKdbhJmtPZbdMoq67zd8b1RhrO2ON7OnIk9oiFc
   Wj3X/EtMplbT/0rCTX1oBu2aZLtR7OImUUBN+sLZvDQGQJft6enQQ7xk0
   XPe0s/xar5cG85OxELyShfb7qSIpEGR1aXs4XGm7uW979KKSM58I9CVQ+
   rxdUz+1Zpk5BIXPVp7TWOwUK8g/jxUPhTXpZLBd7QP58Yr14XaccDxr7i
   uNcKpP/GpzYbkxfFAQGWde5EwCLDuDKAGo3o2MhYNodISx+E5JpdLx5eQ
   g==;
X-CSE-ConnectionGUID: xYu/znBoQdCCi7HmuVMONw==
X-CSE-MsgGUID: 7pn2kLcBRyOScXWASC/DQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="21857268"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="21857268"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 11:54:41 -0700
X-CSE-ConnectionGUID: iFZBkIMvQy+EBRWqqdx0gg==
X-CSE-MsgGUID: gcLQUfudTIScp2RibhkEpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="79458803"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Jul 2024 11:54:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRcSc-000YAk-1o;
	Wed, 10 Jul 2024 18:54:38 +0000
Date: Thu, 11 Jul 2024 02:54:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [freescale-fslc:6.6-2.0.x-imx 10937/11381]
 Documentation/devicetree/bindings/firmware/nxp,isp-mu.yaml:14:1: [error]
 syntax error: could not find expected ':' (syntax)
Message-ID: <202407110241.FK4TEwH0-lkp@intel.com>
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
commit: bc0aaf4114b2f5a7bdb60a2f0038e70bb01b5a06 [10937/11381] LF-11070-4: dt-bindings: firmware: Add nxp,isp-mu yaml file
:::::: branch date: 2 hours ago
:::::: commit date: 3 months ago
config: arc-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407110241.FK4TEwH0-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407110241.FK4TEwH0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407110241.FK4TEwH0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/arm/freescale/fsl,ele_mu.yaml:66:26: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,ele_mu.yaml:66:31: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,ele_mu.yaml:66:36: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,ele_mu.yaml:66:41: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,ele_mu.yaml:66:46: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/arm/freescale/fsl,ele_mu.yaml:66:51: [warning] too few spaces after comma (commas)
   Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml:115:13: [error] syntax error: mapping values are not allowed here (syntax)
   Documentation/devicetree/bindings/firmware/arm,scmi.yaml:244:15: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/firmware/arm,scmi.yaml:258:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/firmware/arm,scmi.yaml:259:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
>> Documentation/devicetree/bindings/firmware/nxp,isp-mu.yaml:14:1: [error] syntax error: could not find expected ':' (syntax)
   Documentation/devicetree/bindings/net/fsl,netc.yaml:62:9: [warning] wrong indentation: expected 6 but found 8 (indentation)
   Documentation/devicetree/bindings/net/fsl,netc.yaml:76:14: [warning] wrong indentation: expected 14 but found 13 (indentation)
   Documentation/devicetree/bindings/display/fsl,lcdif.yaml:65:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
   Documentation/devicetree/bindings/mfd/nxp,imx-flexio.yaml:44:11: [error] string value is redundantly quoted with any quotes (quoted-strings)
--
   Documentation/devicetree/bindings/regulator/nxp,pf5300-regulator.yaml: properties:regulators:patternProperties: '^SW1$' should not be valid under {'pattern': '^\^[a-zA-Z0-9,\-._#@]+\$$'}
   hint: Fixed strings belong in 'properties', not 'patternProperties'
   from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
   Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmin-pascal: '$ref' should not be valid under {'const': '$ref'}
   hint: Standard unit suffix properties don't need a type $ref
   from schema $id: http://devicetree.org/meta-schemas/core.yaml#
   Documentation/devicetree/bindings/iio/pressure/honeywell,mprls0025pa.yaml: properties:honeywell,pmax-pascal: '$ref' should not be valid under {'const': '$ref'}
   hint: Standard unit suffix properties don't need a type $ref
   from schema $id: http://devicetree.org/meta-schemas/core.yaml#
>> Documentation/devicetree/bindings/firmware/nxp,isp-mu.yaml:14:1: could not find expected ':'
   Documentation/devicetree/bindings/spi/spi-pl022.yaml: ^[a-zA-Z][a-zA-Z0-9,+-._]{0,63}@[0-9a-f]+$: Missing additionalProperties/unevaluatedProperties constraint
--
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/phy/fsl,samsung-hdmi-phy.yaml: ignoring, error in schema: properties: clock-names
>> Documentation/devicetree/bindings/firmware/nxp,isp-mu.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/vendor-prefixes.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml: ignoring, error in schema: properties: out-default: description
   Documentation/devicetree/bindings/display/fsl,lcdif.yaml: ignoring, error parsing file
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/memory-region.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/memory-region.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/shared-dma-pool.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/framebuffer.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/framebuffer.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/reserved-memory.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/reserved-memory.yaml#'
   Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml: fsl,cd-gpio-wakeup-disable: missing type definition
   Documentation/devicetree/bindings/i2c/i2c-imx-flexio.yaml: sda: missing type definition
   Documentation/devicetree/bindings/i2c/i2c-imx-flexio.yaml: scl: missing type definition

vim +14 Documentation/devicetree/bindings/firmware/nxp,isp-mu.yaml

bc0aaf4114b2f5 Robert Chiras 2023-12-20   8  
bc0aaf4114b2f5 Robert Chiras 2023-12-20   9  maintainers:
bc0aaf4114b2f5 Robert Chiras 2023-12-20  10    - Robert Chiras <robert.chiras@nxp.com>
bc0aaf4114b2f5 Robert Chiras 2023-12-20  11  
bc0aaf4114b2f5 Robert Chiras 2023-12-20  12  description:
bc0aaf4114b2f5 Robert Chiras 2023-12-20  13  The ISP firmware is a free-RTOS code running on M0 core inside the Camera
bc0aaf4114b2f5 Robert Chiras 2023-12-20 @14  domain on i.MX95. Inside the Camera domain, there are multiple Messaging Units
bc0aaf4114b2f5 Robert Chiras 2023-12-20  15  used by the firmware in order to communicate with other cores willing to submit
bc0aaf4114b2f5 Robert Chiras 2023-12-20  16  jobs to ISP core.
bc0aaf4114b2f5 Robert Chiras 2023-12-20  17  This driver is using the mailbox system in order to send/receive messages to
bc0aaf4114b2f5 Robert Chiras 2023-12-20  18  and from ISP firmware.
bc0aaf4114b2f5 Robert Chiras 2023-12-20  19  It also provides the ISP firmware protocol used for communication with it.
bc0aaf4114b2f5 Robert Chiras 2023-12-20  20  
bc0aaf4114b2f5 Robert Chiras 2023-12-20  21  properties:
bc0aaf4114b2f5 Robert Chiras 2023-12-20  22    compatible:
bc0aaf4114b2f5 Robert Chiras 2023-12-20  23      const: nxp,imx-isp-mu
bc0aaf4114b2f5 Robert Chiras 2023-12-20  24  
bc0aaf4114b2f5 Robert Chiras 2023-12-20  25    mboxes:
bc0aaf4114b2f5 Robert Chiras 2023-12-20  26      description:
bc0aaf4114b2f5 Robert Chiras 2023-12-20  27        A list of phandles of TX MU channels followed by a list of phandles of
bc0aaf4114b2f5 Robert Chiras 2023-12-20  28        RX MU channels. The number of expected tx and rx channels is 1 TX and
bc0aaf4114b2f5 Robert Chiras 2023-12-20  29        1 RX channels, per instance.
bc0aaf4114b2f5 Robert Chiras 2023-12-20  30      oneOf:
bc0aaf4114b2f5 Robert Chiras 2023-12-20  31        - items:
bc0aaf4114b2f5 Robert Chiras 2023-12-20  32            - description: TX MU channel
bc0aaf4114b2f5 Robert Chiras 2023-12-20  33            - description: RX MU channel
bc0aaf4114b2f5 Robert Chiras 2023-12-20  34  
bc0aaf4114b2f5 Robert Chiras 2023-12-20  35    mbox-names:
bc0aaf4114b2f5 Robert Chiras 2023-12-20  36      oneOf:
bc0aaf4114b2f5 Robert Chiras 2023-12-20  37        - items:
bc0aaf4114b2f5 Robert Chiras 2023-12-20  38            - const: tx0
bc0aaf4114b2f5 Robert Chiras 2023-12-20  39            - const: rx0
bc0aaf4114b2f5 Robert Chiras 2023-12-20  40            - const: tx1
bc0aaf4114b2f5 Robert Chiras 2023-12-20  41            - const: rx1
bc0aaf4114b2f5 Robert Chiras 2023-12-20  42            - const: tx2
bc0aaf4114b2f5 Robert Chiras 2023-12-20  43            - const: rx2
bc0aaf4114b2f5 Robert Chiras 2023-12-20  44            - const: tx3
bc0aaf4114b2f5 Robert Chiras 2023-12-20  45            - const: rx3
bc0aaf4114b2f5 Robert Chiras 2023-12-20  46            - const: tx4
bc0aaf4114b2f5 Robert Chiras 2023-12-20  47            - const: rx4
bc0aaf4114b2f5 Robert Chiras 2023-12-20  48            - const: tx5
bc0aaf4114b2f5 Robert Chiras 2023-12-20  49            - const: rx5
bc0aaf4114b2f5 Robert Chiras 2023-12-20  50            - const: tx6
bc0aaf4114b2f5 Robert Chiras 2023-12-20  51            - const: rx6
bc0aaf4114b2f5 Robert Chiras 2023-12-20  52            - const: tx7
bc0aaf4114b2f5 Robert Chiras 2023-12-20  53            - const: rx7
bc0aaf4114b2f5 Robert Chiras 2023-12-20  54            - const: tx8
bc0aaf4114b2f5 Robert Chiras 2023-12-20  55            - const: rx8
bc0aaf4114b2f5 Robert Chiras 2023-12-20  56  
bc0aaf4114b2f5 Robert Chiras 2023-12-20  57  required:
bc0aaf4114b2f5 Robert Chiras 2023-12-20  58    - compatible
bc0aaf4114b2f5 Robert Chiras 2023-12-20  59    - mbox-names
bc0aaf4114b2f5 Robert Chiras 2023-12-20  60    - mboxes
bc0aaf4114b2f5 Robert Chiras 2023-12-20  61  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
