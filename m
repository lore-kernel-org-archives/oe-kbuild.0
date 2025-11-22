Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B4E28642D
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 17:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763833602; cv=none; b=Hbcx3e8j9tXRdvGc3bLSLzk2Pfg6DXeBmYC5/NYLY6PcXvi/fnFAXtuZaWV4M40Y9lvqMDh7TuKPUU0CE1zAHMnh4U+szyvhZvFU8AiuiExBdW4n9Y/zn2r85G1alYA+5MljFhpJBPJYnI3ZkpWdhNgTdLTz8WprnvV6YHmQR70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763833602; c=relaxed/simple;
	bh=IyzWZEkse0OOAqMHGRmAQvvLsxRowAPaCR5vC12NmEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TKbiv8vHkg+d8DIavk01o7HxOuMAkDE4Rsw6C0q1ypCEwyrF8qllb+OIvMXWLyomXWPQyYKHDp0WlSqNjJjIUAVhSr6eI4MaQqNmZnqBH1QciKn/oxYvaqnrPu4Q6PR3YeXwfOiLWKRjFVwFQL1YVWI0hg7dTSeBpCq25TgSJBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=En/+8QLh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="En/+8QLh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763833600; x=1795369600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IyzWZEkse0OOAqMHGRmAQvvLsxRowAPaCR5vC12NmEI=;
  b=En/+8QLhURmyE0qkr4tj0gr9zooBkU3MLdk0qO+IXGMzNmoBMA5m9rYd
   5/sEOKG5CgqaheOPOtCpDuD8PT/D5RBIU969xXofQWMijrOVdsLVWx7AD
   m/BUV5P20LxbLo7QQFxyZLk0wd5fp9tIfM06XLYOIXbhexSWGOcoMSLMw
   gwPNNVfFAYRttKFxMvnSfy7W4AMaNS+V1VM2dX2iSGQZtTBtF4zHrX8+Z
   uCUL+fwOvSPnAZ1My1K4AoZPK46ZbC0zciIdsaShvRINPXzDDAColiSS4
   E+FIBthCAf5ZJRY1JpdBdOC8mBvcROqz0kRXFh//hYb9ZrVPyyN7+6m0i
   Q==;
X-CSE-ConnectionGUID: Bl8K9jO8S9O8ljdTBXIQ/A==
X-CSE-MsgGUID: uNdiyBAjSGSAYeqVCjkiyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="88553401"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="88553401"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 09:46:39 -0800
X-CSE-ConnectionGUID: yhsoUNQhT8G8puv5ttJ8RQ==
X-CSE-MsgGUID: ijYyPJ8FR0qZsL7XjgoVhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="192426666"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 22 Nov 2025 09:46:38 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMrgx-000000002Cx-3lPN;
	Sat, 22 Nov 2025 17:46:35 +0000
Date: Sat, 22 Nov 2025 18:46:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-kiwi-6.1 12/12] test_memcontrol.c:667:6:
 warning: variable 'fd' is used uninitialized whenever 'if' condition is true
Message-ID: <202511221815.dsS3c2eQ-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   bc9ddde9df0a25323311f8384a84f0309cb9f906
commit: 4d2ee43ac2a906833636db6d456370a567fa409c [12/12] selftests: fix LLVM build for i386 and x86_64
:::::: branch date: 3 days ago
:::::: commit date: 2 years, 8 months ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251122/202511221815.dsS3c2eQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221815.dsS3c2eQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511221815.dsS3c2eQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> test_memcontrol.c:667:6: warning: variable 'fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     667 |         if (current != 0)
         |             ^~~~~~~~~~~~
   test_memcontrol.c:748:8: note: uninitialized use occurs here
     748 |         close(fd);
         |               ^~
   test_memcontrol.c:667:2: note: remove the 'if' if its condition is always false
     667 |         if (current != 0)
         |         ^~~~~~~~~~~~~~~~~
     668 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:663:6: warning: variable 'fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     663 |         if (cg_create(memcg))
         |             ^~~~~~~~~~~~~~~~
   test_memcontrol.c:748:8: note: uninitialized use occurs here
     748 |         close(fd);
         |               ^~
   test_memcontrol.c:663:2: note: remove the 'if' if its condition is always false
     663 |         if (cg_create(memcg))
         |         ^~~~~~~~~~~~~~~~~~~~~
     664 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:660:6: warning: variable 'fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     660 |         if (!memcg)
         |             ^~~~~~
   test_memcontrol.c:748:8: note: uninitialized use occurs here
     748 |         close(fd);
         |               ^~
   test_memcontrol.c:660:2: note: remove the 'if' if its condition is always false
     660 |         if (!memcg)
         |         ^~~~~~~~~~~
     661 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:654:25: note: initialize the variable 'fd' to silence this warning
     654 |         int ret = KSFT_FAIL, fd, retries;
         |                                ^
         |                                 = 0
   3 warnings generated.
