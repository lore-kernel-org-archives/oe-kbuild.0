Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DF2238166
	for <oe-kbuild@lists.linux.dev>; Fri, 22 Aug 2025 09:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854586; cv=none; b=jli/p10v9aZyyUo9WTo9Qt9Wi7ZA8yaM3W10f3Y9iYIqcrx7jRbBJTSAxAGgeQpg0RxXi2qYfv53SZaECUgyCfwehWJkFHLmx0t+xxFxNY2IikufA28+PORfVWDVem2DopGgL20jXFN6QvNZAnQDOC7Rr55eksV+Nh+Gs4lbBKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854586; c=relaxed/simple;
	bh=kijB9fVZHWtOw8URg73JaId7x/KeMwzgwOVlPzdhUpg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=enj9GL2n/rntRhSTU9FOgyshY2qZRibdTI0poswseBEhv/mdPpN66s6/VRl7sxJsC2LhGoHp22DGyyoGrgb07JBm57ZjMwousNtPR0Q2kRZQjgYlzRhj3wKMPty6BXEnUTilOzYCUv8Ev7UeBTpYKslVgkHNCsZhW1lweReMKuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MdBnFu8/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MdBnFu8/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755854584; x=1787390584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kijB9fVZHWtOw8URg73JaId7x/KeMwzgwOVlPzdhUpg=;
  b=MdBnFu8/QXJxkQNWcVwZGLMlgst6Qb0iQkAE46Ck2zxvQ9/bf8kLAD09
   jSdSS7xofD0L1Kbc7YKedG6cRDO1foioa/s/HxvqqrmrRPUyC2KrNOFjl
   bmZVTsvtEtvT8IDWOxyFjN9IwMQjvixDcE0VgjA0LKg/9HBbiVcAyi87b
   OXBfG7NBBcfJlGh/XkJs/ZFHwbaL+aoBG45Ts1NXNcTuXYTgPd6FmoRfy
   DQ0PmUoAhyCpBt5zJ3TLUDsEY0ixMRfFAyG3iU9mKawnPD4ty6Y7j5JW6
   mMiZSkJ0V2xFzEJ7Q38BaXIihR+6IWOm6zSnnEUduVY3c1Bin1IbGx0st
   A==;
X-CSE-ConnectionGUID: a5E/34T5StqgDBbDanzT9Q==
X-CSE-MsgGUID: pCfnyGZCQleS8+1Z+gOMQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="75741233"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="75741233"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 02:23:03 -0700
X-CSE-ConnectionGUID: prE52LMUQEaSgdySF9KCnA==
X-CSE-MsgGUID: PgHf4wIMTN+nP9DJJmTPPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="167905373"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 22 Aug 2025 02:23:02 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upNz9-000L6x-3C;
	Fri, 22 Aug 2025 09:22:59 +0000
Date: Fri, 22 Aug 2025 17:22:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:sm8750/visense-cps-testing-on-top-of-sm8750-audio-lpass
 21/76] arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: usb@a6f8800
 (qcom,sm8750-dwc3): clocks: [[36, 11], [36, 156], [36, 3], [36, 161], [36,
 158]] is too short
Message-ID: <202508221721.R3RWvlKk-lkp@intel.com>
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
TO: Wesley Cheng <quic_wcheng@quicinc.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Melody Olvera <quic_molvera@quicinc.com>

tree:   https://github.com/krzk/linux sm8750/visense-cps-testing-on-top-of-sm8750-audio-lpass
head:   ffb2a13619fdca58779259a6a7f8eb5f710fdaa4
commit: 83abfce538041d2a7f66f69ae18340f27fab0430 [21/76] dt-bindings: usb: qcom,dwc3: Add SM8750 compatible
:::::: branch date: 19 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250822 (https://download.01.org/0day-ci/archive/20250822/202508221721.R3RWvlKk-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250822/202508221721.R3RWvlKk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508221721.R3RWvlKk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8750.dtsi:3115.27-3178.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: /soc@0/phy@1c06000: failed to match any schema with compatible: ['qcom,sm8750-qmp-gen3x2-pcie-phy']
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: usb@a6f8800 (qcom,sm8750-dwc3): clock-names: ['cfg_noc', 'core', 'iface', 'sleep', 'mock_utmi'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: usb@a6f8800 (qcom,sm8750-dwc3): clocks: [[36, 11], [36, 156], [36, 3], [36, 161], [36, 158]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8750.dtsi:3006.27-3093.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8750.dtsi:3115.27-3178.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2766.34-2767.8: Warning (graph_endpoint): /soc@0/phy@88e8000/ports/port@0/endpoint: graph connection to node '/pmic-glink/connector@0/ports/port@1/endpoint' is not bidirectional
   arch/arm64/boot/dts/qcom/sm8750.dtsi:2867.31-2868.9: Warning (graph_endpoint): /soc@0/usb@a6f8800/usb@a600000/ports/port@0/endpoint: graph connection to node '/pmic-glink/connector@0/ports/port@0/endpoint' is not bidirectional
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: Warning (graph_child_address): Failed prerequisite 'graph_endpoint'
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: /soc@0/phy@1c06000: failed to match any schema with compatible: ['qcom,sm8750-qmp-gen3x2-pcie-phy']
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: usb@a6f8800 (qcom,sm8750-dwc3): clock-names: ['cfg_noc', 'core', 'iface', 'sleep', 'mock_utmi'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: usb@a6f8800 (qcom,sm8750-dwc3): clocks: [[36, 11], [36, 156], [36, 3], [36, 161], [36, 158]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: clock-controller@aaf0000 (qcom,sm8750-videocc): 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
