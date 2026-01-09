Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87191FC0FC
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Jan 2026 18:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767983848; cv=none; b=VDLrtUKR6rBpYeEhYz0Tr3WloMIZnpebpcHc6H/QSIZ3EUgK19RpjZ2O+1vXgWgqfOHVJNRBwUlA7SQctwEYJRwrCdcTsZZgFQab5Ge7CBWuZw7KnoWEpBpO39Sx+fzMMzfvBOJ2b6fY4g5YX7+bUFj26Ukrle2MoO+eVQ9gxbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767983848; c=relaxed/simple;
	bh=R0vbaxuEyJAcCvkBjx7Pn10qd+1M9nuswwLGTAZpPso=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=olFB/E68Bi4QLRq5hXIFkR0Fs8qCzuUzsnLhyWUw9Pk2wuMV20QfaX+3+7IaUc2zCJAxF6vqMaHFQgdY40AotLGVSndqCfOE4hqZtxhS7Vf92hZK2OxSC3YBhuoRnl3+hnpOalsfS187LOrkOv9+/7/YJVtH46Qv/NTB5wLv+NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWlHKDn+; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWlHKDn+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767983847; x=1799519847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R0vbaxuEyJAcCvkBjx7Pn10qd+1M9nuswwLGTAZpPso=;
  b=SWlHKDn+UR0wnB9dJ+xF2I2rdqRiRg65N7B4hLcXQQP0uJKg9nqiVfXx
   q9jP+Ukylf5ZbDh3beIhAmlH9ZOXDdhsF48VV9jGYlBPqJDzyF+FInjyx
   Cy5kMyy40RrpUkdzlA0XC9O78D8kM4nvYjdjfcslNHFiNONMjfjV4+E+Y
   ECuVQx1NWKbMKlOdygfpqyrDMYAljtloyBQzym8ZybXorjZPsg8eGnMjE
   CIa6tSfaHN3dsnHnvq39Wt4SgWouxU42P4IF6SiPwlJDKQYeBrk0uKJdI
   pztmJVOQhBw0741fa1YBn727O25SOh+SOF7W66vXmYYqtfKHo5t9nSwCi
   w==;
X-CSE-ConnectionGUID: UxMJVAAZS6yXkrC820k3fQ==
X-CSE-MsgGUID: HfMro3d2RBSiQiN0Z82bNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69525540"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="69525540"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 10:37:27 -0800
X-CSE-ConnectionGUID: AOCx6yBwTa6Rl+8797UOxg==
X-CSE-MsgGUID: JtrwoqEBRtaijbwr6BIqDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="241044142"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 09 Jan 2026 10:37:26 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veHMR-0000000027Y-1orH;
	Fri, 09 Jan 2026 18:37:23 +0000
Date: Fri, 9 Jan 2026 19:37:21 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/3] riscv: dts: spacemit: Add USB2 PHY node for K1
Message-ID: <202601091937.0kcvzzQF-lkp@intel.com>
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
In-Reply-To: <20260107-k1-usb3dts-v2-v2-1-e659b0f8fe1a@linux.dev>
References: <20260107-k1-usb3dts-v2-v2-1-e659b0f8fe1a@linux.dev>
TO: Ze Huang <huang.ze@linux.dev>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Paul Walmsley <pjw@kernel.org>
TO: Palmer Dabbelt <palmer@dabbelt.com>
TO: Albert Ou <aou@eecs.berkeley.edu>
TO: Alexandre Ghiti <alex@ghiti.fr>
TO: Yixun Lan <dlan@gentoo.org>
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: spacemit@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: Ze Huang <huang.ze@linux.dev>
CC: Aurelien Jarno <aurelien@aurel32.net>

Hi Ze,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4f67c877a9069c60dfb1767038fba5180bc12d68]

url:    https://github.com/intel-lab-lkp/linux/commits/Ze-Huang/riscv-dts-spacemit-Add-USB2-PHY-node-for-K1/20260107-201328
base:   4f67c877a9069c60dfb1767038fba5180bc12d68
patch link:    https://lore.kernel.org/r/20260107-k1-usb3dts-v2-v2-1-e659b0f8fe1a%40linux.dev
patch subject: [PATCH v2 1/3] riscv: dts: spacemit: Add USB2 PHY node for K1
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-2051-20260109 (https://download.01.org/0day-ci/archive/20260109/202601091937.0kcvzzQF-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601091937.0kcvzzQF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601091937.0kcvzzQF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/phy@c0a30000: failed to match any schema with compatible: ['spacemit,k1-usb2-phy']
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/phy@c0b10000: failed to match any schema with compatible: ['spacemit,k1-combo-phy']
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/phy@c0c10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/phy@c0d10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pcie@ca400000 (spacemit,k1-pcie): pcie@0: 'vpcie3v3-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-host.yaml
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pcie@ca800000 (spacemit,k1-pcie): pcie@0: 'vpcie3v3-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-host.yaml
--
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/phy@c0a30000: failed to match any schema with compatible: ['spacemit,k1-usb2-phy']
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/phy@c0b10000: failed to match any schema with compatible: ['spacemit,k1-combo-phy']
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/phy@c0c10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/phy@c0d10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']
--
>> arch/riscv/boot/dts/spacemit/k1-musepi-pro.dtb: /soc/phy@c0a30000: failed to match any schema with compatible: ['spacemit,k1-usb2-phy']
   arch/riscv/boot/dts/spacemit/k1-musepi-pro.dtb: /soc/phy@c0b10000: failed to match any schema with compatible: ['spacemit,k1-combo-phy']
   arch/riscv/boot/dts/spacemit/k1-musepi-pro.dtb: /soc/phy@c0c10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']
   arch/riscv/boot/dts/spacemit/k1-musepi-pro.dtb: /soc/phy@c0d10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']
--
>> arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dtb: /soc/phy@c0a30000: failed to match any schema with compatible: ['spacemit,k1-usb2-phy']
   arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dtb: /soc/phy@c0b10000: failed to match any schema with compatible: ['spacemit,k1-combo-phy']
   arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dtb: /soc/phy@c0c10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']
   arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dtb: /soc/phy@c0d10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']
--
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: /soc/phy@c0a30000: failed to match any schema with compatible: ['spacemit,k1-usb2-phy']
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: /soc/phy@c0b10000: failed to match any schema with compatible: ['spacemit,k1-combo-phy']
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: /soc/phy@c0c10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: /soc/phy@c0d10000: failed to match any schema with compatible: ['spacemit,k1-pcie-phy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
