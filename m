Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAE221ABC9
	for <oe-kbuild@lists.linux.dev>; Sun, 10 May 2026 13:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778420629; cv=none; b=leZzSDJSI4K/4rRmwqTEyVffD3BlP5k9uA8cpFl5v3QDt2cKOpInL+ddk8AR1YXHW2iwnA/1RGArQAellfmGIohlEllw/T9zyvdtOtGxxC9Ik9DgJMjg4VIYzJwO+BhqSMOzIRDF7Z9uPYhHB7ZKfqoVY/1mmp1xvmLELfn2DIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778420629; c=relaxed/simple;
	bh=Xl3fgrhUMcoHLV1gLACeDfh7s0S87mhUmWutAZ3jFzg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WDES9jSvzwKmSQU5m+M6kaEaSGkAyz60zgw18DnSL8bnT5i9nc2dv44MeKRmBeKmkHIHlcEClhHCivAW5YR+OetmI97Cb9f4UH0EmKhvt73g5QY9TE6P79UOLw5RKoo6JQirbOGBzBp88/I993l6kOZCqeQZpBP3sf3O7Q/L0u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IzVioMlG; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IzVioMlG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778420627; x=1809956627;
  h=date:from:to:cc:subject:message-id;
  bh=Xl3fgrhUMcoHLV1gLACeDfh7s0S87mhUmWutAZ3jFzg=;
  b=IzVioMlGc+rnVbr7kOpWIcJT6QqaEzKgJsh5578D/q95TkbFo8M/JX4U
   oxbQcr2AX7w3wMqGo+TR9FuD/aej/Xj3BCWXIfmGIph10Xi7wr+FuqaUi
   s4BkxDXntU17+sPFMAN3bvxQFeDaPnPOc4zqzMLMH0Gl7QIplMQMPzZ5j
   x3icrX5u09y6jJchZvyyIMXHnX4JsgabvW8cKAfyI2cUmRs1cfmu5WWL5
   Fx6ItpWcEz8wlK2asE1AXLLMTNbrzYC75MC6+2IvV42A/R7HDzkqAR439
   milhe3TwbFEI28CtuvRTfxkMy7vt10P0KA9MOxiwtSSG4aUcVSFGyFwww
   A==;
X-CSE-ConnectionGUID: GS+OUquSRzi+/M35MxI1xg==
X-CSE-MsgGUID: 11hfJRC2Qsi7kZDEkvmtMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="82943046"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="82943046"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 06:43:46 -0700
X-CSE-ConnectionGUID: DemBqEkVS4mZ6kd78hmycw==
X-CSE-MsgGUID: pNVavTkQRS+H0WjH+ezrng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="232745903"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 10 May 2026 06:43:45 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wM4Rb-000000007jV-0vqn;
	Sun, 10 May 2026 13:43:43 +0000
Date: Sun, 10 May 2026 15:42:48 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.17 44/89]
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: /soc@0/camss@5c6e000: failed to
 match any schema with compatible: ['qcom,qcm2290-camss']
Message-ID: <202605101538.bfZORIQv-lkp@intel.com>
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
CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.17
head:   dc7e5b210a6b29287c1dae7197863d54e13615bd
commit: 2b3aef30dd9dfd6cd2de3026126413a30028b850 [44/89] arm64: dts: qcom: qcm2290: Add CAMSS node
:::::: branch date: 10 months ago
:::::: commit date: 11 months ago
config: arm64-randconfig-2052-20260428 (https://download.01.org/0day-ci/archive/20260510/202605101538.bfZORIQv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605101538.bfZORIQv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605101538.bfZORIQv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1834.27-1907.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1792.11-1802.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: /soc@0/camss@5c6e000: failed to match any schema with compatible: ['qcom,qcm2290-camss']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
