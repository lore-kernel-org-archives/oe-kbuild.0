Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C66361DD1
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Feb 2026 14:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771337464; cv=none; b=rLejCgynyUjB3M9xGyPF1qZKar2nG20qHxjgWsz2naE2GjfInODI4wndib7w/SvNUraf4IXDcKWITXIvnuvxQLICMzIvRvEwypGjdNXlej8ZI/sQ2qrc1rN48KK0wdHjqDrrBj4EJPVuxXs7qTGLp4hQY3kHfK214BCBDqcbrAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771337464; c=relaxed/simple;
	bh=LHK28aEs21ScbTggZ8f0dZNUL2uclrSCRpfQXBpbOHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z2jBN897T7QIHk/8NFXuJNpkvCEFGgkE+OQMst3IACDJIh0U+4vaqOE1W0GDRkMaktaA90x6+3WNBmE7AAKJkTbB5Nj6RgHJ9BVinlIEsjFzqCPmNJYaK2B0ctLgBQ5nl82wdGAJV7/XkFSF8EozN/KKmKepqdSn7MuMrjrMOfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QimM2RW/; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QimM2RW/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771337456; x=1802873456;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LHK28aEs21ScbTggZ8f0dZNUL2uclrSCRpfQXBpbOHg=;
  b=QimM2RW/9+8DW/txmQzYO2xNB+ok7cb1cV3Me6Owbo54RdslcNwCi7V3
   U7XgTpJV/q3tFtTMx+tvhGcm9ZgwPqpCdZF7t1Tjj3L6elOpjYL7gQyw7
   rE8YvCoPakvU4LB+l7+oFbZjKlRT2WTtjXgBmBUYsx4s2PGSIXjpnKwem
   7rsVWfbHDsfca5gFWhzsk5tXFi1JkTJMu32jbi0XcP8mBTz5evf5BCwpL
   jt2ADSKqAR3ZqM4mU5ZCynCZ4e1vHbBtOTwiElVkVToAQbpC0AQs35O2l
   6Ak+OGZyBfxClMKXEsNyswA48m+gXBumLoEanukQMt8zuO1BrDSoYSkIw
   g==;
X-CSE-ConnectionGUID: bNiZOU2fQkOkjOdtxSKelg==
X-CSE-MsgGUID: 7l4QAtFiRvyk/PDYE8ICoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="82732876"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="82732876"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 06:10:56 -0800
X-CSE-ConnectionGUID: gnM+eI1+TySJC9oDmSWePA==
X-CSE-MsgGUID: hbpmeyAaTpe90s3XWdDwBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="218419074"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 17 Feb 2026 06:10:55 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsLmt-0000000031V-3fwb;
	Tue, 17 Feb 2026 14:10:51 +0000
Date: Tue, 17 Feb 2026 15:10:11 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 1/2] arm64: dts: add missing sram-supply to mali gpu
 nodes
Message-ID: <202602171537.TwDFxrsT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260215100302.136719-1-work@onurozkan.dev>
References: <20260215100302.136719-1-work@onurozkan.dev>
TO: "Onur Özkan" <work@onurozkan.dev>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "Chen-Yu Tsai" <wens@kernel.org>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: Samuel Holland <samuel@sholland.org>
TO: Alim Akhtar <alim.akhtar@samsung.com>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: Magnus Damm <magnus.damm@gmail.com>
TO: Heiko Stuebner <heiko@sntech.de>
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-sunxi@lists.linux.dev
TO: linux-kernel@vger.kernel.org
TO: linux-samsung-soc@vger.kernel.org
TO: linux-mediatek@lists.infradead.org
TO: linux-renesas-soc@vger.kernel.org
TO: linux-rockchip@lists.infradead.org
CC: "Onur Özkan" <work@onurozkan.dev>

