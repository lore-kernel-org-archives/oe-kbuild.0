Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931BD18EB0
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Mar 2025 04:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743050681; cv=none; b=Mj7ezP2NOrx75ro4YsYcEZAuNKRYwPUVM2DgtcYDFW6Ivrc8FauIXE2izi14R4cqCeL9Jetw65HY8KuW+5bcaOxKNLTY9Y5j5rQMt3jM6K7j1cTRGGx6jiHFsdIZ9tlumSzgeI1cCW8R2TZge0jHkz9PGbeb/fTXxuBWOJ51568=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743050681; c=relaxed/simple;
	bh=Skh1qrbpgYNrJlkYkLTcYiGcZ+B+0DHT7AVTJfHD/r0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IbJVQ6X6eXYTxcaZ6vd7e3+wO6ljJnr1P9lTd+rzvSEPKEoVteVAkBFUaMkPXg3hSQiIR9ZE7BkEnPB6dt0QwTLvE4b2NAhyq20cQ16d2A+XUqF/QolbDiSjTYS7tUqydX+EZQanKdNtyAdmO6AsIVjPV9vUGxXoY+lQCQWYj6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fkYfdCCi; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fkYfdCCi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743050680; x=1774586680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Skh1qrbpgYNrJlkYkLTcYiGcZ+B+0DHT7AVTJfHD/r0=;
  b=fkYfdCCilpq3C553gJDsD3EIdd7C+xeXMS4mkbeO2fVGz/9h2ewmmS2A
   a9V1d9/ZbAUcPb02tVDjKS7JZPdZDSVcI2iYy/XvIJyfqyBHzOhVYeXOU
   I/HwFL2zmBpAYsrUN+7WprEyEHqQI5cNPb5BL8pcqu9KmFJ1gG02T6j6s
   93XAsSd8aXQ9VLtYJXuBJ0K5JUHeDLeEOKbzMr1HfFd+MyjtOSamQp4VN
   zeAetkuz2Uw+tgDhoOV3cdaiwIP2Tfqp/mAjAeYfCFPUsBu52ojY1W0Pk
   MdTHW4rMy0rXrdrnJ3b4JQ8W21a0dqtGDuYnfIZSEEv3CzWDQnxWx+Xxv
   w==;
X-CSE-ConnectionGUID: 6tb7QL/dQkCbWGnyNqSGWQ==
X-CSE-MsgGUID: IL1DbekgRrO2R4bSvbKpdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="66830564"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="66830564"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 21:44:39 -0700
X-CSE-ConnectionGUID: 8AqIRqATTEOarll8OflOng==
X-CSE-MsgGUID: mlw6TNO3SK2TRG7+hy+rKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="155951943"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 26 Mar 2025 21:44:38 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txf6Z-0006Mx-2L;
	Thu, 27 Mar 2025 04:44:35 +0000
Date: Thu, 27 Mar 2025 12:43:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:sound-msiof-2025-03-26-2 16/25]
 arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: video@e6ef4000:
 ports:port@1: 'anyOf' conditional failed, one must be fixed:
Message-ID: <202503271208.H5ou7Rfc-lkp@intel.com>
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
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux sound-msiof-2025-03-26-2
head:   2518ccf64c65482b415e5a831057998bfe2bda1d
commit: 64197533b1e55ac702c428d978b02d46bd4fa679 [16/25] arm64: dts: renesas: r8a774e1: tidyup video endpoint node
:::::: branch date: 22 hours ago
:::::: commit date: 26 hours ago
config: arm64-randconfig-051-20250327 (https://download.01.org/0day-ci/archive/20250327/202503271208.H5ou7Rfc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
dtschema version: 2025.3.dev5+g0f9dc23
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503271208.H5ou7Rfc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503271208.H5ou7Rfc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: video@e6ef4000: ports:port@1: 'anyOf' conditional failed, one must be fixed:
   	'endpoint@0' is a required property
   	'endpoint@1' is a required property
   	'endpoint@2' is a required property
   	'endpoint@3' is a required property
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: video@e6ef5000: ports:port@1: 'anyOf' conditional failed, one must be fixed:
   	'endpoint@0' is a required property
   	'endpoint@1' is a required property
   	'endpoint@2' is a required property
   	'endpoint@3' is a required property
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: video@e6ef6000: ports:port@1: 'anyOf' conditional failed, one must be fixed:
   	'endpoint@0' is a required property
   	'endpoint@1' is a required property
   	'endpoint@2' is a required property
   	'endpoint@3' is a required property
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: video@e6ef7000: ports:port@1: 'anyOf' conditional failed, one must be fixed:
   	'endpoint@0' is a required property
   	'endpoint@1' is a required property
   	'endpoint@2' is a required property
   	'endpoint@3' is a required property
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: lvds: panel-timing:vsync-active: 3 is not one of [0, 1]
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: lvds: compatible:0: 'panel-lvds' is not one of ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05', 'chunghwa,claa070wp03xg', 'edt,etml0700z9ndha', 'hannstar,hsd101pww2', 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-lvds.yaml#
   arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dtb: lvds: compatible: ['panel-lvds'] is too short
--
   arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dtb: ethernet-phy@0: compatible: ['ethernet-phy-id001c.c915', 'ethernet-phy-ieee802.3-c22'] is too long
   	from schema $id: http://devicetree.org/schemas/net/realtek,rtl82xx.yaml#
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dtb: video@e6ef4000: ports:port@1: 'anyOf' conditional failed, one must be fixed:
   	'endpoint@0' is a required property
   	'endpoint@1' is a required property
   	'endpoint@2' is a required property
   	'endpoint@3' is a required property
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dtb: video@e6ef5000: ports:port@1: 'anyOf' conditional failed, one must be fixed:
   	'endpoint@0' is a required property
   	'endpoint@1' is a required property
   	'endpoint@2' is a required property
   	'endpoint@3' is a required property
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dtb: video@e6ef6000: ports:port@1: 'anyOf' conditional failed, one must be fixed:
   	'endpoint@0' is a required property
   	'endpoint@1' is a required property
   	'endpoint@2' is a required property
   	'endpoint@3' is a required property
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dtb: video@e6ef7000: ports:port@1: 'anyOf' conditional failed, one must be fixed:
   	'endpoint@0' is a required property
   	'endpoint@1' is a required property
   	'endpoint@2' is a required property
   	'endpoint@3' is a required property
   	from schema $id: http://devicetree.org/schemas/media/renesas,vin.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
