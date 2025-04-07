Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC7F1A9B53
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Apr 2025 09:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744019358; cv=none; b=Z6vOAFeCwAF5FxnKgOmC+AO1hKClfCAi4dkBY9WV4cRLiGMeZ8RE+GhRVkPwFBdfYYAfZj7pubYSNDqEHL5XebNJY5DJAoiyYmZ3Yct/55T3P87f1GlteG9fnbwrrOdZMgIsBMe1jl8NOJmHbbXmp/WuqZG64p9Xa8LRWOz/0FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744019358; c=relaxed/simple;
	bh=Hriky9kxX851kfdflZ9mdkT17cDinha4Z4GaR5M2hHc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nW+eWkcxX7MsEU6PZ9n82+bCLF81U9pV6BLxkLkPz8bHDiyrvI8MrqabOYnsNv9lFIHKJmS642sEFltXjNEgU0IcDaMH15VDsR4Nb2ey6hFcBmEmBDpcpym7iOEk0ixD6DoTu5rbMfslySEmHXeQdesOygb/M6GzuBdLvCVAFAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fCW1Fn0W; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fCW1Fn0W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744019357; x=1775555357;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Hriky9kxX851kfdflZ9mdkT17cDinha4Z4GaR5M2hHc=;
  b=fCW1Fn0WqTUCIFshVhKsbBZHTT6Or64+f+p27Z448A/1yC86yPetWbTd
   tBf5UrZIRzsBdKADfdeZLKdaAXd0MhliXzogAwMf2o0yzYPvJsAQ5nH+9
   24FVEWJZ8MNUIfSsK0gzQ3rVQzgWC3QcZxLvZJwVdvOrplm5V7ElUbBqo
   quU+40Db4RqWRA4Xfxbk6vQc5BY2/phK84epE8AGNUjbPnUmbV4bkL61j
   9RdP7AHlp5mEV77Hna0P6RHNH4RqL47X8IIhrw9VQXZ9vIdejAK3V39jh
   nK2dtYkSPbhArHPrK9v8hdKGv6UoRuv40Nv0wvil0mjfJOpOVaxNudSYu
   g==;
X-CSE-ConnectionGUID: ZD9OBQT1QyORjiiiAnPugg==
X-CSE-MsgGUID: /9KTTthDTuWvEN93bWSOZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="56028746"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="56028746"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 02:49:16 -0700
X-CSE-ConnectionGUID: WRkRfA8XQA+qiogeTK4VOg==
X-CSE-MsgGUID: OaqFsK49RSiJLX1lc0KAfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="151096084"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 02:49:15 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1j6O-0003F3-2u;
	Mon, 07 Apr 2025 09:49:12 +0000
Date: Mon, 7 Apr 2025 17:48:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [toke:page-pool-track-dma 3/3] net/core/netmem_priv.h:25
 netmem_is_pp() warn: masked condition '(netmem_get_pp_magic(netmem) & ~(((0)
 + (((~((0))) << ((1 + __fls((64 + (6767463209352822784)) -
 (6767463209352822784))))) & (~((0)) >> (64 - 1 - ((((32) <
 (__ffs((6767463209352822784)) - (1...
Message-ID: <202504071733.hpPO5lLy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Toke Høiland-Jørgensen" <toke@redhat.com>
CC: Mina Almasry <almasrymina@google.com>
CC: Jesper Dangaard Brouer <hawk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/toke/linux.git page-pool-track-dma
head:   00a0b4613ed5cb0e10f2e370a7fd613a742e2c1d
commit: 00a0b4613ed5cb0e10f2e370a7fd613a742e2c1d [3/3] page_pool: Track DMA-mapped pages and unmap them when destroying the pool
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: powerpc64-randconfig-r071-20250407 (https://download.01.org/0day-ci/archive/20250407/202504071733.hpPO5lLy-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504071733.hpPO5lLy-lkp@intel.com/

New smatch warnings:
net/core/netmem_priv.h:25 netmem_is_pp() warn: masked condition '(netmem_get_pp_magic(netmem) & ~(((0) + (((~((0))) << ((1 + __fls((64 + (6767463209352822784)) - (6767463209352822784))))) & (~((0)) >> (64 - 1 - ((((32) < (__ffs((6767463209352822784)) - (1 + __fls((64 + (6767463209352822784)) - (6767463209352822784))))) ?(32):(__ffs((6767463209352822784)) - (1 + __fls((64 + (6767463209352822784)) - (6767463209352822784))))) + (1 + __fls((64 + (6767463209352822784)) - (6767463209352822784))) - 1))))) | 3)) == (64 + (6767463209352822784))' is always false.

Old smatch warnings:
net/core/skbuff.c:4771 skb_segment() error: we previously assumed 'list_skb' could be null (see line 4706)

vim +25 net/core/netmem_priv.h

8ab79ed50cf10f3 Mina Almasry           2024-09-10  22  
a4a22a1caf31aeb Toke Høiland-Jørgensen 2025-03-10  23  static inline bool netmem_is_pp(netmem_ref netmem)
a4a22a1caf31aeb Toke Høiland-Jørgensen 2025-03-10  24  {
a4a22a1caf31aeb Toke Høiland-Jørgensen 2025-03-10 @25  	return (netmem_get_pp_magic(netmem) & PP_MAGIC_MASK) == PP_SIGNATURE;
a4a22a1caf31aeb Toke Høiland-Jørgensen 2025-03-10  26  }
a4a22a1caf31aeb Toke Høiland-Jørgensen 2025-03-10  27  

:::::: The code at line 25 was first introduced by commit
:::::: a4a22a1caf31aeb57416327c9dfca479614b6b76 page_pool: Move pp_magic check into helper functions

:::::: TO: Toke Høiland-Jørgensen <toke@redhat.com>
:::::: CC: Toke Høiland-Jørgensen <toke@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
