Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0091379C0
	for <oe-kbuild@lists.linux.dev>; Mon, 31 Mar 2025 20:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743452280; cv=none; b=qsJ+YVmuR2XK5s8AtRmf7V16VrFRd7A4HqnBRQVKlZpKN9o0+zur3CEIoWbeuCxL//zKotcoNS9FCP8+RZqAssTQAZ8CIZKyZkVmiP8bQcOGBxc3uT90W0EzWPlF7LHmbeHW+Nl8MqT0no0JpWBh2TgXOF1MmTYXg6ZP3f1GUHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743452280; c=relaxed/simple;
	bh=zsIXyuRULzO2w4i1FS0ddQGRZsDIzUds+vqwkjvpyr4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wx8IwcJzXXvaPHPsXVbE+1Uu22WfO8d0pLKxvEk6ZQ2z4/eIECcDYFGwkf4Vf+E16lS8uB47LJeBCUyqXkXyZzaRnjnuN3LS06RtWz/5OUimo7OFVZkhnSeBXpjA+NXaF/geGTC0mj3m0We51rXzJeJBRU3EefCj3rYbgNSUBKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gY88VpqA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gY88VpqA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743452278; x=1774988278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zsIXyuRULzO2w4i1FS0ddQGRZsDIzUds+vqwkjvpyr4=;
  b=gY88VpqAW00iu9JQRXxyNeWkL192tSrS3AGIWcBVoKGrhMKpf2aVSzMb
   co5mGFcvOW+4MSNOJe5a6fHQVkzswX9knRNNifrTBFXTaId1QI0ACUY3p
   03U0goi5FqZKw/807GVAZXcvadpEREguCFX90IBD9bvM4OfUQ3qy+GJ3l
   KOZq0CLQFhrcB0td/SF9v+US5GqT6WIM4VOHoBgEMTHfEVYSXTG0oZJS/
   fSd1P4A5nOrOuCbUc46enh/zdNMqdLep9b5te4uekvBzgVWy9KatE9kdX
   JV3Beab/FA+SJIW5VRmIiDdL2Dm/VI1fZHswCgyRkG7ohNiXNUiyKiofz
   w==;
X-CSE-ConnectionGUID: nfzmQlLGR1StVfn4Fq1h3A==
X-CSE-MsgGUID: rFiVjOFGRLqWr1IWxwSDqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44665280"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="44665280"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 13:17:58 -0700
X-CSE-ConnectionGUID: xJoUjPPoTJSauiktW/SrPg==
X-CSE-MsgGUID: 5H+/lp9OQiWHLJ4whTsLyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="149369112"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 31 Mar 2025 13:17:56 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzLZy-0009Qa-19;
	Mon, 31 Mar 2025 20:17:54 +0000
Date: Tue, 1 Apr 2025 04:17:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpoimboe:objtool-werror 3/4] check.c:3538:10: error: no member
 named 'warnings' in 'struct symbol'
Message-ID: <202504010444.FAFVZ3BR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-werror
head:   fed6a8b43d3441f6b9d0700b429bc7a686023b9d
commit: d69b7d42d9b26e320e50855413577be6c3b51a35 [3/4] Revert "objtool: Increase per-function WARN_FUNC() rate limit"
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: powerpc-randconfig-001-20250401 (https://download.01.org/0day-ci/archive/20250401/202504010444.FAFVZ3BR-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250401/202504010444.FAFVZ3BR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504010444.FAFVZ3BR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> check.c:3538:10: error: no member named 'warnings' in 'struct symbol'
    3538 |                         func->warnings++;
         |                         ~~~~  ^
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:85: tools/objtool/check.o] Error 1 shuffle=1485354277
   make[5]: Target '__build' not remade because of errors.
   make[4]: *** [Makefile:65: tools/objtool/objtool-in.o] Error 2 shuffle=1485354277
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [Makefile:72: objtool] Error 2 shuffle=1485354277
   make[2]: *** [Makefile:1438: tools/objtool] Error 2 shuffle=1485354277
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=1485354277
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=1485354277
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
