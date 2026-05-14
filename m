Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E180438C2B0
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 10:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753280; cv=none; b=cBISOq3AxOMwq8yCHNWgMPMa0xDMJmrUE10isf+MT4WqmoIxnYNRqgnhxKCwluHbUdqIA/JKBZab0j+tkHO7zV9T5mx2BFQdYXRfV9jBI5y1UFj3aUhX/SgKaVZUNMSD+3j4Dr4woIaVxMt3lfxNUoZoNb66njmpUEQlF4n3Zqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753280; c=relaxed/simple;
	bh=sufLP68TvwiUJlNpnxZ0BQHDaaVVw4RHXovb9pl0KEg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YejackWybQdtC9N4YRR15lrSn6xPv1N+b9SpmJKPBgaqezfN8OTLFwqAMzQQRZhrG2uD1WOuGp9cdqtTMAUr6tFgpeASrOExKdvnd59lKekEDIY9RaPy6469SpMoLz8ik5NIVEAWy1E6+MencJ4vm5uU6KnOPKB78bz5/hbn4/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f9lV1A08; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9lV1A08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778753279; x=1810289279;
  h=date:from:to:cc:subject:message-id;
  bh=sufLP68TvwiUJlNpnxZ0BQHDaaVVw4RHXovb9pl0KEg=;
  b=f9lV1A08cKTTBDSOB1l9Wyffr+Y3NsF3nRQ/RKszUibz7aRZm9OizPTu
   x1gYkvyUnj/uNVv7pNHs2/4XijnDqXyCns12/02xi8D70hfGkplSyjjV+
   Z8UaU2vFM7/T9ccJ/G+/BS6VI2y9JHwbLX63Yldb62/vp65T7lN6h2qlG
   y6zZ08pjUqiYZ14MdC8Bb7xp+jC+vlU7JprHm7F3cEtWeD4T8KDZ5nBB3
   fMkag2VrRVnmQcVtQw/aqnRcliAmwli1cbmDHkX2bIcOSZibHIyGkibcf
   ULdYOYAS+j++U4DY7b51Wt9cg71+z/wOHCtDQRAdJRRBfRDqJfcoa1oRy
   Q==;
X-CSE-ConnectionGUID: 3v2LPptwSne/nL8zD0p+/A==
X-CSE-MsgGUID: kTAfLu7hQICFS16wW2K9fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="91154710"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="91154710"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 03:07:58 -0700
X-CSE-ConnectionGUID: SrXqs/0XSaaMLNbQuUXSeQ==
X-CSE-MsgGUID: A/dSS3SbTz2N4yMTxFyQkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="237364199"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 14 May 2026 03:07:56 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNSyw-000000008nZ-0Qmi;
	Thu, 14 May 2026 10:07:54 +0000
Date: Thu, 14 May 2026 12:07:30 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mediatek:v7.1-next/dts64 30/32]
 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pmic
 (mediatek,mt6359): '#sound-dai-cells', 'vs1-ldo1-supply', 'vs1-ldo2-supply',
 'vs2-ldo1-supply', 'vs2-ldo2-supply', 'vsys-ldo1-supply', 'vsys-ldo2-supply',
 'vsys-smps-supply', 'vsys-vcore-suppl...
