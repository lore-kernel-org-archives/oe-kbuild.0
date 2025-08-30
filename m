Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBC02E5D2A
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Aug 2025 20:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756585709; cv=none; b=o0xZFZzb7iel6t1ulhmbH0nf2HyomMcpXfnSaO1TvWkQUKRrYjOENQyL8sZ6nFyY69UzJxIQYvev5WRwECY+v9jiSOsF7swkLqf7Ea1f+SWE4Dm2G1aJ3XqzBhtDUi+iWiDG0+2Mn45BIm4I77HshZrZc8cGjfbTc8x2QpyjbPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756585709; c=relaxed/simple;
	bh=BExIMnbY3RqRypJIpHFRbezx15N7Ucfu1KDBXhnOzl4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CU8uWU7jBJH+Tc86MjjrYs0CcpVdTVNzCQ2qxdhDpjQ4F80VjDJHHHLmCl96ZH8gOaflq8zMy6tcio805yj4yh20SUakv90kjHnl3cdA1osdyZFW6LvJZeZZz3OsV1Znq4C7QuAQlyXrMiU6Ew6A8wOZZIdxLColI94xQyGRr/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XMZibPzq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XMZibPzq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756585708; x=1788121708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BExIMnbY3RqRypJIpHFRbezx15N7Ucfu1KDBXhnOzl4=;
  b=XMZibPzqzuMY8vmqnq1YWBnf/BZC8J6qOlDBneCs4MDtwvSJtOscarLp
   REQJ5lGtBEsuycpOBEiQClbt01XL2ehJlm3YkBrgoVIe5QSn0mjyt+C6u
   jtAhFyWBhjgXFmD53b4cFe/zs9Bjzy87dzthXqcIN7YLkiCPKfQx+vkF9
   sZL327EDflHFgVf3LtEuxJ3iZjavx0lneFSquypckZ4lpcdtedFHXNalT
   YhwQzEhzgeM4ZFb0hRjcd+iIgI07DHzO9m2fdyd/OF9sZsi1/m0Ga1h+m
   Nt1AGeo18/LdoT07RtA6kKgsrCvhuUO0oUkFkteUfIR5mxY4p02uuvyOq
   w==;
X-CSE-ConnectionGUID: 59s0dBQ8Tey5TQxst1kzxg==
X-CSE-MsgGUID: Wy5vxYZXTO6BdLGBeFt3iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62672520"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62672520"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 13:28:27 -0700
X-CSE-ConnectionGUID: FhEsHVG+Qb2fcs6l437c2A==
X-CSE-MsgGUID: f4lTdRVmRxeKDPAUApPVQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="174809937"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 30 Aug 2025 13:28:25 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usSA9-000VgL-2D;
	Sat, 30 Aug 2025 20:27:35 +0000
Date: Sun, 31 Aug 2025 04:24:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:track/x1e-t14s 36/77]
 arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: phy@aec2a00
 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
Message-ID: <202508310413.IibImgkx-lkp@intel.com>
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
TO: Abel Vesa <abel.vesa@linaro.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>

tree:   https://github.com/krzk/linux track/x1e-t14s
head:   6d8b522e6fa2b4a3deabb01d6d38343d5816d6c0
commit: 47301ee1fd90705bb04cee7637672cef59cb022f [36/77] dt-bindings: phy: qcom-edp: Add missing clock for X Elite
:::::: branch date: 7 hours ago
:::::: commit date: 5 days ago
config: arm64-randconfig-051-20250830 (https://download.01.org/0day-ci/archive/20250831/202508310413.IibImgkx-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250831/202508310413.IibImgkx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508310413.IibImgkx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4879.11-4889.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4879.11-4889.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14-el2.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14-el2.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
--
>> arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-el2.dtb: phy@aec2a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#
   arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-el2.dtb: phy@aec5a00 (qcom,x1e80100-dp-phy): clock-names: ['aux', 'cfg_ahb'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
