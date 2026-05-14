Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE623AE193
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 12:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778762506; cv=none; b=hbAAbafeIdd8StLrt+pFlJrliZu2uZzdTJS6Fpj760wpkuE7E3/s7UPOT6GyCaXJVogLCVp6gqSWjlesEPomk/Yk1ePhaTxN2+RTnByG4koxPI8iMlDBMsLWn73LxVLQuK3eQdlUigfTPpvfQeG+oNQ3zWdva5yqjY7UqPzaAWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778762506; c=relaxed/simple;
	bh=WkPPxoFpwITaaAErFyGhp7WiDz+CTozImX29rA4gvaE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iweyWkDe0TyphNSuNv3N9kfjKTdYJ0vSsqq3UOU9PDMl5Zl73gOAQc8yCOsdSg/R1q9eLKUvPKsNQ+qxx3beX+1sUX0iudeya2J6QK3KZN8n6hd8QVq2vs9OV8cCznqP2gKU/Pcydx2KzigvR9jwZlcQpNpDoc8zfKbyU24gvPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zdkje4OT; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zdkje4OT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778762506; x=1810298506;
  h=date:from:to:cc:subject:message-id;
  bh=WkPPxoFpwITaaAErFyGhp7WiDz+CTozImX29rA4gvaE=;
  b=Zdkje4OTfOjX+ovuDd4KtNBudz8tEXyHFBY0HP297xEi5T3tIwe2Hk8x
   E2b+D2pSCGeyxrtskMAKTs0CYVREvii38ofmkjy7UWuXCmDd9SiT+p29g
   yfhQY7GtFMXG0NbV7Drh1T6GpAkP752YHTE1rSnblXojlIUjlXh8j53vb
   g8nPKz9DM51+jaclEGttycD7SSnle5qUZ+C3CoWSJ0wt/5UFQVZe0w3u4
   /efrFrLdn7bsiW62hA9A21nkIbgxteDV3CkWKLfM7BAOU37sc4+Fq/Na8
   ABqCS4E6PlBYtmz/7JwK95gYDCYaUoBK+s/tM0lMvZUSHPrENQN6Le2u5
   A==;
X-CSE-ConnectionGUID: JyalkvXLS76tQX3q7g0wzQ==
X-CSE-MsgGUID: /5XmGH0LTsy++NXIlYcWAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79739286"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="79739286"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 05:41:45 -0700
X-CSE-ConnectionGUID: b4JgOx2mQFSfNv4rCeMprw==
X-CSE-MsgGUID: 0AlsV2a9Sy2S0PaxnJTOXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="238625135"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 May 2026 05:41:44 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNVNm-000000006YP-16oD;
	Thu, 14 May 2026 12:41:42 +0000
Date: Thu, 14 May 2026 20:41:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:objtool/urgent 6/8] fs/netfs/fscache_cookie.o: error:
 objtool: __fscache_relinquish_cookie+0xcc: can't find jump dest instruction
 at .text.__fscache_relinquish_cookie+0x264
Message-ID: <202605142048.AOA0RZaJ-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool/urgent
head:   4e5019216402ad0b4a84cff457b662d26803f103
commit: 1fd1dc41724319406b0aff221a352a400b0ddfc5 [6/8] objtool: Fix ERROR_INSN() error message
:::::: branch date: 8 weeks ago
:::::: commit date: 10 weeks ago
config: powerpc-randconfig-r132-20260514 (https://download.01.org/0day-ci/archive/20260514/202605142048.AOA0RZaJ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605142048.AOA0RZaJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605142048.AOA0RZaJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/netfs/fscache_cookie.o: error: objtool: __fscache_relinquish_cookie+0xcc: can't find jump dest instruction at .text.__fscache_relinquish_cookie+0x264
--
>> fs/ceph/inode.o: error: objtool: ceph_fill_trace+0x2cc: can't find jump dest instruction at .text.ceph_fill_trace+0x1078

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
