Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2115279792
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 19:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764702822; cv=none; b=NCgmqEMSX5kRB2I5if28QCtFgM9zXk1qCSCvNwsSfqEWRf7Mh1J7LU4xCV4CCgun7dgpO1OwgJhJmEZzd25l4vtJE/HU5U1ooIMKY8T6bdZAGHahY1Tz6YNhHSQiKhrZgX77bWnGDqcOn9aGiDYOQfWYAxsyf4Nn5sRlNcEzexQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764702822; c=relaxed/simple;
	bh=H8yQM0dAT9pfGJnpotfrB92dAq+SM0b0SnZsRFkv7Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cfkK2ojjB6BDvs/oP0A0YDsIBCA/TP8ECmylKxcFeyIzYuG084EzXIt1giu/RsJncOHt68k2MFacJB6RtuU1hGw6stEXAa6JIpyMH4WdEV/983ijxzzRrazq6lgS4GfwsVBBKVUxFJGXOsa5rHRdSb8QhH1PggiV6H/1ijXH8hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T+Ly4W8L; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T+Ly4W8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764702819; x=1796238819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H8yQM0dAT9pfGJnpotfrB92dAq+SM0b0SnZsRFkv7Xo=;
  b=T+Ly4W8LxRBcf9eP0PYvwVzZJhBjZ9O9BBRPnEsRonJ1JYyIM1TXx/rm
   iR+U6lwTUOC6nOpn6tGvhbGJN4I/9CGrhx1rNj6EHVYYnQ0VTe3KDSnVd
   XM1I7/y8T0cfOrZ8K7sdg3g/zIb6MRoKTdJcCuE2tQfxpIQGP4kNAn2bA
   Qwfcoq38kFJ4kEcZVkdQfqgOEBEK2PyrCSanEGXQTPGxeKeqZTN8azkcv
   CzN4F99AFCWmdB24MqewURqEaweJLTjchPA10Vuf/63e82vQMZG9Olxg1
   GsEPmlQ3wHR8YjrAsanbdndD8wEIT+itpS/e4qquLaurzQ77ICmxZAuYc
   A==;
X-CSE-ConnectionGUID: IaBN8AixQYy/MN93ZgttpA==
X-CSE-MsgGUID: 68JYFAtASfStUQg1Pfm83w==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66402798"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="66402798"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 11:13:39 -0800
X-CSE-ConnectionGUID: QDOAxlpMRVacKI/LfvS76A==
X-CSE-MsgGUID: LiExaW2sRw6lwUGkRpvwXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="194339013"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 02 Dec 2025 11:13:38 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQVoe-000000002xV-0zgl;
	Tue, 02 Dec 2025 19:13:36 +0000
Date: Tue, 2 Dec 2025 20:13:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rgushchin:bpfoom.3.1 28/28] mm/bpf_oom.c:144:21: error:
 incompatible pointer types passing 'struct bpf_struct_st_link *' to
 parameter of type 'struct bpf_struct_st_link *'
