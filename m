Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2772137B
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Sep 2023 15:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695657572; x=1727193572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mVfjLOUAWu62ZUHXvwTTrTk3SVgHyTm5S3ClXiUa7DY=;
  b=eam4SpeSIZsGT03YBNZsyzAVrq+eLDJvWSF0tFIRT6jxqc38F2IX5Rpj
   f2HDActL6q/xuaWlLhww0VDJuM8OSpvpUibylpI7/VnJyLnRBmMmLf6Jd
   mexFDHw8lXemQP+zEotQHa8FPEM+BPV0YjrpQl9H3FCRQNFcs6hJzlBw1
   cu8tjwtBJWWCs+K9X9+U4g/rQ3EBUeKGgI25bcyZi6kfiXIUNIaVxjgQI
   qhUSRy4x06tnPiWgYJEFRj/tCSYbFAH6DNerEgJDf+rhVkMRpJJl+UyUP
   HOYDJnwqDivPk3vgR81CSr7hcE5d8+F3Jys5Ah45Ow5jNtvhJkz+YGuD1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="385125314"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="385125314"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 08:59:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="748386890"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="748386890"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 25 Sep 2023 08:59:30 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qknzc-0001jR-14;
	Mon, 25 Sep 2023 15:59:28 +0000
Date: Mon, 25 Sep 2023 23:58:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 4/4] vfio/nvgpu: register device memory for poison
 handling
Message-ID: <202309252319.hQ7rHJTJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230920140210.12663-5-ankita@nvidia.com>
References: <20230920140210.12663-5-ankita@nvidia.com>
TO: ankita@nvidia.com
TO: ankita@nvidia.com
TO: jgg@nvidia.com
TO: alex.williamson@redhat.com
TO: akpm@linux-foundation.org
TO: tony.luck@intel.com
TO: bp@alien8.de
TO: naoya.horiguchi@nec.com
TO: linmiaohe@huawei.com
CC: aniketa@nvidia.com
CC: cjia@nvidia.com
CC: kwankhede@nvidia.com
CC: targupta@nvidia.com
CC: vsethi@nvidia.com
CC: acurrid@nvidia.com
CC: anuaggarwal@nvidia.com
CC: linux-kernel@vger.kernel.org
CC: linux-mm@kvack.org
CC: linux-edac@vger.kernel.org
CC: kvm@vger.kernel.org

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on awilliam-vfio/for-linus]
[also build test WARNING on kvm/queue rafael-pm/linux-next linus/master]
[cannot apply to akpm-mm/mm-everything awilliam-vfio/next kvm/linux-next next-20230925]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ankita-nvidia-com/mm-handle-poisoning-of-pfn-without-struct-pages/20230920-220626
base:   https://github.com/awilliam/linux-vfio.git for-linus
patch link:    https://lore.kernel.org/r/20230920140210.12663-5-ankita%40nvidia.com
patch subject: [PATCH v1 4/4] vfio/nvgpu: register device memory for poison handling
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: powerpc64-allmodconfig (https://download.01.org/0day-ci/archive/20230925/202309252319.hQ7rHJTJ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309252319.hQ7rHJTJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309252319.hQ7rHJTJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/vfio/pci/nvgrace-gpu/main.c:27:6: warning: no previous prototype for function 'nvgrace_gpu_vfio_pci_pfn_memory_failure' [-Wmissing-prototypes]
      27 | void nvgrace_gpu_vfio_pci_pfn_memory_failure(struct pfn_address_space *pfn_space,
         |      ^
   drivers/vfio/pci/nvgrace-gpu/main.c:27:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      27 | void nvgrace_gpu_vfio_pci_pfn_memory_failure(struct pfn_address_space *pfn_space,
         | ^
         | static 
   drivers/vfio/pci/nvgrace-gpu/main.c:300:9: warning: no previous prototype for function 'nvgrace_gpu_read_mem' [-Wmissing-prototypes]
     300 | ssize_t nvgrace_gpu_read_mem(void __user *buf, size_t count, loff_t *ppos,
         |         ^
   drivers/vfio/pci/nvgrace-gpu/main.c:300:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     300 | ssize_t nvgrace_gpu_read_mem(void __user *buf, size_t count, loff_t *ppos,
         | ^
         | static 
   drivers/vfio/pci/nvgrace-gpu/main.c:376:9: warning: no previous prototype for function 'nvgrace_gpu_write_mem' [-Wmissing-prototypes]
     376 | ssize_t nvgrace_gpu_write_mem(size_t count, loff_t *ppos, const void __user *buf,
         |         ^
   drivers/vfio/pci/nvgrace-gpu/main.c:376:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     376 | ssize_t nvgrace_gpu_write_mem(size_t count, loff_t *ppos, const void __user *buf,
         | ^
         | static 
   3 warnings generated.


vim +/nvgrace_gpu_vfio_pci_pfn_memory_failure +27 drivers/vfio/pci/nvgrace-gpu/main.c

b59e9d949a79e1 Ankit Agrawal 2023-09-14  25  
5f3746d8629350 Ankit Agrawal 2023-09-20  26  #ifdef CONFIG_MEMORY_FAILURE
5f3746d8629350 Ankit Agrawal 2023-09-20 @27  void nvgrace_gpu_vfio_pci_pfn_memory_failure(struct pfn_address_space *pfn_space,
5f3746d8629350 Ankit Agrawal 2023-09-20  28  		unsigned long pfn)
5f3746d8629350 Ankit Agrawal 2023-09-20  29  {
5f3746d8629350 Ankit Agrawal 2023-09-20  30  	struct nvgrace_gpu_vfio_pci_core_device *nvdev = container_of(
5f3746d8629350 Ankit Agrawal 2023-09-20  31  		pfn_space, struct nvgrace_gpu_vfio_pci_core_device, pfn_address_space);
5f3746d8629350 Ankit Agrawal 2023-09-20  32  	unsigned long mem_offset = pfn - pfn_space->node.start;
5f3746d8629350 Ankit Agrawal 2023-09-20  33  
5f3746d8629350 Ankit Agrawal 2023-09-20  34  	if (mem_offset >= nvdev->memlength)
5f3746d8629350 Ankit Agrawal 2023-09-20  35  		return;
5f3746d8629350 Ankit Agrawal 2023-09-20  36  
5f3746d8629350 Ankit Agrawal 2023-09-20  37  	/*
5f3746d8629350 Ankit Agrawal 2023-09-20  38  	 * MM has called to notify a poisoned page. Track that in the bitmap.
5f3746d8629350 Ankit Agrawal 2023-09-20  39  	 */
5f3746d8629350 Ankit Agrawal 2023-09-20  40  	__set_bit(mem_offset, nvdev->pfn_bitmap);
5f3746d8629350 Ankit Agrawal 2023-09-20  41  }
5f3746d8629350 Ankit Agrawal 2023-09-20  42  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
