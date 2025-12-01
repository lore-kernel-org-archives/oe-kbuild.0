Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4696B23B61B
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Dec 2025 23:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764631474; cv=none; b=nXfwQL3XXPBMu6HrFng4bpxJeNaBVvu+4XqWmSDIww1Wg3aQe4seBQRlvpto+j3ueDfhotwUTfzWfJuLe7FrfoUwMdYt+OrJT8/dDZ+ny5agAFqNLjNkKolzwAuRYeQTwit+I3wd/bWanxL3RLjzyg/cULcaq2jXLDt7jv3IsLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764631474; c=relaxed/simple;
	bh=/hDUPDgeQg/v++CYe3ps+lXo/KPXjcZk5guoeWPwbhw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lFHwU5o9kEXaKmdigr+fr/L5h7eQsns0luLg7nbKqfx/yPMf7j+9BPUmmGze61dxPZLUANsWZ2R5ogeFEfEHzIlXyX7CRAoNJ5p3vOQ1pAE0dxGpww+1zufoRMYT9mVmU080k/ahG0VHzDcodzRz18vDrjbLk4k6zkW063gcpfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mw0p3xRb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mw0p3xRb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764631471; x=1796167471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/hDUPDgeQg/v++CYe3ps+lXo/KPXjcZk5guoeWPwbhw=;
  b=Mw0p3xRbmLvX1HZdZ2gUip8qeRMXlWPrfMqIhAJ5OWS4nurr7Pb5RldG
   od2Q2DCgiFLWxeTOqoTtGMgYt+euuiGB2d9pWNTTXYV/S/BjOlXHgI7XQ
   xusmFJK8DQ1TieD4bT3knQxV4mIvMe2W9Xc0AEH+62I+lgkaU4vsKn09W
   fnJgyfzbpa/COHul7KnSSMW7WN7tPSAKiarEyT2q2cmFQw8nXDRvejRM3
   ZGqRy++StoZeA+MusDVZcp/HRNqgxqIu0NQ72OKEC4dNw7pGEAtwLGkSA
   xrCI0tYPZQBz3hdkZhBUk6w8C9vb/7Ozb77HhQyGsJHGQJLIf5v+aRl5O
   g==;
X-CSE-ConnectionGUID: herV27Z1Q0aI0nVlfNTolA==
X-CSE-MsgGUID: 34JwzjioQd+S9cv9oKNriQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="92062849"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="92062849"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 15:24:30 -0800
X-CSE-ConnectionGUID: 9ZH6UZDGRL6mTM+papjfrQ==
X-CSE-MsgGUID: Sns6dfM2QWOnGWlQfIcnhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="195001628"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 01 Dec 2025 15:24:29 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQDFr-000000002lt-2c11;
	Mon, 01 Dec 2025 23:24:27 +0000
Date: Tue, 2 Dec 2025 00:23:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 12706/13171]
 tools/testing/selftests/vfio/lib/iova_allocator.c:31:2: warning: format
 specifies type 'unsigned long' but the argument has type 'u64' (aka
 'unsigned long long')
Message-ID: <202512020059.wo9Sr70i-lkp@intel.com>
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
TO: David Matlack <dmatlack@google.com>
CC: Alex Williamson <alex@shazbot.org>
CC: Alex Mastro <amastro@fb.com>
CC: Raghavendra Rao Ananta <rananta@google.com>

