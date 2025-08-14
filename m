Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C981BCA0E
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Aug 2025 06:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755151578; cv=none; b=nHkwMO4ypMvSdqJc4V4lbar+igdTphpb15o/OM6DJVZTONqRWfEepkrPXn9Lsd2gCyQSIbJHQcBRdRambzGmILIH5kU6rCL//0Vz0myxp5DpKIj+P7jJbclqCJuR1DpMI3XFKOl28f/uzl7P4z0+VBztzCok1kpV6I+8jpHdOko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755151578; c=relaxed/simple;
	bh=jG6G3cFuLXwR4QAvi3WgwbyJMdTEh1AcmYmZItysOpg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DSa5glz4MxcOJcNohRU3Q0Lo1OtoWPGBO6j39iGIBXjhpBYwGWmKP0K84EoPWWHp6n3gJinAwBMdbYBya+eSeXRDr87bX3l/2CMZSPjrZbBethkrgmLeYvuFkO13L3F2mwKbO/WMUeDzPxI8smq+kAclEq9qE5RVKNQlAFdjdzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d+9ZLriJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d+9ZLriJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755151577; x=1786687577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jG6G3cFuLXwR4QAvi3WgwbyJMdTEh1AcmYmZItysOpg=;
  b=d+9ZLriJgVejtMEfY1S740kEwbk9eJhfzQc/RViTkAbIFon/jiQeUGjX
   M1+HinfLlYHnnhpUR6MaWq69fjAGvUEWQWsH7nYEnEwxjElRinRQ1Q0E+
   UWIx2FAq2KezXDxs/aA+W4VUWDSz3Xgoj6hj4wOKCPm+gNBIHeO0zI1Wx
   +7AdXpCvav1T/eLkTNCxyvFmK25dt6/hLgWHzu7BQaX9ntfLeWlNz0jXs
   nEKJdKgtRYsBoXiDuNshhIisgbGu0h37mZifuSHgsPlNZlpqa66jZMYKk
   DvbEnpGkQllbDhjDYVztE83+r7IPHWR75/I/xtDpEg6yaza/VYT3pPKlr
   g==;
X-CSE-ConnectionGUID: HfiQ9tV5R1SKHlV5PdpU/A==
X-CSE-MsgGUID: 8GNB8qlFSz2DX8kVbsHyhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57574053"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="57574053"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 23:05:04 -0700
X-CSE-ConnectionGUID: WgRZLxE7Tqqcp7b4oaGzKA==
X-CSE-MsgGUID: ezzkhnb7QtitrGV0x6HVXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="167048518"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 13 Aug 2025 23:05:03 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umR5A-000Adk-2A;
	Thu, 14 Aug 2025 06:05:00 +0000
Date: Thu, 14 Aug 2025 14:04:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 525/801] arch/powerpc/boot/dts/fsl/ppa8548.dtb:
 rmu@d3000 (fsl,srio-rmu): '#address-cells', '#size-cells',
 'doorbell-unit@400', 'message-unit@0', 'message-unit@100',
 'port-write-unit@4e0' do not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202508141357.WXRLYOH2-lkp@intel.com>
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
commit: d84c210c7583006ccc71ab7ecda997726bcecea5 [525/801] dt-bindings: powerpc: Convert fsl/fsl,srio-rmu to DT schema
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: powerpc-randconfig-051-20250807 (https://download.01.org/0day-ci/archive/20250814/202508141357.WXRLYOH2-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508141357.WXRLYOH2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508141357.WXRLYOH2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	['fsl,eloplus-dma-channel'] is too short
   	'fsl,eloplus-dma-channel' is not one of ['fsl,mpc8540-dma-channel', 'fsl,mpc8541-dma-channel', 'fsl,mpc8548-dma-channel', 'fsl,mpc8555-dma-channel', 'fsl,mpc8560-dma-channel', 'fsl,mpc8572-dma-channel']
   	'fsl,ssi-dma-channel' was expected
   	from schema $id: http://devicetree.org/schemas/dma/fsl,eloplus-dma.yaml#
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: pic@40000 (fsl,mpic): 'device_type' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,mpic.yaml#
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: timer@41100 (fsl,mpic-global-timer): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: timer@41100 (fsl,mpic-global-timer): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/fsl,mpic-global-timer.yaml#
>> arch/powerpc/boot/dts/fsl/ppa8548.dtb: rmu@d3000 (fsl,srio-rmu): '#address-cells', '#size-cells', 'doorbell-unit@400', 'message-unit@0', 'message-unit@100', 'port-write-unit@4e0' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,srio-rmu.yaml#
>> arch/powerpc/boot/dts/fsl/ppa8548.dtb: rmu@d3000 (fsl,srio-rmu): ranges: [[0, 864256, 1280]] is too short
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,srio-rmu.yaml#
>> arch/powerpc/boot/dts/fsl/ppa8548.dtb: rmu@d3000 (fsl,srio-rmu): reg: [[864256, 1280]] is too short
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/fsl,srio-rmu.yaml#
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000/message-unit@0: failed to match any schema with compatible: ['fsl,srio-msg-unit']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000/message-unit@100: failed to match any schema with compatible: ['fsl,srio-msg-unit']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000/doorbell-unit@400: failed to match any schema with compatible: ['fsl,srio-dbell-unit']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/rmu@d3000/port-write-unit@4e0: failed to match any schema with compatible: ['fsl,srio-port-write-unit']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: /soc8548@fe0000000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,mpc8548-guts']
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: power@e0070 (fsl,mpc8548-pmc): 'soc-clk@24', 'soc-clk@25', 'soc-clk@26' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/powerpc/fsl/pmc.yaml#
   arch/powerpc/boot/dts/fsl/ppa8548.dtb: pcie@fe000a000 (fsl,mpc8548-pcie): pcie@0:interrupts:0:0: 26 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/fsl,mpc8xxx-pci.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
