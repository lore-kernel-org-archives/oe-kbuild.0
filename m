Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77C15CBE
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Nov 2023 01:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZV72GTOf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700529857; x=1732065857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=imaBr42ZcVD+AKgIVUyxS8nHFqC3d5Q+PB/rSyQJ2Zk=;
  b=ZV72GTOfzOfTikZHObP9TvFAO8KTN/R4yCHa/f/JYr4CeuIGrStIDwWi
   xdeW0/XL8LF13Wxn22NFxNMhbbixbCj7atnLywhQivQyqIgT4Sz1X3Usi
   xLjJ7h53pH6ri3y//O5EM6OPk4hQo7IyYyx/ht/ldwjjzWZzcMSXRCHYd
   MbL3Niqv5Bq2rLkTTw9WVs8SwtH0HgCLgK2RjDGtkizSAmScX4cXD3ydz
   ual1mk5a/Cw872jL0OtjS76J3wUAXD2MsiYmwZ3vW/19WDAvg/5mNX06b
   a0eHTbNQD3Qz6f669KEVutoUFB0wd20+MUm2IoiCA+2RPhego3pEIwxmW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="4858215"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="4858215"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 17:24:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="759946298"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="759946298"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 20 Nov 2023 17:24:14 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5FUi-00078z-28;
	Tue, 21 Nov 2023 01:24:08 +0000
Date: Tue, 21 Nov 2023 09:22:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mptcp:export 40/44] progs/mptcp_bpf_burst.c:37:18: error: no member
 named 'write_seq' in 'struct tcp_sock'
Message-ID: <202311210900.KeauUfzP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: mptcp@lists.linux.dev
TO: Geliang Tang <geliang.tang@suse.com>
CC: Mat Martineau <martineau@kernel.org>

Hi Geliang,

First bad commit (maybe != root cause):

tree:   https://github.com/multipath-tcp/mptcp_net-next.git export
head:   4fb8133272737c034fce4cf3a82ea02ded380281
commit: 1339de2f329ae0cabe49f0006b126f120d6c3192 [40/44] selftests/bpf: Add bpf_burst scheduler
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311210900.KeauUfzP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311210900.KeauUfzP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> progs/mptcp_bpf_burst.c:37:18: error: no member named 'write_seq' in 'struct tcp_sock'
      37 |         return tp ? tp->write_seq == tp->snd_nxt : true;
         |                     ~~  ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
