Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5B51A9F87
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Apr 2026 03:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775791206; cv=none; b=LWiT+EhqdOkjlQhIYx4XmfcF5iuWN0RE3yePfKmq7V/qkfDdUBJ8QcVcggs+v2MMDeVTzvJgyUtgzVwXzFg7DCb+LPj9pairJs3VX9uGt0/fb3Vwy30hOeCXl5BFD857bwwQT0BDJGzoC5CkEhj0NRJp9KiRxN1Gl4ejBERfrf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775791206; c=relaxed/simple;
	bh=DVknsOKLwc59dXo4vETeDM3yVw4h20bfkVY9r40ZHDk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aJjYV/gGhIwm6L0Unk74DT5qqM4HFz2I428QWnbFteVhuO1lg6XnO2J0HYWuj0gGFlYa80Xl6NLE/dQN7748Syp9W8teaHBwebYUPDwf1eGSgqyqP0GdzBmBJoNP+PMEPqV2r+ok4yT0dNZBkF6HAAJO9tTMOm6a1Si9FbTPDvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/TDhqeV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/TDhqeV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775791205; x=1807327205;
  h=date:from:to:cc:subject:message-id;
  bh=DVknsOKLwc59dXo4vETeDM3yVw4h20bfkVY9r40ZHDk=;
  b=c/TDhqeVkKG2tTnKbF2x0UR23MRjd8chTb8vF3/XS/pmwkjNXgppzxtC
   6g+nrGq/uUHOyJXNKjN5qFuGYNqsGL7eBySDSN9Q8mxMgsyhFn1O0FtcK
   N8eDZh9KLyRRHtkKI0AGFe+Gg21P376whxxvjGKzKcUBRITl8rBB6I/NZ
   erCj2yCEhRf0zay6OZCIv/81u78OpdKhjpRvOO9rFHWikvVJlklcqT/DE
   pdEd9+FVXGiC6apXAQXPf3nja8Uvlixx9zmFBNiA65qDMCVAyoeARSvRV
   snYBkKLN3w3xgQQCnt0RsWD93uStAxsMzCcsKjiJu/N39Z2xpwuUEVujQ
   g==;
X-CSE-ConnectionGUID: 6W1oPX5ET96if4niMAjSqg==
X-CSE-MsgGUID: OJCakaVaT1yHbWQ+ZXyP+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76927613"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="76927613"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 20:20:04 -0700
X-CSE-ConnectionGUID: gCrcEamJRnK1NR9x1OPRbA==
X-CSE-MsgGUID: L2SCcchmQjK7P02xecxoVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; 
   d="scan'208";a="226247786"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 09 Apr 2026 20:20:04 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB2PZ-00000000Amb-3wqH;
	Fri, 10 Apr 2026 03:20:01 +0000
Date: Fri, 10 Apr 2026 05:19:20 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpoimboe:klp-build-arm64 36/39] klp-diff.c:721:66: error:
 use of undeclared identifier 'prefix'
Message-ID: <202604100518.H7rpJ4d1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build-arm64
head:   74681679b950d923bcf7d8f0ed35c447c447ec61
commit: e8ec3435bfebdc5dbed148c4f946969632005897 [36/39] objtool/klp: Add support for __patchable_function_entries
:::::: branch date: 67 minutes ago
:::::: commit date: 67 minutes ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260410/202604100518.H7rpJ4d1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604100518.H7rpJ4d1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604100518.H7rpJ4d1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> klp-diff.c:721:66: error: use of undeclared identifier 'prefix'
     721 |                                 data = patched_sym->sec->data->d_buf + patched_sym->offset - prefix.size;
         |                                                                                              ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
