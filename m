Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB0819BCE
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Nov 2023 21:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ds2zYgDK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700255040; x=1731791040;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qvIu79PaeMU5C6yHvb7hPBkasbjx/AW2gl0siAaR1l8=;
  b=Ds2zYgDKEjrpsisTYARR9K1kVIgxuza2ysqRf6BsdsZhRlR5rzAbMxJZ
   nNtWkMQJe40kWV/5hymv5TmPzL420UpY0jlet+oCFUOkXYjn3ZJBJTxQv
   cKQxaB6KMQuaCzvJ9Tp5ywhOCQEzsal6YOdgiPB0hnozujw5oVL+TwrYX
   f/4W2pxcy7Zmv8K3e6ZxFnn2LzB8gjjdiVek6AxTnyaFfYgTc6Bu22eRi
   5ywZzOjHtk2zP3KATRyajvsOWnOHyn/65vfemawR7YX+CdgPB97MEZ04t
   qiNwKbQne3iXHDdXnROrxgEJy6XnyGv5bP1cqd7rRAVyBvOoxsRxfWQF6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="371546710"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="371546710"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 13:03:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="759261863"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="759261863"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 17 Nov 2023 13:03:57 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r460J-000393-0l;
	Fri, 17 Nov 2023 21:03:55 +0000
Date: Sat, 18 Nov 2023 05:03:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mptcp:export 35/39] progs/mptcp_bpf_burst.c:37:18: error: no member
 named 'write_seq' in 'struct tcp_sock'
Message-ID: <202311180438.KHYloYBe-lkp@intel.com>
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
commit: 5b8c59bd41d2ec0608090675ec3cdd1a1ce3e9c0 [35/39] selftests/bpf: Add bpf_burst scheduler
:::::: branch date: 15 hours ago
:::::: commit date: 4 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311180438.KHYloYBe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311180438.KHYloYBe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> progs/mptcp_bpf_burst.c:37:18: error: no member named 'write_seq' in 'struct tcp_sock'
      37 |         return tp ? tp->write_seq == tp->snd_nxt : true;
         |                     ~~  ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
