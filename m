Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFCD2248BA
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Feb 2025 16:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739809203; cv=none; b=EnU54XvmqJ2IdpVfXgSxGIfwjIIDcViMCI2G8oFFsiuBsMxWZ87GU5Yq14itSsDxVALl4U90/nFsqFpw6qyQd4tRFL+Yx98XIl3bAczztgl87G0kCAmELih9siZuOJuOq98upK15H3rq9DMsrJGhxymVrzMLgh33r9xLiI0qQkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739809203; c=relaxed/simple;
	bh=i25N00eTo5Sx64ov9IbYtb+hVPTxAuhlfVdMYm/izqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PB+i7LB0fHmWqDVkjrexWRFbESxzA4TBfEzDnaPHEoFLgU2UdAtCdqEbtNYKBGiPmdMIpH8VYjAXzL0m+EapcwakPGoTVWd5y9XfROdpL0oo3S2xQ+HwoTd1pTthr704cB854+9s4drQDQ8wm4sEEf06p+vTU2RFazvfUEMUd24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GrdvbVuW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GrdvbVuW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739809202; x=1771345202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i25N00eTo5Sx64ov9IbYtb+hVPTxAuhlfVdMYm/izqE=;
  b=GrdvbVuWEB7o6EuGGBx8E8K/3rUfc/SC1UOs3ScQOYMaTEH2nd9YS8xR
   kuGq6BnY/rLms8gdcLd/RHJCcPPzbd/FmeYryUeN41jWpYpzqFA8tiBl8
   5qTcUG5TnlJ6gMzTPLgj7+xjmf6vrAzuIbbVqSZW3qEDT6ENfmTTOjJLr
   S9qQ516Y/EnmR5EsXK60Ni1zRU8NkPfXsvpOe+XvdIzpv2mS3ZRAD8YvW
   mZi1WC2ye7QaC0PafWdl5PlpQom21zHe6Iw2RM8szecB+rdGZv6qBrNWT
   SWHFKHY7kaEITeQkihIkNiXt3NXJq03HwdS7bdl69wJo9ZV69HgDrvLHp
   w==;
X-CSE-ConnectionGUID: bw5Rz3zJQwGZEngnqAUuLg==
X-CSE-MsgGUID: nOfAiqAMQcSFvQdd84KUww==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="65850097"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="65850097"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 08:19:59 -0800
X-CSE-ConnectionGUID: xu6D1KQuSTu4vlsoBMDG1A==
X-CSE-MsgGUID: 0fjq135kTty7IwFMdFWWMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="113901710"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Feb 2025 08:19:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tk3qd-001DKb-0f;
	Mon, 17 Feb 2025 16:19:55 +0000
Date: Tue, 18 Feb 2025 00:19:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:openEuler-1.0-LTS 1424/1424] mm/shmem.c:
 linux/share_pool.h is included more than once.
Message-ID: <202502180046.Kw1gefh4-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Yang Yingliang <yangyingliang@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   bd6fde5ff5b73d04068bdad2dc7730479d4df355
commit: 67c0af6adca9b6b6b6c0556b00dd66f0d08e6c07 [1424/1424] share_pool: Alloc shared memory on a specified memory node
:::::: branch date: 13 hours ago
:::::: commit date: 3 years, 4 months ago
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502180046.Kw1gefh4-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> mm/shmem.c: linux/share_pool.h is included more than once.

vim +39 mm/shmem.c

  > 39	#include <linux/share_pool.h>
    40	
    41	#include <asm/tlbflush.h> /* for arch/microblaze update_mmu_cache() */
    42	
    43	static struct vfsmount *shm_mnt;
    44	
    45	#ifdef CONFIG_SHMEM
    46	/*
    47	 * This virtual memory filesystem is heavily based on the ramfs. It
    48	 * extends ramfs by the ability to use swap and honor resource limits
    49	 * which makes it a completely usable filesystem.
    50	 */
    51	
    52	#include <linux/xattr.h>
    53	#include <linux/exportfs.h>
    54	#include <linux/posix_acl.h>
    55	#include <linux/posix_acl_xattr.h>
    56	#include <linux/mman.h>
    57	#include <linux/string.h>
    58	#include <linux/slab.h>
    59	#include <linux/backing-dev.h>
    60	#include <linux/shmem_fs.h>
    61	#include <linux/writeback.h>
    62	#include <linux/blkdev.h>
    63	#include <linux/pagevec.h>
    64	#include <linux/percpu_counter.h>
    65	#include <linux/falloc.h>
    66	#include <linux/splice.h>
    67	#include <linux/security.h>
    68	#include <linux/swapops.h>
    69	#include <linux/mempolicy.h>
    70	#include <linux/namei.h>
    71	#include <linux/ctype.h>
    72	#include <linux/migrate.h>
    73	#include <linux/highmem.h>
    74	#include <linux/seq_file.h>
    75	#include <linux/magic.h>
    76	#include <linux/syscalls.h>
    77	#include <linux/fcntl.h>
    78	#include <uapi/linux/memfd.h>
    79	#include <linux/userfaultfd_k.h>
    80	#include <linux/rmap.h>
    81	#include <linux/uuid.h>
    82	
    83	#include <linux/uaccess.h>
    84	#include <asm/pgtable.h>
    85	
    86	#include "internal.h"
  > 87	#include <linux/share_pool.h>
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
