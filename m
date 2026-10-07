Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9677C1397
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Oct 2026 02:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791340578; cv=none; b=EbmkdWwEaAU79VT/OuabKjqSj3nhWogTCROJi7ukgg9jw6VyfSato2QO4JT71hugeG6LEPcUH3kFBg7Xm1a2x76+I3P7ZnOI2vO+q61ieR4ymcCKFitANmr4+rPTJUJs79pupvMe2inDqE0eVRo5/WnwvTu8GvOZlRC1DgWvWnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791340578; c=relaxed/simple;
	bh=SzVtwlkb5nxXMAj12BFAYQV8bDoIeLdB68ip72dImWE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=esLfhGxVa8H9xD5IpW2UcbSkSRYsYt1pMhSMQr7BnlaJ7SYwH2yHSAAF8U91WvHaDAlVprnEVCB5R95jkyIb2vLZa8B55eqD7vjjAH/E0k9qYcaiqEWdS9z8k9Kv3+cQmg8MxZ3TkbynEmLydL1Jfdj/ubLe7vcxlFh9o8yR064=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SBaX5aMJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SBaX5aMJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791340576; x=1822876576;
  h=date:from:to:cc:subject:message-id;
  bh=SzVtwlkb5nxXMAj12BFAYQV8bDoIeLdB68ip72dImWE=;
  b=SBaX5aMJUww3Sv3CFCyh+2niHbjOVcem9ohfVXsgM+xAFP2G65ioPyZs
   kXS6UL9hM6Hpv8gNGPAvob2a2ugewXay3tMRYivDxiRWtQB2R8nGKmsix
   VHnw2FRvE66AxfWIb9QcDd+1xqV+kszdAamTYdQV9xzMcynGbqSEtTUuM
   6LppPCU3YU+3k+Q2GM83bXsPiadNzStJ4xiY/klHPOpptK4Lft66NjoeD
   clIU5RpvXgNa1wVnsGrZw6w8aGV9o4WOLep68YGFoVgi/CvxxPV6yiOU8
   nJnEQSJPFjUMdCYpk+HmF5v4Amc5PQJTJI+fYAp8te32sNAcklA6W1NvG
   w==;
X-CSE-ConnectionGUID: aKiDiUvCQ5KzjwmhLFwgzQ==
X-CSE-MsgGUID: 7kKlODU6S8auvd7s5Ra3cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="196527"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="196527"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 19:36:16 -0700
X-CSE-ConnectionGUID: 35hhJzIuRhqdMG/K4RGFvA==
X-CSE-MsgGUID: okN2fiPjSZy0X9kvPffoEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="276830747"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 06 Oct 2026 19:36:14 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEHVs-000000002Jr-2CzL;
	Wed, 07 Oct 2026 02:36:12 +0000
Date: Wed, 07 Oct 2026 04:36:01 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-drivers:master 10/75]
 arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dtb: hub@1
 (usb4b4,6502): 'peer-hub' is a required property
Message-ID: <202610070435.dzcPYVM3-lkp@intel.com>
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
commit: dadb5237822b112cf51e2b27aa0613068294b289 [10/75] arm64: dts: renesas: Add support for solidrun hb-ripple with rzg2l som
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm64-randconfig-2402-20260929 (https://download.01.org/0day-ci/archive/20261007/202610070435.dzcPYVM3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610070435.dzcPYVM3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610070435.dzcPYVM3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple-emmc.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple-emmc.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple-emmc.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml
--
   arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple-microsd.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
   arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple-microsd.dtb: pinctrl@11030000 (renesas,r9a07g044-pinctrl): sdhi0-4bit-uhs: 'anyOf' conditional failed, one must be fixed:
   	'sd0_ctrl_dat03', 'sd0_dat47' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'input-disable' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a07g044l2-hummingboard-ripple-microsd.dtb: hub@1 (usb4b4,6502): 'peer-hub' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/cypress,hx3.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
