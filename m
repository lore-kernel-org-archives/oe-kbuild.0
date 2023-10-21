Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B791871
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Oct 2023 07:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FwFaqs8k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697872797; x=1729408797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AElYoYXpLk7OY1IeqLmlPRTvBnDZQwoXDK0yI29/rNk=;
  b=FwFaqs8k5e/gwzKnh8Mdcx3LbBxjTSLmYfGSsr3CbD3HPV/WzZNyZG8x
   j0eMaAw3H111qT6YBl/uOaMlaFPWwgqCqA+QGzCNIn4ycITvtra7O4Iih
   Q0VhoZr7O/17EGD1HYNyDSbfvrhvK4tmbLqvJXEIfRGeTgdSuY8bZ7WB3
   V++52Rm4oSEVf+cKxVj7CQ7mdL+/hKz9bvtHMlc+9YSbvtA7slYz2Ojzd
   XA2dt70vS4fIvgbcUP68RWN/s64PEeA9lZiTcUCikQvlZM8OxlzBTvo4q
   sevfNVrkkH0Rxnke2AUfpKVQJq2nO+mmI9EAfzp6xFc85YUAHEvZTuWg+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="390504946"
X-IronPort-AV: E=Sophos;i="6.03,240,1694761200"; 
   d="scan'208";a="390504946"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 00:19:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="792613685"
X-IronPort-AV: E=Sophos;i="6.03,240,1694761200"; 
   d="scan'208";a="792613685"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 21 Oct 2023 00:19:55 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qu6H3-0004Yk-0U;
	Sat, 21 Oct 2023 07:19:53 +0000
Date: Sat, 21 Oct 2023 15:19:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next v3 1/6] dt-bindings: marvell: Rewrite MV88E6xxx
 in schema
Message-ID: <202310211534.sOr0IaKA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/net/dsa/marvell,mv88e6xxx.yaml:78:5: [error] syntax error: could not find expected ':' (syntax)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231016-marvell-88e6152-wan-led-v3-1-38cd449dfb15@linaro.org>
References: <20231016-marvell-88e6152-wan-led-v3-1-38cd449dfb15@linaro.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Andrew Lunn <andrew@lunn.ch>
TO: Gregory Clement <gregory.clement@bootlin.com>
TO: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Russell King <linux@armlinux.org.uk>
TO: Florian Fainelli <f.fainelli@gmail.com>
TO: Vladimir Oltean <olteanv@gmail.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
CC: Christian Marangi <ansuelsmth@gmail.com>
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Linus Walleij <linus.walleij@linaro.org>

Hi Linus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0bb80ecc33a8fb5a682236443c1e740d5c917d1d]

url:    https://github.com/intel-lab-lkp/linux/commits/Linus-Walleij/dt-bindings-marvell-Rewrite-MV88E6xxx-in-schema/20231017-141543
base:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
patch link:    https://lore.kernel.org/r/20231016-marvell-88e6152-wan-led-v3-1-38cd449dfb15%40linaro.org
patch subject: [PATCH net-next v3 1/6] dt-bindings: marvell: Rewrite MV88E6xxx in schema
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231021/202310211534.sOr0IaKA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310211534.sOr0IaKA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/net/dsa/marvell,mv88e6xxx.yaml:78:5: [error] syntax error: could not find expected ':' (syntax)
--
>> Documentation/devicetree/bindings/net/dsa/marvell,mv88e6xxx.yaml:78:5: could not find expected ':'
--
>> Documentation/devicetree/bindings/net/dsa/marvell,mv88e6xxx.yaml: ignoring, error parsing file

vim +78 Documentation/devicetree/bindings/net/dsa/marvell,mv88e6xxx.yaml

