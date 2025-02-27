Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F6E26E94F
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Feb 2025 15:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740670940; cv=none; b=IAaeKOfyldG8vwZPC1Rn0jR2LZTLEktwsIqQFmg9WxU/2fSJK6iRB46ioWdvKvqVQHwr4QkY58qA0rWyCIGjBQG7cbbA9PbRQw818R4q1+pzUUVMeA97j4cgag8B8Y/pXq5fdi1AKkOmZ+rKsgi9L0SuoMB2O/QYupj81X3O+vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740670940; c=relaxed/simple;
	bh=ITrMbnsWm63k5Ymf4gP5q1SW7YqWfaBT70enX4GdxiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ORTGWN10WVKB3kFJhcxnoTb9pztACDk6uLBUtS6BkwFmmjkuksEWSlivyiVk0b668i6VGO2J/Cmyk69pKba+/JjwlwFPe/OSZdk+bnzTGelZwlu0rA9cT+xrRVag5d+wdRDOePNs/TtbfRQcTGGAifbY2oPr2aAbGtnlD9GL2bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OohrlZZD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OohrlZZD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740670938; x=1772206938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ITrMbnsWm63k5Ymf4gP5q1SW7YqWfaBT70enX4GdxiU=;
  b=OohrlZZDSeRIfogEdSq8MYu0qWHRFNjLHCDl2mA2jPe26+5AtEIlI+U+
   5hS5rOfOoiimK/3ciHfxNQ1yP8YasXwLdLTpoemMld8YmxVkoLTwE2Xfh
   BYGQ7T5eKFADvlfVO4sHuSRWcYEfg+eruM5PWmwubXITpKXRqEqSKeGop
   kMrzHGnmWF4WiXdKI85Po6HZer4H1lQCmb5dLUwuw15pVxfGoZjxSbSW3
   06atxcMwdtvs1FrTy+X569P6BgdDd0xM1i6ajN8gCxYK8ABAqIn49tVv5
   ZqN2alHDeRK8EBVFeyy9aPFo/T20j3IPcVVQ3C6ffBlbdyb2GdaX4Z1rL
   g==;
X-CSE-ConnectionGUID: RsyTW895QT+lAYxGgIpTwA==
X-CSE-MsgGUID: 0Wbyv0n4R/GEnUsb2TvRcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41271662"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="41271662"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 07:42:17 -0800
X-CSE-ConnectionGUID: huFVw4iWROOH9SbbpsZHEQ==
X-CSE-MsgGUID: FC27dMTLSkipVkWIGqY3Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121184124"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 27 Feb 2025 07:42:16 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tng1d-000DbM-38;
	Thu, 27 Feb 2025 15:42:13 +0000
Date: Thu, 27 Feb 2025 23:42:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:pr/59 1/1] fs/btrfs/super.c: backref.h is included more
 than once.
Message-ID: <202502272332.m24coTUx-lkp@intel.com>
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

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: 00142756e1f8015d2f8ce96532d156689db7e448 [1/1] btrfs: backref, add tracepoints for prelim_ref insertion and merging
:::::: branch date: 10 days ago
:::::: commit date: 8 years ago
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502272332.m24coTUx-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/btrfs/super.c: backref.h is included more than once.

vim +60 fs/btrfs/super.c

  > 60	#include "backref.h"
    61	#include "tests/btrfs-tests.h"
    62	
    63	#include "qgroup.h"
  > 64	#include "backref.h"
    65	#define CREATE_TRACE_POINTS
    66	#include <trace/events/btrfs.h>
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
