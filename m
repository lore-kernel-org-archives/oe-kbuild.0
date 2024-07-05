Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934C75465B
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jul 2024 04:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720154310; cv=none; b=M7+SRuQuygnMOePqNbrJmK03zUlj7M2altLzgUVy1qEgrQBcf3cVBJeyyTSfhKGZZSDLhobqPOxGevfr82qsuN4jXztJCsMPunf1lA4g2CWSrRLZjxlTrG6FDY3s2Qxr7U/gSuDAafhrIErUmDPr5APAFjbgKe6Uy/l8SXiGcDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720154310; c=relaxed/simple;
	bh=cgsXYtyMzdeOsgP11TMQVr8H5VX/zHdurepmc/JglUI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jp0pGBjQmlvhI6RU/JRc4uahY82qKoTp37+YNlkEkR1JJ0095N80BbuCtaNjRlLk6N7U5VYJbmJlqPWGEQD0tHvlyWPSHX0c9fm7C2pTX+BOWooyiKTjAqbPa3dEZRt7Bw6Llb0KL00tM5JItUt2kNoPrrZathnsPs6oRWTp/VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lsvg/MTU; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lsvg/MTU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720154308; x=1751690308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cgsXYtyMzdeOsgP11TMQVr8H5VX/zHdurepmc/JglUI=;
  b=lsvg/MTUgZz5LDVDMg59SqoECLul6CAdh0A2rOURG8ozZpBcQXn/SOPa
   srrwWekRp5moOvpA1PcowrSTCRjJS98DE2Yd+D/PKp9IQo+dXrPlzvtSI
   SX0F0TNeTVw0/bbmQ7cCZgdqxhwJnwGePz0D9VLcdoTQ5OiwCEfJIJOPg
   J81dKv7l3e0MF1+kKmctZASrVYlSloPenGSmIuqhnN8dsFNzUIEoBaw8L
   1Y2qO2XdATnQHIlNwLQVEayQZoP4YQLrLgjZMoICRDoWBRkbdHhk3yyc0
   lLGlQ5HkWdDQw/B7H2MOn7sXSZJv9FikCQEYOujWn5Nz58+II+C6hsbpN
   g==;
X-CSE-ConnectionGUID: 50jaigyxTzud8yGT3ic3cA==
X-CSE-MsgGUID: 6egHuPmmTYiT2l4Ax9a8tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="28051311"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="28051311"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 21:38:28 -0700
X-CSE-ConnectionGUID: paZI1a9oS0GF61yhbBu8uw==
X-CSE-MsgGUID: 9nvXVmqXRQKCp6n/A45/SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51370207"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Jul 2024 21:38:27 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPaiH-000Rum-0J;
	Fri, 05 Jul 2024 04:38:25 +0000
Date: Fri, 5 Jul 2024 12:37:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: add rock5 itx board
Message-ID: <202407051236.ppudG83Y-lkp@intel.com>
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
In-Reply-To: <20240703210524.776455-3-heiko@sntech.de>
References: <20240703210524.776455-3-heiko@sntech.de>
TO: Heiko Stuebner <heiko@sntech.de>
TO: heiko@sntech.de
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Heiko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on soc/for-next next-20240703]
[cannot apply to robh/for-next arm/for-next arm/fixes arm64/for-next/core clk/clk-next kvmarm/next shawnguo/for-next linus/master v6.10-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiko-Stuebner/dt-bindings-arm-rockchip-Add-Rock-5-ITX-board/20240705-012253
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20240703210524.776455-3-heiko%40sntech.de
patch subject: [PATCH 2/2] arm64: dts: rockchip: add rock5 itx board
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: arm64-randconfig-002-20240705 (https://download.01.org/0day-ci/archive/20240705/202407051236.ppudG83Y-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407051236.ppudG83Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407051236.ppudG83Y-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5itx.dts:1013.7-1021.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

vim +1013 arch/arm64/boot/dts/rockchip/rk3588-rock-5itx.dts

792bbd3af10923 Heiko Stuebner 2024-07-03  1008  
792bbd3af10923 Heiko Stuebner 2024-07-03  1009  &usb_host0_xhci {
792bbd3af10923 Heiko Stuebner 2024-07-03  1010  	usb-role-switch;
792bbd3af10923 Heiko Stuebner 2024-07-03  1011  	status = "okay";
792bbd3af10923 Heiko Stuebner 2024-07-03  1012  
792bbd3af10923 Heiko Stuebner 2024-07-03 @1013  	port {
792bbd3af10923 Heiko Stuebner 2024-07-03  1014  		#address-cells = <1>;
792bbd3af10923 Heiko Stuebner 2024-07-03  1015  		#size-cells = <0>;
792bbd3af10923 Heiko Stuebner 2024-07-03  1016  
792bbd3af10923 Heiko Stuebner 2024-07-03  1017  		dwc3_0_role_switch: endpoint@0 {
792bbd3af10923 Heiko Stuebner 2024-07-03  1018  			reg = <0>;
792bbd3af10923 Heiko Stuebner 2024-07-03  1019  			remote-endpoint = <&usbc0_role_sw>;
792bbd3af10923 Heiko Stuebner 2024-07-03  1020  		};
792bbd3af10923 Heiko Stuebner 2024-07-03  1021  	};
792bbd3af10923 Heiko Stuebner 2024-07-03  1022  };
792bbd3af10923 Heiko Stuebner 2024-07-03  1023  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
