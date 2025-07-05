Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3FCAD4B
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Jul 2025 05:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751693967; cv=none; b=iAxQH9Unjp1ZcNoKSlGFP8i/C+U3+ql/J3U+5Pn5azpdZJlwR5Qb62XqLfyqk3d6NkdE4gDkOxyvNIMAHD9/SGf4Ex4hp0MLEaE8yppTNgD2sQa6sXSrhATKnOStmMfFrX3GYPBRGfOKpuGyxOSAEQf5su+UU9jhMTW+1mBs9yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751693967; c=relaxed/simple;
	bh=G7E/GuXfGe32LHhj94VW1JPYnlbTECJTIStaoZK6XUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ivW0S7YCq2EGV75j188TPpPfGxX4bq0DAWB3qoFirAHk0REOdzbtb1Y+jZ3qqtw1P0yneB7E5+E+uIkqGDRZ7jOL6DpyusygmxvfHDlTYlUdBR/LW/4fFju0ui1z/b0wwDas6YeLfCE5cbOMJEXGWNgNTPELAgvmShw/987Y9uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EPFhkt81; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EPFhkt81"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751693965; x=1783229965;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G7E/GuXfGe32LHhj94VW1JPYnlbTECJTIStaoZK6XUQ=;
  b=EPFhkt81NtTO1debE6g7Qh2lAnfuVe+Ztp7l6vxWlrL1+/TiiGr4zqxG
   BL5S7+BSvlLSEwzrvWbRRjwfTskptVBpSxQDPe6yQjkz/fiozcYhVGqFC
   tc++YKw6hwXRLWbl+S+iN9YQnrgASH1/xG/YQLjIua+tRLEFyYKT5rBGn
   SThRLcaSzve91gLMlm7nGoMQzcOYLOtY+sdDgJKCiLXYgnOnHcTXEzB2E
   KQvmiCE/W9mKMVkbcFdzFxuJ8LHNLbhEUuocu2jOTSXK4uyDGBpDBImLF
   KeALlGZgAdfHo1RO2W8DTUIo3KiXYJ2b1XXmubuqIhqOhMzCqwFa6GVuz
   Q==;
X-CSE-ConnectionGUID: pKyuzTYrQwOsOlkDSjUakg==
X-CSE-MsgGUID: mbMrblbIQWWhww0b7Fnsvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="79444081"
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="79444081"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 22:39:24 -0700
X-CSE-ConnectionGUID: DIegWcAKR2O7yq7WK91zhA==
X-CSE-MsgGUID: Xopi2ih4R9ezTtsQHxjZcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="154190162"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Jul 2025 22:39:24 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXvcP-0004Jz-1l;
	Sat, 05 Jul 2025 05:39:21 +0000
Date: Sat, 5 Jul 2025 13:39:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:wip/sm8750-integration-and-todo 24/27]
 arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/video-codec@aa00000: failed
 to match any schema with compatible: ['qcom,sm8750-iris']
Message-ID: <202507051349.f1IGxFJs-lkp@intel.com>
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

tree:   https://github.com/krzk/linux wip/sm8750-integration-and-todo
head:   8a722a7a68d17e22d21f56e1142f548e68afad57
commit: 59d72aad1832ed266c244719d169438fb9f6d19d [24/27] dtsi
:::::: branch date: 18 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250705 (https://download.01.org/0day-ci/archive/20250705/202507051349.f1IGxFJs-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507051349.f1IGxFJs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507051349.f1IGxFJs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8750.dtsi:3099.27-3162.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/video-codec@aa00000: failed to match any schema with compatible: ['qcom,sm8750-iris']
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2990.27-3077.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8750.dtsi:3099.27-3162.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2636.34-2637.8: Warning (graph_endpoint): /soc@0/phy@88e8000/ports/port@0/endpoint: graph connection to node '/pmic-glink/connector@0/ports/port@1/endpoint' is not bidirectional
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2737.31-2738.9: Warning (graph_endpoint): /soc@0/usb@a6f8800/usb@a600000/ports/port@0/endpoint: graph connection to node '/pmic-glink/connector@0/ports/port@0/endpoint' is not bidirectional
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: Warning (graph_child_address): Failed prerequisite 'graph_endpoint'
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/video-codec@aa00000: failed to match any schema with compatible: ['qcom,sm8750-iris']
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
