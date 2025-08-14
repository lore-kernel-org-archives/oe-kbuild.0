Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB306212575
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Aug 2025 12:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755173071; cv=none; b=I1jzX75C+HfjkX9Yo3A32VD78vJ/UnMOTqY9p3NPozEPzz0FK7sd7VOHgnIMUHMs/q0Xva0pxlGVSjrXxnvqM6GEcaiws0GVUtcMZ12l7ODhdlk5PnXYSxiLbs98hOOKX2A7P+ed3YpQV4z+MTeczYGcuOBFJ0knMiFZLANOIuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755173071; c=relaxed/simple;
	bh=fZLlZeyggHJnWBvi5RzMuVs4+4d5sVLZ/usSjwtYNNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JoGxYQbWHKPqu9AS1tqjZrb5vNdqWszTqs8zNGZ3XmbCpGNhLMelX4ogBrzq0a1ddmZnOb05pLoWQOQXf7pB7BT3iElh7r6t8nxII6aicjpJf0Ciprn8KJGW+8UZwkRZSRt7KeFueloqdG5luXO9gqxKVgSGNuRkR0Bg20y7X/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a5tfHCrf; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a5tfHCrf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755173054; x=1786709054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fZLlZeyggHJnWBvi5RzMuVs4+4d5sVLZ/usSjwtYNNQ=;
  b=a5tfHCrfmtXu3mHgAOCwf7wVk/wOyJ6TlWcAUT/uEF6bB6pOrffHfaro
   6lHkEpBPu+XtuN/gS6jtvD/MGcA9/WNmhLaC/RlgxnohBX0VPuYSWPZNI
   MLzQsnrnRiC5rJRBNAlGW0FAcV+W5aZZ0GR/QO84/6kdGLwtM6zSrzS7i
   mGnDwxqb6vOnsjAUHIDayPhJMZS7b+Y5HwEdelnLQOZNqprW9nQFiOgCU
   MT6dci8x1u1uCZ+LYFVmJHWzh9cSF4oQ0aFQHaOuZOnfjbFL4LtvkXq0x
   qfk3Q7p0aWKk5/LFKXqnFcAFJ5jGDH87eXnN+/angIixaWH1xs44I50gB
   w==;
X-CSE-ConnectionGUID: 5XMOX2mKSl6wpCU9Axz49A==
X-CSE-MsgGUID: xAEOV+cKQNKzviJ2EWKh4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57354319"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="57354319"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 05:04:13 -0700
X-CSE-ConnectionGUID: ovBgojDWR3GFV77K5TXtLA==
X-CSE-MsgGUID: /UPbFEErRzK1qNOfzkWgcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="172078202"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 14 Aug 2025 05:04:11 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umWgi-000Aw0-0v;
	Thu, 14 Aug 2025 12:04:08 +0000
Date: Thu, 14 Aug 2025 20:03:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next v2 01/10] dt-bindings: net: sun8i-emac: Add A523
 GMAC200 compatible
Message-ID: <202508141954.akc9NiK9-lkp@intel.com>
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
In-Reply-To: <20250813145540.2577789-2-wens@kernel.org>
References: <20250813145540.2577789-2-wens@kernel.org>
TO: "Chen-Yu Tsai" <wens@kernel.org>
TO: Andrew Lunn <andrew+netdev@lunn.ch>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "Chen-Yu Tsai" <wens@csie.org>
TO: Jernej Skrabec <jernej@kernel.org>
TO: Samuel Holland <samuel@sholland.org>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-sunxi@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: Andre Przywara <andre.przywara@arm.com>

