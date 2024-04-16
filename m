Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A251815AF6
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Apr 2024 03:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713238949; cv=none; b=AhCAnQjKICoDs8AUCQzosFOuVjrLf6qXB7yl7zHmw4s4Ps0ICBnJjYBDIuvQm6P1RDjFmsJBKJoGl4hU6kmeosqAJEYAu75WmH3L8bIJ/WjhTykZccSTnF83Fg4dJrB5UlwNvPAW7fH/t8pVEi/I1RBBsE+GKKZ1A3NCCsj5uNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713238949; c=relaxed/simple;
	bh=Z4qhxSVOx2SCYz7Q2lh+DlB5nM0eTJzk+RT/XvDSiNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZAuP2cmagMaU1chM9DLnV1QPmOhFRSgSFjn7yLyBauKaBNGldeoRPZKqM8VHOdQgtmZlS+YTDWTgNm/AnotpOxVfdCGyms/d3DqSc6VRebgWQmemfeHg4ebQGbBLzcbKZM/q9cKDM2pUIlxxnmhe+fdCRr9lOsEnxScClafd8eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PZdq0T7l; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PZdq0T7l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713238948; x=1744774948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z4qhxSVOx2SCYz7Q2lh+DlB5nM0eTJzk+RT/XvDSiNM=;
  b=PZdq0T7lfnzTiXMMCtEwUvgpLPjq9o6Nenr3xNcdI2J8ziZCbazkhWpf
   t1EgnujsuK+X8bLYuJp4yuKqxfor86V0kygfjoNa/sZkCDiBq+UlFW4LC
   G9HsuQI+PHEf3qMD71CLr67zSeXz6tuaqqDoNY6rY4zqrlyNUuCnsnbqG
   WevZ8uaBQXit7EPeJ2yTBXuvchxzORoqPX2QD6Jr7Qm51v6R7NhBGxWl5
   tr4ioMD+ySObmDv/5Qv5CzY5Wi8pVO728MI9ES2uJkwZTqt8/3lZgyBXq
   nkSrp4vXPCOlcVUDVni3j7j1VR5LxM/HjELifVo8mMG0gvUZqLTQVe5x/
   g==;
X-CSE-ConnectionGUID: 6nBNGgoOQZ+l5IXeZ/RVfw==
X-CSE-MsgGUID: Dgw+dDjnQWKYTewIcjauvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="20046518"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="20046518"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 20:42:27 -0700
X-CSE-ConnectionGUID: 8D6guX9cQIOUl5AY2rY1dQ==
X-CSE-MsgGUID: 5tFlStJtRJSqHjnnErjBDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="26686373"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 15 Apr 2024 20:42:27 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwZiC-0004vA-0b;
	Tue, 16 Apr 2024 03:42:24 +0000
Date: Tue, 16 Apr 2024 11:41:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tobetter:odroid-6.6.y 41/59] drivers/char/aml-gpiomem.c: linux/of.h
 is included more than once.
Message-ID: <202404161112.tinPmErL-lkp@intel.com>
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
TO: Steve Jeong <how2soft@gmail.com>
CC: Dongjin Kim <tobetter@gmail.com>

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   5aa2a46913f3b979e8694a55b4fd496799428fd6
commit: 5e7a0fcf547e3b4f54e37972019abef8e78192a7 [41/59] ODROID-N2/C4: char: Add /dev/gpiomem device
:::::: branch date: 20 hours ago
:::::: commit date: 5 weeks ago
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404161112.tinPmErL-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/char/aml-gpiomem.c: linux/of.h is included more than once.

vim +49 drivers/char/aml-gpiomem.c

  > 49	#include <linux/of.h>
    50	#include <linux/platform_device.h>
    51	#include <linux/mm.h>
    52	#include <linux/slab.h>
    53	#include <linux/cdev.h>
    54	#include <linux/pagemap.h>
    55	#include <linux/io.h>
  > 56	#include <linux/of.h>
    57	#include <asm/pgtable.h>
    58	#include <asm/io.h>
    59	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
