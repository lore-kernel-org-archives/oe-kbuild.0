Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A847139D0A
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Aug 2025 02:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755052560; cv=none; b=YjeIcOtFL8cKA9EwwZ6EK+O4U+GiiWu9OX0kX7yKqop60Q2eoeMz2uRXcTHCTlj8IKOUCKOkRkYpBxr21AoX9CL9TkspXJoLHc2GBbEHTDusyeS1NzOVwfsWP96Y7TO6ic+xvxt3pgtd3vtUoILjNMtDaJPRPENR/Uv7h/Hm9wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755052560; c=relaxed/simple;
	bh=nBM8acoPkw2x1ASLW02yvz7iVKZQftZM8E+/k5tLTIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=apfr2SY7aBgtATOIRF4GbHhQrlwbpFkFHqJ9Uhv5SaDzDpWAuRK8Ixeq4RvPasSD2F6dttyT3cCLkEysSwp6Gxdz/9QWIODcTWarmTpJZXBV+/XvnPCbtmO/m+aWc0NiEd7lgEvmh2oD7BLh++AU0Fla4gStB4DXWA3jujx7rQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5meiqvT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5meiqvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755052558; x=1786588558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nBM8acoPkw2x1ASLW02yvz7iVKZQftZM8E+/k5tLTIg=;
  b=g5meiqvTkPvSGtZHN7hp+X+Ja67300BGQINVhHHVi/ndUBx9i0aYbbZA
   rncXU1Roqm77D+WHkQcezoKoo3/E+P06PR+MqWoDyYq2HKK6f64xxa/LT
   QHzAeZfcQs5B2VQMKFsf9G/3Y3ap/YYXmVnkq7qweOsgc58BEqGFbHgen
   935Opw5q7OcHaNTG9ZxKG2qiYYtri9cKRFlOSECNp+jFec/2R/0iBQovO
   d5Q3FJal1R0UzP/5cCdafzdps/ix1Zgd2g4Mpt5mvBjEat9kpwj8gElUI
   hA1bPWu8p2W++JcpGII1aMPAy082VD3hulNVnmrpdTLYYjtKU3Izy5JpX
   g==;
X-CSE-ConnectionGUID: Wpy//MGLR/2LOiQsEHc+cg==
X-CSE-MsgGUID: rzGYa5RTRgqmbTCFeLsbRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="61139925"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="61139925"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 19:35:57 -0700
X-CSE-ConnectionGUID: /eLVkBXyQh6LlvIrGlKZew==
X-CSE-MsgGUID: FuOZdxb8RYWYYpZpkNeDZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="166721034"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 12 Aug 2025 19:35:56 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1um1Kq-0009TU-2c;
	Wed, 13 Aug 2025 02:35:39 +0000
Date: Wed, 13 Aug 2025 10:35:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/6] arm64: dts: broadcom: bcm2712: Add pin controller
 nodes
Message-ID: <202508130908.mmjdJJFQ-lkp@intel.com>
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
In-Reply-To: <df99c6a2eeac4bed76bcc6bd74e44a061963256e.1754924348.git.andrea.porta@suse.com>
References: <df99c6a2eeac4bed76bcc6bd74e44a061963256e.1754924348.git.andrea.porta@suse.com>
TO: Andrea della Porta <andrea.porta@suse.com>
TO: linus.walleij@linaro.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: florian.fainelli@broadcom.com
TO: wahrenst@gmx.net
TO: linux-gpio@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Will Deacon <will@kernel.org>
TO: iivanov@suse.de
TO: svarbanov@suse.de
TO: mbrugger@suse.com
TO: Jonathan Bell <jonathan@raspberrypi.com>
TO: Phil Elwell <phil@raspberrypi.com>
TO: Ulf Hansson <ulf.hansson@linaro.org>
TO: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
TO: Al Cooper <alcooperx@gmail.com>
TO: linux-mmc@vger.kernel.org
TO: Jiri Slaby <jirislaby@kernel.org>
TO: linux-serial@vger.kernel.org
CC: Andrea della Porta <andrea.porta@suse.com>

