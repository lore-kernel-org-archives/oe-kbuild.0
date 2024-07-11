Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EFDD512
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jul 2024 02:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720664522; cv=none; b=V+cMM0Z5smFvRoxTKYD4UC+xsXMoVNA91xzA5UfR+C8PhalHBSkKPybgRiRJJ5pAKrEW2RzZCeo0Xzrqx/B0H1ylzkh0BNOvqa6SQZhdpOUkse5+5/KI30HGF5hJdQuqpegGpHAyCjGjXxPDCyV66qSQi1GF03Gs1X3BpmIBpDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720664522; c=relaxed/simple;
	bh=W/3dPrxELSoK4eKfecS7lJSlLOdhYkgltVw4HVkQnok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PjZwMKNkQ2m2hYw1JulkLNtZaGyRkpHWTcQsOSGHu7iwDTQDln5fbGVbrkml1ah7O/uo2bdq7dZuZIJSHvtsEhjkUVEHCu5r7Pf91YSXcRJgS083DElcs7y7UtA8GI0RolkE5mSaBOHir90z34vmocqt81pJxcHPt9R7DyEGDBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ReKAawic; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ReKAawic"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720664521; x=1752200521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W/3dPrxELSoK4eKfecS7lJSlLOdhYkgltVw4HVkQnok=;
  b=ReKAawicajI2apZOX00rr8J5DeqmuQijjcSe5WsSc4ka4bOb58Dk1eDY
   sXDOcvAIQ7wSLTpMj94OUVnFyN5uqj5ZcMAK55m0m52Vcu3V8yAuQxgZQ
   YWBYpbBk3UdQmvKeWohKFQ7UJ2RnIm6VXZtJml2YWxDTzbP4ygHOSERm7
   29wCXLltD/UczU7O3hUlFZkAbxW33RJVwN757mZQJM9itvzK86uZG9J66
   QT8xpjc5g/noVKb9YuDHTkyqCb7sdem1y1hlAs3aw2jK3+PtouYePDyBv
   Vr1Ye6n+Olj+CjOFPyDfp0TxRBXR9zCJF83XhsILw2mKlWstomUQRkeQM
   g==;
X-CSE-ConnectionGUID: ff0boYgiS+WINuJMXw56tQ==
X-CSE-MsgGUID: Wk/KcQ9hTpaAEEv1GjGp7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="40540034"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="40540034"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 19:22:00 -0700
X-CSE-ConnectionGUID: wmt3lMaKTWKxb4F1y9LO4w==
X-CSE-MsgGUID: XgUkIx8JSNCHYFmC9Vn5zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="71630237"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Jul 2024 19:21:59 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRjRU-000YdY-2H;
	Thu, 11 Jul 2024 02:21:56 +0000
Date: Thu, 11 Jul 2024 10:21:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [freescale-fslc:6.6-2.0.x-imx 11296/11381]
 Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml:109:1: [error]
 syntax error: found character '\t' that cannot start any token (syntax)
Message-ID: <202407111007.CALlL852-lkp@intel.com>
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
commit: 7ae5ecd26446bf2e939f3148c5eb71e97b82ab9c [11296/11381] LF-12188-05: media: dt-bindings: add new property ti,bc-gpio for ds90ub960
:::::: branch date: 10 hours ago
:::::: commit date: 2 months ago
config: arc-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407111007.CALlL852-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111007.CALlL852-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407111007.CALlL852-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:22:2: [error] missing starting space in comment (comments)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:23:2: [error] missing starting space in comment (comments)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:24:2: [error] missing starting space in comment (comments)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:67:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:75:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:83:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:127:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
   Documentation/devicetree/bindings/rtc/nxp,pcf2131.yaml:10:11: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml:115:13: [error] syntax error: mapping values are not allowed here (syntax)
   Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml:85:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
>> Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml:109:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
   Documentation/devicetree/bindings/firmware/arm,scmi.yaml:244:15: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/firmware/arm,scmi.yaml:258:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/firmware/arm,scmi.yaml:259:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/firmware/nxp,isp-mu.yaml:14:1: [error] syntax error: could not find expected ':' (syntax)
   Documentation/devicetree/bindings/remoteproc/nxp,isp-rproc.yaml:68:21: [error] syntax error: mapping values are not allowed here (syntax)
   Documentation/devicetree/bindings/input/touchscreen/focaltech,fts.yaml:55:7: [error] no new line character at the end of file (new-line-at-end-of-file)
   Documentation/devicetree/bindings/net/fsl,netc.yaml:62:9: [warning] wrong indentation: expected 6 but found 8 (indentation)
   Documentation/devicetree/bindings/net/fsl,netc.yaml:76:14: [warning] wrong indentation: expected 14 but found 13 (indentation)
   Documentation/devicetree/bindings/mfd/nxp,imx-flexio.yaml:44:11: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/arm/freescale/fsl,seco_mu.yaml:38:18: [warning] too few spaces after comma (commas)
--
>> Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml:109:1: found a tab character that violates indentation
   Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml: ^display-controller@[0-9a-f]+$: Missing additionalProperties/unevaluatedProperties constraint
--
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/i2c/i2c-imx-lpi2c.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/phy/fsl,samsung-hdmi-phy.yaml: ignoring, error in schema: properties: clock-names
>> Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/firmware/nxp,isp-mu.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/remoteproc/nxp,isp-rproc.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/vendor-prefixes.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml: ignoring, error in schema: properties: out-default: description
   Documentation/devicetree/bindings/display/fsl,lcdif.yaml: ignoring, error parsing file
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/memory-region.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/memory-region.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/shared-dma-pool.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/framebuffer.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/framebuffer.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/reserved-memory.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/reserved-memory.yaml#'
   Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml: fsl,cd-gpio-wakeup-disable: missing type definition

vim +109 Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml

