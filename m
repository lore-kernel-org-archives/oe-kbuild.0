Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C2DA34
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 06:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yu9dwFTq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701585169; x=1733121169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2JZDdQhodcazXWrVWlJhkEHHdoxLDmO+FVQZTWi/j98=;
  b=Yu9dwFTqDz4+yr5KfkBDKbFuiFq+p0xvUcvQPrgHKljYsnvaiCv4qi4j
   au6pePyISd5yUpM9M1OmJjb8rhkR3Gu6z11MpLYzcL5zfbm4F4oH8ZuWN
   IfRFsy/YVqtV0SM4USwgIti8UYh5ILTtDNfMTplNqcX0JvU4yGVZjrl2+
   odbU6GfXdcWxJD9aHUdHoU+7zDO6JU5hHbvPF2cXAb3NQz2IWNnIdnDVG
   WddUU4rhf0yO88kWx8scNa2byF6tMfr/MQIa0+gvWxzl5Az3TD8wdYVaM
   3V8kP9zw9gVNeN+8t5/rS/A6pLqG1EqIIIOrvqg5xp/KV+s2hOvxB/gH+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="6906501"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="6906501"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:32:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="770191171"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="770191171"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 02 Dec 2023 22:32:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9g20-0006Lc-1u;
	Sun, 03 Dec 2023 06:32:44 +0000
Date: Sun, 3 Dec 2023 14:31:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 13/35] btrfs: adapt readdir for encrypted and nokey names
Message-ID: <202312030254.wsyY4tCz-lkp@intel.com>
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
In-Reply-To: <e405fffae735ea6a250c58bd7ad199281f111f9a.1695750478.git.josef@toxicpanda.com>
References: <e405fffae735ea6a250c58bd7ad199281f111f9a.1695750478.git.josef@toxicpanda.com>
TO: Josef Bacik <josef@toxicpanda.com>
TO: linux-btrfs@vger.kernel.org
TO: kernel-team@fb.com
TO: ebiggers@kernel.org
TO: linux-fscrypt@vger.kernel.org
TO: ngompa13@gmail.com
CC: Omar Sandoval <osandov@osandov.com>
CC: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>

Hi Josef,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[cannot apply to axboe-block/for-next linus/master v6.7-rc3 next-20231201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Josef-Bacik/fscrypt-rename-fscrypt_info-fscrypt_inode_info/20230927-020531
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/e405fffae735ea6a250c58bd7ad199281f111f9a.1695750478.git.josef%40toxicpanda.com
patch subject: [PATCH 13/35] btrfs: adapt readdir for encrypted and nokey names
:::::: branch date: 10 weeks ago
:::::: commit date: 10 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231203/202312030254.wsyY4tCz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312030254.wsyY4tCz-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/btrfs/fscrypt.c: ioctl.h is included more than once.

vim +8 fs/btrfs/fscrypt.c

     2	
     3	#include <linux/iversion.h>
     4	#include "ctree.h"
     5	#include "accessors.h"
     6	#include "btrfs_inode.h"
     7	#include "disk-io.h"
   > 8	#include "ioctl.h"
     9	#include "fs.h"
    10	#include "fscrypt.h"
  > 11	#include "ioctl.h"
    12	#include "messages.h"
    13	#include "root-tree.h"
    14	#include "transaction.h"
    15	#include "xattr.h"
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
