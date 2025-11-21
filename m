Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495D52F5A1F
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Nov 2025 19:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763752222; cv=none; b=ZH+bn1xEIbKmQJpHuqVRBGVJrUxN5jcvRukKCVpdrGLSrxAHqn2a4H3/huc2KUHT1Yi+zR9J5pJUU1u+gDeeVGxKCS0fZEcc8hGhnXAxvRXrNw2E0O5vL2HJVSjYl85Mf7dunaWI40TpQdIvqnofl3cqXbS2/5hBS5Imese+Vzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763752222; c=relaxed/simple;
	bh=/Etwt7IrNkU4W/qWjbX2w/DDxhqDYPtYrDYZKLB/178=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E1z+VdZsqFYzjD/xTmbDbAWSVQtXcocXJ/4x9BWwEAkUNcnEa/iWzy4FkPYfwgmMKWfB4XUWvEpa2ZIonq9mwGFJAD1ZUYT+KBL/ukHQB3xSmma75xLUQ86vWcD605344SRlMoDeTqXbpjFJdeLm4ysnZufoCyzcJ5jkGPVeFVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RScjaCKm; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RScjaCKm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763752220; x=1795288220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Etwt7IrNkU4W/qWjbX2w/DDxhqDYPtYrDYZKLB/178=;
  b=RScjaCKmF1TepV/m7b/wUL890AeHfPv8e0/W3OGVrc/oQijy1JSHTUhW
   nApRVad2cJ3OMr2qG2noOBNnEpPk3h80ffi4eDr17H7XiG58L67D6XzBz
   FZVlq/1NaA6DlDubLR+s6IU2p6Tr1iVmAnIl97lxWjGvA2XIZr4P4XqIR
   2RXD/lU3cyIWXuALxCgV+h1RuzZoJn/nItWppBKIeUfA/KAfhhCBZVPz7
   kddbPJORoXM2FxTpAHQ1dixEJkVIc13ZB32jYS4d/6+9WbU6WnibbXCGK
   wz0bjAUVsyDn/AghqMF97ZjatNeThdZrHtnaUi6EbzCfsFohog2ALl7/C
   w==;
X-CSE-ConnectionGUID: ezv2y8GHTuiby++jH2kE9A==
X-CSE-MsgGUID: 0Sge0BgzS8eFTKXKfzG9lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65894903"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="65894903"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 11:10:19 -0800
X-CSE-ConnectionGUID: vhp7AD3fRYC2mQiQ1WlbKQ==
X-CSE-MsgGUID: 1bZ5jAZXSQWdG8t5fPg6ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="191068096"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 21 Nov 2025 11:10:18 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMWWN-000000001tL-2IC1;
	Fri, 21 Nov 2025 19:10:15 +0000
