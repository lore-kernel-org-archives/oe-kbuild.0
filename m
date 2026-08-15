Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE8E37F32B
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Aug 2026 06:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786775521; cv=none; b=tONuO8j4aDNi7MG+lrFuOZRm31xNYI3jyWwVyVED3+LQ/t4HSxPy0ZKQ0LmUfrnRsoj9rPTYnEGOV2pLs26gahuNB8RmUW2Bb5AESwfXGXGJvXAwIxJDS/aDCxIwQYrgWf13l+kvE7RdIqOBJif9PRt1vA3YQVIPxbmCOO3qyT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786775521; c=relaxed/simple;
	bh=JzjRXtCog2ZkgHTq83hiTLk9OrYjKuy+1iPJciHA8LE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MsiY8TWNt0ijVf4Z/zsP4BP9Rp4s4sJNgFp+jjMk61G+3E5rzIANhjyJy4+oKmrmRr3/zrsecS108zirbgeaKn0tos8eQPwzV089pB3rOjlMNTKf+cv0gKJmWpI12YB/gQUxx9k+RBk7CEC1TVEEepLc1q9kOWUh+YWNCb4tb64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AKR8O7y2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AKR8O7y2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786775519; x=1818311519;
  h=date:from:to:cc:subject:message-id;
  bh=JzjRXtCog2ZkgHTq83hiTLk9OrYjKuy+1iPJciHA8LE=;
  b=AKR8O7y2w8FyGoEP8cyZQXo4WkbJUtqdobJasq8lnry51CduSKx98rVU
   5g2NCj0esMhOUX4Gvf1fZUata4rOgn35TuM1sFxNPHHuJI7UNsEipAlEb
   UZ/YYIZTnCVbcQG3iJcTuPeKS8O9vth5dm3ZkVCFW1VeEsSPOa87gTLg+
   PE7xWfrJEX+RTMa+CQTr4Qjy/ORJVve9kwIcME6zJI5LAnEwMbI4BJM0Y
   bcIKsy7nw0GnCtfkJid+8MqohLqxHVh+PvLr0rnlA1x8dnuB7/PfV4lCb
   jxqF24M/VbqGkPFceRVvsjgpfLmK9LUWKi91xMtqwRRK+Q8X4cn058O/r
   A==;
X-CSE-ConnectionGUID: fb4UKyFWQgi3eQJWLtGhhw==
X-CSE-MsgGUID: 8kiyQANjSc6DSZD2XEPCOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="97688164"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="97688164"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 23:31:58 -0700
X-CSE-ConnectionGUID: jkhgYQfTTjeOjcWAfl63wg==
X-CSE-MsgGUID: 2yh9Lmx9QwmXMEus/YuvpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="263082096"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 14 Aug 2026 23:31:58 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wv7vv-000000006Nt-1HaZ;
	Sat, 15 Aug 2026 06:31:55 +0000
Date: Sat, 15 Aug 2026 08:31:07 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt6797-evb.dtb:
 pinctrl@10005000 (mediatek,mt6797-pinctrl): 'i2c0-pins', 'i2c1-pins',
 'i2c2-pins', 'i2c3-pins', 'i2c4-pins', 'i2c5-pins', 'i2c6-pins', 'i2c7-pins',
 'uart0-pins', 'uart1-pins' do not match any of the regexes: '-...
Message-ID: <202608150848.6Y1kcdZE-lkp@intel.com>
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
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>
CC: Fei Shao <fshao@chromium.org>

Hi AngeloGioacchino,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   15ef2f78c49d20d53ec7c0f1c9b40b02e089f2d6
commit: e3c84c9408bbaead850daf5e5f515ea025821b57 arm64: dts: mediatek: mt6797: Fix pinctrl node names
date:   11 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 11 months ago
config: arm64-randconfig-2054-20260813 (https://download.01.org/0day-ci/archive/20260815/202608150848.6Y1kcdZE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608150848.6Y1kcdZE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e3c84c9408bb ("arm64: dts: mediatek: mt6797: Fix pinctrl node names")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608150848.6Y1kcdZE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt6797-evb.dtb: pinctrl@10005000 (mediatek,mt6797-pinctrl): 'i2c0-pins', 'i2c1-pins', 'i2c2-pins', 'i2c3-pins', 'i2c4-pins', 'i2c5-pins', 'i2c6-pins', 'i2c7-pins', 'uart0-pins', 'uart1-pins' do not match any of the regexes: '-[0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt6779-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt6797-evb.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt6797-scpsys']
   arch/arm64/boot/dts/mediatek/mt6797-evb.dtb: power-controller@10006000 (mediatek,mt6797-scpsys): infracfg: b'\x00\x00\x00\x04' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt6797-evb.dtb: intpol-controller@10200620 (mediatek,mt6797-sysirq): $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml
   arch/arm64/boot/dts/mediatek/mt6797-evb.dtb: i2c@11007000 (mediatek,mt6797-i2c): id: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt6797-evb.dtb: i2c@11008000 (mediatek,mt6797-i2c): id: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
>> arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: pinctrl@10005000 (mediatek,mt6797-pinctrl): 'i2c0-pins', 'i2c1-pins', 'i2c2-pins', 'i2c3-pins', 'i2c4-pins', 'i2c5-pins', 'i2c6-pins', 'i2c7-pins', 'uart0-pins', 'uart1-pins' do not match any of the regexes: '-[0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt6779-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt6797-scpsys']
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: power-controller@10006000 (mediatek,mt6797-scpsys): infracfg: b'\x00\x00\x00\x04' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: intpol-controller@10200620 (mediatek,mt6797-sysirq): $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: i2c@11007000 (mediatek,mt6797-i2c): id: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: i2c@11008000 (mediatek,mt6797-i2c): Unevaluated properties are not allowed ('id' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
