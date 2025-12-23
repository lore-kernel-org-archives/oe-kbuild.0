Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0896334F253
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 15:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766503778; cv=none; b=fYStTjknuux0GavIJ+jizZHPI/TgQDTXOQFnEi7XqVNHW1kL5p7CTB6mBgliLAMhhXdqXvdF8/37LzX1dKDm0y4g5HLXh9MKG79UanKTxpEqCyVpbh2U2vfsFLOWeJTnbgk0sIqn6bGAf8h0KoNt+QU/n9uXRqgfksIfPJPQ6yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766503778; c=relaxed/simple;
	bh=615DgggehY9WsOQtvc7EOfgySgsVIlGFqTqhapv+eYw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jPXEYMuCpiX7a+yqlOCxIyoMtNvBGlvjNRSDK34XoDV29wrArZeLpmouWGjDWoYUbg0KW3mSQZK+gj8adQ/BGqmYxR8cNs35fnzfcofGEsRqvuha9zgtNdIrWVbJqGmDB3Uma0q1ujgLpSP2eZmN69yZCIbcIPRP7G09oA0nX9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bj/QbTYs; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bj/QbTYs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766503777; x=1798039777;
  h=date:from:to:cc:subject:message-id;
  bh=615DgggehY9WsOQtvc7EOfgySgsVIlGFqTqhapv+eYw=;
  b=bj/QbTYsLjjD8J+jRxCG1haMa/q8gfggSaPQ0+wVQ2CD+ieGm7KC5+M0
   OrirFGQ0Y+PY8IZTW0nKdbDnoem3ye66cVJmjt8m9qK0o1E5T4b0PB1Eq
   Xp6zB6SzV6MiOkyfn4wFAY4xFzU8c9dH0WdzpQVyRo8szFn2ruZ/GHY1b
   zesAOrCmNrcqJUAuHWmaAvgKKbA9JSCsBgahTTqhiq+T+q4q1Be8PVXtV
   6HnA/rfdPwdpgRyA/+m5CKFnH9iU/V2c7WY13UBXai1B7YgT7d1ASy6pJ
   1EJijKkHKTK7aNJtqL5kcC+FufAFgEQo80CTQy531cv0hmsP+vSywl413
   w==;
X-CSE-ConnectionGUID: K5BDpKajRvG+R0R2e0Ml1A==
X-CSE-MsgGUID: dqckYTR9TmGCl0GN8PDcYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79072933"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="79072933"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 07:29:36 -0800
X-CSE-ConnectionGUID: 4kg69catQZ6ogcdCAxylRg==
X-CSE-MsgGUID: MGB+dk4qQvWx8TSXHs6fmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="199832346"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 23 Dec 2025 07:29:34 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY4KK-00000000249-3O10;
	Tue, 23 Dec 2025 15:29:32 +0000
Date: Tue, 23 Dec 2025 23:24:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: warning: objtool:
 cec_receive_notify.isra.0+0x963: ignoring unreachables due to jump table
 quirk
Message-ID: <202512232337.18hcZw76-lkp@intel.com>
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
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>

Hi Josh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b927546677c876e26eba308550207c2ddf812a43
commit: eeff7ac61526a4a9c3916cf46885622078ad886b objtool: Warn when disabling unreachable warnings
date:   9 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 9 months ago
config: x86_64-buildonly-randconfig-003-20251224 (https://download.01.org/0day-ci/archive/20251223/202512232337.18hcZw76-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512232337.18hcZw76-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512232337.18hcZw76-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: cec_receive_notify.isra.0+0x963: ignoring unreachables due to jump table quirk

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
