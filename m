Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D3E946A
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Aug 2025 04:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755233500; cv=none; b=h3ycxokuYD+zCz6zDceFFP3xjJlXtFBLezoS7m+msUB+T/Kwe1GBZszJYDMV4D9SGiOSovG4cYcAReIjy84A5bJbKXxLd9q0qcxgT8iknilM5KZ+qsQN21+qkDrt1habgcMa2drKJdM0W32m57IpKTBTej0pp6sm7+9Ngt/beDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755233500; c=relaxed/simple;
	bh=eiixfCxQSUe3za4lNIjljdaZy1YC80uD5Oo7JtMipRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nMJyQbA6Qvmj9+PmwppjUV4tFvfRoaqb/hYko1fnGDNXyZWeoogKw7tbYcj2WBnw+fOtahIXUl1lcKeji1q4tlsPhai0QchJS98nR3RivfkdMZn0810I4ejD66i7Mb1ESSc9Vg3AWpUrUr5yTrAeU8b1frM7Rs2lcii7I3Bhosw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lDZT0iZF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lDZT0iZF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755233499; x=1786769499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eiixfCxQSUe3za4lNIjljdaZy1YC80uD5Oo7JtMipRc=;
  b=lDZT0iZFS2aiJY/kBD0eQXeCnyaeSI4NWR7rr2rPvCdvOXwJODlaMhAT
   G0N3tFDY3CPEwi99Q11+vcE6ylGqvw+1mNDPwsgZLlw8L3dAY/+qHtFyy
   k7F/LEDmjGkCsjydF3qNPe5nOl6p7cXY8/R/56ZAGq5hd+fWKWjEyHWS/
   ndJ/62LcvVvJ+S74mOLj1J/e7WQhYI4RW22D/w6+RDHZi8o94KHUNvW4V
   wt5wzoUlDW1pxedB9w36jIY5lrKgG+aLUg9xd7E/heVzZ5XAI9xX7xUhm
   bQZcqYruaZHAq16wdfjJoFJke+q3kZ3E9x0IpScBcQjhrEHEbGrksTz6c
   A==;
X-CSE-ConnectionGUID: Bni2kyMPQtiOCrX82jttYQ==
X-CSE-MsgGUID: oOQkmBjcTsCApZYteLKwvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="67827711"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="67827711"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 21:51:32 -0700
X-CSE-ConnectionGUID: M5z2me5nQl6JmnoGWR85Og==
X-CSE-MsgGUID: RnxpYfGsTHO5xYphlTEltA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="166565396"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 14 Aug 2025 21:51:31 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ummPH-000Ba0-2o;
	Fri, 15 Aug 2025 04:51:23 +0000
Date: Fri, 15 Aug 2025 12:51:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 573/801]
 arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: pbias_regulator@230
 (ti,pbias-omap2): compatible: ['ti,pbias-omap2', 'ti,pbias-omap'] is too
 long
Message-ID: <202508151226.14NBSgcK-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: dc5ecafbf01ab011788c3643d871b4f3d6306414 [573/801] dt-bindings: regulator: Convert ti,pbias-omap to DT schema
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250815/202508151226.14NBSgcK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151226.14NBSgcK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508151226.14NBSgcK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: scm@2000 (ti,omap2-scm): '#address-cells', '#pinctrl-cells', '#size-cells', 'pinmux@30', 'ranges', 'scm_conf@270' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/omap/ti,am3-scm.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: scm@2000 (ti,omap2-scm): clockdomains: {} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/arm/omap/ti,am3-scm.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: scm@2000 (ti,omap2-scm): compatible: ['ti,omap2-scm', 'simple-bus'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/omap/ti,am3-scm.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: scm_conf@270 (syscon): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: scm_conf@270 (syscon): $nodename:0: 'scm_conf@270' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: pbias_regulator@230 (ti,pbias-omap2): compatible: ['ti,pbias-omap2', 'ti,pbias-omap'] is too long
   	from schema $id: http://devicetree.org/schemas/ti,pbias-omap.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: pbias_regulator@230 (ti,pbias-omap2): reg: [[560, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/ti,pbias-omap.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: pbias_regulator@230 (ti,pbias-omap2): 'regulator-name' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,pbias-omap.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: counter@0 (ti,omap-counter32k): reg: [[0, 32]] is too short
   	from schema $id: http://devicetree.org/schemas/ti,omap-counter32k.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: counter@0 (ti,omap-counter32k): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap-counter32k.yaml#
   arch/arm/boot/dts/ti/omap/omap2430-sdp.dtb: gpio@4900c000 (ti,omap2-gpio): #gpio-cells: 2 was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
