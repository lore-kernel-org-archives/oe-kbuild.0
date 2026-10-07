Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CAF455163
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Oct 2026 22:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791412123; cv=none; b=oNpfKFgAnH5r8jKbQE5mfezBOjEUBiHiMYqr4RbfaIr1M56SiksC1eF63iaJDaWrlwQSbUpwVuWK1RbtD/PDENMM8tPS4SzrMlY/fy+hxiNReVZpqiCUAvC9jtdRaSRD7i0A+KtE8UF2QH6P1ZeoXCcdpjPJST3qHzzlMVMHoes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791412123; c=relaxed/simple;
	bh=tDQlz8ldvYsi48jEfSbqcErRf3/fVGy1KdbiBsak0P8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nuUK4hwL7WB/UDgbZK1iZpm6NB7O0YxhVtP6VGiE8CKcOs1G++WIg9cD289oysIoE2rbSS5+nykFIy3bURgUcPNsfCVNrHKsplgNYU6jLpiLLuxkrucxMouiRMzdi6w4KIPS/k4+XgjLoz2pO3Kk4hhyhwVgWf1OGrmh4tp7Q/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EP1ElGfm; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EP1ElGfm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791412121; x=1822948121;
  h=date:from:to:cc:subject:message-id;
  bh=tDQlz8ldvYsi48jEfSbqcErRf3/fVGy1KdbiBsak0P8=;
  b=EP1ElGfmGiPn7/MG0EoIZWYxtPBD2iqnJrXfAxYw/Rzik0Z8VcTmOXyw
   a8eLyNhmL98OqYVmwlIdnkDYe2uX9UgasWYJqmeeyUjOsgfxoOMSIweYJ
   6dlpbeDjdwwgq5GLNaxBfoyFjhJ0bWKhbBoOdP4LzbHayoqwhQb0NhgVj
   t/66yrZd5pA4rdXIt6g11AhitfSLJQ0CxU64KehZzOGNg/lqTv4MD2rBt
   XGFeaU6vpzMKjzYJA41q4mV9g+t1zwn7xF0GqjSryzIyH9xQVbTIDA+2B
   hisTO+FBaiY+STbjF/s1DLfy9/rl5fGoK0XqXfFgv9HXM5T2kdSay4Q05
   g==;
X-CSE-ConnectionGUID: NTW+ZBadQ2KswoSa3wdWTw==
X-CSE-MsgGUID: 7e2gumRySLSUNlDmknXZJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="196555"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="196555"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 15:28:40 -0700
X-CSE-ConnectionGUID: MJp+dmGcTKaodZHGeFlwuQ==
X-CSE-MsgGUID: WAqVDvavQ3qM8IJHpoh85g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="307030204"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 07 Oct 2026 15:28:40 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEa7o-000000004BH-30tG;
	Wed, 07 Oct 2026 22:28:36 +0000
Date: Thu, 08 Oct 2026 00:28:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-drivers:master 12/75]
 arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-ripple.dtb: hub@1
 (usb4b4,6502): 'peer-hub' is a required property
Message-ID: <202610080002.V25VcfsF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-renesas-soc@vger.kernel.org
TO: Josua Mayer <josua@solid-run.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   1320b9000130f6240b4f713b0948dcab4dfd95fa
commit: f6b483d441e3dee1a5ece1266ae731c953ed9bb6 [12/75] arm64: dts: renesas: Add support for solidrun hb-ripple with rzg2lc som
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2402-20260929 (https://download.01.org/0day-ci/archive/20261008/202610080002.V25VcfsF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610080002.V25VcfsF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610080002.V25VcfsF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-ripple.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-ripple.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-ripple.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-ripple-emmc.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-ripple-emmc.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-ripple-emmc.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-ripple-microsd.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-ripple-microsd.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-ripple-microsd.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-ripple-leds.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-ripple-leds.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-ripple-leds.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
