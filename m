Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F69928469B
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Mar 2026 22:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774218779; cv=none; b=cBH6AECJ1liUt9GjKoEe+ZOFOgcKqenC9VsB5N9nuNT8KxaZGXr2t1cEn+qHSdB2qMPaetviwaDwNK3le5+Z+p8XSgdOBD4Ez2+J/HU9DqaZlp3MLk87QBb64C0/w6dWo4+kOxcu2dQYsmVVYEvT/jbaxI9Z0gFntaJJgYkmSiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774218779; c=relaxed/simple;
	bh=KOBkFL32mR+5Kqn1vuf7EEaROKZRwNlWxejwsO1ZX2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sTMtrQQlA7Sli0sKu1JglxrW845rcBfnrZ+ehfOhzfKZKseDKHSqz1WKcw/JAMF883CQMPviWo1ye3C5bGU+dSgVcnbTQAW4mo5ITdXw4jRnmymL2gXUfA7WEZMKYI7wfoQfutx0y2XRtXR/oLUbfkElyS82ypEj5SgcWRUcuUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXG8kWCo; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXG8kWCo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774218778; x=1805754778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KOBkFL32mR+5Kqn1vuf7EEaROKZRwNlWxejwsO1ZX2I=;
  b=gXG8kWCoVooGDqHnv9t3wHWc2DYDZU9GEJ9ym8wARz0MJa0KcaDFCVjY
   n5lPPoErA/dMkXolz6+h+SeWwscOYnjUpQ1Ckymqem+lbK4Boq6CDG9G/
   9wW4dRjeaPz7SPGAk9xkNF4t/xq01nl0yVIbooTpBiMTUlQaiDFGTGH7q
   gZcJUSkgKfMOgJS0OjqKZHguZ/ZVT29fEUywV2yDuOE9EPZp0WBg2zr8i
   E1u0rjSnuaIXh5BNgGWlksnICYj6GTN5ZrTba3Si3K16UFAWC8bDYys9W
   YgPvdC5sgLegqCjhI/8H8bK1Gwz3rOQqXvhjbUwprFQjwZWTd2afSXINi
   Q==;
X-CSE-ConnectionGUID: 4HJGsaDRTfmqZzZB7rr1sQ==
X-CSE-MsgGUID: Pe8WUVWjSPqmA2sw7Rll0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="97842721"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="97842721"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 15:32:58 -0700
X-CSE-ConnectionGUID: vZdYBHfTQkSWL2pk4p6p+w==
X-CSE-MsgGUID: OA4+85jER+GnzE4O63dgWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="219528928"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 22 Mar 2026 15:32:56 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4RLp-000000006T3-3wLs;
	Sun, 22 Mar 2026 22:32:53 +0000
Date: Sun, 22 Mar 2026 23:32:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v6 1/2] dt-bindings: iio: proximity: add ST VL53L1X ToF
 sensor
Message-ID: <202603222312.IKnssa4V-lkp@intel.com>
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
In-Reply-To: <20260319190738.151614-2-email@sirat.me>
References: <20260319190738.151614-2-email@sirat.me>
TO: Siratul Islam <email@sirat.me>
TO: linux-iio@vger.kernel.org
TO: devicetree@vger.kernel.org
CC: jic23@kernel.org
CC: dlechner@baylibre.com
CC: nuno.sa@analog.com
CC: andy@kernel.org
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: linux-kernel@vger.kernel.org
CC: Siratul Islam <email@sirat.me>

Hi Siratul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on linus/master v7.0-rc4 next-20260320]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Siratul-Islam/dt-bindings-iio-proximity-add-ST-VL53L1X-ToF-sensor/20260322-084323
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20260319190738.151614-2-email%40sirat.me
patch subject: [PATCH v6 1/2] dt-bindings: iio: proximity: add ST VL53L1X ToF sensor
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-2051-20260322 (https://download.01.org/0day-ci/archive/20260322/202603222312.IKnssa4V-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603222312.IKnssa4V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603222312.IKnssa4V-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1052.26-1103.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1122.26-1173.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8994.dtsi:40.20-48.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: vl53l0x@29 (st,vl53l0x): 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/proximity/st,vl53l0x.yaml
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: syscon@9a10000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1052.26-1103.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1122.26-1173.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@900000/dsi@996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8994.dtsi:40.20-48.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@400f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: vl53l0x@29 (st,vl53l0x): 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/proximity/st,vl53l0x.yaml
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: syscon@9a10000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