Hi Chen-Yu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/dt-bindings-net-sun8i-emac-Add-A523-GMAC200-compatible/20250813-230250
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250813145540.2577789-2-wens%40kernel.org
patch subject: [PATCH net-next v2 01/10] dt-bindings: net: sun8i-emac: Add A523 GMAC200 compatible
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm64-randconfig-051-20250814 (https://download.01.org/0day-ci/archive/20250814/202508141954.akc9NiK9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508141954.akc9NiK9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508141954.akc9NiK9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt2712-evb.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt2712-scpsys', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt2712-evb.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): clock-names:0: 'stmmaceth' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/mediatek/mt2712-evb.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): clock-names: ['axi', 'apb', 'mac_main', 'ptp_ref', 'rmii_internal'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/mediatek/mt2712-evb.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): clocks: [[27, 34], [27, 37], [6, 154], [6, 155], [6, 158]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/mediatek/mt2712-evb.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): power-domains: False schema does not allow [[29, 4]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/mediatek/mt2712-evb.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): clock-names: ['axi', 'apb', 'mac_main', 'ptp_ref', 'rmii_internal'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/mediatek/mt2712-evb.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): clocks: [[27, 34], [27, 37], [6, 154], [6, 155], [6, 158]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/mediatek/mt2712-evb.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt2712-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'mediatek,mt2712-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/mediatek/mt2712-evb.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/mediatek/mt2712-evb.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/mediatek/mt2712-evb.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/mediatek/mt2712-evb.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): Unevaluated properties are not allowed ('mediatek,mac-wol', 'mediatek,pericfg', 'mediatek,tx-delay-ps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/mediatek/mt2712-evb.dtb: /pcie@112ff000: failed to match any schema with compatible: ['mediatek,mt2712-pcie']
   arch/arm64/boot/dts/mediatek/mt2712-evb.dtb: /pcie@11700000: failed to match any schema with compatible: ['mediatek,mt2712-pcie']
--
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:235.6-1087.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: ethernet@ffbd0000 (rockchip,rk3528-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'mac_clk_rx', 'mac_clk_tx', 'pclk_mac', 'aclk_mac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: ethernet@ffbd0000 (rockchip,rk3528-gmac): clocks: [[10, 282], [10, 283], [10, 285], [10, 284], [10, 281], [10, 280]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: ethernet@ffbd0000 (rockchip,rk3528-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'mac_clk_rx', 'mac_clk_tx', 'pclk_mac', 'aclk_mac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: ethernet@ffbd0000 (rockchip,rk3528-gmac): clocks: [[10, 282], [10, 283], [10, 285], [10, 284], [10, 281], [10, 280]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: ethernet@ffbd0000 (rockchip,rk3528-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3528-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3528-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: ethernet@ffbd0000 (rockchip,rk3528-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: ethernet@ffbd0000 (rockchip,rk3528-gmac): interrupts: [[0, 113, 4], [0, 116, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: ethernet@ffbe0000 (rockchip,rk3528-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: ethernet@ffbe0000 (rockchip,rk3528-gmac): clocks: [[10, 173], [10, 172], [10, 171], [10, 170]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: ethernet@ffbe0000 (rockchip,rk3528-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: ethernet@ffbe0000 (rockchip,rk3528-gmac): clocks: [[10, 173], [10, 172], [10, 171], [10, 170]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: ethernet@ffbe0000 (rockchip,rk3528-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3528-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3528-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: ethernet@ffbe0000 (rockchip,rk3528-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: ethernet@ffbe0000 (rockchip,rk3528-gmac): interrupts: [[0, 121, 4], [0, 124, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: ethernet@ffbe0000 (rockchip,rk3528-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: ethernet@ffbe0000 (rockchip,rk3528-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-d.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-d.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-d.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-d.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-d.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-d.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-d.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353ps.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353ps.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353ps.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353ps.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353ps.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353ps.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353ps.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353v.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353v.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353v.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353v.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353v.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353v.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353v.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353vs.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353vs.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353vs.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353vs.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353vs.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353vs.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353vs.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v1.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v1.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v1.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v1.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v1.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v1.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v1.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v1.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v1.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v2.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v2.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v2.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v2.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v2.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v2.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v2.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v2.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v2.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi:488.10-499.6: Warning (graph_child_address): /i2c@fe5c0000/tcpc@60/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: usb2phy@fe8a0000 (rockchip,rk3568-usb2phy): otg-port: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v0.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v0.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v0.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v0.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v0.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v0.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v0.1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v0.1.dtb: phy@fe870000 (rockchip,rk3568-csi-dphy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/rockchip-inno-csi-dphy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v2.0.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v2.0.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v2.0.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v2.0.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v2.0.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v2.0.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v2.0.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v2.0.dtb: phy@fe870000 (rockchip,rk3568-csi-dphy): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/rockchip-inno-csi-dphy.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb10max3.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb10max3.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb10max3.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb10max3.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb10max3.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb10max3.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb10max3.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb20sx.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb20sx.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb20sx.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb20sx.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb20sx.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb20sx.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb20sx.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3-io.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3-io.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3-io.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3-io.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3-io.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3-io.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3-io.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3-io.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3-io.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3-io.dtb: wifi@1 (brcm,bcm43455-fmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,bcm43455-fmac'] is too short
   	'brcm,bcm43455-fmac' is not one of ['brcm,bcm4329-fmac', 'pci14e4,43dc', 'pci14e4,4464', 'pci14e4,4488', 'pci14e4,4425', 'pci14e4,4433', 'pci14e4,449d']
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3-io.dtb: wifi@1 (brcm,bcm43455-fmac): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3e.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3e.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3e.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3e.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3e.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3e.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3e.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3e.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3e.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3w.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3w.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3w.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3w.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3w.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3w.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3w.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-blade.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-blade.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-blade.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-blade.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-blade.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-blade.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-blade.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-blade.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-blade.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-cm4.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-cm4.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-cm4.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-cm4.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-cm4.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-cm4.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-cm4.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-cm4.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-cm4.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-model-a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-model-a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-model-a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-model-a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-model-a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-model-a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-model-a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-model-a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-model-a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-box-demo.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-box-demo.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-box-demo.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-box-demo.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-box-demo.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-box-demo.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-box-demo.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-box-demo.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-box-demo.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: touchscreen@48 (ti,tsc2007): 'ti,rt-thr' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: touchscreen@48 (ti,tsc2007): 'ti,rt-thr' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[14, 390], [14, 393], [14, 393], [14, 199], [14, 195], [14, 196], [14, 393], [14, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[14, 390], [14, 393], [14, 393], [14, 199], [14, 195], [14, 196], [14, 393], [14, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[14, 386], [14, 389], [14, 389], [14, 184], [14, 180], [14, 181], [14, 389], [14, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[14, 386], [14, 389], [14, 389], [14, 184], [14, 180], [14, 181], [14, 389], [14, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupts: [[0, 27, 4], [0, 24, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): 'phy-handle' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupts: [[0, 27, 4], [0, 24, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupts: [[0, 27, 4], [0, 24, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r68s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r68s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r68s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r68s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r68s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r68s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r68s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r68s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r68s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r68s.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r68s.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r68s.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r68s.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r68s.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r68s.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r68s.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupts: [[0, 27, 4], [0, 24, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r68s.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r68s.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupts: [[0, 27, 4], [0, 24, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupts: [[0, 27, 4], [0, 24, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5c.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5c.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5c.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5c.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5c.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5c.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5c.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5c.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5c.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5c.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5c.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5c.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5c.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5c.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupts: [[0, 27, 4], [0, 24, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupts: [[0, 27, 4], [0, 24, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupts: [[0, 27, 4], [0, 24, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3568-photonicat.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-photonicat.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-photonicat.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-photonicat.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-photonicat.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-photonicat.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-photonicat.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-photonicat.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-photonicat.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-photonicat.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-photonicat.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-photonicat.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-photonicat.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-photonicat.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-photonicat.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-photonicat.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupts: [[0, 27, 4], [0, 24, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupts: [[0, 27, 4], [0, 24, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupts: [[0, 27, 4], [0, 24, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[14, 390], [14, 393], [14, 393], [14, 199], [14, 195], [14, 196], [14, 393], [14, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[14, 390], [14, 393], [14, 393], [14, 199], [14, 195], [14, 196], [14, 393], [14, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[14, 386], [14, 389], [14, 389], [14, 184], [14, 180], [14, 181], [14, 389], [14, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[14, 386], [14, 389], [14, 389], [14, 184], [14, 180], [14, 181], [14, 389], [14, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupts: [[0, 27, 4], [0, 24, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupts: [[0, 27, 4], [0, 24, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupts: [[0, 27, 4], [0, 24, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupts: [[0, 27, 4], [0, 24, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clocks: [[21, 36], [21, 46], [21, 288], [21, 286], [21, 293]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): power-domains: False schema does not allow [[32, 6]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clocks: [[21, 36], [21, 46], [21, 288], [21, 286], [21, 293]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3576-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): interrupts: [[0, 293, 4], [0, 298, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clocks: [[21, 37], [21, 47], [21, 289], [21, 287], [21, 292]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): power-domains: False schema does not allow [[32, 6]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clocks: [[21, 37], [21, 47], [21, 289], [21, 287], [21, 292]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3576-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): interrupts: [[0, 301, 4], [0, 306, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clocks: [[21, 36], [21, 46], [21, 288], [21, 286], [21, 293]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): power-domains: False schema does not allow [[31, 6]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clocks: [[21, 36], [21, 46], [21, 288], [21, 286], [21, 293]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3576-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): interrupts: [[0, 293, 4], [0, 298, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clocks: [[21, 37], [21, 47], [21, 289], [21, 287], [21, 292]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): power-domains: False schema does not allow [[31, 6]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clocks: [[21, 37], [21, 47], [21, 289], [21, 287], [21, 292]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3576-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): interrupts: [[0, 301, 4], [0, 306, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clocks: [[21, 36], [21, 46], [21, 288], [21, 286], [21, 293]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): power-domains: False schema does not allow [[31, 6]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clocks: [[21, 36], [21, 46], [21, 288], [21, 286], [21, 293]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3576-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): interrupts: [[0, 293, 4], [0, 298, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clocks: [[21, 37], [21, 47], [21, 289], [21, 287], [21, 292]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): power-domains: False schema does not allow [[31, 6]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clocks: [[21, 37], [21, 47], [21, 289], [21, 287], [21, 292]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3576-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): interrupts: [[0, 301, 4], [0, 306, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clocks: [[21, 36], [21, 46], [21, 288], [21, 286], [21, 293]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): power-domains: False schema does not allow [[31, 6]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clocks: [[21, 36], [21, 46], [21, 288], [21, 286], [21, 293]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3576-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): interrupts: [[0, 293, 4], [0, 298, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clocks: [[21, 37], [21, 47], [21, 289], [21, 287], [21, 292]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): power-domains: False schema does not allow [[31, 6]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clocks: [[21, 37], [21, 47], [21, 289], [21, 287], [21, 292]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3576-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): interrupts: [[0, 301, 4], [0, 306, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clocks: [[21, 36], [21, 46], [21, 288], [21, 286], [21, 293]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): power-domains: False schema does not allow [[31, 6]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clocks: [[21, 36], [21, 46], [21, 288], [21, 286], [21, 293]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3576-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): interrupts: [[0, 293, 4], [0, 298, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clocks: [[21, 37], [21, 47], [21, 289], [21, 287], [21, 292]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): power-domains: False schema does not allow [[31, 6]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clocks: [[21, 37], [21, 47], [21, 289], [21, 287], [21, 292]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3576-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): interrupts: [[0, 301, 4], [0, 306, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clocks: [[21, 36], [21, 46], [21, 288], [21, 286], [21, 293]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): power-domains: False schema does not allow [[32, 6]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clocks: [[21, 36], [21, 46], [21, 288], [21, 286], [21, 293]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3576-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): interrupts: [[0, 293, 4], [0, 298, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clocks: [[21, 37], [21, 47], [21, 289], [21, 287], [21, 292]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): power-domains: False schema does not allow [[32, 6]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clocks: [[21, 37], [21, 47], [21, 289], [21, 287], [21, 292]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3576-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): interrupts: [[0, 301, 4], [0, 306, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts:1410.7-1418.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[30, 310], [30, 311], [30, 345], [30, 350], [30, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[31, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[30, 310], [30, 311], [30, 345], [30, 350], [30, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[30, 310], [30, 311], [30, 344], [30, 349], [30, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[31, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[30, 310], [30, 311], [30, 344], [30, 349], [30, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts:626.7-634.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1112.7-1119.4: Warning (avoid_unnecessary_addr_size): /usb@fc000000/port: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1127.7-1134.4: Warning (avoid_unnecessary_addr_size): /usb@fc400000/port: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1112.7-1119.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1127.7-1134.4: Warning (graph_child_address): /usb@fc400000/port: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts:1186.7-1194.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts:1172.7-1180.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[30, 310], [30, 311], [30, 345], [30, 350], [30, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[31, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[30, 310], [30, 311], [30, 345], [30, 350], [30, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('rockchip,grf', 'rockchip,php-grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: panel@0 (jasonic,jt240mhqs-hwt-ek-e3): compatible: ['jasonic,jt240mhqs-hwt-ek-e3', 'sitronix,st7789v'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/sitronix,st7789v.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: touchscreen@55 (sitronix,st1624): compatible:0: 'sitronix,st1624' is not one of ['sitronix,st1232', 'sitronix,st1633']
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/sitronix,st1232.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: touchscreen@55 (sitronix,st1624): compatible: ['sitronix,st1624', 'sitronix,st1633'] is too long
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/sitronix,st1232.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: touchscreen@55 (sitronix,st1624): Unevaluated properties are not allowed ('compatible', 'wakeup-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/sitronix,st1232.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: /i2c@fe5a0000/touchscreen@55: failed to match any schema with compatible: ['sitronix,st1624', 'sitronix,st1633']
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupts: [[0, 27, 4], [0, 24, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clocks: [[21, 36], [21, 46], [21, 288], [21, 286], [21, 293]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): power-domains: False schema does not allow [[32, 6]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clocks: [[21, 36], [21, 46], [21, 288], [21, 286], [21, 293]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3576-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): interrupts: [[0, 293, 4], [0, 298, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clocks: [[21, 37], [21, 47], [21, 289], [21, 287], [21, 292]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): power-domains: False schema does not allow [[32, 6]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clocks: [[21, 37], [21, 47], [21, 289], [21, 287], [21, 292]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3576-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): interrupts: [[0, 301, 4], [0, 306, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): 'phy-handle' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: pcie-ep@fe150000 (rockchip,rk3588-pcie-ep): Unevaluated properties are not allowed ('vpcie3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie-ep.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl): 'pwm_mux' does not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl): $nodename:0: 'pmux@24190000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: ethernet@28000000 (toshiba,visconti-dwmac): clock-names: ['stmmaceth', 'phy_ref_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: ethernet@28000000 (toshiba,visconti-dwmac): clocks: [[13, 28], [13, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: ethernet@28000000 (toshiba,visconti-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['toshiba,visconti-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'toshiba,visconti-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: ethernet@28000000 (toshiba,visconti-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: ethernet@28000000 (toshiba,visconti-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: ethernet@28000000 (toshiba,visconti-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: ethernet@28000000 (toshiba,visconti-dwmac): Unevaluated properties are not allowed ('mdio0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: ethernet@28000000 (toshiba,visconti-dwmac): Unevaluated properties are not allowed ('mdio0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/toshiba,visconti-dwmac.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: wdt@28330000 (toshiba,visconti-wdt): $nodename:0: 'wdt@28330000' does not match '^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/toshiba,visconti-wdt.yaml#
--
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl): $nodename:0: 'pmux@24190000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl): spi0-pins:groups: ['spi0_grp', 'spi0_cs0_grp'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl): spi0-pins:groups: ['spi0_grp', 'spi0_cs0_grp'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: mmc-slot@0 (mmc-spi-slot): $nodename:0: 'mmc-slot@0' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-spi-slot.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: ethernet@28000000 (toshiba,visconti-dwmac): clock-names: ['stmmaceth', 'phy_ref_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: ethernet@28000000 (toshiba,visconti-dwmac): clocks: [[13, 28], [13, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: ethernet@28000000 (toshiba,visconti-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['toshiba,visconti-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'toshiba,visconti-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: ethernet@28000000 (toshiba,visconti-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: ethernet@28000000 (toshiba,visconti-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: ethernet@28000000 (toshiba,visconti-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: ethernet@28000000 (toshiba,visconti-dwmac): Unevaluated properties are not allowed ('mdio0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: ethernet@28000000 (toshiba,visconti-dwmac): Unevaluated properties are not allowed ('mdio0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/toshiba,visconti-dwmac.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: wdt@28330000 (toshiba,visconti-wdt): $nodename:0: 'wdt@28330000' does not match '^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/toshiba,visconti-wdt.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
