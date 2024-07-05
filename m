Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1FA13ADA
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jul 2024 05:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720157837; cv=none; b=h/qxDVnMat00yeVDybYgRd3e28y9FVsVB00PcibFGtb8fJD4eXpunT4yyt4YJYNzsbQL83XcdDG+uGr4w2XR6WE5jnHemOxh6q6nU90smgTUKG86WVMcwswIEUDUOlyyv3Y85YuU0jbxBnYfwh+7RmmsVyXKSxsPLvP+sl31jiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720157837; c=relaxed/simple;
	bh=QrceSWozyVNhHuR+gTsRzqCbmqQgCCreu2GqHdQ+seM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OLowFV0RyDjXuhXf8ldoLEP0PRztoEAmVaOAx8ZfePehmxkX1zu/BNrLTAubQ8MVm4U+5tMNRvU/k95gooht9C6PL8sza0ee9j57xwFjde2wGtlPQ5IkLFrDF6CvXkEppdVse0xGYqDBbIm1X86fVKwq9iA9BScM+bAjyy7bhNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gTNaVnzn; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gTNaVnzn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720157836; x=1751693836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QrceSWozyVNhHuR+gTsRzqCbmqQgCCreu2GqHdQ+seM=;
  b=gTNaVnzn4lWtaGCftzKUeNvLhqWelDZzvovUNoQxmG+haGbprl/jlsmV
   mCEeurednL/A/CvgKgB6FIxMEphJ0+nJxBv/rRZV8Dxx9g2rd2w/rSC+A
   L/4EJ+ZXmkClhM6IWLfP7Dzfe7x2xRrrX8mcvYnH9Glpz1IHFowxS7mxe
   kAGGEmcd7POWha0yXpGCka8O2KMhSjeTXEkhGmo0YGOmuOShII6X1nftL
   Iz/aOYiOlwzm3p/Eawnx7iRKfU3w/kAsVdNZO3KutY7EElpxOzGr1PuNy
   2jXhyzxhTgSTkHnV/qtwG5wP1MvZRlOZlmRj9g6xjg2fAolH0aOkuLorN
   w==;
X-CSE-ConnectionGUID: NdhgMT+sR32A0u+4y5oAWQ==
X-CSE-MsgGUID: uDQev8uzRXWKr3ARy2aGRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="20344503"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="20344503"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 22:37:15 -0700
X-CSE-ConnectionGUID: xmbmYZutTlePRBdR2/ij0A==
X-CSE-MsgGUID: amIFd7ocRzCV2ITrM5gbug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="46842100"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Jul 2024 22:37:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPbdA-000Rz2-15;
	Fri, 05 Jul 2024 05:37:12 +0000
Date: Fri, 5 Jul 2024 13:37:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sandeen:f2fs-mount-api 11/11] fs/f2fs/super.c: linux/fs_context.h
 is included more than once.
Message-ID: <202407051312.4oyOGM40-lkp@intel.com>
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
TO: Eric Sandeen <sandeen@sandeen.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sandeen/linux.git f2fs-mount-api
head:   bf51728fb8134742e7da61ecff42fd585d05f264
commit: bf51728fb8134742e7da61ecff42fd585d05f264 [11/11] patch f2fs_convert_new_mount_api
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407051312.4oyOGM40-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/f2fs/super.c: linux/fs_context.h is included more than once.

vim +11 fs/f2fs/super.c

  > 11	#include <linux/fs_context.h>
    12	#include <linux/sched/mm.h>
    13	#include <linux/statfs.h>
    14	#include <linux/buffer_head.h>
    15	#include <linux/kthread.h>
    16	#include <linux/parser.h>
  > 17	#include <linux/fs_context.h>
    18	#include <linux/fs_parser.h>
    19	#include <linux/mount.h>
    20	#include <linux/seq_file.h>
    21	#include <linux/proc_fs.h>
    22	#include <linux/random.h>
    23	#include <linux/exportfs.h>
    24	#include <linux/blkdev.h>
    25	#include <linux/quotaops.h>
    26	#include <linux/f2fs_fs.h>
    27	#include <linux/sysfs.h>
    28	#include <linux/quota.h>
    29	#include <linux/unicode.h>
    30	#include <linux/part_stat.h>
    31	#include <linux/zstd.h>
    32	#include <linux/lz4.h>
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
