Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01464A11
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Apr 2025 17:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745773384; cv=none; b=X88U88+L/yraKtABk9dYjwfqry6lLdqY8N/e8YKy4uJ6srwqfxKZJcoTMxm7KBAwPboE4s4JEIQ17nGzgjxCTCL6xTnyz3/g/Hl30eX5zeiJ2iOlz2KtjrZyQKF1mHkiJEPW7WZghbQMtSIyk1b5ukOImwbwElHz3Jq7jYQ/93c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745773384; c=relaxed/simple;
	bh=BTvcq1dpcxbl8bGC3jHC/L5P/X0bEzN87Dbff+Uo2bE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Usyk+3uEOtbtzStB7B3tQnM9JR18fGwwfF20+aIXWIC6KF2eMAcczZqML+pxu/LpGs1bLsmiCD9H71xc41HFSIqLt1CUWYJr44+uiFlQtqyPhBxBSIY+HRwYnXy1dkBD/jTL5pCEp2zAFKTmeSsd6uoA39CwF35WNsyuemRtV7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EmOH/pvu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EmOH/pvu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745773382; x=1777309382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BTvcq1dpcxbl8bGC3jHC/L5P/X0bEzN87Dbff+Uo2bE=;
  b=EmOH/pvuwVrkoE85YodpK+e2qpD6UAxSNnKN5TVe+wBC1w3MtvBlo3h5
   8K4zZKVS6um56XT6n8Qok1lwCodbAleB+QNa2oyWQw8/QddIjb5Og6e5J
   zi/06ej3TqSqR2qDOgXyGjNYPaNJ/FeF0BGBsYEIjtL82kSpJ4TN7e9Ld
   RqySxGERJmYj8z53PP2PiWzMuKoB/ULOm+Yu9CAW1yvIE7VPq3tOYbny7
   FI/xFa1Yks5MFIHcVD1kgwuH/lGbJ32p4AY/htQS1RTwRchAK+fQjECHu
   fqOG9iS+k+HBUADHVFVIoA7H1WGW1iGyybbYZnqv4Vx4JkB0woeqkiiLR
   A==;
X-CSE-ConnectionGUID: cnlTeM4CRLaFw5Ve5oXpJA==
X-CSE-MsgGUID: USLs/d0DTkirv+xUEXRyiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="72740714"
X-IronPort-AV: E=Sophos;i="6.15,244,1739865600"; 
   d="scan'208";a="72740714"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 10:03:01 -0700
X-CSE-ConnectionGUID: Hqk2VNOsQQetxq1dCUziLg==
X-CSE-MsgGUID: Up8GbcFJRZ68XtdPpk5W/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,244,1739865600"; 
   d="scan'208";a="138134208"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Apr 2025 10:03:00 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u95P7-0006P3-2d;
	Sun, 27 Apr 2025 17:02:57 +0000
Date: Mon, 28 Apr 2025 01:02:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add rk3399-evb-ind board
Message-ID: <202504280022.kbrAbXUG-lkp@intel.com>
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
In-Reply-To: <20250427094211.246-3-kernel@airkyi.com>
References: <20250427094211.246-3-kernel@airkyi.com>
TO: Chaoyi Chen <kernel@airkyi.com>
TO: Heiko Stuebner <heiko@sntech.de>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Jonas Karlman <jonas@kwiboo.se>
CC: Kever Yang <kever.yang@rock-chips.com>
CC: Jianfeng Liu <liujianfeng1994@gmail.com>
CC: Dragan Simic <dsimic@manjaro.org>
CC: Jimmy Hon <honyuenkwun@gmail.com>
CC: Quentin Schulz <quentin.schulz@cherry.de>
CC: FUKAUMI Naoki <naoki@radxa.com>
CC: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
CC: Alexey Charkov <alchark@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Sebastian Reichel <sebastian.reichel@collabora.com>
CC: Chaoyi Chen <chaoyi.chen@rock-chips.com>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Chaoyi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on rockchip/for-next krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.15-rc3 next-20250424]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chaoyi-Chen/dt-bindings-arm-rockchip-Add-rk3399-industry-evaluation-board/20250427-174445
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250427094211.246-3-kernel%40airkyi.com
patch subject: [PATCH 2/2] arm64: dts: rockchip: Add rk3399-evb-ind board
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: arm64-randconfig-052-20250427 (https://download.01.org/0day-ci/archive/20250428/202504280022.kbrAbXUG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.3.dev19+g53ef030
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250428/202504280022.kbrAbXUG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504280022.kbrAbXUG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: tcs4526@10 (tcs,tcs4525): Unevaluated properties are not allowed ('regulator-compatible', 'regulator-initial-state' were unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
>> arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
>> arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
>> arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: pmic: vsel2-gpio: {'rockchip,pins': [[1, 14, 0, 164]], 'phandle': 113} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
