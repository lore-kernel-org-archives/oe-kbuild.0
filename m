Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C34A35950
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Sep 2025 20:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759006383; cv=none; b=o669c2Ya5sy3dY2kchNkTO7XOCNiYTKp6OyYYUY+2C2BsJqS6z4dfPEPwq+6yFGmw8girNYtFBmfpUBLWH8vSfWYrmjJ8WlVTtJS82kYZtHyF5T6wMh4qV+4uK/5vtYXwwqv9uEeJD6Sft0nsV1lqDXZ2NbOXI3lhJBrz2oD3oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759006383; c=relaxed/simple;
	bh=hezZZyTQZH8z+aYZ3w7JS7KT41vbGdqxwNb91xtJzDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t3RiBnix+bURKPC1xTOegUkzGivQefqLYMDJkJWgcwfBw6nf+TXu/6Zx4tCtLdJPoLTmm3JDbAgKcWLWj96yaq9LKxI9XgmCspYy1ZsQwNCYE9cqjA1szqOk048kYztAxTa0Z6osakHiOqUdnyx96K+VC8QWKCyapoGl2TwwVH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B6t4z/Fm; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B6t4z/Fm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759006381; x=1790542381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hezZZyTQZH8z+aYZ3w7JS7KT41vbGdqxwNb91xtJzDY=;
  b=B6t4z/FmjPPIpntM7AOVvVRImAIs4SnoROUH2ULmTNQL3U0Jetpud0p6
   ZNR01MykcJ9fumJBoiMXdhUew/3s0ViqpfTeJkxhRim+rqOmfdqySJ3zE
   0DhD1KaL1IcvqrxkiOMhPJpZeQDD1+/tnqvwjV4Pjo3rVXAAymdd8o22z
   MxRbnTY88vNmPAkqTHSK+c6HrUEyP34o0hQaonthnOp9jArYKStgtF4pw
   At28PD4fsesopn4UVm55aKWcoTr5ciIuCYDx9NhHdqz44p5skXBpopxsr
   EWpERqqHvP4o494yqlGsykUW9RME45E9ThmGyNfGXIhO3SgZQuAdqytdI
   g==;
X-CSE-ConnectionGUID: 2gJBPMaXT8ms3KEGM2cOiQ==
X-CSE-MsgGUID: xBrhLzHGR9uIFIGkT0euTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="61410011"
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="61410011"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 13:53:01 -0700
X-CSE-ConnectionGUID: /qkKJmODTjmRSo55M5kD8A==
X-CSE-MsgGUID: CvMdlNAvT4idX7Dzc8xFjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="178284226"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 27 Sep 2025 13:53:00 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v2buc-000000005YT-037u;
	Sat, 27 Sep 2025 20:52:58 +0000
Date: Sat, 27 Sep 2025 22:52:16 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 24/140]
 arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000/rtc: failed to
 match any schema with compatible: ['apple,smc-rtc']
Message-ID: <202509272253.cJ0fGkAF-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   703a105e4188c8c9e084375a48f08853cf64cfca
commit: 307adce46a44a4e8df04d1a4da7f08a736e83870 [24/140] arm64: dts: apple: t8112: Add smc_rtc node
:::::: branch date: 6 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2052-20250919 (https://download.01.org/0day-ci/archive/20250927/202509272253.cJ0fGkAF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509272253.cJ0fGkAF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509272253.cJ0fGkAF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: pmic@e (apple,stowe-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@f702,0', 'boot-error-stage@f703', 'boot-stage@f701', 'fault-shadow@867b', 'panic-count@f702,4', 'pm-setting@f801', 'rtc-offset@f900', 'shutdown-flag@f70f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: pmic@e (apple,stowe-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: nvmem-layout (fixed-layout): 'boot-error-count@f702,0', 'panic-count@f702,4', 'shutdown-flag@f70f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
--
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: pmic@e (apple,stowe-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@f702,0', 'boot-error-stage@f703', 'boot-stage@f701', 'fault-shadow@867b', 'panic-count@f702,4', 'pm-setting@f801', 'rtc-offset@f900', 'shutdown-flag@f70f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: pmic@e (apple,stowe-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: nvmem-layout (fixed-layout): 'boot-error-count@f702,0', 'panic-count@f702,4', 'shutdown-flag@f70f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
