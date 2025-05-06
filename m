Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6BB222592
	for <oe-kbuild@lists.linux.dev>; Tue,  6 May 2025 07:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746516345; cv=none; b=kQX71SBD5aE/8iV2G5jkcsmbrIGzDnnFssM2LHvqVlhAJ8/j65ogBYDuMdlB2+QK0DHbxEJ4VSMZDLQUfrC300MdPZMTgOyNBlPbpC9a4kBSTazx50pKDhmYIEo0pQRN4yF2AEsG/j+A7KxSVCIQihKyfUIr7EPrIK/JcTLfC/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746516345; c=relaxed/simple;
	bh=5dUG9Cywe3fOPX4S59hb4p2bbwz1gHa308vGxI2dKt8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nSH6/MEuP8huaX4btbIqADAUBrbl/9bbwh/UkuupkUL437mdzSbP5qPy4mm1cgNDENZvaYXncFLJy9ikEVtDYXObETRZZqlaA1ZM+dbupoymilOf3EMCiqUJAdmxfRdzxLbe4PB468Nsq0nNrEQz4LOqjXiiPUqnzr5MrfD2JyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MXiq6QJY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MXiq6QJY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746516343; x=1778052343;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5dUG9Cywe3fOPX4S59hb4p2bbwz1gHa308vGxI2dKt8=;
  b=MXiq6QJY10L0S4os9MkAvNEQQvQcuTos/y17IrN9GUekC5IXTa3Ijb4A
   y2oEtunuqARMPih+zzazjLW3dWyLEmhSjqBq+h2VBlBZfnVlQmMbuVyrd
   lDuh3ewtYvueL9y9/4TltBK2H7UxSVoMg2MaF2fWC8+GsY6PssmLO83F/
   xNgdzG94ThN0EouhQ8mdroo6P3mJxNWzvK5A8Kp5k54mwdVL/AUs9HWIF
   jClujkMY5osYzexhRg/2NA2uM/3wgshOz7pEonfeWTXSAz8LYkdEU/Kvt
   J653dZuXWT5jKR7fQZ+7CFXF8BxszAhme39xxO4rjTEZOAn77UmwXWiY6
   Q==;
X-CSE-ConnectionGUID: 0FmL8AkbRqOoD2FLAxEjNw==
X-CSE-MsgGUID: Yq9RVmUpQWqKHE3+KafEZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48299145"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="48299145"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 00:25:41 -0700
X-CSE-ConnectionGUID: RgqKyih+REy88Huldppq8Q==
X-CSE-MsgGUID: 8iL88pGFRIi6p3DI16VwXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="136048558"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 May 2025 00:25:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCCgL-0006Lt-1U;
	Tue, 06 May 2025 07:25:37 +0000
Date: Tue, 6 May 2025 15:24:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: mediatek: mt6357: Drop regulator-fixed
 compatibles
Message-ID: <202505061508.s8EBD3WX-lkp@intel.com>
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
In-Reply-To: <20250502-mt6357-regulator-fixed-compatibles-removal-v1-1-a582c16743fe@collabora.com>
References: <20250502-mt6357-regulator-fixed-compatibles-removal-v1-1-a582c16743fe@collabora.com>
TO: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Alexandre Mergnat <amergnat@baylibre.com>
TO: Fabien Parent <fparent@baylibre.com>
CC: kernel@collabora.com
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>

Hi Nícolas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 37ff6e9a2ce321b7932d3987701757fb4d87b0e6]

url:    https://github.com/intel-lab-lkp/linux/commits/N-colas-F-R-A-Prado/arm64-dts-mediatek-mt6357-Drop-regulator-fixed-compatibles/20250502-234452
base:   37ff6e9a2ce321b7932d3987701757fb4d87b0e6
patch link:    https://lore.kernel.org/r/20250502-mt6357-regulator-fixed-compatibles-removal-v1-1-a582c16743fe%40collabora.com
patch subject: [PATCH] arm64: dts: mediatek: mt6357: Drop regulator-fixed compatibles
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-051-20250506 (https://download.01.org/0day-ci/archive/20250506/202505061508.s8EBD3WX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505061508.s8EBD3WX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505061508.s8EBD3WX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:985.12-993.7: Warning (graph_child_address): /soc/gamma@14012000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:995.12-1003.7: Warning (graph_child_address): /soc/gamma@14012000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:1017.12-1025.7: Warning (graph_child_address): /soc/dither@14013000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:1027.12-1034.7: Warning (graph_child_address): /soc/dither@14013000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365-evk.dts:214.8-221.5: Warning (graph_child_address): /soc/dsi@14014000/panel@0/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365-evk.dts:227.10-235.5: Warning (graph_child_address): /soc/dsi@14014000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365-evk.dts:237.10-245.5: Warning (graph_child_address): /soc/dsi@14014000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365-evk.dts:36.8-43.5: Warning (graph_child_address): /connector/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): 'adc' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vfe28: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vfe28: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vfe28: 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vfe28: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vrf18: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vrf18: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vrf18: 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vrf18: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vrf12: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vrf12: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vrf12: 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vrf12: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcn28: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcn28: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcn28: 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcn28: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcn18: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcn18: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcn18: 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcn18: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcamio18: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcamio18: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcamio18: 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vcamio18: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vaux18: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vaux18: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vaux18: 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vaux18: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vaud28: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vaud28: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vaud28: 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vaud28: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vio28: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vio28: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vio28: 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vio28: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vio18: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vio18: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vio18: 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: pmic (mediatek,mt6357): regulators:ldo-vio18: 'compatible' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6357.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
