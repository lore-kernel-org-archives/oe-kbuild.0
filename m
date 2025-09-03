Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A166E27380A
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Sep 2025 23:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756941790; cv=none; b=ucO1cx+lNGZJRqACqGfMui+2tUrwlEFIdclByN4Q3l0WNFzIWJOepInN7qA6xL3/hmqUtBetOgWNxBf+WB8NUKvKdMtf6SYDIrKK+BcThfRGNWlpZf1/u68lBFC/5cyzrOAR+4QRDRaAVsOn7eQIPbmcU9xcU/URstaGJO4/boQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756941790; c=relaxed/simple;
	bh=f3QW/x08ECBIAgMZqs2wO/OER4KrXamTumvXfoOnHQw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mnA5IMJ0Enm6YbDhXZG0DFQ5rs0K030YpQtqSzdBJuFTB2jgByZXmdhW5wm9TT50gBHDVFuBp2TP/0dTWKSx+cmMObWLX+buMl8/YZW7iZItkHW6SLnD/NXW3C9Rzpvx8+y+M2zBlBNo5mNJF0iNCo2MgJCBotANoM38myzK8X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E0v6GdXK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E0v6GdXK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756941786; x=1788477786;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f3QW/x08ECBIAgMZqs2wO/OER4KrXamTumvXfoOnHQw=;
  b=E0v6GdXKV4h0v/Hyyfc3OC1VZbcGzSPA0pFGXBxL4uCQOKtEBUVtu0St
   qVaPhgB8HfsCIUO2Y6B588ozlBjLnN5SJq8pFRCDKK97AdW2uPa2ixvcl
   9L53wLZJ+RSh0MOHT9pkf7gPZitkcOqlnFlJpPsMWLrye9DC4wh7WO1sy
   sFGGfh9VB3SOGpmc1wQTtOlCmRcwSjqAh0oHcDlGxCwITNuO1e18yREUQ
   reUmyBk9CIXItbDea+Yh+qnuAbrsbgPd2GVg62eTxRL5C+j52ABxB+1zA
   ZiPQURgU35fFL7m+DPuZHhRTbvkZqFfwq3XcB8K0G6DOjRzW8RReVIdz8
   g==;
X-CSE-ConnectionGUID: m/KX86B1QnWqupZJWjsSBg==
X-CSE-MsgGUID: MC0ExaQmRyOg5ndbyQQz5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="61905388"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="61905388"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 16:23:05 -0700
X-CSE-ConnectionGUID: rK8QcANaQLSLr43aNjY2sQ==
X-CSE-MsgGUID: Qxk2YKzYR4Kdw/RdV0Xkzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="172556071"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 03 Sep 2025 16:23:03 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utwof-0004W3-2P;
	Wed, 03 Sep 2025 23:23:01 +0000
Date: Thu, 4 Sep 2025 07:22:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 4/5] arm64: dts: aspeed: Add AST2700 Evaluation Board
Message-ID: <202509040745.CFOzjuGf-lkp@intel.com>
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
In-Reply-To: <20250901031311.1247805-5-ryan_chen@aspeedtech.com>
References: <20250901031311.1247805-5-ryan_chen@aspeedtech.com>
TO: Ryan Chen <ryan_chen@aspeedtech.com>
TO: "ryan_chen" <ryan_chen@aspeedtech.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Joel Stanley <joel@jms.id.au>
TO: Andrew Jeffery <andrew@codeconstruct.com.au>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Will Deacon <will@kernel.org>
TO: Arnd Bergmann <arnd@arndb.de>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Geert Uytterhoeven <geert@linux-m68k.org>
TO: Nishanth Menon <nm@ti.com>
TO: nfraprado@collabora.com
TO: Taniya Das <quic_tdas@quicinc.com>
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
TO: Eric Biggers <ebiggers@google.com>
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-aspeed@lists.ozlabs.org
TO: linux-kernel@vger.kernel.org
TO: soc@lists.linux.dev
TO: Mo Elbadry <elbadrym@google.com>
TO: Rom Lemarchand <romlem@google.com>
TO: William Kennington <wak@google.com>
TO: Yuxiao Zhang <yuxiaozhang@google.com>
TO: wthai@nvidia.com
TO: leohu@nvidia.com
TO: dkodihalli@nvidia.com
TO: spuranik@nvidia.com

Hi Ryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on soc/for-next linus/master v6.17-rc4 next-20250903]
[cannot apply to arm64/for-next/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-arm-aspeed-Add-AST2700-board-compatible/20250901-111504
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250901031311.1247805-5-ryan_chen%40aspeedtech.com
patch subject: [PATCH v5 4/5] arm64: dts: aspeed: Add AST2700 Evaluation Board
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250902 (https://download.01.org/0day-ci/archive/20250904/202509040745.CFOzjuGf-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509040745.CFOzjuGf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509040745.CFOzjuGf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi:153.21-214.4: Warning (unit_address_vs_reg): /soc@10000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi:216.21-451.4: Warning (unit_address_vs_reg): /soc@14000000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@12101b00 (aspeed,ast2700-intc-ic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
>> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@12101b00 (aspeed,ast2700-intc-ic): interrupts: [[0, 192, 4], [0, 193, 4], [0, 194, 4], [0, 195, 4], [0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4], [0, 200, 4], [0, 201, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
>> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: syscon@12c02000 (aspeed,ast2700-scu0): #size-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
>> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: syscon@14c02000 (aspeed,ast2700-scu1): compatible: ['aspeed,ast2700-scu1'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: syscon@14c02000 (aspeed,ast2700-scu1): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
>> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: syscon@14c02000 (aspeed,ast2700-scu1): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: syscon@14c02000 (aspeed,ast2700-scu1): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
>> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@14c18100 (aspeed,ast2700-intc-ic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
>> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@14c18100 (aspeed,ast2700-intc-ic): interrupts-extended: [[5, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@14c18110 (aspeed,ast2700-intc-ic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
>> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@14c18110 (aspeed,ast2700-intc-ic): interrupts-extended: [[5, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@14c18120 (aspeed,ast2700-intc-ic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
>> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@14c18120 (aspeed,ast2700-intc-ic): interrupts-extended: [[5, 2]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@14c18130 (aspeed,ast2700-intc-ic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
>> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@14c18130 (aspeed,ast2700-intc-ic): interrupts-extended: [[5, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@14c18140 (aspeed,ast2700-intc-ic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
>> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@14c18140 (aspeed,ast2700-intc-ic): interrupts-extended: [[5, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@14c18150 (aspeed,ast2700-intc-ic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
>> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@14c18150 (aspeed,ast2700-intc-ic): interrupts-extended: [[5, 5]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
