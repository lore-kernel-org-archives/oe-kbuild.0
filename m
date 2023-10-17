Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2582B450F9
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Oct 2023 16:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SRkzPoM9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697558803; x=1729094803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sHLNyPXjOW2NcYZM6lYcaOFfo9YgxW+2MORIP9r0KHY=;
  b=SRkzPoM95SqwtTMjiA4vHAK4/aHJmCeDdqEEVkPp4JaSMeoq0dIMXywt
   /w4jRzfr30MCNUixOcDVF+tnqLlZviUlJOE7zuRtUnPVBtSBxPf8ua+zL
   HqXcfl8xtmTlsKMinDg+UOX9qLpxkLofyh9q8Eka7CKyR4Ua5h7CFd/Sb
   Rji4ErJbR0GgMGnFOdZM12cfW66h/+iUcUIVW8gX0bk7VIqrw+DMu8w9e
   Ig92rn+KgDseXqV2nyIvNKES2QbNacpXloKVadraXCjP7aGG/lOuXdLRs
   n3LE4vQpmfMniaLPNYON3Qs6URQdnVFdw4A1TR0+sWG3nP3r8D6QyFbnT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="365166721"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="365166721"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 09:06:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="759864104"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="759864104"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 17 Oct 2023 09:06:41 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsmac-0009mr-1h;
	Tue, 17 Oct 2023 16:06:38 +0000
Date: Wed, 18 Oct 2023 00:06:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [vishal:vv/kmem_memmap 9/10] mm/memory_hotplug.c:2222:47-53: ERROR:
 reference preceded by free on line 2227
Message-ID: <202310172338.PnRN2B8y-lkp@intel.com>
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
TO: Vishal Verma <vishal.l.verma@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vishal/linux.git vv/kmem_memmap
head:   f5df6ac59f4892cfe6652e6ea6ed4a215c876167
commit: 9ee1af799da9d50227164305de8427a973e6c9dc [9/10] mm/memory_hotplug: split memmap_on_memory requests across memblocks
:::::: branch date: 11 hours ago
:::::: commit date: 22 hours ago
config: x86_64-randconfig-103-20231017 (https://download.01.org/0day-ci/archive/20231017/202310172338.PnRN2B8y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310172338.PnRN2B8y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202310172338.PnRN2B8y-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/memory_hotplug.c:2222:47-53: ERROR: reference preceded by free on line 2227

vim +2222 mm/memory_hotplug.c

60a5a19e7419ba0 Tang Chen         2013-02-22  2189  
9ee1af799da9d50 Vishal Verma      2023-08-01  2190  static void __ref remove_memory_blocks_and_altmaps(u64 start, u64 size)
bbc76be67c2c0c1 Wen Congyang      2013-02-22  2191  {
9ee1af799da9d50 Vishal Verma      2023-08-01  2192  	unsigned long memblock_size = memory_block_size_bytes();
25b5b1a0646c3d3 Aneesh Kumar K.V  2023-08-08  2193  	struct vmem_altmap *altmap = NULL;
9ee1af799da9d50 Vishal Verma      2023-08-01  2194  	struct memory_block *mem;
9ee1af799da9d50 Vishal Verma      2023-08-01  2195  	u64 cur_start;
9ee1af799da9d50 Vishal Verma      2023-08-01  2196  	int rc;
6677e3eaf4d78ab Yasuaki Ishimatsu 2013-02-22  2197  
a08a2ae3461383c Oscar Salvador    2021-05-04  2198  	/*
9ee1af799da9d50 Vishal Verma      2023-08-01  2199  	 * For memmap_on_memory, the altmaps could have been added on
9ee1af799da9d50 Vishal Verma      2023-08-01  2200  	 * a per-memblock basis. Loop through the entire range if so,
9ee1af799da9d50 Vishal Verma      2023-08-01  2201  	 * and remove each memblock and its altmap.
a08a2ae3461383c Oscar Salvador    2021-05-04  2202  	 */
9ee1af799da9d50 Vishal Verma      2023-08-01  2203  	for (cur_start = start; cur_start < start + size;
9ee1af799da9d50 Vishal Verma      2023-08-01  2204  	     cur_start += memblock_size) {
9ee1af799da9d50 Vishal Verma      2023-08-01  2205  		rc = walk_memory_blocks(cur_start, memblock_size, &mem,
9ee1af799da9d50 Vishal Verma      2023-08-01  2206  					test_has_altmap_cb);
25b5b1a0646c3d3 Aneesh Kumar K.V  2023-08-08  2207  		if (rc) {
25b5b1a0646c3d3 Aneesh Kumar K.V  2023-08-08  2208  			altmap = mem->altmap;
a08a2ae3461383c Oscar Salvador    2021-05-04  2209  			/*
25b5b1a0646c3d3 Aneesh Kumar K.V  2023-08-08  2210  			 * Mark altmap NULL so that we can add a debug
25b5b1a0646c3d3 Aneesh Kumar K.V  2023-08-08  2211  			 * check on memblock free.
a08a2ae3461383c Oscar Salvador    2021-05-04  2212  			 */
25b5b1a0646c3d3 Aneesh Kumar K.V  2023-08-08  2213  			mem->altmap = NULL;
a08a2ae3461383c Oscar Salvador    2021-05-04  2214  		}
4c4b7f9ba9486c5 David Hildenbrand 2019-07-18  2215  
f1037ec0cc8ac1a Dan Williams      2020-01-30  2216  		/*
f1037ec0cc8ac1a Dan Williams      2020-01-30  2217  		 * Memory block device removal under the device_hotplug_lock is
f1037ec0cc8ac1a Dan Williams      2020-01-30  2218  		 * a barrier against racing online attempts.
f1037ec0cc8ac1a Dan Williams      2020-01-30  2219  		 */
9ee1af799da9d50 Vishal Verma      2023-08-01  2220  		remove_memory_block_devices(cur_start, memblock_size);
f1037ec0cc8ac1a Dan Williams      2020-01-30  2221  
9ee1af799da9d50 Vishal Verma      2023-08-01 @2222  		arch_remove_memory(cur_start, memblock_size, altmap);
52219aeaf2dc6f7 David Hildenbrand 2020-06-04  2223  
25b5b1a0646c3d3 Aneesh Kumar K.V  2023-08-08  2224  		/* Verify that all vmemmap pages have actually been freed. */
25b5b1a0646c3d3 Aneesh Kumar K.V  2023-08-08  2225  		if (altmap) {
25b5b1a0646c3d3 Aneesh Kumar K.V  2023-08-08  2226  			WARN(altmap->alloc, "Altmap not fully unmapped");
25b5b1a0646c3d3 Aneesh Kumar K.V  2023-08-08 @2227  			kfree(altmap);
25b5b1a0646c3d3 Aneesh Kumar K.V  2023-08-08  2228  		}
9ee1af799da9d50 Vishal Verma      2023-08-01  2229  	}
9ee1af799da9d50 Vishal Verma      2023-08-01  2230  }
9ee1af799da9d50 Vishal Verma      2023-08-01  2231  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
