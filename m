Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0AB20299E
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 18:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754590118; cv=none; b=KeIo6ACjO0sznGr7ULx1ODg7eM9EVRMxs1cSJxLTQtFDyO4Hd03NniMu2wT02tkn7gKYMSXKAuRMrOKSN/hRAQIDUMok8kSfxakkRUDlELBUlKKqN1pl7Ok87LzrACka2Y53MWwD+bMjIDSictyJjpGF8XvF86CeFAoJFW3THaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754590118; c=relaxed/simple;
	bh=RWi6b/IBblOHUVekw7UumQvRqfreXfSUMsVP2ECppJw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iquJp4NvjxQ+ner2m8CgPJ55bEWr4zSfZ9h3KpKjxj23ZUDfy66X5vwc/PI1uT11QRP7OdKTeZIBiqF8SgckHtz00KjIcXUW7hujXk7iXEArBzp9FXlG6hFZRDPXIRtNXzBPSJT197Xp4joeGmhC6SMkVnia3ryncdyIKb2WgiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PUVXDn6/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PUVXDn6/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754590117; x=1786126117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RWi6b/IBblOHUVekw7UumQvRqfreXfSUMsVP2ECppJw=;
  b=PUVXDn6/GeiEanjd788WFeEswXYA30Obl+nqJrtUcUigARvCXOQMRTJA
   mSdm3scRznpVJ7nURXo36o6y+fVBfn+LDd5l43UbuGUVxSpyEqJsGNToW
   P//ab+tr+/U5FLQpTEdduwltq4rDLFfFvafDolF06LWY9Yr910eY4A3SV
   UcJ5mVtQHgTbrFn6rfIDzLCpf2P5lJnBGuebrzF7UsY5S51gbbkthAWQD
   qA4OfYIGshorQkIpL5LyKggwjxBhLawjPrxIaw678bUcC6YewWagetaX+
   WTFzPz1Bsh5/oxYhnQ5OiaBh2WJKGIeLieZfqybUoSsGnYRU77jKRVgIt
   w==;
X-CSE-ConnectionGUID: eou4G9TBSdC0WQNx1mgaPQ==
X-CSE-MsgGUID: gwy7F+DDR0+WqeFhNUQ1hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56143016"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56143016"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 11:08:35 -0700
X-CSE-ConnectionGUID: RFvcX6YvRnuDkcmOhNatQA==
X-CSE-MsgGUID: FCFewAtUQU28NigDJ1T0Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165028731"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 07 Aug 2025 11:08:33 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk52O-000356-2M;
	Thu, 07 Aug 2025 18:08:28 +0000
Date: Fri, 8 Aug 2025 02:08:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 148/801] arch/arm64/boot/dts/apm/apm-merlin.dtb:
 edac@78800000 (apm,xgene-edac): '#address-cells', '#size-cells', 'ranges' do
 not match any of the regexes: '^edacl3@.*$', '^edacmc@.*$', '^edacpmd@.*$',
 '^edacsoc@.*$', '^pinctrl-[0-9]+$'
Message-ID: <202508080250.56T7eh5k-lkp@intel.com>
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
commit: 7b9b4d0ebe33f17b71ddda4070a97086fee7fb11 [148/801] dt-bindings: edac: Convert apm-xgene-edac to DT schema
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm64-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250808/202508080250.56T7eh5k-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080250.56T7eh5k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508080250.56T7eh5k-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apm/apm-merlin.dtb: soc (simple-bus): hwmonslimpro: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/apm/apm-merlin.dtb: soc (simple-bus): i2cslimpro: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/apm/apm-merlin.dtb: soc (simple-bus): reboot@17000014: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/apm/apm-merlin.dtb: socplldiv2 (fixed-factor-clock): #clock-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/clock/fixed-factor-clock.yaml#
>> arch/arm64/boot/dts/apm/apm-merlin.dtb: edac@78800000 (apm,xgene-edac): '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: '^edacl3@.*$', '^edacmc@.*$', '^edacpmd@.*$', '^edacsoc@.*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/edac/apm-xgene-edac.yaml#
>> arch/arm64/boot/dts/apm/apm-merlin.dtb: edac@78800000 (apm,xgene-edac): edacsoc@7e930000:compatible: ['apm,xgene-edac-soc'] is not one of ['apm,xgene-edac-soc-v1', 'apm,xgene-edac-l3-soc']
   	from schema $id: http://devicetree.org/schemas/edac/apm-xgene-edac.yaml#
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/edac@78800000/edacsoc@7e930000: failed to match any schema with compatible: ['apm,xgene-edac-soc']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pmu@78810000: failed to match any schema with compatible: ['apm,xgene-pmu-v2']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pmu@78810000/pmul3c@7e610000: failed to match any schema with compatible: ['apm,xgene-pmu-l3c']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pmu@78810000/pmuiob@7e940000: failed to match any schema with compatible: ['apm,xgene-pmu-iob']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pmu@78810000/pmucmcb@7e710000: failed to match any schema with compatible: ['apm,xgene-pmu-mcb']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pmu@78810000/pmucmcb@7e730000: failed to match any schema with compatible: ['apm,xgene-pmu-mcb']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pmu@78810000/pmucmc@7e810000: failed to match any schema with compatible: ['apm,xgene-pmu-mc']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pmu@78810000/pmucmc@7e850000: failed to match any schema with compatible: ['apm,xgene-pmu-mc']
   arch/arm64/boot/dts/apm/apm-merlin.dtb: /soc/pmu@78810000/pmucmc@7e890000: failed to match any schema with compatible: ['apm,xgene-pmu-mc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
