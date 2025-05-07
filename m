Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979001B87D5
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 17:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746639630; cv=none; b=W/v1SCoGuWT+P7EWBiOFrRF8VgDqZtuCMLSWfX5mRxYD+MyVk2hIiduXbRy1NGt6Uk2/Tl+FkaQRaziL+iVmApT2F9Q6iistYim/h7S5yCJFh6HvBichuHZqxIdnfgU5lAelzeEUgUK4u7cODJmkoyUZztLexpM7BtAkUSxS/CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746639630; c=relaxed/simple;
	bh=XEU3JtVP0JCqEl1+ZIKdtCUKhyrQ/nzLh/xf7m7tLw0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QhI0HVkV9e9lWMb/0nbkeBVkQE0QZcZK6l5kvyBIzQxIQkH/yHa9ZH+DVkf/TKU0+Fsg73RqVRtW1bCSOPFmkMtshsDejo7Hx524XTsMfnuMKYSbArFrZmtoR3x6wxFef8l3Z/pmarLZJpz2p72VDoCykuwzP9/YnIWmVkLVWJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jOKEeooJ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jOKEeooJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746639629; x=1778175629;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XEU3JtVP0JCqEl1+ZIKdtCUKhyrQ/nzLh/xf7m7tLw0=;
  b=jOKEeooJGy5Yc57rrNAgaU1uBLJbUlZNtaMe0lzBrSGqOLCwkW1QP4Ho
   fZXgZ3U51XSGmhp4Hdt6zMMlWUBAbpyf5Fm4+YWPRL4/jPPxmLO9TSIdj
   NcBi0SqQnKkIk5/zYpLzPDOPZiF2ZLuDdhc0QQejVYGkrh+GVjzpHUYjH
   aIooeCKGaDrg9Y6A+62KF8PtGZTwZhCdX8eGLSADNbuavBamu7HRYI8JU
   eJd7JrU9xsj76qu/hbBiyR/4h17nI4OKzyllFsqzrvRirWZ4jlODbAg1o
   Yx+3rijSZtM1qXuQC39BzR+vst5I0brWC9fMWUV6lurNXlmjDA4OcrFUR
   A==;
X-CSE-ConnectionGUID: r0MH7CsQT6S2KpkeTLzlwQ==
X-CSE-MsgGUID: UdDqjsYmSRufzxJxehFrIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="73775041"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="73775041"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 10:40:28 -0700
X-CSE-ConnectionGUID: vx4XmfbZQGatlWtX9JUseA==
X-CSE-MsgGUID: dFNSfwh7S9S4YJGnl3pqQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="140779312"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 May 2025 10:40:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCikq-0008Ex-1r;
	Wed, 07 May 2025 17:40:24 +0000
Date: Thu, 8 May 2025 01:39:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 2/2] arm64: dts: rockchip: Add rk3399-evb-ind board
Message-ID: <202505080106.d5ZOICtU-lkp@intel.com>
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
In-Reply-To: <20250506034347.57-3-kernel@airkyi.com>
References: <20250506034347.57-3-kernel@airkyi.com>
TO: Chaoyi Chen <kernel@airkyi.com>
TO: Heiko Stuebner <heiko@sntech.de>
CC: Andrew Lunn <andrew@lunn.ch>
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

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on robh/for-next linus/master v6.15-rc5 next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chaoyi-Chen/dt-bindings-arm-rockchip-Add-rk3399-industry-evaluation-board/20250506-151352
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20250506034347.57-3-kernel%40airkyi.com
patch subject: [PATCH v3 2/2] arm64: dts: rockchip: Add rk3399-evb-ind board
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: arm64-randconfig-052-20250507 (https://download.01.org/0day-ci/archive/20250508/202505080106.d5ZOICtU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505080106.d5ZOICtU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505080106.d5ZOICtU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2063.25-2102.4: Warning (avoid_unnecessary_addr_size): /dsi@ff960000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:2104.26-2144.4: Warning (avoid_unnecessary_addr_size): /dsi@ff968000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
>> arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: regulator@10 (tcs,tcs4525): Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: regulator@1c (tcs,tcs4525): Unevaluated properties are not allowed ('regulator-compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /syscon@ff770000/pcie-phy: failed to match any schema with compatible: ['rockchip,rk3399-pcie-phy']
   arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /phy@ff7c0000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']
   arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: /phy@ff800000: failed to match any schema with compatible: ['rockchip,rk3399-typec-phy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
