Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5779362130
	for <oe-kbuild@lists.linux.dev>; Mon, 25 May 2026 23:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779751166; cv=none; b=gMUjJSbI5EnwrZPU7rEEYQuEDzg2J3qgbGHpPbZlMJENvzjxhtmqjtcGjIvQdrxHeNDlbmlk9E27fehZZ7bjbql8pS1bxh6etjIV/EGJDsc05I4FSNq7SQxMeGVyckGk3OVFNGjvcdu2eTYfwph0OaFZATVIg0dkmZKiCmkxUf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779751166; c=relaxed/simple;
	bh=9fiYFsaBFX7PoYdQkuMKP0GOZjEeIoUoz5Rrter/Bl0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uaJmvAH99JXqq6R7HgXwWPzxftZRl/iafd3iDw5G8IgxSpoK50eMr6nohcefrf1t/Fd1OJfuicw8n0LCEX9LsDPDtvu/Ajj5a350f2C8mahM3zAKRczKTSxJnDjh/armoDKyCftuFryRW1ZwPEBqpXZMvOqxLKCTNFVJxxzLvRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ExzvBvvF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ExzvBvvF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779751165; x=1811287165;
  h=date:from:to:cc:subject:message-id;
  bh=9fiYFsaBFX7PoYdQkuMKP0GOZjEeIoUoz5Rrter/Bl0=;
  b=ExzvBvvF7w+K//wgT4r2+WRsVf0q7R9IADPo9MztgbmELwX7gjnXxWzy
   djwYOEjQUXLQhvJGKegOCxAvHLJt836FeuxkPYcWbXpAUNqo6y1G/47MK
   Qzjr0dk/Rr5UNcc+lbyhsh+76WwCccv1UN7l/GQTv8pdzPt3LXtEprPzi
   C0TXNqQTZ4uePHryfte4NKTSP23tt3ZsDnl4NH6QGrfvjPLOHLxXV4yHA
   fgt1pwtSgA99Xt2ShGSCNnC17VRB6bWjIijp9bo5cVjMqEjG/vYNx/L/n
   hoTQaBVZhe6xjXJ9QFOuuNMAsfcFS9R4fGA0A5woLCAHizV9ej38Ro7ns
   A==;
X-CSE-ConnectionGUID: YxOLVuOOSEavDOtKberqMA==
X-CSE-MsgGUID: 7PYIFLKzQvKAp76ZuCffrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="106024493"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="106024493"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 16:19:24 -0700
X-CSE-ConnectionGUID: sxhEIcKATTW8vAIzvNinRQ==
X-CSE-MsgGUID: 6+Mx+IKuSleLRwB2qv5Gyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; 
   d="scan'208";a="265315728"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 25 May 2026 16:19:23 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wReZt-00000000CH7-0jNx;
	Mon, 25 May 2026 23:19:21 +0000
Date: Tue, 26 May 2026 01:18:24 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 8/114]
 arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@23510c000/hid-transport@0:
 failed to match any schema with compatible: ['apple,spi-hid-transport']
Message-ID: <202605260107.0nraEokd-lkp@intel.com>
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
:::::: branch date: 12 days ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/archive/20260526/202605260107.0nraEokd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605260107.0nraEokd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605260107.0nraEokd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@23510c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
--
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spi@23510c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
