Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794965502;
	b=ySXlRBkoL88EKYmlqbikYcqQAiPoCGI70RcWeRrA8I784DfxU5AuaYrz+SRTgL4ugkHn
	 Sec+k940gY4ucJXYCs7rl5kCUS3GBNhtU6zhGVtXB2xUMSvLgZMaS3klO/3osIjFT1zXq
	 q7Dv5KjHXqE/kWIDpbvbCp1/m+4wHZ2BffapHU7HMXDfrywszV/7gdUCNGgAJrQ+1FgBR
	 gx/AwbTUNH4oMMtsqGmwikH3rGhbdEH5yp8z91u7CWfg/pYU20WuDi1SRlbCpeAM9dyk+
	 CeJtMwpNtZXrE5MDekdebWSUaMQlxFW6Tcezs3wMVxNEpFxXBq3Uscte5y/Frq5/R8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794965502;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=eUwre9brCRxpLEktYAKB3LC20hAVEdiigYPJJrechus=;
	b=ycQ2D0x/NEYB9qFuriHwpRDPS8cfbJ8PMCZ151rGwOJnmf6BrWyrrB2wuyY8Qdup3wA2
	 KkqywR0mS3wCN47rtiQsF7shjeYQ8WpOsuxSa2BILTm6LnfszcXo88k0RvDoz0zvE6B6i
	 /ZvBJOBveJB7KXIBkvUxdZY7SrqobuEjXLtnRHbcwlKubDI5GqYShFT1tphppwjIM0JMD
	 EAloMjrakCg+itqhJDHW8tE6zTFBXLNx50rFXlt/fgo4Ae54O9zUwZlNZsh8XZsD1Su+8
	 +gKoZbE5x5p/0/YAj3UFFCpNhsngkHaf64TL+iFwSOFaoThJFdna9DkKMVxaut/nwpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BJGxkh0y;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEFD606A32C
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Nov 2026 01:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDEFD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BJGxkh0y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794965502; x=1826501502;
  h=date:from:to:cc:subject:message-id;
  bh=6IC/AQvdtNzB12DP/hCYqqNRmUA25EX8trInrwpr4hE=;
  b=BJGxkh0y920qU+bSTwDJGNa11Y4msFMv+WroD3AwBxfoOYVqSYBBzNUN
   3hh3/mjXLzATHz/f67sEEqL30iyGOBPvcd4DVn+frbY0boe5v+WUiXVyT
   s9oK/6hz84b/1iMWAo2c1hJZ4iEHv+3wtCkgBI4eMOwCItP7rCcaMyBTC
   QRAghFIKsxBdX2om7kE6USrZybCR5Cv/mpvHoq8LuhZ62FtTKqmuEiKOz
   7XiQ9rFHQa6J+cE7fOlCt1FoddecWWQO/lIa0k5aHK/PN4CeTIeyD0Wgf
   bmopM/Sx4TgbSh0p3Wmy+QqVrN//pE0RWE98BgT52Fhog2CkVT7oo9Quu
   g==;
X-CSE-ConnectionGUID: KEv1QkbWR1OWsg+fAZqY3Q==
X-CSE-MsgGUID: 2YfjNOV8ToKZWKokLGvekQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3752843"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3752843"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 17:31:41 -0800
X-CSE-ConnectionGUID: 5/pOunnTS/GhXqaaCk9bAA==
X-CSE-MsgGUID: WYMII1tTRrCD/qjCJwFp/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="9988262"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 17 Nov 2026 17:31:40 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTUWP-000000003Ha-3giA;
	Wed, 18 Nov 2026 01:31:37 +0000
Date: Wed, 18 Nov 2026 02:30:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mediatek:v7.4-next/dts64 2/18]
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: keyboard@10010000
 (mediatek,mt8173-keypad): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <20261118022359.QZXxisfT-lkp@intel.com>
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
TO: Ryan Brue <ryanbrue.dev@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v7.4-next/dts64
head:   14cdd904db60288b782ffeac59f4c626ef11e9f5
commit: a09ffcb4fd6b0a417f36e1b819b329a0b489f7ce [2/18] arm64: dts: mediatek: mt8173: Add the keypad controller
:::::: branch date: 13 hours ago
:::::: commit date: 15 hours ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261118/20261118022359.QZXxisfT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261118/20261118022359.QZXxisfT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261118022359.QZXxisfT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: keyboard@10010000 (mediatek,mt8173-keypad): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8173-keypad', 'mediatek,mt6779-keypad'] is too long
   	'mediatek,mt6779-keypad' was expected
   	'mediatek,mt8173-keypad' is not one of ['mediatek,mt6572-keypad', 'mediatek,mt6873-keypad', 'mediatek,mt8183-keypad', 'mediatek,mt8365-keypad', 'mediatek,mt8516-keypad']
   	from schema $id: http://devicetree.org/schemas/input/mediatek,mt6779-keypad.yaml
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: /soc/keyboard@10010000: failed to match any schema with compatible: ['mediatek,mt8173-keypad', 'mediatek,mt6779-keypad']
   arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: syscon@14000000 (mediatek,mt8173-mmsys): 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: keyboard@10010000 (mediatek,mt8173-keypad): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8173-keypad', 'mediatek,mt6779-keypad'] is too long
   	'mediatek,mt6779-keypad' was expected
   	'mediatek,mt8173-keypad' is not one of ['mediatek,mt6572-keypad', 'mediatek,mt6873-keypad', 'mediatek,mt8183-keypad', 'mediatek,mt8365-keypad', 'mediatek,mt8516-keypad']
   	from schema $id: http://devicetree.org/schemas/input/mediatek,mt6779-keypad.yaml
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: /soc/keyboard@10010000: failed to match any schema with compatible: ['mediatek,mt8173-keypad', 'mediatek,mt6779-keypad']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtb: syscon@14000000 (mediatek,mt8173-mmsys): 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: keyboard@10010000 (mediatek,mt8173-keypad): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8173-keypad', 'mediatek,mt6779-keypad'] is too long
   	'mediatek,mt6779-keypad' was expected
   	'mediatek,mt8173-keypad' is not one of ['mediatek,mt6572-keypad', 'mediatek,mt6873-keypad', 'mediatek,mt8183-keypad', 'mediatek,mt8365-keypad', 'mediatek,mt8516-keypad']
   	from schema $id: http://devicetree.org/schemas/input/mediatek,mt6779-keypad.yaml
>> arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: /soc/keyboard@10010000: failed to match any schema with compatible: ['mediatek,mt8173-keypad', 'mediatek,mt6779-keypad']
   arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dtb: syscon@14000000 (mediatek,mt8173-mmsys): 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: keyboard@10010000 (mediatek,mt8173-keypad): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8173-keypad', 'mediatek,mt6779-keypad'] is too long
   	'mediatek,mt6779-keypad' was expected
   	'mediatek,mt8173-keypad' is not one of ['mediatek,mt6572-keypad', 'mediatek,mt6873-keypad', 'mediatek,mt8183-keypad', 'mediatek,mt8365-keypad', 'mediatek,mt8516-keypad']
   	from schema $id: http://devicetree.org/schemas/input/mediatek,mt6779-keypad.yaml
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/keyboard@10010000: failed to match any schema with compatible: ['mediatek,mt8173-keypad', 'mediatek,mt6779-keypad']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: syscon@14000000 (mediatek,mt8173-mmsys): 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
