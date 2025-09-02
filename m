Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2673C311C13
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Sep 2025 18:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756839338; cv=none; b=GIuGeVh0phm/xUeNHgNHJ8GzWmptvtbfqs9Ih9ffncHcBV8kNw5EvhDXwLr2S68RBzRDpX29fWihd14NngQviVJDUANFu995UxxWosdOb0fm4OPQpHFdgBH8+OBbK5XZ2EzEcZA0ilR9Xq/GpXdP1VusH/7gp5BO/DJ4VBxmZRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756839338; c=relaxed/simple;
	bh=kSeGrMhb8XdLU1aSXGclcvb34sAIzc7spsbUJN5RiyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=segW0BF+9w0sAD9MkJmj0jJkVKB4Grm13IMx6U7eG5QZd0exAlAjdVZyddoYnw49eyH8yhPmxyzQ7/5StJ9WbWZNH5sjL0TvSOESN9eDhasxf0/rA19WouEhGvWcm+tDHl9Htcs9MIi5upBC2NTRcagvJxTWQNR2Mz8JTxxxhSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LjD1DIf4; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LjD1DIf4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756839336; x=1788375336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kSeGrMhb8XdLU1aSXGclcvb34sAIzc7spsbUJN5RiyY=;
  b=LjD1DIf4uluViM+wWAksjSz8aFmVDNp1ahmnY3LG06XlLTvfErfWAd84
   CpRyl4FRHRYMIsAXKJOijmcV9C6ZHUQRpExUlR3ZuT7+7T/3UlvUaLIQy
   tfcr9x1FG41rnft1YjkqNDt1UkaYe484+n/VLcanDjn1W35sCpIFyYynn
   vYePvdMNvKNGDMr7DkywsYD1/dC3blBpJ2e9BH4x3wbWn7QJv8/OPb0QC
   0sybTPZu1knW+TGf+RzwcgbhhIQpN1vVDKd0gAUJQ2GkBvqdrp8F18cbh
   imzjOmog+iRXKSsmX+YsvCnYXONNE/MRo2Cv5ix45fYdQp8HTm6V6ljYw
   Q==;
X-CSE-ConnectionGUID: lJXe/dylRgOCKzeyvCJtnQ==
X-CSE-MsgGUID: Gzpm2gToTMS7KJq0V3gT9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="62773007"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="62773007"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 11:55:36 -0700
X-CSE-ConnectionGUID: nzk/qOAAQBqqnnxyHWhYxg==
X-CSE-MsgGUID: iu5/ptM8STqgdwS+zOa1pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="170921694"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 02 Sep 2025 11:55:34 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utW9g-0002rz-18;
	Tue, 02 Sep 2025 18:55:10 +0000
Date: Wed, 3 Sep 2025 02:53:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 4/5] arm64: dts: aspeed: Add AST2700 Evaluation Board
Message-ID: <202509030242.hRGuxoQp-lkp@intel.com>
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
[also build test WARNING on soc/for-next linus/master v6.17-rc4 next-20250902]
[cannot apply to arm64/for-next/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-arm-aspeed-Add-AST2700-board-compatible/20250901-111504
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250901031311.1247805-5-ryan_chen%40aspeedtech.com
patch subject: [PATCH v5 4/5] arm64: dts: aspeed: Add AST2700 Evaluation Board
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20250902 (https://download.01.org/0day-ci/archive/20250903/202509030242.hRGuxoQp-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2e122990391b2ba062e6308a12cfedf7206270ba)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509030242.hRGuxoQp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509030242.hRGuxoQp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi:153.21-214.4: Warning (unit_address_vs_reg): /soc@10000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/aspeed/aspeed-g7.dtsi:216.21-451.4: Warning (unit_address_vs_reg): /soc@14000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@12101b00 (aspeed,ast2700-intc-ic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@12101b00 (aspeed,ast2700-intc-ic): interrupts: [[0, 192, 4], [0, 193, 4], [0, 194, 4], [0, 195, 4], [0, 196, 4], [0, 197, 4], [0, 198, 4], [0, 199, 4], [0, 200, 4], [0, 201, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: syscon@12c02000 (aspeed,ast2700-scu0): #size-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: syscon@14c02000 (aspeed,ast2700-scu1): compatible: ['aspeed,ast2700-scu1'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
>> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: syscon@14c02000 (aspeed,ast2700-scu1): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: syscon@14c02000 (aspeed,ast2700-scu1): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
>> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: syscon@14c02000 (aspeed,ast2700-scu1): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@14c18100 (aspeed,ast2700-intc-ic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@14c18100 (aspeed,ast2700-intc-ic): interrupts-extended: [[5, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
>> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@14c18110 (aspeed,ast2700-intc-ic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@14c18110 (aspeed,ast2700-intc-ic): interrupts-extended: [[5, 1]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
>> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@14c18120 (aspeed,ast2700-intc-ic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@14c18120 (aspeed,ast2700-intc-ic): interrupts-extended: [[5, 2]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
>> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@14c18130 (aspeed,ast2700-intc-ic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@14c18130 (aspeed,ast2700-intc-ic): interrupts-extended: [[5, 3]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
>> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@14c18140 (aspeed,ast2700-intc-ic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@14c18140 (aspeed,ast2700-intc-ic): interrupts-extended: [[5, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
>> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@14c18150 (aspeed,ast2700-intc-ic): #interrupt-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@14c18150 (aspeed,ast2700-intc-ic): interrupts-extended: [[5, 5]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
