Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACDA3644C1
	for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 06:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259593; cv=none; b=PZRcDC/c7H08g9JjOw2gct7A+UYuL5XIQqKDG3Zb0oKaPIQEHy/Te1lqxYR+yMc4pquyVBLypgIlQqfgD6ltllt/7lM1DvZj2aRqppQhPhCN2/NCNCZFNP4zBYZ786k0F7xkr9Ujl/1dQyFROknAUoPismE6w0SryQ4RSLUJP/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259593; c=relaxed/simple;
	bh=+LM6DsyQ8iARZjQmPleBq+w6oUdySmUho/k9nGQ/qAM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gWGFGF8UZpJxDNk5des7oEbZvpgmnjum6C11Cltdu0elbH3KZ7rNeRzLLRFbW73APVO44ID7wHoF+QvAa3SD6VDDcr0B5Xm49alQarbOmki15OMGCapXqz/5Z9zdLy7pMx5ofjTJEKxeIjqrmSsfR2IjoKVDImjgtek7oooZ5ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y3tkctR0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y3tkctR0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779259593; x=1810795593;
  h=date:from:to:cc:subject:message-id;
  bh=+LM6DsyQ8iARZjQmPleBq+w6oUdySmUho/k9nGQ/qAM=;
  b=Y3tkctR0FdGdm9ElSn1MZfTfAuDDLOZPRMauFJAUsETqHurxj6QUjF9o
   lu5LrlSUWGD+Hy3xFvT03oLOfPLqrl/owaWC68k6EX8dRUsNVAWn6sFr0
   ahW6shksnmrkbvu5XZCMXvqkXdA0ZXJEEFaqD9Po+IwtXRfLKSL6VDZbT
   xZrl4dQJF8OLOl6mK/cD5YSxE3I5Krtahs21csRyVUvBtSK3kVoE2Ss7w
   ySDa5jG4F4rX5lz+oN5fDp0pYXD+qjo9Mk0/YajZ7dAS7Be0OGPjG4bP4
   9C3KYqv2Fm7swfDX3SVASJ/IMcaK7/ylS5glmRgEvq4mRCh+VFTDDH1y+
   g==;
X-CSE-ConnectionGUID: gAnzAVNATgmxFpVsXwCKgw==
X-CSE-MsgGUID: 9ugptt37TdGXk7C6RqDqVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="102826444"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="102826444"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 23:46:32 -0700
X-CSE-ConnectionGUID: h8pL+94KTturs1nwM/nxMQ==
X-CSE-MsgGUID: XlW8EXA3TgWqPEfib7kkTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="263561218"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 19 May 2026 23:46:30 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPahI-00000000AT7-3vK5;
	Wed, 20 May 2026 06:46:28 +0000
Date: Wed, 20 May 2026 08:46:02 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 9/114]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb:
 /soc/spi@39b10c000/hid-transport@0: failed to match any schema with
 compatible: ['apple,spi-hid-transport']
Message-ID: <202605200820.LRMkstjj-lkp@intel.com>
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
commit: 8889bf8cff77db2d9655f7f54bbc363c6b4d8895 [9/114] arm64: dts: apple: j31[46]: Add keyboard nodes
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/archive/20260520/202605200820.LRMkstjj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605200820.LRMkstjj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605200820.LRMkstjj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
--
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
--
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
--
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