Message-ID: <202605141144.LHNK5Y3c-lkp@intel.com>
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
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Fei Shao <fshao@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v7.1-next/dts64
head:   7264d37c63139f2ce8c073ead1ed4409fbba12d6
commit: 0948625a2d85c660891e2e1dca5fcf04e31e2563 [30/32] arm64: dts: mediatek: mt8188-geralt: Add MT6359 PMIC supplies
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2055-20260512 (https://download.01.org/0day-ci/archive/20260514/202605141144.LHNK5Y3c-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141144.LHNK5Y3c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605141144.LHNK5Y3c-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'vs1-ldo1-supply', 'vs1-ldo2-supply', 'vs2-ldo1-supply', 'vs2-ldo2-supply', 'vsys-ldo1-supply', 'vsys-ldo2-supply', 'vsys-smps-supply', 'vsys-vcore-supply', 'vsys-vgpu11-supply', 'vsys-vgpu12-supply', 'vsys-vmodem-supply', 'vsys-vpa-supply', 'vsys-vproc1-supply', 'vsys-vproc2-supply', 'vsys-vpu-supply', 'vsys-vs1-supply', 'vsys-vs2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'vs1-ldo1-supply', 'vs1-ldo2-supply', 'vs2-ldo1-supply', 'vs2-ldo2-supply', 'vsys-ldo1-supply', 'vsys-ldo2-supply', 'vsys-smps-supply', 'vsys-vcore-supply', 'vsys-vgpu11-supply', 'vsys-vgpu12-supply', 'vsys-vmodem-supply', 'vsys-vpa-supply', 'vsys-vproc1-supply', 'vsys-vproc2-supply', 'vsys-vpu-supply', 'vsys-vs1-supply', 'vsys-vs2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'vs1-ldo1-supply', 'vs1-ldo2-supply', 'vs2-ldo1-supply', 'vs2-ldo2-supply', 'vsys-ldo1-supply', 'vsys-ldo2-supply', 'vsys-smps-supply', 'vsys-vcore-supply', 'vsys-vgpu11-supply', 'vsys-vgpu12-supply', 'vsys-vmodem-supply', 'vsys-vpa-supply', 'vsys-vproc1-supply', 'vsys-vproc2-supply', 'vsys-vpu-supply', 'vsys-vs1-supply', 'vsys-vs2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'vs1-ldo1-supply', 'vs1-ldo2-supply', 'vs2-ldo1-supply', 'vs2-ldo2-supply', 'vsys-ldo1-supply', 'vsys-ldo2-supply', 'vsys-smps-supply', 'vsys-vcore-supply', 'vsys-vgpu11-supply', 'vsys-vgpu12-supply', 'vsys-vmodem-supply', 'vsys-vpa-supply', 'vsys-vproc1-supply', 'vsys-vproc2-supply', 'vsys-vpu-supply', 'vsys-vs1-supply', 'vsys-vs2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'vs1-ldo1-supply', 'vs1-ldo2-supply', 'vs2-ldo1-supply', 'vs2-ldo2-supply', 'vsys-ldo1-supply', 'vsys-ldo2-supply', 'vsys-smps-supply', 'vsys-vcore-supply', 'vsys-vgpu11-supply', 'vsys-vgpu12-supply', 'vsys-vmodem-supply', 'vsys-vpa-supply', 'vsys-vproc1-supply', 'vsys-vproc2-supply', 'vsys-vpu-supply', 'vsys-vs1-supply', 'vsys-vs2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: amplifier@4f (ti,tas2563): reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'vs1-ldo1-supply', 'vs1-ldo2-supply', 'vs2-ldo1-supply', 'vs2-ldo2-supply', 'vsys-ldo1-supply', 'vsys-ldo2-supply', 'vsys-smps-supply', 'vsys-vcore-supply', 'vsys-vgpu11-supply', 'vsys-vgpu12-supply', 'vsys-vmodem-supply', 'vsys-vpa-supply', 'vsys-vproc1-supply', 'vsys-vproc2-supply', 'vsys-vpu-supply', 'vsys-vs1-supply', 'vsys-vs2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: amplifier@4f (ti,tas2563): reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'vs1-ldo1-supply', 'vs1-ldo2-supply', 'vs2-ldo1-supply', 'vs2-ldo2-supply', 'vsys-ldo1-supply', 'vsys-ldo2-supply', 'vsys-smps-supply', 'vsys-vcore-supply', 'vsys-vgpu11-supply', 'vsys-vgpu12-supply', 'vsys-vmodem-supply', 'vsys-vpa-supply', 'vsys-vproc1-supply', 'vsys-vproc2-supply', 'vsys-vpu-supply', 'vsys-vs1-supply', 'vsys-vs2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: amplifier@4f (ti,tas2563): reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml
--
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: pmic (mediatek,mt6359): '#sound-dai-cells', 'vs1-ldo1-supply', 'vs1-ldo2-supply', 'vs2-ldo1-supply', 'vs2-ldo2-supply', 'vsys-ldo1-supply', 'vsys-ldo2-supply', 'vsys-smps-supply', 'vsys-vcore-supply', 'vsys-vgpu11-supply', 'vsys-vgpu12-supply', 'vsys-vmodem-supply', 'vsys-vpa-supply', 'vsys-vproc1-supply', 'vsys-vproc2-supply', 'vsys-vpu-supply', 'vsys-vs1-supply', 'vsys-vs2-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: amplifier@4f (ti,tas2563): reg:0:0: 79 is greater than the maximum of 63
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
