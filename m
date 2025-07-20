Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6793E2B9A9
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Jul 2025 21:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753047055; cv=none; b=Znb5ql+9NMGpVlPgwO28ip7YYpvd8xVDLzMsTgWvuwTfyVFt7yohwvT6r2EEnLclalz3KE8oniRCtugOmQfIS0SeCz+pm1yyP0axzEq7OttHeP+dtx5Ys7xeV/MWHNG5JWrQNfsaWyy+SuJ30hEhrCv4lGV9LBlJ9/4bw+58T1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753047055; c=relaxed/simple;
	bh=7qo8q169HpYGyPlYvMRnPlWea28y55F958pWC2Qe/Ds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nzmrOlKffglrnESCvpCkNK2oYnQPZpurNJjP+VSy4E7zoQUx/YO1FaHa4TIMvj74gbN0cR8MOW4YcuoJQkyhDLmYADd6gPO+1Cv4n5q+0nkLLQLYd5IaYvIgxaur6T6A2wiQGrGinqZZke4TBCHjifn5WsJS1HOV6AzVRTLsF2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hHGMsmZA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hHGMsmZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753047053; x=1784583053;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7qo8q169HpYGyPlYvMRnPlWea28y55F958pWC2Qe/Ds=;
  b=hHGMsmZApZoYs9UeHkVtFC+GXK3rDCsDqbL4Mi0kl66TwiWKyD+OdO6G
   Cuxt/6BgU3EIHGMFuFenmVBwMMhcvolgeZIXpMekhGEbRUsPuOsEq18cW
   tMLxVTJB/1R3VZfF1w56tJff+/ry0JRUPcoJwWOfGxrjzRt2qXzOsYYd6
   lrLEGqyfJ7rHapGpNVehtRpcWHXWr/fZsYoMJlJPkeRA5Z3UPB002i3GY
   Wgb2+lk/vDm9+o7y1QID+Yc2MSd6E/ZL/ndM4cjAstAevAhxclHZf4agC
   oO+BPgHOObQdrC/G6xBs+rUILy0QpwU3ntCUo0BaL8lze+ryaXUh5cWLC
   A==;
X-CSE-ConnectionGUID: 8tPQ1wztSs+OGCWYBR4fmQ==
X-CSE-MsgGUID: LbPl9y6XRk2WadbH9GyicA==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="54364900"
X-IronPort-AV: E=Sophos;i="6.16,327,1744095600"; 
   d="scan'208";a="54364900"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 14:30:53 -0700
X-CSE-ConnectionGUID: eio/KNiYRPa76/w7rhqN0Q==
X-CSE-MsgGUID: ylAgvwAEREykxB/pmYMzSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,327,1744095600"; 
   d="scan'208";a="158330991"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Jul 2025 14:30:52 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udbcQ-000GK9-01;
	Sun, 20 Jul 2025 21:30:50 +0000
Date: Mon, 21 Jul 2025 05:30:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH] arm64: dts: qcom: sc7280: Flatten primary usb
 controller node
Message-ID: <202507210523.dlgqSc2w-lkp@intel.com>
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
In-Reply-To: <20250720072125.1514823-1-krishna.kurapati@oss.qualcomm.com>
References: <20250720072125.1514823-1-krishna.kurapati@oss.qualcomm.com>
TO: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Hi Krishna,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc6 next-20250718]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Kurapati/arm64-dts-qcom-sc7280-Flatten-primary-usb-controller-node/20250720-152310
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250720072125.1514823-1-krishna.kurapati%40oss.qualcomm.com
patch subject: [RFC PATCH] arm64: dts: qcom: sc7280: Flatten primary usb controller node
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: arm64-randconfig-051-20250721 (https://download.01.org/0day-ci/archive/20250721/202507210523.dlgqSc2w-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 16534d19bf50bde879a83f0ae62875e2c5120e64)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507210523.dlgqSc2w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507210523.dlgqSc2w-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4802.26-4875.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:154.29-157.5: Warning (unique_unit_address_if_enabled): /reserved-memory/video@8b200000: duplicate unit-address (also used in node /reserved-memory/memory@8b200000)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4077.10-4087.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc7280-idp.dtb: usb@8cf8800 (qcom,sc7280-dwc3): 'dr_mode' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
