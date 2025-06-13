Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090BA1CEAA3
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Jun 2025 05:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749790847; cv=none; b=SJ9k6SH8yGRKQ1/EoEQQdQCxLMmMq2avdW5MgCu36HiZL4S/C/ep3ydq1Ym4Jw3wh1O9+7lcj7h7lEyOtxH2ITQkU33gT2o5uBHz+yeUwlS4dooiM5FEJdb2/d5g9iULrcwdQ6NSu5KSdqwgSASYHcvGOroOXRavnRbOpKA+0NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749790847; c=relaxed/simple;
	bh=by81MvInhSFgUlgAfqEkuBwbWSnFO2PRQXtC49CjWYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cU1T86qG7PJW5gOKeAnAfzNjMu8kOM4U/eiQ8/nQTEq9tzkivoTzs4vEoTNt2fTNgz5IUwPTUmaka5sSy3ITKujK7SeAnMSAsIghy31WE/GVqvZ22sUwxseNYADylgTuhJM9haLWbEfWhVE8ASH1ZDEZL3u+hbPqYuHV3JXWCGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UTHFYrje; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UTHFYrje"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749790842; x=1781326842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=by81MvInhSFgUlgAfqEkuBwbWSnFO2PRQXtC49CjWYg=;
  b=UTHFYrjeG9YQc0Cs8dam5oUEPe3RcdIzPWlIYYaJVHYLbqqBBKSzb+F/
   x+YissdVKtC1Tiz3wv50nDkHkQZGvITuxqqdjTf9x4GDRva2K9coHVi5W
   kHaC4RbL9THh9cjWexQlSNWiN+Nmx6afqTLwEKHJRFz07D+EgAOmXFsiB
   EjtiFlUILJHPxlPJ1+WOMefd+68WhwjgQXSZJ6EQBqNlRLrnLZzsGdWCy
   DfQxZ58Y7z82dhY09BjzruBOjo6Ic5g/jPg6Gdsve3yqZqe3COdwO3kf1
   tm6yLSn480sg8fO3sk09KGlo/MOIHmkyuDiqHKQ6BVNtJuXs82gJCwy/e
   Q==;
X-CSE-ConnectionGUID: JYaFAjc2QS+QKTx/H1VYrA==
X-CSE-MsgGUID: tZ1sqGYwRlK9W6aiyn1+SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51713280"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="51713280"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 22:00:41 -0700
X-CSE-ConnectionGUID: s6tSndFDS0+cIJ2pVyTq1w==
X-CSE-MsgGUID: DxoNgZmHRteCjlr1/uAnYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="148610109"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Jun 2025 22:00:40 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPwWs-000CFS-0N;
	Fri, 13 Jun 2025 05:00:38 +0000
Date: Fri, 13 Jun 2025 13:00:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v0 4/5] arm64: dts: aspeed: Add AST2700 EVB device tree
Message-ID: <202506131239.yptF7RBQ-lkp@intel.com>
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
In-Reply-To: <20250612100933.3007673-5-ryan_chen@aspeedtech.com>
References: <20250612100933.3007673-5-ryan_chen@aspeedtech.com>
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
[also build test WARNING on arm64/for-next/core soc/for-next linus/master v6.16-rc1 next-20250612]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-arm-aspeed-Add-AST2700-board-compatible/20250612-181222
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250612100933.3007673-5-ryan_chen%40aspeedtech.com
patch subject: [PATCH v0 4/5] arm64: dts: aspeed: Add AST2700 EVB device tree
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm64-randconfig-051-20250613 (https://download.01.org/0day-ci/archive/20250613/202506131239.yptF7RBQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506131239.yptF7RBQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506131239.yptF7RBQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: serial@14c33b00 (ns16550a): 'pinctrl-0' is a dependency of 'pinctrl-names'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-consumer.yaml#
>> arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@100 (aspeed,ast2700-intc-ic): interrupts-extended: [[6, 0, 3844]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@110 (aspeed,ast2700-intc-ic): interrupts-extended: [[6, 1, 3844]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@120 (aspeed,ast2700-intc-ic): interrupts-extended: [[6, 2, 3844]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@130 (aspeed,ast2700-intc-ic): interrupts-extended: [[6, 3, 3844]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@140 (aspeed,ast2700-intc-ic): interrupts-extended: [[6, 4, 3844]] is too short
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
   arch/arm64/boot/dts/aspeed/ast2700-evb.dtb: interrupt-controller@150 (aspeed,ast2700-intc-ic): interrupts-extended: [[6, 5, 3844]] is too short

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
