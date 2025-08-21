Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865CC2D7DFA
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Aug 2025 20:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755808465; cv=none; b=cYH0UDYMif+4yMJnVJzKaVJLkUmZ9H5sf88szkPTaugsW6CjyyntTh+2PBxeaxrCcu81qv8kXi65BONM4UJ1uJHKBrbsiBAij6CBIn2hg/a4woZayaABWERbB3H6sbQrrbTvqERh3e73ogqV8HK7eQNHO8xYhXeyIwW/nR/KZIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755808465; c=relaxed/simple;
	bh=p8ZKE4j903kLX/kawUKNOiwci0M5AmFLJm1ilAsLt8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r1CcAnVcNBsEf+12043VWRcekIDPLGkKhAp4wkjMfBUZIJjv/TEiw8ULN0/dzyekPSl8zFiAOE0hDuVr9wPCl8Q5H6eDeDGld8aMFMyCGpuZKRAhbiHibxKfSe6SjeAfKYwXThQ6O4J4NS8o3vJZi3VIXewaxLA7/BwrAZ3HHAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b87Kq0+7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b87Kq0+7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755808463; x=1787344463;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p8ZKE4j903kLX/kawUKNOiwci0M5AmFLJm1ilAsLt8Y=;
  b=b87Kq0+7xUSNoct+qgh33nu6Lj80mWxq50wW5BTX5mQtOcB9o8uxWK/G
   Ufg3cV1BvQ3pMcJqmJrRG9AlKw5iD6oL3gHp8HaL8tc8fqmecTtxsVasX
   XUSU4ZDu02mva0rZksU9JAwbDaiDcSAgKzKUu4Fpn0Yx74daf4yQF0g6t
   icVHFcg5LfEIr52qaE/X/PA46cir72J2K7Zbq8l1yyopWksriGF03HTcJ
   oIfq6gaGrjfu3nqSPSyt60lojgLJMPAcwsEujzmHxYZr++NAVTxdJTnn/
   aUiqjEy9aaKq0FwoCwn2NjZZf6oUAZT5aOjVTEyGmegz8PmfG7FKFim25
   A==;
X-CSE-ConnectionGUID: cmPY8VcITCWYVQfhvnd0SQ==
X-CSE-MsgGUID: UxkbYzQ9RNGQ7JPXq+/C1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58060789"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="58060789"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 13:34:19 -0700
X-CSE-ConnectionGUID: ghFq80ODSbOsEMxLBeEIug==
X-CSE-MsgGUID: 0waWcbIKRBm81+litGRhBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="169323014"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 21 Aug 2025 13:34:17 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upBzC-000Kdr-2e;
	Thu, 21 Aug 2025 20:34:14 +0000
Date: Fri, 22 Aug 2025 04:34:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 14/14] dt-bindings: media: mediatek, jpeg: Fix jpeg
 encoder/decoder ranges
Message-ID: <202508220434.WbC4GGgV-lkp@intel.com>
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
In-Reply-To: <20250820171302.324142-15-ariel.dalessandro@collabora.com>
References: <20250820171302.324142-15-ariel.dalessandro@collabora.com>
TO: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
TO: airlied@gmail.com
TO: amergnat@baylibre.com
TO: andrew+netdev@lunn.ch
TO: andrew-ct.chen@mediatek.com
TO: angelogioacchino.delregno@collabora.com
TO: ariel.dalessandro@collabora.com
TO: broonie@kernel.org
TO: chunkuang.hu@kernel.org
TO: ck.hu@mediatek.com
TO: conor+dt@kernel.org
TO: davem@davemloft.net
TO: dmitry.torokhov@gmail.com
TO: edumazet@google.com
TO: flora.fu@mediatek.com
TO: houlong.wei@mediatek.com
TO: jeesw@melfas.com
TO: jmassot@collabora.com
TO: kernel@collabora.com
TO: krzk+dt@kernel.org
TO: kuba@kernel.org
TO: kyrie.wu@mediatek.corp-partner.google.com
TO: lgirdwood@gmail.com
TO: linus.walleij@linaro.org
TO: louisalexis.eyraud@collabora.com
TO: maarten.lankhorst@linux.intel.com
TO: matthias.bgg@gmail.com
TO: mchehab@kernel.org
TO: minghsiu.tsai@mediatek.com
TO: mripard@kernel.org
TO: p.zabel@pengutronix.de

