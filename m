Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D608DF4F1
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Sep 2025 03:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758858413; cv=none; b=FhFaaQUsHrboe+6TSaOzUToZntQxvVmW8ClsDehmaSzhDMjb3JGV1rv6n/O/HRzuDq+nyeP3XUreyO7a0TkpTDhp81YN8JiykDZPgcVNQK/PBYOSHcELNNOjiDn4WbgykeEZB9cmLMh91MMwgqxVAXgelQJ7x+VQH4otZMXfxiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758858413; c=relaxed/simple;
	bh=Sb9BtllIwArs97SynNBqR5u9wL7kmamDu12Jgh6HA3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OjWPaFC71MrnhshqPSUKmsXfRhm13hRL6j535kaCX8rM3ekICtsuk4djru/7o87SEJwJwNlae+M97UFP5kVYFeEJ6YwaJao2JZnIRTHnpZ1vsi223zLpW0Tuj7SikDM+iaP16jZiV19cnH2oKnivjc0brZ/IqLNailyJsxq/xkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EkzUhL/I; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EkzUhL/I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758858412; x=1790394412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sb9BtllIwArs97SynNBqR5u9wL7kmamDu12Jgh6HA3Q=;
  b=EkzUhL/I4VuxdJ0XA/mDl7kGDpG691/cyieJnYqSLAs0HPuv8ZanVa1T
   h1ZycLuCeLkkrgVgOWyAgEXnMm6GjxPlGV1WJYbClaBZP6KRZW/as9FH/
   uXzj0/Ad8oJBZRDFq33J39ycyJbaBV7f77qdesKDYwhmvRDjKUNAf8SqG
   nErIRJ2Ribz8loYd886nFK3F4hPLrPu5PoN1yIKhFPOgfAZ4dOJ9Ciajq
   VoRm0ychAHvyYigGbJkMi3+y5dACqHFu2YYh30n2SFVmbSTM/VgvEPvWM
   7K4ef0iJds6v3czFIl8seBjBJpt7ULadr7e6DxNohhrCpl05EThuzUyT6
   Q==;
X-CSE-ConnectionGUID: Z6Xcs3ILTv2NdPbn1fHFGg==
X-CSE-MsgGUID: 27lah6WHQ3GUQYBSY3FNGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="48751579"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; 
   d="scan'208";a="48751579"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 20:46:51 -0700
X-CSE-ConnectionGUID: 9+S6E5D2SVWP3ZNbZ0JYZg==
X-CSE-MsgGUID: e0To4AhKQJStDtr4Zupm+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; 
   d="scan'208";a="176777813"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 25 Sep 2025 20:46:50 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1zPz-0005s5-1v;
	Fri, 26 Sep 2025 03:46:47 +0000
Date: Fri, 26 Sep 2025 11:46:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-next 66/72]
 arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mt6331regulator
 (mediatek,mt6331-regulator): 'ldo-vio28' does not match any of the regexes:
 '^buck-v(core2|io18|dvfs11|dvfs12|dvfs13|dvfs14)$',
 '^ldo-(avdd32aud|vauxa32)$', '^ldo-v(dig18|emc33|ibr|mc...
Message-ID: <202509261119.EHKg5hcr-lkp@intel.com>
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
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   e42136a03dca4f11547aea8a53b64b6668b45fe0
commit: 564f33406db77184ccf4fdaf363cdb3f0e827754 [66/72] dt-bindings: regulator: mediatek,mt6331: Add missing compatible
:::::: branch date: 30 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250925 (https://download.01.org/0day-ci/archive/20250926/202509261119.EHKg5hcr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509261119.EHKg5hcr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509261119.EHKg5hcr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: syscon@10006000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: pwrap@1000d000 (mediatek,mt6795-pwrap): 'mt6331' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/mediatek/mediatek,pwrap.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mt6331 (mediatek,mt6331): 'mt6331keys', 'mt6331regulator', 'mt6331rtc', 'mt6332-led' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mt6331 (mediatek,mt6331): 'regulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mt6331regulator (mediatek,mt6331-regulator): 'ldo-vio28' does not match any of the regexes: '^buck-v(core2|io18|dvfs11|dvfs12|dvfs13|dvfs14)$', '^ldo-(avdd32aud|vauxa32)$', '^ldo-v(dig18|emc33|ibr|mc|mch|mipi|rtc|sim1|sim2|sram|usb10)$', '^ldo-vcam(a|af|d|io)$', '^ldo-vgp[1234]$', '^ldo-vtcxo[12]$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6331-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mt6331regulator (mediatek,mt6331-regulator): ldo-vdig18:regulator-name:0: 'dvdd18_dig' does not match '^v(dig18|emc33|ibr|mc|mch|mipi|rtc|sim1|sim2|sram|usb)$'
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6331-regulator.yaml#
>> arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mt6331regulator (mediatek,mt6331-regulator): ldo-vcamio:regulator-name:0: 'vcam_io' does not match '^vcam(a|_af|d|io)$'
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6331-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: intpol-controller@10200620 (mediatek,mt6795-sysirq): $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: iommu@10205000 (mediatek,mt6795-m4u): 'mediatek,infracfg' is a required property
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11230000 (mediatek,mt6795-mmc): mediatek,latch-ck: 20 is greater than the maximum of 7
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11230000 (mediatek,mt6795-mmc): Unevaluated properties are not allowed ('mediatek,latch-ck' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/mtk-sd.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11240000 (mediatek,mt6795-mmc): 'pinctrl-names' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
