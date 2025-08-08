Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04FA23CB
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Aug 2025 01:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754617573; cv=none; b=lUvpXzo8Ct1w+H0aG4JOrMOdjGqbZOYim21cSLTt8iirvdmJqb0+QRR+S35IzKdG3WPTfqjhLOhxGIrdqzFf6PaQTjhNf1/BRbHWYoayNmEtFF9PPK65lBz9INIaLVLihdYji0YP6q8cb0EVHLj7BPkdfoOyvLVJugkhX3VpTr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754617573; c=relaxed/simple;
	bh=MrZR2kMml5PrxvRtMIj9nPObnfRIgZGwV7FsZbEwOyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RjInIWfzPTL1t0KlBQvxvJfxnacjuHoiYczIJs7XbGb3bOLjuBho0PNTqcZRxchVx0ZZrz8jQji+Ea0ZprxF7dnmjfFGRuxYQBFH53oZBOSsCnNVDMRPAOUnsPUbXmI6s5yGOEWAwNLt8SI8cs+7PQLAYpWaI54VIOnaZe00nu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cetISZ+t; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cetISZ+t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754617572; x=1786153572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MrZR2kMml5PrxvRtMIj9nPObnfRIgZGwV7FsZbEwOyc=;
  b=cetISZ+tchee/w0oQpje0T4c0wrNHwkwBRmKpHudV5KruQ6gYq9OQgFx
   Xwwi9lTmnCOOj7V1cbJ7RxdJNt+KYJoq18iQdbIBisHbr2iPtxyIFywRv
   WqPCITaM/omN3TCmtQtJjxW5Rb//+8mt5V3K+RIFsckBfBRNB1AGQnvo4
   rwr/ydaa4LHjYvtAMeNhJGSiYqqZBUycrxstaEKFv0QMdtkRBTh942Jkc
   fdrBmPeu2pLivymA1M/vBjtWjSoxQ168wYikLNgd4+pqhwT/KQZSzTxZH
   UkSe6FN1T3LUoTzBPPSzAA/S9gSIGIbrhwqaYvwsWAEmVdAh379qQCYP0
   w==;
X-CSE-ConnectionGUID: s8cLCZ+DQ2OHJ4WEGLjQ+Q==
X-CSE-MsgGUID: zBge6SE9TBWS+WHSmHFXjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="68335578"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="68335578"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 18:46:11 -0700
X-CSE-ConnectionGUID: wGVEl+dtQYWr8QHSx5w5vA==
X-CSE-MsgGUID: uQbnwcXvRgCsLZ1VKzJ54Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="166005416"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 07 Aug 2025 18:46:10 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukCBM-0003RC-0G;
	Fri, 08 Aug 2025 01:46:08 +0000
Date: Fri, 8 Aug 2025 09:46:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 201/801] arch/arm64/boot/dts/apm/apm-merlin.dtb:
 i2cslimpro (apm,xgene-slimpro-i2c): mboxes:0:0: 21 is not of type 'array'
Message-ID: <202508080923.r89qVPLZ-lkp@intel.com>
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
commit: ad349a4a85f40c6213381a46b01294f768ca381c [201/801] dt-bindings: i2c: Convert apm,xgene-slimpro-i2c to DT schema
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: arm64-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250808/202508080923.r89qVPLZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080923.r89qVPLZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508080923.r89qVPLZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pmu@78810000: failed to match any schema with compatible: ['apm,xgene-pmu-v2']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pmu@78810000/pmul3c@7e610000: failed to match any schema with compatible: ['apm,xgene-pmu-l3c']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pmu@78810000/pmuiob@7e940000: failed to match any schema with compatible: ['apm,xgene-pmu-iob']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pmu@78810000/pmucmcb@7e710000: failed to match any schema with compatible: ['apm,xgene-pmu-mcb']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pmu@78810000/pmucmcb@7e730000: failed to match any schema with compatible: ['apm,xgene-pmu-mcb']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pmu@78810000/pmucmc@7e810000: failed to match any schema with compatible: ['apm,xgene-pmu-mc']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pmu@78810000/pmucmc@7e850000: failed to match any schema with compatible: ['apm,xgene-pmu-mc']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pmu@78810000/pmucmc@7e890000: failed to match any schema with compatible: ['apm,xgene-pmu-mc']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pmu@78810000/pmucmc@7e8d0000: failed to match any schema with compatible: ['apm,xgene-pmu-mc']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/mailbox@10540000: failed to match any schema with compatible: ['apm,xgene-slimpro-mbox']
>> arch/arm64/boot/dts/apm/apm-merlin.dtb: i2cslimpro (apm,xgene-slimpro-i2c): mboxes:0:0: 21 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/apm,xgene-slimpro-i2c.yaml#
   arch/arm64/boot/dts/apm/apm-merlin.dtb: i2cslimpro (apm,xgene-slimpro-i2c): mboxes:0:1: 0 is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/apm,xgene-slimpro-i2c.yaml#
>> arch/arm64/boot/dts/apm/apm-merlin.dtb: i2cslimpro (apm,xgene-slimpro-i2c): mboxes:0: [21, 0] is too long
   	from schema $id: http://devicetree.org/schemas/apm,xgene-slimpro-i2c.yaml#
>> arch/arm64/boot/dts/apm/apm-merlin.dtb: i2cslimpro (apm,xgene-slimpro-i2c): mboxes: [[21, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/apm,xgene-slimpro-i2c.yaml#
   arch/arm64/boot/dts/apm/apm-merlin.dtb: pcie@1f2b0000 (apm,xgene-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apm,xgene-pcie', 'apm,xgene2-pcie'] is too long
   	'apm,xgene-storm-pcie' was expected
   	'apm,xgene-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/apm,xgene-pcie.yaml#
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pcie@1f2b0000: failed to match any schema with compatible: ['apm,xgene-pcie', 'apm,xgene2-pcie']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: pcie@1f2c0000 (apm,xgene-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['apm,xgene-pcie', 'apm,xgene2-pcie'] is too long
   	'apm,xgene-storm-pcie' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
