Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5CB4A99C8
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Sep 2026 15:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054777; cv=none; b=dnetdC1lS3eE7ibclQStnACoqWukOjJwd+HB8DPheO1YNFnluO2UnChNHoiDzOZ/ZjbnHLU/5eWvNTE3to2eAeHw8GDGvifZkDWg8KRxxdNBLh5G4bSsWJopqx/7UQLZHH61FNX0wHhamvrxShmYVNV7K1q+1v6U3Jdu3YJzhdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054777; c=relaxed/simple;
	bh=yFjZFDLTdvBHBqXiDsqXI9+aA9eKJs0hdwx/8Wkxo1w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Bwddv1VtvX47z0EyLxTG5OOE1vuZnKyCatezJapwotHZcZnJYIJR5htOzqRYIWHrvuoJtNx4VjsVZ84J6ZpuY8yIRciAqQXcKWdSlNGF880cLBAD5ryl+R2/hP9BNdTzJbg+zRqEpHKoLFjM4QOMRreczNMmC152kVxI8BwS7LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QAwJY5vq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QAwJY5vq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789054775; x=1820590775;
  h=date:from:to:cc:subject:message-id;
  bh=yFjZFDLTdvBHBqXiDsqXI9+aA9eKJs0hdwx/8Wkxo1w=;
  b=QAwJY5vqvxN/UE3rFxbuHFIV9czCPD9ETv5YK1jOidHkpSw/IwLbGtRE
   0/SKuFnUMfcwABO+fCwstyIByYLama0li/x2sg3zqWxyeUiR8djxp3oN7
   TZZZwJW+6nw751UrVqO3/f75FteOg/jAscjYhLpUqz30c1flGr2b0jPdk
   m4LEDxR4TpvmBtvKKZ4ipaI2Oq3T0nULYV24s+s5d2RdQClZVere+DBtJ
   M/qfD6Rhk1KoydQ03EBSMLY+5OKbhd2dRnOASuONqd7mJd20vJiQACU+J
   OyeAJYBNb8XC+k1BhK8yu6iwLjewG0CsSYdAoihHWjUp7IERRag8NgO2P
   A==;
X-CSE-ConnectionGUID: 27JCdPedSv+g1R8e392zuw==
X-CSE-MsgGUID: 9kV0HcEBRaWa4hG1zsXRJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89271588"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89271588"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:39:32 -0700
X-CSE-ConnectionGUID: 1+mZa0wqTC+bSb4fcOBzoQ==
X-CSE-MsgGUID: 4PcCiUYFTkKn07fc5vFFLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="267395189"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 10 Sep 2026 08:39:31 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4gs5-000000000QC-0AcW;
	Thu, 10 Sep 2026 15:39:29 +0000
Date: Thu, 10 Sep 2026 17:39:21 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb:
 infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4,
 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too
 long
Message-ID: <202609092236.C84cD0NK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Macpaul Lin <macpaul.lin@mediatek.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   50d05c7c76c96b90462f24debacca971d2e86713
commit: e6bd92bb204757a7b1f4b4dc263a82b3985fadd3 arm64: dts: mediatek: add device-tree for Genio 1200 EVK UFS board
date:   11 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 months ago
config: arm64-randconfig-2051-20260908 (https://download.01.org/0day-ci/archive/20260909/202609092236.C84cD0NK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260909/202609092236.C84cD0NK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e6bd92bb2047 ("arm64: dts: mediatek: add device-tree for Genio 1200 EVK UFS board")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609092236.C84cD0NK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi:1172.7-1180.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
