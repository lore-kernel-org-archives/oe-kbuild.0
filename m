Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8772D39659A
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 14:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261430; cv=none; b=lm5M9SHWHXxN0K4FNOClucYyPH01Fbg9fqMqEXE2sbuMLZ3+5OhLtGb2GVFC2JfIA4kU3cMl2h24NrLSHES0TYd4t1ChD86boHJuQXHm9YwR1K8htuKLNlcgaREsERLJKDcBcvqTD/oWgFO7oX+yIEgRIv4TNhnxe/efNTfKTzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261430; c=relaxed/simple;
	bh=7uMXN6YvB9A4tXj7CX9v2ZCg6F+HcFtIuTtEzSLqmRU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Gi5Xg0vPT1uWJachDbKHwdml/ijAJfOM7hPYZBVQRCGD+0ih1JCPXciHrgNQ5QqvYgqH1gKaSR6FEuw/a8Hvgi7C9G6w7c3w3bBYza+FI3pXbmYDO6hbBOq2WbHBSQcC17yYzQVvSxVVXQz/RcLCjQhRMx5M4UxgDAcH4UWH5WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BPzQxdpz; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPzQxdpz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790261428; x=1821797428;
  h=date:from:to:cc:subject:message-id;
  bh=7uMXN6YvB9A4tXj7CX9v2ZCg6F+HcFtIuTtEzSLqmRU=;
  b=BPzQxdpzxbgvtTNOecE9702ck+B9zGgJgSDLsE8V6DiOc3NxssakUbbg
   mmDRehDIOpPIJCmW7Wdis8eHBFGn0C2j+QN5QmvgGOIq3ugMCctfTRWHQ
   TXfPM4f4laQUvhcyr66VA6nGM+eLiPdXrAov5jvRMRFx7fDD1CE89CDce
   Wh/G5qhFWHmftmzfWR6IBWxlymjaG1ntHpZkfB2tux+Krgh9WZiSVvW7V
   mxuUjBAJuKC0tMxJpW/jR9rjdzilHsYIh3nlKnGjmndnVu/VeRzPlDPxt
   nmtY6m1k2DgNv+dSmpX1J+khs7FW7nIUD3FhuyNb0YCTKxZFdiizHA5bv
   w==;
X-CSE-ConnectionGUID: QBB7FVDGS1C4mvMy8xQmiw==
X-CSE-MsgGUID: iTwD+fz/RNut8lhw0G0rcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="100372667"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="100372667"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 07:50:28 -0700
X-CSE-ConnectionGUID: 7hY5WdjmRdq1qAVySE6kEQ==
X-CSE-MsgGUID: LkswgDv8RMaIMBa4pNZzeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="277805803"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 24 Sep 2026 07:50:27 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9kmH-000000000Li-0lSt;
	Thu, 24 Sep 2026 14:50:25 +0000
Date: Thu, 24 Sep 2026 16:50:13 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb:
 clock-controller@8817000 (allwinner,sun55i-a523-cpu-ccu): clock-names:4:
 'pll-periph0-600m' was expected
Message-ID: <202609241601.XkRRSEQS-lkp@intel.com>
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
TO: Andre Przywara <andre.przywara@arm.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Andre-Przywara/clk-sunxi-ng-generalise-update-bit/20260918-003909
head:   ba8232e01e566f29f719c4672ce4d39a320f9b4c
commit: ba8232e01e566f29f719c4672ce4d39a320f9b4c arm64: dts: allwinner: a523: add CPU clocks
date:   7 days ago
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-2403-20260923 (https://download.01.org/0day-ci/archive/20260924/202609241601.XkRRSEQS-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241601.XkRRSEQS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609241601.XkRRSEQS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1169.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: clock-controller@8817000 (allwinner,sun55i-a523-cpu-ccu): clock-names:4: 'pll-periph0-600m' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun55i-a523-ccu.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1169.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: clock-controller@8817000 (allwinner,sun55i-a523-cpu-ccu): clock-names:4: 'pll-periph0-600m' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun55i-a523-ccu.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1169.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: clock-controller@8817000 (allwinner,sun55i-a523-cpu-ccu): clock-names:4: 'pll-periph0-600m' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun55i-a523-ccu.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:117.6-1169.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: clock-controller@8817000 (allwinner,sun55i-a523-cpu-ccu): clock-names:4: 'pll-periph0-600m' was expected
   	from schema $id: http://devicetree.org/schemas/clock/allwinner,sun55i-a523-ccu.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
