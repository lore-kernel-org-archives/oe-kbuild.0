Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19A73E7166
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Mar 2026 16:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772814241; cv=none; b=SEsct5T8Yi00iSz9EJFqM2OpcnODKQoUAqi6jd7a4xBvsPQ4UZOC3jHvmPzGYOcuQoD1P01fqVz9feK7rA77Ss+IeR6QKT7G4j8GB1BVs+bcQSt88ePj+8PEj1AuA81Xv8S9EQnJmaWjb05sWENn0R/g115VaSwOWJtHZgAFcbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772814241; c=relaxed/simple;
	bh=cVdA0jDNaPq2JY+jHhWhj8kZIF7iPlc9/0NGE053+4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OFfFrOiB6JgMTXICZVi2jOculkJS6ls9GISKPyHOdQ9tppu22MACBYqH+Pi26LMXrLIFZQwQqqbxcWDpNu/TrV0qN/VknhbN2Q3ZZ+l1Z7xPwAItyuI9I4/CXmqDbOkQNojWA85R2twf6W0mepCbcbrbdplCquShBof3zLlgLv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kFmiyD74; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kFmiyD74"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772814240; x=1804350240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cVdA0jDNaPq2JY+jHhWhj8kZIF7iPlc9/0NGE053+4Q=;
  b=kFmiyD74zaGxdm6Xy+7+wSyzh8xu7z512ZlFeR7hQHdiBmLQFRtLIMjC
   pJehQD0k3tZl5npyifBSGY+U7fr5qaooNG50ZUXfVQHkXYXFkgp0MWTqi
   ZFBYlWfShfLCPLnGGqxpl0Lbzs6fXdDom8QYmFpykmnhdc0dNXE+fix/M
   wbdtBuln5CBniAXIfLPG+1+qlE1tG/q4VjggdsiWXM5Fc1js3c9v4FkOs
   bnX+E0Ma3m76DrU6gGorTT0c6OUqCCO7kpe7o5BBwVrqTvw3M5SpmJkwP
   IJ1aBzkSdq6K5aDqmupmdAYEWRUs+QDm748HiinNhL+X2hlrFH3yBbqtk
   A==;
X-CSE-ConnectionGUID: z52eYtTrQBmwEUcJOfnJMw==
X-CSE-MsgGUID: pGUPwYOQQuWDTwPJgm/06A==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73973312"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="73973312"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 08:24:00 -0800
X-CSE-ConnectionGUID: i6WPRTbpSryLhb7ixUlqeg==
X-CSE-MsgGUID: DH+coyA0TuqD+lFpE7qhHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="218283144"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 06 Mar 2026 08:23:58 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyXy0-000000002HB-003j;
	Fri, 06 Mar 2026 16:23:56 +0000
Date: Fri, 6 Mar 2026 17:23:27 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] arm64: dts: amlogic: t7: Add clock controller nodes
Message-ID: <202603061736.sEOsO9T1-lkp@intel.com>
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
In-Reply-To: <20260305074328.639993-4-jian.hu@amlogic.com>
References: <20260305074328.639993-4-jian.hu@amlogic.com>
TO: Jian Hu <jian.hu@amlogic.com>
TO: Jerome Brunet <jbrunet@baylibre.com>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Kevin Hilman <khilman@baylibre.com>
TO: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Michael Turquette <mturquette@baylibre.com>
TO: "robh+dt" <robh+dt@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Jian Hu <jian.hu@amlogic.com>
CC: devicetree <devicetree@vger.kernel.org>
CC: "linux-clk" <linux-clk@vger.kernel.org>
CC: "linux-amlogic" <linux-amlogic@lists.infradead.org>
CC: "linux-kernel" <linux-kernel@vger.kernel.org>
CC: "linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>
CC: Ronald Claveau <linux-kernel-dev@aliel.fr>

Hi Jian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on clk/clk-next]
[also build test WARNING on robh/for-next linus/master v7.0-rc2 next-20260305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jian-Hu/dt-bindings-clock-amlogic-Fix-a-typo/20260305-155008
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20260305074328.639993-4-jian.hu%40amlogic.com
patch subject: [PATCH 3/3] arm64: dts: amlogic: t7: Add clock controller nodes
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: arm64-randconfig-2052-20260305 (https://download.01.org/0day-ci/archive/20260306/202603061736.sEOsO9T1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061736.sEOsO9T1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603061736.sEOsO9T1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:306.34-320.6: Warning (unit_address_vs_reg): /soc/bus@fe000000/pinctrl@4000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:306.34-320.6: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl@4000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dtb: sram@f7042000 (mmio-sram): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
--
   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:306.34-320.6: Warning (unit_address_vs_reg): /soc/bus@fe000000/pinctrl@4000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi:306.34-320.6: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl@4000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dtb: sram@f7042000 (mmio-sram): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
