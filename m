Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707CB194C61
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Feb 2025 17:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739642298; cv=none; b=pH1XiKU64HO2svNurlWcM24wQN8OkKgON4HO7qQHFx+QiqzBnOPvWPCjnyPw3u2P2dRktNBmQV0gb9ohVMK2P8TB+78n54344u5Txas1zrlmlpvvSAoUSaC8KjduwQfGdyrmuHY0vNKAAXUavK+voNhXZscWZQRavvs71mzkv7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739642298; c=relaxed/simple;
	bh=cMlWcw/+2f9Sv01pvmj0UBHnkMb5n2QOl0m/RJZWxw0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L8iT66WVFGijHO2lTPi6gE8uoU7UdqDjiyaQPROwpMOi/AaWqeAmFxPZVBiioUOFbxYj+wBsMYrAi5IZS+GwH4mehq5MwhwmbUs+dXsjMFcMPO0rKffzLndrCFyEg65QJrMiaDKp4WjZgkb2e/9L/j4DXtkWKDXKrmPGSkJBeao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QTm6nCKc; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QTm6nCKc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739642296; x=1771178296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cMlWcw/+2f9Sv01pvmj0UBHnkMb5n2QOl0m/RJZWxw0=;
  b=QTm6nCKciqaQq7zRDluFgq3IGnoak5EpMLQdZZjwxiUupBLC8gn+arYE
   s69Dvz3FWpC1EL6IQUoTdh+lNXsFX6cWfjHAx2CDczCk/6mUNRI9dVF6E
   ++mDEOwSlEr5hfkwjAsywC9KPIt9JP7i6K/a18/Vrq4Px2qhb5LA67D8g
   YZytn2TODV6QGN69395rTrX9Myr/srfzcl+KsWs8g1h8kwQHMEbUIqPD2
   G0E3m97cSl2iy3eRaHB5ZACV2nMuFcaJByG7pkokcZdis/oSONaoyQxPk
   zN6ETB+mjSxEjchJEGGxKwv2qqEqU3LUCG7edrYAPNH023YX3iUPbvJW7
   w==;
X-CSE-ConnectionGUID: h1zLinAyRIy6pT8MFlloCg==
X-CSE-MsgGUID: PgL/X9bESqG5y7EpTihW+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="39556191"
X-IronPort-AV: E=Sophos;i="6.13,289,1732608000"; 
   d="scan'208";a="39556191"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 09:58:15 -0800
X-CSE-ConnectionGUID: RT+0r/m+QXe5j4tdKtR1EQ==
X-CSE-MsgGUID: QArCDg+7QjWfZ2ZpQcv80Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114638587"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Feb 2025 09:58:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjMQe-001B47-1G;
	Sat, 15 Feb 2025 17:58:12 +0000
Date: Sun, 16 Feb 2025 01:57:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android13-5.10 1/1] mm/shmem.c: internal.h is
 included more than once.
Message-ID: <202502160153.bhLj4sZU-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   6b7c856caf89f4b82af7af2bb7d09b8c1112730b
commit: 25c7eb4932e92641c0b6fdf4cb1493cfad369413 [1/1] ANDROID: mm: shmem: Fix build break with allnoconfig
:::::: branch date: 33 hours ago
:::::: commit date: 3 years, 7 months ago
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502160153.bhLj4sZU-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> mm/shmem.c: internal.h is included more than once.

vim +45 mm/shmem.c

    44	
  > 45	#include "internal.h"
    46	
    47	#undef CREATE_TRACE_POINTS
    48	#include <trace/hooks/shmem_fs.h>
    49	
    50	static struct vfsmount *shm_mnt;
    51	
    52	#ifdef CONFIG_SHMEM
    53	/*
    54	 * This virtual memory filesystem is heavily based on the ramfs. It
    55	 * extends ramfs by the ability to use swap and honor resource limits
    56	 * which makes it a completely usable filesystem.
    57	 */
    58	
    59	#include <linux/xattr.h>
    60	#include <linux/exportfs.h>
    61	#include <linux/posix_acl.h>
    62	#include <linux/posix_acl_xattr.h>
    63	#include <linux/mman.h>
    64	#include <linux/string.h>
    65	#include <linux/slab.h>
    66	#include <linux/backing-dev.h>
    67	#include <linux/shmem_fs.h>
    68	#include <linux/writeback.h>
    69	#include <linux/blkdev.h>
    70	#include <linux/pagevec.h>
    71	#include <linux/percpu_counter.h>
    72	#include <linux/falloc.h>
    73	#include <linux/splice.h>
    74	#include <linux/security.h>
    75	#include <linux/swapops.h>
    76	#include <linux/mempolicy.h>
    77	#include <linux/namei.h>
    78	#include <linux/ctype.h>
    79	#include <linux/migrate.h>
    80	#include <linux/highmem.h>
    81	#include <linux/seq_file.h>
    82	#include <linux/magic.h>
    83	#include <linux/syscalls.h>
    84	#include <linux/fcntl.h>
    85	#include <uapi/linux/memfd.h>
    86	#include <linux/userfaultfd_k.h>
    87	#include <linux/rmap.h>
    88	#include <linux/uuid.h>
    89	
    90	#include <linux/uaccess.h>
    91	
  > 92	#include "internal.h"
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
