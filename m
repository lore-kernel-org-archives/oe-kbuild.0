Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60D8242D88
	for <oe-kbuild@lists.linux.dev>; Sat, 23 May 2026 13:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779541789; cv=none; b=PhjQqp2PT+IBehviMonDM0fpWt8E5GOThFj+YOwkp2Byrzhj1eQBJNGGRuqkGzKGhfW/XGm8B9NJH1gi8gsW8n0JYSpUbdLi3AvgG8TDl0db9m+WATCL8WuPzgTig0fxb2cVN6tBuDc7JYMk20NA6sEkcJ/Upl2OXkUd5OrU3lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779541789; c=relaxed/simple;
	bh=7s2ZasyPQj4kuFFDQZGdAmjaT+SasrYy+3O9RbLP5Vg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H9XnB4cxWnguDNad7e3t6lQSWK3cQJ3uORklabZQXSiSOiDXSpSGH2DcgvOwPi71Q0o5P+MNoUPTKY5hDuKUodfu3l3P6aiOGtIh/ChmYpqPhLQnv/hZUvFg8EGLr8m7D3UzelAKFnc4lrq1jan5i+3jP3GBJpo/HwvT4rlF+p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kbqzbLhx; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kbqzbLhx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779541788; x=1811077788;
  h=date:from:to:cc:subject:message-id;
  bh=7s2ZasyPQj4kuFFDQZGdAmjaT+SasrYy+3O9RbLP5Vg=;
  b=kbqzbLhxMrlCQQdZ9BRyWxtLCyz4gAOqxND+7UyTXZWadB7JYlYRgFWh
   3JLkNWxffxwuJMZ7NbtkCQbiCEIamVAqntIsOgcXhgGuN+vr9OfTrin4r
   kVYnw0xiWmcDilpa1IcXkBhTv/l+7HEGQbsy7tCdR0m58T9UFjLiAsspo
   7fLIblFga2LEEyBP9Z08mLnvf4FMZ++ut6/AlnuexERY8ScLlr6Cl8SEg
   kMxNsILXTS7GU3cdCPNNVelHVBAEOpn9GQ5Zz+XJ0DXszo8Ush4I+zSk3
   MzbGlzSiF/rQqZ9VKUT7sj2hS0u1ubGUJxjStnfqsrOM91X9xlyCaPRcS
   A==;
X-CSE-ConnectionGUID: hk/eB8pWTDqx+1OMY0f/sg==
X-CSE-MsgGUID: XudyadbvR6KB+8RCj2sdYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80413659"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="80413659"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 06:09:48 -0700
X-CSE-ConnectionGUID: 3mkS96FoTXuC/ONLILVbhw==
X-CSE-MsgGUID: PfrDPaK+S2C4+LLWMDBPmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="279266885"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 23 May 2026 06:09:46 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQm6q-00000000Bf3-1QHO;
	Sat, 23 May 2026 13:09:44 +0000
Date: Sat, 23 May 2026 15:09:25 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 8/114]
 arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@23510c000/hid-transport@0:
 failed to match any schema with compatible: ['apple,spi-hid-transport']
Message-ID: <202605231509.uXzg03hN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   2d563843e07af55de0249a409021af705f586961
commit: 74f6e723573daa18159aeebabf858115d10377f7 [8/114] arm64: dts: apple: t8103: Add spi3 keyboard node
:::::: branch date: 9 days ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/archive/20260523/202605231509.uXzg03hN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260523/202605231509.uXzg03hN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605231509.uXzg03hN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@23510c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
--
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spi@23510c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
