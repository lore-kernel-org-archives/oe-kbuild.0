Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0DFEEA8
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Jul 2023 15:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689347320; x=1720883320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ajs+b9xx7o+XXpU+S87+CdLEf+k1fj2FgX6V7TjWlW0=;
  b=PJyQxYXaMEHxwp2SIYChoCyMIqj2priD1CNdYonZcFSmZE++wBZBzBtN
   x2t64AjITr7V1pwlWMS8kgClKtPglMI6yW84NJujzwxW+PtFa1mGQXSbg
   y8yLTk5V5haDpCyFr1aVBw+qgDXKCzly3VCJ/iEqAH9LN1HMdXNWwyez9
   GnsEDMZPSMswlhXtuR9XnipWL2QZttmR9DzvQRJzB7khHXV4NNNw5Gf/1
   Xise5HEsdU6SyE+0Oo1xUg5nr9sOT/fa0nZ7yOu2pI9jLHRp0MTUZMBlr
   z+SNQCwkSqvJSRHLsAvlMR2T3kRlu8r2heGL/T8cnGXwipV59FnR/FT8X
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="451860355"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="451860355"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 08:08:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="792465456"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="792465456"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 14 Jul 2023 08:08:38 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKKPN-0007WX-1R;
	Fri, 14 Jul 2023 15:08:37 +0000
Date: Fri, 14 Jul 2023 23:08:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/210-gpu 28/198] rust/helpers.c:343:9: error: call
 to undeclared function 'of_node_is_root'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202307142200.fxtX1LTA-lkp@intel.com>
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
head:   c2bbe7fe79da5dff6da45eb1d4a5a582db740429
commit: 953ef7143b90440101a3facd5767e500af4b878e [28/198] rust: kernel: platform: Add Device.set_dma_masks()
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230714/202307142200.fxtX1LTA-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307142200.fxtX1LTA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307142200.fxtX1LTA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> rust/helpers.c:343:9: error: call to undeclared function 'of_node_is_root'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>> rust/helpers.c:343:9: error: call to undeclared function 'of_node_is_root'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   thread 'main' panicked at 'Unable to generate bindings: ()', /opt/cross/rustc-1.66.0-bindgen-0.56.0/cargo/registry/src/github.com-1ecc6299db9ec823/bindgen-0.56.0/src/main.rs:54:36
   stack backtrace:
      0: rust_begin_unwind
                at /rustc/69f9c33d71c871fc16ac445211281c6e7a340943/library/std/src/panicking.rs:575:5
      1: core::panicking::panic_fmt
                at /rustc/69f9c33d71c871fc16ac445211281c6e7a340943/library/core/src/panicking.rs:65:14
      2: core::result::unwrap_failed
                at /rustc/69f9c33d71c871fc16ac445211281c6e7a340943/library/core/src/result.rs:1791:5
      3: bindgen::main
   note: Some details are omitted, run with `RUST_BACKTRACE=full` for a verbose backtrace.


vim +/of_node_is_root +343 rust/helpers.c

6560e14efd9648 Asahi Lina 2023-02-16  340  
cfdf514776556c Asahi Lina 2022-10-22  341  bool rust_helper_of_node_is_root(const struct device_node *np)
cfdf514776556c Asahi Lina 2022-10-22  342  {
cfdf514776556c Asahi Lina 2022-10-22 @343  	return of_node_is_root(np);
cfdf514776556c Asahi Lina 2022-10-22  344  }
cfdf514776556c Asahi Lina 2022-10-22  345  EXPORT_SYMBOL_GPL(rust_helper_of_node_is_root);
cfdf514776556c Asahi Lina 2022-10-22  346  

:::::: The code at line 343 was first introduced by commit
:::::: cfdf514776556c3c85668decf0b602a7d5b3fc14 rust: of: Add OF node abstraction

:::::: TO: Asahi Lina <lina@asahilina.net>
:::::: CC: Hector Martin <marcan@marcan.st>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
