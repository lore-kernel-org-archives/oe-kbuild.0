Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352742857F0
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Dec 2025 18:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767206574; cv=none; b=JeTFaiuiUMelPopBqc5yZ5IvkTBU9YwPI8IE2pS4slObATSi00Wj2xxtOaWun7r2qe3iZEiZpsedIdc8R4pROK309LiBX4dxuuxc0M1vLx3KX9NFRh9dlAoGhkGpmBYW17Ow4O3VdbjpLuH3l2syf2s92jQeCVJSAFxZ9YVhmyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767206574; c=relaxed/simple;
	bh=kBrbsxGn12a31jRnRqUss74t5dOtlqLlywmKl6vP6nk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WEp3ORhfuXnxNeThIQNDvoauGoWx+FfALp+MCBPn9fOkqfLUB5Qiitc13nJX5gfM6O4B2W4Hs9G8X/pRkz2aRN0W41dCbBz96nR/+o6gFHWTfR1A03VtfPeFl1ZtILV2mNYmAUbvjRj8zjc7+2tAC3UHW/7zxZL4nRuUTxH1UW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bJfhXDUP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bJfhXDUP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767206572; x=1798742572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kBrbsxGn12a31jRnRqUss74t5dOtlqLlywmKl6vP6nk=;
  b=bJfhXDUP+DhXxPMO9ujw9+kLrZmQ1mXccxFXn/mP+BZx2Q19BHcbMtlU
   mhN3pOf201DXS59Pj6nQoJCBwkNRYOuMYZt55YzUJtAlcFiNs37NKZbcw
   yjqATkane1wyIb9mA9m636qtbBCH30Ze99Yp2ksRrMohRe05BuXf6/Oxd
   6wDFgeFQoCeVzEJYZZu8UEvejD2IUfltBXmPqGFVYPIaB8Iec2gm4h8lL
   PCLno9E7+AAqcx15EaJ6p8GwVv3vB4keBPxsA00HWE2tNBouM2bkq1vTY
   oe+HZpBd6txSJaWHA0rHs9NZvOtyhJD5wQiDeMlf/zUe+LfbhsiRC74e8
   g==;
X-CSE-ConnectionGUID: HjyGUwLXRjWepg9TtEGlVg==
X-CSE-MsgGUID: xs5VDv2eSmudafSjhoIOwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="94238692"
X-IronPort-AV: E=Sophos;i="6.21,192,1763452800"; 
   d="scan'208";a="94238692"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 10:42:51 -0800
X-CSE-ConnectionGUID: TKAQ8CRrRKWAhiAMBbQaAw==
X-CSE-MsgGUID: oat9SPUmQimq7P/i9GPEyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,192,1763452800"; 
   d="scan'208";a="200641405"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 31 Dec 2025 10:42:51 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vb19j-0000000005B-3xxJ;
	Wed, 31 Dec 2025 18:42:47 +0000
Date: Wed, 31 Dec 2025 19:42:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:pinctrl 9/14]
 =?us-ascii?Q?Documentation/devicetree/bindings/pinctrl/microchip,mpfs-?=
 =?us-ascii?Q?pinctrl-mssio.yaml:95:1:?= [warning] too many blank lines (2
 > 1) (empty-lines)
Message-ID: <202512311908.l3YhkwlV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   a8805fb8a49841ef67f240537e28ed40ce539661
commit: 46b4a4b77e6a6e030c2ed93f25c55826250b1669 [9/14] dt-bindings: pinctrl: document polarfire soc mssio pin controller
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: arc-randconfig-2051-20251231 (https://download.01.org/0day-ci/archive/20251231/202512311908.l3YhkwlV-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251231/202512311908.l3YhkwlV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512311908.l3YhkwlV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml:212:6: [warning] wrong indentation: expected 6 but found 5 (indentation)
>> Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml:95:1: [warning] too many blank lines (2 > 1) (empty-lines)

vim +95 Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml

46b4a4b77e6a6e0 Conor Dooley 2025-09-29   8  
46b4a4b77e6a6e0 Conor Dooley 2025-09-29   9  maintainers:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  10    - Conor Dooley <conor.dooley@microchip.com>
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  11  
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  12  properties:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  13    compatible:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  14      oneOf:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  15        - const: microchip,mpfs-pinctrl-mssio
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  16        - items:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  17            - const: microchip,pic64gx-pinctrl-mssio
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  18            - const: microchip,mpfs-pinctrl-mssio
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  19  
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  20    reg:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  21      maxItems: 1
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  22  
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  23    pinctrl-use-default: true
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  24  
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  25  patternProperties:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  26    '-cfg$':
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  27      type: object
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  28      additionalProperties: false
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  29  
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  30      patternProperties:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  31        '-pins$':
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  32          type: object
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  33          additionalProperties: false
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  34  
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  35          allOf:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  36            - $ref: pincfg-node.yaml#
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  37            - $ref: pinmux-node.yaml#
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  38  
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  39          properties:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  40            pins:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  41              description:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  42                The list of IOs that properties in the pincfg node apply to.
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  43  
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  44            function:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  45              description:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  46                A string containing the name of the function to mux for these
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  47                pins. The "reserved" function tristates a pin.
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  48              enum: [ sd, emmc, qspi, spi, usb, uart, i2c, can, mdio, misc
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  49                      reserved, gpio, fabric-test, tied-low, tied-high, tristate ]
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  50  
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  51            bias-bus-hold: true
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  52            bias-disable: true
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  53            bias-pull-down: true
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  54            bias-pull-up: true
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  55            input-schmitt-enable: true
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  56            low-power-enable: true
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  57  
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  58            drive-strength:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  59              enum: [ 2, 4, 6, 8, 10, 12, 16, 20 ]
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  60  
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  61            microchip,bank-voltage-microvolt:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  62              description:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  63                Which bank voltage to use. This cannot differ for pins in a
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  64                given bank, the whole bank uses the same voltage.
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  65              enum: [ 1200000, 1500000, 1800000, 2500000, 3300000 ]
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  66  
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  67            microchip,clamp-diode:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  68              $ref: /schemas/types.yaml#/definitions/flag
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  69              description:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  70                Reflects the "Clamp Diode" setting in the MSS Configurator for
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  71                this pin. This setting controls whether or not input voltage
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  72                clamping should be enabled.
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  73  
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  74            microchip,ibufmd:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  75              $ref: /schemas/types.yaml#/definitions/uint32
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  76              default: 0
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  77              description:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  78                Reflects the "IBUFMD" bits in the MSS Configurator output files
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  79                for this pin.
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  80  
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  81          required:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  82            - pins
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  83            - function
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  84            - microchip,bank-voltage-microvolt
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  85  
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  86          if:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  87            properties:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  88              microchip,bank-voltage-microvolt:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  89                contains:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  90                  enum: [ 1200000, 1500000, 1800000 ]
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  91          then:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  92            required:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  93              - input-schmitt-enable
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  94  
46b4a4b77e6a6e0 Conor Dooley 2025-09-29 @95  
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  96  required:
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  97    - compatible
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  98    - reg
46b4a4b77e6a6e0 Conor Dooley 2025-09-29  99  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
