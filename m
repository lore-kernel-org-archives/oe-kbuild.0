Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3307E6
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Mar 2023 01:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678411006; x=1709947006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uRfK2kLi24XtIYyJQZxxJ1G7IYJQp0LJ1a0/9CmT7BI=;
  b=ILsXJ+MeHH/7nAZuP16go/WCbZE+HqJST+Ktq+fwzzdLozisWMpsfI7k
   bb9mnPeaE7/fYjiIWmXZT8Ovmf5WFAlUF1l1TeUUwWbV9ofF4HEEQQsWp
   ysedLViqmy5rmWpoF7oby+1cYIOF3ILQAe6wfP0PcakYT5c4SpSmfA2cx
   5Yy6TRGl914tMgWKHd+Ni3RCsYK/2tBpXct8FbZDCx+sdQRpaLPq/GSp5
   +u0dRKtHnnNcuZX98waqptT1IoIF1u2/QdlFFmqVKrf4PdxBs8ApzH2Du
   yvXyUaPw7CbYtawVQcohMP3an9x2hwxoduPRyksZJlITfzg5K8Gzzae2i
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="324967583"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="324967583"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 17:16:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="677623206"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; 
   d="scan'208";a="677623206"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Mar 2023 17:16:45 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paRNE-0003L1-1T;
	Fri, 10 Mar 2023 01:16:44 +0000
Date: Fri, 10 Mar 2023 09:15:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/intel/iommu.c:230 clear_context_copied() warn:
 clear_bit() takes a bit number
Message-ID: <202303100917.Wqpd7dLd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Lu Baolu <baolu.lu@linux.intel.com>
CC: Joerg Roedel <jroedel@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   44889ba56cbb3d51154660ccd15818bc77276696
commit: 0c5f6c0d8201a809a6585b07b6263e9db2c874a3 iommu/vt-d: Fix kdump kernels boot failure with scalable mode
date:   6 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 months ago
config: ia64-randconfig-m041-20230308 (https://download.01.org/0day-ci/archive/20230310/202303100917.Wqpd7dLd-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303100917.Wqpd7dLd-lkp@intel.com/

New smatch warnings:
drivers/iommu/intel/iommu.c:230 clear_context_copied() warn: clear_bit() takes a bit number
drivers/iommu/intel/iommu.c:224 set_context_copied() warn: set_bit() takes a bit number

Old smatch warnings:
drivers/iommu/intel/iommu.c:731 device_to_iommu() error: we previously assumed 'pdev' could be null (see line 704)
arch/ia64/include/asm/timex.h:39 get_cycles() error: uninitialized symbol 'ia64_intri_res'.
drivers/iommu/intel/iommu.c:3422 intel_iommu_add() warn: missing unwind goto?

vim +230 drivers/iommu/intel/iommu.c

0c5f6c0d8201a8 Lu Baolu 2022-08-23  220  
0c5f6c0d8201a8 Lu Baolu 2022-08-23  221  static inline void
0c5f6c0d8201a8 Lu Baolu 2022-08-23  222  set_context_copied(struct intel_iommu *iommu, u8 bus, u8 devfn)
0c5f6c0d8201a8 Lu Baolu 2022-08-23  223  {
0c5f6c0d8201a8 Lu Baolu 2022-08-23 @224  	set_bit(((long)bus << 8) | devfn, iommu->copied_tables);
0c5f6c0d8201a8 Lu Baolu 2022-08-23  225  }
0c5f6c0d8201a8 Lu Baolu 2022-08-23  226  
0c5f6c0d8201a8 Lu Baolu 2022-08-23  227  static inline void
0c5f6c0d8201a8 Lu Baolu 2022-08-23  228  clear_context_copied(struct intel_iommu *iommu, u8 bus, u8 devfn)
0c5f6c0d8201a8 Lu Baolu 2022-08-23  229  {
0c5f6c0d8201a8 Lu Baolu 2022-08-23 @230  	clear_bit(((long)bus << 8) | devfn, iommu->copied_tables);
0c5f6c0d8201a8 Lu Baolu 2022-08-23  231  }
0c5f6c0d8201a8 Lu Baolu 2022-08-23  232  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
