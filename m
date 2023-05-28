Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85968366
	for <oe-kbuild@lists.linux.dev>; Sun, 28 May 2023 05:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685253357; x=1716789357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qtk4jyCDwIM/qWbMEHQH6nJUdsANAtETQt3DDYFRPTY=;
  b=PhdjMxxEQqFrQOujkAeHg72UDHTyQea7SZyq/voHLmwd6Na6Ls/EIEXN
   8tHEvD+txaa4zxDAU+MWNpZEI57bSWWfhnOVN7uA1ujAfHAWYWegmPMrI
   XrAJfkmdbWNKAwMutArrvLx1Fk7qK8vzyuugS2PjPkFLXYltyZDV1utwy
   tnBh+ZICDFQFqZvFZp2BeD6PGSxUmI0HZ5NGes7RhBoIj7+FxDntI9toE
   MWgEd6jWHj3LKHG5XS0tmbK/ZD06+9vGPa1s1kGT6jc4tBkS2QW7AXo4b
   dv8K+BeoZWVGoyiIOugeqmFhXHSeRRjb+tBzRePGkwU5r5Ghp7nOL06lm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="353327872"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="353327872"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 22:55:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="829961121"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="829961121"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 May 2023 22:55:55 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q39Nj-000KSE-0T;
	Sun, 28 May 2023 05:55:55 +0000
Date: Sun, 28 May 2023 13:55:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jolsa-perf:uprobe_multi_2 1/22] kernel/trace/bpf_trace.c:3035:31:
 sparse: sparse: duplicate [noderef]
Message-ID: <202305281324.goZ3zHFS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/trace/bpf_trace.c:3035:31: sparse: sparse: duplicate [noderef]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jiri Olsa <jolsa@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_multi_2
head:   c8f1191093bc581ca849b4e106d98b69bdc3a9fd
commit: cd4ef19c217089e0b5af3754c9b5915780926c9b [1/22] bpf: Add multi uprobe link
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-s053-20230528 (https://download.01.org/0day-ci/archive/20230528/202305281324.goZ3zHFS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=cd4ef19c217089e0b5af3754c9b5915780926c9b
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf uprobe_multi_2
        git checkout cd4ef19c217089e0b5af3754c9b5915780926c9b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/ lib//

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202305281324.goZ3zHFS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/bpf_trace.c:3035:31: sparse: sparse: duplicate [noderef]
>> kernel/trace/bpf_trace.c:3035:31: sparse: sparse: multiple address spaces given: __user & __user
   kernel/trace/bpf_trace.c:3035:46: sparse: sparse: multiple address spaces given: __user & __user

vim +3035 kernel/trace/bpf_trace.c

cd4ef19c217089 Jiri Olsa 2023-02-22  3032  
cd4ef19c217089 Jiri Olsa 2023-02-22  3033  int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
cd4ef19c217089 Jiri Olsa 2023-02-22  3034  {
cd4ef19c217089 Jiri Olsa 2023-02-22 @3035  	void __user **upaths, __user *upath, __user *old_upath = NULL;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