--
>> test_cpu.c:240:35: warning: suggest braces around initialization of subobject [-Wmissing-braces]
     240 |         struct cpu_hogger children[3] = {NULL};
         |                                          ^~~~
         |                                          {   }
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/__stddef_null.h:26:14: note: expanded from macro 'NULL'
      26 | #define NULL ((void*)0)
         |              ^~~~~~~~~~
   test_cpu.c:411:31: warning: suggest braces around initialization of subobject [-Wmissing-braces]
     411 |         struct cpu_hogger leaf[3] = {NULL};
         |                                      ^~~~
         |                                      {   }
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/__stddef_null.h:26:14: note: expanded from macro 'NULL'
      26 | #define NULL ((void*)0)
         |              ^~~~~~~~~~
   2 warnings generated.
--
   In file included from lib/assert.c:10:
>> include/test_util.h:136:37: warning: format specifies type 'unsigned long' but the argument has type 'uint64_t' (aka 'unsigned long long') [-Wformat]
     136 |                     "size not a power of 2: %lu", size);
         |                                             ~~~   ^~~~
         |                                             %llu
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   1 warning generated.
--
   In file included from lib/elf.c:8:
>> include/test_util.h:136:37: warning: format specifies type 'unsigned long' but the argument has type 'uint64_t' (aka 'unsigned long long') [-Wformat]
     136 |                     "size not a power of 2: %lu", size);
         |                                             ~~~   ^~~~
         |                                             %llu
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   In file included from lib/elf.c:13:
   In file included from include/kvm_util.h:10:
   include/kvm_util_base.h:655:23: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     655 |         return ____vm_create(VM_MODE_DEFAULT, 0);
         |                              ^
   include/kvm_util_base.h:660:21: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     660 |         return __vm_create(VM_MODE_DEFAULT, nr_runnable_vcpus, 0);
         |                            ^
   include/kvm_util_base.h:671:32: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     671 |         return __vm_create_with_vcpus(VM_MODE_DEFAULT, nr_vcpus, 0,
         |                                       ^
>> lib/elf.c:81:29: warning: format specifies type 'ssize_t' (aka 'int') but the argument has type 'off_t' (aka 'long') [-Wformat]
      81 |                 "  rv: %zi expected: %i", offset_rv, 0);
         |                        ~~~                ^~~~~~~~~
         |                        %li
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
>> lib/elf.c:170:8: warning: format specifies type 'unsigned long' but the argument has type 'vm_vaddr_t' (aka 'unsigned long long') [-Wformat]
     168 |                         "  seg_vstart: 0x%lx\n"
         |                                          ~~~
         |                                          %llx
     169 |                         "  vaddr: 0x%lx",
     170 |                         n1, seg_vstart, vaddr);
         |                             ^~~~~~~~~~
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   lib/elf.c:170:20: warning: format specifies type 'unsigned long' but the argument has type 'vm_vaddr_t' (aka 'unsigned long long') [-Wformat]
     169 |                         "  vaddr: 0x%lx",
         |                                     ~~~
         |                                     %llx
     170 |                         n1, seg_vstart, vaddr);
         |                                         ^~~~~
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   4 warnings and 3 errors generated.
--
   In file included from lib/guest_modes.c:5:
   In file included from include/guest_modes.h:5:
   In file included from include/kvm_util.h:10:
   In file included from include/kvm_util_base.h:10:
