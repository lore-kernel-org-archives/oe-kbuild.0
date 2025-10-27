Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61172D97A8
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Oct 2025 06:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761545065; cv=none; b=TPSN5ySbNP5zceSjpT4jMe81hs5zo1v4qu60rwptBLJbLt21r+5eJtS13mhNhdUHNvXPX6om41W2sthIptvvqeTL9GRvvXdxnmNianFZ9YPyO4lliiIA3eCSuoNP6dRHmBIcndFCfUdVXVPGoQL1NHmFGTyY87vmG57hC0srBGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761545065; c=relaxed/simple;
	bh=mjXKqXypeqprjE7yV/lnYzg6cGXfFydUkDFHNgFGrtc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Si+hs0uR4ReRl/l7YMJV27z1fj1blEdFcMksplbSIY+nMxQYa5Y2TbBCAgwz2cxPJ1RsbPwT24C52PxgFjWykTAH6Eq3reYMU3NBEgnxiE+UmweSNq6mppJX++M64NtTugZlsW0tn2JVjfT2pcBjhH22Hff6qMH3tgzR5STtReE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O3B1oRmt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O3B1oRmt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761545063; x=1793081063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mjXKqXypeqprjE7yV/lnYzg6cGXfFydUkDFHNgFGrtc=;
  b=O3B1oRmtBz5HZxOgAlXZEWkUZL/IPE2K/ub0sBAh7Qw4yb0/BrhskclE
   UDSXktMA/iQbuvSTPT/B/SbnD1XRl3BjiJfOnY80/SR/nT8QJ/hYUXLBm
   3Jk8NTKde5+SzbQDDvhdTEi2GL+V7wzuxBJSkEbAJrQ2iDzyPazTvBw0G
   oEAsQg02Ybq3o/kg+EtHpstzo9W8APSgcbJsbNrwUo+04FHpwTLuOIpLB
   UZ9IKAOv4xBsTYbzZhbft+Y4TgQK/fws0KumuH2NSTVcMScxHu3Imd2EV
   CCOl57RKouZLroD3Nk3DBNgL4ggEfzjhve7eD2Pv8f9Sy9aXZkKlDs0oT
   w==;
X-CSE-ConnectionGUID: P6AqJfODShWFmlbhgid6Iw==
X-CSE-MsgGUID: hw3E83m+Sn+qvDQgrCW41g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63321625"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="63321625"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 23:04:22 -0700
X-CSE-ConnectionGUID: tc88Y6PgQauXpbJ9Q6n4jA==
X-CSE-MsgGUID: I2vv4Ho4Qu+8AiMFBIb/9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="185309954"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 26 Oct 2025 23:04:21 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDGL4-000GYH-3C;
	Mon, 27 Oct 2025 06:04:18 +0000
Date: Mon, 27 Oct 2025 14:03:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/ixp4xx-netgear-wgr826v 3/8]
 arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dtb: gpio@c8004000
 (intel,ixp4xx-gpio): 'clock-hog', 'unknown-hog' do not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202510271432.DHzrn9Ao-lkp@intel.com>
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
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/ixp4xx-netgear-wgr826v
head:   82097c6ad45f556e517b1b4199582fd6d24c03e4
commit: 2003e8d748fbb6faf3ce7809cedc486fa0a7c30f [3/8] ARM: dts: Add Netgear WGR826V Device Tree
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-052-20251024 (https://download.01.org/0day-ci/archive/20251027/202510271432.DHzrn9Ao-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510271432.DHzrn9Ao-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510271432.DHzrn9Ao-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dts:125.4-135.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dts:125.4-135.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dts:125.4-135.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dts:125.4-135.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dts:125.4-135.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dts:125.4-135.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dts:125.4-135.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dts:125.4-135.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-netgear-wgr826v.dtb: gpio@c8004000 (intel,ixp4xx-gpio): 'clock-hog', 'unknown-hog' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/intel,ixp4xx-gpio.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
