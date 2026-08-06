Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259F3314D18
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Aug 2026 06:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785999107; cv=none; b=seglF9DWxhDPFPBceI/haypeeqST83doEt8OuY1PjQ1HQxkQioHHw44UunvcSStoiVEr+YgsRtKs5uaDIJ1zlfjwGaM2/Va/avfFrdzvYxcvpFQKS8e/8kyn3XdZwEP+uQpnEthHP3+a/0U7qYy3fsSmFKsH8P4fuGCdfRZO9ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785999107; c=relaxed/simple;
	bh=W7SiBSMHGbcrJNSKba3N0ujpQgYtfhy6SBcYj8k+zhc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TrdsD8EglF3kd3OZl1I0syG1R5hommHkSffLQM3h6rv30iDyv8BzhrseV04aP/YJpdO/SokrN86/Tf06H8hhp2Evz4MpGSo3Mwjj5tj6nLXFOZjq++KrHw1UWsOU7u3JyEjj4tYmpOgoxzUBBpAxqj3pOCZymy5Bcp1FnESZSQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nU/VkKsp; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nU/VkKsp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785999106; x=1817535106;
  h=date:from:to:cc:subject:message-id;
  bh=W7SiBSMHGbcrJNSKba3N0ujpQgYtfhy6SBcYj8k+zhc=;
  b=nU/VkKspe/vv5imICiYHYu4W4iyox4gV73825nSAS9j8zv2XzF2gjDrr
   DOZGxpA4U3kc8WK8hseeuuql8lhiqdggQmRR1ACqwzMfbnWZSxnW8gem7
   ud8MGWLxysl80B/2cfih7qABIDilLym/FPMCs11vTyU2TdzwtNrZBFHsZ
   gx3+3EMNTbl8/ba7Y8oCtxjCEtYRnlpqEqFtEUsDHSpuR6dsAcJtU82Si
   sK68sJEsRJkwHXKqCwZq8gsh/DS6l8QN58M134Q0JcujBdZNupelYyVuc
   Lm5uV73D4Nr7otE6tG+oUnlGAqF14vgWqwdHkYwFy6bNBA4+uUrV7ZJqr
   A==;
X-CSE-ConnectionGUID: Zprrw3/eSdOH5wL99Tf1pg==
X-CSE-MsgGUID: 7x1rIwIIQOOYiJivgid35A==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86457951"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="86457951"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 23:51:41 -0700
X-CSE-ConnectionGUID: zDTSAg+ISTKA3NyCxH9nBQ==
X-CSE-MsgGUID: qbNJUJlaRUmgaeLPQvWbPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="260767125"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 05 Aug 2026 23:51:40 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrrx3-000000004Zi-3GXU;
	Thu, 06 Aug 2026 06:51:37 +0000
Date: Thu, 06 Aug 2026 08:51:07 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb:
 usb@11201000 (mediatek,mt8188-mtu3): usb@0: 'port' does not match any of the
 regexes: '@[0-9a-f]{1}$', '^pinctrl-[0-9]+$'
Message-ID: <202608060829.GxQh7nYA-lkp@intel.com>
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
TO: "Chen-Yu Tsai" <wenst@chromium.org>
CC: 0day robot <lkp@intel.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/device-property-Add-fwnode_graph_get_port_by_id/20260805-064644
head:   4cca493e59b51c1755abcb8a45a6314c2a53ac07
commit: 9d6a8f3a736e3b4b3266a30685464d258450c6a9 dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB connections
date:   32 hours ago
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: arm64-randconfig-2054-20260805 (https://download.01.org/0day-ci/archive/20260806/202608060829.GxQh7nYA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608060829.GxQh7nYA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608060829.GxQh7nYA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic (mediatek,mt6365): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: usb@11201000 (mediatek,mt8188-mtu3): usb@0: 'port' does not match any of the regexes: '@[0-9a-f]{1}$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtu3.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: usb@0 (mediatek,mt8188-xhci): 'port' does not match any of the regexes: '@[0-9a-f]{1}$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml
--
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic (mediatek,mt6365): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: usb@11201000 (mediatek,mt8188-mtu3): usb@0: 'port' does not match any of the regexes: '@[0-9a-f]{1}$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtu3.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: usb@0 (mediatek,mt8188-xhci): 'port' does not match any of the regexes: '@[0-9a-f]{1}$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