>> include/test_util.h:136:37: warning: format specifies type 'unsigned long' but the argument has type 'uint64_t' (aka 'unsigned long long') [-Wformat]
     136 |                     "size not a power of 2: %lu", size);
         |                                             ~~~   ^~~~
         |                                             %llu
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   In file included from lib/guest_modes.c:5:
   In file included from include/guest_modes.h:5:
   In file included from include/kvm_util.h:10:
   include/kvm_util_base.h:655:23: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     655 |         return ____vm_create(VM_MODE_DEFAULT, 0);
         |                              ^
   include/kvm_util_base.h:660:21: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     660 |         return __vm_create(VM_MODE_DEFAULT, nr_runnable_vcpus, 0);
         |                            ^
   include/kvm_util_base.h:671:32: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     671 |         return __vm_create_with_vcpus(VM_MODE_DEFAULT, nr_vcpus, 0,
         |                                       ^
   lib/guest_modes.c:17:20: error: use of undeclared identifier 'VM_MODE_DEFAULT'
      17 |         guest_mode_append(VM_MODE_DEFAULT, true, true);
         |                           ^
   1 warning and 4 errors generated.
--
   In file included from lib/io.c:8:
>> include/test_util.h:136:37: warning: format specifies type 'unsigned long' but the argument has type 'uint64_t' (aka 'unsigned long long') [-Wformat]
     136 |                     "size not a power of 2: %lu", size);
         |                                             ~~~   ^~~~
         |                                             %llu
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
>> lib/io.c:51:58: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
      51 |         TEST_ASSERT(count >= 0, "Unexpected count, count: %li", count);
         |                                                           ~~~   ^~~~~
         |                                                           %zu
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   lib/io.c:128:58: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     128 |         TEST_ASSERT(count >= 0, "Unexpected count, count: %li", count);
         |                                                           ~~~   ^~~~~
         |                                                           %zu
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   3 warnings generated.
--
   In file included from lib/kvm_util.c:9:
>> include/test_util.h:136:37: warning: format specifies type 'unsigned long' but the argument has type 'uint64_t' (aka 'unsigned long long') [-Wformat]
     136 |                     "size not a power of 2: %lu", size);
         |                                             ~~~   ^~~~
         |                                             %llu
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   In file included from lib/kvm_util.c:10:
   In file included from include/kvm_util.h:10:
   include/kvm_util_base.h:655:23: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     655 |         return ____vm_create(VM_MODE_DEFAULT, 0);
         |                              ^
   include/kvm_util_base.h:660:21: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     660 |         return __vm_create(VM_MODE_DEFAULT, nr_runnable_vcpus, 0);
         |                            ^
   include/kvm_util_base.h:671:32: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     671 |         return __vm_create_with_vcpus(VM_MODE_DEFAULT, nr_vcpus, 0,
         |                                       ^
   In file included from lib/kvm_util.c:11:
   include/x86_64/processor.h:15:10: fatal error: 'asm/msr-index.h' file not found
      15 | #include <asm/msr-index.h>
         |          ^~~~~~~~~~~~~~~~~
   1 warning and 4 errors generated.
--
   In file included from lib/sparsebit.c:158:
>> include/test_util.h:136:37: warning: format specifies type 'unsigned long' but the argument has type 'uint64_t' (aka 'unsigned long long') [-Wformat]
     136 |                     "size not a power of 2: %lu", size);
         |                                             ~~~   ^~~~
         |                                             %llu
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
>> lib/sparsebit.c:890:15: warning: format specifies type 'unsigned long' but the argument has type 'sparsebit_idx_t' (aka 'unsigned long long') [-Wformat]
     889 |         fprintf(stream, "%*s  idx: 0x%lx mask: 0x%x num_after: 0x%lx\n",
         |                                      ~~~
         |                                      %llx
     890 |                 indent, "", nodep->idx, nodep->mask, nodep->num_after);
         |                             ^~~~~~~~~~
