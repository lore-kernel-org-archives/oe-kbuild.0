Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2DE44C6C
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Sep 2024 03:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726110571; cv=none; b=czv0YUB8gTC7VuhdoC3s4C1gIdRjdhwkZFw9Pr4jgXlrI9F8wzmZyhdW83o00bMn0tXdIdLnSEAH+8Ob8l9oXjvTkJD1QEPmqBmi2un2USLsNj1f59tHctBQzxaa5TirSrsJHaRLfpuxGkiFjWeRSO9HxJ8EFXMoZ+72X3+6QKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726110571; c=relaxed/simple;
	bh=y3lbP03VbBoGPkGzwtqiAGxwhz+l8TjJYJk5XN+ykb4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a9fnUZxzJYBMWrOjDXNBlXi1YOlkNXi/WoPHx2szFnoO1DOS891maEUhz8Ab3GnVt7LHFD5z8yV9zqirfzjBI0Zbja1XsQZ8FXnP3ykqvgtyERKLYW26k1Y2CA03oDgBjOtXhts/KRit+yjGyyj347hgtR3rpCFzmxGEiXLKYYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CRPvFj0r; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CRPvFj0r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726110569; x=1757646569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y3lbP03VbBoGPkGzwtqiAGxwhz+l8TjJYJk5XN+ykb4=;
  b=CRPvFj0rPv8r9FmMcRFUl71NYM0PUuRkFh/qCjKM7wEDwi4qPWhqgo85
   VBv8DDV0VyAQpwhvNgvH7lCz3eU0ZWmOOIp6Pb9fV5p92dslHnjuRfZ7p
   h5Fv1tQNYjj687CCQO+Sz8PSnrvPIWOtUWawrdTLUM8D/p4IlsZwTayDA
   TklOhIzZBsOSu7ivWwGox/vYREVub8oYnjnGb5Bi9AzS2mrltpWkQprH3
   QX6OxURQ34huVO3W6jQQGAHjwgVv/d0TvgSi2fI292XDvMkdbo7NOB5O7
   7fbIAKct/5ywSMlCfcWd4Sdsv60u0E6TF3acFmSM9C20CvoEzNWfv0Ts5
   A==;
X-CSE-ConnectionGUID: TgYkAI+YSmCB7uqFev8Tvw==
X-CSE-MsgGUID: kGnQABanQCieJjPnVnTKUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25136862"
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="25136862"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 20:09:28 -0700
X-CSE-ConnectionGUID: nJbCD9JIRgeUbELwAS3Z1g==
X-CSE-MsgGUID: binqgO4SRPC2eP/euYazWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,221,1719903600"; 
   d="scan'208";a="72364515"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Sep 2024 20:09:27 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soaCz-0004Qq-1l;
	Thu, 12 Sep 2024 03:09:25 +0000
Date: Thu, 12 Sep 2024 11:09:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2822/11210] progs/setget_sockopt.c:62:11: error:
 use of undeclared identifier 'TCP_BPF_SOCK_OPS_CB_FLAGS'; did you mean
 'BPF_SOCK_OPS_ALL_CB_FLAGS'?
