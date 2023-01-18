Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3007F8C06
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jan 2023 22:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674079234; x=1705615234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gx2mmEzmVRux5MfEpgJsORu46Ifmqip72O7K91Af2yU=;
  b=ENFuGliqzCQMz7TxdSsKpOKDaJqFv346ShM6ikQBogbQr61mCd4VRSi8
   IqhfwL5EOOFXr3gQCTJG8V8zxjBxE1xf73Gbm75bdOluilMJOizUM47Lg
   5vKQHQB4BlEPMepvxDRiJQcr+Ny0HAWGhyDnR0FdS60yIBx3nzuGn66gS
   vfmh8KCF3sgTuyfRzRdWqsuQqc8+ZodMkXeXZu+oiGSEbjqLJxIqIovA6
   DZzH5yt9fPNL/tAnGilFIgjijsEHpit4KtA12g7T6RTlp6Oyk0ZPuzbwZ
   ewkfhFQKtyX2ZB0SqHsk8L4ookGM3TztwFG7FwP0NWl1J4DiSEx4rIaKu
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="327186247"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="327186247"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 14:00:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="748650168"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="748650168"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2023 14:00:15 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIGTf-0000kd-07;
	Wed, 18 Jan 2023 22:00:15 +0000
Date: Thu, 19 Jan 2023 06:00:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/zstd/compress/huf_compress.c:471:16: warning: unused function
 'HUF_isSorted'
Message-ID: <202301190534.YYBrlN7V-lkp@intel.com>
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
TO: Nick Terrell <terrelln@fb.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c1649ec55708ae42091a2f1bca1ab49ecd722d55
commit: 2aa14b1ab2c41a4fe41efae80d58bb77da91f19f zstd: import usptream v1.5.2
date:   3 months ago
:::::: branch date: 28 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20230119/202301190534.YYBrlN7V-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2aa14b1ab2c41a4fe41efae80d58bb77da91f19f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2aa14b1ab2c41a4fe41efae80d58bb77da91f19f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash lib/zstd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> lib/zstd/compress/huf_compress.c:471:16: warning: unused function 'HUF_isSorted' [-Wunused-function]
   MEM_STATIC int HUF_isSorted(nodeElt huffNode[], U32 const maxSymbolValue1) {
                  ^
   1 warning generated.
--
>> lib/zstd/compress/zstd_lazy.c:835:16: warning: unused function 'ZSTD_isAligned' [-Wunused-function]
   MEM_STATIC int ZSTD_isAligned(void const* ptr, size_t align) {
                  ^
   1 warning generated.


vim +/HUF_isSorted +471 lib/zstd/compress/huf_compress.c

2aa14b1ab2c41a Nick Terrell 2022-10-17  469  
2aa14b1ab2c41a Nick Terrell 2022-10-17  470  /* Returns 0 if the huffNode array is not sorted by descending count */
2aa14b1ab2c41a Nick Terrell 2022-10-17 @471  MEM_STATIC int HUF_isSorted(nodeElt huffNode[], U32 const maxSymbolValue1) {
2aa14b1ab2c41a Nick Terrell 2022-10-17  472      U32 i;
2aa14b1ab2c41a Nick Terrell 2022-10-17  473      for (i = 1; i < maxSymbolValue1; ++i) {
2aa14b1ab2c41a Nick Terrell 2022-10-17  474          if (huffNode[i].count > huffNode[i-1].count) {
2aa14b1ab2c41a Nick Terrell 2022-10-17  475              return 0;
2aa14b1ab2c41a Nick Terrell 2022-10-17  476          }
2aa14b1ab2c41a Nick Terrell 2022-10-17  477      }
2aa14b1ab2c41a Nick Terrell 2022-10-17  478      return 1;
2aa14b1ab2c41a Nick Terrell 2022-10-17  479  }
2aa14b1ab2c41a Nick Terrell 2022-10-17  480  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