>> lib/sparsebit.c:890:40: warning: format specifies type 'unsigned long' but the argument has type 'sparsebit_num_t' (aka 'unsigned long long') [-Wformat]
     889 |         fprintf(stream, "%*s  idx: 0x%lx mask: 0x%x num_after: 0x%lx\n",
         |                                                                  ~~~
         |                                                                  %llx
     890 |                 indent, "", nodep->idx, nodep->mask, nodep->num_after);
         |                                                      ^~~~~~~~~~~~~~~~
   lib/sparsebit.c:930:53: warning: format specifies type 'unsigned long' but the argument has type 'sparsebit_num_t' (aka 'unsigned long long') [-Wformat]
     930 |         fprintf(stream, "%*snum_set: 0x%lx\n", indent, "", s->num_set);
         |                                        ~~~                 ^~~~~~~~~~
         |                                        %llx
   lib/sparsebit.c:1736:12: warning: format specifies type 'unsigned long' but the argument has type 'sparsebit_num_t' (aka 'unsigned long long') [-Wformat]
    1735 |                                 "nodep: %p nodep->num_after: 0x%lx",
         |                                                                ~~~
         |                                                                %llx
    1736 |                                 nodep, nodep->num_after);
         |                                        ^~~~~~~~~~~~~~~~
   lib/sparsebit.c:1747:12: warning: format specifies type 'unsigned long' but the argument has type 'sparsebit_idx_t' (aka 'unsigned long long') [-Wformat]
    1745 |                                 "  nodep: %p nodep->idx: 0x%lx "
         |                                                            ~~~
         |                                                            %llx
    1746 |                                 "MASK_BITS: %lu\n",
    1747 |                                 nodep, nodep->idx, MASK_BITS);
         |                                        ^~~~~~~~~~
