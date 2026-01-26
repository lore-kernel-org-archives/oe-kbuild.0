Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A70B2367D5
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 14:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769438185; cv=none; b=usc8hp1BpbG3UrLMBJ0T0igRVnqY2hzKWbLm9TMIFOQUiRmZaODUrCd6nWKcvwaMV8SkrD1POGQdfrwYvIgPAtRK6euXHwxMZj88WeozQOSS9tO2FhGGRrWP9v62AX6BJz7p4/86mK4kyrhizR+eQdaARpad7/vksZkKMy3pTFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769438185; c=relaxed/simple;
	bh=AjjE2XHBjFm/0HP6bsXiJOYk29LozzIWuClysXG7mgA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ad2V9HSG3vXOyoOfIfuYBq6qu6wKFzMAzeA/vceRfwOmeZnijqChNIoW2SFwpBCgWyO/g6/KOcvCbbhHMdGi/VgPFpqca5cGfDv6cyL1X0zG/kd15DGR9eP60C7tEdMyTPghGjSPXWqSDlEOaYq7uGuVCEgBghvILxrqTrsHAS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K4pzTqcB; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K4pzTqcB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769438183; x=1800974183;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AjjE2XHBjFm/0HP6bsXiJOYk29LozzIWuClysXG7mgA=;
  b=K4pzTqcB0Qk/OsCz1EcfziFJ893DqNLEB+uOr1kXAoYbikpRkLpikjB0
   L4ivNFVxYfHBQrWIcLVaP88S2nwgId6no7RLEbEH5kwzsB5+Wvo5YefDp
   M7eHeoSf9PDeVxxavud7qqbztG3rDQJdOq0oKNzXjwIvSRq+7Wk2QfzHL
   hXjevmft80r3bqWudPl1KczIRNcqH9yCU+TqNWJOX2TXKSMRFJV/L879D
   alUup3q5iSbXgq9vHgS3ao2f+eUTsMbFTe3rXhgrl2lKhiZotsAVTFAc/
   sbq/r6yO6xox+c7klnHhbTSPfrPqsPpukRWPlcLJhsBt8Iiwcb2BqW9IS
   g==;
X-CSE-ConnectionGUID: Y9KtWzRkQqSRVu31cvnEtA==
X-CSE-MsgGUID: 9CdD2Y1rQTylQ4AZ3zkJwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70513605"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="70513605"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 06:36:23 -0800
X-CSE-ConnectionGUID: qarcT4IGTPKJGW/heu17fQ==
X-CSE-MsgGUID: XC7AMz8SS9mxGrWzwKRDpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="207491388"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 26 Jan 2026 06:36:21 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkNhT-000000001Y5-11Li;
	Mon, 26 Jan 2026 14:36:19 +0000
Date: Mon, 26 Jan 2026 15:36:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb:
 usb@5e000 (marvell,armada-3700-ehci): phy-names:0: 'usb' was expected
Message-ID: <202601261540.Z62USPx6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Tom=C3=A1=C5=A1 Macholda" <tomas.macholda@nic.cz>
CC: Gregory CLEMENT <gregory.clement@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   63804fed149a6750ffd28610c5c1c98cce6bd377
commit: 0b738a2901f43980fc2307a50a26457be1c8030b arm64: dts: marvell: add d=
ts for RIPE Atlas Probe v5
date:   5 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-2052-20260123 (https://download.01.org/0day-ci/arc=
hive/20260126/202601261540.Z62USPx6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260126/202601261540.Z62USPx6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601261540.Z62USPx6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: phy@18300 (marvell=
,comphy-a3700): clock-names:0: 'mg_clk' was expected
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110=
.yaml
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: phy@18300 (marvell=
,comphy-a3700): clock-names: ['xtal'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110=
.yaml
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: phy@18300 (marvell=
,comphy-a3700): clocks: [[4]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/marvell,comphy-cp110=
.yaml
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /soc/bus@d0000000/=
pinctrl@18800: failed to match any schema with compatible: ['marvell,armada=
3710-sb-pinctrl', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: pinctrl@18800 (mar=
vell,armada3710-sb-pinctrl): reg: [[100352, 256], [101376, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /soc/bus@d0000000/=
system-controller@5d800: failed to match any schema with compatible: ['marv=
ell,armada-3700-usb2-host-device-misc', 'syscon']
>> arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: usb@5e000 (marvell=
,armada-3700-ehci): phy-names:0: 'usb' was expected
   	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /soc/bus@d0000000/=
mailbox@b0000: failed to match any schema with compatible: ['marvell,armada=
-3700-rwtm-mailbox']
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: mmc@d8000 (marvell=
,armada-3700-sdhci): Unevaluated properties are not allowed ('marvell,xenon=
-emmc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/marvell,xenon-sdhci.=
yaml
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: pcie@d0070000 (mar=
vell,armada-3700-pcie): interrupt-controller: '#address-cells' does not mat=
ch any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pci/marvell,armada-3700-=
pcie.yaml
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /firmware/armada-3=
700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700=
-rwtm-firmware', 'cznic,turris-mox-rwtm']
   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dtb: /firmware/armada-3=
700-rwtm: failed to match any schema with compatible: ['marvell,armada-3700=
-rwtm-firmware', 'cznic,turris-mox-rwtm']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