Hi Ariel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on broonie-sound/for-next broonie-regulator/for-next linus/master v6.17-rc2 next-20250821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ariel-D-Alessandro/media-dt-bindings-Convert-MediaTek-mt8173-mdp-bindings-to-YAML/20250821-011915
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250820171302.324142-15-ariel.dalessandro%40collabora.com
patch subject: [PATCH v1 14/14] dt-bindings: media: mediatek, jpeg: Fix jpeg encoder/decoder ranges
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: arm64-randconfig-051-20250821 (https://download.01.org/0day-ci/archive/20250822/202508220434.WbC4GGgV-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250822/202508220434.WbC4GGgV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508220434.WbC4GGgV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a (realtek,rt5682s): 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a (realtek,rt5682s): 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: codec@1a (realtek,rt5682s): Unevaluated properties are not allowed ('VBAT-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: jpgdec-master (mediatek,mt8195-jpgdec): 'jpgdec@1a040000', 'jpgdec@1a050000', 'jpgdec@1b040000' do not match any of the regexes: '^jpgdec@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: jpgenc-master (mediatek,mt8195-jpgenc): 'jpgenc@1a030000', 'jpgenc@1b030000' do not match any of the regexes: '^jpgenc@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: rt1019p (realtek,rt1019p): 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: codec@1a (realtek,rt5682i): 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: codec@1a (realtek,rt5682i): 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: jpgdec-master (mediatek,mt8195-jpgdec): 'jpgdec@1a040000', 'jpgdec@1a050000', 'jpgdec@1b040000' do not match any of the regexes: '^jpgdec@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: jpgenc-master (mediatek,mt8195-jpgenc): 'jpgenc@1a030000', 'jpgenc@1b030000' do not match any of the regexes: '^jpgenc@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dtb: rt1019p (realtek,rt1019p): 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: codec@1a (realtek,rt5682i): 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: codec@1a (realtek,rt5682i): 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: jpgdec-master (mediatek,mt8195-jpgdec): 'jpgdec@1a040000', 'jpgdec@1a050000', 'jpgdec@1b040000' do not match any of the regexes: '^jpgdec@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: jpgenc-master (mediatek,mt8195-jpgenc): 'jpgenc@1a030000', 'jpgenc@1b030000' do not match any of the regexes: '^jpgenc@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dtb: rt1019p (realtek,rt1019p): 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: pmic@34 (mediatek,mt6360): #interrupt-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6360.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a (realtek,rt5682s): 'DBVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a (realtek,rt5682s): 'LDO1-IN-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: codec@1a (realtek,rt5682s): Unevaluated properties are not allowed ('VBAT-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: jpgdec-master (mediatek,mt8195-jpgdec): 'jpgdec@1a040000', 'jpgdec@1a050000', 'jpgdec@1b040000' do not match any of the regexes: '^jpgdec@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: jpgenc-master (mediatek,mt8195-jpgenc): 'jpgenc@1a030000', 'jpgenc@1b030000' do not match any of the regexes: '^jpgenc@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dtb: rt1019p (realtek,rt1019p): 'label' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3042.17-3099.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3116.17-3152.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: jpgdec-master (mediatek,mt8195-jpgdec): 'jpgdec@1a040000', 'jpgdec@1a050000', 'jpgdec@1b040000' do not match any of the regexes: '^jpgdec@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-demo.dtb: jpgenc-master (mediatek,mt8195-jpgenc): 'jpgenc@1a030000', 'jpgenc@1b030000' do not match any of the regexes: '^jpgenc@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3042.17-3099.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3116.17-3152.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: jpgdec-master (mediatek,mt8195-jpgdec): 'jpgdec@1a040000', 'jpgdec@1a050000', 'jpgdec@1b040000' do not match any of the regexes: '^jpgdec@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: jpgenc-master (mediatek,mt8195-jpgenc): 'jpgenc@1a030000', 'jpgenc@1b030000' do not match any of the regexes: '^jpgenc@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3042.17-3099.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3116.17-3152.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts:1176.7-1184.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: jpgdec-master (mediatek,mt8195-jpgdec): 'jpgdec@1a040000', 'jpgdec@1a050000', 'jpgdec@1b040000' do not match any of the regexes: '^jpgdec@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: jpgenc-master (mediatek,mt8195-jpgenc): 'jpgenc@1a030000', 'jpgenc@1b030000' do not match any of the regexes: '^jpgenc@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3042.17-3099.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3116.17-3152.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: regulator (mediatek,mt6360-regulator): 'BUCK1', 'BUCK2', 'LDO1', 'LDO2', 'LDO3', 'LDO5', 'LDO6', 'LDO7' do not match any of the regexes: '^buck[12]$', '^ldo[123567]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mt6360-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: jpgdec-master (mediatek,mt8195-jpgdec): 'jpgdec@1a040000', 'jpgdec@1a050000', 'jpgdec@1b040000' do not match any of the regexes: '^jpgdec@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dtb: jpgenc-master (mediatek,mt8195-jpgenc): 'jpgenc@1a030000', 'jpgenc@1b030000' do not match any of the regexes: '^jpgenc@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3042.17-3099.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3116.17-3152.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3360.22-3372.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1c008000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: jpgdec-master (mediatek,mt8195-jpgdec): 'jpgdec@1a040000', 'jpgdec@1a050000', 'jpgdec@1b040000' do not match any of the regexes: '^jpgdec@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml#
>> arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dtb: jpgenc-master (mediatek,mt8195-jpgenc): 'jpgenc@1a030000', 'jpgenc@1b030000' do not match any of the regexes: '^jpgenc@[0-9],[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
