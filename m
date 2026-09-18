Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB7E27A907
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Sep 2026 04:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789707236; cv=none; b=FdUi/d9EbJdA6jeg6HzKVRvjvAUk9XiXr8+6Ms7SfYYlHqeTk7etymA6t6J29WrO9K98NCUKYHNINiO+/bTrkdd01tf6/nZZbaXsGkofDKZLnrnD8kEAECYTrJHaYroCYVeoY21KbI6Om6pELA+rgFhaSMi6tnD16bISXyWB8pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789707236; c=relaxed/simple;
	bh=DAGbuyNTUc/2hKyVv3tmO3PYsIHhJpfoonvRpSTa9wg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XNjrh81Hby7Ok2q37zBomjOZCjj67Oj6Rk4P1s19yDSV8np0gndQIBFFLBMse5PNEGjMiAahBxbPFYEh8wcEJrgXIPA3/Eay09p/RfkUF26W39oE8ZMLyYSqMBaMzHUWyZV6xFYrW0Ggl8rmguu2Y0Orpfh19KD62EhA8uKNa3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VZB8T4s8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VZB8T4s8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789707234; x=1821243234;
  h=date:from:to:cc:subject:message-id;
  bh=DAGbuyNTUc/2hKyVv3tmO3PYsIHhJpfoonvRpSTa9wg=;
  b=VZB8T4s8gErk1t2MScOU063U05q0C5dhFWoQXpAvYeMnropFMNd2niye
   5WsvYncICRWLoRsKSTmcQ5oL+yuUPpZtlXbt+gFEw28xrqmMuiveNqDbh
   2Xbt3wXF2aphWRfrZ4RXoRtebD61gD9hB4lYI/tn5rfnSg06xh8RB+Sir
   uVQhc44K+wg3a/SwRJOuEWGxWzAUxEA+98bCjwn+C0NUc7iqMP8ZGo2/v
   7Pm4SHpCjulOyQ+0tr1DFMs/IvDUxyxWHReVAVtveTOGZkFHOvSVFZw06
   QfXp+MjLAhybUgXjxRQAWVVomOtyBgyGpZGhk2K6gnywNgHG4jItSmRTx
   w==;
X-CSE-ConnectionGUID: dNi4W43LSKWqNZjugcgz8w==
X-CSE-MsgGUID: cC+44iQuTrKCXEM9P5PDQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100784988"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100784988"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 21:53:49 -0700
X-CSE-ConnectionGUID: b3PvRUlqT1yxsAj8C+hJcQ==
X-CSE-MsgGUID: HCES7q45QEmxI9qkEKEGdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2426671"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 17 Sep 2026 21:53:48 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7Qba-000000000z8-04rA;
	Fri, 18 Sep 2026 04:53:46 +0000
Date: Fri, 18 Sep 2026 06:53:23 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb:
 /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible:
 ['aspeed,ast2600-lhc']
Message-ID: <202609180625.NPn84cdC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Peter Shen <sjg168@gmail.com>
CC: Andrew Jeffery <andrew@codeconstruct.com.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5a051f6b840d48f159166ef073d3021989bfb50
commit: bc83b7353d2bfefba73193335bacc3542d8a7ae2 ARM: dts: aspeed: Add Facebook Anacapa platform
date:   8 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-2054-20260914 (https://download.01.org/0day-ci/archive/20260918/202609180625.NPn84cdC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609180625.NPn84cdC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bc83b7353d2b ("ARM: dts: aspeed: Add Facebook Anacapa platform")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609180625.NPn84cdC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/mfd/aspeed,ast2x00-scu.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: /ahb/apb/syscon@1e6e2000/smp-memram@180: failed to match any schema with compatible: ['aspeed,ast2600-smpmem']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: adc@1e6e9000 (aspeed,ast2600-adc0): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: adc@1e6e9100 (aspeed,ast2600-adc1): 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/aspeed,ast2600-adc.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: crypto@1e6fa000 (aspeed,ast2600-acry): 'aspeed,ahbc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/aspeed,ast2600-acry.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: crypto@1e6fa000 (aspeed,ast2600-acry): aspeed,ahbc: b'\x00\x00\x00\x17' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dtb: /ahb/apb/lpc@1e789000/lhc@a0: failed to match any schema with compatible: ['aspeed,ast2600-lhc']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
