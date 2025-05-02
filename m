Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234F5224B15
	for <oe-kbuild@lists.linux.dev>; Fri,  2 May 2025 22:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746225516; cv=none; b=ghCnUyygdl2SJwwtQR5AKCZ9vdp1giUWKGJi/lP57TV2QIbxCNEJbHoDlY4ffcHHyfF/KeUj0JwXJ8aVL2YJ4yRdyCj/2nuX87B+eE/ywNkOuXZAetX+1FCIW3Ah6VVWMDsxMkFFdKDY6+2pu3UpcgAMz7dc4dG5aJDydUN7w8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746225516; c=relaxed/simple;
	bh=YBUnOIhZWh24LIfFBcAxhG2TpJu88LxEzpHGihERPaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=phcE8wu4qDGRRMY/BgbOl8YferZIQlsdenAiy4gTD6UE8Bas5Bjun7RSWTbXpyivuZfkKFsgQITn4KOIbXfEIUi8XiwEhjAEbjugp83HpOcZ4EPcPSGxhTMBw5b/QepdWY6Kkgu87Ou1N35B4+EZDQNeSOQyyyljNH6bQPnTEWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QSEQaLWr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QSEQaLWr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746225513; x=1777761513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YBUnOIhZWh24LIfFBcAxhG2TpJu88LxEzpHGihERPaQ=;
  b=QSEQaLWrwiufQPMteY6xLyC7osw2F7QjUwcYwngzGnQdXAj9xVpjPkIw
   zMnDr+gfc5875cLmpH9V9jtP22axhh2vwhRp4vmLjorA+0xWi3lyZfED+
   mSEi/w0C6n8IX/Gupc7qxPWT8iaKcn980q0h2R4ERTuYwKa+Ny1SAOsWJ
   gU/vmcTLR+0WAMvaN5qkm0Mo+617ifmBVKeRa02psgwm9ZLEpVLXdc/z5
   GZgwlxfyCBqyOI1b5nlzKg/llEScpYV3ju6XffXWNOaeGNX9XXb72V1nj
   6R2Gj9+TGTUqX11WQXZ0kgOzUJKn4ooFWoboqblPGQqYIdk7ToTp0Jxx5
   w==;
X-CSE-ConnectionGUID: froniVj6Tzy31EjP9XBfww==
X-CSE-MsgGUID: yXqROYwjQOqcb269e3mdxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="59303326"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="59303326"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 15:38:33 -0700
X-CSE-ConnectionGUID: ICFwAobOQkes3ngiDkcBgg==
X-CSE-MsgGUID: MK38Rx6FS+6zgqaRfj61lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="171999085"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 May 2025 15:38:32 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAz1Z-00053J-0z;
	Fri, 02 May 2025 22:38:29 +0000
Date: Sat, 3 May 2025 06:37:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: exynos: Added the ethernet pin configuration
Message-ID: <202505030518.6NIdhVxK-lkp@intel.com>
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
In-Reply-To: <20250423060034.973-1-yashwant.v@samsung.com>
References: <20250423060034.973-1-yashwant.v@samsung.com>
TO: Yashwant Varur <yashwant.v@samsung.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: alim.akhtar@samsung.com
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-samsung-soc@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: cs0617.lee@samsung.com
CC: g.naidu@samsung.com
CC: niyas.ahmed@samsung.com
CC: yashwant.v@samsung.com

Hi Yashwant,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on linus/master v6.15-rc4 next-20250502]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yashwant-Varur/arm64-dts-exynos-Added-the-ethernet-pin-configuration/20250423-150049
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20250423060034.973-1-yashwant.v%40samsung.com
patch subject: [PATCH] arm64: dts: exynos: Added the ethernet pin configuration
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: arm64-randconfig-053-20250429 (https://download.01.org/0day-ci/archive/20250503/202505030518.6NIdhVxK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505030518.6NIdhVxK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505030518.6NIdhVxK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: pinctrl@10830000 (samsung,exynosautov920-pinctrl): 'eth0_pps_out0', 'eth0_pps_out1', 'eth_extpll_avb', 'eth_phy_reset' do not match any of the regexes: '^(initial|sleep)-state$', '^[a-z0-9-]+-pins$', '^[a-z]+[0-9]*-gpio-bank$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl.yaml#
>> arch/arm64/boot/dts/exynos/exynosautov920-sadk.dtb: pinctrl@16c10000 (samsung,exynosautov920-pinctrl): 'eth0_mdc_mdio', 'eth0_pps_out', 'eth0_rgmii' do not match any of the regexes: '^(initial|sleep)-state$', '^[a-z0-9-]+-pins$', '^[a-z]+[0-9]*-gpio-bank$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
