Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B1D100CA
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jun 2023 16:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687796117; x=1719332117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M5UyJMRKhfvvlT2+pcBn2Tpj5odSK2s94s2OfXFMkMs=;
  b=lI9B6m/X8WGn4ivixLNZ2Lx5QKWSTAoJfKSei9bnQk4LNx/DC4ORLWO9
   5He/tYzXh/193SiWiSB2aVA1YfNJgLHW4LTU1UwUluVv6iY4lBj20Sz/9
   /JG7R9Fdt513doiYDSXLMjL6v7Rv/gIXb7okyhc8SXamMGxFLQcCEfwsr
   z7RGD83ddn9t27f7hXjAkP86WY/9ASNJK69BCZYBsZq0dPkxFeZwfuy0B
   koHX/ycBNxUjL5EWiVrM9fSDPjgN8CxFjVdgxbhIEAFeP+PYFRSm5c4nQ
   8qN3DKgyjJ8BUqhwRFsrW7iO4SV1L3B49flYhKJ/DmlaHzlfyXOpAH3Du
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="363859251"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="363859251"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2023 09:15:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="693511781"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="693511781"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 26 Jun 2023 09:15:15 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDorx-000Ao9-39;
	Mon, 26 Jun 2023 16:15:13 +0000
Date: Tue, 27 Jun 2023 00:15:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH 2/5] mm/hotplug: Allow architecture override for
 memmap on memory feature
Message-ID: <202306262350.UC4R8QlX-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230626102212.119919-3-aneesh.kumar@linux.ibm.com>
References: <20230626102212.119919-3-aneesh.kumar@linux.ibm.com>
TO: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>

Hi Aneesh,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on powerpc/fixes arm64/for-next/core linus/master v6.4]
[cannot apply to powerpc/next next-20230626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aneesh-Kumar-K-V/mm-hotplug-Embed-vmem_altmap-details-in-memory-block/20230626-182455
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230626102212.119919-3-aneesh.kumar%40linux.ibm.com
patch subject: [RFC PATCH 2/5] mm/hotplug: Allow architecture override for memmap on memory feature
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230626/202306262350.UC4R8QlX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230626/202306262350.UC4R8QlX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306262350.UC4R8QlX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory_hotplug.c:1298:22: warning: no previous prototype for 'memory_block_align_base' [-Wmissing-prototypes]
    1298 | unsigned __weak long memory_block_align_base(struct resource *res)
         |                      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/memory_block_align_base +1298 mm/memory_hotplug.c

46cd8a5f507fa9 Aneesh Kumar K.V 2023-06-26  1293  
46cd8a5f507fa9 Aneesh Kumar K.V 2023-06-26  1294  /*
46cd8a5f507fa9 Aneesh Kumar K.V 2023-06-26  1295   * Architectures may want to override the altmap reserve details based
46cd8a5f507fa9 Aneesh Kumar K.V 2023-06-26  1296   * on the alignment requirement for vmemmap mapping.
46cd8a5f507fa9 Aneesh Kumar K.V 2023-06-26  1297   */
46cd8a5f507fa9 Aneesh Kumar K.V 2023-06-26 @1298  unsigned __weak long memory_block_align_base(struct resource *res)
46cd8a5f507fa9 Aneesh Kumar K.V 2023-06-26  1299  {
46cd8a5f507fa9 Aneesh Kumar K.V 2023-06-26  1300  	return 0;
46cd8a5f507fa9 Aneesh Kumar K.V 2023-06-26  1301  }
46cd8a5f507fa9 Aneesh Kumar K.V 2023-06-26  1302  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
