Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EAF1F09A5
	for <oe-kbuild@lists.linux.dev>; Sun, 12 Jul 2026 16:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783874086; cv=none; b=LCVo12674b9/Ujl7+U8eX40LTKQYe6tLU1hek0GYBo04VyO9OEkYrrVkeBbZahr2FKzcdC4g56zx8coa0yiWYSqdijwysq6iEYDnkEXVqKA4lO4+hS09Mh1dT3tf69bot2oP5xVJL4o8T7A2t0V+v+273C58sCX12vEmwJFFbgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783874086; c=relaxed/simple;
	bh=bL4oBpMptr+3ROiqeyW2QYR2wb17grZi6QnrhSr2iJU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gGXG82yulgM0n3AbrpIILynKGKR4vv078FNGX92videTtGWkjSRuJewYuK5WHQ1Z/EYcuK+xGkCdzm5KXoibJqKMcqjaqju6NwTJXLGul/BOv9oN617IiFJoYeIK1JeWYwrQ0mFGDRSVMxxthmh1SeY6KGLU7y9/z6Xt8rysaus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CBb+Ebhy; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CBb+Ebhy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783874084; x=1815410084;
  h=date:from:to:cc:subject:message-id;
  bh=bL4oBpMptr+3ROiqeyW2QYR2wb17grZi6QnrhSr2iJU=;
  b=CBb+Ebhyz9IgfqT8s9JB6hCZYzx/QHg7uACxDqgU6cvrsNQtr6jE38mK
   OoT5M9pi94gE2NktNBkry5O1AB+y7/keTfPbuOjMds/NGKLkrp/fbxaAv
   soOixAke54bRFC6eCNJlgEdM4scGdIJhw24mbmF/nD9cm6q7ziqo0j70m
   vLWFcIJdiHLGKTxjG9/02oR7fU3mNBW3f0UXJA7XfZe8AanPYkM5tzwDq
   9HcPAMJK48W9a2X/uHj7HePbUdPi5QAF0pjJoTSE4KAREWmMouorYuTvN
   l1y4UEbqJhYPn4Q2OH8ht3D307BNXgBjKQ6ec//Lau2x/0kCYwuR4ksLw
   Q==;
X-CSE-ConnectionGUID: THkEp+AUQ1SxzoJ7BcsNtQ==
X-CSE-MsgGUID: ArZ+jD88Tu+YjSQ4iYkCOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84380283"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84380283"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 09:34:43 -0700
X-CSE-ConnectionGUID: cBHycIC3RlGt7UYqxMp7Yg==
X-CSE-MsgGUID: GjQiExSxSvSjqugogGAP9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="285429486"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 12 Jul 2026 09:34:43 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wix8a-000000003Yb-1BTD;
	Sun, 12 Jul 2026 16:34:40 +0000
Date: Sun, 12 Jul 2026 18:34:34 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.3 216/217]
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dtb:
 /soc@0/geniqup@ac0000/i2c@a90000/power-sensor@40: failed to match any schema
 with compatible: ['ti,ina232']
Message-ID: <202607121824.iA1c3yv2-lkp@intel.com>
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
TO: Loic Poulain <loic.poulain@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Dmitry Baryshkov <lumag@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-7.3
head:   ab07ee0b1b29ce2672ae3b9ca208033c3ada12c2
commit: d1a0ecc10621e8daa1ecb3feaf4747224e71d61c [216/217] arm64: dts: qcom: monaco-arduino-monza: add ina232 power sensor
:::::: branch date: 84 minutes ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-2052-20260712 (https://download.01.org/0day-ci/archive/20260712/202607121824.iA1c3yv2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607121824.iA1c3yv2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607121824.iA1c3yv2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/monaco.dtsi:2306.4-2309.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:2306.4-2309.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:2306.4-2309.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:2306.4-2309.30: Warning (interrupt_map): /soc@0/pci@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:2484.4-2487.30: Warning (interrupt_map): /soc@0/pci@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:2484.4-2487.30: Warning (interrupt_map): /soc@0/pci@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:2484.4-2487.30: Warning (interrupt_map): /soc@0/pci@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/monaco.dtsi:2484.4-2487.30: Warning (interrupt_map): /soc@0/pci@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/monaco-arduino-monza.dtb: /soc@0/geniqup@ac0000/i2c@a90000/power-sensor@40: failed to match any schema with compatible: ['ti,ina232']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
