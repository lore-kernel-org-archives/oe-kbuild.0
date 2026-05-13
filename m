Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2975385D76
	for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 03:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778642920; cv=none; b=pjeoLDWwJEwgflW5a+Renqslok0fPDbroju8/C/mmv1PCccj9qBMtlZj+WCILKRCf1QqTK9MDpAy8GqKd5j3SV9uRFYYQvF3GZO9EEG2tKjkFQRzjoxta7EeZr6+XKakIooaIaZlOCMjWtxyhnMQE39xDssaVqqQOmIDAVHbIwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778642920; c=relaxed/simple;
	bh=G2IWCKX0RNRjW4hghqzeZ2XQ4w2ly2hqz0di2HeoI0I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ij2xab13W5WXj/Vu0xtC/lfgvsuxXLpbhGftxo+wdF9oYM1Klm6DCPQ6FZaOM18uU99BJwjygo0H20CUBalpRs/V1mt0dvm1ygwnjFTYHKyeZ+WoZ8o4AtM17Jg8tW086SD9pIpnCKtmly6NWUsggb7tU5N7fR1lLx9HztncQQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AWeLUrLM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AWeLUrLM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778642919; x=1810178919;
  h=date:from:to:cc:subject:message-id;
  bh=G2IWCKX0RNRjW4hghqzeZ2XQ4w2ly2hqz0di2HeoI0I=;
  b=AWeLUrLMl8DzXyjeIXjc6C09yedva4+NIQNqaRcehYgdigKeBo9pUzsK
   flai2IJr2SNvKK5821FlxWRjo4fweWONISvVkb8ko4MhqKMLdWF9Vs40P
   83KTQIHaTebjfE81ZNqbLCDAavUZG2BMvBR/IQDPNHg2BwbivUp0S4p2h
   tJwiO6DKQERAM4nfblMhpxWtnLkvZn+cIy56iFReDtmV9u2Zj29QvGw1R
   BROYlYPwjCnj8WbFGzX+Itblsv22rBjMGaUTJyCk1/+fgwguJqt8wm2nB
   v4Ul1ck60BjAe3luRfavXrHJe+KUtkObEDUleK3mi354amtt2dQ9UILyD
   A==;
X-CSE-ConnectionGUID: pkZsD/GeRA+aTtAeeMv91Q==
X-CSE-MsgGUID: GVkC1JVcTZeOOM73BADgSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79675709"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="79675709"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 20:28:38 -0700
X-CSE-ConnectionGUID: Yzihtm/rQOajnZ09C49nMg==
X-CSE-MsgGUID: EICkJBhUTniDzkLIeL6B4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="238202685"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 12 May 2026 20:28:35 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN0Gw-000000008ST-2kDA;
	Wed, 13 May 2026 03:28:34 +0000
Date: Wed, 13 May 2026 05:28:18 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linusw-pinctrl:devel 44/46]
 arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: pinctrl@10005000
 (mediatek,mt8188-pinctrl): 'pcie-default' does not match any of the regexes:
 '-hog(-[0-9]+)?$', '-pins$', '^pinctrl-[0-9]+$'
Message-ID: <202605130502.Wv75alDB-lkp@intel.com>
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
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: arm64-randconfig-2055-20260512 (https://download.01.org/0day-ci/archive/20260513/202605130502.Wv75alDB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130502.Wv75alDB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605130502.Wv75alDB-lkp@intel.com/

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
