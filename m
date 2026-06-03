Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BC73AEB2D
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Jun 2026 22:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780526729; cv=none; b=q+JCQ+SZN1KUZgI/r3xSMUAtcUwLxNVq+wC/5ffX6lEwVgWJEYNr3OQj0kRfljYrKzUEM38zaVVQvjTP7jEVjKBzH9Icqo6Cw+2qU7JepidWGbK9Q85hJuIkhajyzQ53noj67QHJPcvbmdx/0/0GuZPV0Fwt7DxdpbH/5gGm6Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780526729; c=relaxed/simple;
	bh=2tF4g+0fExUtc+2Rdwn9OMvictzB5cq4jUwHsL1LnMY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KNOoGhQVnhBozpYoj2WWzh67NFAR/sbupVGLdYzmoyhqTthIDo7kHOqlpvOb8akKewaMTPnuCLrBvc/fjMS8j3/4dkhvdzwlD25V6JkGHOlXmbfux1C6Vn9tfjOGYTpYR7Z/3564syQzgtFfPaT1iG5UydUI+EzU82WIkNdMS1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KpBVle8r; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KpBVle8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780526728; x=1812062728;
  h=date:from:to:cc:subject:message-id;
  bh=2tF4g+0fExUtc+2Rdwn9OMvictzB5cq4jUwHsL1LnMY=;
  b=KpBVle8r3peIU+idC7jwJB19dli62Qe+mGlLNZuhq9PRhqgCmNB8pbHW
   gFr71YollxAFXWbq29HJtBiafll7j7aEOvsE5Hd6S6VIieY5LdJ0bOCLV
   F5C07VI5Rcvf4e31LyOlFPDE/fRieejTwrvtDqccS/kueokcRSnyfGdHq
   Sphq9cVzQDoX0P4S0v8Sqmry0ZASWLX922ehql7xqCy0MKQkcIXh3emZG
   5H6zJ+ZmevDmGukVkFeBmCSK3BSQRVbCP8fLyDMdcZLXSUufL1NnyVeuD
   g8Mh9gTs+pWOC1s0qpiVgyfVxA56d1EKYH+lIZhJl9TIgY20opRm+J/dH
   A==;
X-CSE-ConnectionGUID: xF3P2C22T9ORSD2fTLklYg==
X-CSE-MsgGUID: bBP53mwpSRyV6SiTDfAv+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="92832092"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="92832092"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 15:45:27 -0700
X-CSE-ConnectionGUID: eEyDt9D1SAKGH3ccBYMj0w==
X-CSE-MsgGUID: wKTIYy+RRXuA2ZfzSCSkhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="274603433"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Jun 2026 15:45:26 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUuKy-00000000Dxe-0YS8;
	Wed, 03 Jun 2026 22:45:24 +0000
Date: Thu, 04 Jun 2026 06:44:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 8423/10263] {standard input}:200406:
 Error: branch out of range
Message-ID: <202606040609.AwnlqbPA-lkp@intel.com>
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
TO: Konstantin Khorenko <khorenko@virtuozzo.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Peter Oberparleiter <oberpar@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b7bee4ca5688e30ca50fbc87b1b8f7eed7006c17
commit: 56cb9b7d96b28a1173a510ab25354b6599ad3a33 [8423/10263] gcov: use atomic counter updates to fix concurrent access crashes
:::::: branch date: 30 hours ago
:::::: commit date: 6 days ago
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20260604/202606040609.AwnlqbPA-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260604/202606040609.AwnlqbPA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606040609.AwnlqbPA-lkp@intel.com/

Note: the linux-next/master HEAD b7bee4ca5688e30ca50fbc87b1b8f7eed7006c17 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:200406: Error: branch out of range
   {standard input}:200407: Error: branch out of range
   {standard input}:200465: Error: branch out of range
   {standard input}:200473: Error: branch out of range
   {standard input}:200537: Error: branch out of range
   {standard input}:200542: Error: branch out of range

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
