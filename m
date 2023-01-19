Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70962C9C
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jan 2023 08:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674116446; x=1705652446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LIpf5RitLgDzUS1ZSSmgdmLRg/9cs0+pKZ6tTcHeOIg=;
  b=nGTjfVEfu7F9qOgtFph8nJiPCxEG4LZa/xtzd1nrSkiE0Fm0lR1doQ4S
   ZbTXlxF5bVJcQxcSSEZ2uR9H/QXG+gROhgN+5PCIbTgGiWNtnX9mhaUvt
   4GPurjoNlIE8iQRIJskqe/iBVO/339nKsrHayFOjsWH9J/QOOatAwmVIU
   ikGtrhGIlJYi+GEW2t8C+jZIRL7hfYjGrmCvuVaaqTAkPcmvzoradQjL9
   ++vKHahr1DNfw7b+tlH8u3q+1HvaibKtrsu3rqWWbaYgB7vER/7VnPadv
   EXZrQasmKRiF0jvbNKCRMTvSTY5kfVtKICDZ8MrF1b0cFN9JsLtNb8EG6
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="304910090"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="304910090"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 00:20:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="728562422"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="728562422"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Jan 2023 00:20:42 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIQA5-0001I6-3B;
	Thu, 19 Jan 2023 08:20:41 +0000
Date: Thu, 19 Jan 2023 16:20:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/ext4/super.c:2054:1: warning: unused function 'ctx_set_flags'
Message-ID: <202301191631.L2etPIwv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "gcc: unused function warning for stub function"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jeff Layton <jlayton@kernel.org>
CC: "Theodore Ts'o" <tytso@mit.edu>
CC: Lukas Czerner <lczerner@redhat.com>
CC: "Christian Brauner (Microsoft)" <brauner@kernel.org>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7287904c8771b77b9504f53623bb477065c19a58
commit: 1ff20307393e17dc57fde62226df625a3a3c36e9 ext4: unconditionally enable the i_version counter
date:   4 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-a002-20230116 (https://download.01.org/0day-ci/archive/20230119/202301191631.L2etPIwv-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1ff20307393e17dc57fde62226df625a3a3c36e9
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1ff20307393e17dc57fde62226df625a3a3c36e9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/ext4/ lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   fs/ext4/super.c:1750:19: warning: unused variable 'deprecated_msg' [-Wunused-const-variable]
   static const char deprecated_msg[] =
                     ^
>> fs/ext4/super.c:2054:1: warning: unused function 'ctx_set_flags' [-Wunused-function]
   EXT4_SET_CTX(flags); /* set only */
   ^
   fs/ext4/super.c:2032:20: note: expanded from macro 'EXT4_SET_CTX'
   static inline void ctx_set_##name(struct ext4_fs_context *ctx,          \
                      ^
   <scratch space>:92:1: note: expanded from here
   ctx_set_flags
   ^
   2 warnings generated.


vim +/ctx_set_flags +2054 fs/ext4/super.c

6e47a3cc68fc52 Lukas Czerner 2021-10-27  2053  
e3952fcce1aad9 Lukas Czerner 2022-02-01 @2054  EXT4_SET_CTX(flags); /* set only */
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2055  EXT4_SET_CTX(mount_opt);
e3952fcce1aad9 Lukas Czerner 2022-02-01  2056  EXT4_CLEAR_CTX(mount_opt);
e3952fcce1aad9 Lukas Czerner 2022-02-01  2057  EXT4_TEST_CTX(mount_opt);
6e47a3cc68fc52 Lukas Czerner 2021-10-27  2058  EXT4_SET_CTX(mount_opt2);
e3952fcce1aad9 Lukas Czerner 2022-02-01  2059  EXT4_CLEAR_CTX(mount_opt2);
e3952fcce1aad9 Lukas Czerner 2022-02-01  2060  EXT4_TEST_CTX(mount_opt2);
e3952fcce1aad9 Lukas Czerner 2022-02-01  2061  

:::::: The code at line 2054 was first introduced by commit
:::::: e3952fcce1aad934f1322843b564ff86256444b2 ext4: fix remount with 'abort' option

:::::: TO: Lukas Czerner <lczerner@redhat.com>
:::::: CC: Theodore Ts'o <tytso@mit.edu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
