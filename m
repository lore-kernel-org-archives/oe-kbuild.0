Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFCA1FDD
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Jun 2023 08:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687251008; x=1718787008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jRwqL44gGt1CO7EyMLKv902qHsHZYSwobuqBM+0uN5Q=;
  b=hN43XxSqzCbGe+Y1rgfcdMGRoW80MtNWo97iu7KmIqed42cFaqYu72pe
   4c36RKKsLqodfVYbgtrsU1QUheQp2xcQYlFLgECfxo1k8kijYqLhf1Qgo
   eGRwM4VQ3URnq1e/ajLBGxRL2W9WDP35kQv9iLKEwOgcyDNvvfdNHZEpq
   8XoNcVA+SyNRRjFOGMcEDhOVirpSYZiRy5JI1blUVOKlhVrCrZ9nt2+33
   2f2Fa0LMv4b6nlbGRm2/rxPSxQwOo1MbmU9K1t3oQdzA/fU4+KC2uvKBX
   ph6G1uaxqWNZnWc7wU3wpeLbmcYaNGLf68gD0YBCsvlhVFJSZbT7m55G2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="362346632"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="362346632"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 01:50:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10746"; a="803869457"
X-IronPort-AV: E=Sophos;i="6.00,256,1681196400"; 
   d="scan'208";a="803869457"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Jun 2023 01:50:06 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBX3t-0005jE-25;
	Tue, 20 Jun 2023 08:50:05 +0000
Date: Tue, 20 Jun 2023 16:49:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: thread 'main' panicked at
 '"ftrace_branch_data_union_(anonymous_at_include/linux/compiler_types_h_146_2)"
 is not a valid Ident',
 /opt/cross/rustc-1.62.0-bindgen-0.56.0/cargo/registry/src/github.com-1ecc6299db9ec823/proc-macro2-1.0.24/src/fallback.rs:693:9
Message-ID: <202306201634.92fJxZZb-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Miguel Ojeda <ojeda@kernel.org>

Hi Masahiro,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   692b7dc87ca6d55ab254f8259e6f970171dc9d01
commit: 95207db8166ab95c42a03fdc5e3abd212c9987dc Remove Intel compiler support
date:   4 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230620/202306201634.92fJxZZb-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306201634.92fJxZZb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306201634.92fJxZZb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> thread 'main' panicked at '"ftrace_branch_data_union_(anonymous_at_include/linux/compiler_types_h_146_2)" is not a valid Ident', /opt/cross/rustc-1.62.0-bindgen-0.56.0/cargo/registry/src/github.com-1ecc6299db9ec823/proc-macro2-1.0.24/src/fallback.rs:693:9
   stack backtrace:
      0: rust_begin_unwind
                at /rustc/a8314ef7d0ec7b75c336af2c9857bfaf43002bfc/library/std/src/panicking.rs:584:5
      1: core::panicking::panic_fmt
                at /rustc/a8314ef7d0ec7b75c336af2c9857bfaf43002bfc/library/core/src/panicking.rs:142:14
      2: proc_macro2::fallback::Ident::_new
      3: proc_macro2::Ident::new
      4: bindgen::ir::context::BindgenContext::rust_ident
      5: <bindgen::ir::comp::CompInfo as bindgen::codegen::CodeGenerator>::codegen
      6: <bindgen::ir::ty::Type as bindgen::codegen::CodeGenerator>::codegen
      7: <bindgen::ir::item::Item as bindgen::codegen::CodeGenerator>::codegen
      8: <bindgen::ir::comp::CompInfo as bindgen::codegen::CodeGenerator>::codegen
      9: <bindgen::ir::ty::Type as bindgen::codegen::CodeGenerator>::codegen
     10: <bindgen::ir::item::Item as bindgen::codegen::CodeGenerator>::codegen
     11: <bindgen::ir::module::Module as bindgen::codegen::CodeGenerator>::codegen
     12: <bindgen::ir::item::Item as bindgen::codegen::CodeGenerator>::codegen
     13: bindgen::ir::context::BindgenContext::gen
     14: bindgen::Builder::generate
     15: std::panicking::try
     16: bindgen::main
   note: Some details are omitted, run with `RUST_BACKTRACE=full` for a verbose backtrace.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