Hi Onur,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on sunxi/sunxi/for-next robh/for-next linus/master v6.19 next-20260216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Onur-zkan/drm-panthor-treat-sram-as-mandatory-except-mt8196/20260215-180545
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20260215100302.136719-1-work%40onurozkan.dev
patch subject: [PATCH v1 1/2] arm64: dts: add missing sram-supply to mali gpu nodes
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20260215 (https://download.01.org/0day-ci/archive/20260217/202602171537.TwDFxrsT-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171537.TwDFxrsT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602171537.TwDFxrsT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi:876.32-885.7: Warning (graph_child_address): /soc/tcon-top@6510000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi:898.30-907.7: Warning (graph_child_address): /soc/tcon-top@6510000/ports/port@4: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dtb: gpu@1800000 (allwinner,sun50i-h6-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi:876.32-885.7: Warning (graph_child_address): /soc/tcon-top@6510000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi:898.30-907.7: Warning (graph_child_address): /soc/tcon-top@6510000/ports/port@4: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dtb: gpu@1800000 (allwinner,sun50i-h6-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi:876.32-885.7: Warning (graph_child_address): /soc/tcon-top@6510000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi:898.30-907.7: Warning (graph_child_address): /soc/tcon-top@6510000/ports/port@4: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dtb: gpu@1800000 (allwinner,sun50i-h6-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi:876.32-885.7: Warning (graph_child_address): /soc/tcon-top@6510000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi:898.30-907.7: Warning (graph_child_address): /soc/tcon-top@6510000/ports/port@4: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-one-plus.dtb: gpu@1800000 (allwinner,sun50i-h6-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi:876.32-885.7: Warning (graph_child_address): /soc/tcon-top@6510000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi:898.30-907.7: Warning (graph_child_address): /soc/tcon-top@6510000/ports/port@4: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64.dtb: gpu@1800000 (allwinner,sun50i-h6-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi:876.32-885.7: Warning (graph_child_address): /soc/tcon-top@6510000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi:898.30-907.7: Warning (graph_child_address): /soc/tcon-top@6510000/ports/port@4: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/allwinner/sun50i-h6-pine-h64-model-b.dtb: gpu@1800000 (allwinner,sun50i-h6-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi:876.32-885.7: Warning (graph_child_address): /soc/tcon-top@6510000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi:898.30-907.7: Warning (graph_child_address): /soc/tcon-top@6510000/ports/port@4: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6.dtb: gpu@1800000 (allwinner,sun50i-h6-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi:876.32-885.7: Warning (graph_child_address): /soc/tcon-top@6510000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi:898.30-907.7: Warning (graph_child_address): /soc/tcon-top@6510000/ports/port@4: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/allwinner/sun50i-h6-tanix-tx6-mini.dtb: gpu@1800000 (allwinner,sun50i-h6-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1025.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h313-tanix-tx1.dtb: gpu@1800000 (allwinner,sun50i-h616-mali): False schema does not allow [[11]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1025.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dtb: gpu@1800000 (allwinner,sun50i-h616-mali): False schema does not allow [[11]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1025.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1-manta.dtb: gpu@1800000 (allwinner,sun50i-h616-mali): False schema does not allow [[11]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1025.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-pi.dtb: gpu@1800000 (allwinner,sun50i-h616-mali): False schema does not allow [[11]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1025.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dtb: gpu@1800000 (allwinner,sun50i-h616-mali): False schema does not allow [[11]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1025.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h616-x96-mate.dtb: gpu@1800000 (allwinner,sun50i-h616-mali): False schema does not allow [[11]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1025.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h618-longanpi-3h.dtb: gpu@1800000 (allwinner,sun50i-h616-mali): False schema does not allow [[11]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1025.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dtb: gpu@1800000 (allwinner,sun50i-h616-mali): False schema does not allow [[11]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1025.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dtb: gpu@1800000 (allwinner,sun50i-h616-mali): False schema does not allow [[11]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1025.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h618-transpeed-8k618-t.dtb: gpu@1800000 (allwinner,sun50i-h616-mali): False schema does not allow [[11]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1025.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: gpu@1800000 (allwinner,sun50i-h616-mali): False schema does not allow [[11]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1025.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: gpu@1800000 (allwinner,sun50i-h616-mali): False schema does not allow [[11]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1025.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: gpu@1800000 (allwinner,sun50i-h616-mali): False schema does not allow [[11]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-1025.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-sp.dtb: gpu@1800000 (allwinner,sun50i-h616-mali): False schema does not allow [[11]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:107.6-938.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: gpu@1800000 (allwinner,sun55i-a523-mali): False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:107.6-938.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: gpu@1800000 (allwinner,sun55i-a523-mali): False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:107.6-938.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: gpu@1800000 (allwinner,sun55i-a523-mali): False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:107.6-938.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: gpu@1800000 (allwinner,sun55i-a523-mali): False schema does not allow [[4]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/exynos/exynos5433.dtsi:979.10-990.6: Warning (graph_child_address): /soc@0/decon@13800000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi:333.8-343.4: Warning (graph_child_address): /soc@0/decon@13880000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/exynos/exynos5433.dtsi:1044.10-1054.6: Warning (graph_child_address): /soc@0/dsi@13900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/exynos/exynos5433-tm2.dtb: gpu@14ac0000 (samsung,exynos5433-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/exynos/exynos5433.dtsi:979.10-990.6: Warning (graph_child_address): /soc@0/decon@13800000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi:333.8-343.4: Warning (graph_child_address): /soc@0/decon@13880000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/exynos/exynos5433.dtsi:1044.10-1054.6: Warning (graph_child_address): /soc@0/dsi@13900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/exynos/exynos5433-tm2e.dtb: gpu@14ac0000 (samsung,exynos5433-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
>> arch/arm64/boot/dts/exynos/exynos7-espresso.dtb: gpu@14ac0000 (samsung,exynos7-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'pwm1', 'spi0', 'spi1', 'spi2', 'spi3', 'spi4', 'spi5' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[45]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/mediatek/mt8183-evb.dtb: thermal-sensor (murata,ncp03wf104): $nodename:0: 'thermal-sensor' does not match '^thermistor(.*)?$'
   	from schema $id: http://devicetree.org/schemas/hwmon/ntc-thermistor.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): bt-pins-wakeup: 'piins-bt-wakeup' does not match any of the regexes: '^pinctrl-[0-9]+$', '^pins'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku16.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku272.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku288.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[46]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: pinctrl@10005000 (mediatek,mt8183-pinctrl): 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c5', 'i2c6', 'keyboard' do not match any of the regexes: '-pins(-[a-z]+)?$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dtb: gpu@13040000 (mediatek,mt8183b-mali): False schema does not allow [[45]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: gpu@13040000 (mediatek,mt8186-mali): False schema does not allow [[48]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: gpu@13040000 (mediatek,mt8186-mali): False schema does not allow [[48]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: gpu@13040000 (mediatek,mt8186-mali): False schema does not allow [[48]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: gpu@13040000 (mediatek,mt8186-mali): False schema does not allow [[48]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: gpu@13040000 (mediatek,mt8186-mali): False schema does not allow [[48]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: gpu@13040000 (mediatek,mt8186-mali): False schema does not allow [[48]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: gpu@13040000 (mediatek,mt8186-mali): False schema does not allow [[48]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: gpu@13040000 (mediatek,mt8186-mali): False schema does not allow [[48]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: gpu@13040000 (mediatek,mt8186-mali): False schema does not allow [[48]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: spmi@10015000 (mediatek,mt8186-spmi): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dtb: gpu@13040000 (mediatek,mt8186-mali): False schema does not allow [[48]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: gpu@13040000 (mediatek,mt8186-mali): False schema does not allow [[48]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: gpu@13040000 (mediatek,mt8186-mali): False schema does not allow [[48]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: gpu@13040000 (mediatek,mt8186-mali): False schema does not allow [[48]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: gpu@13040000 (mediatek,mt8186-mali): False schema does not allow [[48]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: gpu@13040000 (mediatek,mt8186-mali): False schema does not allow [[48]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: gpu@13040000 (mediatek,mt8186-mali): False schema does not allow [[48]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: gpu@13040000 (mediatek,mt8186-mali): False schema does not allow [[48]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: gpu@13040000 (mediatek,mt8186-mali): False schema does not allow [[48]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml
--
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: spmi@10015000 (mediatek,mt8186-spmi): Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: gpu@13040000 (mediatek,mt8186-mali): False schema does not allow [[48]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtb: sound (mediatek,mt8186-mt6366-rt5682s-max98360-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1282.7-1290.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: gpu@13000000 (mediatek,mt8188-mali): False schema does not allow [[44]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1282.7-1290.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: gpu@13000000 (mediatek,mt8188-mali): False schema does not allow [[44]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1282.7-1290.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: gpu@13000000 (mediatek,mt8188-mali): False schema does not allow [[44]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:1282.7-1290.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: gpu@13000000 (mediatek,mt8188-mali): False schema does not allow [[44]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: amplifier@4f (ti,tas2563): reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: gpu@13000000 (mediatek,mt8188-mali): False schema does not allow [[43]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: amplifier@4f (ti,tas2563): reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: gpu@13000000 (mediatek,mt8188-mali): False schema does not allow [[43]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: amplifier@4f (ti,tas2563): reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: gpu@13000000 (mediatek,mt8188-mali): False schema does not allow [[43]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: amplifier@4f (ti,tas2563): reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: gpu@13000000 (mediatek,mt8188-mali): False schema does not allow [[43]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: flash@0 (winbond,w25q64jwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['winbond,w25q64jwm', 'jedec,spi-nor'] is too long
   	'winbond,w25q64jwm' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at(25|26)df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'winbond,w25q64jwm' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: /soc/spi@11234000/flash@0: failed to match any schema with compatible: ['winbond,w25q64jwm', 'jedec,spi-nor']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: i2c@11d21000 (mediatek,mt8192-i2c): Unevaluated properties are not allowed ('clock-stretch-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: gpu@13000000 (mediatek,mt8192-mali): False schema does not allow [[24]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: sound (mediatek,mt8192_mt6359_rt1015p_rt5682): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-mt6359-rt1015-rt5682.yaml
--
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: flash@0 (winbond,w25q64jwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['winbond,w25q64jwm', 'jedec,spi-nor'] is too long
   	'winbond,w25q64jwm' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at(25|26)df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'winbond,w25q64jwm' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: /soc/spi@11234000/flash@0: failed to match any schema with compatible: ['winbond,w25q64jwm', 'jedec,spi-nor']
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: i2c@11d21000 (mediatek,mt8192-i2c): Unevaluated properties are not allowed ('clock-stretch-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: gpu@13000000 (mediatek,mt8192-mali): False schema does not allow [[24]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: sound (mediatek,mt8192_mt6359_rt1015p_rt5682): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8192-mt6359-rt1015-rt5682.yaml
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi:1515.7-1523.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: gpu@13000000 (mediatek,mt8195-mali): False schema does not allow [[32]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: rt1019p (realtek,rt1019p): 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi:1515.7-1523.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: gpu@13000000 (mediatek,mt8195-mali): False schema does not allow [[31]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: rt1019p (realtek,rt1019p): 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi:1515.7-1523.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: gpu@13000000 (mediatek,mt8195-mali): False schema does not allow [[31]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: rt1019p (realtek,rt1019p): 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi:1515.7-1523.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: gpu@13000000 (mediatek,mt8195-mali): False schema does not allow [[31]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: rt1019p (realtek,rt1019p): 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml
--
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:994.12-1002.7: Warning (graph_child_address): /soc/aal@14011000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:1004.12-1012.7: Warning (graph_child_address): /soc/aal@14011000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:1026.12-1034.7: Warning (graph_child_address): /soc/gamma@14012000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:1036.12-1044.7: Warning (graph_child_address): /soc/gamma@14012000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:1058.12-1066.7: Warning (graph_child_address): /soc/dither@14013000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:1068.12-1075.7: Warning (graph_child_address): /soc/dither@14013000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365-evk.dts:229.8-236.5: Warning (graph_child_address): /soc/dsi@14014000/panel@0/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365-evk.dts:242.10-250.5: Warning (graph_child_address): /soc/dsi@14014000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365-evk.dts:252.10-260.5: Warning (graph_child_address): /soc/dsi@14014000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365-evk.dts:36.8-43.5: Warning (graph_child_address): /connector/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: gpu@13040000 (mediatek,mt8365-mali): False schema does not allow [[19]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): 'adc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml
--
   arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi:1249.7-1257.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: gpu@13000000 (mediatek,mt8370-mali): False schema does not allow [[35]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: usb@112a1000 (mediatek,mt8188-mtu3): usb@0:hub@1:compatible: ['microchip,usb2513bi'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtu3.yaml
   arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: usb@0 (mediatek,mt8188-xhci): hub@1:compatible: ['microchip,usb2513bi'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: gpu@13000000 (mediatek,mt8370-mali): False schema does not allow [[33]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi:1205.7-1213.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: gpu@13000000 (mediatek,mt8195-mali): False schema does not allow [[28]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
--
   arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi:1205.7-1213.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: gpu@13000000 (mediatek,mt8195-mali): False schema does not allow [[28]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
--
   arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi:1249.7-1257.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: gpu@13000000 (mediatek,mt8188-mali): False schema does not allow [[37]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: usb@112a1000 (mediatek,mt8188-mtu3): usb@0:hub@1:compatible: ['microchip,usb2513bi'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtu3.yaml
   arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: usb@0 (mediatek,mt8188-xhci): hub@1:compatible: ['microchip,usb2513bi'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: gpu@13000000 (mediatek,mt8188-mali): False schema does not allow [[35]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: gpu@13000000 (mediatek,mt8195-mali): False schema does not allow [[111]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3359.22-3371.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1c008000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: gpu@13000000 (mediatek,mt8195-mali): False schema does not allow [[28]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:827.12-835.7: Warning (graph_child_address): /soc/video@10830000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:837.12-846.7: Warning (graph_child_address): /soc/video@10830000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:872.12-881.7: Warning (graph_child_address): /soc/csi2@10830400/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: gpu@11840000 (renesas,r9a07g044-mali): False schema does not allow [[39]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:827.12-835.7: Warning (graph_child_address): /soc/video@10830000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:837.12-846.7: Warning (graph_child_address): /soc/video@10830000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:872.12-881.7: Warning (graph_child_address): /soc/csi2@10830400/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dtb: gpu@11840000 (renesas,r9a07g044-mali): False schema does not allow [[30]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:827.12-835.7: Warning (graph_child_address): /soc/video@10830000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:837.12-846.7: Warning (graph_child_address): /soc/video@10830000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:872.12-881.7: Warning (graph_child_address): /soc/csi2@10830400/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: gpu@11840000 (renesas,r9a07g044-mali): False schema does not allow [[45]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g054.dtsi:832.12-840.7: Warning (graph_child_address): /soc/video@10830000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g054.dtsi:842.12-851.7: Warning (graph_child_address): /soc/video@10830000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g054.dtsi:877.12-886.7: Warning (graph_child_address): /soc/csi2@10830400/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dtb: gpu@11840000 (renesas,r9a07g054-mali): False schema does not allow [[45]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/renesas/r9a09g047.dtsi:1140.12-1149.7: Warning (graph_child_address): /soc/video@16000000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a09g047.dtsi:1172.12-1181.7: Warning (graph_child_address): /soc/csi2@16000400/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dtb: gpu@14850000 (renesas,r9a09g047-mali): False schema does not allow [[20]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dtb: gpu@14850000 (renesas,r9a09g057-mali): False schema does not allow [[23]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: gpu@14850000 (renesas,r9a09g056-mali): False schema does not allow [[21]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc-cru-csi-ov5645.dtb: gpu@11840000 (renesas,r9a07g044-mali): False schema does not allow [[39]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc-cru-csi-ov5645.dtb: gpu@11840000 (renesas,r9a07g044-mali): False schema does not allow [[45]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/renesas/r9a07g054l2-smarc-cru-csi-ov5645.dtb: gpu@11840000 (renesas,r9a07g054-mali): False schema does not allow [[45]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtb: gpu@14850000 (renesas,r9a09g047-mali): False schema does not allow [[20]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtb: gpu@14850000 (renesas,r9a09g057-mali): False schema does not allow [[23]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtb: gpu@14850000 (renesas,r9a09g057-mali): False schema does not allow [[23]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: gpu@14850000 (renesas,r9a09g056-mali): False schema does not allow [[21]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: pinctrl@10410000 (renesas,r9a09g056-pinctrl): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: gpu@14850000 (renesas,r9a09g056-mali): False schema does not allow [[21]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dtb: gpu@ff400000 (rockchip,px30-mali): False schema does not allow [[142]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dtb: gpu@ff400000 (rockchip,px30-mali): False schema does not allow [[142]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148w.dtb: gpu@ff400000 (rockchip,px30-mali): False schema does not allow [[142]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dtb: gpu@ff400000 (rockchip,px30-mali): False schema does not allow [[141]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/rockchip/px30.dtsi:1274.9-1281.5: Warning (graph_child_address): /isp@ff4a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/px30-evb.dtb: gpu@ff400000 (rockchip,px30-mali): False schema does not allow [[149]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/px30-firefly-jd4-core-mb.dtb: gpu@ff400000 (rockchip,px30-mali): False schema does not allow [[143]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/rockchip/px30.dtsi:1274.9-1281.5: Warning (graph_child_address): /isp@ff4a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3146w-a2.dtb: gpu@ff400000 (rockchip,px30-mali): False schema does not allow [[151]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/rockchip/px30.dtsi:1274.9-1281.5: Warning (graph_child_address): /isp@ff4a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3148w.dtb: gpu@ff400000 (rockchip,px30-mali): False schema does not allow [[151]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dtb: gpu@ff300000 (rockchip,rk3328-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-utgard.yaml
--
   arch/arm64/boot/dts/rockchip/px30.dtsi:472.21-486.7: Warning (graph_child_address): /syscon@ff140000/lvds/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/px30.dtsi:1142.19-1156.6: Warning (graph_child_address): /dsi@ff450000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3326-anbernic-rg351m.dtb: gpu@ff400000 (rockchip,px30-mali): False schema does not allow [[138]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/rockchip/px30.dtsi:472.21-486.7: Warning (graph_child_address): /syscon@ff140000/lvds/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/px30.dtsi:1142.19-1156.6: Warning (graph_child_address): /dsi@ff450000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3326-anbernic-rg351v.dtb: gpu@ff400000 (rockchip,px30-mali): False schema does not allow [[138]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/rockchip/px30.dtsi:472.21-486.7: Warning (graph_child_address): /syscon@ff140000/lvds/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/px30.dtsi:1142.19-1156.6: Warning (graph_child_address): /dsi@ff450000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3326-gameforce-chi.dtb: gpu@ff400000 (rockchip,px30-mali): False schema does not allow [[144]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/rockchip/px30.dtsi:472.21-486.7: Warning (graph_child_address): /syscon@ff140000/lvds/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/px30.dtsi:1142.19-1156.6: Warning (graph_child_address): /dsi@ff450000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dtb: gpu@ff400000 (rockchip,px30-mali): False schema does not allow [[138]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/rockchip/px30.dtsi:472.21-486.7: Warning (graph_child_address): /syscon@ff140000/lvds/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/px30.dtsi:1142.19-1156.6: Warning (graph_child_address): /dsi@ff450000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3326-odroid-go2-v11.dtb: gpu@ff400000 (rockchip,px30-mali): False schema does not allow [[140]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/rockchip/px30.dtsi:472.21-486.7: Warning (graph_child_address): /syscon@ff140000/lvds/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/px30.dtsi:1142.19-1156.6: Warning (graph_child_address): /dsi@ff450000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3326-odroid-go3.dtb: gpu@ff400000 (rockchip,px30-mali): False schema does not allow [[138]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3328-a1.dtb: gpu@ff300000 (rockchip,rk3328-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-utgard.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3328-rock64.dtb: gpu@ff300000 (rockchip,rk3328-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-utgard.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dtb: gpu@ff300000 (rockchip,rk3328-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-utgard.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dtb: gpu@ff300000 (rockchip,rk3328-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-utgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts:576.9-586.5: Warning (graph_child_address): /i2c@ff3d0000/typec-portc@22/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: /i2c@ff110000/audio-codec@1a: failed to match any schema with compatible: ['realtek,rt5651']
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: typec-portc@22 (fcs,fusb302): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: usb2phy@e450 (rockchip,rk3399-usb2phy): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-ficus.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: rt5640@1c (realtek,rt5640): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml
   arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml
   arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml
   arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: usb2phy@e450 (rockchip,rk3399-usb2phy): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml
   arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: spdif@ff870000 (rockchip,rk3399-spdif): Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/rockchip-spdif.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: pcie@0,0: wifi@0,0:interrupts:0: [8, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: usb@fe800000 (rockchip,rk3399-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: usb@fe900000 (rockchip,rk3399-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb: /sound: failed to match any schema with compatible: ['rockchip,rk3399-gru-sound']
--
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: pcie@0,0: wifi@0,0:interrupts:0: [8, 8] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: usb@fe800000 (rockchip,rk3399-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: usb@fe900000 (rockchip,rk3399-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb: /sound: failed to match any schema with compatible: ['rockchip,rk3399-gru-sound']
--
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: wifi@0,0 (qcom,ath10k): reg: [[0, 0, 0, 0, 0], [50331664, 0, 0, 0, 2097152]] is too long
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath10k.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: usb@fe800000 (rockchip,rk3399-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: panel@0 (innolux,p097pfg): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/innolux,p097pfg.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dtb: /sound: failed to match any schema with compatible: ['rockchip,rk3399-gru-sound']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1947.9-1956.5: Warning (graph_child_address): /isp0@ff910000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: usb@fe800000 (rockchip,rk3399-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: panel@0 (innolux,p097pfg): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/innolux,p097pfg.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb: /sound: failed to match any schema with compatible: ['rockchip,rk3399-gru-sound']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1947.9-1956.5: Warning (graph_child_address): /isp0@ff910000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: usb@fe800000 (rockchip,rk3399-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: dp@fec00000 (rockchip,rk3399-cdn-dp): ports: 'port@1' is a required property
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,rk3399-cdn-dp.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: panel@0 (kingdisplay,kd097d04): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-dsi.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
   arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb: /sound: failed to match any schema with compatible: ['rockchip,rk3399-gru-sound']
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dtb: bluetooth (brcm,bcm43438-bt): clock-names: 'oneOf' conditional failed, one must be fixed:
   	['ext_clock'] is too short
   	'extclk' was expected
   	'txco' was expected
   	'lpo' was expected
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bluetooth.yaml
   arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dtb: typec-portc@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dtb: bluetooth (brcm,bcm43438-bt): clock-names: 'oneOf' conditional failed, one must be fixed:
   	['ext_clock'] is too short
   	'extclk' was expected
   	'txco' was expected
   	'lpo' was expected
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/brcm,bluetooth.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dtb: typec-portc@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dtb: typec-portc@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1356.21-1369.4: Warning (avoid_unnecessary_addr_size): /i2c@ff3d0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4b.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dtb: typec-portc@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s-enterprise.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-orangepi.dtb: cm32181@10 (capella,cm32181): 'vdd-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml
   arch/arm64/boot/dts/rockchip/rk3399-orangepi.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml
   arch/arm64/boot/dts/rockchip/rk3399-orangepi.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml
   arch/arm64/boot/dts/rockchip/rk3399-orangepi.dtb: usb2phy@e450 (rockchip,rk3399-usb2phy): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-orangepi.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml
   arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml
   arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: usb2phy@e450 (rockchip,rk3399-usb2phy): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1947.9-1956.5: Warning (graph_child_address): /isp0@ff910000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1951.11-1955.6: Warning (graph_child_address): /isp0@ff910000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1984.9-1993.5: Warning (graph_child_address): /isp1@ff920000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1988.11-1992.6: Warning (graph_child_address): /isp1@ff920000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtb: usb-typec@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtb: /i2c@ff160000/regulator@66: failed to match any schema with compatible: ['mps,mp8859']
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtb: usb-typec@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dtb: usb-typec@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dtb: /i2c@ff160000/regulator@66: failed to match any schema with compatible: ['mps,mp8859']
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dtb: usb-typec@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1356.21-1369.4: Warning (avoid_unnecessary_addr_size): /i2c@ff3d0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: usb-typec@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   	'st,24256e-wl' was expected
   	'belling,bl24c04a' does not match '^atmel,24c(32|64)d-wl$'
   	'atmel,24c01' was expected
   	'atmel,24c02' was expected
   	'atmel,24c16' was expected
   	'atmel,24c32' was expected
   	'atmel,24c64' was expected
   	'atmel,24c128' was expected
   	'atmel,24c256' was expected
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-rock-4se.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   	'st,24256e-wl' was expected
   	'belling,bl24c04a' does not match '^atmel,24c(32|64)d-wl$'
   	'atmel,24c01' was expected
   	'atmel,24c02' was expected
   	'atmel,24c16' was expected
   	'atmel,24c32' was expected
   	'atmel,24c64' was expected
   	'atmel,24c128' was expected
   	'atmel,24c256' was expected
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   	'st,24256e-wl' was expected
   	'belling,bl24c04a' does not match '^atmel,24c(32|64)d-wl$'
   	'atmel,24c01' was expected
   	'atmel,24c02' was expected
   	'atmel,24c16' was expected
   	'atmel,24c32' was expected
   	'atmel,24c64' was expected
   	'atmel,24c128' was expected
   	'atmel,24c256' was expected
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   	'st,24256e-wl' was expected
   	'belling,bl24c04a' does not match '^atmel,24c(32|64)d-wl$'
   	'atmel,24c01' was expected
   	'atmel,24c02' was expected
   	'atmel,24c16' was expected
   	'atmel,24c32' was expected
   	'atmel,24c64' was expected
   	'atmel,24c128' was expected
   	'atmel,24c256' was expected
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   	'st,24256e-wl' was expected
   	'belling,bl24c04a' does not match '^atmel,24c(32|64)d-wl$'
   	'atmel,24c01' was expected
   	'atmel,24c02' was expected
   	'atmel,24c16' was expected
   	'atmel,24c32' was expected
   	'atmel,24c64' was expected
   	'atmel,24c128' was expected
   	'atmel,24c256' was expected
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   	'st,24256e-wl' was expected
   	'belling,bl24c04a' does not match '^atmel,24c(32|64)d-wl$'
   	'atmel,24c01' was expected
   	'atmel,24c02' was expected
   	'atmel,24c16' was expected
   	'atmel,24c32' was expected
   	'atmel,24c64' was expected
   	'atmel,24c128' was expected
   	'atmel,24c256' was expected
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-rock960.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dtb: typec-portc@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtb: typec-portc@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb: /i2c@ff110000/rt5651@1a: failed to match any schema with compatible: ['realtek,rt5651']
>> arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:280.6-1229.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dtb: gpu@ff700000 (rockchip,rk3528-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-utgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:280.6-1229.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dtb: gpu@ff700000 (rockchip,rk3528-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-utgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:280.6-1229.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: gpu@ff700000 (rockchip,rk3528-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-utgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:280.6-1229.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dtb: gpu@ff700000 (rockchip,rk3528-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-utgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:280.6-1229.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dtb: gpu@ff700000 (rockchip,rk3528-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-utgard.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-d.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[69]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-s.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[69]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[69]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353ps.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[69]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353v.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[69]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353vs.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[69]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[69]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[67]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v1.1.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[67]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v2.1.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[68]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v0.1.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[71]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v2.0.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[71]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb10max3.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[69]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb20sx.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[69]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[69]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[69]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[71]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/rockchip/rk3566-qnap-ts133.dtb: /serial@fdd50000/mcu: failed to match any schema with compatible: ['qnap,ts133-mcu']
>> arch/arm64/boot/dts/rockchip/rk3566-qnap-ts133.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[63]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[69]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[69]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3-io.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[66]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3-io.dtb: wifi@1 (brcm,bcm43455-fmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,bcm43455-fmac'] is too short
   	'brcm,bcm43455-fmac' is not one of ['brcm,bcm4329-fmac', 'pci14e4,43dc', 'pci14e4,4464', 'pci14e4,4488', 'pci14e4,4425', 'pci14e4,4433', 'pci14e4,4434', 'pci14e4,449d']
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3e.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[68]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3w.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[68]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[68]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[69]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-blade.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[66]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-cm4.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[66]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-model-a.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[66]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[68]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[67]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[67]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[67]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: touchscreen@48 (ti,tsc2007): 'ti,rt-thr' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2007.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[67]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: touchscreen@48 (ti,tsc2007): 'ti,rt-thr' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2007.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[72]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[68]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3568-easepi-r1.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[70]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[72]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[70]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r68s.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[69]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3568-hinlink-h66k.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[70]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3568-hinlink-h68k.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[70]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[70]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[65]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5c.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[71]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[71]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[70]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3568-photonicat.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[64]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[66]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[66]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[71]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[68]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[72]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[72]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[71]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>> arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: gpu@27800000 (rockchip,rk3576-mali): False schema does not allow [[89]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
   arch/arm64/boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: gpu@27800000 (rockchip,rk3576-mali): False schema does not allow [[90]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: gpu@27800000 (rockchip,rk3576-mali): False schema does not allow [[92]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>> arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dtb: gpu@27800000 (rockchip,rk3576-mali): False schema does not allow [[88]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: gpu@27800000 (rockchip,rk3576-mali): False schema does not allow [[90]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
   arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dtb: gpu@27800000 (rockchip,rk3576-mali): False schema does not allow [[91]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: gpu@27800000 (rockchip,rk3576-mali): False schema does not allow [[84]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
--
   arch/arm64/boot/dts/rockchip/rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: gpu@27800000 (rockchip,rk3576-mali): False schema does not allow [[89]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/i2c@2ac90000/eeprom@50: failed to match any schema with compatible: ['belling,bl24c16f', 'atmel,24c16']
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: eeprom@50 (belling,bl24c16f): compatible: 'oneOf' conditional failed, one must be fixed:
   	arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: eeprom@50 (belling,bl24c16f): compatible: 'oneOf' conditional failed, one must be fixed:
   		'belling,bl24c16f' does not match 'c00$'
   		'belling,bl24c16f' does not match 'c01$'
   		'belling,bl24c16f' does not match 'cs01$'
   		'belling,bl24c16f' does not match 'c02$'
--
>> arch/arm64/boot/dts/rockchip/rk3399-puma-haikou-haikou-video-demo.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtb: typec-portc@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2-screen.dtb: typec-portc@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2-screen.dtb: gpu@ff9a0000 (rockchip,rk3399-mali): 'sram-supply' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-midgard.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: gpu@fde60000 (rockchip,rk3568-mali): False schema does not allow [[71]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: touchscreen@55 (sitronix,st1624): compatible:0: 'sitronix,st1624' is not one of ['sitronix,st1232', 'sitronix,st1633']
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/sitronix,st1232.yaml
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: touchscreen@55 (sitronix,st1624): compatible: ['sitronix,st1624', 'sitronix,st1633'] is too long
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/sitronix,st1232.yaml
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: touchscreen@55 (sitronix,st1624): Unevaluated properties are not allowed ('wakeup-source' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/sitronix,st1232.yaml
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: /i2c@fe5a0000/touchscreen@55: failed to match any schema with compatible: ['sitronix,st1624', 'sitronix,st1633']
--
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: gpu@27800000 (rockchip,rk3576-mali): False schema does not allow [[90]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: gpu@27800000 (rockchip,rk3576-mali): False schema does not allow [[92]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: ethernet@2a220000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtb: ethernet@2a230000 (rockchip,rk3576-gmac): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
