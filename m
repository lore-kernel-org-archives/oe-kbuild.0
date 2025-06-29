Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B835661
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Jun 2025 20:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751229271; cv=none; b=LZ7tX93YdQhTuPwxhrNHEBBwwiWQQYkfhY7Urk8HXTj9sC/2qeTwh40TOxS4ATox4xwESWwaiXAnJFAli4qSu59YCJoKp4jwdg+TBTinrRucIYAUicQmwZV2H+nISNHSOliA/yMtFd+sXSAlxl5hb4pGvV9u17hw0EdpxQXZNdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751229271; c=relaxed/simple;
	bh=3051WJerdoJYNVWv2mvgSpqCyvDOeZCIc2NBlF3MABI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FQ30EGG4Fp7oOXm9bNUDkHIAE9HzxGCRp9EyJF2SVxzmukvDzeEWKfmAUs6B6HWc5fuenePEgqB/USuwYMK665xw7xWGPrzoXf0kJZPewuKgH65q+1SM1aCsq1KwC2v+KeiZPP7/jpHW3EJzFarefKT6eQGznnL+0zLeuWJ32ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P87xW29N; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P87xW29N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751229269; x=1782765269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3051WJerdoJYNVWv2mvgSpqCyvDOeZCIc2NBlF3MABI=;
  b=P87xW29NDXXSJIT7ILu6MOLf+AFrv7yfLyhbl3W/+WzH5dpYCNrYLrla
   7sG2bd7/dtXT6y21JlTsKL0UsClSHEJskutj6HAfn3jdHy2kK8mDW/F+Y
   ASGZgJMOqLiMnDjAPijSxtNlJ1y12I1FysVNtFFg6crG7X0eBF4ttSefE
   uPq00fjwU1FHXXaRkuAVkAzbqJfAEDKwv8CGR28CZ170RoUn4FZa98I6H
   ivU2sK7EMEsaKlDAZs2PmyqYXYmoJ9UIj4cUM2uzM5/y5SjMCyusCiPFG
   53Am8WbcblqIWWcaOIhRC7xX31h/jIsCfS4njlys3hrUk7UnF8PZzPrFD
   A==;
X-CSE-ConnectionGUID: I/OBQQe6RNSiwZpa7p8HpQ==
X-CSE-MsgGUID: CY6qyi1UTLSLOks8Lfiibw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="76006405"
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="76006405"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 13:34:29 -0700
X-CSE-ConnectionGUID: Qu8JLvopSwWr57T5O2x67g==
X-CSE-MsgGUID: 5x6W0BLfSBqE+xWQBzGziw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="152901581"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jun 2025 13:34:27 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVyjJ-000YCe-2D;
	Sun, 29 Jun 2025 20:34:25 +0000
Date: Mon, 30 Jun 2025 04:34:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpoimboe:patchpal-issue 36/46] /bin/bash: line 1: 3659322
 Segmentation fault      ./tools/objtool/objtool --hacks=jump_label
 --hacks=noinstr --hacks=skylake --ibt --retpoline --rethunk --sls
 --static-call --uaccess --no-unreachable --prefix=16 --link --module
 lib/tests/longest_symbol_k...
Message-ID: <202506300459.NKNfuo55-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git patchpal-issue
head:   89257ae2414384a196cd3546a47a37885c9a205b
commit: f1cb9a46697e8e0963460972e66003ee1b837587 [36/46] objtool: Generalize elf_create_symbol()
:::::: branch date: 4 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-123-20250629 (https://download.01.org/0day-ci/archive/20250630/202506300459.NKNfuo55-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506300459.NKNfuo55-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506300459.NKNfuo55-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/bash: line 1: 3659322 Segmentation fault      ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --hacks=skylake --ibt --retpoline --rethunk --sls --static-call --uaccess --no-unreachable --prefix=16 --link --module lib/tests/longest_symbol_kunit.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
