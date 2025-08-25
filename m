Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC291F4CBC
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Aug 2025 09:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756114976; cv=none; b=TEZJpwmOuFEV3h+GVYn70i9X0MpxEtFK3GbJ8jJKIFOeCzXtE4htMvasXsCZsnMF9kau4g1W6Zk/B3N5U5L+1nt7akYHh0soohOtP54U4ls8/OO0DXvmDtwLfBwctdhed+DobGysBD3Nc7HcXLBitNerYL00W7RJVGnwylgFfV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756114976; c=relaxed/simple;
	bh=+AkKs6lCy+9j27933p1mPzWTrunZee+lc9m6baD63n0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FMXN8EGYdy26Fg5E4DBdjalZ16GCu/NbutvzbjDwNmFokZKPbTeJfLJWUwYau13nV7nuVTag+JZV/avbdgOt5cQrvzD7AvWZnkQ4JMPi74D95jKQ9yFW4FXml0m99J9tbIqmY0YZ6mjPnLypR+zGRDimq4+1RnCGqU8W+JIsetg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJEh3/HF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJEh3/HF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756114974; x=1787650974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+AkKs6lCy+9j27933p1mPzWTrunZee+lc9m6baD63n0=;
  b=jJEh3/HFbfXxzaxg6NM5ROpNq5pczgYAer90o6Q9EaSWu6zz4hK2BZ3H
   OCGQF1O2XqsOxdqbKrouB3DgsVlGiVgwywf64V6Wnr5/SeXBpycTGqKBK
   0ngQmUHL008p7J1yR11oMMyUibiiyDX+suTWvTDEaHjgqJSCyxjF6r4/0
   gHS9gHZGmuO/BpH2pVaLB0r9iquBJolmfKQiDLQB9lH4dcz13URhz+Vac
   3hRomNzRUe0NJZZ7v4rFpYTzrFLOLa7EQYEUKVTkSehgTI7ek60Dr1bbR
   Y9QV9RsaWE4pmNNuxT6K+BH7GgUb247NIQF/hyhcEjIyQaWbOk47IE/71
   g==;
X-CSE-ConnectionGUID: 2j5hrbMASmmKO0U7sHqw8A==
X-CSE-MsgGUID: yPP/OsPMT2GZTPYiAKZrWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69694993"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69694993"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 02:42:53 -0700
X-CSE-ConnectionGUID: j0C64mS+TcGZ14OFpVZs/w==
X-CSE-MsgGUID: x4HyPw0ySwOzhDM8bn0LUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169641371"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 25 Aug 2025 02:42:52 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqTiX-000NZn-1v;
	Mon, 25 Aug 2025 09:42:37 +0000
Date: Mon, 25 Aug 2025 17:41:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:OLK-6.6 2720/2720] mm/vmscan.o: warning: objtool:
 __remove_mapping+0x64: unreachable instruction
Message-ID: <202508251755.PMQxcIFm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8c34eb7d35ef31e5ca62e2eecd8688e40f888200
commit: 7984eaba9ede77910543832d6e19af3f84f49d7c [2720/2720] LoongArch: Add ORC stack unwinder support
:::::: branch date: 74 minutes ago
:::::: commit date: 10 months ago
config: loongarch-randconfig-001-20250825 (https://download.01.org/0day-ci/archive/20250825/202508251755.PMQxcIFm-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250825/202508251755.PMQxcIFm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508251755.PMQxcIFm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmscan.o: warning: objtool: __remove_mapping+0x64: unreachable instruction
--
>> mm/slub.o: warning: objtool: early_kmem_cache_node_alloc.constprop.0+0x40: unreachable instruction
>> mm/slub.o: warning: objtool: deactivate_slab+0x1dc: unreachable instruction
>> mm/slub.o: warning: objtool: __slab_free+0x110: unreachable instruction
--
>> mm/page_reporting.o: warning: objtool: page_reporting_cycle+0x1bc: unreachable instruction
--
>> mm/percpu.o: warning: objtool: pcpu_build_alloc_info+0x430: unreachable instruction
>> mm/percpu.o: warning: objtool: pcpu_setup_first_chunk+0xb0: unreachable instruction
--
>> mm/khugepaged.o: warning: objtool: collapse_huge_page+0x478: unreachable instruction
>> mm/khugepaged.o: warning: objtool: madvise_collapse+0x8c: unreachable instruction
--
>> mm/truncate.o: warning: objtool: invalidate_inode_pages2_range+0x2f8: unreachable instruction
--
>> mm/gup.o: warning: objtool: get_user_pages_remote+0x2b0: unreachable instruction
>> mm/gup.o: warning: objtool: get_user_pages+0x1dc: unreachable instruction
>> mm/gup.o: warning: objtool: get_user_pages_unlocked+0x23c: unreachable instruction
>> mm/gup.o: warning: objtool: __gup_longterm_locked+0x7ec: unreachable instruction
>> mm/gup.o: warning: objtool: faultin_page_range+0x22c: unreachable instruction
--
>> mm/vmalloc.o: warning: objtool: vmap_range_noflush.constprop.0+0x78: unreachable instruction
>> mm/vmalloc.o: warning: objtool: alloc_vmap_area+0x7a4: unreachable instruction
>> mm/vmalloc.o: warning: objtool: pcpu_get_vm_areas+0xd4: unreachable instruction
>> mm/vmalloc.o: warning: objtool: vb_free+0x50: unreachable instruction
>> mm/vmalloc.o: warning: objtool: vm_unmap_ram+0x4c: unreachable instruction
>> mm/vmalloc.o: warning: objtool: vfree+0xa4: unreachable instruction
>> mm/vmalloc.o: warning: objtool: vm_area_add_early+0x64: unreachable instruction
>> mm/vmalloc.o: warning: objtool: vm_area_register_early+0xa4: unreachable instruction
--
>> mm/readahead.o: warning: objtool: read_pages+0x2d0: unreachable instruction
--
>> mm/memory.o: warning: objtool: vm_insert_pages+0x150: unreachable instruction
>> mm/memory.o: warning: objtool: remap_pfn_range_internal+0x128: unreachable instruction
>> mm/memory.o: warning: objtool: vm_insert_page+0x198: unreachable instruction
>> mm/memory.o: warning: objtool: vmf_insert_pfn_prot+0x68: unreachable instruction
--
>> mm/mmap.o: warning: objtool: mm_drop_all_locks+0xfc: unreachable instruction
>> mm/mmap.o: warning: objtool: mm_take_all_locks+0x260: unreachable instruction
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
