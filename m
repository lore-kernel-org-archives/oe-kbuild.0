Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43C62FA43
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Jul 2023 17:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689873343; x=1721409343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xnVrBrHbssJ6vmaGziFNX50Ink+tNTNNO/6M+dcVs5Q=;
  b=iOylfCw9fnYo9kNyVCpP+j4oKu0iByZvzxBo+VJB0OgEp1ehVLY+qK5E
   QtRgt5/Kfm409RSoI+eaLP/4zn6wFss7ZPge/skEpMvhKKP3KLAOVoP19
   EuuaaDFyYlyeMnlNG9VO4Bz4x5uVP3Nr6k0vmCo1DTNzD6OqC/+S2miSK
   DMZSqQ8sCip7awA29mVourrUIVBpkUkJfUD86Sl8EfrlS2ug9NcTSqIWD
   kmFp3fapy9EGIz8FKVcOuYeZlg60WtAQZJ2rK1c7fkmBG2Vcyxiz7AgmW
   oKCvXb2+AJPTyhtVEtqw0VLfSqpSDkEZc5fSkhz+vuYCiajli/fRJyJSw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="346401666"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="346401666"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 10:15:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="727776437"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="727776437"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jul 2023 10:15:42 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMXFR-0006JT-0l;
	Thu, 20 Jul 2023 17:15:33 +0000
Date: Fri, 21 Jul 2023 01:14:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/210-gpu 64/110] thread 'main' panicked at 'Unable
 to generate bindings: ()',
 /opt/cross/rustc-1.68.2-bindgen-0.56.0/cargo/registry/src/github.com-1ecc6299db9ec823/bindgen-0.56.0/src/main.rs:54:36
Message-ID: <202307210142.qCzFtM4v-lkp@intel.com>
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
commit: 5dd7d8c2e4c48086c8815137f8ecd3371a8fb934 [64/110] *RFL import: kernel::io_mem
:::::: branch date: 14 hours ago
:::::: commit date: 15 hours ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230721/202307210142.qCzFtM4v-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210142.qCzFtM4v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307210142.qCzFtM4v-lkp@intel.com/

All errors (new ones prefixed by >>):

   rust/helpers.c:253:9: error: call to undeclared function 'ioremap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:253:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion]
   rust/helpers.c:259:9: error: call to undeclared function 'readb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:265:9: error: call to undeclared function 'readw'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:271:9: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:278:9: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:285:2: error: call to undeclared function 'writeb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:291:2: error: call to undeclared function 'writew'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:297:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:304:2: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:311:9: error: call to undeclared function 'readb_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:317:9: error: call to undeclared function 'readw_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:323:9: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:330:9: error: call to undeclared function 'readq_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:337:2: error: call to undeclared function 'writeb_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:343:2: error: call to undeclared function 'writew_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:349:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:356:2: error: call to undeclared function 'writeq_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:363:2: error: call to undeclared function 'memcpy_fromio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   rust/helpers.c:253:9: error: call to undeclared function 'ioremap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:253:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'void *' [-Wint-conversion], err: true
   rust/helpers.c:259:9: error: call to undeclared function 'readb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:265:9: error: call to undeclared function 'readw'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:271:9: error: call to undeclared function 'readl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:278:9: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:285:2: error: call to undeclared function 'writeb'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:291:2: error: call to undeclared function 'writew'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:297:2: error: call to undeclared function 'writel'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:304:2: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:311:9: error: call to undeclared function 'readb_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:317:9: error: call to undeclared function 'readw_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:323:9: error: call to undeclared function 'readl_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:330:9: error: call to undeclared function 'readq_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:337:2: error: call to undeclared function 'writeb_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:343:2: error: call to undeclared function 'writew_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:349:2: error: call to undeclared function 'writel_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:356:2: error: call to undeclared function 'writeq_relaxed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
   rust/helpers.c:363:2: error: call to undeclared function 'memcpy_fromio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration], err: true
>> thread 'main' panicked at 'Unable to generate bindings: ()', /opt/cross/rustc-1.68.2-bindgen-0.56.0/cargo/registry/src/github.com-1ecc6299db9ec823/bindgen-0.56.0/src/main.rs:54:36
   stack backtrace:
      0: rust_begin_unwind
                at /rustc/9eb3afe9ebe9c7d2b84b71002d44f4a0edac95e0/library/std/src/panicking.rs:575:5
      1: core::panicking::panic_fmt
                at /rustc/9eb3afe9ebe9c7d2b84b71002d44f4a0edac95e0/library/core/src/panicking.rs:64:14
      2: core::result::unwrap_failed
                at /rustc/9eb3afe9ebe9c7d2b84b71002d44f4a0edac95e0/library/core/src/result.rs:1790:5
      3: bindgen::main
   note: Some details are omitted, run with `RUST_BACKTRACE=full` for a verbose backtrace.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
