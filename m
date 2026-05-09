Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AA319EED3
	for <oe-kbuild@lists.linux.dev>; Sat,  9 May 2026 12:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778330195; cv=none; b=oFvrYasMbUSpcSISrTcUnGXePUPAoFUs6upwAUK2WE62x0N/JQmkQgM0Sk8hhwZnL47Ne2u3mh6e6n1vMxKA5bfiZE6lxM7vh6jrNuf5/1Lzptr3uvgr9D/lxwzJHw31GZnobn2t4Na5xtVtGTWtBhiukdx4o7K66d6nfdUET8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778330195; c=relaxed/simple;
	bh=yoo/EkIOK20ciDfFVVuU9Z1/ZtEwl5zZvOJUbeGWgGY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H7QmBX/mynuog06XxiWDdVUb/1yzE7Wz5UQU7XM97tBuST5q8rU5dgksf6CW4C5sYK2zbusdjgbsnErZ75mxoGFmMbUuiO0L/eX1FkPquOmq5eZr0B+HKCarjpZGzjREbpZmMyG5awzJtwCAXkXwx2a0KNHMjT9iX6+5qyb3Q8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mPqLbizf; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mPqLbizf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778330194; x=1809866194;
  h=date:from:to:cc:subject:message-id;
  bh=yoo/EkIOK20ciDfFVVuU9Z1/ZtEwl5zZvOJUbeGWgGY=;
  b=mPqLbizfStOQFlz1OHW0qcWI66729fVIShfiK9S8d/BxA/Rnd78tN1Ic
   e2ZLfZI7yQoevrV742WNiTq3wxBCZLPfT38gczqFHWSjpUpL1PQtw00b5
   rrrd8vaHdfxYBVyINHxZ4/62Bvm5/qx7eYcRMf2R/Ox06Dvv+RmOOZNmh
   ClfETcvEmH32tvQuoUSGD2/sezeJsb2PLyYkEK8v6hvLRYk39VIY0Sn49
   ltn730J1AUwbZRSP46qAe/03rwIkOtUOmSIN69/d6f2Hd7uulJMAkovyK
   IYd8ZjYqTYgbj+ZB837FOTxToVLUnqbIQQiu+81HiRqo/G2dL0lQ8nGMQ
   Q==;
X-CSE-ConnectionGUID: CTGtLJwBQHOCtBjR2LOt0Q==
X-CSE-MsgGUID: EICv97DsR5ilyTlW7ZiGiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="79472361"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="79472361"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 05:36:33 -0700
X-CSE-ConnectionGUID: JwRSpiiTR1m+YC2O7T78kg==
X-CSE-MsgGUID: wd64ZwBVSfW12ohJ2MXX8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="260469137"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 09 May 2026 05:36:26 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLguu-000000007Rq-0NlQ;
	Sat, 09 May 2026 12:36:24 +0000
Date: Sat, 09 May 2026 14:35:41 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt6797-evb.dtb:
 pinctrl@10005000 (mediatek,mt6797-pinctrl): 'i2c0-pins', 'i2c1-pins',
 'i2c2-pins', 'i2c3-pins', 'i2c4-pins', 'i2c5-pins', 'i2c6-pins', 'i2c7-pins',
 'uart0-pins', 'uart1-pins' do not match any of the regexes: '-...
Message-ID: <202605091400.SJX0XJE1-lkp@intel.com>
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
head:   70390501d1944d4e5b8f7352be180fceb3a44132
commit: e3c84c9408bbaead850daf5e5f515ea025821b57 arm64: dts: mediatek: mt6797: Fix pinctrl node names
date:   8 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 8 months ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260509/202605091400.SJX0XJE1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605091400.SJX0XJE1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e3c84c9408bb ("arm64: dts: mediatek: mt6797: Fix pinctrl node names")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605091400.SJX0XJE1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt6797-evb.dtb: pinctrl@10005000 (mediatek,mt6797-pinctrl): 'i2c0-pins', 'i2c1-pins', 'i2c2-pins', 'i2c3-pins', 'i2c4-pins', 'i2c5-pins', 'i2c6-pins', 'i2c7-pins', 'uart0-pins', 'uart1-pins' do not match any of the regexes: '-[0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt6779-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt6797-evb.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt6797-scpsys']
   arch/arm64/boot/dts/mediatek/mt6797-evb.dtb: intpol-controller@10200620 (mediatek,mt6797-sysirq): $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml
--
>> arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: pinctrl@10005000 (mediatek,mt6797-pinctrl): 'i2c0-pins', 'i2c1-pins', 'i2c2-pins', 'i2c3-pins', 'i2c4-pins', 'i2c5-pins', 'i2c6-pins', 'i2c7-pins', 'uart0-pins', 'uart1-pins' do not match any of the regexes: '-[0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt6779-pinctrl.yaml
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt6797-scpsys']
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: intpol-controller@10200620 (mediatek,mt6797-sysirq): $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: i2c@11008000 (mediatek,mt6797-i2c): Unevaluated properties are not allowed ('id' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: i2c@1100e000 (mediatek,mt6797-i2c): Unevaluated properties are not allowed ('id' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: i2c@11010000 (mediatek,mt6797-i2c): Unevaluated properties are not allowed ('id' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
