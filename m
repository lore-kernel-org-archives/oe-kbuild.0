Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793602883;
	b=kL4ASDG7lVzjLnZxhREdWYgBL0qqgiFDcDloHot7nhRUqwMeJqG+SJSWbqhp9eykZEfT
	 NVvhhIXO7O3Q96bNX9Lv44fh9DMaK5Qg1uo/8DLhjoDlUzhabj4USd3ZyFfyYbl4rDUNg
	 twIL0Pdwzl2K60zsczkqYqus434ruwF+W4m7qOJKloZA46U3k4e50p+27bVyVP9Os0djc
	 vKZDahocljojgBW2JwrALmJRgsOdJRxXpDKOEQndaNpe+afS+8c3Bh+y+++/fTzS36i5g
	 zCxRwUY0YTe/E65yv1ZLIjmPTJia1jp5rXi88FPQYG751JTwTic/1BGJi0DAhM6TDlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793602883;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Q+vvhbo/5ABSceCW6a3wDT0HN5yyH1GIexr54b9Jc1M=;
	b=FkTogRJMfqDt9YF+wm+J8tL37rB2nE9+nJcT1vJW4wdqmNP3VM+ut0dgx0Ni5y9AlPxO
	 HSVX5UhexqtniFZ5f7L+Xqlh/ATd0t9N3Z67m174tlSiHuiZ/onaO1B5UlvIVoTT+bW0g
	 EcDp6RgxzHqIu6kwk/Byv16Nw6Cbla/w/WB9uxYA6x0vMMlXfIX538K9USIGWk0Z9U/U9
	 mq1AKWwHLLVPksj3lQx1VVa1j6b5CWXFlGfQf8niX7QHPzSqMB2cVwA1ySEKTFUQlL4vI
	 NpteP3glSvm1zCAiXCPEAxYouD9Hfxw6y0f7kTxd14TPoHJoCn5s3WgTVNuoc8rcWlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=htpXzDI2;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DA0606A329
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Nov 2026 07:01:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3DA0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=htpXzDI2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793602881; x=1825138881;
  h=date:from:to:cc:subject:message-id;
  bh=/8uZb8Q6SyPj+I0Emo+DskGJqAiYLRkIz+26CCaOLXk=;
  b=htpXzDI2DMcrE5Zxi2I8OVUheJgI6ARgKbiGzA0D5kTN3RCwUnugFfcV
   /ha06CjVrXVhypaa+t/i3JTtgNDsvfY1Us6yL3tjAaLMbEbe0Kn/m2dnO
   yia3C8ruLoQyjpKAtTJwZ71yCEprOzYPMyySBsgXj4RPol8retktIWHMq
   +TclAIWeLpDAgrTIepxQyw7H05oMh+rMd6t8b7Dm6a3SvGq4wulqxSbux
   GPJ29LC2myLrrHyXBkbWubd5+g7pteZky+ChIfIdix1t14fbDTT7r+2XI
   YwEq6NZ8xmfhBmCj3rd8dSNQT5PS2AW9diwYG1ZJAvwYLLl6txYvojxcE
   A==;
X-CSE-ConnectionGUID: PSjKoy9jRdOzd5uNZk+Ptw==
X-CSE-MsgGUID: /2It9k5OQAy8tmInw+b4vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2183689"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2183689"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 23:01:21 -0800
X-CSE-ConnectionGUID: TE+lUlveSeWr9wMtpwWcpA==
X-CSE-MsgGUID: +XWvmOUZSZCQRthmNFmqBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="5912585"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 01 Nov 2026 23:01:19 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNm2f-000000008Nh-1df7;
	Mon, 02 Nov 2026 07:01:17 +0000
Date: Mon, 02 Nov 2026 08:00:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:sunxi-wip 31/36]
 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dtb: iommu@30f0000
 (allwinner,sun50i-h6-iommu): 'resets' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202611020747.5MwUyNZC-lkp@intel.com>
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
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261102/202611020747.5MwUyNZC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261102/202611020747.5MwUyNZC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611020747.5MwUyNZC-lkp@intel.com/

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
