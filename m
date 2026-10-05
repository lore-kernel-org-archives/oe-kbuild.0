Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F34B411F99
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Oct 2026 21:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791235846; cv=none; b=SwYv3hd4wUqzn/5o+HvmBvWxTMNKU2zQsJoEFYfeRQ7+l/qzPZuha7Fa0+sNHrZjkz0/DFf9Rnqo3Nsrw/vxmyRk0sIUMqcMMhWCVPnr4FSWQwF7oFhy4/5JG9Ix2W45Dd/aaPOSL69C7FnEC+VFDkEkuTeAszjqsoRyNqf5+6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791235846; c=relaxed/simple;
	bh=uvd6zofPB2IaaldobGnSSmhoAYzU1wmEl3Da92Uabdw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gGMWG5LDEHv14YV+YbCW7XoWkWihGoJ0X9lAhIw0Y7D7k05zWXkR7UDHnhMHmxMuaDxkn65F9gMelF/bmmfzHn0OPfUmw/uAfGS8ZLh1Dwl4HoCK/sofhacejNbc/y8e7uMj6SA5VY45IRjylvjUdtDklGdwZXwWHSvHJb3iDGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQFD4xle; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQFD4xle"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791235844; x=1822771844;
  h=date:from:to:cc:subject:message-id;
  bh=uvd6zofPB2IaaldobGnSSmhoAYzU1wmEl3Da92Uabdw=;
  b=KQFD4xleHCAZbzV8C40XngnrTb3psFlpt/I1L3vwN6PicaF1Z5edVrY1
   o5YTz6gUdMMGJgKR7OqN3G6IW4sQu7U73jyyUk46RzZ4Nat4I0cLYvij+
   xLlklJHvyKlrAstNRfvV0Y3pZMCFfmZ26hB1Kn5bYlb4dFhdpKfJ2F9Vd
   XK3M7J67IilKB/hOL40DYmyaQJYZGwE4nwBAIn+MmdLvuHqsk+1BrGJWF
   P0+cv0HgEb2zpml9UjR1Dt6eTmSKVS2O2uvVNSVBzzyzGmQ1gz9pXbyBy
   uX1T+vWzU1W9bKkQlUnX8K2BtwvHJyW9De4OB4xD2YtqRSxjVUyVMA4Z3
   A==;
X-CSE-ConnectionGUID: K9SeAabQQQ2rrhSZe7Ud+A==
X-CSE-MsgGUID: 7qehBsEwQE+a5y0/xU7spg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102438358"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="102438358"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 14:30:43 -0700
X-CSE-ConnectionGUID: ZFHFuIzQQrqwrghew/7pVw==
X-CSE-MsgGUID: d3dM9hQsTtmjR/RTQ/boPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="280212934"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 05 Oct 2026 14:30:42 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDqGe-000000000K3-40V3;
	Mon, 05 Oct 2026 21:30:40 +0000
Date: Mon, 05 Oct 2026 23:29:42 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/mahua-crd.dtb: thermal-zones:
 'ec-back-cover', 'ec-keyboard', 'ec-soc' do not match any of the regexes:
 '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', '^pinctrl-[0-9]+$'
Message-ID: <202610052308.ew7bLc9K-lkp@intel.com>
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
TO: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Anvesh-Jain-P/dt-bindings-embedded-controller-qcom-hamoa-crd-ec-Add-thermal-sensors/20260928-120637
head:   336d6db9b8459aee9298b06c6d8a3b98784da5a3
commit: 336d6db9b8459aee9298b06c6d8a3b98784da5a3 arm64: dts: qcom: glymur: Add EC thermal zones
date:   8 days ago
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-randconfig-2402-20260930 (https://download.01.org/0day-ci/archive/20261005/202610052308.ew7bLc9K-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610052308.ew7bLc9K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610052308.ew7bLc9K-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: thermal-zones: 'ec-back-cover', 'ec-keyboard', 'ec-soc' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
--
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: thermal-zones: 'ec-back-cover', 'ec-keyboard', 'ec-soc' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
