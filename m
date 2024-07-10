Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D1F4F1E2
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Jul 2024 20:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720642307; cv=none; b=IldjYpQPJMAQf5Mukx+LaYUJViBcYgNhGPlEe9sFNeObbtldv8sc1eowPpoLVWECWA5+THPsxUOtSXH9gGN0E5NRaXYZ9NG+XMcILbjNIIjKJbsCJEBbrLvnvBD4QvuXe451lNDoyZ+GRm+dQVeogbKJDT9i3ESmzG7VIf6FMOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720642307; c=relaxed/simple;
	bh=cKdTAxsIZtfjPMiqZd5Ew90Pj7A/GMmWkM3QtTral68=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CcgR+6C2+exJ70V4WGincZp9TMsulEAI5f3CPNbcH0DBY18CdoTsOLB879Rjld5lMfKH6/s7las6vHoaO7OSulp0JJ7PDhynfm2ugT+SvlczURCbbKnZudoZ7d9iG4GCC0CwAQC6W0NXwBEzYHFcqKrWXaKxsy9ETmCKlHoZdIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iug0yyK3; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iug0yyK3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720642305; x=1752178305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cKdTAxsIZtfjPMiqZd5Ew90Pj7A/GMmWkM3QtTral68=;
  b=iug0yyK3cIPgyAj5NR8DJ46ogw+rVEZP5r8Cp++HMXtYp/40FU6/e56P
   JlcemlfZxkDYeC9kachrM63lKPQ7lcIstL7t3KXXyi1I13eRuKoXi5YhF
   BKo7O+bx3zUYBRsNoclxU2i4sGLZl5c/snaJlLdgpOfolYyX506/dzK/Y
   Sf6zuAL67W9Phz8HWSk1FN8qrX2jvBDDGwUJDoRBjeo5D4m9YPsjva/ap
   42/f1sG2FUy9+dzciGbdFT540fe9GatrHjPrG/Suw16JwtxdDI4anHbtR
   sFpE7c4jMpxkLwgZ4K7RRrdsQG8+tdzpYgBPUqPu4MBZOPvB9D3QA4W36
   Q==;
X-CSE-ConnectionGUID: oyCRL2X3QN6QlxKFLKXNmw==
X-CSE-MsgGUID: WXBSPMeXS6uZ0KRGTsfuAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17690037"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="17690037"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 13:11:44 -0700
X-CSE-ConnectionGUID: hbJTUWe+S3Svpb6i7yDuZA==
X-CSE-MsgGUID: iRQQba7RRESE7WvvourJGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="48416271"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Jul 2024 13:11:43 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRdfB-000YFW-0s;
	Wed, 10 Jul 2024 20:11:41 +0000
Date: Thu, 11 Jul 2024 04:11:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [freescale-fslc:6.6-2.0.x-imx 10939/11381]
 Documentation/devicetree/bindings/remoteproc/nxp,isp-rproc.yaml:68:21:
 [error] syntax error: mapping values are not allowed here (syntax)
Message-ID: <202407110412.64R7IeKf-lkp@intel.com>
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
commit: 0d6dfa43d09c25e24c9b17f85432e57cbdcd64a6 [10939/11381] LF-11070-6: dt-bindings: firmware: Add nxp,isp-rproc yaml file
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: arc-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407110412.64R7IeKf-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407110412.64R7IeKf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407110412.64R7IeKf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:21:2: [error] missing starting space in comment (comments)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:22:2: [error] missing starting space in comment (comments)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:23:2: [error] missing starting space in comment (comments)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:24:2: [error] missing starting space in comment (comments)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:67:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:75:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:83:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:127:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
   Documentation/devicetree/bindings/vendor-prefixes.yaml:880:3: [error] duplication of key "^mixel,.*" in mapping (key-duplicates)
   Documentation/devicetree/bindings/clock/imx8ulp-clock.yaml:64:6: [warning] wrong indentation: expected 4 but found 5 (indentation)
