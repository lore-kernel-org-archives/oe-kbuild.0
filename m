Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581DF13712
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Jul 2023 14:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689345404; x=1720881404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CkmaTeVvxqUJxVG8IQQyP4UsMixGKHKPT4MeBX1QJto=;
  b=Q/DD6cgILxkNa18UUAO2JwjbCAcq8pScD/H2tc6OOxC1z+EbdUUp0n8d
   WiP2heaBlM4GndNmNVTQAgXAcJ4u2vOcygYl8Kj0PgH8vKV+d+X5xod8B
   iIp6Uojf/NuIimeL3s3k8LYO0ARxN1sY/7Z3i7dIsf8n0AR5iGrmk7D5k
   9kMlAiD3qt92xHdT5XV+augZlOG0KMmH+koj6Kt9sX8xOxNTmPgJMEXbq
   qEsTYYd49ykQni4Z8XMU8Pxv89ygXBtNwliwEVB9nzJwtS/su1EgA3TaE
   7nl2Npbfc2kqAgmVn1wVIpAqKkDjdTePVf1LOio7P2fXRNurIYruaE8gy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="429250569"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="429250569"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 07:36:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="812457246"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200"; 
   d="scan'208";a="812457246"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Jul 2023 07:36:37 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKJuO-0007VZ-35;
	Fri, 14 Jul 2023 14:36:36 +0000
Date: Fri, 14 Jul 2023 22:36:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/210-gpu 21/198] thread 'main' panicked at 'Unable
 to generate bindings: ()',
 /opt/cross/rustc-1.66.0-bindgen-0.56.0/cargo/registry/src/github.com-1ecc6299db9ec823/bindgen-0.56.0/src/main.rs:54:36
Message-ID: <202307142240.oeFRWvfL-lkp@intel.com>
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

Hi Asahi,

First bad commit (maybe != root cause):

tree:   https://github.com/AsahiLinux/linux bits/210-gpu
head:   c2bbe7fe79da5dff6da45eb1d4a5a582db740429
commit: fda5d18130b184e32296a04faacd3c231dc9ba93 [21/198] *RFL import: kernel::io_mem
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230714/202307142240.oeFRWvfL-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307142240.oeFRWvfL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307142240.oeFRWvfL-lkp@intel.com/

All errors (new ones prefixed by >>):

   rust/helpers.c:201:9: error: call to undeclared function 'ioremap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:201:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
   rust/helpers.c:207:9: error: call to undeclared function 'readb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:213:9: error: call to undeclared function 'readw'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:219:9: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:226:9: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:233:2: error: call to undeclared function 'writeb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:239:2: error: call to undeclared function 'writew'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:245:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:252:2: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:259:9: error: call to undeclared function 'readb_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:265:9: error: call to undeclared function 'readw_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:271:9: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:278:9: error: call to undeclared function 'readq_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:285:2: error: call to undeclared function 'writeb_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:291:2: error: call to undeclared function 'writew_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:297:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:304:2: error: call to undeclared function 'writeq_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:311:2: error: call to undeclared function 'memcpy_fromio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:201:9: error: call to undeclared function 'ioremap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:201:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion], err: true
   rust/helpers.c:207:9: error: call to undeclared function 'readb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:213:9: error: call to undeclared function 'readw'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:219:9: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:226:9: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:233:2: error: call to undeclared function 'writeb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:239:2: error: call to undeclared function 'writew'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:245:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:252:2: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:259:9: error: call to undeclared function 'readb_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:265:9: error: call to undeclared function 'readw_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:271:9: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:278:9: error: call to undeclared function 'readq_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:285:2: error: call to undeclared function 'writeb_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:291:2: error: call to undeclared function 'writew_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:297:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:304:2: error: call to undeclared function 'writeq_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:311:2: error: call to undeclared function 'memcpy_fromio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
>> thread 'main' panicked at 'Unable to generate bindings: ()', /opt/cross/rustc-1.66.0-bindgen-0.56.0/cargo/registry/src/github.com-1ecc6299db9ec823/bindgen-0.56.0/src/main.rs:54:36
   stack backtrace:
      0: rust_begin_unwind
                at /rustc/69f9c33d71c871fc16ac445211281c6e7a340943/library/std/src/panicking.rs:575:5
      1: core::panicking::panic_fmt
                at /rustc/69f9c33d71c871fc16ac445211281c6e7a340943/library/core/src/panicking.rs:65:14
      2: core::result::unwrap_failed
                at /rustc/69f9c33d71c871fc16ac445211281c6e7a340943/library/core/src/result.rs:1791:5
      3: bindgen::main
   note: Some details are omitted, run with `RUST_BACKTRACE=full` for a verbose backtrace.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
