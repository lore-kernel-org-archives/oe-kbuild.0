Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB7B2AE68
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Sep 2025 11:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758712705; cv=none; b=EeSqcarLN5wV84OuH7AI6IgYNlLKpKPjFJtTPwA3XD2JP/HNvoYoM40n8WSCVnlrpJfUqltd6msf34/pYVt48jechBvZyhlpJ4cTXiTI0rz7iJx6+LDaSW1t/+c5Sk9htryAxePID0npUpVUBblas73y813hlmLxYoxI7TNaGfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758712705; c=relaxed/simple;
	bh=ovggqmpZ98PmKOXur5NBhHm1AFJuHXB2yqBZ168EZZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D9kqi5cwQ/c2cMylySBwSZQQGuWHUH5lEB3f+NICHuCDWDPFS10eiUSrgImtmniC6uLQx3DUo7jINOmYa8meHgMYpcucD/HbrWA2ubT+3Z+PlQmwH/4wFKWPQtdbBVZOOnzpfq1h7wPmhStVo0P0P4W2Meq3ZneBQqKkxLCT5g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YobWmJ9E; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YobWmJ9E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758712703; x=1790248703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ovggqmpZ98PmKOXur5NBhHm1AFJuHXB2yqBZ168EZZY=;
  b=YobWmJ9E7obaMTzOk34/LIBPjl+NiLx/pW4RuSgMEa1Zfh2XukfeteCN
   xpbHU4uuaYgzC33HJzh4KkClxJGGQcGqkWrYkAtgHhkrYawf2yh2NcNww
   yOD9giN8I+0z5DObE/Uym3yrYnGrD6PEYg7dsowA7XoCGUv1MyxKjYZJq
   hnrngdqTECitWwXW1OIyb3JYjNZOpL58KwxQklP2njhEtgH4B00mN6Fpk
   RecvtFFot0Ajsy8Nk0uotqsoB+7y4xCcUBT3jRoTW0w3P5IAUcNJR1+1y
   QvUtbk6tQt3gQH1gJ5jjbZ+0z44PlMZmAKrwSwpWp3FOwMBn9Dveekeez
   Q==;
X-CSE-ConnectionGUID: Hei7ug9eTky8IPUjosV04g==
X-CSE-MsgGUID: edO92lu7RJK1o9+ZKa7z3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72108797"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="72108797"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 04:18:22 -0700
X-CSE-ConnectionGUID: prprvw7STiuMXW3FY0YRKQ==
X-CSE-MsgGUID: MnD9LRRrRLaRuJB2Iy29FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="176134024"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa006.jf.intel.com with ESMTP; 24 Sep 2025 04:18:20 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v1NVq-000000004U1-0pN8;
	Wed, 24 Sep 2025 11:18:18 +0000
Date: Wed, 24 Sep 2025 13:17:37 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 37/140]
 arch/arm64/boot/dts/apple/t8103-j313.dtb:
 /soc/spi@23510c000/hid-transport@0: failed to match any schema with
 compatible: ['apple,spi-hid-transport']
Message-ID: <202509241317.VAhqMkwD-lkp@intel.com>
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
commit: 380fcb05e751317b6a3ed7348f2cd69c39d7ea26 [37/140] arm64: dts: apple: t8103: Add spi3 keyboard node
:::::: branch date: 3 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2052-20250919 (https://download.01.org/0day-ci/archive/20250924/202509241317.VAhqMkwD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509241317.VAhqMkwD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509241317.VAhqMkwD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spi@23510c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: pmic@f (apple,sera-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@9f02,0', 'boot-error-stage@9f03', 'boot-stage@9f01', 'fault-shadow@a67b', 'panic-count@9f02,4', 'pm-setting@d001', 'rtc-offset@d100', 'shutdown-flag@9f0f,3', 'socd@ab00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: pmic@f (apple,sera-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@9f02,0', 'boot-error-stage@9f03', 'boot-stage@9f01', 'fault-shadow@a67b', 'panic-count@9f02,4', 'pm-setting@d001', 'rtc-offset@d100', 'shutdown-flag@9f0f,3', 'socd@ab00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: pmic@f (apple,sera-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
