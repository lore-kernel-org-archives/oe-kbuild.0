Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C404235044
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Aug 2025 06:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756017703; cv=none; b=MpOj+gJOiRrfWNQ8oI61U38SZTTBICgzPN0IrZLzTeungStuZgOagVIeWsOpbOFZFdK+Mg6CA26zC8CB02vwqPAUIMVrFfNMPEWZfDDb+0pJC6V9dVuL6IuMbw1XWPdbj1NNG1N9lWGRGGT6XZ12qQuWurn4fJMNg18EQ6u2Y1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756017703; c=relaxed/simple;
	bh=eg/rGgugx0igHR+7ElCyzQXTlskr15POYgDLeU4mlmE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=njdnQNcg+yiA/o4E3BNL1QxZMYGDGT+baJUjeVOPYiMn1ZGAqhaMKWlf1RECvIgMMkLIXVAnbdL6krezi2m719abtNWb6Asjc6KkdL9INQfn8FibVcAAt62318UEmX60ngrCmTrduN7knyZKqvZQYgknG97fkvxKjuYOYosh3ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mJsFXHwJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mJsFXHwJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756017698; x=1787553698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eg/rGgugx0igHR+7ElCyzQXTlskr15POYgDLeU4mlmE=;
  b=mJsFXHwJSSXId7wzIbHYqNvCUKz1ZDGsJh0sbhXBvtTtW0d7HcETPUzl
   F0ey7MjQ4Q3UzEkHNSnSMoeq8WlveQdl3zSKhHpbmTp3D+WLXfVqaqPzJ
   uebzjh758UMPX00Xg9909zpYGBjPWK4wJWVwuP543jzSojZGVIQgDz3EC
   VLWLGkW/XDKMnY2hcZL0z3k2HgFuT5RSit+EkL4BOIzLR3iiDSgi4Jm47
   Q4lGRKOixZ4Qm5I2Tk2aSPVMfjjUF430sqv35jgDzlci2TjKuG2AMso/z
   kzqCcmNxeucGvB39mQgmaA+ZYq3rbJQP5LB0sLgxZlwIK7rGzQAkpMly9
   w==;
X-CSE-ConnectionGUID: DdvNDuxzT3yWelJqBtRaeA==
X-CSE-MsgGUID: pyzzzcuMSp67fKYSMaKgcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="57283607"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="57283607"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 23:41:37 -0700
X-CSE-ConnectionGUID: SLiNfgwST1OQ7xNXgwkwhw==
X-CSE-MsgGUID: 0UbF1OtiRSasPjL1ij1G3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="192699043"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Aug 2025 23:41:35 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uq4Q1-000Mpj-1B;
	Sun, 24 Aug 2025 06:41:33 +0000
Date: Sun, 24 Aug 2025 14:40:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next v2 01/10] dt-bindings: net: sun8i-emac: Add A523
 GMAC200 compatible