>> Documentation/devicetree/bindings/remoteproc/nxp,isp-rproc.yaml:68:21: [error] syntax error: mapping values are not allowed here (syntax)
   Documentation/devicetree/bindings/rtc/nxp,pcf2131.yaml:10:11: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/firmware/arm,scmi.yaml:244:15: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/firmware/arm,scmi.yaml:258:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/firmware/arm,scmi.yaml:259:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/firmware/nxp,isp-mu.yaml:14:1: [error] syntax error: could not find expected ':' (syntax)
   Documentation/devicetree/bindings/net/fsl,netc.yaml:62:9: [warning] wrong indentation: expected 6 but found 8 (indentation)
   Documentation/devicetree/bindings/net/fsl,netc.yaml:76:14: [warning] wrong indentation: expected 14 but found 13 (indentation)
   Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml:115:13: [error] syntax error: mapping values are not allowed here (syntax)
   Documentation/devicetree/bindings/display/fsl,lcdif.yaml:65:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
   Documentation/devicetree/bindings/mfd/nxp,imx-flexio.yaml:44:11: [error] string value is redundantly quoted with any quotes (quoted-strings)
--
>> Documentation/devicetree/bindings/remoteproc/nxp,isp-rproc.yaml:68:21: mapping values are not allowed in this context
   Documentation/devicetree/bindings/net/engleder,tsnep.yaml: mdio: Missing additionalProperties/unevaluatedProperties constraint
--
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/phy/fsl,samsung-hdmi-phy.yaml: ignoring, error in schema: properties: clock-names
   Documentation/devicetree/bindings/firmware/nxp,isp-mu.yaml: ignoring, error parsing file
>> Documentation/devicetree/bindings/remoteproc/nxp,isp-rproc.yaml: ignoring, error parsing file
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

vim +68 Documentation/devicetree/bindings/remoteproc/nxp,isp-rproc.yaml

