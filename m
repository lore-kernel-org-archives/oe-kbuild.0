Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEC52E92D4
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Sep 2025 08:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757751873; cv=none; b=E8Ff/OPnHlH7XUrZQhZf3OXociIxFvbYgAhbuON5K4g1qaKvBDV/hhvm/s8lSdAb2F7+ny/i8aXD4OiShLH6i0UI6PcbF9KMVY0rjtsbugZoekDKqe8B84mmXt0IsuStGETPsyvypVmHU94e8iQLfOO6/o3PVtQcZMjLSTqR8iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757751873; c=relaxed/simple;
	bh=ufx3pLEQlziMcX++9254FdyTn/4RrrUvFpg9rd/xm1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oi8m95eAcEoS/CCZXIcpH2bQgkf5sPjeUCXO3iOf5szy+TsS9DZedW1X8edxVO5jiNRVjBcaQtnLhEe2ID0vivHwQ91Wti9fPv+An/UvEvnNO5lREt6bTDnbmZksRnNvqemioStJb5CA4qn16XUj/ChzvA1iWa+05Gv/k9L6O3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XWYdQtxT; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XWYdQtxT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757751872; x=1789287872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ufx3pLEQlziMcX++9254FdyTn/4RrrUvFpg9rd/xm1I=;
  b=XWYdQtxTm2ZosoNXIRvLSGK8CNR1fmgHU+15ZxA7i4rDGp6TxcRoRzbM
   qknhRDgvyloIlObnyiJnYU6j7CZkxvsj0/3+Tw56VOfadrfIgfktJT5cP
   OAu+GIQ5Zt0A+KqemZL6NUVnqJvUhVNLjsYg2FenhfmiTfqbCu2gWoUH0
   HdLRye0QTrDSdDWJQTom/lYh6SbiKhI6N+BPiIa1WPadZ3sjraki5GlTZ
   sL42yScTiSrXw+0e4gfUIvlavCldEJTsOtyPlXN7KE4z/zsJxK5OfCl13
   jiMcO8ALZuI9DNFhQfovVnjOOHKLvh3Sxk2dzLrrbofo4Du4N1u74z2rl
   Q==;
X-CSE-ConnectionGUID: ioDzRoLuQVuGvumLxDMebw==
X-CSE-MsgGUID: XIKRwjmdQLeUgjVS0M8f6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="82675181"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="82675181"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 01:24:31 -0700
X-CSE-ConnectionGUID: D5XAEzikS5iFFd8+m3f6VQ==
X-CSE-MsgGUID: 191DjAIaSEmjwLdGPZAtyQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 13 Sep 2025 01:24:30 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1uxLYZ-000000001a9-3u3p;
	Sat, 13 Sep 2025 08:24:27 +0000
Date: Sat, 13 Sep 2025 10:24:08 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mediatek:v6.17-next/dts64.2 18/38]
 arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: pmic
 (mediatek,mt6331): 'mt6332-led' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202509131047.qZzBhCsI-lkp@intel.com>
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
CC: Matthias Brugger <matthias.bgg@gmail.com>
CC: Fei Shao <fshao@chromium.org>

Hi AngeloGioacchino,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v6.17-next/dts64.2
head:   ffe6a5d1dd4d4d8af0779526cf4e40522647b25f
commit: 98967109c9c0e2de4140827628c63f96314099ab [18/38] arm64: dts: mediatek: mt6331: Fix pmic, regulators, rtc, keys node names
:::::: branch date: 18 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-2051-20250913 (https://download.01.org/0day-ci/archive/20250913/202509131047.qZzBhCsI-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ead0e976ed870ce10e88e94f6bac307190a70e62)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250913/202509131047.qZzBhCsI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509131047.qZzBhCsI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: syscon@10006000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: timer@10008000 (mediatek,mt6795-timer): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6795-timer', 'mediatek,mt6577-timer'] is too long
   	'mediatek,mt6795-timer' is not one of ['mediatek,mt6577-timer', 'mediatek,mt6765-timer', 'mediatek,mt6795-systimer']
   	'mediatek,mt6795-timer' is not one of ['mediatek,mt2701-timer', 'mediatek,mt6580-timer', 'mediatek,mt6582-timer', 'mediatek,mt6589-timer', 'mediatek,mt7623-timer', 'mediatek,mt8127-timer', 'mediatek,mt8135-timer', 'mediatek,mt8173-timer', 'mediatek,mt8516-timer']
   	'mediatek,mt6795-timer' is not one of ['mediatek,mt7629-timer', 'mediatek,mt8183-timer', 'mediatek,mt8186-timer', 'mediatek,mt8188-timer', 'mediatek,mt8192-timer', 'mediatek,mt8195-timer', 'mediatek,mt8365-systimer']
   	'mediatek,mt6765-timer' was expected
   	from schema $id: http://devicetree.org/schemas/timer/mediatek,timer.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: /soc/timer@10008000: failed to match any schema with compatible: ['mediatek,mt6795-timer', 'mediatek,mt6577-timer']
>> arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: pmic (mediatek,mt6331): 'mt6332-led' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
>> arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: pmic (mediatek,mt6331): regulators:compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt6331-regulator'] is too short
   	'mediatek,mt6331-regulator' is not one of ['mediatek,mt6323-regulator', 'mediatek,mt6328-regulator', 'mediatek,mt6358-regulator', 'mediatek,mt6359-regulator', 'mediatek,mt6397-regulator']
   	'mediatek,mt6331-regulator' is not one of ['mediatek,mt6366-regulator']
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: /soc/pwrap@1000d000/pmic/regulators: failed to match any schema with compatible: ['mediatek,mt6331-regulator']
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: intpol-controller@10200620 (mediatek,mt6795-sysirq): $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: iommu@10205000 (mediatek,mt6795-m4u): 'mediatek,infracfg' is a required property
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml#
   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dtb: mmc@11230000 (mediatek,mt6795-mmc): mediatek,latch-ck: 20 is greater than the maximum of 7

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
