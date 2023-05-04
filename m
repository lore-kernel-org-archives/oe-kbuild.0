Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5273CEC7
	for <oe-kbuild@lists.linux.dev>; Thu,  4 May 2023 04:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683176036; x=1714712036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q1BnuCIldahz0ScrsACPs2LRFikObNiDRHosR+nXT2o=;
  b=HlvmIms32VKi6YgoBDW4FA79mcaly49EVlEEkUDX4iuwC4qOSFuLy3YY
   MH1HFa0344j7uv/MI7ABZr0rj/LPNqQA9fTY5QzCN9MwGAogHH7IbPq2I
   y8Vp4Kuer7Gkmlfa1Ugiy2GfHXafli9flosmdccvaNup1HEwJ/IjGL5gU
   bC3zpdKB2sypU675I/FF6mj1/LsthLq8wJnM+RCyyb201H6leJw1YA1oa
   ZRJ2lkCsyDDl3iTmtJWg9rjkmze97RRFnve17+jM5aJy+7g+xdTYi+Dzi
   YaaDT8vFj155OrddAiN8i+chdE8tFk+4PVC5DpPj+Hpsjskc5lUOHjHav
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="333201051"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="333201051"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 21:53:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="871215394"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="871215394"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 03 May 2023 21:53:54 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puQyS-0002Zp-2W;
	Thu, 04 May 2023 04:53:48 +0000
Date: Thu, 4 May 2023 12:53:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cilium:pr/new-api-tcx2 2/5] kernel/bpf/mprog.c:319:31: sparse:
 sparse: duplicate [noderef]
Message-ID: <202305041242.4LUCcFPT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/bpf/mprog.c:319:31: sparse: sparse: duplicate [noderef]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Daniel Borkmann <daniel@iogearbox.net>
TO: Daniel Borkmann <daniel@iogearbox.net>

tree:   https://github.com/cilium/linux.git pr/new-api-tcx2
head:   921918340afd770a43cabc1493080df36863b5c5
commit: abe11a7d6ecffb6402a53bf8b0bd0fc113b916e9 [2/5] bpf: Add generic attach/detach/query API for multi-progs
:::::: branch date: 15 hours ago
:::::: commit date: 19 hours ago
config: parisc-randconfig-s051-20230430 (https://download.01.org/0day-ci/archive/20230504/202305041242.4LUCcFPT-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/cilium/linux/commit/abe11a7d6ecffb6402a53bf8b0bd0fc113b916e9
        git remote add cilium https://github.com/cilium/linux.git
        git fetch --no-tags cilium pr/new-api-tcx2
        git checkout abe11a7d6ecffb6402a53bf8b0bd0fc113b916e9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=parisc SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202305041242.4LUCcFPT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/mprog.c:319:31: sparse: sparse: duplicate [noderef]
>> kernel/bpf/mprog.c:319:31: sparse: sparse: multiple address spaces given: __user & __user
   kernel/bpf/mprog.c:320:31: sparse: sparse: multiple address spaces given: __user & __user

vim +319 kernel/bpf/mprog.c

abe11a7d6ecffb Daniel Borkmann 2022-10-05  315  
abe11a7d6ecffb Daniel Borkmann 2022-10-05  316  int bpf_mprog_query(const union bpf_attr *attr, union bpf_attr __user *uattr,
abe11a7d6ecffb Daniel Borkmann 2022-10-05  317  		    struct bpf_mprog_entry *entry)
abe11a7d6ecffb Daniel Borkmann 2022-10-05  318  {
abe11a7d6ecffb Daniel Borkmann 2022-10-05 @319  	u32 __user *uprog_id, __user *uprog_af;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