99536addb45ad1 Linus Walleij 2023-10-16   8  
99536addb45ad1 Linus Walleij 2023-10-16   9  maintainers:
99536addb45ad1 Linus Walleij 2023-10-16  10    - Andrew Lunn <andrew@lunn.ch>
99536addb45ad1 Linus Walleij 2023-10-16  11  
99536addb45ad1 Linus Walleij 2023-10-16  12  description:
99536addb45ad1 Linus Walleij 2023-10-16  13    The Marvell MV88E6xxx switch series has been produced and sold
99536addb45ad1 Linus Walleij 2023-10-16  14    by Marvell since at least 2010. The switch has a few compatibles which
99536addb45ad1 Linus Walleij 2023-10-16  15    just indicate the base address of the switch, then operating systems
99536addb45ad1 Linus Walleij 2023-10-16  16    can investigate switch ID registers to find out which actual version
99536addb45ad1 Linus Walleij 2023-10-16  17    of the switch it is dealing with.
99536addb45ad1 Linus Walleij 2023-10-16  18  
99536addb45ad1 Linus Walleij 2023-10-16  19  properties:
99536addb45ad1 Linus Walleij 2023-10-16  20    compatible:
99536addb45ad1 Linus Walleij 2023-10-16  21      oneOf:
99536addb45ad1 Linus Walleij 2023-10-16  22        - enum:
99536addb45ad1 Linus Walleij 2023-10-16  23            - marvell,mv88e6085
99536addb45ad1 Linus Walleij 2023-10-16  24            - marvell,mv88e6190
99536addb45ad1 Linus Walleij 2023-10-16  25            - marvell,mv88e6250
99536addb45ad1 Linus Walleij 2023-10-16  26      description: |
99536addb45ad1 Linus Walleij 2023-10-16  27        marvell,mv88e6085: This switch uses base address 0x10.
99536addb45ad1 Linus Walleij 2023-10-16  28          This switch and its siblings will be autodetected from
99536addb45ad1 Linus Walleij 2023-10-16  29          ID registers found in the switch, so only "marvell,mv88e6085" should be
99536addb45ad1 Linus Walleij 2023-10-16  30          specified. This includes the following list of MV88Exxxx switches:
99536addb45ad1 Linus Walleij 2023-10-16  31          6085, 6095, 6097, 6123, 6131, 6141, 6161, 6165, 6171, 6172, 6175, 6176,
99536addb45ad1 Linus Walleij 2023-10-16  32          6185, 6240, 6320, 6321, 6341, 6350, 6351, 6352
99536addb45ad1 Linus Walleij 2023-10-16  33        marvell,mv88e6190: This switch uses base address 0x00.
99536addb45ad1 Linus Walleij 2023-10-16  34          This switch and its siblings will be autodetected from
99536addb45ad1 Linus Walleij 2023-10-16  35          ID registers found in the switch, so only "marvell,mv88e6190" should be
99536addb45ad1 Linus Walleij 2023-10-16  36          specified. This includes the following list of MV88Exxxx switches:
99536addb45ad1 Linus Walleij 2023-10-16  37          6190, 6190X, 6191, 6290, 6361, 6390, 6390X
99536addb45ad1 Linus Walleij 2023-10-16  38        marvell,mv88e6250: This switch uses base address 0x08 or 0x18.
99536addb45ad1 Linus Walleij 2023-10-16  39          This switch and its siblings will be autodetected from
99536addb45ad1 Linus Walleij 2023-10-16  40          ID registers found in the switch, so only "marvell,mv88e6250" should be
99536addb45ad1 Linus Walleij 2023-10-16  41          specified. This includes the following list of MV88Exxxx switches:
99536addb45ad1 Linus Walleij 2023-10-16  42          6220, 6250
99536addb45ad1 Linus Walleij 2023-10-16  43  
99536addb45ad1 Linus Walleij 2023-10-16  44    reg:
99536addb45ad1 Linus Walleij 2023-10-16  45      maxItems: 1
99536addb45ad1 Linus Walleij 2023-10-16  46  
99536addb45ad1 Linus Walleij 2023-10-16  47    eeprom-length:
99536addb45ad1 Linus Walleij 2023-10-16  48      $ref: /schemas/types.yaml#/definitions/uint32
99536addb45ad1 Linus Walleij 2023-10-16  49      description: Set to the length of an EEPROM connected to the switch. Must be
99536addb45ad1 Linus Walleij 2023-10-16  50        set if the switch can not detect the presence and/or size of a connected
99536addb45ad1 Linus Walleij 2023-10-16  51        EEPROM, otherwise optional.
99536addb45ad1 Linus Walleij 2023-10-16  52  
99536addb45ad1 Linus Walleij 2023-10-16  53    reset-gpios:
99536addb45ad1 Linus Walleij 2023-10-16  54      description:
99536addb45ad1 Linus Walleij 2023-10-16  55        GPIO to be used to reset the whole device
99536addb45ad1 Linus Walleij 2023-10-16  56      maxItems: 1
99536addb45ad1 Linus Walleij 2023-10-16  57  
99536addb45ad1 Linus Walleij 2023-10-16  58    interrupts:
99536addb45ad1 Linus Walleij 2023-10-16  59      description: The switch provides an external interrupt line, but it is
99536addb45ad1 Linus Walleij 2023-10-16  60        not always used by target systems.
99536addb45ad1 Linus Walleij 2023-10-16  61      maxItems: 1
99536addb45ad1 Linus Walleij 2023-10-16  62  
99536addb45ad1 Linus Walleij 2023-10-16  63    interrupt-controller:
99536addb45ad1 Linus Walleij 2023-10-16  64      description: The switch has an internal interrupt controller used by
99536addb45ad1 Linus Walleij 2023-10-16  65        the different sub-blocks.
99536addb45ad1 Linus Walleij 2023-10-16  66  
99536addb45ad1 Linus Walleij 2023-10-16  67    '#interrupt-cells':
99536addb45ad1 Linus Walleij 2023-10-16  68      description: The internal interrupt controller only supports triggering
99536addb45ad1 Linus Walleij 2023-10-16  69        on active high level interrupts so the second cell must alway be set to
99536addb45ad1 Linus Walleij 2023-10-16  70        IRQ_TYPE_LEVEL_HIGH.
99536addb45ad1 Linus Walleij 2023-10-16  71      const: 2
99536addb45ad1 Linus Walleij 2023-10-16  72  
99536addb45ad1 Linus Walleij 2023-10-16  73    mdio:
99536addb45ad1 Linus Walleij 2023-10-16  74      $ref: /schemas/net/mdio.yaml#
99536addb45ad1 Linus Walleij 2023-10-16  75      unevaluatedProperties: false
99536addb45ad1 Linus Walleij 2023-10-16  76      description: Marvell MV88E6xxx switches have an varying combination of
99536addb45ad1 Linus Walleij 2023-10-16  77      internal and external MDIO buses, in some cases a combined bus that
99536addb45ad1 Linus Walleij 2023-10-16 @78      can be used both internally and externally. This node is for the
99536addb45ad1 Linus Walleij 2023-10-16  79      primary bus, used internally and sometimes also externally.
99536addb45ad1 Linus Walleij 2023-10-16  80  
99536addb45ad1 Linus Walleij 2023-10-16  81    mdio-external:
99536addb45ad1 Linus Walleij 2023-10-16  82      $ref: /schemas/net/mdio.yaml#
99536addb45ad1 Linus Walleij 2023-10-16  83      unevaluatedProperties: false
99536addb45ad1 Linus Walleij 2023-10-16  84      description: Marvell MV88E6xxx switches that have a separate external
99536addb45ad1 Linus Walleij 2023-10-16  85        MDIO bus use this port to access external components on the MDIO bus.
99536addb45ad1 Linus Walleij 2023-10-16  86  
99536addb45ad1 Linus Walleij 2023-10-16  87      properties:
99536addb45ad1 Linus Walleij 2023-10-16  88        compatible:
99536addb45ad1 Linus Walleij 2023-10-16  89          const: marvell,mv88e6xxx-mdio-external
99536addb45ad1 Linus Walleij 2023-10-16  90  
99536addb45ad1 Linus Walleij 2023-10-16  91      required:
99536addb45ad1 Linus Walleij 2023-10-16  92        - compatible
99536addb45ad1 Linus Walleij 2023-10-16  93  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
