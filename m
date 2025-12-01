Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B99337BBB
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Dec 2025 18:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764612810; cv=none; b=jTXAa6J0ThJEfUAJ1uQTN93xgRHaKVfZSTb8tS/bmTPgbLeNtbVLwhlIqBzrH6BHArz93T98IRwyktmVKKninL0UU6WLxnzUoAedBxHDkM9aLE4mXHfcXmeRBXve/9RBDbjNdNiGygpt1msc5R4FEkUYyFs7NwxaibPUYWz3aag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764612810; c=relaxed/simple;
	bh=Tq75hli8SqfkcJ/8IcR3DMEPhR+voILQy4swu3i/kMk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fELSo4tqoVvoqs2HyREhMsdLNks0FA8UxLcuWHNAk+UA/RHGiVTnc00U5b/s2uTDqgUMcNT9S9OOUiaOuBsIugmATA6bimGDH0ywvf/A0BestWPMBRtIqqfUGjA1u7rUegnBoPpt2KKVtSpPjjVLekwT/E1UnWk3KZ/D34+ZvfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GTr/LLNE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTr/LLNE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764612808; x=1796148808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tq75hli8SqfkcJ/8IcR3DMEPhR+voILQy4swu3i/kMk=;
  b=GTr/LLNEiFWG1vbb/cTOpzszNs34A1tUw+5PJ+n34AmRx7T4Zpy1PBR+
   qSOYs+MQY7D9UF3bRg+fr2t89ZrWJD7POOiIVd1b89WyLcG9Zarw7BwC1
   eVyfI9wYJs8DZTIJVZ1/BsyyFauwyvP/fu3Mv3qorTLiF5eWVUbM4rcf4
   zh/eAD0IaALYAuox6gGOMLjEAhjYbtpe3r7gxiWUWFnmyYexYY2fWg4Fc
   IXJavN5q/3/7eP0UtDkBO+VjbRgXBteFW2s2pduQRAJWKyhNPviiTHRMt
   XbAO9hbpEa49Zlkn35EyFRWrrkcAS7cqhnLVVKVy5YSF9PzY8+diA4VuZ
   Q==;
X-CSE-ConnectionGUID: YsCyd6JZRp+/ZkN1uWcWVA==
X-CSE-MsgGUID: uGy7GCX4TDOg8jcBlrcXbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="65749879"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="65749879"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 10:13:27 -0800
X-CSE-ConnectionGUID: AO3gqQOCTB61pGFzS0N74Q==
X-CSE-MsgGUID: eHMosfgYTh2nz56dPF7hlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="199077183"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Dec 2025 10:13:26 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQ8Oq-0000000091f-20YM;
	Mon, 01 Dec 2025 18:13:24 +0000
Date: Tue, 2 Dec 2025 02:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 6382/13171]
 tools/testing/selftests/hid/tools/include/vmlinux.h:68845:2: error:
 declaration does not declare anything
Message-ID: <202512020216.mQmiCabn-lkp@intel.com>
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
TO: Vlastimil Babka <vbabka@suse.cz>
CC: Harry Yoo <harry.yoo@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
commit: b244358e9a1cd61276b8785b1b4275f1f45a1dc2 [6382/13171] slab: separate struct freelist_tid from kmem_cache_cpu
:::::: branch date: 15 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512020216.mQmiCabn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020216.mQmiCabn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512020216.mQmiCabn-lkp@intel.com/

Note: the linux-next/master HEAD 95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from progs/hid.c:3:
   In file included from progs/hid_bpf_helpers.h:28:
>> tools/testing/selftests/hid/tools/include/vmlinux.h:68845:2: error: declaration does not declare anything [-Werror,-Wmissing-declarations]
    68845 |         struct freelist_tid;
          |         ^~~~~~~~~~~~~~~~~~~
   progs/hid.c:503:24: error: incomplete definition of type 'struct hid_device'
     503 |         int hid = hid_ctx->hid->id;
         |                   ~~~~~~~~~~~~^
   progs/hid_bpf_helpers.h:59:9: note: forward declaration of 'struct hid_device'
      59 |         struct hid_device *hid;
         |                ^
   2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
