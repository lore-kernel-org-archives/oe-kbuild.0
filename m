Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305BE7A13A
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Sep 2025 23:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757891363; cv=none; b=G8LnijCI/Y3CIRw454bvaNor2Xipw+wGasq5a61KnKwReWudX27GgfsfW7pQi2HhjHaBpy7Q3HxMfyosRDbeH5tuU5Q3N0KGWAqrp8undcO3GtHQe0Xp6ufcKv+6jrI9zkncdGU+Kvuu0QvohNy6H4gxLNv6Yy31an5pKIs8sa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757891363; c=relaxed/simple;
	bh=9tnXDAjC1n7n8Hr6EE8/kJlY0+E+q92cFaNTWeNwxr4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qPsePGsKODD01cKntwdCu6olbkySgzzqoNUUtgQhj8chP1SiPtWkiVMdpXbyPO5Nape5cbmX0U+GZ0dbt+CFCIfBaIcG09wz/rxCqrJDyAZ98iBMIA8eMTYFXks0UmqYb2HgKJ1y56Y8G21lR0wh5BlgPjDhhZ17KUYZ6jxMktQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n8+d0OwE; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n8+d0OwE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757891361; x=1789427361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9tnXDAjC1n7n8Hr6EE8/kJlY0+E+q92cFaNTWeNwxr4=;
  b=n8+d0OwEsALxwEAKTiTS5ehIe+yagPoMvsFFVtFVb0yq716Kxng+uOL3
   wwIeGijUINiImCiUe2/n/TVVP4EV+7bGRLOrSToPqW9tBZRMAPI7Bb9Bu
   12Q/YrQ/+QEi2sykg6IDQgJLdMj3fzo4x/UxDcviz5GrAnO4qr70gMOBq
   XvazM+b7aihctyiYATABVYcqVzsrRmzaa7qtnkBV9lWOP6Xe8c/YLqkkI
   S6ex9d7VNA1FCDmgxAwCNTE2IOnV6mlhG6BHJuXDkS246GDHwJkjDiOQ0
   kUwu70ozKUHhSOkXv4Jmz2fRjzdRheTXMNe7AjSRMPKFM+ZbVfpNZEVmC
   w==;
X-CSE-ConnectionGUID: /rp5DLDPTsWHNYLZDtl2tQ==
X-CSE-MsgGUID: IkfOelr9RUa1A+n7EQaOLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="77597319"
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="77597319"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 16:09:20 -0700
X-CSE-ConnectionGUID: RHxXZSNGQmegqCE04I7yqg==
X-CSE-MsgGUID: JlETuDwSTT2srf7afiIkFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,264,1751266800"; 
   d="scan'208";a="174912176"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 14 Sep 2025 16:09:20 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxvqP-0002nA-1C;
	Sun, 14 Sep 2025 23:09:17 +0000
Date: Mon, 15 Sep 2025 07:09:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sunxi:sunxi/dt-for-6.18 14/19]
 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dtb:
 /soc/i2c@2502800/keypad@34: failed to match any schema with compatible:
 ['ti,tca8418']
Message-ID: <202509150636.NGJAfIWn-lkp@intel.com>
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
TO: Lukas Schmid <lukas.schmid@netcube.li>
CC: "Chen-Yu Tsai" <wens@csie.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/dt-for-6.18
head:   cca07ac2b5f7838b8ff612b53b9f82ac8cb58312
commit: caffed0800ef4dd29cc29ee17a89d015e867e03a [14/19] ARM: dts: sunxi: add support for NetCube Systems Nagami Keypad Carrier
:::::: branch date: 7 hours ago
:::::: commit date: 2 days ago
config: arm-randconfig-053-20250914 (https://download.01.org/0day-ci/archive/20250915/202509150636.NGJAfIWn-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250915/202509150636.NGJAfIWn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509150636.NGJAfIWn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dtb: /soc/i2c@2502800/keypad@34: failed to match any schema with compatible: ['ti,tca8418']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
