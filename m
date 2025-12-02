Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F9E305E2F
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 09:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764666736; cv=none; b=F9b3nG5OJLcrGcaczIFkQ/nvYo+EW6F0Ir1ZFFE/HT7miDpDSaiPu5eIYnJgsMJgm/iLQfzk4BcArT5LnunhMGimB4r5qpuoikLEpuH4Pog3+vRCuX+bSZSVMj45IKSzuB8LCGOGiGkZVoyo94p0VYDzr68rEOeWuPQ+S4Ds5js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764666736; c=relaxed/simple;
	bh=H3NhcFepnZqJmSq7VL1gj5/YpLv/xv0/eRLP/LTWAoA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LTdb0IxXp8NliXqQNjVhsAQWoexamJ8c5hx2dA+0Llo/2+Zq2wA2WJxsR8MKdOepBrWKZ2FLcsR81l3twGfcCEUNMhq2b4jVffPNiPY6osfKdAcTc+VpWqzMddpOHxKFUzdRcOok7Ki4T7g/M1koOCC0C3YYpK4H3/DahOOBa5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cz52Qdku; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cz52Qdku"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764666733; x=1796202733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H3NhcFepnZqJmSq7VL1gj5/YpLv/xv0/eRLP/LTWAoA=;
  b=cz52QdkugE3xhRHYXoiVG1cFoeRE9bx2POsKPbZ4Pud091FnASisju1T
   IKcaEYQC+F8+wMdsRYnSVwldrfLT8FQVFiAbCff/EEewyjPFxpCEzL+Nz
   cxr+pAl/KSOpjrRkzvGfFteogkke+MNLu7hq5Sora6+EzAONukZQFzhVB
   PZ4K9hWUTACh1lbV16UTeXlHLQ8ojrNRcCdwdTM43/ZHlmHSRIFFTATam
   5v0pkNhNAIeeXGtx5LZbxwyKWokS5Lsyv3wnCBwTrafyTOEsPWU9amvnz
   W668BbflI5bs+F7hb6T/yGN/dU5b5O8gqxuS8bAAp4HBXTW52WMG7H45k
   Q==;
X-CSE-ConnectionGUID: xcH9sECIRwKQ2qmYrU1IZg==
X-CSE-MsgGUID: SewewyvDQ0+d+ugQQ/nseQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70242094"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="70242094"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 01:12:13 -0800
X-CSE-ConnectionGUID: mZQbdFnqTFO8cwxLYu0t4A==
X-CSE-MsgGUID: EvrqdKiTQwetVFuX1lNH2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="225011346"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Dec 2025 01:12:12 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQMQb-000000009cp-3cPC;
	Tue, 02 Dec 2025 09:12:09 +0000
Date: Tue, 2 Dec 2025 17:11:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rgushchin:bpfoom.3.1 28/28] mm/bpf_oom.c:130:20: error: invalid use
 of undefined type 'struct bpf_struct_st_link'
Message-ID: <202512021736.frgkJbzw-lkp@intel.com>
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
TO: Roman Gushchin <roman.gushchin@linux.dev>

tree:   https://github.com/rgushchin/linux.git bpfoom.3.1
head:   dca9f586d5471222d105b51cf2ceb5eb91fdda01
commit: dca9f586d5471222d105b51cf2ceb5eb91fdda01 [28/28] tmp
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512021736.frgkJbzw-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021736.frgkJbzw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021736.frgkJbzw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> mm/bpf_oom.c:125:32: warning: 'struct bpf_struct_st_link' declared inside parameter list will not be visible outside of this definition or declaration
     125 | void bpf_oom_clear_link(struct bpf_struct_st_link *st_link)
         |                                ^~~~~~~~~~~~~~~~~~
>> mm/bpf_oom.c:125:6: warning: no previous prototype for 'bpf_oom_clear_link' [-Wmissing-prototypes]
     125 | void bpf_oom_clear_link(struct bpf_struct_st_link *st_link)
         |      ^~~~~~~~~~~~~~~~~~
   mm/bpf_oom.c: In function 'bpf_oom_clear_link':
>> mm/bpf_oom.c:130:20: error: invalid use of undefined type 'struct bpf_struct_st_link'
     130 |         if (st_link->cgroup)
         |                    ^~
   mm/bpf_oom.c:131:24: error: invalid use of undefined type 'struct bpf_struct_st_link'
     131 |                 st_link->cgroup->bpf.bpf_oom_link = NULL;
         |                        ^~
   In file included from ./include/linux/init.h:5,
                    from ./include/linux/printk.h:6,
                    from ./include/asm-generic/bug.h:22,
                    from ./arch/riscv/include/asm/bug.h:90,
                    from ./include/linux/bug.h:5,
                    from ./include/linux/alloc_tag.h:8,
                    from ./include/linux/workqueue.h:9,
                    from ./include/linux/bpf.h:11,
                    from mm/bpf_oom.c:8:
   mm/bpf_oom.c: In function 'bpf_oom_ops_unreg':