Message-ID: <202409121039.nBD89OPa-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alan Maguire <alan.maguire@oracle.com>
CC: Martin KaFai Lau <martin.lau@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   32ffa5373540a8d1c06619f52d019c6cdc948bb4
commit: d53050934e66dbee64caed1309cef963a416c52f [2822/11210] selftests/bpf: add sockopt tests for TCP_BPF_SOCK_OPS_CB_FLAGS
:::::: branch date: 16 hours ago
:::::: commit date: 5 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409121039.nBD89OPa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409121039.nBD89OPa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> progs/setget_sockopt.c:62:11: error: use of undeclared identifier 'TCP_BPF_SOCK_OPS_CB_FLAGS'; did you mean 'BPF_SOCK_OPS_ALL_CB_FLAGS'?
      62 |         { .opt = TCP_BPF_SOCK_OPS_CB_FLAGS, .new = BPF_SOCK_OPS_ALL_CB_FLAGS,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                  BPF_SOCK_OPS_ALL_CB_FLAGS
   /tools/include/vmlinux.h:989:2: note: 'BPF_SOCK_OPS_ALL_CB_FLAGS' declared here
     989 |         BPF_SOCK_OPS_ALL_CB_FLAGS = 127,
         |         ^
   progs/setget_sockopt.c:365:54: error: use of undeclared identifier 'TCP_BPF_SOCK_OPS_CB_FLAGS'; did you mean 'BPF_SOCK_OPS_ALL_CB_FLAGS'?
     365 |         if (!sk || ctx->level != SOL_TCP || ctx->optname != TCP_BPF_SOCK_OPS_CB_FLAGS)
         |                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                             BPF_SOCK_OPS_ALL_CB_FLAGS
   /tools/include/vmlinux.h:989:2: note: 'BPF_SOCK_OPS_ALL_CB_FLAGS' declared here
     989 |         BPF_SOCK_OPS_ALL_CB_FLAGS = 127,
         |         ^
   progs/setget_sockopt.c:409:34: error: use of undeclared identifier 'TCP_BPF_SOCK_OPS_CB_FLAGS'; did you mean 'BPF_SOCK_OPS_ALL_CB_FLAGS'?
     409 |                 bpf_setsockopt(skops, SOL_TCP, TCP_BPF_SOCK_OPS_CB_FLAGS, &flags, sizeof(flags));
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                BPF_SOCK_OPS_ALL_CB_FLAGS
   /tools/include/vmlinux.h:989:2: note: 'BPF_SOCK_OPS_ALL_CB_FLAGS' declared here
     989 |         BPF_SOCK_OPS_ALL_CB_FLAGS = 127,
         |         ^
   3 errors generated.


vim +62 tools/testing/selftests/bpf/progs/setget_sockopt.c

31123c0360e01e Martin KaFai Lau 2022-08-16  50  
31123c0360e01e Martin KaFai Lau 2022-08-16  51  static const struct sockopt_test sol_tcp_tests[] = {
31123c0360e01e Martin KaFai Lau 2022-08-16  52  	{ .opt = TCP_NODELAY, .flip = 1, },
31123c0360e01e Martin KaFai Lau 2022-08-16  53  	{ .opt = TCP_KEEPIDLE, .new = 123, .expected = 123, .restore = 321, },
31123c0360e01e Martin KaFai Lau 2022-08-16  54  	{ .opt = TCP_KEEPINTVL, .new = 123, .expected = 123, .restore = 321, },
31123c0360e01e Martin KaFai Lau 2022-08-16  55  	{ .opt = TCP_KEEPCNT, .new = 123, .expected = 123, .restore = 124, },
31123c0360e01e Martin KaFai Lau 2022-08-16  56  	{ .opt = TCP_SYNCNT, .new = 123, .expected = 123, .restore = 124, },
31123c0360e01e Martin KaFai Lau 2022-08-16  57  	{ .opt = TCP_WINDOW_CLAMP, .new = 8123, .expected = 8123, .restore = 8124, },
31123c0360e01e Martin KaFai Lau 2022-08-16  58  	{ .opt = TCP_CONGESTION, },
31123c0360e01e Martin KaFai Lau 2022-08-16  59  	{ .opt = TCP_THIN_LINEAR_TIMEOUTS, .flip = 1, },
31123c0360e01e Martin KaFai Lau 2022-08-16  60  	{ .opt = TCP_USER_TIMEOUT, .new = 123400, .expected = 123400, },
31123c0360e01e Martin KaFai Lau 2022-08-16  61  	{ .opt = TCP_NOTSENT_LOWAT, .new = 1314, .expected = 1314, },
d53050934e66db Alan Maguire     2024-08-08 @62  	{ .opt = TCP_BPF_SOCK_OPS_CB_FLAGS, .new = BPF_SOCK_OPS_ALL_CB_FLAGS,
d53050934e66db Alan Maguire     2024-08-08  63  	  .expected = BPF_SOCK_OPS_ALL_CB_FLAGS, },
31123c0360e01e Martin KaFai Lau 2022-08-16  64  	{ .opt = 0, },
31123c0360e01e Martin KaFai Lau 2022-08-16  65  };
31123c0360e01e Martin KaFai Lau 2022-08-16  66  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
