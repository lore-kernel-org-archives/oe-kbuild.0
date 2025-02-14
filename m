Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9DD264A7B
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Feb 2025 14:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739542706; cv=none; b=XIGPS3rhf5565EpxAFukEayZ3OAIt9cAA/QJPfPvtN3T9tby0O6IDg3qigpdnPYvZ8kOuMIMNQKtUAqMapPYKzfij9zaXRktYcsItkdoCX8+gOl4uZZ5nLvqe6Uxs54MHybkTLzO8eTwpbolKGG3QvSInwFpo0mARMwkUisdAeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739542706; c=relaxed/simple;
	bh=aUXEmM41/FZDz00NX53zyCXXeL4Rtaw2W2f/Wudth1c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j6s75tnaLkts04p1/aSQZxKZsEVF87+dhSkPo1SRUaXqMXPF9PRXLZFHa42WcH+I6mSQDHCnhPqBjvcmCFFZMq9HY/tlqB/7Ld7R+qGHpqyilL7mdceJ/DrpVkkbUyI2llf58oTG1iTvSk/RwBzn0+YO/yBuFZ6lF58XG3h8P5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LJXIua7A; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LJXIua7A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739542704; x=1771078704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aUXEmM41/FZDz00NX53zyCXXeL4Rtaw2W2f/Wudth1c=;
  b=LJXIua7AgKwSjv72GaJmU7wh6PQXbKPwVQHkm7YZf0M2miIXopiAjrWf
   JAkZzDS8CVRoYua58VFM8d+B0Jnvup1i5gp/X7T7fEI1brEzFhqgXdRtS
   hI53W3KkLLqkq/Ir/FOObT1fUUUzp6Ay5Q7oWXu+lnIJ00VwCXz8Juef+
   Zg+Tg0Bq9KxGUv5t3YBUPX6B+s9JO7mzGkGXCFUQmgITbQo9uPTOLz41w
   ZfZeM0tJOuO+4U26SEn/LzVJ4OTylRvI4IpiIi5Zcp6GTxAAUkvObNQfk
   c3Tk2vCiVIS1o6lULCpG6UkaZNOxZd+awlVYjejLurJdUbqUe8zO4djUm
   A==;
X-CSE-ConnectionGUID: /OEA2MhYSPyu439GfGjkcA==
X-CSE-MsgGUID: kGzm7iDWSUKEkHrksrfM0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="43944504"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="43944504"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 06:18:24 -0800
X-CSE-ConnectionGUID: U6DUh5Q+SRmh5dcTvIx2rA==
X-CSE-MsgGUID: nILb5J9PRbuiW38UoWR5WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144403807"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Feb 2025 06:18:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiwWK-0019eV-2i;
	Fri, 14 Feb 2025 14:18:20 +0000
Date: Fri, 14 Feb 2025 22:17:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: rockchip: add usb typec host support to
 rk3588-jaguar
Message-ID: <202502142205.zvKIYux8-lkp@intel.com>
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
In-Reply-To: <20250213163013.1616467-1-heiko@sntech.de>
References: <20250213163013.1616467-1-heiko@sntech.de>
TO: Heiko Stuebner <heiko@sntech.de>
TO: heiko@sntech.de
CC: quentin.schulz@cherry.de
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: Heiko Stuebner <heiko.stuebner@cherry.de>

Hi Heiko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on linus/master v6.14-rc2 next-20250214]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiko-Stuebner/arm64-dts-rockchip-add-usb-typec-host-support-to-rk3588-jaguar/20250214-005733
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20250213163013.1616467-1-heiko%40sntech.de
patch subject: [PATCH] arm64: dts: rockchip: add usb typec host support to rk3588-jaguar
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm64-randconfig-r072-20250214 (https://download.01.org/0day-ci/archive/20250214/202502142205.zvKIYux8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502142205.zvKIYux8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1060.7-1067.4: Warning (avoid_unnecessary_addr_size): /usb@fc000000/port: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1074.7-1081.4: Warning (avoid_unnecessary_addr_size): /usb@fc400000/port: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1060.7-1067.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1074.7-1081.4: Warning (graph_child_address): /usb@fc400000/port: graph node has single child node 'endpoint', #address-cells/#size-cells are not necessary

vim +1060 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts

d1b8b36a2cc5f4 Heiko Stuebner 2023-12-01  1055  
f14a0f693692a0 Heiko Stuebner 2025-02-13  1056  &usb_host0_xhci {
f14a0f693692a0 Heiko Stuebner 2025-02-13  1057  	dr_mode = "host";
f14a0f693692a0 Heiko Stuebner 2025-02-13  1058  	status = "okay";
f14a0f693692a0 Heiko Stuebner 2025-02-13  1059  
f14a0f693692a0 Heiko Stuebner 2025-02-13 @1060  	port {
f14a0f693692a0 Heiko Stuebner 2025-02-13  1061  		#address-cells = <1>;
f14a0f693692a0 Heiko Stuebner 2025-02-13  1062  		#size-cells = <0>;
f14a0f693692a0 Heiko Stuebner 2025-02-13  1063  
f14a0f693692a0 Heiko Stuebner 2025-02-13  1064  		usb_host0_xhci_drd_sw: endpoint {
f14a0f693692a0 Heiko Stuebner 2025-02-13  1065  			remote-endpoint = <&usbc0_hs>;
f14a0f693692a0 Heiko Stuebner 2025-02-13  1066  		};
f14a0f693692a0 Heiko Stuebner 2025-02-13  1067  	};
f14a0f693692a0 Heiko Stuebner 2025-02-13  1068  };
f14a0f693692a0 Heiko Stuebner 2025-02-13  1069  
f14a0f693692a0 Heiko Stuebner 2025-02-13  1070  &usb_host1_xhci {
f14a0f693692a0 Heiko Stuebner 2025-02-13  1071  	dr_mode = "host";
f14a0f693692a0 Heiko Stuebner 2025-02-13  1072  	status = "okay";
f14a0f693692a0 Heiko Stuebner 2025-02-13  1073  
f14a0f693692a0 Heiko Stuebner 2025-02-13 @1074  	port {
f14a0f693692a0 Heiko Stuebner 2025-02-13  1075  		#address-cells = <1>;
f14a0f693692a0 Heiko Stuebner 2025-02-13  1076  		#size-cells = <0>;
f14a0f693692a0 Heiko Stuebner 2025-02-13  1077  
f14a0f693692a0 Heiko Stuebner 2025-02-13  1078  		usb_host1_xhci_drd_sw: endpoint {
f14a0f693692a0 Heiko Stuebner 2025-02-13  1079  			remote-endpoint = <&usbc1_hs>;
f14a0f693692a0 Heiko Stuebner 2025-02-13  1080  		};
f14a0f693692a0 Heiko Stuebner 2025-02-13  1081  	};
f14a0f693692a0 Heiko Stuebner 2025-02-13  1082  };
f14a0f693692a0 Heiko Stuebner 2025-02-13  1083  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