>> ./include/linux/container_of.h:21:54: error: invalid use of undefined type 'struct bpf_struct_st_link'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   ./include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   mm/bpf_oom.c:139:46: note: in expansion of macro 'container_of'
     139 |         struct bpf_struct_st_link *st_link = container_of(link, struct bpf_struct_st_link, link);
         |                                              ^~~~~~~~~~~~
   ././include/linux/compiler_types.h:532:27: error: expression in static assertion is not an integer
     532 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   ./include/linux/container_of.h:21:9: note: in expansion of macro 'static_assert'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   ./include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   mm/bpf_oom.c:139:46: note: in expansion of macro 'container_of'
     139 |         struct bpf_struct_st_link *st_link = container_of(link, struct bpf_struct_st_link, link);
         |                                              ^~~~~~~~~~~~
   In file included from ./include/uapi/linux/posix_types.h:5,
                    from ./include/uapi/linux/types.h:14,
                    from ./include/linux/types.h:6,
                    from ./include/uapi/linux/bpf.h:11,
                    from ./include/linux/bpf.h:7:
>> ./include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct bpf_struct_st_link'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   ./include/linux/container_of.h:24:28: note: in expansion of macro 'offsetof'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   mm/bpf_oom.c:139:46: note: in expansion of macro 'container_of'
     139 |         struct bpf_struct_st_link *st_link = container_of(link, struct bpf_struct_st_link, link);
         |                                              ^~~~~~~~~~~~
   mm/bpf_oom.c:141:21: error: invalid use of undefined type 'struct bpf_struct_st_link'
     141 |         if (!st_link->cgroup)
         |                     ^~
>> mm/bpf_oom.c:144:28: error: passing argument 1 of 'bpf_oom_clear_link' from incompatible pointer type [-Wincompatible-pointer-types]
     144 |         bpf_oom_clear_link(st_link);
         |                            ^~~~~~~
         |                            |
         |                            struct bpf_struct_st_link *
   mm/bpf_oom.c:125:52: note: expected 'struct bpf_struct_st_link *' but argument is of type 'struct bpf_struct_st_link *'
     125 | void bpf_oom_clear_link(struct bpf_struct_st_link *st_link)
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
--
>> kernel/bpf/bpf_struct_ops.c:1205:32: warning: 'struct bpf_struct_st_link' declared inside parameter list will not be visible outside of this definition or declaration
    1205 | void bpf_oom_clear_link(struct bpf_struct_st_link *st_link);
         |                                ^~~~~~~~~~~~~~~~~~
   kernel/bpf/bpf_struct_ops.c: In function 'bpf_struct_ops_link_detach_cgroup':
>> kernel/bpf/bpf_struct_ops.c:1211:28: error: passing argument 1 of 'bpf_oom_clear_link' from incompatible pointer type [-Wincompatible-pointer-types]
    1211 |         bpf_oom_clear_link(st_link);
         |                            ^~~~~~~
         |                            |
         |                            struct bpf_struct_ops_link *
   kernel/bpf/bpf_struct_ops.c:1205:52: note: expected 'struct bpf_struct_st_link *' but argument is of type 'struct bpf_struct_ops_link *'
    1205 | void bpf_oom_clear_link(struct bpf_struct_st_link *st_link);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~


vim +130 mm/bpf_oom.c

97fa5fc46535819 Roman Gushchin 2025-08-11  124  
dca9f586d547122 Roman Gushchin 2025-12-01 @125  void bpf_oom_clear_link(struct bpf_struct_st_link *st_link)
97fa5fc46535819 Roman Gushchin 2025-08-11  126  {
dca9f586d547122 Roman Gushchin 2025-12-01  127  	mutex_lock(&bpf_oom_lock);
dca9f586d547122 Roman Gushchin 2025-12-01  128  	cgroup_lock();
97fa5fc46535819 Roman Gushchin 2025-08-11  129  
dca9f586d547122 Roman Gushchin 2025-12-01 @130  	if (st_link->cgroup)
dca9f586d547122 Roman Gushchin 2025-12-01  131  		st_link->cgroup->bpf.bpf_oom_link = NULL;
97fa5fc46535819 Roman Gushchin 2025-08-11  132  
dca9f586d547122 Roman Gushchin 2025-12-01  133  	cgroup_unlock();
dca9f586d547122 Roman Gushchin 2025-12-01  134  	mutex_unlock(&bpf_oom_lock);
97fa5fc46535819 Roman Gushchin 2025-08-11  135  }
97fa5fc46535819 Roman Gushchin 2025-08-11  136  
dca9f586d547122 Roman Gushchin 2025-12-01  137  static void bpf_oom_ops_unreg(void *kdata, struct bpf_link *link)
dca9f586d547122 Roman Gushchin 2025-12-01  138  {
dca9f586d547122 Roman Gushchin 2025-12-01  139  	struct bpf_struct_st_link *st_link = container_of(link, struct bpf_struct_st_link, link);
dca9f586d547122 Roman Gushchin 2025-12-01  140  
dca9f586d547122 Roman Gushchin 2025-12-01  141  	if (!st_link->cgroup)
dca9f586d547122 Roman Gushchin 2025-12-01  142  		return;
dca9f586d547122 Roman Gushchin 2025-12-01  143  
dca9f586d547122 Roman Gushchin 2025-12-01 @144  	bpf_oom_clear_link(st_link);
97fa5fc46535819 Roman Gushchin 2025-08-11  145  }
97fa5fc46535819 Roman Gushchin 2025-08-11  146  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
