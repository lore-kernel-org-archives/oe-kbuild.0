Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A230036A340
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Jul 2026 04:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785384616; cv=none; b=fOFFVWxIGSsHDg9ECw7JC4UaEp2VTKXUS5FFq8LDS2vO6IIyPVQcGEnlk4rmwb3VV+O/ppTuFhrwKuZpUviOhC+XK50EcXSLfYB/+BE/EmBE/AKy7yOnL2D8uM3FlSIedpA9J4K9wTRrpN/GSsr0YiJ9WsO/v2yClL6Rc8QVK8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785384616; c=relaxed/simple;
	bh=nci8LBkw5YxnG3YrNd/7W2yyHFKZpX4nu8lJhXLcU9k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RepBO3YcU2J19YZ64n2H5GW+nC2v+0kJMKiEuLHj0q2l2eAnr6B3l3ORdwQ95azRemGOtK5l3hzGwnk+BMO+15K+t9IApAliBJ70YxZ8DM3OvLotIiqzMLiGP7RI4IDpjyrVxBW2+eiuskYCEH1GSubut1k+u2hErUg1xzoYreg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HVN6/ay4; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HVN6/ay4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785384615; x=1816920615;
  h=date:from:to:cc:subject:message-id;
  bh=nci8LBkw5YxnG3YrNd/7W2yyHFKZpX4nu8lJhXLcU9k=;
  b=HVN6/ay4ZB+DVbT/WCgKiTovisp+tkEZHbhMcZI60a1/hOMjwbWS38ut
   A7zlR0OfnRVv5DNdLmQwmWykEw60ldJ9zrvdVUupsXpplVFgH0VE5T5yE
   2byqCGue7+q8EUJZ8z4EMGCkCxdj3cJhZ55lQAQSthLNqCiilXtw9IsTW
   s76WOngJM2vNKRJwXPaLeVmh5L9qZHo2widfaVtvunUZq5aml89CbudRK
   btkB5YWkqBV04P93+0x+x5wkJ0e9b6hRD6XIpZlDSZFjPZU8O2ROlV7SJ
   WPKyyMbdX14aeFKsb5M7umkut8P5j0M3Et0fMe09q0ilgdntl7gcXBaoX
   w==;
X-CSE-ConnectionGUID: QDihR+NVTlyoV6NZiSUQLg==
X-CSE-MsgGUID: WnPbiOAwRTm8N16qilyBPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86014545"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="86014545"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 21:10:15 -0700
X-CSE-ConnectionGUID: BktDVahETp+0ne0dNO0AFg==
X-CSE-MsgGUID: geX/TUBoTWaRodqIjioaog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="283536567"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 29 Jul 2026 21:10:13 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpI5z-000000002JK-04Mc;
	Thu, 30 Jul 2026 04:10:11 +0000
Date: Thu, 30 Jul 2026 06:09:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android17-6.18 4/4] fuse_test.c:1400:9:
 warning: argument 1 null where non-null expected
Message-ID: <202607300651.2HBiyC2w-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   5e9654c516d84286a1589d22470d9c4c04ed8507
commit: be926e6761d28d105ba672242e81e911e0d7e5e0 [4/4] ANDROID: fuse-bpf: fuse-bpf v1.3
:::::: branch date: 5 hours ago
:::::: commit date: 4 months ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260730/202607300651.2HBiyC2w-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607300651.2HBiyC2w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607300651.2HBiyC2w-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fuse_test.c: In function 'readdir_perms_test':
>> fuse_test.c:1400:9: warning: argument 1 null where non-null expected [-Wnonnull]
    1400 |         closedir(dir);
         |         ^~~~~~~~~~~~~
   In file included from test_fuse.h:13,
                    from fuse_test.c:7:
   /usr/aarch64-linux-gnu/include/dirent.h:134:12: note: in a call to function 'closedir' declared 'nonnull'
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
   /usr/aarch64-linux-gnu/include/unistd.h:371:16: note: in a call to function 'read' declared with attribute 'access (write_only, 2, 3)'
     371 | extern ssize_t read (int __fd, void *__buf, size_t __nbytes) __wur
         |                ^~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
