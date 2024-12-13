Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342BB1E1A2B
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Dec 2024 14:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734098960; cv=none; b=X+dExac+vuXKMLYjWhvFxP/pNJXGMtzPfsXp01z0taLmhkA6heHiyB588TnOx5ZJIX7BeibtNm+SRR32MqhxtAZi5YmSu+ECynMh9XUuqzUNTpzOUkeckIIR/WwnJj9HUVNQe8TngJEdg7JLJAWjDnXC4VS/qYBG4ALTFqZmo3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734098960; c=relaxed/simple;
	bh=2lBPVmWPGCUwTz8Q6Yjarc+guhtGJ/caK623ayiNRfg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P4zGb4LnxSWaE6o3UDz0NOG9wqRYv2xqrrwbvlcNdcUmlwtmGaBbwi5tEHlbIgzQk4b54R0PAoyGxz04JoUiW4IImLe/1ry/jetdcmQ1V5IcmMzvvXv79shmaaneL1lIZPQ67p8gdTdo3eFA50prxP3+dVIzgz/IDqknB/Ppo2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JrILi15U; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JrILi15U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734098958; x=1765634958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2lBPVmWPGCUwTz8Q6Yjarc+guhtGJ/caK623ayiNRfg=;
  b=JrILi15Uw9w9xdhYaadiHdzYDEZmJP6aRRei/hG5VNuMtlX9428+Kfmt
   Js74JOeWlUUuyH/q28eGEXBoHj3VNBC5Cc48HESTahQeib+tKCkvIoiNg
   cMsRl/WfEi1IF8gxLHneoaKTumvOXadww0F/ptWJreDJ243fkdbENTJ1J
   wc12Jk3KgzqF9yQ1QMkFsqUOXhH05J3kPYupGKDlBTXviW/jQj4p5bplk
   7R9pM9PoC4sF4p07Z/rk5PSTP1qyiqurvADWNCRmEhyYjAAKBksfD6ZHD
   SQ0ZqKN1aFhNvx+JJZ6s1EvvTlIqIWSchtk7m419rgL7JdjoIZFA13cyU
   g==;
X-CSE-ConnectionGUID: /2ZbOxuCQl6VIeGhhb9+rw==
X-CSE-MsgGUID: Oztco2cgRfS3Z3LnOgW2XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="52072661"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; 
   d="scan'208";a="52072661"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 06:09:17 -0800
X-CSE-ConnectionGUID: tj6dWjW+S1+PtWd8LGYzSg==
X-CSE-MsgGUID: MdApcFwDSYGUlH4ZeGOjyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; 
   d="scan'208";a="96961808"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Dec 2024 06:09:16 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tM6Ly-000C61-1E;
	Fri, 13 Dec 2024 14:09:14 +0000
Date: Fri, 13 Dec 2024 22:08:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/tehuti/tehuti.c:2316 bdx_get_strings() error:
 __builtin_memcpy() '*bdx_stat_names' too small (32 vs 736)
Message-ID: <202412132202.qXuh11Zx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andrey Konovalov <andreyknvl@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Marco Elver <elver@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f932fb9b40749d1c9a539d89bb3e288c077aafe5
commit: 2e577732e8d28b9183df701fb90cb7943aa4ed16 kasan, fortify: properly rename memintrinsics
date:   7 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-161-20241213 (https://download.01.org/0day-ci/archive/20241213/202412132202.qXuh11Zx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412132202.qXuh11Zx-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/tehuti/tehuti.c:2316 bdx_get_strings() error: __builtin_memcpy() '*bdx_stat_names' too small (32 vs 736)
drivers/net/ethernet/qlogic/qlcnic/qlcnic_ethtool.c:1202 qlcnic_get_strings() error: __builtin_memcpy() '*qlcnic_gstrings_test' too small (32 vs 192)

vim +2316 drivers/net/ethernet/tehuti/tehuti.c

1a348ccc1047a00 drivers/net/tehuti.c Andy Gospodarek 2007-09-17  2306  
1a348ccc1047a00 drivers/net/tehuti.c Andy Gospodarek 2007-09-17  2307  /*
1a348ccc1047a00 drivers/net/tehuti.c Andy Gospodarek 2007-09-17  2308   * bdx_get_strings - return a set of strings that describe the requested objects
1a348ccc1047a00 drivers/net/tehuti.c Andy Gospodarek 2007-09-17  2309   * @netdev
1a348ccc1047a00 drivers/net/tehuti.c Andy Gospodarek 2007-09-17  2310   * @data
1a348ccc1047a00 drivers/net/tehuti.c Andy Gospodarek 2007-09-17  2311   */
1a348ccc1047a00 drivers/net/tehuti.c Andy Gospodarek 2007-09-17  2312  static void bdx_get_strings(struct net_device *netdev, u32 stringset, u8 *data)
1a348ccc1047a00 drivers/net/tehuti.c Andy Gospodarek 2007-09-17  2313  {
1a348ccc1047a00 drivers/net/tehuti.c Andy Gospodarek 2007-09-17  2314  	switch (stringset) {
1a348ccc1047a00 drivers/net/tehuti.c Andy Gospodarek 2007-09-17  2315  	case ETH_SS_STATS:
1a348ccc1047a00 drivers/net/tehuti.c Andy Gospodarek 2007-09-17 @2316  		memcpy(data, *bdx_stat_names, sizeof(bdx_stat_names));
1a348ccc1047a00 drivers/net/tehuti.c Andy Gospodarek 2007-09-17  2317  		break;
1a348ccc1047a00 drivers/net/tehuti.c Andy Gospodarek 2007-09-17  2318  	}
1a348ccc1047a00 drivers/net/tehuti.c Andy Gospodarek 2007-09-17  2319  }
1a348ccc1047a00 drivers/net/tehuti.c Andy Gospodarek 2007-09-17  2320  

:::::: The code at line 2316 was first introduced by commit
:::::: 1a348ccc1047a00507e554826775a3d81f7f3437 [NET]: Add Tehuti network driver.

:::::: TO: Andy Gospodarek <andy@greyhouse.net>
:::::: CC: David S. Miller <davem@sunset.davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
