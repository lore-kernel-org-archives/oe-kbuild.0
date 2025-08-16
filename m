Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3ED1C5D4B
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Aug 2025 08:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755334669; cv=none; b=OWb1VH9QJ2PBee01b4R8yc//LEGJmIFsPKNKYwtmxbXbyoxn2xHlikn4KiRMR0rQ9cCQz8QH43Tu3YDtOaF/1h5B+gCGI1fB8xH68Eev3GCmrpxc0j2JzOkVx2fzjDrXjvPqcsQl/l/vyKp14BOpVQQxq8EpCsqRz8CdIpc4zyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755334669; c=relaxed/simple;
	bh=drN9UCwq1zoonNRa3UwWBdMm8NJ9d4KghrY0jhGGJvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oUHh5KNjEeqhoxlTUGZ2XdmLUhB4quehEBruLwkMp6GfoZYoKqyM5egdogICroNn5xVqdLQqGVqnF8F0Z/H7xdbrsPx2R1F1DUfm+CKr4G0BnHzUbQ3z9EhTeOel5QnDjhPAziJMxA+vzXusWktwR6rFzHh4ylevBvC/MtexcF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GGCi3zAx; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GGCi3zAx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755334659; x=1786870659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=drN9UCwq1zoonNRa3UwWBdMm8NJ9d4KghrY0jhGGJvw=;
  b=GGCi3zAx1sD+kg1aNWss9Gu0pi4HkFqLTJFwB2uhCi7nibDH6piTZcTh
   gOl312/bZHPNG34mV7ZWJzvx/KhH10H1U1zobXXBLswR7VvemXdoA17Tv
   qP3XWlndTZwdHxMfx5l9ptfStbGrmRyhYQKs+C9VBEMWkySHAXHXwpdpv
   XXHSJp334RtKtE1Q1UTFItCtJM801ebUr9uISUaFR/+6HCjHMxWYLm95Z
   pXlsa0HOIgGOP2HC+8QtexVJjrpTuPtE5JT4lP1SOwtYHwurBTLX/uoV5
   XpFFGjHwT2fzr8qJ9W6KEeVNfSfDiRCLTKjYIcDv8SkjDo1hjJM781El9
   g==;
X-CSE-ConnectionGUID: /ACuz4oEQtyKMg3F18Hfpw==
X-CSE-MsgGUID: Ic/EXyUUTyyS9z67LEfGaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="56663889"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="56663889"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2025 01:57:39 -0700
X-CSE-ConnectionGUID: 9ek0V3aOTN+RD0Q0u/WFPw==
X-CSE-MsgGUID: xh18KlBUQiKjtayLnevJZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="171384916"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 16 Aug 2025 01:57:37 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unCjH-000ClI-0C;
	Sat, 16 Aug 2025 08:57:35 +0000
Date: Sat, 16 Aug 2025 16:56:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next v2 01/10] dt-bindings: net: sun8i-emac: Add A523
 GMAC200 compatible
