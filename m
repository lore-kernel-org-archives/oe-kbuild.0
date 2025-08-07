Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2BA252287
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 12:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754571314; cv=none; b=b4w07Sil671lmrvrW4HJLvgxp2G7X/soSLxlOBuCzl44odYturADMTVoy/rfKChovxPef1NFyIsqzu9BmABcjKFhyuZ3jsAgzXvSs/cZTJ3sazVyRXjeZ2l0Wk3v2TeJ20ya3NTq+eW5wHBHV6Y8VW57K2vTmiyuJccnncABw7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754571314; c=relaxed/simple;
	bh=vu0uZp5bOjxrskIckemG+7k+ifHtgLWm7ON+oPAI8q4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ThaUJPHIrsO0GMCXGQi7jKKbCBWa3wCjZOEnCIHkfgqA1imDV6RRNK17lcCN3oSg8HZDVYgJMPfkirpLfKfzwrijecyntPjgeB8Jy1wCcF50GEK6hOOml4Bdf/AnBaM4JMT6d0xgjN7A81glwdlDel6JitloE8vzX8kHngjnIOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g59TF7yl; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g59TF7yl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754571313; x=1786107313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vu0uZp5bOjxrskIckemG+7k+ifHtgLWm7ON+oPAI8q4=;
  b=g59TF7yl2BA1gy2VLuHuEeAsi353wt0KbbqV935UaNLWcjJTpkWgROUd
   CNJ3/9Sru2pUMYWUw/4TiKKPnlVF+lv6c8rdb4DQdWin9ivKoJ43Q9YHk
   xPL8qahVII4c01jinS8iLoDCSdL5jqaRGN/6PDPdLQAF4Ov5TPHOw/6Pr
   M/bSi8sIUkqLGnmmXxMVOhCPJsqyXqyDt5/Fo0Q3c+g5huQg30zaYTqsd
   FbHksG/fdvaFi+nTCDcKkO1mMRf3B8sw/Vt1eq86LBrXs3JjOTHZJAPnG
   EWUlJOHV6FOOtPtYJ/rOHNom4/gpMbzLzP/omf9p37O5jhPeF5utFMUyK
   w==;
X-CSE-ConnectionGUID: dWQCWf6FSg+UKIueCrHcDA==
X-CSE-MsgGUID: BMhBC8k2S1Cn6epgAkZn9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67982080"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="67982080"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 05:55:12 -0700
X-CSE-ConnectionGUID: DKDtzYLNRtKUKKYGQWjP/g==
X-CSE-MsgGUID: HjACKnmrSvuXfADyU1u8Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165063074"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 07 Aug 2025 05:55:11 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk09E-0002ne-1n;
	Thu, 07 Aug 2025 12:55:08 +0000
Date: Thu, 7 Aug 2025 20:54:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 246/801]
 Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: isel:
 missing type definition
Message-ID: <202508072049.a0wTM4mt-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: ae2d1cc58b85d709605f59650042c53be180139e [246/801] dt-bindings: leds: Convert backlight/ti,tps65217 to DT schema
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arc-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250807/202508072049.a0wTM4mt-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508072049.a0wTM4mt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508072049.a0wTM4mt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/iommu/nvidia,tegra30-smmu.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/dma/ti,edma3-tpcc.yaml: ti,tptcs: missing type definition
   Documentation/devicetree/bindings/dma/ti,edma3-tpcc.yaml: ti,edma-reserved-slot-ranges: missing type definition
>> Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: isel: missing type definition
>> Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml: fdim: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,short-detection-threshold-volt: missing type definition
   Documentation/devicetree/bindings/leds/backlight/skyworks,sky81452-backlight.yaml: skyworks,current-limit-mA: missing type definition
   Documentation/devicetree/bindings/display/smi-sm501.yaml: edid: missing type definition
   Documentation/devicetree/bindings/cpufreq/operating-points-v2.yaml: opp-supported-hw: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/opp/opp-v2-base.yaml: opp-supported-hw: multiple incompatible types: uint32-matrix
   Documentation/devicetree/bindings/arm/vexpress-config.yaml: arm,vexpress-sysreg,func: multiple incompatible types: uint32-array
   Documentation/devicetree/bindings/hwmon/vexpress.yaml: arm,vexpress-sysreg,func: multiple incompatible types: phandle-array
   Warning: Duplicate compatible "operating-points-v2" found in schemas matching "$id":
   	http://devicetree.org/schemas/cpufreq/operating-points-v2.yaml#
   	http://devicetree.org/schemas/opp/opp-v2.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
