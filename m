Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0DC38C
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Sep 2024 01:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726275818; cv=none; b=KiDKOjoWgV3Zxnrv4yKXLYERDHKvhh4CEMFp7WcpnNYu6Eg8hLVqQ0rvQFAwMaFFxRzz5a+nPvomQQkt1KKT6u3RNaZOIIhwWNQopxOLceebtNLn5t9rHR9/KbYDqxVMrKiio22gRKqwwlhFnnP5hMu8ApyvxTkBSIeVXsiGiCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726275818; c=relaxed/simple;
	bh=KuS9tA4Nnx821Ifajzks07jYfK4frHIxuQd4tg7+6WE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OKRmXaMAb2jlU3z5yvI2WEXoZkd548KW2HisvuIEGagsQfZIDSf+kf7hqF3N9mU1rp89gA/rnuMgBcEq5AEe7lEAnrRb50zMtj8CLzFX8Xiy0OovAhoKl78It4I4JPp3CB6hWRMmukUgYBvX2GmeVbcOu6uwv4DKr9uEaqPtGLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nEMzKajn; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nEMzKajn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726275816; x=1757811816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KuS9tA4Nnx821Ifajzks07jYfK4frHIxuQd4tg7+6WE=;
  b=nEMzKajnsnR4WvBzd6O0C+uN84VMsJUKNyNFEI0R8qLFsN1StcBOO+Nj
   632hss8vmwUIH13tRGfCswh+277GgfA+/gRIaqVE1rAx28kN8rew9tWa+
   1+0GXsqoYRskym6yedH5ok8EOSmPw6KhRM+Dw6t6utRURWgy6PRtWNNBG
   1nkWD+mEecdYJPAA/wIDt557pRx0zmeq9qnw4SO04v/Tiyccp4zLvlMlf
   9EJqFez+WRJuJICX+OHKG2YTlCrerWaR62kfMvxXyOGrY8GzaquQjh1Cx
   pBUNw9mCfikoaSOp1OBtoW8+4yOBI3FgAT/9T8ROXh9r6kOm1ZX08m3Yp
   g==;
X-CSE-ConnectionGUID: G7zV5dxcTeib+v5mVdOpbQ==
X-CSE-MsgGUID: /0h8KR+VSvyOQo3OGH9aLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25342188"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="25342188"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 18:03:35 -0700
X-CSE-ConnectionGUID: FjgR9l4SSZm4z147u2ccCA==
X-CSE-MsgGUID: YbLljHQdSP6ueD5YswLIVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="72632478"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Sep 2024 18:03:34 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spHCF-0007DS-2W;
	Sat, 14 Sep 2024 01:03:31 +0000
Date: Sat, 14 Sep 2024 09:02:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add support for rk3588s
 evb1 board
Message-ID: <202409140818.pVwI04Bt-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240910124055.3981648-3-damon.ding@rock-chips.com>
References: <20240910124055.3981648-3-damon.ding@rock-chips.com>
TO: Damon Ding <damon.ding@rock-chips.com>
TO: heiko@sntech.de
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: macromorgan@hotmail.com
CC: jonas@kwiboo.se
CC: tim@feathertop.org
CC: knaerzche@gmail.com
CC: efectn@protonmail.com
CC: andyshrk@163.com
CC: jagan@edgeble.ai
CC: dsimic@manjaro.org
CC: megi@xff.cz
CC: sebastian.reichel@collabora.com
CC: alchark@gmail.com
CC: boris.brezillon@collabora.com
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Damon Ding <damon.ding@rock-chips.com>

Hi Damon,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on arm64/for-next/core clk/clk-next kvmarm/next shawnguo/for-next arm/for-next arm/fixes linus/master]
[cannot apply to rockchip/for-next soc/for-next next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damon-Ding/dt-bindings-arm-rockchip-Add-rk3588s-evb1-board/20240910-214037
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240910124055.3981648-3-damon.ding%40rock-chips.com
patch subject: [PATCH v2 2/2] arm64: dts: rockchip: Add support for rk3588s evb1 board
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-001-20240913 (https://download.01.org/0day-ci/archive/20240914/202409140818.pVwI04Bt-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140818.pVwI04Bt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409140818.pVwI04Bt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts:1091.7-1099.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

vim +1091 arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts

7d1a6a4778dbdd Damon Ding 2024-09-10  1085  
7d1a6a4778dbdd Damon Ding 2024-09-10  1086  &usb_host0_xhci {
7d1a6a4778dbdd Damon Ding 2024-09-10  1087  	dr_mode = "otg";
7d1a6a4778dbdd Damon Ding 2024-09-10  1088  	usb-role-switch;
7d1a6a4778dbdd Damon Ding 2024-09-10  1089  	status = "okay";
7d1a6a4778dbdd Damon Ding 2024-09-10  1090  
7d1a6a4778dbdd Damon Ding 2024-09-10 @1091  	port {
7d1a6a4778dbdd Damon Ding 2024-09-10  1092  		#address-cells = <1>;
7d1a6a4778dbdd Damon Ding 2024-09-10  1093  		#size-cells = <0>;
7d1a6a4778dbdd Damon Ding 2024-09-10  1094  
7d1a6a4778dbdd Damon Ding 2024-09-10  1095  		dwc3_0_role_switch: endpoint@0 {
7d1a6a4778dbdd Damon Ding 2024-09-10  1096  			reg = <0>;
7d1a6a4778dbdd Damon Ding 2024-09-10  1097  			remote-endpoint = <&usbc0_role_sw>;
7d1a6a4778dbdd Damon Ding 2024-09-10  1098  		};
7d1a6a4778dbdd Damon Ding 2024-09-10  1099  	};
7d1a6a4778dbdd Damon Ding 2024-09-10  1100  };
7d1a6a4778dbdd Damon Ding 2024-09-10  1101  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
