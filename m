Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCC22690D1
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Nov 2025 09:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763457550; cv=none; b=SwPT+3N0Freirc+PdgFGcnBXs9D8jWuHvF7d2seQlSpHbYerlwBHg7/X4XpeIvCbK0UjADJRSdViBXE7CXOXl9wYr4MH+wuZ//vA6QVekzsRYDay2bvlaZDqYyBXeUT7UGvkCqCBdyqno8aFcZIs3UWpOupfCjSWSv/eB6UPZ/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763457550; c=relaxed/simple;
	bh=I+XYBGJdPy36qA8G7SmMNbSW9jrY1kEhcm60rPBxWk8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QefD+CtdSBI++yB6GkEAlb2m1OndilUjsiueTMT3sAyrrvw4KJ4jBCCWaHJ9eKQ4s318lRxvOG3S4XRcQ9F5Nf1/KuHf+U2jgurj57LPdWWnVRgAiHaCGAvZ5nq8dcWOPouppAvUgEkeB1TMMdfPEIo2BXijaoUO8clboY0W+Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GFeShSCv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GFeShSCv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763457548; x=1794993548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I+XYBGJdPy36qA8G7SmMNbSW9jrY1kEhcm60rPBxWk8=;
  b=GFeShSCvUsWgwRmG/+/5U4GEV8gr0DSKxEjwy/O9jKciMXm0lE4a3JGm
   wUaO61d/59bL6g6PDEAiuassObbOlHZe/Ay4FERKz1OG+GGoXOpK+ha5E
   cLo6E/AhTbi9/hCFJK7f53Fv/DoWQuWFGekH7WW6bo/6Ej7Y1rlJxQLCM
   8JBKI1TaDa64wTvhczwZF5mG0soz6VqXgY6SNTdLTohyQgItXJeXnKfwF
   tZcYUTDh9JEe6L2GO1XqoPqUlUZtY7sXL1ZRFbR9KIEAef35Bd0xxpTvB
   nQ5Rtva+3/MZMXMMrEylxVZz2uJv9tHTIsuEDQrCcq+w5Jy4IITGOVvxh
   w==;
X-CSE-ConnectionGUID: x86B5VjfTe2eSv+54nyBPw==
X-CSE-MsgGUID: sfAP1yN8SouNMll4qlwsoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65564455"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="65564455"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 01:19:05 -0800
X-CSE-ConnectionGUID: R0YfdWWyRwiES/n2QSpuLA==
X-CSE-MsgGUID: sgB0GWnPQ22ygpKpyE4ojg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190733338"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Nov 2025 01:19:05 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLHra-0001Xj-1I;
	Tue, 18 Nov 2025 09:19:02 +0000
Date: Tue, 18 Nov 2025 17:18:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/truncate.o: warning: objtool: folio_unmap_invalidate+0x108:
 unreachable instruction
Message-ID: <202511181727.0amBp0L3-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Jingbo Xu <jefflexu@linux.alibaba.com>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e7c375b181600caf135cfd03eadbc45eb530f2cb
commit: 927289988068a65ccc168eda881ce60f8712707b mm/truncate: don't skip dirty page in folio_unmap_invalidate()
date:   9 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 9 months ago
config: loongarch-randconfig-r071-20251118 (https://download.01.org/0day-ci/archive/20251118/202511181727.0amBp0L3-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511181727.0amBp0L3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511181727.0amBp0L3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/loongarch/include/asm/uaccess.h:17,
                    from include/linux/uaccess.h:12,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/backing-dev.h:13,
                    from mm/truncate.c:12:
   include/linux/swapops.h: In function 'swp_entry_to_pmd':
   arch/loongarch/include/asm/pgtable.h:303:34: warning: missing braces around initializer [-Wmissing-braces]
     303 | #define __swp_entry_to_pmd(x)   ((pmd_t) { (x).val | _PAGE_HUGE })
         |                                  ^
   include/linux/swapops.h:578:16: note: in expansion of macro '__swp_entry_to_pmd'
     578 |         return __swp_entry_to_pmd(arch_entry);
         |                ^~~~~~~~~~~~~~~~~~
>> mm/truncate.o: warning: objtool: folio_unmap_invalidate+0x108: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