Date: Fri, 21 Nov 2025 20:09:55 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: tools/testing/selftests/vfio/lib/vfio_pci_device.c:249:7: warning:
 comparison of distinct pointer types ('typeof (iova) *' (aka 'unsigned long
 long *') and 'typeof (size - 1) *' (aka 'unsigned int *'))
Message-ID: <202511212039.RbypLd55-lkp@intel.com>
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
TO: Alex Mastro <amastro@fb.com>
CC: Alex Williamson <alex@shazbot.org>
CC: David Matlack <dmatlack@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd95357fd8c6778ac7dea6c57a19b8b182b6e91f
commit: ce0e3c403e00e9e03e80aca6570bf936a44279e2 vfio: selftests: add iova allocator
date:   9 days ago
:::::: branch date: 24 hours ago
:::::: commit date: 9 days ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251121/202511212039.RbypLd55-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511212039.RbypLd55-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511212039.RbypLd55-lkp@intel.com/

All warnings (new ones prefixed by >>):

      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:215:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     215 |         VFIO_ASSERT_NOT_NULL(allocator);
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
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:215:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     215 |         VFIO_ASSERT_NOT_NULL(allocator);
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
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:235:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     235 |         VFIO_ASSERT_GT(size, 0, "Invalid size arg, zero\n");
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:41:37: note: expanded from macro 'VFIO_ASSERT_GT'
      41 | #define VFIO_ASSERT_GT(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, >, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:235:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     235 |         VFIO_ASSERT_GT(size, 0, "Invalid size arg, zero\n");
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:41:37: note: expanded from macro 'VFIO_ASSERT_GT'
      41 | #define VFIO_ASSERT_GT(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, >, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:236:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     236 |         VFIO_ASSERT_EQ(size & (size - 1), 0, "Invalid size arg, non-power-of-2\n");
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:236:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     236 |         VFIO_ASSERT_EQ(size & (size - 1), 0, "Invalid size arg, non-power-of-2\n");
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:242:3: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     242 |                 VFIO_ASSERT_LT(allocator->range_idx, allocator->nranges,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     243 |                                "IOVA allocator out of space\n");
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:39:37: note: expanded from macro 'VFIO_ASSERT_LT'
      39 | #define VFIO_ASSERT_LT(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, <, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:242:3: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     242 |                 VFIO_ASSERT_LT(allocator->range_idx, allocator->nranges,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     243 |                                "IOVA allocator out of space\n");
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:39:37: note: expanded from macro 'VFIO_ASSERT_LT'
      39 | #define VFIO_ASSERT_LT(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, <, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
>> tools/testing/selftests/vfio/lib/vfio_pci_device.c:249:7: warning: comparison of distinct pointer types ('typeof (iova) *' (aka 'unsigned long long *') and 'typeof (size - 1) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
     249 |                 if (check_add_overflow(iova, size - 1, &last) ||
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/../../../tools/include/linux/overflow.h:48:15: note: expanded from macro 'check_add_overflow'
      48 |         (void) (&__a == &__b);                  \
         |                 ~~~~ ^  ~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:257:7: warning: comparison of distinct pointer types ('typeof (iova) *' (aka 'unsigned long long *') and 'typeof (size - 1) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
     257 |                 if (check_add_overflow(iova, size - 1, &last) ||
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/../../../tools/include/linux/overflow.h:48:15: note: expanded from macro 'check_add_overflow'
      48 |         (void) (&__a == &__b);                  \
         |                 ~~~~ ^  ~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:298:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     298 |         VFIO_ASSERT_NE(iova, INVALID_IOVA, "%p is not mapped into device.\n", vaddr);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:298:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     298 |         VFIO_ASSERT_NE(iova, INVALID_IOVA, "%p is not mapped into device.\n", vaddr);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:323:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     323 |         ioctl_assert(device->fd, VFIO_DEVICE_SET_IRQS, irq);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:30:2: note: expanded from macro 'ioctl_assert'
      30 |         VFIO_ASSERT_EQ(__ret, 0, "ioctl(%s, %s, %s) returned %d\n", #_fd, #_op, #_arg, __ret); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:323:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     323 |         ioctl_assert(device->fd, VFIO_DEVICE_SET_IRQS, irq);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:30:2: note: expanded from macro 'ioctl_assert'
      30 |         VFIO_ASSERT_EQ(__ret, 0, "ioctl(%s, %s, %s) returned %d\n", #_fd, #_op, #_arg, __ret); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:336:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     336 |         ioctl_assert(device->fd, VFIO_DEVICE_SET_IRQS, &irq);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:30:2: note: expanded from macro 'ioctl_assert'
      30 |         VFIO_ASSERT_EQ(__ret, 0, "ioctl(%s, %s, %s) returned %d\n", #_fd, #_op, #_arg, __ret); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:336:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     336 |         ioctl_assert(device->fd, VFIO_DEVICE_SET_IRQS, &irq);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:30:2: note: expanded from macro 'ioctl_assert'
      30 |         VFIO_ASSERT_EQ(__ret, 0, "ioctl(%s, %s, %s) returned %d\n", #_fd, #_op, #_arg, __ret); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/vfio_pci_device.c:342:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     342 |         VFIO_ASSERT_TRUE(index == VFIO_PCI_MSI_IRQ_INDEX ||
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     343 |                          index == VFIO_PCI_MSIX_IRQ_INDEX,
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     344 |                          "Unsupported IRQ index: %u\n", index);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:43:35: note: expanded from macro 'VFIO_ASSERT_TRUE'
      43 | #define VFIO_ASSERT_TRUE(_a, ...) VFIO_ASSERT_NE(false, (_a), ##__VA_ARGS__)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'


vim +249 tools/testing/selftests/vfio/lib/vfio_pci_device.c

ce0e3c403e00e9 Alex Mastro 2025-11-11  232  
ce0e3c403e00e9 Alex Mastro 2025-11-11  233  iova_t iova_allocator_alloc(struct iova_allocator *allocator, size_t size)
ce0e3c403e00e9 Alex Mastro 2025-11-11  234  {
ce0e3c403e00e9 Alex Mastro 2025-11-11  235  	VFIO_ASSERT_GT(size, 0, "Invalid size arg, zero\n");
ce0e3c403e00e9 Alex Mastro 2025-11-11  236  	VFIO_ASSERT_EQ(size & (size - 1), 0, "Invalid size arg, non-power-of-2\n");
ce0e3c403e00e9 Alex Mastro 2025-11-11  237  
ce0e3c403e00e9 Alex Mastro 2025-11-11  238  	for (;;) {
ce0e3c403e00e9 Alex Mastro 2025-11-11  239  		struct iommu_iova_range *range;
ce0e3c403e00e9 Alex Mastro 2025-11-11  240  		iova_t iova, last;
ce0e3c403e00e9 Alex Mastro 2025-11-11  241  
ce0e3c403e00e9 Alex Mastro 2025-11-11  242  		VFIO_ASSERT_LT(allocator->range_idx, allocator->nranges,
ce0e3c403e00e9 Alex Mastro 2025-11-11  243  			       "IOVA allocator out of space\n");
ce0e3c403e00e9 Alex Mastro 2025-11-11  244  
ce0e3c403e00e9 Alex Mastro 2025-11-11  245  		range = &allocator->ranges[allocator->range_idx];
ce0e3c403e00e9 Alex Mastro 2025-11-11  246  		iova = range->start + allocator->range_offset;
ce0e3c403e00e9 Alex Mastro 2025-11-11  247  
ce0e3c403e00e9 Alex Mastro 2025-11-11  248  		/* Check for sufficient space at the current offset */
ce0e3c403e00e9 Alex Mastro 2025-11-11 @249  		if (check_add_overflow(iova, size - 1, &last) ||
ce0e3c403e00e9 Alex Mastro 2025-11-11  250  		    last > range->last)
ce0e3c403e00e9 Alex Mastro 2025-11-11  251  			goto next_range;
ce0e3c403e00e9 Alex Mastro 2025-11-11  252  
ce0e3c403e00e9 Alex Mastro 2025-11-11  253  		/* Align iova to size */
ce0e3c403e00e9 Alex Mastro 2025-11-11  254  		iova = last & ~(size - 1);
ce0e3c403e00e9 Alex Mastro 2025-11-11  255  
ce0e3c403e00e9 Alex Mastro 2025-11-11  256  		/* Check for sufficient space at the aligned iova */
ce0e3c403e00e9 Alex Mastro 2025-11-11  257  		if (check_add_overflow(iova, size - 1, &last) ||
ce0e3c403e00e9 Alex Mastro 2025-11-11  258  		    last > range->last)
ce0e3c403e00e9 Alex Mastro 2025-11-11  259  			goto next_range;
ce0e3c403e00e9 Alex Mastro 2025-11-11  260  
ce0e3c403e00e9 Alex Mastro 2025-11-11  261  		if (last == range->last) {
ce0e3c403e00e9 Alex Mastro 2025-11-11  262  			allocator->range_idx++;
ce0e3c403e00e9 Alex Mastro 2025-11-11  263  			allocator->range_offset = 0;
ce0e3c403e00e9 Alex Mastro 2025-11-11  264  		} else {
ce0e3c403e00e9 Alex Mastro 2025-11-11  265  			allocator->range_offset = last - range->start + 1;
ce0e3c403e00e9 Alex Mastro 2025-11-11  266  		}
ce0e3c403e00e9 Alex Mastro 2025-11-11  267  
ce0e3c403e00e9 Alex Mastro 2025-11-11  268  		return iova;
ce0e3c403e00e9 Alex Mastro 2025-11-11  269  
ce0e3c403e00e9 Alex Mastro 2025-11-11  270  next_range:
ce0e3c403e00e9 Alex Mastro 2025-11-11  271  		allocator->range_idx++;
ce0e3c403e00e9 Alex Mastro 2025-11-11  272  		allocator->range_offset = 0;
ce0e3c403e00e9 Alex Mastro 2025-11-11  273  	}
ce0e3c403e00e9 Alex Mastro 2025-11-11  274  }
ce0e3c403e00e9 Alex Mastro 2025-11-11  275  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
