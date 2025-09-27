Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0CB14B953
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Sep 2025 12:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758978001; cv=none; b=V9lBXEBNfFYhwzL4hnjzbZCq+f1sQF9LJm5P/MLVj7b64izWsIdwjbdkKbb0UkyPDbV8xKlC9DVCsuDWNqQ/wLruoUJuYWmf0voblPz2nlzccOJBIIBi6QNz6pJXe/TGOOqGf+fhXEzSNTDK9Y2JqZeUijDk8rcX9wwR3lsNlGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758978001; c=relaxed/simple;
	bh=TYAFnylHwO/jbF/M/0iVj22Sk8hc7OZ/DWC7/A5Rdwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WAmwD5BrAGSbR0QQrUyXShuOzM5F6ti+BTiq1Ygp1lKZ7I2IngLl4YIDtvR0bOcBPQ93nNW5+C1eiv1tX5iqjoAciwGDqlZjfVAEK//7MFoBFwQoW+T2L+XrK+xiJj81ZEfEnFqimDXMeQprLqBzI+Dik4IxcAOT8q26FYrkUyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jmFkj+dZ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jmFkj+dZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758978000; x=1790514000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TYAFnylHwO/jbF/M/0iVj22Sk8hc7OZ/DWC7/A5Rdwg=;
  b=jmFkj+dZLZ7ENBFLdmRaCFRDSq1aIKSsSJ7RL5GCY+5tuzhrq+H3rVGY
   BXu1DLjgE8MEeC2DVtn17bIVcxcpo8sM+E+KMMIulEo5Fp7qsLDN++1l+
   AnbeH+Ke+73kp/lkkWJMiJQlYGzm1oo9dQBeUuXXdDJW1sV8oa0VweEGq
   G/N0JV8poF4rDthRqldlbeLJUTuYlvBogHu0P6JFJ/prOTgKeOIZFkEXy
   UZTx/PgjS9E4Y6g6+E3p5D68Iv4kZeUtnJIhe32jM2ezJGqL4u9W9+A0r
   4RqvT/tspaDQ37XtLDH9q+s99KH9pxDVrlWskx3KGi1VynBykF7x9jKaB
   A==;
X-CSE-ConnectionGUID: OUm9ebmrRbaK4zkFqCFVLQ==
X-CSE-MsgGUID: fA3/bh6MR+SgApUIozd70A==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="72386293"
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="72386293"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 05:59:59 -0700
X-CSE-ConnectionGUID: zKEcr0RzRoGWGBVpWnc/0Q==
X-CSE-MsgGUID: zgnT4yv/Q6m+mxZ730krvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="182237183"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 27 Sep 2025 05:59:58 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v2UWp-000000005V7-3uz2;
	Sat, 27 Sep 2025 12:59:55 +0000
Date: Sat, 27 Sep 2025 14:59:31 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 19/140]
 arch/arm64/boot/dts/apple/t8112-j415.dtb: pmic@e (apple,stowe-pmic):
 nvmem-layout: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202509271406.oqqzcvnQ-lkp@intel.com>
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
CC: Neal Gompa <neal@gompa.dev>
CC: Sven Peter <sven@kernel.org>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   703a105e4188c8c9e084375a48f08853cf64cfca
commit: 4a2544346f8f515c3e4370b44ffdf62d466b9c7a [19/140] arm64: dts: apple: Add devicetreee for t8112-j415
:::::: branch date: 6 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2052-20250919 (https://download.01.org/0day-ci/archive/20250927/202509271406.oqqzcvnQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509271406.oqqzcvnQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509271406.oqqzcvnQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8112.dtsi:491.25-500.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: pmic@e (apple,stowe-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@f702,0', 'panic-count@f702,4', 'shutdown-flag@f70f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@f702,0', 'boot-error-stage@f703', 'boot-stage@f701', 'fault-shadow@867b', 'panic-count@f702,4', 'pm-setting@f801', 'rtc-offset@f900', 'shutdown-flag@f70f,3', 'socd@8b00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: pmic@e (apple,stowe-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@f702,0', 'boot-error-stage@f703', 'boot-stage@f701', 'fault-shadow@867b', 'panic-count@f702,4', 'pm-setting@f801', 'rtc-offset@f900', 'shutdown-flag@f70f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: pmic@e (apple,stowe-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: nvmem-layout (fixed-layout): 'boot-error-count@f702,0', 'panic-count@f702,4', 'shutdown-flag@f70f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
