Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3989A242D69
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Sep 2025 20:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758919255; cv=none; b=CMBy/kSg03auK6e3Hi2+EZpcuoVO8RSmH8hBIX4rFYRbSVguASiobbrFDSIz76GBwG4c3FWMBjSPT7YhNw/NjM7VaytHd8w5ltGU5+GSxUlSm8nwMis9pBC2IeVdk5rpQJ7r4xbViVDxwt+TP4X5db0qGhnydq7F6TwPeOOJUls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758919255; c=relaxed/simple;
	bh=4aq0Y04MCp/TbJPKafPfVK+ImxpsttG+ro0LaLflJTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EHl/7HG+8chg2/yNkfRSwwT3YMta5cpCX1sZFHVH2XXW1SspWy4NRY/yszWPVgxRxYpDiH7IH4N6zkBKEB5FIt8w160HWlKHiUW/1+L3JDESGa79VAcMDwDBgFlYX08rwEuQV+N9S+7hVNNOv2B/sO5qyQNDFujTVeTaTq8UZ/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TRPHA8Hh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TRPHA8Hh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758919253; x=1790455253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4aq0Y04MCp/TbJPKafPfVK+ImxpsttG+ro0LaLflJTk=;
  b=TRPHA8Hh3bQV/T+qaF1D8AzdXK/s5ggrJR+pLJ/ko06R+EPzpPro1CXz
   0a+x8xfziguyJG4maihN/D3RM6Jvmeb3KvF3JX08BSRkHNaqyo+Kpv7zh
   5QDLrC8jDdVBI4rtr3tnq2VSfON7vN6VeiZr1zrELORldGLq0syhCd5Qf
   Iu8Iqj47sz41s4cl4FyV9zLiZMWvwFQlvi/qGKoJ23fuk47lJetmdUbvz
   hJfxzNwIId1LF4/mKaSef4bt3rFpz3+onZ193IK/N0qUQyavjMPdLsGO/
   g6yCNYvkRBtCXkyUUn9t+XTGZZK9RcLmczcM6kJG02va+Zii8yyMwKC/g
   A==;
X-CSE-ConnectionGUID: oyzCu1wsTpGZ77wPDSLdZw==
X-CSE-MsgGUID: 9jTcnahjQxe2dQ1YiqRaWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61171367"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="61171367"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 13:40:53 -0700
X-CSE-ConnectionGUID: s8BA+3KITxWXl/U0lWtd4w==
X-CSE-MsgGUID: 3TzaZ4ihRnWFUn0yNtsQZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; 
   d="scan'208";a="177638767"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 26 Sep 2025 13:40:52 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v2FFJ-000000005Kr-2AWf;
	Fri, 26 Sep 2025 20:40:49 +0000
Date: Fri, 26 Sep 2025 22:39:51 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 19/140]
 arch/arm64/boot/dts/apple/t8112-j415.dtb: pmic@e (apple,stowe-pmic):
 nvmem-layout: Unevaluated properties are not allowed ('#address-cells',
 '#size-cells', 'boot-error-count@f702,0', 'boot-error-stage@f703',
 'boot-stage@f701', 'fault-shadow@867b', 'panic-...
Message-ID: <202509262227.iedPJAX4-lkp@intel.com>
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
:::::: branch date: 5 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2051-20250919 (https://download.01.org/0day-ci/archive/20250926/202509262227.iedPJAX4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ce5124856e019792783de9630d0c5a1f0aaf2d9d)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509262227.iedPJAX4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509262227.iedPJAX4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8112.dtsi:491.25-500.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112-j415.dtb: pmic@e (apple,stowe-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@f702,0', 'panic-count@f702,4', 'shutdown-flag@f70f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@f702,0', 'boot-error-stage@f703', 'boot-stage@f701', 'fault-shadow@867b', 'panic-count@f702,4', 'pm-setting@f801', 'rtc-offset@f900', 'shutdown-flag@f70f,3', 'socd@8b00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: pmic@e (apple,stowe-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@f702,0', 'boot-error-stage@f703', 'boot-stage@f701', 'fault-shadow@867b', 'panic-count@f702,4', 'pm-setting@f801', 'rtc-offset@f900', 'shutdown-flag@f70f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: pmic@e (apple,stowe-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: nvmem-layout (fixed-layout): 'boot-error-count@f702,0', 'panic-count@f702,4', 'shutdown-flag@f70f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
