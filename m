Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3D018C341
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Nov 2024 22:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730673539; cv=none; b=GXmbznqI2BCa6lL0QXtcwLhLQCm5jwdYMSRuo/IQ0D8LrqaKO8O7h6s2+rWpNGBa2hsHu/ZnzuZvm+3dREpfpsTqUbCSmKkspl80bv8QQ2TxRYvuIX+lxA067rIePpo1NwQCfe9+xT6w8R8zXaiBzBejMiCVLURa9ul56HA1c3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730673539; c=relaxed/simple;
	bh=Zig5vFoUx58NeunDL54aUWlqvV7DsEiJMFNfi9PZNRo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qeBcU9VBRJo1CL+DXwXpD8ckCr5/7Nqb9R29TjG9Z86FWpZkiqtpbDuG5rfDqf90RMn7Js68WN4GOmUPLysfgv14OZK2vQDwnT4NBHuE0Ec1a2/hN6Nvt4D0Npcje9RrOD/BidDCUyu0upWg8vBEn6//Y7y9mDxurxDu+VEIp/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=id3SOpV8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="id3SOpV8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730673534; x=1762209534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zig5vFoUx58NeunDL54aUWlqvV7DsEiJMFNfi9PZNRo=;
  b=id3SOpV8dQB+oa92FAYa3iPnRKLMA0gjyDLtqI7E6ur5xAXHiCDy6AVa
   2Q2OelruRCUNZ2bAdNmsOJHiuErkKyK6sWqlVrn6umt7ikdJDFZ0SCJ6c
   SBnciMREZa1qifc1edgMaW3GxEgQc0AF2wzlKQho6zV/jg2r8w76FYfRx
   0Ym4XXIa/f4Cj9XHdsZ2rqTCFJ2iOT/ft/FYjhtZ+iFh29AzLvbFPdx/0
   YaCWbXf9L2r7UKXTCdvRjBEUwvPe0XHQT1GAulLjwrdoQSqUDQZTYblWL
   qYoEk+GxdEIsy2N+8GFxAgZPeeV0KVhTlXlXXMv5n/Xoq82oBwSaFGhf6
   g==;
X-CSE-ConnectionGUID: zyd7I7AyRumLrXkakUGNFw==
X-CSE-MsgGUID: znImmHvSSDygQZTKL6/h+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47824747"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47824747"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 14:38:54 -0800
X-CSE-ConnectionGUID: cwofpcQOS62yb3mGNEzlZg==
X-CSE-MsgGUID: tWV0BXa5QKuOhHYKw7KJwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83369404"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Nov 2024 14:38:53 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7jFC-000kGJ-2k;
	Sun, 03 Nov 2024 22:38:50 +0000
Date: Mon, 4 Nov 2024 06:38:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: internal error: arch/alpha/include/asm/io_trivial.h:70 SQL error #2:
 near "and": syntax error
Message-ID: <202411040634.n36qa16D-lkp@intel.com>
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
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a8cc7432728d019a10cb412401ebc15ed7504289
commit: a4184174be36369c3af8d937e165f28a43ef1e02 alpha: drop pre-EV56 support
date:   6 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 6 months ago
config: alpha-randconfig-r072-20241104 (https://download.01.org/0day-ci/archive/20241104/202411040634.n36qa16D-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411040634.n36qa16D-lkp@intel.com/

New smatch warnings:
internal error: arch/alpha/include/asm/io_trivial.h:70 SQL error #2: near "and": syntax error
internal error: arch/alpha/include/asm/io_trivial.h:70 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'
internal error: arch/alpha/include/asm/core_marvel.h:340 SQL error #2: near "and": syntax error
internal error: arch/alpha/include/asm/core_marvel.h:340 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'
internal error: arch/alpha/kernel/core_marvel.c:815 SQL error #2: near "and": syntax error
internal error: arch/alpha/kernel/core_marvel.c:815 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'

Old smatch warnings:
arch/alpha/kernel/core_marvel.c:614 marvel_pci_tbi() warn: statement has no effect 8

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
