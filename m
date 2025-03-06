Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F55D18DF81
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Mar 2025 15:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741275914; cv=none; b=RU83YUaeEV0zCqRNiCdO0B/YiomhEbtzzSk/xWDNC+YeWkQwL+CPw8MyN+Xez+dsKBq9jBTOQmCmKAl6vW0QMOMeR48rFb9XR2WFrhA8T6u5uYGn6CqAdSwf0ziupI1OXvd1X8HgvX2mGYyu1B72W+0r4YQp0HfCEdHYiVs5urg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741275914; c=relaxed/simple;
	bh=hmO70JllShvvSD8JtgtUPX1j5/DMa5VvT9MEC6Y/jYk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aPY8ELnqMI07Sp+rfP+vr9fSRgnQ25gywNu01rzXdeuwLBUdMlnBgk8Ejkaoyq4xI1zwLpjcQiOB83TJjaPNMmtBGX/36ArRfP9imscs2LmSfifa9dJPpQpXB4kEZ2X5tsNevCUju8ergYHGzi2eZDv6KV1uI2lmsAsA0k6XNq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WJy/gZeg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WJy/gZeg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741275912; x=1772811912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hmO70JllShvvSD8JtgtUPX1j5/DMa5VvT9MEC6Y/jYk=;
  b=WJy/gZeg8SgrAO19Gz9+xytBXAAS34dELNKCOWljbT+F1G1mU8FZrAHh
   OjJQOV+5ypal01oyrwTp7GSjXkOIS4zQrcBM8HwTq5JI8/4mpzn9+Ao4w
   l0j0PP6zBY55dI7qREDmmAT5+Q69lU2tbiIYZ92qp631tOdGm8tO6mi64
   ESI0XsSstGjnvZMMIcqjqwblcq+5G0qKozjCQSsaA2oZhEKAkoHm94OJK
   vpBh1PTncZqWragEILA5B9ckfW+2UvhDTErhffZc7y4HujsfiT+W21bnn
   afyH5zewxhePiyKSl7UYaqR2jUY3DYGHWZexe4D7ATV939+XXDYHiCBWm
   w==;
X-CSE-ConnectionGUID: xZpLlzN/Si6jUa2XQsjs7g==
X-CSE-MsgGUID: kKTXsmZwSAKr3FTfh+gWGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53280413"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="53280413"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 07:45:05 -0800
X-CSE-ConnectionGUID: 9qUcG+j0Q/a6lwawHvWLsg==
X-CSE-MsgGUID: 39OQBNbZTa2THastKfeITA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119566599"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 06 Mar 2025 07:45:04 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqDP9-000NEQ-14;
	Thu, 06 Mar 2025 15:45:00 +0000
Date: Thu, 6 Mar 2025 23:44:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broonie-ci:fileCxiuKp 21/52]
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: es8388@11: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202503062328.HGEqR2bf-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileCxiuKp
head:   2c2eadd07e747059ccd65e68cd1d1b23ca96b072
commit: 1d251a7adc5b720a71641c758a45b8a119971d80 [21/52] ASoC: dt-bindings: everest,es8328: Mark ES8388 compatible with ES8328
:::::: branch date: 2 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20250306 (https://download.01.org/0day-ci/archive/20250306/202503062328.HGEqR2bf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503062328.HGEqR2bf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503062328.HGEqR2bf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:1356.21-1369.4: Warning (avoid_unnecessary_addr_size): /i2c@ff3d0000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
>> arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: es8388@11: compatible: 'oneOf' conditional failed, one must be fixed:
   	['everest,es8388'] is too short
   	'everest,es8388' is not one of ['everest,es8328']
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: es8388@11: 'DVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: es8388@11: 'AVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: es8388@11: 'PVDD-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: es8388@11: 'HPVDD-supply' is a required property
--
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts:1358.7-1366.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: audio-codec@11: compatible: 'oneOf' conditional failed, one must be fixed:
   	['everest,es8388'] is too short
   	'everest,es8388' is not one of ['everest,es8328']
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: audio-codec@11: compatible: 'oneOf' conditional failed, one must be fixed:
   	['everest,es8388'] is too short
   	'everest,es8388' is not one of ['everest,es8328']
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: audio-codec@11: compatible: 'oneOf' conditional failed, one must be fixed:
   	['everest,es8388'] is too short
   	'everest,es8388' is not one of ['everest,es8328']
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: audio-codec@11: compatible: 'oneOf' conditional failed, one must be fixed:
   	['everest,es8388'] is too short
   	'everest,es8388' is not one of ['everest,es8328']
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts:1130.7-1138.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: audio-codec@11: compatible: 'oneOf' conditional failed, one must be fixed:
   	['everest,es8388'] is too short
   	'everest,es8388' is not one of ['everest,es8328']
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: audio-codec@11: compatible: 'oneOf' conditional failed, one must be fixed:
   	['everest,es8388'] is too short
   	'everest,es8388' is not one of ['everest,es8328']
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: audio-codec@11: compatible: 'oneOf' conditional failed, one must be fixed:
   	['everest,es8388'] is too short
   	'everest,es8388' is not one of ['everest,es8328']
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: audio-codec@10: compatible: 'oneOf' conditional failed, one must be fixed:
   	['everest,es8388'] is too short
   	'everest,es8388' is not one of ['everest,es8328']
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
--
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: audio-codec@10: compatible: 'oneOf' conditional failed, one must be fixed:
   	['everest,es8388'] is too short
   	'everest,es8388' is not one of ['everest,es8328']
   	from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
