Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E3F190679
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 06:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730959681; cv=none; b=mIqGw2eSyAYgdtJhH4v0W8KxKIlQ3IdSUQpsLCqIZN99I/lTDN2FDbBzQcWojinchbQ1OGioi1EzqRngydaoJA6Lg3oGm8MF/IhEeQfFPZ9OHuf7EY1WiUOe8m55WF0IkPX1+g8LMmrz+u5MKJ+Ek+lYOgSIigGHPmcfBuntt3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730959681; c=relaxed/simple;
	bh=uca62cQCOmziTB1x0rVL3tJhHfJopeaNgrG3TLscCaI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H51dx4KaTvvU610Nkv4CvNrytivk869g/R3nZ95SxC5fUg8DZ5ZokA+d+WEGQZB+fZ9kN1FNZZ4i2RYx6p7FW+19a9BzBxXwHlceDK7k+4o6+VScMR8DM95wkitgK2xKK3SUPJj5yaq9xBSDXFsMii0YGBmt7YCyx/710b0B72k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nyYbdM7Q; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nyYbdM7Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730959679; x=1762495679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uca62cQCOmziTB1x0rVL3tJhHfJopeaNgrG3TLscCaI=;
  b=nyYbdM7QSoQS/43vkhxriBI2MsG36DL4ivhkondTNGxX9EMOielklMgp
   4CpwZ5j2Iio/Ez5pCEXvzCNWhj/CobCU08jMz7yCox0YRwdoa1zIY0aH6
   XS2SJvXY5iwj0U4owHEPNAXhN1GjfoYyahvKJrnuEs8dRufQhi5mP+L/6
   4yqsUvb7JHRLuyCLH2K9dBGqHxyTLAr8xApIODq2CbQjHSw2o60wYIzA7
   u7fZ8kCzVU2EsgDfIvWvlrHzxZamT5kQBb/ut/fDp99jucNQkD6RxPXp1
   jbTYfDGmtfSVuEnGqZChk3eQ3dkqo+ln7fz6saQ9BjPEeCkmIKdnww+3U
   Q==;
X-CSE-ConnectionGUID: y+07qwPBTiOtrc6Aeb7rzw==
X-CSE-MsgGUID: 7EmWUSNkTdS4JPPPKRJmbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30667923"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="30667923"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 22:07:59 -0800
X-CSE-ConnectionGUID: n/r/tJP3S8u/ZZ600iOpXw==
X-CSE-MsgGUID: dk4klm1mTDu36t5MYwUMVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="84561960"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Nov 2024 22:07:57 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8vgR-000psU-0o;
	Thu, 07 Nov 2024 06:07:55 +0000
Date: Thu, 7 Nov 2024 14:07:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pdp7:thead-dt-for-next 9/9]
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/ethernet@ffe7060000:
 failed to match any schema with compatible: ['thead,th1520-gmac',
 'snps,dwmac-3.70a']
Message-ID: <202411071406.OkFnMW2f-lkp@intel.com>
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
TO: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: Drew Fustini <drew@pdp7.com>

tree:   https://github.com/pdp7/linux thead-dt-for-next
head:   7e756671a664b73b2a3c0cc37fd25abf6bcd851e
commit: 7e756671a664b73b2a3c0cc37fd25abf6bcd851e [9/9] riscv: dts: thead: Add TH1520 ethernet nodes
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: riscv-randconfig-051-20241107 (https://download.01.org/0day-ci/archive/20241107/202411071406.OkFnMW2f-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411071406.OkFnMW2f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411071406.OkFnMW2f-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/ethernet@ffe7060000: failed to match any schema with compatible: ['thead,th1520-gmac', 'snps,dwmac-3.70a']
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/ethernet@ffe7070000: failed to match any schema with compatible: ['thead,th1520-gmac', 'snps,dwmac-3.70a']
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/pinctrl@ffe7f3c000: failed to match any schema with compatible: ['thead,th1520-pinctrl']
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/pinctrl@ffec007000: failed to match any schema with compatible: ['thead,th1520-pinctrl']
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/pinctrl@fffff4a000: failed to match any schema with compatible: ['thead,th1520-pinctrl']
--
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/ethernet@ffe7060000: failed to match any schema with compatible: ['thead,th1520-gmac', 'snps,dwmac-3.70a']
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/ethernet@ffe7070000: failed to match any schema with compatible: ['thead,th1520-gmac', 'snps,dwmac-3.70a']
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/pinctrl@ffe7f3c000: failed to match any schema with compatible: ['thead,th1520-pinctrl']
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/pinctrl@ffec007000: failed to match any schema with compatible: ['thead,th1520-pinctrl']
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/pinctrl@fffff4a000: failed to match any schema with compatible: ['thead,th1520-pinctrl']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
