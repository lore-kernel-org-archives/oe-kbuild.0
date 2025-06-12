Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD142DCBF5
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Jun 2025 22:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749766447; cv=none; b=KbUWEUZT8hGfoZ3BdXo+6YM83XqPrX9MmtsYiXQq721Qqi1V5VCmZrfNCryFFo8sVSDSY09C731I/l0FLRroY7h1O9cW12mtuvJgJGdtwdQUvAjia0QaY4h/tIrSaMRnN0Urh5OUGPzXVfNMVAZD1IYu3K/jgFqriKlE0upU+OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749766447; c=relaxed/simple;
	bh=VRxTWcIwXw0xF6C0SuYDiO/gc7JKGEh357GDooMHaBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ChDRTUatAwKU12I0/PkN3+8b5P/8RKIIaOFnnnHHJrhljKIsa4+an1yaZqgDIy2mKCYPxRrYTV1pwQE7hcICNSxNJfc/nKuKqodxtmNmwgFfq53dHVsqm3R8wh1KM8UemywkPSlYuGQlVT6eesItb2UcuXW9QwQNH+RAx8VqoU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EBaOgnuQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EBaOgnuQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749766446; x=1781302446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VRxTWcIwXw0xF6C0SuYDiO/gc7JKGEh357GDooMHaBE=;
  b=EBaOgnuQ3KTBMlAMcx1pK2eUYkaRDJial+OcmFVXyBenJcEN04MlgUjH
   OwCzrOVbA+BfTeq2e/fG3SnsK0+/a+i84Ldp+YtEXSRUPcnozgYvOMykC
   G0acOVb4yp/sqsnNaoz2BnUS/uqHCuWdPZRi0f0hacy+NDNci5M69npBR
   kkdt7BUaEoKApeRrBTUfhfRTXQbUPFv2+v7pzZqi6KxsjjHTvgwb+KLya
   AzUnQ/CyYucUCKjdUh7DaE9DPmWac2m68TESBmKYqeUokk5Fd3tb0dAk7
   JXkrYLFR4zmvxr+/61kU1lhbsX1W6RRzmfpXMcg7KOVWPRj8Zvwr4pNVY
   Q==;
X-CSE-ConnectionGUID: Vi5hCbLpQG6qQCw9ZNaCRg==
X-CSE-MsgGUID: 7eP+yNpwT1WWPcPMRvjBHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="39580463"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="39580463"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 15:14:05 -0700
X-CSE-ConnectionGUID: Ki7B6qYDRR2RA9lffMvkmA==
X-CSE-MsgGUID: 5ugb9DTrTHys2tRfLeTy9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="178623516"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Jun 2025 15:14:04 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPqBO-000Bzm-1o;
	Thu, 12 Jun 2025 22:14:02 +0000
Date: Fri, 13 Jun 2025 06:13:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1210/2199] fs/btrfs/subpage.o: warning: objtool:
 btrfs_attach_folio_state+0xa0: unreachable instruction
Message-ID: <202506130643.l20pm3vj-lkp@intel.com>
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
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>

Hi Qu,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0bb71d301869446810a0b13d3da290bd455d7c78
commit: 27515d1f0dff766d274dcafa7d327955abaa304a [1210/2199] btrfs: rename btrfs_subpage structure
:::::: branch date: 18 hours ago
:::::: commit date: 3 days ago
config: loongarch-randconfig-002-20250613 (https://download.01.org/0day-ci/archive/20250613/202506130643.l20pm3vj-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506130643.l20pm3vj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506130643.l20pm3vj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/subpage.o: warning: objtool: btrfs_subpage_assert+0xb4: unreachable instruction
>> fs/btrfs/subpage.o: warning: objtool: btrfs_attach_folio_state+0xa0: unreachable instruction
   fs/btrfs/subpage.o: warning: objtool: btrfs_folio_assert_not_dirty+0x13c: unreachable instruction
   fs/btrfs/subpage.o: warning: objtool: btrfs_folio_set_lock+0x1a0: unreachable instruction
   fs/btrfs/subpage.o: warning: objtool: btrfs_get_subpage_dirty_bitmap+0xb8: unreachable instruction
   fs/btrfs/subpage.o: warning: objtool: btrfs_subpage_dump_bitmap+0xe0: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
