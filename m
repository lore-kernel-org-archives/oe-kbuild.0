Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC63115AC
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Apr 2023 23:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681861098; x=1713397098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mVYduY0KiPQdYZIShX5LhRboVWkXVy3TvSyMtuqi88k=;
  b=EL5k4TMelkpukKfunoEpFZPYRYtfRZkcbD2/cTjPHjIfSaXyy6oyAtfi
   6wtIH7lbWpHmQaBuN5vsDe9LJ9xp4eHRv0+ZP1NkTRz2cEWJMAJ2CynyI
   +Pmki57H1InOq69Wt0/ZHtFo5YvYVTB49rBt+X6b4n65LGwUdX9ddxB/t
   tTDXv/pLgls36B414WB4iSNbuTT4hUfX6ZooB/bJnMsPSyCSt2spmnUJ3
   Eu+n4FHuksEV8Ak4shXJNVJbYCYinzLjzLVa2WBrIy6AleDUPiLU1cP51
   jTzdeNltdWuhKq25jTgC+tYmj4Ic1NniAKF+lByGIc0jCYTa1WVa4HrI1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="347165096"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="347165096"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 16:38:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="780658417"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="780658417"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Apr 2023 16:38:17 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pouts-000eDb-24;
	Tue, 18 Apr 2023 23:38:16 +0000
Date: Wed, 19 Apr 2023 07:37:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jolsa-perf:uprobe_multi 1/17] kernel/trace/bpf_trace.c:3010:31:
 sparse: sparse: duplicate [noderef]
Message-ID: <202304190708.ndkrxXeR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/trace/bpf_trace.c:3010:31: sparse: sparse: duplicate [noderef]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jiri Olsa <jolsa@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_multi
head:   663cc4c067c5af744475e3a7573e3cd5b4647ef3
commit: fe88ac2cbf6177d5ed19dd8a6f4cf7e066d6aa95 [1/17] bpf: Add multi uprobe link
:::::: branch date: 10 hours ago
:::::: commit date: 11 hours ago
config: i386-randconfig-s001-20230417 (https://download.01.org/0day-ci/archive/20230419/202304190708.ndkrxXeR-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=fe88ac2cbf6177d5ed19dd8a6f4cf7e066d6aa95
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf uprobe_multi
        git checkout fe88ac2cbf6177d5ed19dd8a6f4cf7e066d6aa95
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304190708.ndkrxXeR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/bpf_trace.c:3010:31: sparse: sparse: duplicate [noderef]
>> kernel/trace/bpf_trace.c:3010:31: sparse: sparse: multiple address spaces given: __user & __user
   kernel/trace/bpf_trace.c:3010:46: sparse: sparse: multiple address spaces given: __user & __user

vim +3010 kernel/trace/bpf_trace.c

fe88ac2cbf6177 Jiri Olsa 2023-02-22  3007  
fe88ac2cbf6177 Jiri Olsa 2023-02-22  3008  int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
fe88ac2cbf6177 Jiri Olsa 2023-02-22  3009  {
fe88ac2cbf6177 Jiri Olsa 2023-02-22 @3010  	void __user **upaths, __user *upath, __user *old_upath = NULL;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