>> lib/sparsebit.c:1747:24: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
    1746 |                                 "MASK_BITS: %lu\n",
         |                                             ~~~
         |                                             %u
    1747 |                                 nodep, nodep->idx, MASK_BITS);
         |                                                    ^~~~~~~~~
   lib/sparsebit.c:166:19: note: expanded from macro 'MASK_BITS'
     166 | #define MASK_BITS (sizeof(mask_t) * CHAR_BIT)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/sparsebit.c:1761:12: warning: format specifies type 'unsigned long' but the argument has type 'sparsebit_idx_t' (aka 'unsigned long long') [-Wformat]
    1759 |                                 "  nodep: %p nodep->idx: 0x%lx\n"
         |                                                            ~~~
         |                                                            %llx
    1760 |                                 "  MASK_BITS: %lu nodep->num_after: 0x%lx",
    1761 |                                 nodep, nodep->idx, MASK_BITS, nodep->num_after);
         |                                        ^~~~~~~~~~
   lib/sparsebit.c:1761:24: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
    1760 |                                 "  MASK_BITS: %lu nodep->num_after: 0x%lx",
         |                                               ~~~
         |                                               %u
    1761 |                                 nodep, nodep->idx, MASK_BITS, nodep->num_after);
         |                                                    ^~~~~~~~~
   lib/sparsebit.c:166:19: note: expanded from macro 'MASK_BITS'
     166 | #define MASK_BITS (sizeof(mask_t) * CHAR_BIT)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/sparsebit.c:1761:35: warning: format specifies type 'unsigned long' but the argument has type 'sparsebit_num_t' (aka 'unsigned long long') [-Wformat]
    1760 |                                 "  MASK_BITS: %lu nodep->num_after: 0x%lx",
         |                                                                       ~~~
         |                                                                       %llx
    1761 |                                 nodep, nodep->idx, MASK_BITS, nodep->num_after);
         |                                                               ^~~~~~~~~~~~~~~~
   lib/sparsebit.c:1813:12: warning: format specifies type 'unsigned long' but the argument has type 'sparsebit_idx_t' (aka 'unsigned long long') [-Wformat]
    1811 |                                         "  prev: %p prev->idx: 0x%lx\n"
         |                                                                  ~~~
         |                                                                  %llx
    1812 |                                         "  nodep: %p nodep->idx: 0x%lx",
    1813 |                                         prev, prev->idx, nodep, nodep->idx);
         |                                               ^~~~~~~~~
   lib/sparsebit.c:1813:30: warning: format specifies type 'unsigned long' but the argument has type 'sparsebit_idx_t' (aka 'unsigned long long') [-Wformat]
    1812 |                                         "  nodep: %p nodep->idx: 0x%lx",
         |                                                                    ~~~
         |                                                                    %llx
    1813 |                                         prev, prev->idx, nodep, nodep->idx);
         |                                                                 ^~~~~~~~~~
   lib/sparsebit.c:1831:12: warning: format specifies type 'unsigned long' but the argument has type 'sparsebit_idx_t' (aka 'unsigned long long') [-Wformat]
    1826 |                                         "  prev: %p prev->idx: 0x%lx "
         |                                                                  ~~~
         |                                                                  %llx
    1827 |                                         "prev->num_after: 0x%lx\n"
    1828 |                                         "  nodep: %p nodep->idx: 0x%lx "
    1829 |                                         "nodep->num_after: 0x%lx\n"
    1830 |                                         "  MASK_BITS: %lu",
    1831 |                                         prev, prev->idx, prev->num_after,
         |                                               ^~~~~~~~~
   lib/sparsebit.c:1831:23: warning: format specifies type 'unsigned long' but the argument has type 'sparsebit_num_t' (aka 'unsigned long long') [-Wformat]
    1827 |                                         "prev->num_after: 0x%lx\n"
         |                                                             ~~~
         |                                                             %llx
    1828 |                                         "  nodep: %p nodep->idx: 0x%lx "
    1829 |                                         "nodep->num_after: 0x%lx\n"
    1830 |                                         "  MASK_BITS: %lu",
    1831 |                                         prev, prev->idx, prev->num_after,
         |                                                          ^~~~~~~~~~~~~~~
   lib/sparsebit.c:1832:13: warning: format specifies type 'unsigned long' but the argument has type 'sparsebit_idx_t' (aka 'unsigned long long') [-Wformat]
    1828 |                                         "  nodep: %p nodep->idx: 0x%lx "
         |                                                                    ~~~
         |                                                                    %llx
    1829 |                                         "nodep->num_after: 0x%lx\n"
    1830 |                                         "  MASK_BITS: %lu",
    1831 |                                         prev, prev->idx, prev->num_after,
    1832 |                                         nodep, nodep->idx, nodep->num_after,
         |                                                ^~~~~~~~~~
   lib/sparsebit.c:1832:25: warning: format specifies type 'unsigned long' but the argument has type 'sparsebit_num_t' (aka 'unsigned long long') [-Wformat]
    1829 |                                         "nodep->num_after: 0x%lx\n"
         |                                                              ~~~
         |                                                              %llx
    1830 |                                         "  MASK_BITS: %lu",
    1831 |                                         prev, prev->idx, prev->num_after,
    1832 |                                         nodep, nodep->idx, nodep->num_after,
         |                                                            ^~~~~~~~~~~~~~~~
   lib/sparsebit.c:1833:6: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
    1830 |                                         "  MASK_BITS: %lu",
         |                                                       ~~~
         |                                                       %u
    1831 |                                         prev, prev->idx, prev->num_after,
    1832 |                                         nodep, nodep->idx, nodep->num_after,
    1833 |                                         MASK_BITS);
         |                                         ^~~~~~~~~
   lib/sparsebit.c:166:19: note: expanded from macro 'MASK_BITS'
     166 | #define MASK_BITS (sizeof(mask_t) * CHAR_BIT)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/sparsebit.c:1853:12: warning: format specifies type 'unsigned long' but the argument has type 'sparsebit_idx_t' (aka 'unsigned long long') [-Wformat]
    1848 |                                         "  prev: %p prev->idx: 0x%lx "
         |                                                                  ~~~
         |                                                                  %llx
    1849 |                                         "prev->num_after: 0x%lx\n"
    1850 |                                         "  nodep: %p nodep->idx: 0x%lx "
    1851 |                                         "nodep->num_after: 0x%lx\n"
    1852 |                                         "  MASK_BITS: %lu",
    1853 |                                         prev, prev->idx, prev->num_after,
         |                                               ^~~~~~~~~
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
