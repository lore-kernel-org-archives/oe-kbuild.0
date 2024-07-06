Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F76A17FE
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jul 2024 22:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720305202; cv=none; b=Ie4KOTDRGnR2srn+2pVIGInxDyPFi8beazxk9zoP5RaO5v5QZwym6hpL88XRcMFGuNwjGZpqn0sVUMMuFHjN636/3wiCV+w2LR4Dy8uFJw7s/3iEE81HVfSdM2i59aTGPkyhQWYe6QT75ye2/ulHvOPqPDTpWBHBarzDHmubI00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720305202; c=relaxed/simple;
	bh=1GSJSeT0MSlShDrBWH+3F9xV08qrQKKnCTqpdCRQav8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uh+IyxxEot+gAIm3uLFN+NZpQRQ6ZNZMIp/ahw0TsyEmyYDOdkMnyMQ71ghzt+nIvuW10u1Ltul24jTlxhnhah+xNaGt8XU0w/4RyGU1SyTU9y3km9sHFoqdKpwcoLbXUtMfpekgGxUSI+kKpxOSLJVoQ2WRVWoxzXU9YlPlkzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hl9eI/KH; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hl9eI/KH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720305201; x=1751841201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1GSJSeT0MSlShDrBWH+3F9xV08qrQKKnCTqpdCRQav8=;
  b=hl9eI/KHMqQOdptjYY02+vBszkMxKso2sgZrS5ODUWNuNX8/7pPMsncv
   o9IzVd5SyLJ24hYDnFESAGQd8mUyYy1mwZOYVyc9zeE0jza9DztiVy6AI
   8UCXcOcnBTNXn0TyzMTthtTJT5MRQaqgDR86lbhvLt6Y06Ej+0xcJKmV4
   Kf5r+9vJo0Di7iFKD1sVJZtD8pm10wcBBf/OEXrjzkaCmZ4CDljtjtljg
   3U0OgsXeKd0HwgMgb4a7S5Rm1FXfouZ+kMvc3wCqxT/fEUecSxr71CZ2X
   fedaMUWZKMZJQcAtAZJlCEG5wp/KqYMwglELxvdKSPznT+5m4KQKKqhQz
   Q==;
X-CSE-ConnectionGUID: Yl7U3K13TwiWzBBkgcsHPQ==
X-CSE-MsgGUID: d0jpbikFRrmRpJHc3bM3oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="28944845"
X-IronPort-AV: E=Sophos;i="6.09,188,1716274800"; 
   d="scan'208";a="28944845"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 15:33:20 -0700
X-CSE-ConnectionGUID: NBmb9mVZTzis8JN/3Sa2/Q==
X-CSE-MsgGUID: 9imcT8m+Q2meWIU1Hb+IEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,188,1716274800"; 
   d="scan'208";a="46925406"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Jul 2024 15:33:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQDy0-000ULU-01;
	Sat, 06 Jul 2024 22:33:16 +0000
Date: Sun, 7 Jul 2024 06:32:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 140/187]
 arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@31: Unevaluated properties
 are not allowed ('SDZ-supply', 'compatible', 'ti,sdout-zero-fill' were
 unexpected)
Message-ID: <202407070644.dCptwzby-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   1f815c7efb1b452e1f6f3aaaa42b958383f44076
commit: ea605381505ae86d87b148231b14f8a416c21197 [140/187] arm64: dts: apple: j313: Model SDZ GPIO as a regulator
:::::: branch date: 3 weeks ago
:::::: commit date: 8 weeks ago
config: arm64-randconfig-051-20240629 (https://download.01.org/0day-ci/archive/20240707/202407070644.dCptwzby-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407070644.dCptwzby-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407070644.dCptwzby-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/dcp@231c00000: failed to match any schema with compatible: ['apple,t8103-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j313', 'apple,panel']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/dcp@231c00000/panel: failed to match any schema with compatible: ['apple,panel-j313', 'apple,panel']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/isp@22a000000: failed to match any schema with compatible: ['apple,t8103-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/isp@22a000000: failed to match any schema with compatible: ['apple,t8103-isp', 'apple,isp']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@31: compatible:0: 'ti,tas5770l' is not one of ['ti,tas2770']
   	from schema $id: http://devicetree.org/schemas/sound/tas2770.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@31: compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2770.yaml#
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@31: Unevaluated properties are not allowed ('SDZ-supply', 'compatible', 'ti,sdout-zero-fill' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas2770.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/i2c@235014000/codec@31: failed to match any schema with compatible: ['ti,tas5770l', 'ti,tas2770']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@34: compatible:0: 'ti,tas5770l' is not one of ['ti,tas2770']
   	from schema $id: http://devicetree.org/schemas/sound/tas2770.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@34: compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/tas2770.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@34: Unevaluated properties are not allowed ('SDZ-supply', 'compatible', 'ti,sdout-zero-fill' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/tas2770.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/i2c@23501c000/codec@34: failed to match any schema with compatible: ['ti,tas5770l', 'ti,tas2770']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@48: 'VP-supply' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
