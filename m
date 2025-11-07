Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2C333290D
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Nov 2025 16:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762534621; cv=none; b=DEjaSGjIHCSlT2zW1bqeV537j6e1w3HdTWs908dE95AZ/kFGNCT+EA0ocaBIDF0YMBs3C9uCS0LDBbkbrVUIofjxll+pbyE1impyva/r5bKQ6pMHxz/YcH1M6me0P30bjBW1pED4R+iQDGFI58pGa0EM5WC5e/drHq12rnf5Hbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762534621; c=relaxed/simple;
	bh=8H4HA9VRY749sy6ArWadMdnsISUQRR2A3U6DlykR1XQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TBxeXOK3qnTXav+PHv29bJlCF8UOqCOZzvORiAT9mjDx7huWkYZfqlceJrIwn2QSWCzudRRsmX9MAfIqa1erKigv8x6Wi/P3RDyHZsOJ9opH9MOoD94Bs9YFei1QFdaHaxCGbpIKzN4egDTkCc1VH8YgB7+XtKGL9pPcyABDpxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U909Xfvh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U909Xfvh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762534619; x=1794070619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8H4HA9VRY749sy6ArWadMdnsISUQRR2A3U6DlykR1XQ=;
  b=U909XfvhCX5eTv8uzMxqYLFlYYvOI/dtfNvfty5IcBCUWcMF7w7rx/Ya
   rssC6qlmF5QUGZFi/mrVY2gyxx9zOPbmWMCXRmkjzSKlOawoxQTBa9Nl6
   oMWJPfdAZF+mOiFLnEEHps52ac+ZEks2J/ovtg+WrYThu1U/bgpCYADzI
   jDAWdLA40Pr8fWmwcp7W/Ob4YCr5nrbdq6SdmxWshV/4QgCNizPiheCWl
   nn91fUVxTUmjuPV4Wz93S5XSiJWJRhLEUeCpOiIRI2b/0j9KUdCsHdY9a
   ZTwnewdDs4brX8R8aFSRaUKYgkMuXGozEHvUz/kQCi6ke90PRkYJ8Amzl
   w==;
X-CSE-ConnectionGUID: fDQdYDTaQ1ifMoBfEPJFVw==
X-CSE-MsgGUID: 0eMobydVSs6DNfulb1i2Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="76136007"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="76136007"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 08:56:58 -0800
X-CSE-ConnectionGUID: Yre6LrV2Sh2fPJbSRRc6yw==
X-CSE-MsgGUID: W0gKhrR4QdWXb9Qs6g6XOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; 
   d="scan'208";a="187334726"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Nov 2025 08:56:58 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHPle-000091-2t;
	Fri, 07 Nov 2025 16:56:54 +0000
Date: Sat, 8 Nov 2025 00:56:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/5] io_uring: bpf: extend io_uring with bpf struct_ops
Message-ID: <202511080004.DkwIEtwd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "__compiletime_assert_NNN"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251104162123.1086035-4-ming.lei@redhat.com>
References: <20251104162123.1086035-4-ming.lei@redhat.com>
TO: Ming Lei <ming.lei@redhat.com>
TO: Jens Axboe <axboe@kernel.dk>
TO: io-uring@vger.kernel.org
CC: Caleb Sander Mateos <csander@purestorage.com>
CC: Akilesh Kailash <akailash@google.com>
CC: bpf@vger.kernel.org
CC: Alexei Starovoitov <ast@kernel.org>
CC: Ming Lei <ming.lei@redhat.com>

