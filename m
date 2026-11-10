Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342098;
	b=V0cjFPJu+97V0UB1TDhxl0a5oQQsCmBzkiV1PtPQnjoC/EN3QkhPk7HNEGR02pI+xkQD
	 gwBUMOIMsSCZYCBVFbKR4nyf6Gu4CzT2k1Vr8mgER3hKIfzV6bbYWWxT1Q6qculYeHF18
	 NETlPRWG3Eb6QKcPakRz57Hmx70BSkT4lgMXStIhDAfjnpTe9AE1KWEivTdVgUck82e/w
	 UydQ3ogI9/0Lf2zrsGDzRC93Rm+ejTTIWeaxI6lmlrcCjZiCCQaH42/TIntQdSWmKDQMF
	 drCcj1zXLs1mimyLm9HMQeMCy4Nt3Ctq71v5/Xu6uTGaqy0pep8GCdMJrb9/pPjR0sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342098;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=cPHIAEf5fTuHl9lJW54kdPON/dX7b/iwzEZEjwVm7dA=;
	b=NOc35UZRn5gYlKxrFvIy3ZH8BrgFUobA7u2Xm8YQIqCMyO3xGZSqa8owi71bohKhisHX
	 HbH+hjj8JBXS3gdutQ72NSlnT6WTMJGYmnLfm2yV88nRMiUm+GFM71t+Ap6IrjMJDWcis
	 DpSphAQjJwSlcqy3cN+CzfgBBGoDmjpMu4kHEfA/brZa7xAmKPUsoW/BM98Prz/kTpoqz
	 oyQrOGfC09rYTiQj4Via5KwHbP7OrbAKE+N8kDVuuYI2dXyEufVfe1ysnYDqaVyiQ0CJF
	 oyQjiOky9P9z8FcfHtfvVzZQFGZ41C4tfkHtrM4YPuRKzIG6dRZNom29qCIHKR9Pkbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fa2eznNx;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2783F60A2612
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Nov 2026 20:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2783F60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fa2eznNx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794342097; x=1825878097;
  h=date:from:to:cc:subject:message-id;
  bh=iDGLaAZCGSsIw+PU+cRuWegyf10DF4af7pg8PbRxZis=;
  b=fa2eznNxOi7ineVjFYXQ6jgf8tzNsqU9k9EgPmf7PF7P3V00UOoH2SE1
   6n27Q3NcCByjmboTmMhnsfSUyPQwer3FOTOTZouJ2jCn5PksBcLr3CV60
   zzuXBKsc+IX0xoidWzSqEvR9nqksQS8kzISP0byXo4AvOsSGOe+lf3gl9
   LPnSXZ+s7raGdnjBZ3lWZx+XabdK84Swlg0jvtEtO9iN71JyUv3rcwOKX
   MxKg6Xhs6febJDgF4KrzzyhzCcTDlwyugKQMtnrdkQj02+WeiBGAuoS+r
   f172xzWWv+hy3SPYE7Q7eQAMNzJ1hVjkLWTrzOEEUcLfD4IlNA3hs+aub
   Q==;
X-CSE-ConnectionGUID: PV3y73NuR8qi6+GlslXEVQ==
X-CSE-MsgGUID: Ic5+AfeSQ22qpDxyQAg6tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3130494"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3130494"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 12:21:36 -0800
X-CSE-ConnectionGUID: NbvosxJaQXS4FsTeO5CcJA==
X-CSE-MsgGUID: 8SSUWZb6S9+iBWEiTQdiUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8678105"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 10 Nov 2026 12:21:35 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQsLV-000000000Lh-1oL5;
	Tue, 10 Nov 2026 20:21:33 +0000
Date: Tue, 10 Nov 2026 21:21:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:sunxi-wip 31/36]
 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dtb: iommu@30f0000
 (allwinner,sun50i-h6-iommu): 'resets' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202611102117.CZOcpJz8-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Chen-Yu Tsai" <wens@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git sunxi-wip
head:   e8e10ee67982c55fd3900953641c680a2fbef1c6
commit: 1f9b750151a621b9404d65c8cad20a4b8000c811 [31/36] dt-bindings: iommu: sun50i-h6: Remove bogus resets
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261110/202611102117.CZOcpJz8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611102117.CZOcpJz8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611102117.CZOcpJz8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dtb: iommu@30f0000 (allwinner,sun50i-h6-iommu): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/allwinner,sun50i-h6-iommu.yaml
--
>> arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dtb: iommu@30f0000 (allwinner,sun50i-h6-iommu): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/allwinner,sun50i-h6-iommu.yaml
--
>> arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dtb: iommu@30f0000 (allwinner,sun50i-h6-iommu): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/allwinner,sun50i-h6-iommu.yaml
--
>> arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dtb: iommu@30f0000 (allwinner,sun50i-h6-iommu): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/allwinner,sun50i-h6-iommu.yaml
--
>> arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dtb: iommu@30f0000 (allwinner,sun50i-h6-iommu): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/allwinner,sun50i-h6-iommu.yaml
--
>> arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-model-b.dtb: iommu@30f0000 (allwinner,sun50i-h6-iommu): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/allwinner,sun50i-h6-iommu.yaml
--
>> arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dtb: iommu@30f0000 (allwinner,sun50i-h6-iommu): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/allwinner,sun50i-h6-iommu.yaml
--
>> arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dtb: iommu@30f0000 (allwinner,sun50i-h6-iommu): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/allwinner,sun50i-h6-iommu.yaml
--
>> arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6-mini.dtb: iommu@30f0000 (allwinner,sun50i-h6-iommu): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/allwinner,sun50i-h6-iommu.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1082.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dtb: iommu@30f0000 (allwinner,sun50i-h616-iommu): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/allwinner,sun50i-h6-iommu.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1082.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dtb: iommu@30f0000 (allwinner,sun50i-h616-iommu): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/allwinner,sun50i-h6-iommu.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1082.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dtb: iommu@30f0000 (allwinner,sun50i-h616-iommu): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/allwinner,sun50i-h6-iommu.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1082.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dtb: iommu@30f0000 (allwinner,sun50i-h616-iommu): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/allwinner,sun50i-h6-iommu.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1082.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dtb: iommu@30f0000 (allwinner,sun50i-h616-iommu): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/allwinner,sun50i-h6-iommu.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1082.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dtb: iommu@30f0000 (allwinner,sun50i-h616-iommu): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/allwinner,sun50i-h6-iommu.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1082.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dtb: iommu@30f0000 (allwinner,sun50i-h616-iommu): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/allwinner,sun50i-h6-iommu.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1082.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dtb: iommu@30f0000 (allwinner,sun50i-h616-iommu): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/allwinner,sun50i-h6-iommu.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1082.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dtb: iommu@30f0000 (allwinner,sun50i-h616-iommu): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/allwinner,sun50i-h6-iommu.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1082.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dtb: iommu@30f0000 (allwinner,sun50i-h616-iommu): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/allwinner,sun50i-h6-iommu.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1082.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dtb: iommu@30f0000 (allwinner,sun50i-h616-iommu): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/allwinner,sun50i-h6-iommu.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1082.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: iommu@30f0000 (allwinner,sun50i-h616-iommu): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/allwinner,sun50i-h6-iommu.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1082.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: iommu@30f0000 (allwinner,sun50i-h616-iommu): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/allwinner,sun50i-h6-iommu.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1082.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: iommu@30f0000 (allwinner,sun50i-h616-iommu): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/allwinner,sun50i-h6-iommu.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1082.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: iommu@30f0000 (allwinner,sun50i-h616-iommu): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/allwinner,sun50i-h6-iommu.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
