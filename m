Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A307C22EED
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Oct 2023 20:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MOFO5liS"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696453084; x=1727989084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nu6TSrS0V8uo2AZ8+BseQj6YZagFIF6MUj/1NdjS3TU=;
  b=MOFO5liSzMqCBKS5ewIq7VLyLH8UA3cWRoWe8O/tuVMQMiE0Cw31x+Rb
   NAFa/0elcM0tr5RLEz32F3tlJbV9NRKm/8Gyj6AR+uxVSabRcVDs9N3Jm
   irr4wWuGMBcQ6q8BnnvUmm80mv7wILFvw2f5K4dhT4IXqPB+rUIkBFpW7
   wNbAv+eko8Fr0paEYuwP8ToWUhwMtTerKvClvFhwgRgRaS/kq/4wdwKJG
   q1zThCt7jpo76WoEYT0+ggyz5KMBxuSS+iw65FXTxtQjT8r1ikk7Tgqaz
   IY/PwpZIBbrF5r6nInMPW/YaJkhIUI2Uj4VODdODUfAM7NcWlhmstlsyE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="363576529"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="363576529"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 13:58:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="755098718"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="755098718"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 04 Oct 2023 13:58:02 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qo8wR-000Kby-32;
	Wed, 04 Oct 2023 20:57:59 +0000
Date: Thu, 5 Oct 2023 04:57:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 13/35] btrfs: adapt readdir for encrypted and nokey names
Message-ID: <202310050449.35KiNskt-lkp@intel.com>
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
[cannot apply to axboe-block/for-next linus/master v6.6-rc4 next-20231004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Josef-Bacik/fscrypt-rename-fscrypt_info-fscrypt_inode_info/20230927-020531
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/e405fffae735ea6a250c58bd7ad199281f111f9a.1695750478.git.josef%40toxicpanda.com
patch subject: [PATCH 13/35] btrfs: adapt readdir for encrypted and nokey names
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231005/202310050449.35KiNskt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310050449.35KiNskt-lkp@intel.com/

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
