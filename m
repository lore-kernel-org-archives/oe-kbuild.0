Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE37354704E
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Oct 2026 04:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791260967; cv=none; b=DticgoXtVCYjI3H0sLebJpglEwQIhk6bP+7sZ6cp4DhzYG3+cvv8YWXLaVtL2DCjUln8rovjy0bYK0y/Y6BRaC886f+tQy5x1huUkqDAodh/ChHIbq8yQjbpAGBl6T0k5l4HH81HDUfU2Cuu3L7DqUpLxAbBiI5eFwbuyyYkrZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791260967; c=relaxed/simple;
	bh=LEbmp9EuShhWub0bhPRnBwvw4B1WdYf/z0Z04+or46I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bLggyGsQW1Y2jL5uMdR6HTubiBO2dD1jibmxJtLdCIT8wI48heCDtsShKmVQBAqtiOvA/0IJVCwJCR1wX1qIaEVRW558fN9CYH6whSMkCkr9s18zXUVvcE7L/HXGupWdtn4txsmMuCQlH7m3vvVlGMnXYHlVmiQnVQB4FcKgVNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+OaIz7s; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+OaIz7s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791260966; x=1822796966;
  h=date:from:to:cc:subject:message-id;
  bh=LEbmp9EuShhWub0bhPRnBwvw4B1WdYf/z0Z04+or46I=;
  b=i+OaIz7s6VCCLmCRGdaguHtzzYsF17AeMDwqub5b2r1xt6XiwTXAhx7C
   UZpKrx3q41FSly0POzFFgwqcIeSiOs4vdH/0tknagAz574TM+Ic03d9OF
   BSAfK/3npQeNLCo4SyhGJDB8qeRurKc8iIBu3/PbFnLuV+cM5xWHSYijm
   tZ1mYXQtD6d+kurfpfp5kEUJ0f4nYXl5yB6eAluV5Phk1tS4j2XMqyKlg
   hH9YqN0wslloSu0mUO2iaFJ9nWXrmbLOcv8aLJ+Xp7cJB18x8rslawxnk
   IUFkUTX+CcdqVsml8uwVOokgOXvOxaeLQai33LcCXiTLmYXRtFqGhKYes
   A==;
X-CSE-ConnectionGUID: NuzJA00CQA+gLzm0b+mxNw==
X-CSE-MsgGUID: n7x+0YjWRleUFnnKMAZDsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102103321"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102103321"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 21:29:25 -0700
X-CSE-ConnectionGUID: OTfwNQ7FSTCn11KI0jXNFg==
X-CSE-MsgGUID: mSz/X/GLSgmlqSwKTTfx+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="276160492"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 05 Oct 2026 21:29:24 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDwnp-000000000iB-0kbI;
	Tue, 06 Oct 2026 04:29:21 +0000
Date: Tue, 06 Oct 2026 06:28:22 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-drivers:master 8/75]
 arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dtb: hub@1
 (usb4b4,6502): 'peer-hub' is a required property
Message-ID: <202610060654.oBFL9Jcr-lkp@intel.com>
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
commit: 17ed07aa3b1222da7c33635cf47c4832d6c8f910 [8/75] arm64: dts: renesas: Add support for solidrun rzg2lc som and hb-iiot evb
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-2402-20260929 (https://download.01.org/0day-ci/archive/20261006/202610060654.oBFL9Jcr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610060654.oBFL9Jcr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610060654.oBFL9Jcr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-rs485-a.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-rs485-a.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-rs485-a.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-rs485-b.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-rs485-b.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-rs485-b.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-emmc.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-emmc.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-emmc.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-microsd.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-microsd.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044c2-hummingboard-iiot-microsd.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
