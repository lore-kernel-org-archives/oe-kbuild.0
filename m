Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0886266B67
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Jan 2026 09:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769594396; cv=none; b=jdZBRPjtR9S5Nic05ggL9wrm9ay4P87cMFTEqKF8baAXI6ABLmHQLeQaHj7k03p7nQxoJoCE4LcdSAC8i0uVy7OPxl//3y6fVCbNYJ4QzZwZRCjqGxeKnECBowRQUlk0tNhdULdeah76VGa0IdiEdpjg40Nl1OrhTRzUWLnoDj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769594396; c=relaxed/simple;
	bh=3vMiDZtAV4w012uL5nDmvslo3Tj8tfrvzWyUXSIOTVI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UNc84KGOcxQy8TAL3AqNb7hAbEvJmFj/JMAC2J2QTEQLRDuBBU7Zhvv3awA5QPtynmMcDQXAlwJyUyqkUwvgSDlPIIBSW2s86h/ggSkDOe+JZvs8r7mP9b+/ncUeBB0aF27dA+v5bc9Ue0PAEqEN9VuL1ssEOxqMI2s88ib5U1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F9fMsvRa; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F9fMsvRa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769594395; x=1801130395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3vMiDZtAV4w012uL5nDmvslo3Tj8tfrvzWyUXSIOTVI=;
  b=F9fMsvRaQRdyQgY8ipPVms/BZMFcgQR33jFYzXQQxvIKNSoZm/XKgM2P
   FlFXZ290HoPdfl/R7vCNR2357PNN1pgjUy3cPmLS6PL3iA+2oCUP0dqxh
   z6eb1b7r5fWC8NNVhEsuQdUPDc8QK3/fNUMr42tmyHZMoXRz8hCj7fQZG
   JzsRtXYAcPAOfY6YOi3PTBDGx56GF8I//2dwgpJlqUL7o7eI8/Owe3k47
   jKy4QanZTFOGv1DO/0Ex6RatfQmQcKzu10LXYhJA1U2x/T1am8CofzzMR
   X2MAZOCaCEA+TKePO+qQuQQEIz5qyeeqzoJBwkDlQoZgKLU420PPGFind
   A==;
X-CSE-ConnectionGUID: T3+1gYblR4qUOyR8jZFkfQ==
X-CSE-MsgGUID: AlIajkoQTg68xlICVgrpPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81118145"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="81118145"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 01:59:54 -0800
X-CSE-ConnectionGUID: 2kCvhEoIR9CgEpnqWKcO7A==
X-CSE-MsgGUID: CPN9ZcSGQNioE0NTJ3yh9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="213092380"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 28 Jan 2026 01:59:45 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl2Ks-0000000022P-3aR6;
	Wed, 28 Jan 2026 09:59:42 +0000
Date: Wed, 28 Jan 2026 10:59:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: dsa: lantiq,gswip:
 reference common PHY properties
Message-ID: <202601281040.3jyVvQ2t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml:108:9: found duplicate key "$ref" with value "/schemas/phy/phy-common-props.yaml#" (original value: "dsa-port.yaml#")"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <d9b6212ad5137feeb58b28e9b0784f1084c813df.1769519758.git.daniel@makrotopia.org>
References: <d9b6212ad5137feeb58b28e9b0784f1084c813df.1769519758.git.daniel@makrotopia.org>
TO: Daniel Golle <daniel@makrotopia.org>
TO: Hauke Mehrtens <hauke@hauke-m.de>
TO: Andrew Lunn <andrew@lunn.ch>
TO: Vladimir Oltean <olteanv@gmail.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org

