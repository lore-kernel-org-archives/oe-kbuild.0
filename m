Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA393B774D
	for <oe-kbuild@lists.linux.dev>; Tue, 12 May 2026 20:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617292; cv=none; b=O7s33OHhwuY/R0OBHWLBZaFdmcUjcOOb1QoERR98U8ViWf/pwioqlcg+H3UTiXoYFGEUEUM2mG3j1GPASAo337a/+iok+EWgF4bMUjQ+RiIfzpZBU4wEYHBbbRmOVeRgPHICylCvTYFVuKX3q5Qs8lo9VKChA+xjq+uak/NSfjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617292; c=relaxed/simple;
	bh=pe9yqF0nH9FKW3Lt5ohO4jCkk+6Fl1CDgdSLQF5LOHI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JrqphMP2u9M+89I8u6XpEbtzTqm2xshU88e2Or6lILeCULb4OigGBH4a9YezVFH22DXFA4x4KM3Hgj9SHQaPjT2GQs95/y2PdbSLWCOGEUSLEaKcgPmXEyQSjXfe8VzK9/NXgxAO1PuDn20US3kTO9Sn0GY6rQ1Fdpj8cTk0Eqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hch55Oog; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hch55Oog"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778617291; x=1810153291;
  h=date:from:to:cc:subject:message-id;
  bh=pe9yqF0nH9FKW3Lt5ohO4jCkk+6Fl1CDgdSLQF5LOHI=;
  b=hch55OogZTGzE3eCTX6rVvjZ6tRtplMnKsSiTxfQIvxJLsuBILZcc5pM
   nZkFHIfbyIaJT3jAnlup8Sb61yFV1xf1cB8TdukON/8/jc8pE8ALE8kNG
   d7znOl5P28QDaANyv9zEVed8deVcJwL3WtIwjopBL5tnIZIAUsTZzj1T/
   EZaO4LAvq5XXgV5g1lyh8I2pO4UXDUlWPtL1MX7/60tA78P2JRO4h/xfe
   xpwOK8OLlSl6R0xrc0juCNQT89cQEMt2fl4ZgVk3Pna205qcuNfFhMB8h
   5U7x+uaiq/bt5K0zPM1PEaR8wqXCADUfHiOTu1rMgUFBlxDquKqTeq1ly
   g==;
X-CSE-ConnectionGUID: F8Uts7BLSU2tfkxR/nF8tA==
X-CSE-MsgGUID: VNkEXzs+TUe+GTFwAhfrrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="90921328"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="90921328"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 13:21:31 -0700
X-CSE-ConnectionGUID: lAs6Wd5kSL27Z1/xDSIHQg==
X-CSE-MsgGUID: uB772pCrQNCYllPRJznc+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="242223941"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 12 May 2026 13:21:30 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMtbb-000000008Kj-2k5G;
	Tue, 12 May 2026 20:21:27 +0000
Date: Tue, 12 May 2026 22:21:26 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linusw-pinctrl:devel 44/46]
 arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: pinctrl@10005000
 (mediatek,mt8188-pinctrl): 'pcie-default' does not match any of the regexes:
 '-hog(-[0-9]+)?$', '-pins$', '^pinctrl-[0-9]+$'
Message-ID: <202605122235.ZYeUh8kf-lkp@intel.com>
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
CC: linux-gpio@vger.kernel.org
TO: Icenowy Zheng <zhengxingda@iscas.ac.cn>
CC: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   42ec31ec8df4675af621ec686db7410153beebfd
commit: 37193e5b112d0685d9caa562cd01837a7ba3d11d [44/46] dt-bindings: pinctrl: mediatek: mt8188: allow gpio hogs
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm64-randconfig-2055-20260512 (https://download.01.org/0day-ci/archive/20260512/202605122235.ZYeUh8kf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605122235.ZYeUh8kf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605122235.ZYeUh8kf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: pinctrl@10005000 (mediatek,mt8188-pinctrl): 'pcie-default' does not match any of the regexes: '-hog(-[0-9]+)?$', '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: usb@112a1000 (mediatek,mt8188-mtu3): usb@0:hub@1:compatible: ['microchip,usb2513bi'] does not contain items matching the given schema
--
>> arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: pinctrl@10005000 (mediatek,mt8188-pinctrl): 'pcie-default' does not match any of the regexes: '-hog(-[0-9]+)?$', '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: usb@112a1000 (mediatek,mt8188-mtu3): usb@0:hub@1:compatible: ['microchip,usb2513bi'] does not contain items matching the given schema

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