Message-ID: <202508241442.SlEipQds-lkp@intel.com>
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
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: arm-randconfig-052-20250814 (https://download.01.org/0day-ci/archive/20250824/202508241442.SlEipQds-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508241442.SlEipQds-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508241442.SlEipQds-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/rockchip/rv1109-relfor-saib.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_ref', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1109-relfor-saib.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): clocks: [[2, 126], [2, 136], [2, 136], [2, 127], [2, 191], [2, 278], [2, 136], [2, 137]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1109-relfor-saib.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_ref', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1109-relfor-saib.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): clocks: [[2, 126], [2, 136], [2, 136], [2, 127], [2, 191], [2, 278], [2, 136], [2, 137]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1109-relfor-saib.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rv1126-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rv1126-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1109-relfor-saib.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1109-relfor-saib.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): interrupts: [[0, 95, 4], [0, 96, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/rockchip/rv1109-sonoff-ihost.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_ref', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1109-sonoff-ihost.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): clocks: [[2, 126], [2, 136], [2, 136], [2, 127], [2, 191], [2, 278], [2, 136], [2, 137]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1109-sonoff-ihost.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_ref', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1109-sonoff-ihost.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): clocks: [[2, 126], [2, 136], [2, 136], [2, 127], [2, 191], [2, 278], [2, 136], [2, 137]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1109-sonoff-ihost.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rv1126-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rv1126-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1109-sonoff-ihost.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1109-sonoff-ihost.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): interrupts: [[0, 95, 4], [0, 96, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1109-sonoff-ihost.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1109-sonoff-ihost.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/rockchip/rv1126-edgeble-neu2-io.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_ref', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1126-edgeble-neu2-io.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): clocks: [[2, 126], [2, 136], [2, 136], [2, 127], [2, 191], [2, 278], [2, 136], [2, 137]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1126-edgeble-neu2-io.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_ref', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1126-edgeble-neu2-io.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): clocks: [[2, 126], [2, 136], [2, 136], [2, 127], [2, 191], [2, 278], [2, 136], [2, 137]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1126-edgeble-neu2-io.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rv1126-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rv1126-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1126-edgeble-neu2-io.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1126-edgeble-neu2-io.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): interrupts: [[0, 95, 4], [0, 96, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1126-edgeble-neu2-io.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1126-edgeble-neu2-io.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_ref', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): clocks: [[2, 126], [2, 136], [2, 136], [2, 127], [2, 191], [2, 278], [2, 136], [2, 137]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_ref', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): clocks: [[2, 126], [2, 136], [2, 136], [2, 127], [2, 191], [2, 278], [2, 136], [2, 137]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rv1126-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rv1126-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): interrupts: [[0, 95, 4], [0, 96, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtb: ethernet@ffc40000 (rockchip,rv1126-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm/boot/dts/st/stm32mp133c-prihmb.dtb: adc@48004000 (st,stm32mp13-adc-core): adc@0:interrupts: 0 was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml#
>> arch/arm/boot/dts/st/stm32mp133c-prihmb.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'ethstp', 'eth-ck'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp133c-prihmb.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): clocks: [[4, 81], [4, 77], [4, 79], [4, 83], [4, 139]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp133c-prihmb.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'ethstp', 'eth-ck'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp133c-prihmb.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): clocks: [[4, 81], [4, 77], [4, 79], [4, 83], [4, 139]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp133c-prihmb.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp13-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp13-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp133c-prihmb.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp133c-prihmb.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): interrupts-extended: [[2, 0, 62, 4], [10, 68, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp133c-prihmb.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp133c-prihmb.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp133c-prihmb.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp133c-prihmb.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm/boot/dts/st/stm32mp133c-prihmb.dtb: adc@48003000 (st,stm32mp13-adc-core): adc@0:interrupts: 0 was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml#
>> arch/arm/boot/dts/st/stm32mp133c-prihmb.dtb: ethernet@5800e000 (st,stm32mp13-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'ethstp', 'eth-ck'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp133c-prihmb.dtb: ethernet@5800e000 (st,stm32mp13-dwmac): clocks: [[4, 82], [4, 78], [4, 80], [4, 84], [4, 141]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp133c-prihmb.dtb: ethernet@5800e000 (st,stm32mp13-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'ethstp', 'eth-ck'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp133c-prihmb.dtb: ethernet@5800e000 (st,stm32mp13-dwmac): clocks: [[4, 82], [4, 78], [4, 80], [4, 84], [4, 141]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp133c-prihmb.dtb: ethernet@5800e000 (st,stm32mp13-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp13-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp13-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: adc@48004000 (st,stm32mp13-adc-core): adc@0:interrupts: 0 was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'ethstp', 'eth-ck'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): clocks: [[4, 81], [4, 77], [4, 79], [4, 83], [4, 139]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'ethstp', 'eth-ck'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): clocks: [[4, 81], [4, 77], [4, 79], [4, 83], [4, 139]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp13-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp13-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): interrupts-extended: [[2, 0, 62, 4], [8, 68, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,ext-phyclk', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: adc@48003000 (st,stm32mp13-adc-core): adc@0:interrupts: 0 was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: ethernet@5800e000 (st,stm32mp13-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'ethstp', 'eth-ck'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: ethernet@5800e000 (st,stm32mp13-dwmac): clocks: [[4, 82], [4, 78], [4, 80], [4, 84], [4, 141]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: ethernet@5800e000 (st,stm32mp13-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'ethstp', 'eth-ck'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: ethernet@5800e000 (st,stm32mp13-dwmac): clocks: [[4, 82], [4, 78], [4, 80], [4, 84], [4, 141]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: ethernet@5800e000 (st,stm32mp13-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp13-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp13-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: ethernet@5800e000 (st,stm32mp13-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: ethernet@5800e000 (st,stm32mp13-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: ethernet@5800e000 (st,stm32mp13-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dtb: ethernet@5800e000 (st,stm32mp13-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,ext-phyclk', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm/boot/dts/st/stm32mp135f-dk.dtb: adc@48004000 (st,stm32mp13-adc-core): adc@0:interrupts: 0 was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dk.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'ethstp', 'eth-ck'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dk.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): clocks: [[4, 81], [4, 77], [4, 79], [4, 83], [4, 139]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dk.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'ethstp', 'eth-ck'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dk.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): clocks: [[4, 81], [4, 77], [4, 79], [4, 83], [4, 139]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dk.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp13-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp13-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dk.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dk.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): interrupts-extended: [[2, 0, 62, 4], [10, 68, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dk.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dk.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dk.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dk.dtb: ethernet@5800a000 (st,stm32mp13-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm/boot/dts/st/stm32mp135f-dk.dtb: adc@48003000 (st,stm32mp13-adc-core): adc@0:interrupts: 0 was expected
   	from schema $id: http://devicetree.org/schemas/iio/adc/st,stm32-adc.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dk.dtb: ethernet@5800e000 (st,stm32mp13-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'ethstp', 'eth-ck'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dk.dtb: ethernet@5800e000 (st,stm32mp13-dwmac): clocks: [[4, 82], [4, 78], [4, 80], [4, 84], [4, 141]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dk.dtb: ethernet@5800e000 (st,stm32mp13-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'ethstp', 'eth-ck'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dk.dtb: ethernet@5800e000 (st,stm32mp13-dwmac): clocks: [[4, 82], [4, 78], [4, 80], [4, 84], [4, 141]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp135f-dk.dtb: ethernet@5800e000 (st,stm32mp13-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp13-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp13-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp151a-prtt1a.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-prtt1a.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[6, 105], [6, 103], [6, 104], [6, 123], [6, 169], [6, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-prtt1a.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-prtt1a.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[6, 105], [6, 103], [6, 104], [6, 123], [6, 169], [6, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-prtt1a.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-prtt1a.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-prtt1a.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-prtt1a.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-prtt1a.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: switch@0 (nxp,sja1105q): Unevaluated properties are not allowed ('clocks', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/nxp,sja1105.yaml#
   arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: mmc@1 (prt,prtt1c-wfm200): $nodename:0: 'mmc@1' does not match '^wifi(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/wireless/silabs,wfx.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[6, 105], [6, 103], [6, 104], [6, 123], [6, 169], [6, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[6, 105], [6, 103], [6, 104], [6, 123], [6, 169], [6, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'phy-handle' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp151a-prtt1s.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-prtt1s.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[6, 105], [6, 103], [6, 104], [6, 123], [6, 169], [6, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-prtt1s.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-prtt1s.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[6, 105], [6, 103], [6, 104], [6, 123], [6, 169], [6, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-prtt1s.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-prtt1s.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-prtt1s.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-prtt1s.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-prtt1s.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp151a-dhcor-testbench.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-dhcor-testbench.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[6, 105], [6, 103], [6, 104], [6, 123], [6, 169], [6, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-dhcor-testbench.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-dhcor-testbench.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[6, 105], [6, 103], [6, 104], [6, 123], [6, 169], [6, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-dhcor-testbench.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-dhcor-testbench.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-dhcor-testbench.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-dhcor-testbench.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151a-dhcor-testbench.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[6, 105], [6, 103], [6, 104], [6, 123], [6, 169], [6, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[6, 105], [6, 103], [6, 104], [6, 123], [6, 169], [6, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,eth-clk-sel', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp151c-mect1s.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151c-mect1s.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[6, 105], [6, 103], [6, 104], [6, 123], [6, 169], [6, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151c-mect1s.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151c-mect1s.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[6, 105], [6, 103], [6, 104], [6, 123], [6, 169], [6, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151c-mect1s.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151c-mect1s.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151c-mect1s.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151c-mect1s.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'phy-handle' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151c-mect1s.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151c-mect1s.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,eth-clk-sel', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm/boot/dts/st/stm32mp151c-plyaqm.dtb: audio-controller@44004000 (st,stm32h7-i2s): port:endpoint: Unevaluated properties are not allowed ('format' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/st,stm32-i2s.yaml#
   arch/arm/boot/dts/st/stm32mp151c-plyaqm.dtb: audio-controller@44004000 (st,stm32h7-i2s): Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/st,stm32-i2s.yaml#
>> arch/arm/boot/dts/st/stm32mp151c-plyaqm.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151c-plyaqm.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151c-plyaqm.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151c-plyaqm.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151c-plyaqm.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151c-plyaqm.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151c-plyaqm.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151c-plyaqm.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp151c-plyaqm.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,eth-clk-sel', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,eth-clk-sel', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'phy-handle' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,eth-clk-sel', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,eth-clk-sel', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157a-avenger96.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-avenger96.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-avenger96.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-avenger96.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-avenger96.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-avenger96.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-avenger96.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-avenger96.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-avenger96.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157a-dhcor-avenger96.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-dhcor-avenger96.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-dhcor-avenger96.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-dhcor-avenger96.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-dhcor-avenger96.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-dhcor-avenger96.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-dhcor-avenger96.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-dhcor-avenger96.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-dhcor-avenger96.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157a-dk1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-dk1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-dk1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-dk1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-dk1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-dk1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-dk1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-dk1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-dk1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[8, 105], [8, 103], [8, 104], [8, 123], [8, 169], [8, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[8, 105], [8, 103], [8, 104], [8, 123], [8, 169], [8, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: serial@40010000 (st,stm32h7-uart): cts-gpios: False schema does not allow [[31, 15, 1]]
   	from schema $id: http://devicetree.org/schemas/serial/st,stm32-uart.yaml#
   arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: serial@40010000 (st,stm32h7-uart): rts-gpios: False schema does not allow [[32, 0, 1]]
   	from schema $id: http://devicetree.org/schemas/serial/st,stm32-uart.yaml#
   arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: serial@40010000 (st,stm32h7-uart): Unevaluated properties are not allowed ('bluetooth', 'uart-has-rtscts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/st,stm32-uart.yaml#
   arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: serial@40010000 (st,stm32h7-uart): cts-gpios: False schema does not allow [[31, 15, 1]]
   	from schema $id: http://devicetree.org/schemas/serial/serial.yaml#
   arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: serial@40010000 (st,stm32h7-uart): rts-gpios: False schema does not allow [[32, 0, 1]]
   	from schema $id: http://devicetree.org/schemas/serial/serial.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2-of10.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2-of10.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2-of10.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2-of10.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2-of10.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-edimm2.2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-edimm2.2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-edimm2.2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-edimm2.2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-edimm2.2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157a-stinger96.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-stinger96.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-stinger96.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-stinger96.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157a-stinger96.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-dk2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dk2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dk2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dk2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dk2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dk2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dk2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dk2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dk2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[8, 105], [8, 103], [8, 104], [8, 123], [8, 169], [8, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[8, 105], [8, 103], [8, 104], [8, 123], [8, 169], [8, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-ed1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ed1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ed1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ed1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ed1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[8, 105], [8, 103], [8, 104], [8, 123], [8, 169], [8, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[8, 105], [8, 103], [8, 104], [8, 123], [8, 169], [8, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-emsbc-argon.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-emsbc-argon.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-emsbc-argon.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-emsbc-argon.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-emsbc-argon.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-emsbc-argon.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-emsbc-argon.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-emsbc-argon.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-emsbc-argon.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,eth-ref-clk-sel', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm/boot/dts/st/stm32mp157c-emsbc-argon.dtb: m4@10000000 (st,stm32mp1-m4): 'interrupt-names', 'recovery' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/remoteproc/st,stm32-rproc.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[8, 105], [8, 103], [8, 104], [8, 123], [8, 169], [8, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[8, 105], [8, 103], [8, 104], [8, 123], [8, 169], [8, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dtb: /soc/bus@5c007000/i2c@40015000/touchscreen@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
>> arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'phy-handle' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,eth-clk-sel', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'phy-handle' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,eth-clk-sel', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-odyssey.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-odyssey.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-odyssey.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-odyssey.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-odyssey.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-odyssey.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-odyssey.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-odyssey.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-odyssey.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,eth-clk-sel', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,eth-clk-sel', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: touch@44 (st,stmpe811): touchscreen: Unevaluated properties are not allowed ('st,adc-freq', 'st,mod-12b', 'st,ref-sel', 'st,sample-time' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,eth-clk-sel', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[7, 105], [7, 103], [7, 104], [7, 123], [7, 169], [7, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157f-dk2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157f-dk2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[8, 105], [8, 103], [8, 104], [8, 123], [8, 169], [8, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157f-dk2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clock-names: ['stmmaceth', 'mac-clk-tx', 'mac-clk-rx', 'eth-ck', 'ptp_ref', 'ethstp'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157f-dk2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): clocks: [[8, 105], [8, 103], [8, 104], [8, 123], [8, 169], [8, 112]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157f-dk2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['st,stm32mp1-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'st,stm32mp1-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157f-dk2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157f-dk2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157f-dk2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm/boot/dts/st/stm32mp157f-dk2.dtb: ethernet@5800a000 (st,stm32mp1-dwmac): Unevaluated properties are not allowed ('access-controllers', 'reg-names', 'st,syscon' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
