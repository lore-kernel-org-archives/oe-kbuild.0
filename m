Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D192D2EBDEC
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Aug 2025 11:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755170523; cv=none; b=k+QcKYBEqn1jkHUroXGq9hBQA3Gw7Q4hVewoVClR1gilEKCYu24bxkrWqQzisrUgGLwY6OdHuS/wOXkE5qc6jnU9rAeBC4kiXXs5CAP954q1neDx5lvfrFEkRK+SEal8J+AvLVCOlRACrTyUx8iPo9+dIbvl4uBvb+mB05TJfN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755170523; c=relaxed/simple;
	bh=dwQglrujW+mO3z/4hqGOV9WHJ+urs2UWjoRgqAas3SA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GDmYi7Hxw/C88FA5HEc7MSpHzIeN/b/MYkD8ETzcqzWhYsUTH7ifQmqExvZMr2nzCIQswHnW8umKdH5dFPUF0L5/ACMvqALka5k/VcMoINdB98loMYbkPALeBFyoP4oWJsUiXRdnFSnCIWp2c7trJTmgq/or0WDnhPZ2ONOT/Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WvixtVPQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WvixtVPQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755170522; x=1786706522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dwQglrujW+mO3z/4hqGOV9WHJ+urs2UWjoRgqAas3SA=;
  b=WvixtVPQXT4xstzjlsfmPkWa/EKuSqZcx9IZ/DlgeFZTIFrVo98v+o4U
   00zkAoKHA/2JKNAmKcvDmcZnpCjlNqTlqOSOmEfDpI5XBmJmrQ94rZ81F
   BbFzflqzkI4YqdYMmKy+YrqGC0/NdG4l1wpXmQO4PEAQbGUP7q9dWUNhJ
   mIxFrlQoCoWVxewX61dYNW7sgf1N6EORtYBeDVlwiWr5+BnAR6vrXpCHD
   ebFqQcW1+cilIGxi7UI/mxLG4ToHCYsyIqViVKjrXWXicuIaLZKkrTTCw
   1I7lyhEjiPXnQYfA3Ygc8rWnk3P4sHKjPEf1MZt9Sy0T6k09bhuNCly36
   g==;
X-CSE-ConnectionGUID: boxw+1+CSXKjJAbnzEe/8A==
X-CSE-MsgGUID: AyipAGoSQuqJ92lee5eFVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="75054362"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="75054362"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 04:21:59 -0700
X-CSE-ConnectionGUID: WYcYSO+xQ26Cxo72zxSdUQ==
X-CSE-MsgGUID: n/Jk1Bj5S6WS8EpbNDrSNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="167542410"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 14 Aug 2025 04:21:58 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umW1s-000Atc-0K;
	Thu, 14 Aug 2025 11:21:56 +0000
Date: Thu, 14 Aug 2025 19:20:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 6/6] riscv: dts: spacemit: PCIe and PHY-related updates
Message-ID: <202508141900.C5xJNYyz-lkp@intel.com>
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
In-Reply-To: <20250813184701.2444372-7-elder@riscstar.com>
References: <20250813184701.2444372-7-elder@riscstar.com>
TO: Alex Elder <elder@riscstar.com>
TO: lpieralisi@kernel.org
TO: kwilczynski@kernel.org
TO: mani@kernel.org
TO: robh@kernel.org
TO: bhelgaas@google.com
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: vkoul@kernel.org
TO: kishon@kernel.org
CC: dlan@gentoo.org
CC: paul.walmsley@sifive.com
CC: palmer@dabbelt.com
CC: aou@eecs.berkeley.edu
CC: alex@ghiti.fr
CC: p.zabel@pengutronix.de
CC: tglx@linutronix.de
CC: johan+linaro@kernel.org
CC: thippeswamy.havalige@amd.com
CC: namcao@linutronix.de
CC: mayank.rana@oss.qualcomm.com
CC: shradha.t@samsung.com
CC: inochiama@gmail.com
CC: quic_schintav@quicinc.com
CC: fan.ni@samsung.com
CC: devicetree@vger.kernel.org
CC: linux-phy@lists.infradead.org
CC: linux-pci@vger.kernel.org
CC: spacemit@lists.linux.dev
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Alex,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f5ae30d69d7543eee0d70083daf4de8fe15d585]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Elder/dt-bindings-phy-spacemit-add-SpacemiT-PCIe-combo-PHY/20250814-024953
base:   8f5ae30d69d7543eee0d70083daf4de8fe15d585
patch link:    https://lore.kernel.org/r/20250813184701.2444372-7-elder%40riscstar.com
patch subject: [PATCH 6/6] riscv: dts: spacemit: PCIe and PHY-related updates
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: riscv-randconfig-051-20250814 (https://download.01.org/0day-ci/archive/20250814/202508141900.C5xJNYyz-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 10.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508141900.C5xJNYyz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508141900.C5xJNYyz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: serial@f0612000 (spacemit,k1-uart): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: serial@f0612000 (spacemit,k1-uart): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/pcie-bus/pcie@ca000000: failed to match any schema with compatible: ['spacemit,k1-pcie-rc']
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/pcie-bus/pcie@ca400000: failed to match any schema with compatible: ['spacemit,k1-pcie-rc']
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/pcie-bus/pcie@ca800000: failed to match any schema with compatible: ['spacemit,k1-pcie-rc']
--
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: serial@f0612000 (spacemit,k1-uart): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: serial@f0612000 (spacemit,k1-uart): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/pcie-bus/pcie@ca000000: failed to match any schema with compatible: ['spacemit,k1-pcie-rc']
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/pcie-bus/pcie@ca400000: failed to match any schema with compatible: ['spacemit,k1-pcie-rc']
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/pcie-bus/pcie@ca800000: failed to match any schema with compatible: ['spacemit,k1-pcie-rc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
