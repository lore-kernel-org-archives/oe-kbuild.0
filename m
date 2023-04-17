Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD7715A0
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Apr 2023 03:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681702895; x=1713238895;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v61KNXDX09L+oTkdOli6VI7ypQ3henWLseH03P2wzw4=;
  b=LAXKuUQ1QWtJ2AGQltf7k+AdKZikGUMo2v6dc6Xm2Sx479W7BbV3y+aZ
   kEKvcoLXZFIh2wucU3jR99W8gkxAuu8b4V8CoLTEfnSIZ4uFOJxI3zgPt
   PAKS5gCJkhSJibYqJGFs79zItVT9Lzb9x4sO/XfeMYpoLjHOys2Q1JnLr
   0zXNK/o/2W29sBye/haSgi5vJwGhK/7eymN363Ox1L/P3+NeKyz46cdFP
   MQKFngjqfn0X2BVz96lyqgfRfGLkQLz3+pBndC9f2NYslAi7rHFWz90WW
   tkFWFTTwuTFQI4Ea81HnLVZ3e8yr4Krros5NuuSysnfafsZzzi72NhnDE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="342287383"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="342287383"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2023 20:41:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10682"; a="720977289"
X-IronPort-AV: E=Sophos;i="5.99,203,1677571200"; 
   d="scan'208";a="720977289"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 16 Apr 2023 20:41:33 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poFkC-000c6N-16;
	Mon, 17 Apr 2023 03:41:32 +0000
Date: Mon, 17 Apr 2023 11:41:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] Subject: drivers:i2c:busses:i2c-qup.c: Add missing
 unwind goto in qup_i2c_probe()
Message-ID: <202304171152.54Jff15q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/compiler.h:56:23: warning: this 'if' clause does not guard... [-Wmisleading-indentation]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230416164146.7750-1-d202180596@hust.edu.cn>
References: <20230416164146.7750-1-d202180596@hust.edu.cn>
TO: Shuai Jiang <d202180596@hust.edu.cn>
TO: Andy Gross <agross@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konrad.dybcio@linaro.org>
CC: linux-arm-msm@vger.kernel.org
CC: linux-i2c@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: hust-os-kernel-patches@googlegroups.com
CC: Shuai Jiang <d202180596@hust.edu.cn>

Hi Shuai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on linus/master v6.3-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shuai-Jiang/Subject-drivers-i2c-busses-i2c-qup-c-Add-missing-unwind-goto-in-qup_i2c_probe/20230417-004243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/20230416164146.7750-1-d202180596%40hust.edu.cn
patch subject: [PATCH] Subject: drivers:i2c:busses:i2c-qup.c: Add missing unwind goto in qup_i2c_probe()
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: csky-randconfig-s042-20230417 (https://download.01.org/0day-ci/archive/20230417/202304171152.54Jff15q-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/2f61e419c04ee41517d9543a5c6a97e3e392cd5e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shuai-Jiang/Subject-drivers-i2c-busses-i2c-qup-c-Add-missing-unwind-goto-in-qup_i2c_probe/20230417-004243
        git checkout 2f61e419c04ee41517d9543a5c6a97e3e392cd5e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=csky SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304171152.54Jff15q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/bits.h:21,
                    from include/linux/ioport.h:13,
                    from include/linux/acpi.h:12,
                    from drivers/i2c/busses/i2c-qup.c:8:
   drivers/i2c/busses/i2c-qup.c: In function 'qup_i2c_probe':
>> include/linux/compiler.h:56:23: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                       ^~
   drivers/i2c/busses/i2c-qup.c:1760:9: note: in expansion of macro 'if'
    1760 |         if (IS_ERR(qup->base))
         |         ^~
   drivers/i2c/busses/i2c-qup.c:1762:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
    1762 |                 ret = PTR_ERR(qup->base);
         |                 ^~~
>> include/linux/compiler.h:56:23: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
      56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                       ^~
   drivers/i2c/busses/i2c-qup.c:1766:9: note: in expansion of macro 'if'
    1766 |         if (qup->irq < 0)
         |         ^~
   drivers/i2c/busses/i2c-qup.c:1768:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
    1768 |                 ret = PTR_ERR(qup->irq);
         |                 ^~~
   drivers/i2c/busses/i2c-qup.c:1768:34: warning: passing argument 1 of 'PTR_ERR' makes pointer from integer without a cast [-Wint-conversion]
    1768 |                 ret = PTR_ERR(qup->irq);
         |                               ~~~^~~~~
         |                                  |
         |                                  int
   In file included from include/linux/kernfs.h:9,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:17,
                    from include/linux/irqdomain.h:36,
                    from include/linux/acpi.h:13:
   include/linux/err.h:29:61: note: expected 'const void *' but argument is of type 'int'
      29 | static inline long __must_check PTR_ERR(__force const void *ptr)
         |                                                 ~~~~~~~~~~~~^~~


vim +/if +56 include/linux/compiler.h

2bcd521a684cc9 Steven Rostedt 2008-11-21  50  
2bcd521a684cc9 Steven Rostedt 2008-11-21  51  #ifdef CONFIG_PROFILE_ALL_BRANCHES
2bcd521a684cc9 Steven Rostedt 2008-11-21  52  /*
2bcd521a684cc9 Steven Rostedt 2008-11-21  53   * "Define 'is'", Bill Clinton
2bcd521a684cc9 Steven Rostedt 2008-11-21  54   * "Define 'if'", Steven Rostedt
2bcd521a684cc9 Steven Rostedt 2008-11-21  55   */
a15fd609ad53a6 Linus Torvalds 2019-03-20 @56  #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
a15fd609ad53a6 Linus Torvalds 2019-03-20  57  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
