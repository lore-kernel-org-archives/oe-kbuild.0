Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C665D7A13A
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Aug 2024 02:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723429009; cv=none; b=Vgq+oCVEsTBcagXajzBKCdkQBYww5x76OG66ojv5TFKGrXfarSJ3IFYVn2scM7xI/OdjIMmtaKxSVvjFttcJ1QDRSJB/QccU4Sr4cTeSkYw19+RHuvpuCKKzHGby18FeKpxJRTlr3da6nuYzn5c06oW64w7ZjLpAv73t6UTrUSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723429009; c=relaxed/simple;
	bh=YDb3geqnxf5aNLyfw151+IJx9JPqvEpS+4VB59U5fZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ni7Fi9MdNIj/kThw9aIVY4WOvyBa2FHSvI9fXRdTsiv383XHxK0DMmbeg04wgwYDtb8dwdUFP+QJ8/ggrR5G+l16yiwLwsPVsqiSMY0kC+fQ5gp241qfXoeKoMLo6sFpEwPQ++92tsQ711J/7a17jUT1htdSuvekqpNYDCtJR0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wep69sPO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wep69sPO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723429008; x=1754965008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YDb3geqnxf5aNLyfw151+IJx9JPqvEpS+4VB59U5fZM=;
  b=Wep69sPOxeKdxGOGHFJVviQh/PHeEGckBi/bRBBdGjmNOI2iNwCZ3iT5
   fCbbiYOfFibHlgDznL0l3tFIEGCIcX5CNp1YzowYhdrGqTBkhAuHZ+J4i
   BNsg29ugVu+vRFUECb3i47FI5rT5vF9bdTipze6cST4UZtmMdCOULEjdr
   oeIcTPETcNDVIzz4FEJ4/ZJnvGVs/ANES3J2tS0Q2R9LD60E8I9XNq76B
   X/6mWJpnlGbhQLl/WDYly48S1EOjG5gvKpK766PSWiHtZIinskFnmGPuf
   vu6DCwmub28139AFnWCOakopuVLqzB2D93YcCNGgsDu6cZLSR8vAsrm+W
   Q==;
X-CSE-ConnectionGUID: vWfTuF6DRwaCxTe9uy3M8g==
X-CSE-MsgGUID: 7zcwc2zASkG8oV5CZkB9Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="25290345"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="25290345"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 19:16:47 -0700
X-CSE-ConnectionGUID: mUOyd0ZbScGEohDAW7FPBQ==
X-CSE-MsgGUID: yvZwZVg+SS6iF6+0fszxNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="58359367"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 11 Aug 2024 19:16:46 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdKbs-000BJo-1b;
	Mon, 12 Aug 2024 02:16:37 +0000
Date: Mon, 12 Aug 2024 10:15:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hch-xfs:xfs-realtime-rmap-rebase 106/114] fs/xfs/scrub/repair.c:
 xfs_rtbitmap.h is included more than once.
Message-ID: <202408121059.u6Rj0r8Y-lkp@intel.com>
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

tree:   git://git.infradead.org/users/hch/xfs xfs-realtime-rmap-rebase
head:   d327a47f8c6326342d07986675e149353d5ea516
commit: 8e2ba6732c1c12f6876866642a506ee7c3d304d1 [106/114] xfs: online repair of realtime file bmaps
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408121059.u6Rj0r8Y-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/scrub/repair.c: xfs_rtbitmap.h is included more than once.

vim +24 fs/xfs/scrub/repair.c

  > 24	#include "xfs_rtbitmap.h"
    25	#include "xfs_extent_busy.h"
    26	#include "xfs_ag.h"
    27	#include "xfs_ag_resv.h"
    28	#include "xfs_quota.h"
    29	#include "xfs_qm.h"
    30	#include "xfs_defer.h"
    31	#include "xfs_errortag.h"
    32	#include "xfs_error.h"
    33	#include "xfs_reflink.h"
    34	#include "xfs_health.h"
    35	#include "xfs_buf_mem.h"
    36	#include "xfs_da_format.h"
    37	#include "xfs_da_btree.h"
    38	#include "xfs_attr.h"
    39	#include "xfs_dir2.h"
    40	#include "xfs_rtrmap_btree.h"
  > 41	#include "xfs_rtbitmap.h"
    42	#include "xfs_rtgroup.h"
    43	#include "scrub/scrub.h"
    44	#include "scrub/common.h"
    45	#include "scrub/trace.h"
    46	#include "scrub/repair.h"
    47	#include "scrub/bitmap.h"
    48	#include "scrub/stats.h"
    49	#include "scrub/xfile.h"
    50	#include "scrub/attr_repair.h"
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
