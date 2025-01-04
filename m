Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE06020311
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Jan 2025 03:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735961274; cv=none; b=Znz0Qhdg6X/JIYYHogBiBQhQegM/LlLINH5j/pP5ObFLbLq9UuCiOIDIwoLcVFuTEkfztW+zqO+lVsrgfTLHeaCzzbP26r7vTH56Ll5OBb1ntZgW2xD+nNRD9kWD46IMe5GKx7ZEGR4E2Z3maHavakqfNed/LBASMl7MTIuGLBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735961274; c=relaxed/simple;
	bh=dFxWsF2J0MnHe0xdcpq47mIzEzyZaQj37YFYKWnfT/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eFHtIOATD0fLFaYPRsTILgEge16y2eijZrA6MpWFijHsi2Zaz8nJSFgIfsfRqN7hhW0bMYKT8BFIWxGHHwLHdtid07+2/fWEhZFu4HhBmFoao/iClOrQsvLTQm4y0Y0BAyQGiQ0Dcgb1hC4YwqwWtHGB/3LFCimFrY3UeCY4X30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OoZnU+ul; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OoZnU+ul"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735961273; x=1767497273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dFxWsF2J0MnHe0xdcpq47mIzEzyZaQj37YFYKWnfT/0=;
  b=OoZnU+uls8Js/4g0jFxAJ5vriT3oldBg5vIF4ZCbDsF25s2mNkoYra0g
   fGruah+Dho/CCbpmTa5ySHr3HaTiX+KbF6zF+lEwG2fRxsvZYCVGgdDEc
   xiJWb8hcG/lpAQM6C1kSKaWpC5V1Cen0hctIG4ce9CGYiBglgvSpS8PHZ
   18jdCKU2ZS8+MNRQTiAhwIw7RGj1ZJJWXl5xxGtfs6wBAbb70pyZt3ZPe
   nSwoGcJioHiF5un6m5yz+kzlBwvGX9V6k/4HRgTrQ6PHpOUhiPJ7jLZso
   tohoZfmMk/gkFsHL/x/e1kOJAG2XjCI1GDaPOS6SUKdMdtEQj8fFwxEYS
   w==;
X-CSE-ConnectionGUID: ra3r7q/MSwKYcJQ12Mz6LQ==
X-CSE-MsgGUID: 71lmCzoeR6Kj+e1iNXfNRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="39885108"
X-IronPort-AV: E=Sophos;i="6.12,287,1728975600"; 
   d="scan'208";a="39885108"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 19:27:52 -0800
X-CSE-ConnectionGUID: rraJM64pSsStLoih+DLTYQ==
X-CSE-MsgGUID: c0yxrBjxQxmce+ah7u8LKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,287,1728975600"; 
   d="scan'208";a="101770217"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Jan 2025 19:27:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTupI-000AZz-3C;
	Sat, 04 Jan 2025 03:27:48 +0000
Date: Sat, 4 Jan 2025 11:27:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH V1 1/6] arm64: tegra: Configure QSPI clocks and add DMA
Message-ID: <202501041124.8SMfHws1-lkp@intel.com>
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
In-Reply-To: <20250103060407.1064107-2-va@nvidia.com>
References: <20250103060407.1064107-2-va@nvidia.com>
TO: Vishwaroop A <va@nvidia.com>
TO: thierry.reding@gmail.com
TO: jonathanh@nvidia.com
TO: skomatineni@nvidia.com
TO: ldewangan@nvidia.com
TO: broonie@kernel.org
TO: linux-spi@vger.kernel.org
TO: linux-tegra@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: kyarlagadda@nvidia.com
TO: smangipudi@nvidia.com
CC: va@nvidia.com

