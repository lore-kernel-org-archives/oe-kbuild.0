Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAE71F935
	for <oe-kbuild@lists.linux.dev>; Tue, 23 May 2023 16:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684861006; x=1716397006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D7G+2Ps0U6BIYjeBRvv2k89hy2W/LtUAfPF0V8EAz0k=;
  b=MW4y5LlH3KzqUyd7TZecZch/wfuSKRFKKro2OOolyM0qP1PPEo2tq5/f
   neuGrt7tmWs/1PbcfFB/C85Ynf579dDBuF8vnQeXD1Ie8Dy5EDAKG8F8A
   d3twBthl3XTFH/pWf2teU8AjzfgTcgJv/8reuNUdAcmQJ9LAwMeWkV+YD
   boFexLgqqVGZ3BZ7TczsWJjknIggTF9qy8oSzBVrrCjOll6lFvPThoDEZ
   5WJftL0d7LIc5FtVBEogaIZUExsPbt9W32MMBYmyNNrhWo1mE9o87jRod
   PbgcV6xlaSQ+OsIxgQRRFFHv3MgiNeigP2J/1MuaQACx0fQk8VaLHUVVL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="381539765"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; 
   d="scan'208";a="381539765"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 09:56:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="707098291"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; 
   d="scan'208";a="707098291"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 May 2023 09:56:22 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q1VJ8-000DwP-05;
	Tue, 23 May 2023 16:56:22 +0000
Date: Wed, 24 May 2023 00:56:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cilium:pr/new-api-tcx3 19/24] kernel/bpf/mprog.c:409:31: sparse:
 sparse: duplicate [noderef]
Message-ID: <202305240050.uWwnGLWB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/bpf/mprog.c:409:31: sparse: sparse: duplicate [noderef]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Daniel Borkmann <daniel@iogearbox.net>
TO: Daniel Borkmann <daniel@iogearbox.net>
CC: Nikolay Aleksandrov <razor@blackwall.org>

tree:   https://github.com/cilium/linux.git pr/new-api-tcx3
head:   da61e103a67338bee7f591d7b50b8afc00439187
commit: 86f83764d1568f7ef8ffafaa0bd88630dd7435ba [19/24] bpf: Add generic attach/detach/query API for multi-progs
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: s390-randconfig-s043-20230521 (https://download.01.org/0day-ci/archive/20230524/202305240050.uWwnGLWB-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/cilium/linux/commit/86f83764d1568f7ef8ffafaa0bd88630dd7435ba
        git remote add cilium https://github.com/cilium/linux.git
        git fetch --no-tags cilium pr/new-api-tcx3
        git checkout 86f83764d1568f7ef8ffafaa0bd88630dd7435ba
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=s390 SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202305240050.uWwnGLWB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/mprog.c:409:31: sparse: sparse: duplicate [noderef]
>> kernel/bpf/mprog.c:409:31: sparse: sparse: multiple address spaces given: __user & __user
   kernel/bpf/mprog.c:410:31: sparse: sparse: multiple address spaces given: __user & __user

vim +409 kernel/bpf/mprog.c

86f83764d1568f7 Daniel Borkmann 2022-10-05  405  
86f83764d1568f7 Daniel Borkmann 2022-10-05  406  int bpf_mprog_query(const union bpf_attr *attr, union bpf_attr __user *uattr,
86f83764d1568f7 Daniel Borkmann 2022-10-05  407  		    struct bpf_mprog_entry *entry)
86f83764d1568f7 Daniel Borkmann 2022-10-05  408  {
86f83764d1568f7 Daniel Borkmann 2022-10-05 @409  	u32 __user *uprog_id, __user *uprog_af;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
