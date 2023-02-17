Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A28263E
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Feb 2023 05:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676613483; x=1708149483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8aw4FE48RHORSLIp4YUMB5aq7NeHnlogGjGJ0uzc7SI=;
  b=EnX5fTWn3htyoTp5Dg55n0BwHVLU/O8EwiFFKEmoVOWlKZS9G4XmZy6h
   5DI/YOmHPr3zVOXDhDxr8DjHRgfuYsLScK4b3mPaaV/KdIvatKe7Kg2am
   vz7s+D7dKVB3EUExzD8iTlu7ojLmL3NTEsgOF6FY0o9+kRyMuH9wq7Ms+
   /iX26Wi0iM5Vwe7uowXzF8A2QZRLkwiaBQYXheHSghcTKQ4+MAw23orxH
   oNIKSonaPVIa1EK6XyOoXcR8zd7ohgbzNEbUFg9TGDlO6oTy8XiBQP1E+
   tSlhYvP2nMwHNlvnBZWgK3zFolPKAyW5/jNLqmduFZd7nUOHNUzwcR0do
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="320019322"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="320019322"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 21:58:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="915970823"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="915970823"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 16 Feb 2023 21:58:01 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pStku-000B9t-1l;
	Fri, 17 Feb 2023 05:58:00 +0000
Date: Fri, 17 Feb 2023 13:57:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:sched/core 1/6] vmlinux.o: warning: objtool:
 xenpv_exc_double_fault+0xd: unreachable instruction
Message-ID: <202302171355.SEjv82Se-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: vmlinux.o: warning: objtool: xenpv_exc_double_fault+0xd: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
head:   7c4a5b89a0b5a57a64b601775b296abf77a9fe97
commit: 443ed4c302fff6a26af980300463343a7adc9ee8 [1/6] objtool: mem*() are not uaccess safe
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-s021 (https://download.01.org/0day-ci/archive/20230217/202302171355.SEjv82Se-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=443ed4c302fff6a26af980300463343a7adc9ee8
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
        git fetch --no-tags tip sched/core
        git checkout 443ed4c302fff6a26af980300463343a7adc9ee8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302171355.SEjv82Se-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: xenpv_exc_double_fault+0xd: unreachable instruction


objdump-func vmlinux.o xenpv_exc_double_fault:
0000 0000000000001380 <xenpv_exc_double_fault>:
0000     1380:	f3 0f 1e fa          	endbr64
0004     1384:	55                   	push   %rbp
0005     1385:	48 89 e5             	mov    %rsp,%rbp
0008     1388:	e8 00 00 00 00       	call   138d <xenpv_exc_double_fault+0xd>	1389: R_X86_64_PLT32	exc_double_fault-0x4
000d     138d:	5d                   	pop    %rbp
000e     138e:	c3                   	ret
000f     138f:	90                   	nop

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
