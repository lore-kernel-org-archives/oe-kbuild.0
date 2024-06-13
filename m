Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB80144317
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Jun 2024 14:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718288163; cv=none; b=cfVfwfD0hSlOuBullFKlkzuw5To6DV4Y/hp/olMk2DuWEEd3jnIulZlxs1Vxx+2cwCXQ9HDS+L7inseT6N6MhizEC4sJnoeM0xMNQguJKQlfoy1/0o7IbYWVAYr60Ei1iT0R+RzAv4vKACojjhgHJbNtv2SSKoWuBLa5FwoMIA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718288163; c=relaxed/simple;
	bh=TojYGckNbxxL7utbGFQ9BJDaLuehgN1Y0umxrQ/UkQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A0P47TPRqtCOwYN8utqoGb4yc95XlUpbS/Hx8IT4aX/D/BIsPO5yTOmKWSCn5x8wCyJnv8zUtEysiYRSsXOn8dEzidY2EmG3go1x0xY86pMIsscYHNO99fl4rkudTiyEgAVWOj4y/i5dBiEwssYZ0ex+AUS9jhBfN/8q7Ob5XHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDynZzjz; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDynZzjz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718288162; x=1749824162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TojYGckNbxxL7utbGFQ9BJDaLuehgN1Y0umxrQ/UkQQ=;
  b=XDynZzjzDfkKgY7QBzlrhvnpa7Md/U1Bz9/UemEVvsZXVII7wBieOXGk
   wsvyv2arEqlgVdW62XDPyVyGP8HzI+EGhm37KVFEJcxsGXiAYtK6vM4S7
   OhjcYhele0D79Enu13icJe23Iw1QW8iTiAjAjPyhSDNE25vEaiz75mNxZ
   GfFfbt+ksFOrrD6WAsaMkpDvwMambyDXq5hy0XZf2LCXUr7S6H3wxO9rZ
   xua1XV5TNuTmNhwkKzrmxWCy0cW6jg80G8GWYq3U80P1MOrpRDKJFumCn
   wnBWTwEi75bCyA2ivUslXz195Tf/qc4W6I5TVFXZUnhw7TLLCliwhwgZS
   Q==;
X-CSE-ConnectionGUID: X4b74tQFS96B0wt+WExd3A==
X-CSE-MsgGUID: mgqR/BWhQYyWKHY/SFxE5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15077355"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="15077355"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 07:16:02 -0700
X-CSE-ConnectionGUID: KLw1pGa1R0WP9NfAvEUDWA==
X-CSE-MsgGUID: gbPkFaF+SbO90ngHQihA1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="44689784"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Jun 2024 07:16:00 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHlF8-00006U-15;
	Thu, 13 Jun 2024 14:15:58 +0000
Date: Thu, 13 Jun 2024 22:15:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hch-xfs:xlog-grant-head-bytes 3/10] fs/xfs/libxfs/xfs_defer.c:
 xfs_trans_priv.h is included more than once.
Message-ID: <202406140058.5Rh7v9Fh-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/xfs xlog-grant-head-bytes
head:   aef7177a5c1b992e3c6473d314033a428957a84f
commit: b20f6047961d5e9d0e6f0fed9f3c65c8efd992b2 [3/10] xfs: AIL doesn't need manual pushing
:::::: branch date: 33 hours ago
:::::: commit date: 34 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406140058.5Rh7v9Fh-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/libxfs/xfs_defer.c: xfs_trans_priv.h is included more than once.

vim +15 fs/xfs/libxfs/xfs_defer.c

  > 15	#include "xfs_trans_priv.h"
    16	#include "xfs_buf_item.h"
    17	#include "xfs_inode.h"
    18	#include "xfs_inode_item.h"
    19	#include "xfs_trace.h"
    20	#include "xfs_icache.h"
    21	#include "xfs_log.h"
    22	#include "xfs_log_priv.h"
    23	#include "xfs_rmap.h"
    24	#include "xfs_refcount.h"
    25	#include "xfs_bmap.h"
    26	#include "xfs_alloc.h"
    27	#include "xfs_buf.h"
    28	#include "xfs_da_format.h"
    29	#include "xfs_da_btree.h"
    30	#include "xfs_attr.h"
  > 31	#include "xfs_trans_priv.h"
    32	#include "xfs_exchmaps.h"
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
