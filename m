Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811693E171B
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Oct 2026 07:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309967; cv=none; b=gD3gp9JlYbuEPUHMhctWiYGAGQGa/YTXlGovkF0+L+WvIMU0faPBLI3WaJk59gCxC3uRYDqvodmRUbVc+72agneZTefmgZONXYJ2NvVnAl4JqUNbRFmvW3VXOI8oqoSQpYYndCXlVwSo86L/VfoGyuxNzY6Q/137ky3iVLBUCJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309967; c=relaxed/simple;
	bh=TkykhchQYLEFUIekzCjnNPYIWVtHpQqzT2AYFLsfR8k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fTO/Hf+BzNaAuOS8gvcsi84qAHuOZ74SUL1Bjh2y/o+jI6RwZes+qF4EjiOkxWa8jy7IqwMBXccl2M4APLIMbu8RU/mjlE7/my+1KsFVxsU62V5tzymTr++/g2f16CjqyQg8OfDsh2eyimtBy/IsOPrzc/BxpDXnUuxUWiLJdnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lOQux9Zo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lOQux9Zo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309967; x=1823845967;
  h=date:from:to:cc:subject:message-id;
  bh=TkykhchQYLEFUIekzCjnNPYIWVtHpQqzT2AYFLsfR8k=;
  b=lOQux9Zok0unT5DothJVPfRNGJ42sN/G6JK3Kl5yXbp7/Kz31JqjLqvy
   OoegZ9+kNlIB/V6kNCQCwz+BwqkCi9lezS5nXUBuhRsXaYvfGVNA4ZMrL
   KMIfLftRgpZdXnNabrKST5pfZs7f620de9Q2G9+dzXHsEVamtW1B8+e28
   xjy6TwTPYZuGKi5p3m2vnd3oBXteDK26R0fyiKsNaKhJjFFZGLehBcLLE
   GBHlahSz8sNJ+KPPrpXVeU2yLwp+KdOkFHzZYhuLiy6yaYWv9N+zQPKNF
   NxHjHFtpCOeKFKAEUEfQN8H6+IbKHYNOD1emgu240toyL/snVPLC6fbtT
   Q==;
X-CSE-ConnectionGUID: 8w4EB0a3RYK1VbgyOSHL6w==
X-CSE-MsgGUID: 4NN6F6W/SqS0nJLo3kXL+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="916690"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="916690"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:39 -0700
X-CSE-ConnectionGUID: WGMqeQLeTnGyfv3dORDfJA==
X-CSE-MsgGUID: YekuhjvITKqtDabW55auSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2340804"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Oct 2026 00:52:35 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh3-000000004xQ-0JX3;
	Sun, 18 Oct 2026 07:52:33 +0000
Date: Sun, 18 Oct 2026 09:43:38 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mszeredi-fuse:for-next 24/52] fuse_mnt.c:46:49: error:
 parameter 6 ('flags') has incomplete type
Message-ID: <202610170047.9ZeFYsLO-lkp@intel.com>
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
CC: fuse-devel@lists.sourceforge.net
TO: Luis Henriques <luis@igalia.com>
CC: Miklos Szeredi <mszeredi@redhat.com>
CC: Amir Goldstein <amir73il@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git for-next
head:   4dd8d396740168f5379f332ad2c165d7f0f91953
commit: 1ee5d3698ee66fa1cf2ed0b874caa8dcd59c6c7f [24/52] selftests/fuse: convert fusectl test to fuse3
:::::: branch date: 7 hours ago
:::::: commit date: 35 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261017/202610170047.9ZeFYsLO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610170047.9ZeFYsLO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610170047.9ZeFYsLO-lkp@intel.com/

Note: the mszeredi-fuse/for-next HEAD 4dd8d396740168f5379f332ad2c165d7f0f91953 builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

>> fuse_mnt.c:46:30: warning: 'enum fuse_readdir_flags' declared inside parameter list will not be visible outside of this definition or declaration
      46 |                         enum fuse_readdir_flags flags)
         |                              ^~~~~~~~~~~~~~~~~~
>> fuse_mnt.c:46:49: error: parameter 6 ('flags') has incomplete type
      46 |                         enum fuse_readdir_flags flags)
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   fuse_mnt.c: In function 'test_readdir':
>> fuse_mnt.c:51:35: error: 'FUSE_FILL_DIR_DEFAULTS' undeclared (first use in this function)
      51 |         filler(buf, ".", NULL, 0, FUSE_FILL_DIR_DEFAULTS);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   fuse_mnt.c:51:35: note: each undeclared identifier is reported only once for each function it appears in
>> fuse_mnt.c:51:9: error: too many arguments to function 'filler'
      51 |         filler(buf, ".", NULL, 0, FUSE_FILL_DIR_DEFAULTS);
         |         ^~~~~~
   fuse_mnt.c:52:9: error: too many arguments to function 'filler'
      52 |         filler(buf, "..", NULL, 0, FUSE_FILL_DIR_DEFAULTS);
         |         ^~~~~~
   fuse_mnt.c:53:9: error: too many arguments to function 'filler'
      53 |         filler(buf, test_path + 1, NULL, 0, FUSE_FILL_DIR_DEFAULTS);
         |         ^~~~~~
   fuse_mnt.c: At top level:
>> fuse_mnt.c:138:20: error: initialization of 'int (*)(const char *, struct stat *)' from incompatible pointer type 'int (*)(const char *, struct stat *, struct fuse_file_info *)' [-Wincompatible-pointer-types]
     138 |         .getattr = test_getattr,
         |                    ^~~~~~~~~~~~
   fuse_mnt.c:138:20: note: (near initialization for 'memfd_ops.getattr')
>> fuse_mnt.c:143:21: error: initialization of 'int (*)(const char *, off_t)' {aka 'int (*)(const char *, long int)'} from incompatible pointer type 'int (*)(const char *, off_t,  struct fuse_file_info *)' {aka 'int (*)(const char *, long int,  struct fuse_file_info *)'} [-Wincompatible-pointer-types]
     143 |         .truncate = test_truncate,
         |                     ^~~~~~~~~~~~~
   fuse_mnt.c:143:21: note: (near initialization for 'memfd_ops.truncate')

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