Message-ID: <202512022049.YuUa4tby-lkp@intel.com>
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
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512022049.YuUa4tby-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 5dd2b06d60d3eb9b07c7513358ad8b04386f79bc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512022049.YuUa4tby-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512022049.YuUa4tby-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/bpf_oom.c:125:32: warning: declaration of 'struct bpf_struct_st_link' will not be visible outside of this function [-Wvisibility]
     125 | void bpf_oom_clear_link(struct bpf_struct_st_link *st_link)
         |                                ^
   mm/bpf_oom.c:130:13: error: incomplete definition of type 'struct bpf_struct_st_link'
     130 |         if (st_link->cgroup)
         |             ~~~~~~~^
   mm/bpf_oom.c:125:32: note: forward declaration of 'struct bpf_struct_st_link'
     125 | void bpf_oom_clear_link(struct bpf_struct_st_link *st_link)
         |                                ^
   mm/bpf_oom.c:131:10: error: incomplete definition of type 'struct bpf_struct_st_link'
     131 |                 st_link->cgroup->bpf.bpf_oom_link = NULL;
         |                 ~~~~~~~^
   mm/bpf_oom.c:125:32: note: forward declaration of 'struct bpf_struct_st_link'
     125 | void bpf_oom_clear_link(struct bpf_struct_st_link *st_link)
         |                                ^
   mm/bpf_oom.c:125:6: warning: no previous prototype for function 'bpf_oom_clear_link' [-Wmissing-prototypes]
     125 | void bpf_oom_clear_link(struct bpf_struct_st_link *st_link)
         |      ^
   mm/bpf_oom.c:125:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     125 | void bpf_oom_clear_link(struct bpf_struct_st_link *st_link)
         | ^
         | static 
   mm/bpf_oom.c:139:39: error: incomplete definition of type 'struct bpf_struct_st_link'
     139 |         struct bpf_struct_st_link *st_link = container_of(link, struct bpf_struct_st_link, link);
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/container_of.h:21:47: note: expanded from macro 'container_of'
      21 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
      22 |                       __same_type(*(ptr), void),                        \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      23 |                       "pointer type mismatch in container_of()");       \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ././include/linux/compiler_types.h:532:74: note: expanded from macro '__same_type'
     532 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   ./include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   mm/bpf_oom.c:139:9: note: forward declaration of 'struct bpf_struct_st_link'
     139 |         struct bpf_struct_st_link *st_link = container_of(link, struct bpf_struct_st_link, link);
         |                ^
   mm/bpf_oom.c:139:39: error: offsetof of incomplete type 'struct bpf_struct_st_link'
     139 |         struct bpf_struct_st_link *st_link = container_of(link, struct bpf_struct_st_link, link);
         |                                              ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/container_of.h:24:21: note: expanded from macro 'container_of'
      24 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^        ~~~~
   ./include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                  ~~~~
   mm/bpf_oom.c:139:9: note: forward declaration of 'struct bpf_struct_st_link'
     139 |         struct bpf_struct_st_link *st_link = container_of(link, struct bpf_struct_st_link, link);
         |                ^
   mm/bpf_oom.c:141:14: error: incomplete definition of type 'struct bpf_struct_st_link'
     141 |         if (!st_link->cgroup)
         |              ~~~~~~~^
   mm/bpf_oom.c:139:9: note: forward declaration of 'struct bpf_struct_st_link'
     139 |         struct bpf_struct_st_link *st_link = container_of(link, struct bpf_struct_st_link, link);
         |                ^
>> mm/bpf_oom.c:144:21: error: incompatible pointer types passing 'struct bpf_struct_st_link *' to parameter of type 'struct bpf_struct_st_link *' [-Wincompatible-pointer-types]
     144 |         bpf_oom_clear_link(st_link);
         |                            ^~~~~~~
   mm/bpf_oom.c:125:52: note: passing argument to parameter 'st_link' here
     125 | void bpf_oom_clear_link(struct bpf_struct_st_link *st_link)
         |                                                    ^
   2 warnings and 6 errors generated.
--
   kernel/bpf/bpf_struct_ops.c:1205:32: warning: declaration of 'struct bpf_struct_st_link' will not be visible outside of this function [-Wvisibility]
    1205 | void bpf_oom_clear_link(struct bpf_struct_st_link *st_link);
         |                                ^
>> kernel/bpf/bpf_struct_ops.c:1211:21: error: incompatible pointer types passing 'struct bpf_struct_ops_link *' to parameter of type 'struct bpf_struct_st_link *' [-Wincompatible-pointer-types]
    1211 |         bpf_oom_clear_link(st_link);
         |                            ^~~~~~~
   kernel/bpf/bpf_struct_ops.c:1205:52: note: passing argument to parameter 'st_link' here
    1205 | void bpf_oom_clear_link(struct bpf_struct_st_link *st_link);
         |                                                    ^
   1 warning and 1 error generated.


vim +144 mm/bpf_oom.c

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