Hi Ming,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251104]
[cannot apply to bpf-next/net bpf-next/master bpf/master linus/master v6.18-rc4 v6.18-rc3 v6.18-rc2 v6.18-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ming-Lei/io_uring-prepare-for-extending-io_uring-with-bpf/20251105-002757
base:   next-20251104
patch link:    https://lore.kernel.org/r/20251104162123.1086035-4-ming.lei%40redhat.com
patch subject: [PATCH 3/5] io_uring: bpf: extend io_uring with bpf struct_ops
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251108/202511080004.DkwIEtwd-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511080004.DkwIEtwd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511080004.DkwIEtwd-lkp@intel.com/

All errors (new ones prefixed by >>):

   io_uring/bpf.c:29:28: warning: unused function 'uring_bpf_get_flags' [-Wunused-function]
      29 | static inline unsigned int uring_bpf_get_flags(unsigned int op_flags)
         |                            ^~~~~~~~~~~~~~~~~~~
   In file included from io_uring/bpf.c:14:
   In file included from io_uring/io_uring.h:9:
>> include/linux/io_uring_types.h:655:2: error: call to '__compiletime_assert_586' declared with 'error' attribute: BUILD_BUG_ON failed: cmd_sz > sizeof(struct io_cmd_data)
     655 |         BUILD_BUG_ON(cmd_sz > sizeof(struct io_cmd_data));
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:603:2: note: expanded from macro 'compiletime_assert'
     603 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:591:2: note: expanded from macro '_compiletime_assert'
     591 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:584:4: note: expanded from macro '__compiletime_assert'
     584 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:174:1: note: expanded from here
     174 | __compiletime_assert_586
         | ^
   In file included from io_uring/bpf.c:14:
   In file included from io_uring/io_uring.h:9:
>> include/linux/io_uring_types.h:655:2: error: call to '__compiletime_assert_586' declared with 'error' attribute: BUILD_BUG_ON failed: cmd_sz > sizeof(struct io_cmd_data)
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:603:2: note: expanded from macro 'compiletime_assert'
     603 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:591:2: note: expanded from macro '_compiletime_assert'
     591 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:584:4: note: expanded from macro '__compiletime_assert'
     584 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:174:1: note: expanded from here
     174 | __compiletime_assert_586
         | ^
   In file included from io_uring/bpf.c:14:
   In file included from io_uring/io_uring.h:9:
>> include/linux/io_uring_types.h:655:2: error: call to '__compiletime_assert_586' declared with 'error' attribute: BUILD_BUG_ON failed: cmd_sz > sizeof(struct io_cmd_data)
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:603:2: note: expanded from macro 'compiletime_assert'
     603 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:591:2: note: expanded from macro '_compiletime_assert'
     591 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:584:4: note: expanded from macro '__compiletime_assert'
     584 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:174:1: note: expanded from here
     174 | __compiletime_assert_586
         | ^
   In file included from io_uring/bpf.c:14:
   In file included from io_uring/io_uring.h:9:
>> include/linux/io_uring_types.h:655:2: error: call to '__compiletime_assert_586' declared with 'error' attribute: BUILD_BUG_ON failed: cmd_sz > sizeof(struct io_cmd_data)
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:603:2: note: expanded from macro 'compiletime_assert'
     603 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:591:2: note: expanded from macro '_compiletime_assert'
     591 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:584:4: note: expanded from macro '__compiletime_assert'
     584 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:174:1: note: expanded from here
     174 | __compiletime_assert_586
         | ^
   In file included from io_uring/bpf.c:14:
   In file included from io_uring/io_uring.h:9:
>> include/linux/io_uring_types.h:655:2: error: call to '__compiletime_assert_586' declared with 'error' attribute: BUILD_BUG_ON failed: cmd_sz > sizeof(struct io_cmd_data)
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:603:2: note: expanded from macro 'compiletime_assert'
     603 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:591:2: note: expanded from macro '_compiletime_assert'
     591 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:584:4: note: expanded from macro '__compiletime_assert'
     584 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:174:1: note: expanded from here
     174 | __compiletime_assert_586
         | ^
   1 warning and 5 errors generated.


vim +655 include/linux/io_uring_types.h

e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe          2022-05-24  652  
f2ccb5aed7bce1 include/linux/io_uring_types.h Stefan Metzmacher   2022-08-11  653  static inline void io_kiocb_cmd_sz_check(size_t cmd_sz)
f2ccb5aed7bce1 include/linux/io_uring_types.h Stefan Metzmacher   2022-08-11  654  {
f2ccb5aed7bce1 include/linux/io_uring_types.h Stefan Metzmacher   2022-08-11 @655  	BUILD_BUG_ON(cmd_sz > sizeof(struct io_cmd_data));
f2ccb5aed7bce1 include/linux/io_uring_types.h Stefan Metzmacher   2022-08-11  656  }
f2ccb5aed7bce1 include/linux/io_uring_types.h Stefan Metzmacher   2022-08-11  657  #define io_kiocb_to_cmd(req, cmd_type) ( \
f2ccb5aed7bce1 include/linux/io_uring_types.h Stefan Metzmacher   2022-08-11  658  	io_kiocb_cmd_sz_check(sizeof(cmd_type)) , \
f2ccb5aed7bce1 include/linux/io_uring_types.h Stefan Metzmacher   2022-08-11  659  	((cmd_type *)&(req)->cmd) \
f2ccb5aed7bce1 include/linux/io_uring_types.h Stefan Metzmacher   2022-08-11  660  )
09fdd35162c289 include/linux/io_uring_types.h Caleb Sander Mateos 2025-02-28  661  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