313e8b32c61668 Tomi Valkeinen 2023-06-19    8  
313e8b32c61668 Tomi Valkeinen 2023-06-19    9  maintainers:
313e8b32c61668 Tomi Valkeinen 2023-06-19   10    - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
313e8b32c61668 Tomi Valkeinen 2023-06-19   11  
313e8b32c61668 Tomi Valkeinen 2023-06-19   12  description:
313e8b32c61668 Tomi Valkeinen 2023-06-19   13    The TI DS90UB9XX devices are FPD-Link video deserializers with I2C and GPIO
313e8b32c61668 Tomi Valkeinen 2023-06-19   14    forwarding.
313e8b32c61668 Tomi Valkeinen 2023-06-19   15  
313e8b32c61668 Tomi Valkeinen 2023-06-19   16  allOf:
313e8b32c61668 Tomi Valkeinen 2023-06-19   17    - $ref: /schemas/i2c/i2c-atr.yaml#
313e8b32c61668 Tomi Valkeinen 2023-06-19   18  
313e8b32c61668 Tomi Valkeinen 2023-06-19   19  properties:
313e8b32c61668 Tomi Valkeinen 2023-06-19   20    compatible:
313e8b32c61668 Tomi Valkeinen 2023-06-19   21      enum:
313e8b32c61668 Tomi Valkeinen 2023-06-19   22        - ti,ds90ub960-q1
313e8b32c61668 Tomi Valkeinen 2023-06-19   23        - ti,ds90ub9702-q1
313e8b32c61668 Tomi Valkeinen 2023-06-19   24  
313e8b32c61668 Tomi Valkeinen 2023-06-19   25    reg:
313e8b32c61668 Tomi Valkeinen 2023-06-19   26      maxItems: 1
313e8b32c61668 Tomi Valkeinen 2023-06-19   27  
313e8b32c61668 Tomi Valkeinen 2023-06-19   28    clocks:
313e8b32c61668 Tomi Valkeinen 2023-06-19   29      maxItems: 1
313e8b32c61668 Tomi Valkeinen 2023-06-19   30      description:
313e8b32c61668 Tomi Valkeinen 2023-06-19   31        Reference clock connected to the REFCLK pin.
313e8b32c61668 Tomi Valkeinen 2023-06-19   32  
313e8b32c61668 Tomi Valkeinen 2023-06-19   33    clock-names:
313e8b32c61668 Tomi Valkeinen 2023-06-19   34      items:
313e8b32c61668 Tomi Valkeinen 2023-06-19   35        - const: refclk
313e8b32c61668 Tomi Valkeinen 2023-06-19   36  
313e8b32c61668 Tomi Valkeinen 2023-06-19   37    powerdown-gpios:
313e8b32c61668 Tomi Valkeinen 2023-06-19   38      maxItems: 1
313e8b32c61668 Tomi Valkeinen 2023-06-19   39      description:
313e8b32c61668 Tomi Valkeinen 2023-06-19   40        Specifier for the GPIO connected to the PDB pin.
313e8b32c61668 Tomi Valkeinen 2023-06-19   41  
313e8b32c61668 Tomi Valkeinen 2023-06-19   42    i2c-alias-pool:
313e8b32c61668 Tomi Valkeinen 2023-06-19   43      minItems: 1
313e8b32c61668 Tomi Valkeinen 2023-06-19   44      maxItems: 32
313e8b32c61668 Tomi Valkeinen 2023-06-19   45  
313e8b32c61668 Tomi Valkeinen 2023-06-19   46    links:
313e8b32c61668 Tomi Valkeinen 2023-06-19   47      type: object
313e8b32c61668 Tomi Valkeinen 2023-06-19   48      additionalProperties: false
313e8b32c61668 Tomi Valkeinen 2023-06-19   49  
313e8b32c61668 Tomi Valkeinen 2023-06-19   50      properties:
313e8b32c61668 Tomi Valkeinen 2023-06-19   51        '#address-cells':
313e8b32c61668 Tomi Valkeinen 2023-06-19   52          const: 1
313e8b32c61668 Tomi Valkeinen 2023-06-19   53  
313e8b32c61668 Tomi Valkeinen 2023-06-19   54        '#size-cells':
313e8b32c61668 Tomi Valkeinen 2023-06-19   55          const: 0
313e8b32c61668 Tomi Valkeinen 2023-06-19   56  
313e8b32c61668 Tomi Valkeinen 2023-06-19   57        ti,manual-strobe:
313e8b32c61668 Tomi Valkeinen 2023-06-19   58          type: boolean
313e8b32c61668 Tomi Valkeinen 2023-06-19   59          description:
313e8b32c61668 Tomi Valkeinen 2023-06-19   60            Enable manual strobe position and EQ level
313e8b32c61668 Tomi Valkeinen 2023-06-19   61  
313e8b32c61668 Tomi Valkeinen 2023-06-19   62      patternProperties:
313e8b32c61668 Tomi Valkeinen 2023-06-19   63        '^link@[0-3]$':
313e8b32c61668 Tomi Valkeinen 2023-06-19   64          type: object
313e8b32c61668 Tomi Valkeinen 2023-06-19   65          additionalProperties: false
313e8b32c61668 Tomi Valkeinen 2023-06-19   66          properties:
313e8b32c61668 Tomi Valkeinen 2023-06-19   67            reg:
313e8b32c61668 Tomi Valkeinen 2023-06-19   68              description: The link number
313e8b32c61668 Tomi Valkeinen 2023-06-19   69              maxItems: 1
313e8b32c61668 Tomi Valkeinen 2023-06-19   70  
313e8b32c61668 Tomi Valkeinen 2023-06-19   71            i2c-alias:
313e8b32c61668 Tomi Valkeinen 2023-06-19   72              description:
313e8b32c61668 Tomi Valkeinen 2023-06-19   73                The I2C address used for the serializer. Transactions to this
313e8b32c61668 Tomi Valkeinen 2023-06-19   74                address on the I2C bus where the deserializer resides are
313e8b32c61668 Tomi Valkeinen 2023-06-19   75                forwarded to the serializer.
313e8b32c61668 Tomi Valkeinen 2023-06-19   76  
313e8b32c61668 Tomi Valkeinen 2023-06-19   77            ti,rx-mode:
313e8b32c61668 Tomi Valkeinen 2023-06-19   78              $ref: /schemas/types.yaml#/definitions/uint32
313e8b32c61668 Tomi Valkeinen 2023-06-19   79              enum:
313e8b32c61668 Tomi Valkeinen 2023-06-19   80                - 0 # RAW10
313e8b32c61668 Tomi Valkeinen 2023-06-19   81                - 1 # RAW12 HF
313e8b32c61668 Tomi Valkeinen 2023-06-19   82                - 2 # RAW12 LF
313e8b32c61668 Tomi Valkeinen 2023-06-19   83                - 3 # CSI2 SYNC
313e8b32c61668 Tomi Valkeinen 2023-06-19   84                - 4 # CSI2 NON-SYNC
313e8b32c61668 Tomi Valkeinen 2023-06-19   85              description:
313e8b32c61668 Tomi Valkeinen 2023-06-19   86                FPD-Link Input Mode. This should reflect the hardware and the
313e8b32c61668 Tomi Valkeinen 2023-06-19   87                default mode of the connected device.
313e8b32c61668 Tomi Valkeinen 2023-06-19   88  
313e8b32c61668 Tomi Valkeinen 2023-06-19   89            ti,cdr-mode:
313e8b32c61668 Tomi Valkeinen 2023-06-19   90              $ref: /schemas/types.yaml#/definitions/uint32
313e8b32c61668 Tomi Valkeinen 2023-06-19   91              enum:
313e8b32c61668 Tomi Valkeinen 2023-06-19   92                - 0 # FPD-Link III
313e8b32c61668 Tomi Valkeinen 2023-06-19   93                - 1 # FPD-Link IV
313e8b32c61668 Tomi Valkeinen 2023-06-19   94              description:
313e8b32c61668 Tomi Valkeinen 2023-06-19   95                FPD-Link CDR Mode. This should reflect the hardware and the
313e8b32c61668 Tomi Valkeinen 2023-06-19   96                default mode of the connected device.
313e8b32c61668 Tomi Valkeinen 2023-06-19   97  
313e8b32c61668 Tomi Valkeinen 2023-06-19   98            ti,strobe-pos:
313e8b32c61668 Tomi Valkeinen 2023-06-19   99              $ref: /schemas/types.yaml#/definitions/int32
313e8b32c61668 Tomi Valkeinen 2023-06-19  100              minimum: -13
313e8b32c61668 Tomi Valkeinen 2023-06-19  101              maximum: 13
313e8b32c61668 Tomi Valkeinen 2023-06-19  102              description: Manual strobe position
313e8b32c61668 Tomi Valkeinen 2023-06-19  103  
313e8b32c61668 Tomi Valkeinen 2023-06-19  104            ti,eq-level:
313e8b32c61668 Tomi Valkeinen 2023-06-19  105              $ref: /schemas/types.yaml#/definitions/uint32
313e8b32c61668 Tomi Valkeinen 2023-06-19  106              maximum: 14
313e8b32c61668 Tomi Valkeinen 2023-06-19  107              description: Manual EQ level
313e8b32c61668 Tomi Valkeinen 2023-06-19  108  
7ae5ecd26446bf Guoniu.zhou    2024-04-29 @109  	ti,bc-gpio:
7ae5ecd26446bf Guoniu.zhou    2024-04-29  110              $ref: /schemas/types.yaml#/definitions/uint32
7ae5ecd26446bf Guoniu.zhou    2024-04-29  111              enum:
7ae5ecd26446bf Guoniu.zhou    2024-04-29  112                - 0 # GPIO0
7ae5ecd26446bf Guoniu.zhou    2024-04-29  113                - 1 # GPIO1
7ae5ecd26446bf Guoniu.zhou    2024-04-29  114                - 2 # GPIO2
7ae5ecd26446bf Guoniu.zhou    2024-04-29  115                - 3 # GPIO3
7ae5ecd26446bf Guoniu.zhou    2024-04-29  116              description:
7ae5ecd26446bf Guoniu.zhou    2024-04-29  117                Back channel GPIO select. The deserializer can link GPIO
7ae5ecd26446bf Guoniu.zhou    2024-04-29  118  	      pin input data on up to four available slots to send on
7ae5ecd26446bf Guoniu.zhou    2024-04-29  119  	      the back channel per each remote serializer connection.
7ae5ecd26446bf Guoniu.zhou    2024-04-29  120  
313e8b32c61668 Tomi Valkeinen 2023-06-19  121            serializer:
313e8b32c61668 Tomi Valkeinen 2023-06-19  122              type: object
313e8b32c61668 Tomi Valkeinen 2023-06-19  123              description: FPD-Link Serializer node
313e8b32c61668 Tomi Valkeinen 2023-06-19  124  
313e8b32c61668 Tomi Valkeinen 2023-06-19  125          required:
313e8b32c61668 Tomi Valkeinen 2023-06-19  126            - reg
313e8b32c61668 Tomi Valkeinen 2023-06-19  127            - i2c-alias
313e8b32c61668 Tomi Valkeinen 2023-06-19  128            - ti,rx-mode
313e8b32c61668 Tomi Valkeinen 2023-06-19  129            - serializer
313e8b32c61668 Tomi Valkeinen 2023-06-19  130  
313e8b32c61668 Tomi Valkeinen 2023-06-19  131    ports:
313e8b32c61668 Tomi Valkeinen 2023-06-19  132      $ref: /schemas/graph.yaml#/properties/ports
313e8b32c61668 Tomi Valkeinen 2023-06-19  133  
313e8b32c61668 Tomi Valkeinen 2023-06-19  134      properties:
313e8b32c61668 Tomi Valkeinen 2023-06-19  135        port@0:
313e8b32c61668 Tomi Valkeinen 2023-06-19  136          $ref: /schemas/graph.yaml#/$defs/port-base
313e8b32c61668 Tomi Valkeinen 2023-06-19  137          unevaluatedProperties: false
313e8b32c61668 Tomi Valkeinen 2023-06-19  138          description: FPD-Link input 0
313e8b32c61668 Tomi Valkeinen 2023-06-19  139  
313e8b32c61668 Tomi Valkeinen 2023-06-19  140          properties:
313e8b32c61668 Tomi Valkeinen 2023-06-19  141            endpoint:
313e8b32c61668 Tomi Valkeinen 2023-06-19  142              $ref: /schemas/media/video-interfaces.yaml#
313e8b32c61668 Tomi Valkeinen 2023-06-19  143              unevaluatedProperties: false
313e8b32c61668 Tomi Valkeinen 2023-06-19  144              description:
313e8b32c61668 Tomi Valkeinen 2023-06-19  145                Endpoint for FPD-Link port. If the RX mode for this port is RAW,
313e8b32c61668 Tomi Valkeinen 2023-06-19  146                hsync-active and vsync-active must be defined.
313e8b32c61668 Tomi Valkeinen 2023-06-19  147  
313e8b32c61668 Tomi Valkeinen 2023-06-19  148        port@1:
313e8b32c61668 Tomi Valkeinen 2023-06-19  149          $ref: /schemas/graph.yaml#/$defs/port-base
313e8b32c61668 Tomi Valkeinen 2023-06-19  150          unevaluatedProperties: false
313e8b32c61668 Tomi Valkeinen 2023-06-19  151          description: FPD-Link input 1
313e8b32c61668 Tomi Valkeinen 2023-06-19  152  
313e8b32c61668 Tomi Valkeinen 2023-06-19  153          properties:
313e8b32c61668 Tomi Valkeinen 2023-06-19  154            endpoint:
313e8b32c61668 Tomi Valkeinen 2023-06-19  155              $ref: /schemas/media/video-interfaces.yaml#
313e8b32c61668 Tomi Valkeinen 2023-06-19  156              unevaluatedProperties: false
313e8b32c61668 Tomi Valkeinen 2023-06-19  157              description:
313e8b32c61668 Tomi Valkeinen 2023-06-19  158                Endpoint for FPD-Link port. If the RX mode for this port is RAW,
313e8b32c61668 Tomi Valkeinen 2023-06-19  159                hsync-active and vsync-active must be defined.
313e8b32c61668 Tomi Valkeinen 2023-06-19  160  
313e8b32c61668 Tomi Valkeinen 2023-06-19  161        port@2:
313e8b32c61668 Tomi Valkeinen 2023-06-19  162          $ref: /schemas/graph.yaml#/$defs/port-base
313e8b32c61668 Tomi Valkeinen 2023-06-19  163          unevaluatedProperties: false
313e8b32c61668 Tomi Valkeinen 2023-06-19  164          description: FPD-Link input 2
313e8b32c61668 Tomi Valkeinen 2023-06-19  165  
313e8b32c61668 Tomi Valkeinen 2023-06-19  166          properties:
313e8b32c61668 Tomi Valkeinen 2023-06-19  167            endpoint:
313e8b32c61668 Tomi Valkeinen 2023-06-19  168              $ref: /schemas/media/video-interfaces.yaml#
313e8b32c61668 Tomi Valkeinen 2023-06-19  169              unevaluatedProperties: false
313e8b32c61668 Tomi Valkeinen 2023-06-19  170              description:
313e8b32c61668 Tomi Valkeinen 2023-06-19  171                Endpoint for FPD-Link port. If the RX mode for this port is RAW,
313e8b32c61668 Tomi Valkeinen 2023-06-19  172                hsync-active and vsync-active must be defined.
313e8b32c61668 Tomi Valkeinen 2023-06-19  173  
313e8b32c61668 Tomi Valkeinen 2023-06-19  174        port@3:
313e8b32c61668 Tomi Valkeinen 2023-06-19  175          $ref: /schemas/graph.yaml#/$defs/port-base
313e8b32c61668 Tomi Valkeinen 2023-06-19  176          unevaluatedProperties: false
313e8b32c61668 Tomi Valkeinen 2023-06-19  177          description: FPD-Link input 3
313e8b32c61668 Tomi Valkeinen 2023-06-19  178  
313e8b32c61668 Tomi Valkeinen 2023-06-19  179          properties:
313e8b32c61668 Tomi Valkeinen 2023-06-19  180            endpoint:
313e8b32c61668 Tomi Valkeinen 2023-06-19  181              $ref: /schemas/media/video-interfaces.yaml#
313e8b32c61668 Tomi Valkeinen 2023-06-19  182              unevaluatedProperties: false
313e8b32c61668 Tomi Valkeinen 2023-06-19  183              description:
313e8b32c61668 Tomi Valkeinen 2023-06-19  184                Endpoint for FPD-Link port. If the RX mode for this port is RAW,
313e8b32c61668 Tomi Valkeinen 2023-06-19  185                hsync-active and vsync-active must be defined.
313e8b32c61668 Tomi Valkeinen 2023-06-19  186  
313e8b32c61668 Tomi Valkeinen 2023-06-19  187        port@4:
313e8b32c61668 Tomi Valkeinen 2023-06-19  188          $ref: /schemas/graph.yaml#/$defs/port-base
313e8b32c61668 Tomi Valkeinen 2023-06-19  189          unevaluatedProperties: false
313e8b32c61668 Tomi Valkeinen 2023-06-19  190          description: CSI-2 Output 0
313e8b32c61668 Tomi Valkeinen 2023-06-19  191  
313e8b32c61668 Tomi Valkeinen 2023-06-19  192          properties:
313e8b32c61668 Tomi Valkeinen 2023-06-19  193            endpoint:
313e8b32c61668 Tomi Valkeinen 2023-06-19  194              $ref: /schemas/media/video-interfaces.yaml#
313e8b32c61668 Tomi Valkeinen 2023-06-19  195              unevaluatedProperties: false
313e8b32c61668 Tomi Valkeinen 2023-06-19  196  
313e8b32c61668 Tomi Valkeinen 2023-06-19  197              properties:
313e8b32c61668 Tomi Valkeinen 2023-06-19  198                data-lanes:
313e8b32c61668 Tomi Valkeinen 2023-06-19  199                  minItems: 1
313e8b32c61668 Tomi Valkeinen 2023-06-19  200                  maxItems: 4
313e8b32c61668 Tomi Valkeinen 2023-06-19  201                link-frequencies:
313e8b32c61668 Tomi Valkeinen 2023-06-19  202                  maxItems: 1
313e8b32c61668 Tomi Valkeinen 2023-06-19  203  
313e8b32c61668 Tomi Valkeinen 2023-06-19  204              required:
313e8b32c61668 Tomi Valkeinen 2023-06-19  205                - data-lanes
313e8b32c61668 Tomi Valkeinen 2023-06-19  206                - link-frequencies
313e8b32c61668 Tomi Valkeinen 2023-06-19  207  
313e8b32c61668 Tomi Valkeinen 2023-06-19  208        port@5:
313e8b32c61668 Tomi Valkeinen 2023-06-19  209          $ref: /schemas/graph.yaml#/$defs/port-base
313e8b32c61668 Tomi Valkeinen 2023-06-19  210          unevaluatedProperties: false
313e8b32c61668 Tomi Valkeinen 2023-06-19  211          description: CSI-2 Output 1
313e8b32c61668 Tomi Valkeinen 2023-06-19  212  
313e8b32c61668 Tomi Valkeinen 2023-06-19  213          properties:
313e8b32c61668 Tomi Valkeinen 2023-06-19  214            endpoint:
313e8b32c61668 Tomi Valkeinen 2023-06-19  215              $ref: /schemas/media/video-interfaces.yaml#
313e8b32c61668 Tomi Valkeinen 2023-06-19  216              unevaluatedProperties: false
313e8b32c61668 Tomi Valkeinen 2023-06-19  217  
313e8b32c61668 Tomi Valkeinen 2023-06-19  218              properties:
313e8b32c61668 Tomi Valkeinen 2023-06-19  219                data-lanes:
313e8b32c61668 Tomi Valkeinen 2023-06-19  220                  minItems: 1
313e8b32c61668 Tomi Valkeinen 2023-06-19  221                  maxItems: 4
313e8b32c61668 Tomi Valkeinen 2023-06-19  222                link-frequencies:
313e8b32c61668 Tomi Valkeinen 2023-06-19  223                  maxItems: 1
313e8b32c61668 Tomi Valkeinen 2023-06-19  224  
313e8b32c61668 Tomi Valkeinen 2023-06-19  225              required:
313e8b32c61668 Tomi Valkeinen 2023-06-19  226                - data-lanes
313e8b32c61668 Tomi Valkeinen 2023-06-19  227                - link-frequencies
313e8b32c61668 Tomi Valkeinen 2023-06-19  228  
313e8b32c61668 Tomi Valkeinen 2023-06-19  229      required:
313e8b32c61668 Tomi Valkeinen 2023-06-19  230        - port@0
313e8b32c61668 Tomi Valkeinen 2023-06-19  231        - port@1
313e8b32c61668 Tomi Valkeinen 2023-06-19  232        - port@2
313e8b32c61668 Tomi Valkeinen 2023-06-19  233        - port@3
313e8b32c61668 Tomi Valkeinen 2023-06-19  234        - port@4
313e8b32c61668 Tomi Valkeinen 2023-06-19  235        - port@5
313e8b32c61668 Tomi Valkeinen 2023-06-19  236  
313e8b32c61668 Tomi Valkeinen 2023-06-19  237  required:
313e8b32c61668 Tomi Valkeinen 2023-06-19  238    - compatible
313e8b32c61668 Tomi Valkeinen 2023-06-19  239    - reg
313e8b32c61668 Tomi Valkeinen 2023-06-19  240    - clocks
313e8b32c61668 Tomi Valkeinen 2023-06-19  241    - clock-names
313e8b32c61668 Tomi Valkeinen 2023-06-19  242    - ports
313e8b32c61668 Tomi Valkeinen 2023-06-19  243  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
