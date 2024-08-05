Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C022746F
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Aug 2024 00:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722818699; cv=none; b=mbE1+OiL78SE07wOiRHpMJ+GhFg9stkEflRWhWEQoj8eCpHG4Nx1MOtMn4hfdDwSncEzLpJrpMRaHWJxhg7mKxH+mc0wSc6lsVvl8nL5t7wKodQ5etHe5pNa5upjzUDXRfA8FEfo2tLWnFhgvF+wKJU3bLg4hh/2dsuM/J2GtX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722818699; c=relaxed/simple;
	bh=iUsu6liZwuKiBUdZw6id4JBpTBpP6erWjfWdbq2NhVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XOSa1qYV/JMM34oxivQMIRPpR0eaYIadOChESKV8Ji768Qy4r+AP1X8tjek/cPn5aXPVsn5lG7sU+Agw9i+0N6ygd/MVWxd0/tLAW5VMlDBZb50zDSrqsb2hEQzwb9PW+/vSwV0M0nyh0hCYlXgwr/r54LcFGaEV3bIw4vsju0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a2IGkZPb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a2IGkZPb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722818697; x=1754354697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iUsu6liZwuKiBUdZw6id4JBpTBpP6erWjfWdbq2NhVM=;
  b=a2IGkZPbwhxOeCddn7fUDb1tPGMY+Cmnt1Ytp5GA6eZdCbvwR0uCmrWJ
   L7PhDK+JAXDPhlxPXeyN/syWlTg2T4gIux1ouJin1zcELopvB/wmZN1ah
   oDnr0fjdgI9cZhoD0i/fMezoMWpZOjdPPy/wJmd11ImrCKwxEHJTsvUXz
   jQqPqvGg6ftribPq801F5uR6nKiGZHZJBncOKBW0yAjxfdfHIYqat0pz2
   aIlF59D8ru8Gb4qXWM7+EkpqjmJ3zgd/Ak2m5gpkBhBb+niW2dpOZml6A
   m9xauiY+raKfhuHIJe2EUhoJR8WjnPowvfm4o7oXTv6kYfabEfSZlhWwI
   g==;
X-CSE-ConnectionGUID: woxgTZeOQg6ktfO5tHKxMw==
X-CSE-MsgGUID: 9iusnboWTFmniVhD0KHvcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="43285605"
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="43285605"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 17:44:56 -0700
X-CSE-ConnectionGUID: a9X31HH/Sf+Cx+whRyBYiw==
X-CSE-MsgGUID: OSTcgw04Q52jBwUszLS08A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="55666486"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 04 Aug 2024 17:44:55 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1salqH-0001ee-06;
	Mon, 05 Aug 2024 00:44:53 +0000
Date: Mon, 5 Aug 2024 08:44:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2703/2947] mm/vma.o: warning: objtool:
 do_vmi_align_munmap+0x26c: unreachable instruction
Message-ID: <202408050808.qX4iKxgL-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Vlastimil Babka <vbabka@suse.cz>
CC: "Liam R. Howlett" <Liam.Howlett@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f524a5e4dfb75b277c9a5ad819ca5f035f490f14
commit: 64ce446c0c5b1b69bc2ba902161f4b3da0193171 [2703/2947] mm: move internal core VMA manipulation functions to own file
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20240805/202408050808.qX4iKxgL-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240805/202408050808.qX4iKxgL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408050808.qX4iKxgL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vma.o: warning: objtool: do_vmi_align_munmap+0x26c: unreachable instruction
>> mm/vma.o: warning: objtool: mm_drop_all_locks+0x90: unreachable instruction
>> mm/vma.o: warning: objtool: mm_take_all_locks+0x1b8: unreachable instruction


objdump-func vmlinux.o do_vmi_align_munmap:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