Hi David,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
commit: 2607a4361312bf407931597423fe23db406ca8d3 [12706/13171] vfio: selftests: Move IOVA allocator into iova_allocator.c
:::::: branch date: 20 hours ago
:::::: commit date: 3 days ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512020059.wo9Sr70i-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020059.wo9Sr70i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512020059.wo9Sr70i-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:282:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     282 |         VFIO_ASSERT_EQ(__vfio_pci_dma_map(device, region), 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:295:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     295 |         VFIO_ASSERT_EQ(__vfio_pci_dma_unmap(device, region, NULL), 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:295:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     295 |         VFIO_ASSERT_EQ(__vfio_pci_dma_unmap(device, region, NULL), 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:306:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     306 |         VFIO_ASSERT_EQ(__vfio_pci_dma_unmap_all(device, NULL), 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:306:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     306 |         VFIO_ASSERT_EQ(__vfio_pci_dma_unmap_all(device, NULL), 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:341:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     341 |         VFIO_ASSERT_NE(r, -1, "F_GETFL failed for fd %d\n", fd);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:341:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     341 |         VFIO_ASSERT_NE(r, -1, "F_GETFL failed for fd %d\n", fd);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:344:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     344 |         VFIO_ASSERT_NE(r, -1, "F_SETFL O_NONBLOCK failed for fd %d\n", fd);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:344:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     344 |         VFIO_ASSERT_NE(r, -1, "F_SETFL O_NONBLOCK failed for fd %d\n", fd);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
>> tools/testing/selftests/vfio/lib/iova_allocator.c:31:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      31 |         VFIO_ASSERT_NOT_NULL(ranges);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:46:39: note: expanded from macro 'VFIO_ASSERT_NOT_NULL'
      46 | #define VFIO_ASSERT_NOT_NULL(_a, ...) VFIO_ASSERT_NE(NULL, _a, ##__VA_ARGS__)
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
>> tools/testing/selftests/vfio/lib/iova_allocator.c:31:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      31 |         VFIO_ASSERT_NOT_NULL(ranges);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:46:39: note: expanded from macro 'VFIO_ASSERT_NOT_NULL'
      46 | #define VFIO_ASSERT_NOT_NULL(_a, ...) VFIO_ASSERT_NE(NULL, _a, ##__VA_ARGS__)
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iova_allocator.c:34:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      34 |         VFIO_ASSERT_NOT_NULL(allocator);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:46:39: note: expanded from macro 'VFIO_ASSERT_NOT_NULL'
      46 | #define VFIO_ASSERT_NOT_NULL(_a, ...) VFIO_ASSERT_NE(NULL, _a, ##__VA_ARGS__)
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iova_allocator.c:34:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      34 |         VFIO_ASSERT_NOT_NULL(allocator);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:46:39: note: expanded from macro 'VFIO_ASSERT_NOT_NULL'
      46 | #define VFIO_ASSERT_NOT_NULL(_a, ...) VFIO_ASSERT_NE(NULL, _a, ##__VA_ARGS__)
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iova_allocator.c:54:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      54 |         VFIO_ASSERT_GT(size, 0, "Invalid size arg, zero\n");
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:41:37: note: expanded from macro 'VFIO_ASSERT_GT'
      41 | #define VFIO_ASSERT_GT(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, >, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iova_allocator.c:54:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      54 |         VFIO_ASSERT_GT(size, 0, "Invalid size arg, zero\n");
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:41:37: note: expanded from macro 'VFIO_ASSERT_GT'
      41 | #define VFIO_ASSERT_GT(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, >, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iova_allocator.c:55:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      55 |         VFIO_ASSERT_EQ(size & (size - 1), 0, "Invalid size arg, non-power-of-2\n");
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iova_allocator.c:55:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      55 |         VFIO_ASSERT_EQ(size & (size - 1), 0, "Invalid size arg, non-power-of-2\n");
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iova_allocator.c:61:3: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      61 |                 VFIO_ASSERT_LT(allocator->range_idx, allocator->nranges,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      62 |                                "IOVA allocator out of space\n");
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:39:37: note: expanded from macro 'VFIO_ASSERT_LT'
      39 | #define VFIO_ASSERT_LT(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, <, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iova_allocator.c:61:3: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      61 |                 VFIO_ASSERT_LT(allocator->range_idx, allocator->nranges,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      62 |                                "IOVA allocator out of space\n");
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:39:37: note: expanded from macro 'VFIO_ASSERT_LT'
      39 | #define VFIO_ASSERT_LT(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, <, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
>> tools/testing/selftests/vfio/lib/iova_allocator.c:68:7: warning: comparison of distinct pointer types ('typeof (iova) *' (aka 'unsigned long long *') and 'typeof (size - 1) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
      68 |                 if (check_add_overflow(iova, size - 1, &last) ||
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/../../../tools/include/linux/overflow.h:48:15: note: expanded from macro 'check_add_overflow'
      48 |         (void) (&__a == &__b);                  \
         |                 ~~~~ ^  ~~~~
   tools/testing/selftests/vfio/lib/iova_allocator.c:76:7: warning: comparison of distinct pointer types ('typeof (iova) *' (aka 'unsigned long long *') and 'typeof (size - 1) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
      76 |                 if (check_add_overflow(iova, size - 1, &last) ||
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/../../../tools/include/linux/overflow.h:48:15: note: expanded from macro 'check_add_overflow'
      48 |         (void) (&__a == &__b);                  \
         |                 ~~~~ ^  ~~~~
   28 warnings generated.


vim +31 tools/testing/selftests/vfio/lib/iova_allocator.c

2607a4361312bf David Matlack 2025-11-26  23  
2607a4361312bf David Matlack 2025-11-26  24  struct iova_allocator *iova_allocator_init(struct vfio_pci_device *device)
2607a4361312bf David Matlack 2025-11-26  25  {
2607a4361312bf David Matlack 2025-11-26  26  	struct iova_allocator *allocator;
2607a4361312bf David Matlack 2025-11-26  27  	struct iommu_iova_range *ranges;
2607a4361312bf David Matlack 2025-11-26  28  	u32 nranges;
2607a4361312bf David Matlack 2025-11-26  29  
2607a4361312bf David Matlack 2025-11-26  30  	ranges = vfio_pci_iova_ranges(device, &nranges);
2607a4361312bf David Matlack 2025-11-26 @31  	VFIO_ASSERT_NOT_NULL(ranges);
2607a4361312bf David Matlack 2025-11-26  32  
2607a4361312bf David Matlack 2025-11-26  33  	allocator = malloc(sizeof(*allocator));
2607a4361312bf David Matlack 2025-11-26  34  	VFIO_ASSERT_NOT_NULL(allocator);
2607a4361312bf David Matlack 2025-11-26  35  
2607a4361312bf David Matlack 2025-11-26  36  	*allocator = (struct iova_allocator){
2607a4361312bf David Matlack 2025-11-26  37  		.ranges = ranges,
2607a4361312bf David Matlack 2025-11-26  38  		.nranges = nranges,
2607a4361312bf David Matlack 2025-11-26  39  		.range_idx = 0,
2607a4361312bf David Matlack 2025-11-26  40  		.range_offset = 0,
2607a4361312bf David Matlack 2025-11-26  41  	};
2607a4361312bf David Matlack 2025-11-26  42  
2607a4361312bf David Matlack 2025-11-26  43  	return allocator;
2607a4361312bf David Matlack 2025-11-26  44  }
2607a4361312bf David Matlack 2025-11-26  45  
2607a4361312bf David Matlack 2025-11-26  46  void iova_allocator_cleanup(struct iova_allocator *allocator)
2607a4361312bf David Matlack 2025-11-26  47  {
2607a4361312bf David Matlack 2025-11-26  48  	free(allocator->ranges);
2607a4361312bf David Matlack 2025-11-26  49  	free(allocator);
2607a4361312bf David Matlack 2025-11-26  50  }
2607a4361312bf David Matlack 2025-11-26  51  
2607a4361312bf David Matlack 2025-11-26  52  iova_t iova_allocator_alloc(struct iova_allocator *allocator, size_t size)
2607a4361312bf David Matlack 2025-11-26  53  {
2607a4361312bf David Matlack 2025-11-26  54  	VFIO_ASSERT_GT(size, 0, "Invalid size arg, zero\n");
2607a4361312bf David Matlack 2025-11-26  55  	VFIO_ASSERT_EQ(size & (size - 1), 0, "Invalid size arg, non-power-of-2\n");
2607a4361312bf David Matlack 2025-11-26  56  
2607a4361312bf David Matlack 2025-11-26  57  	for (;;) {
2607a4361312bf David Matlack 2025-11-26  58  		struct iommu_iova_range *range;
2607a4361312bf David Matlack 2025-11-26  59  		iova_t iova, last;
2607a4361312bf David Matlack 2025-11-26  60  
2607a4361312bf David Matlack 2025-11-26  61  		VFIO_ASSERT_LT(allocator->range_idx, allocator->nranges,
2607a4361312bf David Matlack 2025-11-26  62  			       "IOVA allocator out of space\n");
2607a4361312bf David Matlack 2025-11-26  63  
2607a4361312bf David Matlack 2025-11-26  64  		range = &allocator->ranges[allocator->range_idx];
2607a4361312bf David Matlack 2025-11-26  65  		iova = range->start + allocator->range_offset;
2607a4361312bf David Matlack 2025-11-26  66  
2607a4361312bf David Matlack 2025-11-26  67  		/* Check for sufficient space at the current offset */
2607a4361312bf David Matlack 2025-11-26 @68  		if (check_add_overflow(iova, size - 1, &last) ||
2607a4361312bf David Matlack 2025-11-26  69  		    last > range->last)
2607a4361312bf David Matlack 2025-11-26  70  			goto next_range;
2607a4361312bf David Matlack 2025-11-26  71  
2607a4361312bf David Matlack 2025-11-26  72  		/* Align iova to size */
2607a4361312bf David Matlack 2025-11-26  73  		iova = last & ~(size - 1);
2607a4361312bf David Matlack 2025-11-26  74  
2607a4361312bf David Matlack 2025-11-26  75  		/* Check for sufficient space at the aligned iova */
2607a4361312bf David Matlack 2025-11-26  76  		if (check_add_overflow(iova, size - 1, &last) ||
2607a4361312bf David Matlack 2025-11-26  77  		    last > range->last)
2607a4361312bf David Matlack 2025-11-26  78  			goto next_range;
2607a4361312bf David Matlack 2025-11-26  79  
2607a4361312bf David Matlack 2025-11-26  80  		if (last == range->last) {
2607a4361312bf David Matlack 2025-11-26  81  			allocator->range_idx++;
2607a4361312bf David Matlack 2025-11-26  82  			allocator->range_offset = 0;
2607a4361312bf David Matlack 2025-11-26  83  		} else {
2607a4361312bf David Matlack 2025-11-26  84  			allocator->range_offset = last - range->start + 1;
2607a4361312bf David Matlack 2025-11-26  85  		}
2607a4361312bf David Matlack 2025-11-26  86  
2607a4361312bf David Matlack 2025-11-26  87  		return iova;
2607a4361312bf David Matlack 2025-11-26  88  
2607a4361312bf David Matlack 2025-11-26  89  next_range:
2607a4361312bf David Matlack 2025-11-26  90  		allocator->range_idx++;
2607a4361312bf David Matlack 2025-11-26  91  		allocator->range_offset = 0;
2607a4361312bf David Matlack 2025-11-26  92  	}
2607a4361312bf David Matlack 2025-11-26  93  }
2607a4361312bf David Matlack 2025-11-26  94  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
