Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E902B40BCB4
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jun 2026 13:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781183876; cv=none; b=kV8y5WgjYtzXS94tfBBrixDh37GA7qZC3h3rD9C+VhbYJ70g9xV/eGHNL4d7d8bsd14Q2kYjr/yp8+K8Ni2n604iECXx05k5osjFlhNjhGJmoGfn+n3zPGaWG/lH1LuUCIOVeLFo4VD+E8aDkRFDRNAH4mzay7BOHglhNtsYQos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781183876; c=relaxed/simple;
	bh=tQ+Dk1EboMrlCfjakOcdeiO8gF86V4aeO36fKMy0ju4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uUun9T3s/UjaCHvafDaVxSbRCgoMrmfyZmEpq9gRg2J03zxTsc0TTdHE74R3IrWmiWLmbyAxe17E6LGgGOR7OQ2vJY/ooqjSouy1JuTOmBegITE52V8vvAtQN5o+vs9x1zhUXxod9pJ+o/nxp5IQyAdG4QjhVmdmt3c9LHOA1Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C4ypFdpg; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4ypFdpg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781183874; x=1812719874;
  h=date:from:to:cc:subject:message-id;
  bh=tQ+Dk1EboMrlCfjakOcdeiO8gF86V4aeO36fKMy0ju4=;
  b=C4ypFdpg9kzJZrb8TJRQFGnlxYB5V3gNvkM4aHdNiHh4JUSi893hPZXk
   mm1Ek+JY5enhf8jb7pBrIyL508n2QA7odxXP25WV2ELiBmbyg7p4LZNgj
   tTFcH6JmP25bigghkZeei5hHFappZHNIPslJSLV6ohdVDBUwcrzmq+07r
   0LrtvTzLLzhCa5HDUWRlS8tTHV2eRiQvT0ZbowFfFi3V5yILp3kFkFq9T
   oOjqoeab7oDD2U9x80QjxQUotT8RfDgRzAoZPlbr0Q2i9yBNN07V+NzPk
   8uO+FUcxwFyzD8ufwPPwpO2T7at79axLtC8VqePoQtQaal96iHYrbPqVx
   w==;
X-CSE-ConnectionGUID: VhEJdEq5S/yN4n4iPo39vw==
X-CSE-MsgGUID: iVZfOM0YQsqLL98d4XDbyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92673877"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="92673877"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 06:17:53 -0700
X-CSE-ConnectionGUID: MAEm/AUsQm+sE70Tdiu3VQ==
X-CSE-MsgGUID: 268jGTadRv+1Xsl/9O1mMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="270492651"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 11 Jun 2026 06:17:52 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXfI6-0000000041l-0UMw;
	Thu, 11 Jun 2026 13:17:50 +0000
Date: Thu, 11 Jun 2026 15:16:56 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [superna9999:topic/sm8650/ayaneo-pocket-s2/wsa2-fix 5/5]
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dtb: /sound: failed to match
 any schema with compatible: ['ayaneo,pocket-s2-sndcard']
Message-ID: <202606111512.Szcxt1EY-lkp@intel.com>
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
TO: Neil Armstrong <neil.armstrong@linaro.org>

tree:   https://github.com/superna9999/linux topic/sm8650/ayaneo-pocket-s2/wsa2-fix
head:   074a0ec5e0e7c16933371ee131890bacbfee4fdd
commit: 074a0ec5e0e7c16933371ee131890bacbfee4fdd [5/5] WiP
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20260610 (https://download.01.org/0day-ci/archive/20260611/202606111512.Szcxt1EY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev10+g5d839523d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606111512.Szcxt1EY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606111512.Szcxt1EY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts:1250.29-1253.4: Warning (unit_address_vs_reg): /reserved-memory/lost-reg-mem: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts:1260.31-1264.4: Warning (unit_address_vs_reg): /reserved-memory/splash-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5694.27-5769.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5791.27-5847.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dtb: /sound: failed to match any schema with compatible: ['ayaneo,pocket-s2-sndcard']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
