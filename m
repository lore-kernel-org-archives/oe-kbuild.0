Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEEE1AA1C8
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Mar 2025 22:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741474289; cv=none; b=p32arOj2pjTTD93xAhPHzau8XG9YBN827xlDIhu48aY9u9tqK6Gh3hwE0V73m1OYRglkRFRH2wROyci8KPXmIj3/OifZGcbXrqY3MmoIycC7CESZpFAGEutCP3uDs5U66Kt2agWdFy8VyV97ePs7xJBGV6htSGCdiMh3TkM4QpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741474289; c=relaxed/simple;
	bh=w29qU7BuWMjZc0UT/xZagpk297nZ0cAAm/GxhpJ/EFI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LG1RshAsC1G9WEiRf1zP5pby1Cs/HOC8Cjk0HzRwxuCV7Tyi69EuR+g8ofGTcOG8cPrAc9qamH9Ml1b+0rAN0J1Y+4axYYTlwsBVb0nYmXBQzFSWuxHIGHL8XaayK2p0ev9wZr3s/iCsWrXNIvKpPp20fWr4H0W3hGzESxbk6LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CFCemCHB; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CFCemCHB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741474287; x=1773010287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w29qU7BuWMjZc0UT/xZagpk297nZ0cAAm/GxhpJ/EFI=;
  b=CFCemCHBFjQ9mwcj7EjrzWcRigq+L+8hiYV1KpnLdE65LfiVpRGtEQjG
   AjUFE35TuxVihCBvY5odWdLeWFy+WBxou8PoZr060MwVcjb5yt4zfot2v
   85BjSp/NEM7miKyhHOuwZglLo1JSz1vpOoyopIOLdbgYP1Wdq243Hnhud
   /zypiUibBeCgrFJc6nfFK1LpUzsVDrOiQgqunYxr8nyNH4DnpVbN5QW4s
   KCFgKbtCWocRPZAfWLFYRL2QNdWDQltASPnfs2nRL2rqaSUz4UIeFccmE
   T3ZYj3IWF2d0HHoLDmL8cp1b3yxZ3yRSSw++2mkPkmHj2ncMrCj5Xlk2g
   g==;
X-CSE-ConnectionGUID: YyPasqaPTOO3WJ5HiZAMdQ==
X-CSE-MsgGUID: olAeUdT1R86fhTi/hVFZvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="42352542"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="42352542"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 14:51:26 -0800
X-CSE-ConnectionGUID: PkQ2gSRcTgeLi5JCmYjkvA==
X-CSE-MsgGUID: hrfyR++wT/OgUYk30UEXiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150591040"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 08 Mar 2025 14:51:24 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tr30s-0002Pr-1x;
	Sat, 08 Mar 2025 22:51:22 +0000
Date: Sun, 9 Mar 2025 06:50:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kees:for-next/kspp 3/13] lib/tests/memcpy_kunit.c:320 init_large()
 warn: calling memset(x, y, ARRAY_SIZE());
Message-ID: <202503090602.oGjeXSGF-lkp@intel.com>
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
TO: Kees Cook <kees@kernel.org>
CC: David Gow <davidgow@google.com>
CC: Rae Moar <rmoar@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/kspp
head:   7f6688424bdcc7ccf3465cfc9a3f660bb8dad7d6
commit: db6fe4d61ece24193eb4d94a82d967501d53358c [3/13] lib: Move KUnit tests into tests/ subdirectory
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
config: s390-randconfig-r072-20250309 (https://download.01.org/0day-ci/archive/20250309/202503090602.oGjeXSGF-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503090602.oGjeXSGF-lkp@intel.com/

smatch warnings:
lib/tests/memcpy_kunit.c:320 init_large() warn: calling memset(x, y, ARRAY_SIZE());

vim +320 lib/tests/memcpy_kunit.c

96fce387d58fa8 lib/memcpy_kunit.c Kees Cook 2022-09-28  309  
96fce387d58fa8 lib/memcpy_kunit.c Kees Cook 2022-09-28  310  static void init_large(struct kunit *test)
96fce387d58fa8 lib/memcpy_kunit.c Kees Cook 2022-09-28  311  {
96fce387d58fa8 lib/memcpy_kunit.c Kees Cook 2022-09-28  312  	/* Get many bit patterns. */
96fce387d58fa8 lib/memcpy_kunit.c Kees Cook 2022-09-28  313  	get_random_bytes(large_src, ARRAY_SIZE(large_src));
96fce387d58fa8 lib/memcpy_kunit.c Kees Cook 2022-09-28  314  
96fce387d58fa8 lib/memcpy_kunit.c Kees Cook 2022-09-28  315  	/* Make sure we have non-zero edges. */
96fce387d58fa8 lib/memcpy_kunit.c Kees Cook 2022-09-28  316  	set_random_nonzero(test, &large_src[0]);
96fce387d58fa8 lib/memcpy_kunit.c Kees Cook 2022-09-28  317  	set_random_nonzero(test, &large_src[ARRAY_SIZE(large_src) - 1]);
96fce387d58fa8 lib/memcpy_kunit.c Kees Cook 2022-09-28  318  
96fce387d58fa8 lib/memcpy_kunit.c Kees Cook 2022-09-28  319  	/* Explicitly zero the entire destination. */
96fce387d58fa8 lib/memcpy_kunit.c Kees Cook 2022-09-28 @320  	memset(large_dst, 0, ARRAY_SIZE(large_dst));
96fce387d58fa8 lib/memcpy_kunit.c Kees Cook 2022-09-28  321  }
96fce387d58fa8 lib/memcpy_kunit.c Kees Cook 2022-09-28  322  

:::::: The code at line 320 was first introduced by commit
:::::: 96fce387d58fa8eae6e8d9b1ecdfbc18292d7a68 kunit/memcpy: Add dynamic size and window tests

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
