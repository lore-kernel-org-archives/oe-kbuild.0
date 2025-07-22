Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7801DF991
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Jul 2025 04:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753158491; cv=none; b=bLUzWfIBGyg1W/Lo5HY0wwWc+knGcmI1KOAaCLlYVn7BU6wqtyaQzZ9dVs5vY1kbGOxUyCPhMtQz5soNeQpgMn0Ky9h2E4qE4UyWaAhtsgkpG6XFRkAqlyUgmiN7XcxKCgnuMmzOLtdvEhAjAOIfe7viecTMLCIIV+DTLzr0UKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753158491; c=relaxed/simple;
	bh=yzJUYU+0bOfG4azPsn2fEnTS3MlIMCSgB5wGcvUZOWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ri5/VPxpmvVex3LkYCHR/fLqwd1mRnFreb5qIZOR629HwDLl+PRIHbnCr/BN/z3LKras5gvsos97mRHlxn0qTFLpKug4sZaSGTVEip/kZhEJSvMGjci5mDrQGlyVHpBsaXbMYy8iql38OAlKbCyBUKVHBDNCL8yJXBdInLkuB28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MK6U/VwZ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MK6U/VwZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753158488; x=1784694488;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yzJUYU+0bOfG4azPsn2fEnTS3MlIMCSgB5wGcvUZOWQ=;
  b=MK6U/VwZP5amgpXQDfuy4XvxfxplyRAEn8FeTqwP7erTzkTartzANgV/
   4EHF+/EN8gFmzxpd9qU/au4QY1moOJJf5Mem1m5Bi/E9DbkZm6JzctBw3
   mqpyzhHs8ypsiUOMIvo4RBlNbiGxmpejkMcM3Jz2cBmn4EN+RvubCDhk8
   0loNMpyL5KgMHpf4UmaLfkjL/taOmSu1OXRVA87f5qKaSUyoT2EUp5NB+
   leHwIcTkoZqOqs25tEM5AwGKR97Dqg78SEeRwlVxy0IoQBT9GDfxi2Q4o
   vHIeygsPrGe6zErPZhMv920EVFiW3xSOaDkZ5J5Y+WV7Egpugr24n1VCK
   Q==;
X-CSE-ConnectionGUID: zf1YTKJ5S8CwepOZNCncMA==
X-CSE-MsgGUID: /yXj7vybSpifVtzdhx2xag==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="59188207"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="59188207"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 21:28:05 -0700
X-CSE-ConnectionGUID: fOFv65ArSTaSAwz1ZE3buw==
X-CSE-MsgGUID: UTNOf6jBR8ulecpTtjD/0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="189970651"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Jul 2025 21:28:03 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ue4bh-000HRf-1Z;
	Tue, 22 Jul 2025 04:28:01 +0000
Date: Tue, 22 Jul 2025 12:27:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:mediatek/dt64 3/19]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb:
 audio-controller@11210000 (mediatek,mt8186-sound): 'memory-region' does not
 match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202507221208.IVKY8IJg-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: "Chen-Yu Tsai" <wenst@chromium.org>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git mediatek/dt64
head:   a9b906f15995e18b700a7e7791865ecf2f1cee65
commit: 4f7de95eeebe2e1c68c9b92c7d50e88928976092 [3/19] arm64: dts: mediatek: mt8186-corsola: Reserve memory for audio frontend
:::::: branch date: 2 weeks ago
:::::: commit date: 6 weeks ago
config: arm64-randconfig-051-20250722 (https://download.01.org/0day-ci/archive/20250722/202507221208.IVKY8IJg-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507221208.IVKY8IJg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507221208.IVKY8IJg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dtb: audio-controller@11210000 (mediatek,mt8186-sound): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-afe-pcm.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dtb: audio-controller@11210000 (mediatek,mt8186-sound): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-afe-pcm.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dtb: audio-controller@11210000 (mediatek,mt8186-sound): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-afe-pcm.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: audio-controller@11210000 (mediatek,mt8186-sound): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: audio-controller@11210000 (mediatek,mt8186-sound): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393217.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: audio-controller@11210000 (mediatek,mt8186-sound): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dtb: audio-controller@11210000 (mediatek,mt8186-sound): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-afe-pcm.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dtb: audio-controller@11210000 (mediatek,mt8186-sound): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-afe-pcm.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: audio-controller@11210000 (mediatek,mt8186-sound): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: audio-controller@11210000 (mediatek,mt8186-sound): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: audio-controller@11210000 (mediatek,mt8186-sound): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: audio-controller@11210000 (mediatek,mt8186-sound): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131072.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: audio-controller@11210000 (mediatek,mt8186-sound): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix-sku131073.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: audio-controller@11210000 (mediatek,mt8186-sound): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: audio-controller@11210000 (mediatek,mt8186-sound): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: audio-controller@11210000 (mediatek,mt8186-sound): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: audio-controller@11210000 (mediatek,mt8186-sound): 'memory-region' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-afe-pcm.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dtb: sound (mediatek,mt8186-mt6366-rt1019-rt5682s-sound): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/mt8186-mt6366-rt1019-rt5682s.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
