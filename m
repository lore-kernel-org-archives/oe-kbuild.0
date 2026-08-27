Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C2919C553
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Aug 2026 03:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787801021; cv=none; b=FwFagxVTMqYwmtuimpGtDEO+w8q2ngDPZBSzNsAhlwd0Lp7Br3owUg7t5wrX7YArq3YumDyJHv1Z2wwnm1fZnR6Oq1zFqVv3LaS0hJKVx7Uoe+QAdTxXTZxs3h08ZeNA4xowOy0s2xkwVGoLOOeF/f0+brsYANvuuiS8igHIXcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787801021; c=relaxed/simple;
	bh=fZ0Vs9IlV30+w4wmzPGtXK0dvKwOCIJYbYZWo9e544A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ql7mFXfVNpoYQktt6X2ZvMDisto0IHD/fxGGgODB7lqQ9pGyo98J7vlpclJQ4uTpHHbVObZxkd7/6DcVnPLnf9h7VAwA6q9ntc2qqgdAr4OwRyzuVGsdftpf9nZTHUnOx+RMcGqnP+YicmuAMtbLnWgIKzjlpxyrJhHpCEIT+Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MSNwWLLW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MSNwWLLW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787801019; x=1819337019;
  h=date:from:to:cc:subject:message-id;
  bh=fZ0Vs9IlV30+w4wmzPGtXK0dvKwOCIJYbYZWo9e544A=;
  b=MSNwWLLWnPQs0jEJ5tbCss3mlbVPxi6CK2C2K86G9sDZO7ySLwctyHfj
   X8If9nJr7tCI6/Gf6OkgqVOkscnjJAgSX9CCeO7Jul+6c2Iwlmpd7IOdW
   kLtStsiouIR5+v1VZM3BK+WdzAA8za3nCsOBnEp/iQLvk6FmX4/5rOyMZ
   5JJnDIb9GmV+8w2uoyOBBGrOuJ2EAoxgl0V4IefwsCWWHO43YLJ8qmZfW
   r3uZmQXYTCuXHmUN24O677uYPH67+9ccc9MiuWgLLOp+40HSFAqbafRTN
   ovifZgyXkk+Eis+6uZeO8r0qT7E6G27/ghq78sFDAfL0ecG0K5K57+BXY
   w==;
X-CSE-ConnectionGUID: KOjslGawSy6xRvsjgszT6Q==
X-CSE-MsgGUID: awkcwWPZRmyAOuflrRAsvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88501313"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="88501313"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 20:23:39 -0700
X-CSE-ConnectionGUID: mz0wgoRHQaun88r2myz2+A==
X-CSE-MsgGUID: a3E8VbKRRDSelOY7xdItug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="297628446"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 26 Aug 2026 20:23:38 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzQiF-000000000gp-3FnX;
	Thu, 27 Aug 2026 03:23:35 +0000
Date: Thu, 27 Aug 2026 05:22:49 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 16826/17167]
 allocinfo_ioctl_test.c:92:73: warning: format '%llu' expects argument of type
 'long long unsigned int', but argument 2 has type '__u64' {aka 'long unsigned
 int'}
Message-ID: <202608270550.rZ7zQAk2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Abhishek Bapat <abhishekbapat@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f82a5da2f04960df9fb57489992d03dd5e64ec6f
commit: 2f252a7a6c90c94be042c10ca3b85f37038d1070 [16826/17167] kselftest: alloc_tag: add kselftest for ioctl interface
:::::: branch date: 14 hours ago
:::::: commit date: 2 days ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260827/202608270550.rZ7zQAk2-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260827/202608270550.rZ7zQAk2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608270550.rZ7zQAk2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   allocinfo_ioctl_test.c: In function 'match_entries':
>> allocinfo_ioctl_test.c:92:73: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 2 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
      92 |                 ksft_print_msg("Entry count mismatch. ioctl entries: %llu, proc entries: %llu\n",
         |                                                                      ~~~^
         |                                                                         |
         |                                                                         long long unsigned int
         |                                                                      %lu
      93 |                                tags->count, procfs_entries->count);
         |                                ~~~~~~~~~~~                               
         |                                    |
         |                                    __u64 {aka long unsigned int}
   allocinfo_ioctl_test.c:92:93: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
      92 |                 ksft_print_msg("Entry count mismatch. ioctl entries: %llu, proc entries: %llu\n",
         |                                                                                          ~~~^
         |                                                                                             |
         |                                                                                             long long unsigned int
         |                                                                                          %lu
      93 |                                tags->count, procfs_entries->count);
         |                                             ~~~~~~~~~~~~~~~~~~~~~                            
         |                                                           |
         |                                                           __u64 {aka long unsigned int}
   allocinfo_ioctl_test.c:100:44: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 2 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
     100 |                         ksft_print_msg("%lluth entry does not match.\n", i);
         |                                         ~~~^                             ~
         |                                            |                             |
         |                                            long long unsigned int        __u64 {aka long unsigned int}
         |                                         %lu
   allocinfo_ioctl_test.c: In function 'get_filtered_procfs_entries':
   allocinfo_ioctl_test.c:140:44: warning: format '%llu' expects argument of type 'long long unsigned int *', but argument 3 has type '__u64 *' {aka 'long unsigned int *'} [-Wformat=]
     140 |                 matches = sscanf(line, "%llu %llu %[^:]:%llu func:%s",
         |                                         ~~~^
         |                                            |
         |                                            long long unsigned int *
         |                                         %lu
     141 |                                  &procfs_entry.counter.bytes,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                  |
         |                                  __u64 * {aka long unsigned int *}
   allocinfo_ioctl_test.c:140:49: warning: format '%llu' expects argument of type 'long long unsigned int *', but argument 4 has type '__u64 *' {aka 'long unsigned int *'} [-Wformat=]
     140 |                 matches = sscanf(line, "%llu %llu %[^:]:%llu func:%s",
         |                                              ~~~^
         |                                                 |
         |                                                 long long unsigned int *
         |                                              %lu
     141 |                                  &procfs_entry.counter.bytes,
     142 |                                  &procfs_entry.counter.calls,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                  |
         |                                  __u64 * {aka long unsigned int *}
   allocinfo_ioctl_test.c:140:60: warning: format '%llu' expects argument of type 'long long unsigned int *', but argument 6 has type '__u64 *' {aka 'long unsigned int *'} [-Wformat=]
     140 |                 matches = sscanf(line, "%llu %llu %[^:]:%llu func:%s",
         |                                                         ~~~^
         |                                                            |
         |                                                            long long unsigned int *
         |                                                         %lu
   ......
     144 |                                  &procfs_entry.tag.lineno,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~   
         |                                  |
         |                                  __u64 * {aka long unsigned int *}

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
