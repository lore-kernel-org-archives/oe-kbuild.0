Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BA515B0F0
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jul 2024 10:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720780105; cv=none; b=SBRDem6sXKrQihLcnUtEIv76TM5xq6/hxBwfDIQ4YPxzztBE6L6ly/7vU9SXHzA+SH1ne69oKhNJcWGvBjOB36btaC2BlAEO4IzifEha+RRHB2zkD5DBG4vO+RciTKhgSwnfH1qHI0w+vIfwSmUsfTkHIVTUCNcNiDm2s7mYmME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720780105; c=relaxed/simple;
	bh=esL0m1JJZD55SSE+gj50kJXcKctCiaRL97FPlEuVZoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gF1Pdlc4lyhlcM4ICFqdXYc3Pi/iLXVn4lpZt1MZCMf4C3iQ9VR+ybI+s6pd6DNLdJVJJAy9bYAr/E4txix1XUg2jSB+Tr2iwylBEE1oqIAN607GJgHx8TF1ZXYFcggAhKXWfjh6N4HBWFRibNMBYkKcqqUjCf6Yv3nFvC+P4lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZM4KFez; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZM4KFez"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720780103; x=1752316103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=esL0m1JJZD55SSE+gj50kJXcKctCiaRL97FPlEuVZoM=;
  b=AZM4KFezB2kMmuZYHBLqv5588Oj0CDUhShgH5pe/yQbqmAKZS+gy17rZ
   SsqJyCfaklX3xzvl3kmkKXKHM2F0Guof29MMCHaG5UfKKOBC8LUOWvuEP
   jaZMouZlebur+/9A2ULkk+j5HeApWuv/Kd25pqsNzWC/1cgk89oeMu4YY
   KkUzxQ/neWddOI1HwYqrd4/RvbsuhqHm78uEpuB900Oj6sHw6ol2yESm7
   cijoGZ4PId/5sVvA5kXuFzRMEcyUeO1WBbHuMMm3CWeFlq05niGXtewXN
   bcfJUyzaoRrGZto7+82wei2my6Jr/jQEqXeNam1aMDLAH4aSSLv3bbMj4
   w==;
X-CSE-ConnectionGUID: LNIfBL6fRECNkaiz8wopvg==
X-CSE-MsgGUID: 7r1rAW6LT1esSfyjNAQr8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="22084120"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="22084120"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 03:28:21 -0700
X-CSE-ConnectionGUID: cX2nwqolTYu7/y7oBbPK3A==
X-CSE-MsgGUID: vL11Mg9+Q16b44wKmzXK0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="53809642"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Jul 2024 03:28:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSDVg-000aey-2a;
	Fri, 12 Jul 2024 10:28:16 +0000
Date: Fri, 12 Jul 2024 18:27:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb:
 camera@60: port:endpoint:data-lanes: [0, 1] is too long
Message-ID: <202407121842.qkEksT3d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Rob Herring <robh@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   43db1e03c086ed20cc75808d3f45e780ec4ca26e
commit: 274e480982e6d1239be6a236bb457aa95460e1f1 media: dt-bindings: Convert Omnivision OV7251 to DT schema
date:   10 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-051-20240712 (https://download.01.org/0day-ci/archive/20240712/202407121842.qkEksT3d-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407121842.qkEksT3d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407121842.qkEksT3d-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: dma-controller@1dc4000: compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,bam-dma.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: /soc@0/dma-controller@1dc4000: failed to match any schema with compatible: ['qcom,bam-v1.7.4', 'qcom,bam-v1.7.0']
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: /soc@0/remoteproc@5c00000: failed to match any schema with compatible: ['qcom,sdm845-slpi-pas']
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: etf@6047000: in-ports: '#address-cells', '#size-cells', 'port@1' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: etf@6047000: Unevaluated properties are not allowed ('in-ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: video-codec@aa00000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/media/qcom,sdm845-venus-v2.yaml#
>> arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: camera@60: port:endpoint:data-lanes: [0, 1] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov7251.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: pmic@0: adc@3100: 'oneOf' conditional failed, one must be fixed:
   	'#address-cells', '#size-cells', 'adc-chan@6' do not match any of the regexes: 'pinctrl-[0-9]+'
   	'#address-cells', '#size-cells', 'adc-chan@6', 'interrupts' do not match any of the regexes: 'pinctrl-[0-9]+'
   	'adc-chan@6' does not match any of the regexes: '^channel@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	['qcom,spmi-adc-rev2'] is too short
   	'qcom,spmi-adc-rev2' is not one of ['qcom,pm8226-iadc', 'qcom,pm8941-iadc']
   	'qcom,spmi-adc-rev2' is not one of ['qcom,pmi8998-rradc', 'qcom,pm660-rradc']
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: adc@3100: 'adc-chan@6' does not match any of the regexes: '^channel@[0-9a-f]+$', 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
