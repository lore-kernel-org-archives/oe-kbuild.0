Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDFD416873
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Oct 2026 12:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377132; cv=none; b=ib/PcjB7MLAkXDb7r3LGqn9K8ytKO0Jc0WrXP6FcmAnZ0wHDbchNpozJ45WvgDNpzFDptwA6KtqZs91HykT8g/6cQDcIqzYgCqnbjJ9HTzfYTgWMZsivHBQsWbP1Y6zaWLbd67Ipfiq4A+kNE85FhxXxh3XCU2eNvkPn5Ig/Bds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377132; c=relaxed/simple;
	bh=q9mOCWAy3FzLQ/y6rAJn0P2TkPqhVBbPeSCe4PpFilk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X45fPMS5NQSzOpKRRvRsY313zcoG/qi9hImQDiDLLoEKKmd8Ve66kJ7HyUAPeffHvDFB44pzE2qnSSn0bncirZa2GrvnMaf3wFeGFVtijpicXFtyHrqjtqWM749oLPhczq0DCQn/HwxQmnLhx8F3iI3i3d05LgQWU+cky/MB4Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Djo5UWVG; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Djo5UWVG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791377117; x=1822913117;
  h=date:from:to:cc:subject:message-id;
  bh=q9mOCWAy3FzLQ/y6rAJn0P2TkPqhVBbPeSCe4PpFilk=;
  b=Djo5UWVGNC1RCDQR1xR+FWr93muSw38BVPDz69uyQe7Q63OVR6y+vELu
   kbxdkFsik0VVGCA0rZDpC68gMfy5tzpfvBG3yBfkBnZKjIGhJvByPJEiC
   BnCDN0QOm7eB/UFOoeRw9IO3QAzstI7WWlqGXdhVyIbUqIuaoaqU/cosv
   p02aoE9SPcBMnW1RHV196K6vEoqZoCtYrmhrs/FPxcWAYiGl2AB+iE9uT
   SneWtKNRFekNuQA85VzrbDrnbT5CPwfl9PHflZGxmHB2G+wr9fgC+p43k
   EoFzSL0CJFk8bn2E/D+JaKSLIziWdKrEzkF2WqryA2oWBoaWH/TP9lM60
   g==;
X-CSE-ConnectionGUID: 0jctXfkWRFKi3/VbjTtC2A==
X-CSE-MsgGUID: r9Jpn1yXT8eGuAZnBLQM9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="137019"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="137019"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 05:45:16 -0700
X-CSE-ConnectionGUID: mkar3PMyRf2V6tMT3RhWhQ==
X-CSE-MsgGUID: 5PP0lxqdQCeXG7YG5AdNvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="285525441"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 07 Oct 2026 05:45:15 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xER1F-000000003Fn-13g4;
	Wed, 07 Oct 2026 12:45:13 +0000
Date: Wed, 07 Oct 2026 14:44:28 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-drivers:master 11/75]
 arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dtb: hub@1
 (usb4b4,6502): 'peer-hub' is a required property
Message-ID: <202610071406.U5JsA9u8-lkp@intel.com>
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
commit: 1fbab7d1380655531e08f5a3c81c5889f5ca6368 [11/75] arm64: dts: renesas: Add support for solidrun hb-ripple with rzv2l som
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-randconfig-2402-20260929 (https://download.01.org/0day-ci/archive/20261007/202610071406.U5JsA9u8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610071406.U5JsA9u8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610071406.U5JsA9u8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple-emmc.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple-emmc.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple-emmc.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple-microsd.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple-microsd.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-ripple-microsd.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
