Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A290F2068B
	for <oe-kbuild@lists.linux.dev>; Thu, 11 May 2023 17:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683826052; x=1715362052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FS8Kivo6Mv1kOwhsUvGSM2BbcZlS5vyx8Txpo/hjPqM=;
  b=VUbDd/FMVCCVOMWtJ+m6ZujsIe+F7++WgrlKwPPddWRrDK1m5ukA3L5N
   BwWPoVnLJOs+Ni6Ob/3s7dFTnJ7EsLpxQkNA3FipuD6FEJLxnqSoc3b5e
   7DLAf1KVTV+QGJwnxDSfWOxLhQGpXMZy6c3GeCJCNSrfIwI0uIuuW7ISA
   xfw9Bob9c8406NsG45dyBTp9LGRryz+ABcGoB8S7y75rJzzy9lV0iT67z
   J0h5zwNYMSokrQMjTe1zCb+6LgFg69TocHN5n8ySSuSjuaOnCanzu/wS2
   b6eVnPdzZrg5MPBvGb8JW0pItJC21ZMqu/AV9PtWGIXjlxXXAGBJINQ+5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="335082314"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="335082314"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 10:27:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="844065087"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="844065087"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 May 2023 10:27:31 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxA4g-00049U-1I;
	Thu, 11 May 2023 17:27:30 +0000
Date: Fri, 12 May 2023 01:27:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ERROR: modpost: "__st_r13_to_r25" [lib/zstd/zstd_decompress.ko]
 undefined!
Message-ID: <202305120130.mx171mxw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: ERROR: modpost: "__st_r13_to_r25" [lib/zstd/zstd_decompress.ko] undefined!"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masami Hiramatsu <mhiramat@kernel.org>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

Hi Masami,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   105131df9c3b27673392a6b7ff356360188dc869
commit: a2a9d67a26ec94a99ed29efbd61cf5be0a575678 bootconfig: Support embedding a bootconfig file in kernel
date:   1 year ago
:::::: branch date: 3 hours ago
:::::: commit date: 1 year ago
config: arc-randconfig-s051-20230511 (https://download.01.org/0day-ci/archive/20230512/202305120130.mx171mxw-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a2a9d67a26ec94a99ed29efbd61cf5be0a575678
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a2a9d67a26ec94a99ed29efbd61cf5be0a575678
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202305120130.mx171mxw-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "__ld_r13_to_r25_ret" [lib/zstd/zstd_decompress.ko] undefined!
>> ERROR: modpost: "__st_r13_to_r25" [lib/zstd/zstd_decompress.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
