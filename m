Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1AD176226
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Jul 2024 10:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720002817; cv=none; b=Q0ParRYMiqCx7hDnUa85WoKhbeW0aZ6cn/AUdGm8KyNVdAloTpsae1TlaKlc4fV6WdX+vfnX+qUSHBWHOXHXlcN6BTCwmI9u2PP/sFt+2pP7H16uVBU+3Xer78ugzPoujGiXu38XN1SWqttvWfXO95Q0qXZgzz/UOOC/mXiCD6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720002817; c=relaxed/simple;
	bh=QB790Ye4QCGgYpGbn7dMG3eSvHHx+4RMZ6It3OQcEY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YbYMjuHZmHZrDjmx1VqTFKw0Dd4hHCmcSYJ5rTU1f/5ZDJNxXvtL24M7vtHG1IWl5+7Vswwi0gYGpzs+HNp7J7gspVqSioUqCOsh0YVyB/qUi2dQfDbBzSsWWlXyOApeaCT1zVMm34i+jRGzlQ773r2FcUtf8burWiazrnCikUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UQycTcj8; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UQycTcj8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720002816; x=1751538816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QB790Ye4QCGgYpGbn7dMG3eSvHHx+4RMZ6It3OQcEY4=;
  b=UQycTcj8CRo5AD0EntJsA6ykKwCvWFTTfrdNVoXiPRuAljhSm+o+41pq
   9RlA+32Krf+If/BEFO0Zd5oIhj3sAYmFLNxxkhujWn39wTOW3nYHQdI5m
   KGBmO01ppVpng0DjeBtXbQexBpTZOAms8AIX4ZYAc2LbG2+wggOe+s0VI
   VezAUMhX7PwVafAlW5BAY50W/Dx3MDFt7IAdhTp9Ex+5gPnkU0+uZ/HVP
   1xbcpqKeXABCw2E8BRF22B4FnE7ZTUOVsH0jpTUp3AWU/7zLTft/zYu8G
   5SplGTVTLQqpxr2y0f9AgdguvvojkX/Tos79l/e47w7pIebxCjzEYUB8Q
   w==;
X-CSE-ConnectionGUID: 3dW7xPoMS1KWMwBuHSl0HA==
X-CSE-MsgGUID: ZxN3gLkfSxG3GF9c5kxHvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="21034248"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="21034248"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 03:33:31 -0700
X-CSE-ConnectionGUID: JDQp8rqwRU2B9qFNyPIp9A==
X-CSE-MsgGUID: I9bonISyQ3+Og35WGYQQgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="46353472"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Jul 2024 03:33:29 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOxIl-000Pcw-0L;
	Wed, 03 Jul 2024 10:33:27 +0000
Date: Wed, 3 Jul 2024 18:32:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kdave-btrfs-devel:misc-next 162/168] fs/btrfs/zlib.c: btrfs_inode.h
 is included more than once.
Message-ID: <202407031830.0Cc62BAl-lkp@intel.com>
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
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   cce58514c6d3eb94c3c7f66ea49b1a9c396eadd5
commit: fb394c03512de252437f1ec525f4f7447ee44793 [162/168] btrfs: make compression path to be subpage compatible
:::::: branch date: 18 hours ago
:::::: commit date: 19 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407031830.0Cc62BAl-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/btrfs/zlib.c: btrfs_inode.h is included more than once.

vim +21 fs/btrfs/zlib.c

  > 21	#include "btrfs_inode.h"
    22	#include "compression.h"
  > 23	#include "btrfs_inode.h"
    24	#include "fs.h"
    25	#include "subpage.h"
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
