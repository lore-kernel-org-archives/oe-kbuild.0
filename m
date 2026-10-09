Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965D94F7997
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Oct 2026 18:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570318; cv=none; b=kHX50fVEOZBnwtIs/0y3rZLbSc6FB3cRJCQVsrYnB6Qkcy/EhpZ+p6w0k4UzTEJq2A46FC2MF8aTCY/eCYIBQLz0ddxSnQShT4u+o/3ntT2fWt+W3OT5RfL9TkL4LZAKPwcZnNC9QlNiKckrcC5XJYQg9ZXPShMFxWk0bjunZ8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570318; c=relaxed/simple;
	bh=E3fKWdDT0tkdFJy8yQEIScmvWnCzEXhzHApw5F7Z9k0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=slfk6g2icT9kPONLnxiKCH1ag0929mbHcyiM+l5qHYCG7iSBRllqkBXinNomMvBsuqpZqWaFUBzfc+a24QL2FHt5RWIoqV0AyprZIsF2XQ8McLX+mv/f8YyeW5/OAKub6NOtVkNOVl2Blo0s7by7XajtMRkElu5fSwNBRmbAhYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fafmvXwV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fafmvXwV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791570316; x=1823106316;
  h=date:from:to:cc:subject:message-id;
  bh=E3fKWdDT0tkdFJy8yQEIScmvWnCzEXhzHApw5F7Z9k0=;
  b=fafmvXwVSs7MKoazPluDqcydaCpkQkpOdcYfwNFyjhmAOH0MxkSnnG9w
   1V+2cTVCxTupBOfD4lSOKxGOygFSJRMt9YnmhDOqU8eRzHLPVhbTmc6uk
   y7LrSaOS17M4TYDny5L4qtwqI+kw7jWx5PFQ8RMdzUII01v41kzrNo8zz
   LsJkBsXfF+hotdXSPUZhYpsBnE6cEMXvHpqmepdj4LLAV3zJGdwsvQ2aL
   g8Ed2q+sjGI0FXwSYzGzQaX68ASsOKs0ohTe+UqkVMsgWaftV5Xmt3qrE
   noVgFwuyhuxXYQefYwBnE8VN/sRzPAexMp8I/0e8UYu/dTg+YNBis4k/Y
   w==;
X-CSE-ConnectionGUID: U3Aywq3zRWuqyShbXQQ72Q==
X-CSE-MsgGUID: G7N5/Hx4SZGTMWe0Q6ZXcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="369139"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="369139"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 11:25:16 -0700
X-CSE-ConnectionGUID: tzVztdIrRDmSb3DYnjuQUQ==
X-CSE-MsgGUID: liB2OI6vSDaY4R8dRAqEew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="470133"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 09 Oct 2026 11:25:14 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFFHL-000000007Ep-2gOl;
	Fri, 09 Oct 2026 18:25:11 +0000
Date: Fri, 09 Oct 2026 20:24:14 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-drivers:master 7/75]
 arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dtb: hub@1
 (usb4b4,6502): 'peer-hub' is a required property
Message-ID: <202610092055.Dswv1hgr-lkp@intel.com>
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
commit: 823703cb5e3a6825daf8ce5dbfc03aeafbc5b688 [7/75] arm64: dts: renesas: Add support for solidrun rzv2l som and hb-iiot evb
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: arm64-randconfig-2402-20260929 (https://download.01.org/0day-ci/archive/20261009/202610092055.Dswv1hgr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610092055.Dswv1hgr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610092055.Dswv1hgr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-rs485-b.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-rs485-b.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-rs485-b.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-rs485-a.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-rs485-a.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-rs485-a.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-emmc.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-emmc.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-emmc.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-microsd.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-microsd.dtb: pinctrl@11030000 (renesas,r9a07g054-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g054l2-hummingboard-iiot-microsd.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
