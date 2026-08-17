Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A25B2253FC
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Aug 2026 05:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786942833; cv=none; b=El7nZf7dwnxupmRdo18d17CSYbyJ9CiRPLEmRIP+3azgv27KHscI+e27x8JhOBTZS3nd/35HoURmUiY4eancp58lNyc6atXrfOPtHAZHK2lY0DyLt3xG2Vlsmxwy0YGby09fYembmiDX/BLFYy1RzcJ90TOHwZlAWdQiVK5tMVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786942833; c=relaxed/simple;
	bh=yaKWr7S9prJYZMcNJ4jqoQgYm0uPr8llYf1W+2aoA7w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nySAmZY5wx+F0D1qYGeO3+8yKUPcAaARfXWT8EO7d96Owut2rreW5Aq09uJVfXZA8rr4A62tWLbIlfhaB03yAQlzJTWfy3Rv5nNkVZwbjp26OaPdOhVl8RZUwTfmOkUBTM3/vQaGvSdV+JTmv18r5v9rVWVE1KJtHvKgMJgfKfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XhRI4lla; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XhRI4lla"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786942831; x=1818478831;
  h=date:from:to:cc:subject:message-id;
  bh=yaKWr7S9prJYZMcNJ4jqoQgYm0uPr8llYf1W+2aoA7w=;
  b=XhRI4llaa1tPN1sy6EyUpHZ6zqE6BBcBGI9GkyHRCA2POujF/hR4XELy
   DA9WHREWO3KlyQM77J0CkZAkkfBaFecs+XpG/6S3y8GxM9M2wVh/6MFqe
   clTmwrg41P+IcbvVyVqNuy+Cb4zUcJMCWBBQzr2JlBg5V+dBJJdBLorEe
   D1dwoLI4kgFTigFwBu3/CXUQ06zBWYnA4RSx4dVuifi466T7SIEgwE30H
   vZzVOcXTZE7oM3e6kwuONepfAKLoxfOwhBldIdi3vL9nAw3KM5yTDSTeh
   Ir/EKHYgk2Q1TESgB1269lgEQKONpP1c+xYl0dsr7hB40UKGF1pOTjLAk
   A==;
X-CSE-ConnectionGUID: vF5d4nepR5KjPJn7VS8pSw==
X-CSE-MsgGUID: iOkkIk7WTLiRjiSoGCPeRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="86532187"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="86532187"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 22:00:30 -0700
X-CSE-ConnectionGUID: EG3rVB//TzGvozdJ61smtQ==
X-CSE-MsgGUID: BaB3pUskSNu/UN/LmzSe8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="303041524"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 16 Aug 2026 22:00:28 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvpSU-000000006kn-2EAJ;
	Mon, 17 Aug 2026 05:00:26 +0000
Date: Mon, 17 Aug 2026 06:59:30 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dtb:
 sound@7702000 (qcom,apq8016-sbc-sndcard): quaternary-dai-link:cpu:sound-dai:
 [[107], [3]] is too long
Message-ID: <202608170648.BXwrTEa7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "H. Nikolaus Schaller" <hns@goldelico.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/H-Nikolaus-Schaller/dt-bindings-twl-regulator-Add-bindings-for-exposing-ti-twl4030-regen/20260812-201259
head:   4f5559ad82b8debd2be982b089e18240288940e9
commit: 44971f13cae7486e3643ba685ac319be100b42ae ASoC: dt-bindings: add OpenPandora Sound Card
date:   5 days ago
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-2053-20260815 (https://download.01.org/0day-ci/archive/20260817/202608170648.BXwrTEa7-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project daa9d09970fed49996f42a8f7000b584f295991d)
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608170648.BXwrTEa7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608170648.BXwrTEa7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1606.27-1654.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:463.26-466.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:478.26-481.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:491.26-494.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:503.26-506.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
>> arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dtb: sound@7702000 (qcom,apq8016-sbc-sndcard): quaternary-dai-link:cpu:sound-dai: [[107], [3]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/qcom,apq8016-sbc-sndcard.yaml
>> arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dtb: sound@7702000 (qcom,apq8016-sbc-sndcard): primary-dai-link:cpu:sound-dai: [[107], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/qcom,apq8016-sbc-sndcard.yaml
>> arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dtb: sound@7702000 (qcom,apq8016-sbc-sndcard): tertiary-dai-link:cpu:sound-dai: [[107], [2]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/qcom,apq8016-sbc-sndcard.yaml
--
   arch/arm64/boot/dts/qcom/msm8939.dtsi:504.26-507.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s6-p1@a1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s6-p2@a1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:524.26-527.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s8-p1@a4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s8-p2@a4)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:549.24-552.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/mode@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:559.26-562.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s0-p1@d1: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p1@d1)
   arch/arm64/boot/dts/qcom/msm8939.dtsi:579.26-582.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s3-p1@d4)
>> arch/arm64/boot/dts/qcom/apq8039-t2.dtb: sound@7702000 (qcom,apq8016-sbc-sndcard): internal-codec-playback-dai-link:cpu:sound-dai: [[96], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/qcom,apq8016-sbc-sndcard.yaml
>> arch/arm64/boot/dts/qcom/apq8039-t2.dtb: sound@7702000 (qcom,apq8016-sbc-sndcard): internal-codec-capture-dai-link:cpu:sound-dai: [[96], [2]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/qcom,apq8016-sbc-sndcard.yaml
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1606.27-1654.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:463.26-466.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:478.26-481.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:491.26-494.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:503.26-506.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
>> arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dtb: sound@7702000 (qcom,apq8016-sbc-sndcard): primary-dai-link:cpu:sound-dai: [[102], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/qcom,apq8016-sbc-sndcard.yaml
>> arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dtb: sound@7702000 (qcom,apq8016-sbc-sndcard): tertiary-dai-link:cpu:sound-dai: [[102], [2]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/qcom,apq8016-sbc-sndcard.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
