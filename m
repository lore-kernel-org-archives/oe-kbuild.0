Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8CA259B
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Mar 2023 08:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678781546; x=1710317546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fiVR6s57B4hUqdxtLpjqF9Gn2fDJ6WiQsT/IqYxKU0k=;
  b=OuAZ3v70jrMLwbDv6XNACMaCor3B9lZuJhi0TDmA7XJiGKNViKf9W297
   T6eUgo3vefyfI0rJn1S7MWPuXiteATES6BtMfCpLwYovyvTq8TdWvKrJf
   fO9/6/g2B04KtfXDyoXOoM0O60fky9DXNbVNKm2tCGnudp7aVBBJj0Wzq
   tRVF7H/+Ql63RrVBsrCGaoAFBhjd80BscbI/UVIVqYHbBG9ha7M2CVPbx
   xRICWCvhVXrXjMkR+xUEYTTjzt9zaLZkgS/vv2W8PR4iOkxmg2uF5NwZY
   YKGBAKDQ6kXheAxtebDv6nKa8oI5P/+o3ry3Vahg1wpIBqMQ8YdLqzO2t
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="399949032"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="399949032"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 01:12:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="924833225"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="924833225"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 14 Mar 2023 01:12:24 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbzlf-0006hQ-28;
	Tue, 14 Mar 2023 08:12:23 +0000
Date: Tue, 14 Mar 2023 16:11:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jolsa-perf:uprobe_multi_6 1/12] kernel/trace/bpf_trace.c:3006:31:
 sparse: sparse: duplicate [noderef]
Message-ID: <202303141613.VD8zSUg6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/trace/bpf_trace.c:3006:31: sparse: sparse: duplicate [noderef]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jiri Olsa <jolsa@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_multi_6
head:   3f2899fc03dd194fc538daca944ed9560d265fb3
commit: 8dd01ea9b045f53b6b8625fde50a896de89e075d [1/12] bpf: Add multi uprobe link
:::::: branch date: 9 hours ago
:::::: commit date: 13 hours ago
config: sparc64-randconfig-s031-20230312 (https://download.01.org/0day-ci/archive/20230314/202303141613.VD8zSUg6-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=8dd01ea9b045f53b6b8625fde50a896de89e075d
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf uprobe_multi_6
        git checkout 8dd01ea9b045f53b6b8625fde50a896de89e075d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc64 SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303141613.VD8zSUg6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/bpf_trace.c:3006:31: sparse: sparse: duplicate [noderef]
>> kernel/trace/bpf_trace.c:3006:31: sparse: sparse: multiple address spaces given: __user & __user
   kernel/trace/bpf_trace.c:3006:46: sparse: sparse: multiple address spaces given: __user & __user

vim +3006 kernel/trace/bpf_trace.c

8dd01ea9b045f5 Jiri Olsa 2023-02-22  3003  
8dd01ea9b045f5 Jiri Olsa 2023-02-22  3004  int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *prog)
8dd01ea9b045f5 Jiri Olsa 2023-02-22  3005  {
8dd01ea9b045f5 Jiri Olsa 2023-02-22 @3006  	void __user **upaths, __user *upath, __user *old_upath = NULL;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
