Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC71246788
	for <oe-kbuild@lists.linux.dev>; Thu, 21 Aug 2025 01:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755740436; cv=none; b=j0A4xas2isYO9W7VH43ckSsh8kfHYalI/BePQNlOzOFNo7WcOx0q78QTt2fnzG6a4FkfdzDhFAR9+Dj8vU01P/rUE3yULYzFeAmzMQ6RMlDYUueZ+bKxNiVpyBBsUH/c/xH0XW7Qf2/1YxMmzLklFciSvzAiIWBRdG2lqDQnQDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755740436; c=relaxed/simple;
	bh=AWjfCruKqROkmLCaqZRxT7uL8UZanZ3bLQjrUS1cXQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PmbmAWfESsZKwbZgXrWAnRCUWmImsweMnedzVILucOtN/BttGqWbiSYOS6PZdTH4rX6FEW48cE9RXJHKrTaJvW3JQB7s1bxPopKJ3ukmhsdN1bQdBAOxRp2f3iv/oMBm0yezYkWhekxb6bvobFU54/FhO+P+j3ZzRB9syMmliRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JnPavK11; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JnPavK11"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755740434; x=1787276434;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AWjfCruKqROkmLCaqZRxT7uL8UZanZ3bLQjrUS1cXQM=;
  b=JnPavK113LroTAgZp5EDm62ZhnIrEnYMKhO0rCQto+j0t5xDsv2r0ULh
   myd8dNV5IyF9YFmk5b2nk3J+NBJ7nuEIyz4KLOUFeEflbdslTONqk6aqg
   1amrBbluKSSHsquCv+j5/JT4srDO2yCQPiAdlUos4l1bSo89Z0M+SQmXW
   RCC2eOf2pibQYmQzN6htj6e519iTiAPnqVVyqvekhZp1V+pa3LholgBNL
   vCtDSBOnRjkSgcq4yq2UE59431w7tLFxsxtnEnuk9H8G0mj0ZYdbUgYAZ
   WVzPQZPxzS3ZEhWbvB6kN1J5kWBCNxIHq+DGBmIWTwZZzVjVoJ/TmWLCX
   A==;
X-CSE-ConnectionGUID: kqK/E3x+TyinsGI4eLC0tQ==
X-CSE-MsgGUID: SFUCzdvFQlO5iB1LAoJEEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="45592617"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="45592617"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 18:40:33 -0700
X-CSE-ConnectionGUID: F6JSIgGaQkmLYhh++rebOA==
X-CSE-MsgGUID: Qsr3KWOOQLKB2pQaSL6gxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="199146567"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 20 Aug 2025 18:40:32 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uouHY-000Joh-1A;
	Thu, 21 Aug 2025 01:40:08 +0000
Date: Thu, 21 Aug 2025 09:39:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: include/linux/mm.h:4178 page_pool_page_is_pp() warn: masked
 condition '(page->pp_magic & ~((((0) + (((((1 << (8 * 8 - 1 - (((-1)) < 1)))
 - 1) + (1 << (8 * 8 - 1 - (((-1)) < 1))))) << ((1 + __fls((64 +
 (6767463209352822784)) - (6767463209352822784)))) & ((...
Message-ID: <202508210947.6wlJsTy5-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
CC: Yury Norov <yury.norov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   41cd3fd152634250fdd09a52a35352b3f323800d
commit: 104ea1c84b91c9f452e497ba51602b903711cdd5 bits: unify the non-asm GENMASK*()
date:   3 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 weeks ago
config: powerpc64-randconfig-r073-20250819 (https://download.01.org/0day-ci/archive/20250821/202508210947.6wlJsTy5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508210947.6wlJsTy5-lkp@intel.com/

smatch warnings:
include/linux/mm.h:4178 page_pool_page_is_pp() warn: masked condition '(page->pp_magic & ~((((0) + (((((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 8 - 1 - (((-1)) < 1))))) << ((1 + __fls((64 + (6767463209352822784)) - (6767463209352822784)))) & ((((1 << (8 * 8 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 8 - 1 - (((-1)) < 1))))) >> ((8 * 8) - 1 - ((((32) < (__ffs((6767463209352822784)) - (1 + __fls((64 + (6767463209352822784)) - (6767463209352822784))))) ?(32):(__ffs((6767463209352822784)) - (1 + __fls((64 + (6767463209352822784)) - (6767463209352822784))))) + (1 + __fls((6' is always false.

vim +4178 include/linux/mm.h

cd3c93167da0e7 Toke Høiland-Jørgensen 2025-04-09  4174  
cd3c93167da0e7 Toke Høiland-Jørgensen 2025-04-09  4175  #ifdef CONFIG_PAGE_POOL
cd3c93167da0e7 Toke Høiland-Jørgensen 2025-04-09  4176  static inline bool page_pool_page_is_pp(struct page *page)
cd3c93167da0e7 Toke Høiland-Jørgensen 2025-04-09  4177  {
cd3c93167da0e7 Toke Høiland-Jørgensen 2025-04-09 @4178  	return (page->pp_magic & PP_MAGIC_MASK) == PP_SIGNATURE;
cd3c93167da0e7 Toke Høiland-Jørgensen 2025-04-09  4179  }
cd3c93167da0e7 Toke Høiland-Jørgensen 2025-04-09  4180  #else
cd3c93167da0e7 Toke Høiland-Jørgensen 2025-04-09  4181  static inline bool page_pool_page_is_pp(struct page *page)
cd3c93167da0e7 Toke Høiland-Jørgensen 2025-04-09  4182  {
cd3c93167da0e7 Toke Høiland-Jørgensen 2025-04-09  4183  	return false;
cd3c93167da0e7 Toke Høiland-Jørgensen 2025-04-09  4184  }
cd3c93167da0e7 Toke Høiland-Jørgensen 2025-04-09  4185  #endif
cd3c93167da0e7 Toke Høiland-Jørgensen 2025-04-09  4186  

:::::: The code at line 4178 was first introduced by commit
:::::: cd3c93167da0e760b5819246eae7a4ea30fd014b page_pool: Move pp_magic check into helper functions

:::::: TO: Toke Høiland-Jørgensen <toke@redhat.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
