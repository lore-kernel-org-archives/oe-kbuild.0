Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F81F37DEAF
	for <oe-kbuild@lists.linux.dev>; Sun, 17 May 2026 13:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779023147; cv=none; b=CzQOAsM9cmkmuxT8m5u/Tg01ZUaY2bJVS96yMuMrh3sOELHd+Cz0pVR3NzRQxQlsScbvPqQuIEZ1j4jVqnIIRlcKxf1OPDjPxyMof/56WWrej1G1mPPtr1ufT9bQDkB1WSGh5jnVa7LTR3NfxF9vLA4If+BPqZdWJxBCDMEX3MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779023147; c=relaxed/simple;
	bh=CPLAMjI1nDxnb27/MvyCBsti6IUJocssn2K/mfRydaA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IcR253LTskvEjuNYVvEjyu+MZBnyv6EIHjEct5ct11o+RDjGtD9QyfH2KIFe+oINLit/X3GG7Tgxl+3kF+T8Ae9CShl3y0HW5OP1yPNjnqMoGtqvq7pgIBxE3sGJUmy7tqVhw4nYeAWF7jQkj3Y8Xfof+Y4m36R7NiphmkBcIdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Baf3u5Ze; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Baf3u5Ze"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779023145; x=1810559145;
  h=date:from:to:cc:subject:message-id;
  bh=CPLAMjI1nDxnb27/MvyCBsti6IUJocssn2K/mfRydaA=;
  b=Baf3u5ZeEm4oWDc2mYK19tK1GmFNG7mC2MGztkIZAOFxubZA/lFGl9wv
   9w0vRByt0X6AySXQ/pygSGqz5Qb9Cg3KH2M8+HAydHkxfbtznBlEK0wX/
   +P+eUxs309BW3CD+aQS0+PLSmsusspZoILL4UfZxUFvz6zqCpi0QDGvpy
   MZt1U8vXpwNKCkYlTDLQzvG6/bKEh4vq4Q5LgW9kuZ0gwKwIC0ll190ei
   XhHzc82XeA6MKg99YMDligr7ikNsqpPjLJVHTSE1R9rjXpi113OfHKrz8
   NMT+bE91E6vl6+ocUfXP8cFVvFTs7l9hMlHRu5XuveXOUaRlpq+m7lHT6
   Q==;
X-CSE-ConnectionGUID: CU2qUKLKTMWQENV1egaGOQ==
X-CSE-MsgGUID: 0xJ+rKVgSCepl7FGWZRHfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="79878316"
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; 
   d="scan'208";a="79878316"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 06:05:43 -0700
X-CSE-ConnectionGUID: ihfNtMdcQSSGiiedNR90IA==
X-CSE-MsgGUID: x1GOyexnRLuCq5Zo33Pglw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; 
   d="scan'208";a="236131927"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 17 May 2026 06:05:41 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wObBb-000000009XJ-0XYS;
	Sun, 17 May 2026 13:05:39 +0000
Date: Sun, 17 May 2026 15:05:01 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 8/114]
 arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@23510c000/hid-transport@0:
 failed to match any schema with compatible: ['apple,spi-hid-transport']
Message-ID: <202605171420.1FsZZGPj-lkp@intel.com>
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
:::::: branch date: 3 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/archive/20260517/202605171420.1FsZZGPj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605171420.1FsZZGPj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605171420.1FsZZGPj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@23510c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
--
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spi@23510c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
