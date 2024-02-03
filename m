Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18711842
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Feb 2024 10:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706957815; cv=none; b=tOAV2IXCNHh5+iDLBYc237xQd+RPd2GrxfRK0sWub07TtjNY3yrEphqVCuYKBy2uypwZz2YnUMX5qNSkr7yJWD1fDsdr/BRR7HdBEFE8v9HMwv51hDLTEiDjrp/bYyjJL/vJrgWuQ8YWFqDHAXYJh1lIiAaqb25sXrVeZEWuvYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706957815; c=relaxed/simple;
	bh=PooVIpl3i4ewjNhRyzebt91q/c3leHh8kRxIM4j5b3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i8oK4gG0u8mscl5ntHQXhmUp5e7T205NbGogMPedO0Ri3ZS08UmWTaqsuhq6if5pz1R2BYFtrSoeuZ2kiPMzZB6QPjBymDDwPEXfHbExbFd+2wsHBXuZwgo9qHoTehaASY0yfRFL6csT2zdf7n9semmkaTixXwTgekPRnOsZvsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QCUl7M9q; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QCUl7M9q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706957814; x=1738493814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PooVIpl3i4ewjNhRyzebt91q/c3leHh8kRxIM4j5b3k=;
  b=QCUl7M9qR8gf+cFHx1ssoSdq9/jQB0+hIZB8jXGYTUV3jvCdlyLO5bcz
   0bNpqLNJVM1eFxzUrhknp7PfZ/PfgW721kIVwTthdFdR4zannYdw5w3e+
   gtbzduKF8lrZBJoiegFVqjmNPJFQmcBTxZv4DE7bXlnWHV4qq7xbAnJYP
   dCkgGafr5juMxNt4o4oJr3xtPEsbXUbmvPDGgUvUK1euNSZ4ZcI/wDZW+
   H1ur/DoZuvpUNszAL+zXsVEb8n8AvMFpjwnRtKm58pSbEZfafeTlPznPB
   QdS8eFYZmkshFjnJ2inoNl+DekIUD5lufwQVPZlX/RrkvZcPMmSfwClQ0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="4136564"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="4136564"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 02:56:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="823440020"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="823440020"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 03 Feb 2024 02:56:52 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWDhZ-0004wM-2Y;
	Sat, 03 Feb 2024 10:56:49 +0000
Date: Sat, 3 Feb 2024 18:56:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:5.4-main 2083/26476]
 utils/cryptodev/cryptodev-linux/lib/benchmark.h: sys/time.h is included more
 than once.
Message-ID: <202402031827.xqMghzoI-lkp@intel.com>
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
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-main
head:   645dca86a686ddae272b209432af075ecc0185c5
commit: c3b89e4625bb76475e992292ee89d37d48a0e748 [2083/26476] utils: add cryptodev 1.10
:::::: branch date: 8 days ago
:::::: commit date: 4 years ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402031827.xqMghzoI-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> utils/cryptodev/cryptodev-linux/lib/benchmark.h: sys/time.h is included more than once.

vim +1 utils/cryptodev/cryptodev-linux/lib/benchmark.h

   > 1	#include <sys/time.h>
     2	#include <time.h>
   > 3	#include <sys/time.h>
     4	#include <signal.h>
     5	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
