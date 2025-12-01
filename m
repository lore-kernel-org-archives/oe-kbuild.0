Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995FF27054C
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Dec 2025 20:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764622532; cv=none; b=jmVJmEFa8Kq9ScWcO4kC9oGHANjj3om5CflUjBie/o9MHa18B39xbJnIy0eBMCda5jqzezoNmWOJth4e1hKsBR90yHInKgqSTcRLU+fAqWza9HiV+IjciP4jJv8zXWddyMO8+1C1gM688sEffSClCrPlK5BD4YMKMfjriPa8ShQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764622532; c=relaxed/simple;
	bh=pt4xU+JxJjWvCYSMeiO7gQoYAqW5jF5uBedwPuo3ajs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kFP9Kn97fbMo1VPT7Sx4RAs8rD7lWWr+xCF+yH6iP36QRvWlMF3BGcoblD5jlckmT/+5aYJFJGyFS9G5WR9M+ME68d5wv2GS94iODMRlwYY3LNAW6JvXGYMrqiEu2UOmbl+TxirpQ6SZDujLWIV6SPeThoGXT/1VhF2+1RZ6zAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RQlGwPqy; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQlGwPqy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764622531; x=1796158531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pt4xU+JxJjWvCYSMeiO7gQoYAqW5jF5uBedwPuo3ajs=;
  b=RQlGwPqyTZprwv8ca10aJ+ZYZ6DGx2Z3IWp0ae2xaCOQgDKEcUvTXsoZ
   DIc3DnCDgw12T9I40SMwU9ifr4djJ8GJE0HTZpOz1QhI2OA+1TXfa1Nr6
   TL5a8ZuG0ylgkz0jivMPFYCRAXfD9nmSrMg2XMPaAoWYvCX0fcEMGMP+P
   mt1iQNPy8mngGxOphjCED855jNzc55dr2Fq/qxUCqnHw6vk3MmYUhTJus
   LLa/sRBOUOjcP/n2xc0H3Q3ueNlwrZHvwMskK3FdyAQCV4MeosJFxMH80
   gw6KsB7fhwA+3cZc/7S9aA0bnnmxhAn2F6r7xhvqCKBLeJAEOFDyClTm/
   g==;
X-CSE-ConnectionGUID: 4IifHeKlQ+2GSMUTTzsObw==
X-CSE-MsgGUID: zGgNQ4YWTxm+g+FCIFWQpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77924240"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="77924240"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 12:55:30 -0800
X-CSE-ConnectionGUID: 0tf0dUobRXqhOQ8BgQv1qw==
X-CSE-MsgGUID: cfjwJnxbTGmoZU0fU92JNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="198637407"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 01 Dec 2025 12:55:29 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQAve-000000002kJ-1dWt;
	Mon, 01 Dec 2025 20:55:26 +0000
Date: Mon, 1 Dec 2025 21:55:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 12705/13171]
 tools/testing/selftests/vfio/lib/iommu.c:92:2: warning: format specifies
 type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long
 long')
Message-ID: <202512012145.pWEX2HHE-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
commit: 2aca571089b2cc333ed5ad0ada4902aa6f7c0d3c [12705/13171] vfio: selftests: Move IOMMU library code into iommu.c
:::::: branch date: 18 hours ago
:::::: commit date: 3 days ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251201/202512012145.pWEX2HHE-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512012145.pWEX2HHE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512012145.pWEX2HHE-lkp@intel.com/

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
>> tools/testing/selftests/vfio/lib/iommu.c:92:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      92 |         VFIO_ASSERT_NE(iova, INVALID_IOVA, "%p is not mapped into IOMMU\n", vaddr);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
>> tools/testing/selftests/vfio/lib/iommu.c:92:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      92 |         VFIO_ASSERT_NE(iova, INVALID_IOVA, "%p is not mapped into IOMMU\n", vaddr);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iommu.c:245:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     245 |         VFIO_ASSERT_LT(*cap_offset, bufsz);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:39:37: note: expanded from macro 'VFIO_ASSERT_LT'
      39 | #define VFIO_ASSERT_LT(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, <, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iommu.c:245:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     245 |         VFIO_ASSERT_LT(*cap_offset, bufsz);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:39:37: note: expanded from macro 'VFIO_ASSERT_LT'
      39 | #define VFIO_ASSERT_LT(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, <, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iommu.c:246:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     246 |         VFIO_ASSERT_GE(bufsz - *cap_offset, sizeof(*hdr));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:42:37: note: expanded from macro 'VFIO_ASSERT_GE'
      42 | #define VFIO_ASSERT_GE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, >=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iommu.c:246:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     246 |         VFIO_ASSERT_GE(bufsz - *cap_offset, sizeof(*hdr));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:42:37: note: expanded from macro 'VFIO_ASSERT_GE'
      42 | #define VFIO_ASSERT_GE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, >=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iommu.c:266:3: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     266 |                 VFIO_ASSERT_GE(cap_offset, sizeof(*info));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:42:37: note: expanded from macro 'VFIO_ASSERT_GE'
      42 | #define VFIO_ASSERT_GE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, >=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iommu.c:266:3: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     266 |                 VFIO_ASSERT_GE(cap_offset, sizeof(*info));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:42:37: note: expanded from macro 'VFIO_ASSERT_GE'
      42 | #define VFIO_ASSERT_GE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, >=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iommu.c:272:3: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     272 |                 VFIO_ASSERT_LE(depth, max_depth, "Capability chain contains a cycle\n");
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:40:37: note: expanded from macro 'VFIO_ASSERT_LE'
      40 | #define VFIO_ASSERT_LE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, <=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iommu.c:272:3: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     272 |                 VFIO_ASSERT_LE(depth, max_depth, "Capability chain contains a cycle\n");
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:40:37: note: expanded from macro 'VFIO_ASSERT_LE'
      40 | #define VFIO_ASSERT_LE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, <=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iommu.c:287:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     287 |         VFIO_ASSERT_NOT_NULL(info);


vim +92 tools/testing/selftests/vfio/lib/iommu.c

2aca571089b2cc David Matlack 2025-11-26  86  
2aca571089b2cc David Matlack 2025-11-26  87  iova_t iommu_hva2iova(struct iommu *iommu, void *vaddr)
2aca571089b2cc David Matlack 2025-11-26  88  {
2aca571089b2cc David Matlack 2025-11-26  89  	iova_t iova;
2aca571089b2cc David Matlack 2025-11-26  90  
2aca571089b2cc David Matlack 2025-11-26  91  	iova = __iommu_hva2iova(iommu, vaddr);
2aca571089b2cc David Matlack 2025-11-26 @92  	VFIO_ASSERT_NE(iova, INVALID_IOVA, "%p is not mapped into IOMMU\n", vaddr);
2aca571089b2cc David Matlack 2025-11-26  93  
2aca571089b2cc David Matlack 2025-11-26  94  	return iova;
2aca571089b2cc David Matlack 2025-11-26  95  }
2aca571089b2cc David Matlack 2025-11-26  96  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