Hi Andrea,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on tty/tty-testing tty/tty-next tty/tty-linus rockchip/for-next linus/master v6.17-rc1 next-20250812]
[cannot apply to arm/for-next arm/fixes arm64/for-next/core kvmarm/next shawnguo/for-next soc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrea-della-Porta/dt-bindings-mmc-Add-support-for-capabilities-to-Broadcom-SDHCI-controller/20250811-232101
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/df99c6a2eeac4bed76bcc6bd74e44a061963256e.1754924348.git.andrea.porta%40suse.com
patch subject: [PATCH 3/6] arm64: dts: broadcom: bcm2712: Add pin controller nodes
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: arm64-randconfig-051-20250812 (https://download.01.org/0day-ci/archive/20250813/202508130908.mmjdJJFQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508130908.mmjdJJFQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508130908.mmjdJJFQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:504.4-507.31: Warning (interrupt_map): /axi/pcie@1000110000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:504.4-507.31: Warning (interrupt_map): /axi/pcie@1000110000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:543.4-546.31: Warning (interrupt_map): /axi/pcie@1000120000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:543.4-546.31: Warning (interrupt_map): /axi/pcie@1000120000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:543.4-546.31: Warning (interrupt_map): /axi/pcie@1000120000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:543.4-546.31: Warning (interrupt_map): /axi/pcie@1000120000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: soc@107c000000 (simple-bus): firmware: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: soc@107c000000 (simple-bus): power: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/pinctrl@7d504100: failed to match any schema with compatible: ['brcm,bcm2712c0-pinctrl']
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: /soc@107c000000/pinctrl@7d510700: failed to match any schema with compatible: ['brcm,bcm2712c0-aon-pinctrl']
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7c701400 (brcm,bcm2712-hdmi0): interrupt-names:3: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7c701400 (brcm,bcm2712-hdmi0): interrupt-names:4: 'hpd-connected' was expected
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7c701400 (brcm,bcm2712-hdmi0): interrupt-names: ['cec-tx', 'cec-rx', 'cec-low', 'hpd-connected', 'hpd-removed'] is too short
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7c701400 (brcm,bcm2712-hdmi0): interrupts: [[1], [2], [3], [7], [8]] is too short
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb: hdmi@7c706400 (brcm,bcm2712-hdmi1): interrupt-names:3: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
--
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:504.4-507.31: Warning (interrupt_map): /axi/pcie@1000110000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:504.4-507.31: Warning (interrupt_map): /axi/pcie@1000110000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:543.4-546.31: Warning (interrupt_map): /axi/pcie@1000120000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:543.4-546.31: Warning (interrupt_map): /axi/pcie@1000120000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:543.4-546.31: Warning (interrupt_map): /axi/pcie@1000120000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:543.4-546.31: Warning (interrupt_map): /axi/pcie@1000120000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: soc@107c000000 (simple-bus): power: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: soc@107c000000 (simple-bus): firmware: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: /soc@107c000000/pinctrl@7d504100: failed to match any schema with compatible: ['brcm,bcm2712c0-pinctrl']
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: /soc@107c000000/pinctrl@7d510700: failed to match any schema with compatible: ['brcm,bcm2712c0-aon-pinctrl']
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: hdmi@7c701400 (brcm,bcm2712-hdmi0): interrupt-names:3: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: hdmi@7c701400 (brcm,bcm2712-hdmi0): interrupt-names:4: 'hpd-connected' was expected
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: hdmi@7c701400 (brcm,bcm2712-hdmi0): interrupt-names: ['cec-tx', 'cec-rx', 'cec-low', 'hpd-connected', 'hpd-removed'] is too short
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: hdmi@7c701400 (brcm,bcm2712-hdmi0): interrupts: [[1], [2], [3], [7], [8]] is too short
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb: hdmi@7c706400 (brcm,bcm2712-hdmi1): interrupt-names:3: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
--
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:504.4-507.31: Warning (interrupt_map): /axi/pcie@1000110000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:504.4-507.31: Warning (interrupt_map): /axi/pcie@1000110000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:543.4-546.31: Warning (interrupt_map): /axi/pcie@1000120000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:543.4-546.31: Warning (interrupt_map): /axi/pcie@1000120000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:543.4-546.31: Warning (interrupt_map): /axi/pcie@1000120000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:543.4-546.31: Warning (interrupt_map): /axi/pcie@1000120000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: soc@107c000000 (simple-bus): firmware: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: soc@107c000000 (simple-bus): power: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/pinctrl@7d504100: failed to match any schema with compatible: ['brcm,bcm2712c0-pinctrl']
>> arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: /soc@107c000000/pinctrl@7d510700: failed to match any schema with compatible: ['brcm,bcm2712c0-aon-pinctrl']
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7c701400 (brcm,bcm2712-hdmi0): interrupt-names:3: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7c701400 (brcm,bcm2712-hdmi0): interrupt-names:4: 'hpd-connected' was expected
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7c701400 (brcm,bcm2712-hdmi0): interrupt-names: ['cec-tx', 'cec-rx', 'cec-low', 'hpd-connected', 'hpd-removed'] is too short
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7c701400 (brcm,bcm2712-hdmi0): interrupts: [[1], [2], [3], [7], [8]] is too short
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#
   arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb: hdmi@7c706400 (brcm,bcm2712-hdmi1): interrupt-names:3: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/display/brcm,bcm2711-hdmi.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