0d6dfa43d09c25 Robert Chiras 2023-12-20   8  
0d6dfa43d09c25 Robert Chiras 2023-12-20   9  maintainers:
0d6dfa43d09c25 Robert Chiras 2023-12-20  10    - Robert Chiras <robert.chiras@nxp.com>
0d6dfa43d09c25 Robert Chiras 2023-12-20  11  
0d6dfa43d09c25 Robert Chiras 2023-12-20  12  description: |
0d6dfa43d09c25 Robert Chiras 2023-12-20  13    The Camera domain from i.MX95 has an M0 core with an attached OCRAM, where a
0d6dfa43d09c25 Robert Chiras 2023-12-20  14    small code can be loaded and booted on M0. This driver handles the loading
0d6dfa43d09c25 Robert Chiras 2023-12-20  15    of the firmware binary, configuring the OCRAM and starting/stopping the core.
0d6dfa43d09c25 Robert Chiras 2023-12-20  16  
0d6dfa43d09c25 Robert Chiras 2023-12-20  17  properties:
0d6dfa43d09c25 Robert Chiras 2023-12-20  18    compatible:
0d6dfa43d09c25 Robert Chiras 2023-12-20  19      enum:
0d6dfa43d09c25 Robert Chiras 2023-12-20  20        - nxp,imx95-isp-rproc
0d6dfa43d09c25 Robert Chiras 2023-12-20  21  
0d6dfa43d09c25 Robert Chiras 2023-12-20  22    reg:
0d6dfa43d09c25 Robert Chiras 2023-12-20  23      maxItems: 1
0d6dfa43d09c25 Robert Chiras 2023-12-20  24  
0d6dfa43d09c25 Robert Chiras 2023-12-20  25    clocks:
0d6dfa43d09c25 Robert Chiras 2023-12-20  26      items:
0d6dfa43d09c25 Robert Chiras 2023-12-20  27        - description: m0 clock
0d6dfa43d09c25 Robert Chiras 2023-12-20  28      minItems: 1
0d6dfa43d09c25 Robert Chiras 2023-12-20  29  
0d6dfa43d09c25 Robert Chiras 2023-12-20  30    power-domains:
0d6dfa43d09c25 Robert Chiras 2023-12-20  31      description:
0d6dfa43d09c25 Robert Chiras 2023-12-20  32        List of phandle and PM domain specifier as documented in
0d6dfa43d09c25 Robert Chiras 2023-12-20  33        Documentation/devicetree/bindings/power/power_domain.txt
0d6dfa43d09c25 Robert Chiras 2023-12-20  34      minItems: 1
0d6dfa43d09c25 Robert Chiras 2023-12-20  35      maxItems: 4
0d6dfa43d09c25 Robert Chiras 2023-12-20  36  
0d6dfa43d09c25 Robert Chiras 2023-12-20  37    nxp,blk-ctrl:
0d6dfa43d09c25 Robert Chiras 2023-12-20  38      $ref: /schemas/types.yaml#/definitions/phandle
0d6dfa43d09c25 Robert Chiras 2023-12-20  39      description:
0d6dfa43d09c25 Robert Chiras 2023-12-20  40        Phandle to syscon block which provide access for processor enablement.
0d6dfa43d09c25 Robert Chiras 2023-12-20  41  
0d6dfa43d09c25 Robert Chiras 2023-12-20  42    nxp,ocram-cfg:
0d6dfa43d09c25 Robert Chiras 2023-12-20  43      $ref: /schemas/types.yaml#/definitions/phandle
0d6dfa43d09c25 Robert Chiras 2023-12-20  44      description:
0d6dfa43d09c25 Robert Chiras 2023-12-20  45        Phandle to syscon block which provide access for OCRAM configuration.
0d6dfa43d09c25 Robert Chiras 2023-12-20  46  
0d6dfa43d09c25 Robert Chiras 2023-12-20  47    nxp,isp-firmware:
0d6dfa43d09c25 Robert Chiras 2023-12-20  48      description: |
0d6dfa43d09c25 Robert Chiras 2023-12-20  49        Default name of the firmware to load to the remote processor.
0d6dfa43d09c25 Robert Chiras 2023-12-20  50  
0d6dfa43d09c25 Robert Chiras 2023-12-20  51    mba:
0d6dfa43d09c25 Robert Chiras 2023-12-20  52      description:
0d6dfa43d09c25 Robert Chiras 2023-12-20  53        node describing the Master Boot Record, that the core will use to boot.
0d6dfa43d09c25 Robert Chiras 2023-12-20  54  
0d6dfa43d09c25 Robert Chiras 2023-12-20  55      properties:
0d6dfa43d09c25 Robert Chiras 2023-12-20  56        memory-region:
0d6dfa43d09c25 Robert Chiras 2023-12-20  57          description:
0d6dfa43d09c25 Robert Chiras 2023-12-20  58            phandle to a node describing reserved memory (System RAM memory)
0d6dfa43d09c25 Robert Chiras 2023-12-20  59            used by ISP (see bindings/reserved-memory/reserved-memory.txt)
0d6dfa43d09c25 Robert Chiras 2023-12-20  60          minItems: 1
0d6dfa43d09c25 Robert Chiras 2023-12-20  61          maxItems: 1
0d6dfa43d09c25 Robert Chiras 2023-12-20  62  
0d6dfa43d09c25 Robert Chiras 2023-12-20  63          ocram-map:
0d6dfa43d09c25 Robert Chiras 2023-12-20  64            description:
0d6dfa43d09c25 Robert Chiras 2023-12-20  65              Optional property describing the size of the OCRAM that can be
0d6dfa43d09c25 Robert Chiras 2023-12-20  66              used to load the firmware.
0d6dfa43d09c25 Robert Chiras 2023-12-20  67  
0d6dfa43d09c25 Robert Chiras 2023-12-20 @68              maxItems: 1
0d6dfa43d09c25 Robert Chiras 2023-12-20  69  
0d6dfa43d09c25 Robert Chiras 2023-12-20  70  required:
0d6dfa43d09c25 Robert Chiras 2023-12-20  71    - compatible
0d6dfa43d09c25 Robert Chiras 2023-12-20  72    - reg
0d6dfa43d09c25 Robert Chiras 2023-12-20  73    - clocks
0d6dfa43d09c25 Robert Chiras 2023-12-20  74    - power-domains
0d6dfa43d09c25 Robert Chiras 2023-12-20  75    - mba
0d6dfa43d09c25 Robert Chiras 2023-12-20  76  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
