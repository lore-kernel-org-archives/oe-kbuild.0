Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793885431;
	b=OpOHmVRFWzj+jjPIZBaI1Xl5h/qQmv4ZTvuiJXf0N5rIhhBkegXTWRMwdGsR7/PrHAIm
	 /+TQoXRUu7lCd976GhhdUiBdCo7qgdx1uNCVeBzkaBRks5+Ga6MQ9GGvH0Nr5wbOkdabc
	 f0s7MxfRuAiOunRZz4/XngEJVZ+DsEYPYJ1qsr8UTqxff+L8x2F1Qvvzf/0uhZ2qXcwff
	 jWHeqAtrtIMVJ5OcZ6EiBhti2BGE9bwZlumCJjFPSaLSUP0y/ZvABjY7HJy463PL6QXcz
	 YXgoaqtO/eRfgdn4VRV5Smm7KNxp5LEm0ScEAkBrP3F8YV674FJ8bKsJVhzgamZoufw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885431;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Je8tjBJD+uRrxWMHB7T+6Nmg8/n7hEnM9feoEHFRYi0=;
	b=o8iJjjoklzZqbBpcTD5awL431IDDjAYDgQLjD8+O29F6nhhh8BGCV58vR8YDStPxK/J0
	 zuqD8/a7E4mjgH41Vtoe+EnnW7zG9SLvNCE2U9txYOAI4mDTofys+p6MbewZW4xgk6bfx
	 4ngqBQMF+t+f/neqVmR3r7xBXn0tATahWmUC8B7vRcpNnYK1Pblw/y0GUBTNJ312styPv
	 CrXYh5e4Hds6v3quncJV8drRMFR479pVdS3bdU5+bhr+8ONBZAZgLh02g62LyaRYGVSM0
	 1mQ6ysMysPIptDuA8BZ3YN9dZd/+/LBq7LHf73lixCP1hF2DZcz5XHiElC0JsW5Rdqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hyJTUlzv;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BAC606D835
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Nov 2026 13:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30BAC606D835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hyJTUlzv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793885430; x=1825421430;
  h=date:from:to:cc:subject:message-id;
  bh=1Soy6wSOLifGu31LSZiIzGMkrDV0+VyoA3BTi5ahTmk=;
  b=hyJTUlzvke0aHJioXeP4GelCdmyNrUSPocszdhT1AWY3wDx131ECPAmS
   8GT10pn6dLqwBVdegL1lfr2MtxnJ1xPQ61/26xgWTk/C/oHYoqSTZQ69V
   QuEBoBXQg2xvLLBm0p72a/F+2XsgC+MjUKXgSGCaJDyeAeRfRmIFbCaZY
   TLa3Yuk2YnfiJva22/KZKLiD9WSzSIlCh4S8Jb06W4wL5F6gyS/OJ7hZ+
   2R77S9veOtKe8NW1IW+MhgHhtRw1FcT7uPRaPr6XVycEb0CBZevKjkCSx
   4rSX8LYWwHdnJnmNlHJbLEx7tXnnOdYgq0rTlOLRMsHlgeRxbiOe8WQag
   Q==;
X-CSE-ConnectionGUID: CC/CAdctQnq7RTTpoIJfGA==
X-CSE-MsgGUID: HueQZx9AQ+ynfWi79RAoKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2677678"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2677678"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 05:25:44 -0800
X-CSE-ConnectionGUID: hUdiloZATDC9MIp8hlu/RQ==
X-CSE-MsgGUID: GYf2h18wRiidzuLBDHIqdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8773988"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 05 Nov 2026 05:25:44 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOxTJ-000000009er-0uKj;
	Thu, 05 Nov 2026 13:25:41 +0000
Date: Thu, 05 Nov 2026 14:25:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [drm-tip:drm-for-linux-next 632/770]
 arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: panel@0
 (startek,kd070fhfid078): 'vddp-supply' is a required property
Message-ID: <202611051451.bJCzeBOX-lkp@intel.com>
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
CC: intel-gfx@lists.freedesktop.org
CC: Intel-gfx@lists.freedesktop.org
CC: dri-devel@lists.freedesktop.org
TO: David Lechner <dlechner@baylibre.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>

tree:   https://gitlab.freedesktop.org/drm/tip.git drm-for-linux-next
head:   87c36025f6e4409fdd8a0e84bf24fbeef2ed9603
commit: 6ebc6210efd3502c8ce2b1b2740ad61f69188df7 [632/770] dt-bindings: display: panel: himax,hx8279: add vddp-supply
:::::: branch date: 2 hours ago
:::::: commit date: 3 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261105/202611051451.bJCzeBOX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611051451.bJCzeBOX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611051451.bJCzeBOX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: pmic (mediatek,mt6365): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dtb: panel@0 (startek,kd070fhfid078): 'vddp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/himax,hx8279.yaml
--
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: pmic (mediatek,mt6365): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dtb: panel@0 (startek,kd070fhfid078): 'vddp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/himax,hx8279.yaml
--
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: pmic (mediatek,mt6365): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: panel@0 (startek,kd070fhfid078): 'vddp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/himax,hx8279.yaml
--
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: pmic (mediatek,mt6365): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$', '^vs(ys|[12])-ldo[1-9]-supply$', '^vsys-v[a-z]+[0-9]*-supply$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dtb: panel@0 (startek,kd070fhfid078): 'vddp-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/himax,hx8279.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
