Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1941B10F2
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Jan 2026 03:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769311265; cv=none; b=iY5+5WIXWMmVP1mGSlVezTUYTO+Z4olEosyiXiyPGN9lsnvmwVmZABx8oZERQHnXIibdTjZWu6OooMlD0GsXTQV3va06SNREnHPet5HLKr4UdKaFz0MKnwTJav1oXpQ1nuFJzIP9ez0xv3XvNnkAiL6TEpbbkcomAHSZw+Na2MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769311265; c=relaxed/simple;
	bh=qKSWwA+jm8ad0Z+7nJOCzc493Djr4PDp5h5VitakU6Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GLRk6vWj38bh8d5mW2RJM0SZUiDxZv2oHaF0Qjp99k0kw4ofRDn9hmkU883RcGBy8DmEOENXE7K11FHtmGccbn7/NKzPk08S7ByXz4syCyfLc0C9DOSII5aECWu6+Fm/JmFRSOB1TghPSRIHST8QvlNeAQhM64cjiYN4SAidxPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ONhcXxVB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ONhcXxVB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769311264; x=1800847264;
  h=date:from:to:cc:subject:message-id;
  bh=qKSWwA+jm8ad0Z+7nJOCzc493Djr4PDp5h5VitakU6Q=;
  b=ONhcXxVBVybcSXk859W2ObptQ68WM5hwxyQEj2KSUlnbxkSXUrmHrpKp
   PUZ5I9sLoxSkUOpCq5VknbW8rB488Nf9GqPxEzXHjIobXLSw/6iFgsSan
   7yzX0do1ENNbzsp+TTtrd2Sj3mOWh2/1GauEIYqERz6rMWVOF5eOdrTRc
   1zu3Fk+37EC8bbwdlPkxxkEpL67okXSRLWKhlqbHRDmLiMX96BHmmnAWj
   R5fV+gIQEMmIq7IUQCvRBHKojbWFkiBQxmmbo9Md3T17VMIULq46lJqHE
   kBQQbFeGLDQ1cqFNdkuO+yJz41bf8T4KA53Vq/JPZmkHbbRuabAwY4T9p
   w==;
X-CSE-ConnectionGUID: uzvEgnh5S/Kgae5Z0YvQRA==
X-CSE-MsgGUID: Q0+bW4JrS/ybHWa6Eq9Kog==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="88095066"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="88095066"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 19:21:03 -0800
X-CSE-ConnectionGUID: KlpaSAq4RSeVhxW0lgEX8A==
X-CSE-MsgGUID: BoUMdpYaTbeOCJnlQCigfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="207266336"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 24 Jan 2026 19:21:01 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjqgN-0000000017h-40Xp;
	Sun, 25 Jan 2026 03:20:59 +0000
Date: Sun, 25 Jan 2026 04:20:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [clk:clk-mediatek 2/9]
 arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: syscon@1a100800
 (mediatek,mt7629-pciesys): compatible: ['mediatek,mt7629-pciesys', 'syscon']
 is too long
Message-ID: <202601250432.5X8GZ6sm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-clk@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-mediatek
head:   aa2ad19210a6a444111bce55e8b69579f29318fb
commit: a2ed1aed687a21738a6c8bd4043149c443298e88 [2/9] dt-bindings: clock: mediatek,mt7622-pciesys: Remove syscon compatible
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2051-20260124 (https://download.01.org/0day-ci/archive/20260125/202601250432.5X8GZ6sm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601250432.5X8GZ6sm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601250432.5X8GZ6sm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/mediatek/mt7629.dtsi:163.38-172.5: Warning (simple_bus_reg): /soc/interrupt-controller@10300000: simple-bus unit address format error, expected "10310000"
   arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: /soc/power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7629-scpsys', 'mediatek,mt7622-scpsys']
   arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: /soc/power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt7629-scpsys', 'mediatek,mt7622-scpsys']
   arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: pinctrl@10217000 (mediatek,mt7629-pinctrl): ephy-leds-pins:mux:groups:0: 'gphy_leds_0' is not one of ['ephy_leds', 'ephy0_led', 'ephy1_led', 'ephy2_led', 'ephy3_led', 'ephy4_led', 'wled', 'wf2g_led', 'wf5g_led']
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml
   arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: pinctrl@10217000 (mediatek,mt7629-pinctrl): ephy-leds-pins:mux:groups: ['gphy_leds_0', 'ephy_leds'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml
   arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: syscon@1a000000 (mediatek,mt7629-ssusbsys): compatible: ['mediatek,mt7629-ssusbsys', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7622-ssusbsys.yaml
>> arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: syscon@1a100800 (mediatek,mt7629-pciesys): compatible: ['mediatek,mt7629-pciesys', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/mediatek,mt7622-pciesys.yaml
   arch/arm/boot/dts/mediatek/mt7629-rfb.dtb: ethernet@1b100000 (mediatek,mt7629-eth): compatible: ['mediatek,mt7629-eth', 'syscon'] is too long
   	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
