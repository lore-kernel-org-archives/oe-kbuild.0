Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2873DB8F
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Nov 2023 23:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/5Xk4z+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700869210; x=1732405210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/qcOPg5aQuZtLIJgGWW6jI6AsbxZCNF1DXClgrmViXo=;
  b=R/5Xk4z+UBQiorRbrT7Iom0yYOGcxpsGPZIb0OqIqrL27e3reTQjD74K
   KWA/zjDMucWu6T5rYcn4wLsrUW9Txf+bk2t8tmsD/HHP3UOjKr742lrpo
   nVvuT6ajNovPpt9cJcrGnokeVu4qD85H7iFnE0VAMiRSI7u9kvfJ5R9Dk
   7SI+zwDzIDXkfBJ7UdJb9nlmfLwSN4f87oqgbqIvGC5+NIY9d2c3dacjU
   g/GhxXqJVmTDK7q1CCZOLGxO7vHPZZkX8WzdfHk+6gv8m91qBhwr63BPF
   aV/MD84K8gMNQt4uNOkUMJmKn7qaQRqNv8bh77OaxJ/R/NmUdyshQAU8j
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="377526713"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="377526713"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 15:40:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="761063114"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="761063114"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Nov 2023 15:40:08 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6fmI-0003OT-28;
	Fri, 24 Nov 2023 23:40:06 +0000
Date: Sat, 25 Nov 2023 07:38:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC KERNEL PATCH v2 3/3] xen/privcmd: Add new syscall to get
 gsi from irq
Message-ID: <202311250440.DbUQXNLK-lkp@intel.com>
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
In-Reply-To: <20231124103123.3263471-4-Jiqian.Chen@amd.com>
References: <20231124103123.3263471-4-Jiqian.Chen@amd.com>
TO: Jiqian Chen <Jiqian.Chen@amd.com>

Hi Jiqian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.7-rc1]
[cannot apply to xen-tip/linux-next tip/irq/core tip/x86/core linus/master v6.7-rc2 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiqian-Chen/xen-pci-Add-xen_reset_device_state-function/20231124-183607
base:   v6.7-rc1
patch link:    https://lore.kernel.org/r/20231124103123.3263471-4-Jiqian.Chen%40amd.com
patch subject: [RFC KERNEL PATCH v2 3/3] xen/privcmd: Add new syscall to get gsi from irq
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231125/202311250440.DbUQXNLK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311250440.DbUQXNLK-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/xen/privcmd.c: xen/events.h is included more than once.

vim +38 drivers/xen/privcmd.c

    36	
    37	#include <xen/xen.h>
  > 38	#include <xen/events.h>
    39	#include <xen/privcmd.h>
    40	#include <xen/interface/xen.h>
    41	#include <xen/interface/memory.h>
    42	#include <xen/interface/hvm/dm_op.h>
    43	#include <xen/interface/hvm/ioreq.h>
    44	#include <xen/features.h>
    45	#include <xen/page.h>
    46	#include <xen/xen-ops.h>
    47	#include <xen/balloon.h>
  > 48	#include <xen/events.h>
    49	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
