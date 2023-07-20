Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A369519BAC
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Jul 2023 17:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689875783; x=1721411783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l0UmZ5VfCvJVNU4aqKaUoo2HUUHEAVj1QydZDpgg4TM=;
  b=ay0xPfWueMCjnXqS4APy+7Zt17hj5SAwY/yrprjwTk0nTtvancPhfbon
   h8m9BPKf2TJbq3spxm/l1kTShANaO9tIjwZNRACMR8ncYsOOmXub0zWj7
   MGNk7mN1MjI1JWOXfsseSBOkV7p8cB05QrnFKNXoBLrQ83KcfTZAMOSDL
   LkvKdy327tfHZfiFzfHsD+Dv+KRPabMxlUcqx8dKV590GZB63XXhgz69b
   uCalztqIHpFpqgt4OYyPqsPkNCpCn668fL/470085530C2Lj8AqV2kTb7
   Gtomghi9gnplQPG5u32cSdLjJ9Z8rq2kxJOOxLQfiDR7A0w6Ot7TVQlfH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="397704101"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="397704101"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 10:56:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="867930213"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 20 Jul 2023 10:56:22 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMXsd-0006LP-1s;
	Thu, 20 Jul 2023 17:56:03 +0000
Date: Fri, 21 Jul 2023 01:55:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/210-gpu 71/110] rust/helpers.c:395:9: error: call
 to undeclared function 'of_node_is_root'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202307210134.cWu7L0iN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Asahi Lina <lina@asahilina.net>
CC: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/210-gpu
head:   2f66e5641dd5c0f4d76f07ffcc110cdcd6e0690c
commit: 054d4f1f3a2f01ebddcde8c9089c7b737731dcb3 [71/110] rust: kernel: platform: Add Device.set_dma_masks()
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230721/202307210134.cWu7L0iN-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210134.cWu7L0iN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307210134.cWu7L0iN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> rust/helpers.c:395:9: error: call to undeclared function 'of_node_is_root'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> rust/helpers.c:395:9: error: call to undeclared function 'of_node_is_root'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   thread 'main' panicked at 'Unable to generate bindings: ()', /opt/cross/rustc-1.68.2-bindgen-0.56.0/cargo/registry/src/github.com-1ecc6299db9ec823/bindgen-0.56.0/src/main.rs:54:36
   stack backtrace:
      0: rust_begin_unwind
                at /rustc/9eb3afe9ebe9c7d2b84b71002d44f4a0edac95e0/library/std/src/panicking.rs:575:5
      1: core::panicking::panic_fmt
                at /rustc/9eb3afe9ebe9c7d2b84b71002d44f4a0edac95e0/library/core/src/panicking.rs:64:14
      2: core::result::unwrap_failed
                at /rustc/9eb3afe9ebe9c7d2b84b71002d44f4a0edac95e0/library/core/src/result.rs:1790:5
      3: bindgen::main
   note: Some details are omitted, run with `RUST_BACKTRACE=full` for a verbose backtrace.


vim +/of_node_is_root +395 rust/helpers.c

6841a777e17b78 Asahi Lina 2023-02-16  392  
bea4fbe5f4f74d Asahi Lina 2022-10-22  393  bool rust_helper_of_node_is_root(const struct device_node *np)
bea4fbe5f4f74d Asahi Lina 2022-10-22  394  {
bea4fbe5f4f74d Asahi Lina 2022-10-22 @395  	return of_node_is_root(np);
bea4fbe5f4f74d Asahi Lina 2022-10-22  396  }
bea4fbe5f4f74d Asahi Lina 2022-10-22  397  EXPORT_SYMBOL_GPL(rust_helper_of_node_is_root);
bea4fbe5f4f74d Asahi Lina 2022-10-22  398  

:::::: The code at line 395 was first introduced by commit
:::::: bea4fbe5f4f74dcc46a7620002900229a34fad4d rust: of: Add OF node abstraction

:::::: TO: Asahi Lina <lina@asahilina.net>
:::::: CC: Hector Martin <marcan@marcan.st>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
