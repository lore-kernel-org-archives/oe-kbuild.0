Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE474152797
	for <oe-kbuild@lists.linux.dev>; Thu,  2 May 2024 07:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714635035; cv=none; b=hqTCp7KCz9XfDs2D8ORfu0Fpk+8lOk/nSmEROO1UYGEBqBexy6wZYsH86n6RXjPJsCZnLDVpjM8w5NbFFwMUHTExyRTLtELNHLVd81Y8JSuJmtSWJB1Zu5iH8+yhbDK5km21B4IYy2FT8NGJZD8Odt0Mjj1W0wTexTVnr2Ne2aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714635035; c=relaxed/simple;
	bh=kHEpTf0Zj64rMPboFCcaK3YwjZTZ5wM7COCy4IRV9Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JUxsLhEO4W+7milHMq2VVl+AO6ugiiayJ+p6IMD1nrSLvqYdiFhu83MmPDHrn78KmipoUbIOrJXA41ex9dyIEM1IibdL6Zv+OmwPf9owJyVJUJ40iTxLJr0Uy8IlMi8oPjPHYkdqK84APmbfM2bkCbcF53YcOYRgZ0TqJSeySwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YsQXdsar; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YsQXdsar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714635034; x=1746171034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kHEpTf0Zj64rMPboFCcaK3YwjZTZ5wM7COCy4IRV9Ik=;
  b=YsQXdsarWOTpRptjeKaM48d9o0kifg9XXlvX3VNTnxYsrnpWA893qO3O
   vNWvwVczaGjmX7aUvlPlnNjPuXWijhiGYGcJx7RygFl3gA4fKbr14X5JQ
   EDC6QfziRDfQuKqOaPO6bBQlRFuMdW0XiP3r6nkzJCyU9gh32LrwTeJqe
   xTQ/4942kqsym5ZK0tpBDGfaj340PZDUPrikSYuNwuB8ZjKyM+2ML51mF
   LgU6oRNdos/pozoxNBIgFIqlR+/IEMf2SRNfdXtbqgWUcZdKFFSnEVi29
   pnu08jlXUjmx/mPasm3XFY617Bovb21Kd7w50Xv9xfTJMjPJkPXP3Ob0H
   g==;
X-CSE-ConnectionGUID: D4ykHn8qTU66HTS68e6VpQ==
X-CSE-MsgGUID: x96QoKuaRQOYkmZdIGfTIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="21538066"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="21538066"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 00:30:33 -0700
X-CSE-ConnectionGUID: 1bZhHDNCR8eQ4twv8zafrA==
X-CSE-MsgGUID: 1KC+HLKxRCOmvPgqkzi8GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="31513638"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 May 2024 00:30:32 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2Qth-000AVE-2A;
	Thu, 02 May 2024 07:30:29 +0000
Date: Thu, 2 May 2024 15:30:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [coresight:next 26/26]
 drivers/hwtracing/coresight/coresight-tmc-core.c: linux/acpi.h is included
 more than once.
Message-ID: <202405021512.LWPwzJtX-lkp@intel.com>
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
TO: Anshuman Khandual <anshuman.khandual@arm.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>
CC: James Clark <james.clark@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git next
head:   8877ef45ef9ec281849870d88039f8dc84cde774
commit: 8877ef45ef9ec281849870d88039f8dc84cde774 [26/26] coresight: tmc: Enable SG capability on ACPI based SoC-400 TMC ETR devices
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405021512.LWPwzJtX-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/hwtracing/coresight/coresight-tmc-core.c: linux/acpi.h is included more than once.

vim +7 drivers/hwtracing/coresight/coresight-tmc-core.c

   > 7	#include <linux/acpi.h>
     8	#include <linux/kernel.h>
     9	#include <linux/init.h>
    10	#include <linux/types.h>
    11	#include <linux/device.h>
    12	#include <linux/idr.h>
    13	#include <linux/io.h>
    14	#include <linux/iommu.h>
    15	#include <linux/err.h>
    16	#include <linux/fs.h>
    17	#include <linux/miscdevice.h>
    18	#include <linux/mutex.h>
    19	#include <linux/property.h>
    20	#include <linux/uaccess.h>
    21	#include <linux/slab.h>
    22	#include <linux/dma-mapping.h>
    23	#include <linux/spinlock.h>
    24	#include <linux/pm_runtime.h>
    25	#include <linux/of.h>
    26	#include <linux/coresight.h>
    27	#include <linux/amba/bus.h>
    28	#include <linux/platform_device.h>
  > 29	#include <linux/acpi.h>
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