Message-ID: <202508161633.ayrx0Zyv-lkp@intel.com>
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
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-052-20250814 (https://download.01.org/0day-ci/archive/20250816/202508161633.ayrx0Zyv-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508161633.ayrx0Zyv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508161633.ayrx0Zyv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): interrupts: [[0, 293, 4], [0, 298, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clocks: [[21, 37], [21, 47], [21, 289], [21, 287], [21, 292]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): power-domains: False schema does not allow [[32, 6]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clocks: [[21, 37], [21, 47], [21, 289], [21, 287], [21, 292]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3576-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): interrupts: [[0, 301, 4], [0, 306, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts:1410.7-1418.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[30, 310], [30, 311], [30, 345], [30, 350], [30, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[31, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[30, 310], [30, 311], [30, 345], [30, 350], [30, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[30, 310], [30, 311], [30, 344], [30, 349], [30, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[31, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[30, 310], [30, 311], [30, 344], [30, 349], [30, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts:626.7-634.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1112.7-1119.4: Warning (avoid_unnecessary_addr_size): /usb@fc000000/port: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1127.7-1134.4: Warning (avoid_unnecessary_addr_size): /usb@fc400000/port: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1112.7-1119.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1127.7-1134.4: Warning (graph_child_address): /usb@fc400000/port: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts:1186.7-1194.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
--
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts:1172.7-1180.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[30, 310], [30, 311], [30, 345], [30, 350], [30, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[31, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[30, 310], [30, 311], [30, 345], [30, 350], [30, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
--
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('rockchip,grf', 'rockchip,php-grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): clocks: [[15, 390], [15, 393], [15, 393], [15, 199], [15, 195], [15, 196], [15, 393], [15, 200]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe010000 (rockchip,rk3568-gmac): interrupts: [[0, 32, 4], [0, 29, 4]] is too long
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
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clock-names: ['stmmaceth', 'mac_clk_rx', 'mac_clk_tx', 'clk_mac_refout', 'aclk_mac', 'pclk_mac', 'clk_mac_speed', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): clocks: [[15, 386], [15, 389], [15, 389], [15, 184], [15, 180], [15, 181], [15, 389], [15, 185]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3568-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3568-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): interrupts: [[0, 27, 4], [0, 24, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: ethernet@fe2a0000 (rockchip,rk3568-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clocks: [[21, 36], [21, 46], [21, 288], [21, 286], [21, 293]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): power-domains: False schema does not allow [[32, 6]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): clocks: [[21, 36], [21, 46], [21, 288], [21, 286], [21, 293]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3576-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): interrupts: [[0, 293, 4], [0, 298, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clocks: [[21, 37], [21, 47], [21, 289], [21, 287], [21, 292]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): power-domains: False schema does not allow [[32, 6]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): clocks: [[21, 37], [21, 47], [21, 289], [21, 287], [21, 292]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3576-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): interrupts: [[0, 301, 4], [0, 306, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): 'phy-handle' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: pcie-ep@fe150000 (rockchip,rk3588-pcie-ep): Unevaluated properties are not allowed ('vpcie3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie-ep.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
--
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 345], [33, 350], [33, 309]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1c0000 (rockchip,rk3588-gmac): interrupts: [[0, 234, 4, 0], [0, 233, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): power-domains: False schema does not allow [[34, 33]]
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clock-names: ['stmmaceth', 'clk_mac_ref', 'pclk_mac', 'aclk_mac', 'ptp_ref'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): clocks: [[33, 310], [33, 311], [33, 344], [33, 349], [33, 308]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-gmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'rockchip,rk3588-gmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupt-names: ['macirq', 'eth_wake_irq'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): interrupts: [[0, 227, 4, 0], [0, 226, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: ethernet@fe1b0000 (rockchip,rk3588-gmac): Unevaluated properties are not allowed ('clock_in_out', 'rockchip,grf', 'rockchip,php-grf', 'rx_delay', 'tx_delay' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
--
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl): 'pwm_mux' does not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl): $nodename:0: 'pmux@24190000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml#
>> arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: ethernet@28000000 (toshiba,visconti-dwmac): clock-names: ['stmmaceth', 'phy_ref_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: ethernet@28000000 (toshiba,visconti-dwmac): clocks: [[13, 28], [13, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: ethernet@28000000 (toshiba,visconti-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['toshiba,visconti-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'toshiba,visconti-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: ethernet@28000000 (toshiba,visconti-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: ethernet@28000000 (toshiba,visconti-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: ethernet@28000000 (toshiba,visconti-dwmac): 'syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: ethernet@28000000 (toshiba,visconti-dwmac): Unevaluated properties are not allowed ('mdio0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: ethernet@28000000 (toshiba,visconti-dwmac): Unevaluated properties are not allowed ('mdio0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/toshiba,visconti-dwmac.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: wdt@28330000 (toshiba,visconti-wdt): $nodename:0: 'wdt@28330000' does not match '^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/toshiba,visconti-wdt.yaml#
--
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl): 'pwm_mux' does not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl): $nodename:0: 'pmux@24190000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl): spi0-pins:groups: ['spi0_grp', 'spi0_cs0_grp'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl): spi0-pins:groups: ['spi0_grp', 'spi0_cs0_grp'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: mmc-slot@0 (mmc-spi-slot): $nodename:0: 'mmc-slot@0' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-spi-slot.yaml#
>> arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: ethernet@28000000 (toshiba,visconti-dwmac): clock-names: ['stmmaceth', 'phy_ref_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: ethernet@28000000 (toshiba,visconti-dwmac): clocks: [[13, 28], [13, 118]] is too long
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: ethernet@28000000 (toshiba,visconti-dwmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['toshiba,visconti-dwmac', 'snps,dwmac-4.20a'] is too long
   	'allwinner,sun8i-a83t-emac' was expected
   	'allwinner,sun8i-h3-emac' was expected
   	'allwinner,sun8i-r40-gmac' was expected
   	'allwinner,sun8i-v3s-emac' was expected
   	'allwinner,sun50i-a64-emac' was expected
   	'toshiba,visconti-dwmac' is not one of ['allwinner,sun20i-d1-emac', 'allwinner,sun50i-a100-emac', 'allwinner,sun50i-h6-emac', 'allwinner,sun50i-h616-emac0', 'allwinner,sun55i-a523-gmac0']
   	'allwinner,sun55i-a523-gmac200' was expected
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: ethernet@28000000 (toshiba,visconti-dwmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
>> arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: ethernet@28000000 (toshiba,visconti-dwmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: ethernet@28000000 (toshiba,visconti-dwmac): 'syscon' is a required property
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
