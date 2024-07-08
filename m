Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CFC1CD3D
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Jul 2024 21:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720473693; cv=none; b=YveYh0ciC5OsSzXill5FnivYqej3BwnwdAkplbxF6ShC9naaTC7t2mP0hKjinPXV6qSOEO6uMKNXTLSTdagSjmK2wEvQMWDSZxnwT7lTU/MVbfsloYK5g0accfKT9XtzYD2effPKQ+xaoZAXTgToQOaYi2QYKeoqbnMZWfmMxf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720473693; c=relaxed/simple;
	bh=LtHWIzpfaoGaDyjUZ8yb6rgdac03HKBCFvs7j7TN3ak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uz4E8HEhEChR+CG+s8wkdLjuP6sOo+zWXH/TLhELhm2gMCj/lROpaw4bFn1zRwGS2NExqzRlklLZVxqwvX7Co//eNXkegQ5KOoy6MzrSkmClVZZiHVji+gFX5OO+h5VQx+OJEEY0nNZYJj/3E22PDIcAn14u2ukX/yNhWS8IECk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eK07R+5r; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eK07R+5r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720473691; x=1752009691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LtHWIzpfaoGaDyjUZ8yb6rgdac03HKBCFvs7j7TN3ak=;
  b=eK07R+5rzA5S5PpGZoOBq7ZClwUQ8XiiXIlRNKAv9koN3ODEULP7OHF4
   OprEfDTfaNbPsEXQNUh+r1QtpNLAj1S7eIz/11IQRRlHxrbo+rG3XzmVS
   3hHwidvC+cO4xkUzU9GHhIzOiyLhfPHiksSJxBf9+ovt8eDbgQFF5rIWn
   cIujDetlLVNeprMx/SlUTUZZkjayY48bp/b1X3DW/A/F+cPvE+0TsBgR3
   UI1725ecDL8urshDPlgWLCC+zEYWowYc7j/nGolM9IQ62T8dzclkXc9fP
   FT2twTKGfdAnAw/zbIWpkqOJ3y1Z4hO/hTT3A1A1Ot/vMIjm3tQeUaSTn
   A==;
X-CSE-ConnectionGUID: /DDEUoYvQ0q7GOnjsjq/Ng==
X-CSE-MsgGUID: duGqw84iRZK5uy+rNtWPeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="40209838"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="40209838"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 14:21:31 -0700
X-CSE-ConnectionGUID: EChrYtDUQfy4zeG0smQnWw==
X-CSE-MsgGUID: 0gWmvTp+TtytTS+P/X9KUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="52570861"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Jul 2024 14:21:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQvnb-000W2Y-1g;
	Mon, 08 Jul 2024 21:21:27 +0000
Date: Tue, 9 Jul 2024 05:21:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:rockchip/dt64 57/57]
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: /pcie-ep@fe150000:
 failed to match any schema with compatible: ['rockchip,rk3588-pcie-ep']
Message-ID: <202407090501.MmwJIPTT-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git rockchip/dt64
head:   31390eb8ffbf2b6be7d789708ec08b635d7a3eb8
commit: 31390eb8ffbf2b6be7d789708ec08b635d7a3eb8 [57/57] arm64: dts: rockchip: add ROCK 5 ITX board
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: arm64-randconfig-051-20240709 (https://download.01.org/0day-ci/archive/20240709/202407090501.MmwJIPTT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407090501.MmwJIPTT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407090501.MmwJIPTT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts:1115.7-1123.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: /pcie-ep@fe150000: failed to match any schema with compatible: ['rockchip,rk3588-pcie-ep']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
