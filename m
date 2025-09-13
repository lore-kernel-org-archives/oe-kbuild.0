Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B5326281
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Sep 2025 11:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757763746; cv=none; b=D99RvpLWK7Yo2/g+HMUpdxzgHZcA3+SvqIZOLhahmX67fq9ycqsJ7sujSfMOh09wkxEx0+Hlz34osedqDkRZu+Kj42oeiYmGx0kyoUzVHmYiExzLKTIX7qHfGCKR/nKjj7zpm13HrfCKThp6aCLjXE1LBdiGw5uzaV6e5DMk6L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757763746; c=relaxed/simple;
	bh=/CgtLTjvEdhlnKWfgh2ByioF40JserOiLt77Acc6gSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=na4Hn5lEE+5+QNHJvbQt6qMPkh8RwSBYozi1TEFUV+06f0UaTwcfhWwhNH2vncwyIYE1Ksgodwm9mMnWpzgq8fDKQX29IJpw+VFJhoQkHZRmCIsS/qeB3XW7FARlFpUuaOR4y5COaUBXG0zDm/Gl5VG/YKTvYD4H4v7mPlJMlzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R3nJN/EQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3nJN/EQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757763745; x=1789299745;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/CgtLTjvEdhlnKWfgh2ByioF40JserOiLt77Acc6gSw=;
  b=R3nJN/EQGfwWfpwE1s+HfiPkSEFsi65rUc7cWuyrMR0tluZDO8gLrUkR
   FRWaSzj7s/iy+TGqkKHT0oCEe0n9ouqS+yImlwqDfi5MNmVms81irO19V
   dq31Q4sI+0442k4CbrIfAmdMlVOV1DSq2the3WjaiEwk3Zq/Ec7y916+3
   8f+mKe1mhI2nx/ELGFTSoBvbjCh4JWyMsbMwLeWC6ik5duWaJ7X5SgCbg
   B7yQcX+cceMlF+8/BUz93Rvs+9Ci/MVnG6GJ52QhMNOtWm6bvAYhsUwda
   /hcwY1wFB/hZnQbQ9MgC91kKcwtNrN7zLs0DZ2AyZFUSpQ0z491vNGfia
   w==;
X-CSE-ConnectionGUID: 3ssldfOVTWKaWS3c/b/A1A==
X-CSE-MsgGUID: DAx4AoU0SlGQH+7oXAQW0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="59957294"
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="59957294"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2025 04:42:25 -0700
X-CSE-ConnectionGUID: 9T9AcDP6RVqFbfTuovT+LQ==
X-CSE-MsgGUID: PLnAWLWyTLSiybyDU3xynA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,261,1751266800"; 
   d="scan'208";a="174266378"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 13 Sep 2025 04:42:24 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxOe5-0001U0-1j;
	Sat, 13 Sep 2025 11:42:21 +0000
Date: Sat, 13 Sep 2025 19:41:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mediatek:v6.17-next/dts64.2 19/38]
 arch/arm64/boot/dts/mediatek/mt6797-evb.dtb: pinctrl@10005000
 (mediatek,mt6797-pinctrl): 'i2c0-pins', 'i2c1-pins', 'i2c2-pins',
 'i2c3-pins', 'i2c4-pins', 'i2c5-pins', 'i2c6-pins', 'i2c7-pins',
 'uart0-pins', 'uart1-pins' do not match any of the regexes: '-...
Message-ID: <202509131936.oOzI9ohk-lkp@intel.com>
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
commit: e3c84c9408bbaead850daf5e5f515ea025821b57 [19/38] arm64: dts: mediatek: mt6797: Fix pinctrl node names
:::::: branch date: 21 hours ago
:::::: commit date: 23 hours ago
config: arm64-randconfig-051-20250913 (https://download.01.org/0day-ci/archive/20250913/202509131936.oOzI9ohk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250913/202509131936.oOzI9ohk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509131936.oOzI9ohk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt6797-evb.dtb: pinctrl@10005000 (mediatek,mt6797-pinctrl): 'i2c0-pins', 'i2c1-pins', 'i2c2-pins', 'i2c3-pins', 'i2c4-pins', 'i2c5-pins', 'i2c6-pins', 'i2c7-pins', 'uart0-pins', 'uart1-pins' do not match any of the regexes: '-[0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt6779-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt6797-evb.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt6797-scpsys']
   arch/arm64/boot/dts/mediatek/mt6797-evb.dtb: intpol-controller@10200620 (mediatek,mt6797-sysirq): $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
--
>> arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: pinctrl@10005000 (mediatek,mt6797-pinctrl): 'i2c0-pins', 'i2c1-pins', 'i2c2-pins', 'i2c3-pins', 'i2c4-pins', 'i2c5-pins', 'i2c6-pins', 'i2c7-pins', 'uart0-pins', 'uart1-pins' do not match any of the regexes: '-[0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt6779-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: /power-controller@10006000: failed to match any schema with compatible: ['mediatek,mt6797-scpsys']
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: intpol-controller@10200620 (mediatek,mt6797-sysirq): $nodename:0: 'intpol-controller@10200620' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mediatek,mt6577-sysirq.yaml#
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: i2c@11008000 (mediatek,mt6797-i2c): Unevaluated properties are not allowed ('id' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: i2c@1100e000 (mediatek,mt6797-i2c): Unevaluated properties are not allowed ('id' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt6797-x20-dev.dtb: i2c@11010000 (mediatek,mt6797-i2c): Unevaluated properties are not allowed ('id' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
