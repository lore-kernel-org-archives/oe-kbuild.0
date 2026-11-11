Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794372608;
	b=XuSeOlkF3O9T3R3N0YGqt+jqQ6DGa3LmSc4AtVFrAw8x4NBFOunY8XQXtvBPD3qqpWQA
	 W5IvErGRsj08OkbmfGVgfgn0nqcDdWtdPu1f5cyr8gmijgLwjZO+iIwbSvtUr2S19t+Ee
	 McV88wRSRYh5565hMrWhs0HxSNh9QxZIDBdZz/d6TSesaxpZCDfHvIa2zGKO2S+iQiFKO
	 FDNLEmwoQTTa5lAaDRG3E4aJQCYjgxlqJ3s6OvJVUG5tWwAkvrNFqeyh1MGZfa4Uav7mO
	 dlbr4+Wf1G/YDZ7t4DPrjIGDLvvpVIRv1FCBAvIAKth7vWSX1IgY1JradUzkMq9KYzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794372608;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=937WB7xTf/NlGfADrB4S/peH71QbqYevXh2MTrcBIdo=;
	b=dkljN6Ki9x3H2O+TkguCcTZcp+60ILMcnXCBPCqJ88vAzrpRQdVQTkEFn7LqyuXz0zEv
	 P5JNELDLaMgZ1nqGylCK5faQozhY8HsQVFClHUWv481LRn1OlMA+U643dIDyXrDYRxNfY
	 9BCrqElSo3Wm0wIJUnNm02C0gmwoIUimr+HqywMoipp+iiupt1OVUk9Rc4lBs24J1gdfH
	 Oq5RG/Hj/LBVO9+xERbdlYKBEdTd+exH8QGuWCN8uOOiPU7rTiY2m4JhAMSee+TrVBtEj
	 DQHOXHiBU9Yg3McD+1AoBBq4YP2qhD5K5d8DnVfFYmpyQtHNCFTbu/qLqsNz5U5qL0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kljCpvJt;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981DC606A31C
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Nov 2026 04:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 981DC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kljCpvJt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794372607; x=1825908607;
  h=date:from:to:cc:subject:message-id;
  bh=VmOVMCZ2a3auC9mT1Opp8ek8zLAz1p6fqKDolGzuq3M=;
  b=kljCpvJt8xH+rl6JQW6DNWrUimpSMQDJfAhvWMGfV9J7xEi3p9kgIeSh
   Qb0j7TmaY7mIyyEkDDxhyEMswNwhV+D/Bv3R+fchmhMGlDMIGxnbnhu2a
   fMmgrOMjgf4cYUA2Hd2qEsQK+jvELllf3yOw5yMDHy1lJB9b8YS7ZDs3o
   WFY5c/eXM8YVOri3QLTDS1BwOcZkQoaSh4YZ+bhrDNqyvZ1gHPZJ2otlT
   RNwsT9HPJVq6zVD6e8L5Lgkeqli2Dnjbagfdp/h8wf/OoOrBe0WuCylmD
   GE/uszvXXEH8wVYzH7FtOYXZUNemW0HDGiKCg0oyhITXB2dHNWJgT0QEK
   w==;
X-CSE-ConnectionGUID: TcuHxUEkTRqde7xZiSzt0A==
X-CSE-MsgGUID: xKlo1c5ERjGaAtF8jEM2eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3143357"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3143357"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 20:50:07 -0800
X-CSE-ConnectionGUID: jX0URLUJSHm+Rj9Mws//nQ==
X-CSE-MsgGUID: 8pEaCZnUTROdkjBlZ1V5BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8154247"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 10 Nov 2026 20:50:06 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xR0Hc-000000000W7-0t5H;
	Wed, 11 Nov 2026 04:50:04 +0000
Date: Wed, 11 Nov 2026 05:49:46 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android17-6.18 1/1] fuse_test.c:1400:9:
 warning: argument 1 null where non-null expected
Message-ID: <202611110550.Xq487xqj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Paul,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   00c8666046c244b6b8efdf905f8d438ee248f875
commit: be926e6761d28d105ba672242e81e911e0d7e5e0 [1/1] ANDROID: fuse-bpf: fuse-bpf v1.3
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261111/202611110550.Xq487xqj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611110550.Xq487xqj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611110550.Xq487xqj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fuse_test.c: In function 'readdir_perms_test':
>> fuse_test.c:1400:9: warning: argument 1 null where non-null expected [-Wnonnull]
    1400 |         closedir(dir);
         |         ^~~~~~~~~~~~~
   In file included from test_fuse.h:13,
                    from fuse_test.c:7:
   /usr/include/dirent.h:134:12: note: in a call to function 'closedir' declared 'nonnull'
     134 | extern int closedir (DIR *__dirp) __nonnull ((1));
         |            ^~~~~~~~
   fuse_test.c: In function 'inotify_test':
>> fuse_test.c:1455:9: warning: 'dir.s' may be used uninitialized [-Wmaybe-uninitialized]
    1455 |         free(dir.s);
         |         ^~~~~~~~~~~
   fuse_test.c:1429:18: note: 'dir.s' was declared here
    1429 |         struct s dir;
         |                  ^~~
   In file included from test_fuse.h:11:
   fuse_test.c: In function 'bpf_test_revalidate_handle_backing_fd':
>> fuse_test.c:1889:27: warning: 'read' writing 11 bytes into a region of size 9 overflows the destination [-Wstringop-overflow=]
    1889 |                 TESTEQUAL(read(dst_content_fd, content_buffer, strlen(content)),
   test_framework.h:137:56: note: in definition of macro '_CALL_TO'
     137 |                                   (_type) (long long) (a),              \
         |                                                        ^
   test_framework.h:153:25: note: in expansion of macro 'TESTOPERATOR'
     153 | #define TESTEQUAL(a, b) TESTOPERATOR(a, b, _eq)
         |                         ^~~~~~~~~~~~
   fuse_test.c:1889:17: note: in expansion of macro 'TESTEQUAL'
    1889 |                 TESTEQUAL(read(dst_content_fd, content_buffer, strlen(content)),
         |                 ^~~~~~~~~
   fuse_test.c:1874:22: note: destination object 'content_buffer' of size 9
    1874 |                 char content_buffer[9] = {0};
         |                      ^~~~~~~~~~~~~~
   In file included from ../../kselftest.h:55,
                    from test_framework.h:26:
   /usr/include/unistd.h:371:16: note: in a call to function 'read' declared with attribute 'access (write_only, 2, 3)'
     371 | extern ssize_t read (int __fd, void *__buf, size_t __nbytes) __wur
         |                ^~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