Hi Daniel,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Golle/dt-bindings-net-dsa-lantiq-gswip-reference-common-PHY-properties/20260127-212205
base:   net-next/main
patch link:    https://lore.kernel.org/r/d9b6212ad5137feeb58b28e9b0784f1084c813df.1769519758.git.daniel%40makrotopia.org
patch subject: [PATCH net-next 1/3] dt-bindings: net: dsa: lantiq,gswip: reference common PHY properties
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: openrisc-randconfig-2052-20260128 (https://download.01.org/0day-ci/archive/20260128/202601281040.3jyVvQ2t-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281040.3jyVvQ2t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601281040.3jyVvQ2t-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/net/dsa/lantiq,gswip.example.dts] Error 1
   make[3]: *** Deleting file 'Documentation/devicetree/bindings/net/dsa/lantiq,gswip.example.dts'
   make[3]: Target 'dt_binding_check' not remade because of errors.

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml:108:9: found duplicate key "$ref" with value "/schemas/phy/phy-common-props.yaml#" (original value: "dsa-port.yaml#")
--
>> Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml:108:9: [error] duplication of key "$ref" in mapping (key-duplicates)

vim +108 Documentation/devicetree/bindings/net/dsa/lantiq,gswip.yaml

c7f75954212b5e Martin Schiller    2024-06-11   15  
c7f75954212b5e Martin Schiller    2024-06-11   16  maintainers:
c7f75954212b5e Martin Schiller    2024-06-11   17    - Hauke Mehrtens <hauke@hauke-m.de>
c7f75954212b5e Martin Schiller    2024-06-11   18  
c7f75954212b5e Martin Schiller    2024-06-11   19  properties:
c7f75954212b5e Martin Schiller    2024-06-11   20    compatible:
c7f75954212b5e Martin Schiller    2024-06-11   21      enum:
e7e354aa496b1b Daniel Golle       2026-01-22   22        - intel,gsw150
e7e354aa496b1b Daniel Golle       2026-01-22   23        - lantiq,peb7084
c7f75954212b5e Martin Schiller    2024-06-11   24        - lantiq,xrx200-gswip
c7f75954212b5e Martin Schiller    2024-06-11   25        - lantiq,xrx300-gswip
c7f75954212b5e Martin Schiller    2024-06-11   26        - lantiq,xrx330-gswip
e1bb4b36a7ae09 Daniel Golle       2025-11-03   27        - maxlinear,gsw120
e1bb4b36a7ae09 Daniel Golle       2025-11-03   28        - maxlinear,gsw125
e1bb4b36a7ae09 Daniel Golle       2025-11-03   29        - maxlinear,gsw140
e1bb4b36a7ae09 Daniel Golle       2025-11-03   30        - maxlinear,gsw141
e1bb4b36a7ae09 Daniel Golle       2025-11-03   31        - maxlinear,gsw145
c7f75954212b5e Martin Schiller    2024-06-11   32  
c7f75954212b5e Martin Schiller    2024-06-11   33    reg:
e1bb4b36a7ae09 Daniel Golle       2025-11-03   34      minItems: 1
c7f75954212b5e Martin Schiller    2024-06-11   35      maxItems: 3
c7f75954212b5e Martin Schiller    2024-06-11   36  
c7f75954212b5e Martin Schiller    2024-06-11   37    reg-names:
c7f75954212b5e Martin Schiller    2024-06-11   38      items:
c7f75954212b5e Martin Schiller    2024-06-11   39        - const: switch
c7f75954212b5e Martin Schiller    2024-06-11   40        - const: mdio
c7f75954212b5e Martin Schiller    2024-06-11   41        - const: mii
c7f75954212b5e Martin Schiller    2024-06-11   42  
c7f75954212b5e Martin Schiller    2024-06-11   43    mdio:
c7f75954212b5e Martin Schiller    2024-06-11   44      $ref: /schemas/net/mdio.yaml#
c7f75954212b5e Martin Schiller    2024-06-11   45      unevaluatedProperties: false
c7f75954212b5e Martin Schiller    2024-06-11   46  
c7f75954212b5e Martin Schiller    2024-06-11   47      properties:
c7f75954212b5e Martin Schiller    2024-06-11   48        compatible:
c7f75954212b5e Martin Schiller    2024-06-11   49          const: lantiq,xrx200-mdio
c7f75954212b5e Martin Schiller    2024-06-11   50  
c7f75954212b5e Martin Schiller    2024-06-11   51    gphy-fw:
c7f75954212b5e Martin Schiller    2024-06-11   52      type: object
c7f75954212b5e Martin Schiller    2024-06-11   53      properties:
c7f75954212b5e Martin Schiller    2024-06-11   54        '#address-cells':
c7f75954212b5e Martin Schiller    2024-06-11   55          const: 1
c7f75954212b5e Martin Schiller    2024-06-11   56  
c7f75954212b5e Martin Schiller    2024-06-11   57        '#size-cells':
c7f75954212b5e Martin Schiller    2024-06-11   58          const: 0
c7f75954212b5e Martin Schiller    2024-06-11   59  
c7f75954212b5e Martin Schiller    2024-06-11   60        compatible:
c7f75954212b5e Martin Schiller    2024-06-11   61          items:
c7f75954212b5e Martin Schiller    2024-06-11   62            - enum:
c7f75954212b5e Martin Schiller    2024-06-11   63                - lantiq,xrx200-gphy-fw
c7f75954212b5e Martin Schiller    2024-06-11   64                - lantiq,xrx300-gphy-fw
c7f75954212b5e Martin Schiller    2024-06-11   65                - lantiq,xrx330-gphy-fw
c7f75954212b5e Martin Schiller    2024-06-11   66            - const: lantiq,gphy-fw
c7f75954212b5e Martin Schiller    2024-06-11   67  
c7f75954212b5e Martin Schiller    2024-06-11   68        lantiq,rcu:
c7f75954212b5e Martin Schiller    2024-06-11   69          $ref: /schemas/types.yaml#/definitions/phandle
c7f75954212b5e Martin Schiller    2024-06-11   70          description: phandle to the RCU syscon
c7f75954212b5e Martin Schiller    2024-06-11   71  
c7f75954212b5e Martin Schiller    2024-06-11   72      patternProperties:
c7f75954212b5e Martin Schiller    2024-06-11   73        "^gphy@[0-9a-f]{1,2}$":
c7f75954212b5e Martin Schiller    2024-06-11   74          type: object
c7f75954212b5e Martin Schiller    2024-06-11   75  
c7f75954212b5e Martin Schiller    2024-06-11   76          additionalProperties: false
c7f75954212b5e Martin Schiller    2024-06-11   77  
c7f75954212b5e Martin Schiller    2024-06-11   78          properties:
c7f75954212b5e Martin Schiller    2024-06-11   79            reg:
c7f75954212b5e Martin Schiller    2024-06-11   80              minimum: 0
c7f75954212b5e Martin Schiller    2024-06-11   81              maximum: 255
c7f75954212b5e Martin Schiller    2024-06-11   82              description:
c7f75954212b5e Martin Schiller    2024-06-11   83                Offset of the GPHY firmware register in the RCU register range
c7f75954212b5e Martin Schiller    2024-06-11   84  
c7f75954212b5e Martin Schiller    2024-06-11   85            resets:
c7f75954212b5e Martin Schiller    2024-06-11   86              items:
c7f75954212b5e Martin Schiller    2024-06-11   87                - description: GPHY reset line
c7f75954212b5e Martin Schiller    2024-06-11   88  
c7f75954212b5e Martin Schiller    2024-06-11   89            reset-names:
c7f75954212b5e Martin Schiller    2024-06-11   90              items:
c7f75954212b5e Martin Schiller    2024-06-11   91                - const: gphy
c7f75954212b5e Martin Schiller    2024-06-11   92  
c7f75954212b5e Martin Schiller    2024-06-11   93          required:
c7f75954212b5e Martin Schiller    2024-06-11   94            - reg
c7f75954212b5e Martin Schiller    2024-06-11   95  
c7f75954212b5e Martin Schiller    2024-06-11   96      required:
c7f75954212b5e Martin Schiller    2024-06-11   97        - compatible
c7f75954212b5e Martin Schiller    2024-06-11   98        - lantiq,rcu
c7f75954212b5e Martin Schiller    2024-06-11   99  
c7f75954212b5e Martin Schiller    2024-06-11  100      additionalProperties: false
c7f75954212b5e Martin Schiller    2024-06-11  101  
e836824116b564 Daniel Golle       2025-11-03  102  patternProperties:
e836824116b564 Daniel Golle       2025-11-03  103    "^(ethernet-)?ports$":
e836824116b564 Daniel Golle       2025-11-03  104      type: object
e836824116b564 Daniel Golle       2025-11-03  105      patternProperties:
e836824116b564 Daniel Golle       2025-11-03  106        "^(ethernet-)?port@[0-6]$":
e836824116b564 Daniel Golle       2025-11-03  107          $ref: dsa-port.yaml#
17139a90d6c37e Daniel Golle       2026-01-27 @108          $ref: /schemas/phy/phy-common-props.yaml#
e836824116b564 Daniel Golle       2025-11-03  109          unevaluatedProperties: false
e836824116b564 Daniel Golle       2025-11-03  110  
e836824116b564 Daniel Golle       2025-11-03  111          properties:
4cc265663da549 Alexander Sverdlin 2026-01-14  112            maxlinear,slew-rate-txc:
4cc265663da549 Alexander Sverdlin 2026-01-14  113              $ref: /schemas/types.yaml#/definitions/uint32
4cc265663da549 Alexander Sverdlin 2026-01-14  114              enum: [0, 1]
4cc265663da549 Alexander Sverdlin 2026-01-14  115              description: |
4cc265663da549 Alexander Sverdlin 2026-01-14  116                RMII/RGMII TX Clock Slew Rate:
4cc265663da549 Alexander Sverdlin 2026-01-14  117  
4cc265663da549 Alexander Sverdlin 2026-01-14  118                  0: Normal
4cc265663da549 Alexander Sverdlin 2026-01-14  119                  1: Slow
4cc265663da549 Alexander Sverdlin 2026-01-14  120  
4cc265663da549 Alexander Sverdlin 2026-01-14  121                If not present, the configuration made by the switch bootloader is
4cc265663da549 Alexander Sverdlin 2026-01-14  122                preserved.
4cc265663da549 Alexander Sverdlin 2026-01-14  123            maxlinear,slew-rate-txd:
4cc265663da549 Alexander Sverdlin 2026-01-14  124              $ref: /schemas/types.yaml#/definitions/uint32
4cc265663da549 Alexander Sverdlin 2026-01-14  125              enum: [0, 1]
4cc265663da549 Alexander Sverdlin 2026-01-14  126              description: |
4cc265663da549 Alexander Sverdlin 2026-01-14  127                RMII/RGMII TX Non-Clock PAD Slew Rate:
4cc265663da549 Alexander Sverdlin 2026-01-14  128  
4cc265663da549 Alexander Sverdlin 2026-01-14  129                  0: Normal
4cc265663da549 Alexander Sverdlin 2026-01-14  130                  1: Slow
4cc265663da549 Alexander Sverdlin 2026-01-14  131  
4cc265663da549 Alexander Sverdlin 2026-01-14  132                If not present, the configuration made by the switch bootloader is
4cc265663da549 Alexander Sverdlin 2026-01-14  133                preserved.
e836824116b564 Daniel Golle       2025-11-03  134            maxlinear,rmii-refclk-out:
e836824116b564 Daniel Golle       2025-11-03  135              type: boolean
e836824116b564 Daniel Golle       2025-11-03  136              description:
e836824116b564 Daniel Golle       2025-11-03  137                Configure the RMII reference clock to be a clock output
e836824116b564 Daniel Golle       2025-11-03  138                rather than an input. Only applicable for RMII mode.
bea0c177861161 Daniel Golle       2025-11-03  139            tx-internal-delay-ps:
bea0c177861161 Daniel Golle       2025-11-03  140              enum: [0, 500, 1000, 1500, 2000, 2500, 3000, 3500]
bea0c177861161 Daniel Golle       2025-11-03  141              description:
bea0c177861161 Daniel Golle       2025-11-03  142                RGMII TX Clock Delay defined in pico seconds.
bea0c177861161 Daniel Golle       2025-11-03  143                The delay lines adjust the MII clock vs. data timing.
bea0c177861161 Daniel Golle       2025-11-03  144                If this property is not present the delay is determined by
bea0c177861161 Daniel Golle       2025-11-03  145                the interface mode.
bea0c177861161 Daniel Golle       2025-11-03  146            rx-internal-delay-ps:
bea0c177861161 Daniel Golle       2025-11-03  147              enum: [0, 500, 1000, 1500, 2000, 2500, 3000, 3500]
bea0c177861161 Daniel Golle       2025-11-03  148              description:
bea0c177861161 Daniel Golle       2025-11-03  149                RGMII RX Clock Delay defined in pico seconds.
bea0c177861161 Daniel Golle       2025-11-03  150                The delay lines adjust the MII clock vs. data timing.
bea0c177861161 Daniel Golle       2025-11-03  151                If this property is not present the delay is determined by
bea0c177861161 Daniel Golle       2025-11-03  152                the interface mode.
e836824116b564 Daniel Golle       2025-11-03  153  
c7f75954212b5e Martin Schiller    2024-06-11  154  required:
c7f75954212b5e Martin Schiller    2024-06-11  155    - compatible
c7f75954212b5e Martin Schiller    2024-06-11  156    - reg
c7f75954212b5e Martin Schiller    2024-06-11  157  
e1bb4b36a7ae09 Daniel Golle       2025-11-03  158  allOf:
e1bb4b36a7ae09 Daniel Golle       2025-11-03  159    - if:
e1bb4b36a7ae09 Daniel Golle       2025-11-03  160        properties:
e1bb4b36a7ae09 Daniel Golle       2025-11-03  161          compatible:
e1bb4b36a7ae09 Daniel Golle       2025-11-03  162            contains:
e1bb4b36a7ae09 Daniel Golle       2025-11-03  163              enum:
e1bb4b36a7ae09 Daniel Golle       2025-11-03  164                - lantiq,xrx200-gswip
e1bb4b36a7ae09 Daniel Golle       2025-11-03  165                - lantiq,xrx300-gswip
e1bb4b36a7ae09 Daniel Golle       2025-11-03  166                - lantiq,xrx330-gswip
e1bb4b36a7ae09 Daniel Golle       2025-11-03  167      then:
e1bb4b36a7ae09 Daniel Golle       2025-11-03  168        properties:
e1bb4b36a7ae09 Daniel Golle       2025-11-03  169          reg:
e1bb4b36a7ae09 Daniel Golle       2025-11-03  170            minItems: 3
e1bb4b36a7ae09 Daniel Golle       2025-11-03  171            maxItems: 3
e1bb4b36a7ae09 Daniel Golle       2025-11-03  172          mdio:
e1bb4b36a7ae09 Daniel Golle       2025-11-03  173            required:
e1bb4b36a7ae09 Daniel Golle       2025-11-03  174              - compatible
e1bb4b36a7ae09 Daniel Golle       2025-11-03  175      else:
e1bb4b36a7ae09 Daniel Golle       2025-11-03  176        properties:
e1bb4b36a7ae09 Daniel Golle       2025-11-03  177          reg:
e1bb4b36a7ae09 Daniel Golle       2025-11-03  178            maxItems: 1
e1bb4b36a7ae09 Daniel Golle       2025-11-03  179          reg-names: false
e1bb4b36a7ae09 Daniel Golle       2025-11-03  180          gphy-fw: false
e1bb4b36a7ae09 Daniel Golle       2025-11-03  181  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