Hi Vishwaroop,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-spi/for-next]
[also build test WARNING on robh/for-next linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vishwaroop-A/arm64-tegra-Configure-QSPI-clocks-and-add-DMA/20250103-141217
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
patch link:    https://lore.kernel.org/r/20250103060407.1064107-2-va%40nvidia.com
patch subject: [PATCH V1 1/6] arm64: tegra: Configure QSPI clocks and add DMA
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm64-randconfig-051-20250104 (https://download.01.org/0day-ci/archive/20250104/202501041124.8SMfHws1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501041124.8SMfHws1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501041124.8SMfHws1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: gpio@2200000: 'gpio-ranges' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/nvidia,tegra186-gpio.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: ahub@2900800: admaif@290f000: 'interconnect-names', 'interconnects', 'iommus' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra210-ahub.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: admaif@290f000: 'interconnect-names', 'interconnects', 'iommus' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra210-admaif.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: /bus@0/serial@31d0000: failed to match any schema with compatible: ['arm,sbsa-uart']
>> arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: spi@3270000: 'dmas' is a dependency of 'dma-names'
   	from schema $id: http://devicetree.org/schemas/dma/dma.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: spi@3300000: 'dmas' is a dependency of 'dma-names'
   	from schema $id: http://devicetree.org/schemas/dma/dma.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: hda@3510000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra234-hda'] is too short
   	'nvidia,tegra30-hda' was expected
   	'nvidia,tegra132-hda' was expected
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dtb: hda@3510000: clock-names:1: 'hda2hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
--
   	from schema $id: http://devicetree.org/schemas/gpio/nvidia,tegra186-gpio.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: ahub@2900800: admaif@290f000: 'interconnect-names', 'interconnects', 'iommus' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra210-ahub.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: admaif@290f000: 'interconnect-names', 'interconnects', 'iommus' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra210-admaif.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: /bus@0/serial@31d0000: failed to match any schema with compatible: ['arm,sbsa-uart']
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: audio-codec@1c: realtek,jack-detect-source: 7 is not one of [0, 1, 2, 3, 4, 5, 6]
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: audio-codec@1c: Unevaluated properties are not allowed ('clock-names', 'clocks', 'port', 'realtek,jack-detect-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: spi@3270000: Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/nvidia,tegra210-quad.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: spi@3270000: 'dmas' is a dependency of 'dma-names'
   	from schema $id: http://devicetree.org/schemas/dma/dma.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: spi@3300000: 'dmas' is a dependency of 'dma-names'
   	from schema $id: http://devicetree.org/schemas/dma/dma.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: hda@3510000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra234-hda'] is too short
   	'nvidia,tegra30-hda' was expected
   	'nvidia,tegra132-hda' was expected
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dtb: hda@3510000: clock-names:1: 'hda2hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
--
   	from schema $id: http://devicetree.org/schemas/gpio/nvidia,tegra186-gpio.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: ahub@2900800: admaif@290f000: 'interconnect-names', 'interconnects', 'iommus' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra210-ahub.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: admaif@290f000: 'interconnect-names', 'interconnects', 'iommus' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra210-admaif.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: audio-codec@1c: realtek,jack-detect-source: 7 is not one of [0, 1, 2, 3, 4, 5, 6]
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: audio-codec@1c: Unevaluated properties are not allowed ('clock-names', 'clocks', 'port', 'realtek,jack-detect-source' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: /bus@0/serial@31d0000: failed to match any schema with compatible: ['arm,sbsa-uart']
>> arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: spi@3270000: Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/nvidia,tegra210-quad.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: spi@3270000: 'dmas' is a dependency of 'dma-names'
   	from schema $id: http://devicetree.org/schemas/dma/dma.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: spi@3300000: 'dmas' is a dependency of 'dma-names'
   	from schema $id: http://devicetree.org/schemas/dma/dma.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: hda@3510000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra234-hda'] is too short
   	'nvidia,tegra30-hda' was expected
   	'nvidia,tegra132-hda' was expected
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dtb: hda@3510000: clock-names:1: 'hda2hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
--
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: gpio@2200000: 'gpio-ranges' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/nvidia,tegra186-gpio.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: ahub@2900800: admaif@290f000: 'interconnect-names', 'interconnects', 'iommus' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra210-ahub.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: admaif@290f000: 'interconnect-names', 'interconnects', 'iommus' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra210-admaif.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: /bus@0/serial@31d0000: failed to match any schema with compatible: ['arm,sbsa-uart']
>> arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: spi@3270000: Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/nvidia,tegra210-quad.yaml#
>> arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: spi@3270000: 'dmas' is a dependency of 'dma-names'
   	from schema $id: http://devicetree.org/schemas/dma/dma.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: spi@3300000: 'dmas' is a dependency of 'dma-names'
   	from schema $id: http://devicetree.org/schemas/dma/dma.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: hda@3510000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra234-hda'] is too short
   	'nvidia,tegra30-hda' was expected
   	'nvidia,tegra132-hda' was expected
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#
   arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dtb: hda@3510000: clock-names:1: 'hda2hdmi' was expected
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra30-hda.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
