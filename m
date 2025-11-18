Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACF629346F
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Nov 2025 04:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763440782; cv=none; b=AT+sGJO2fPc6IcF8JDR39YgtOPcuh10PiNRdzLBgtcthyJx5ssEeNRJ0SNKxK1cdzSt1kXWzR1jD9g+iGID+1exvcxRc/i0p6KkC4QnvL5P5U0kPdbcE13JUe0heOlg4fiIkfiCIL7vhP04pzcq/bv9kvPzvZKwzkJcVLc8j2DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763440782; c=relaxed/simple;
	bh=PZzGd3bR0Bl6UypiMl97H7R3UISEc6zRnj5ZAM4g2cg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DELiZO/V5qqihjT0s+o56pAF9s2hdXwbvxTw7EeCHQIGccUBINQe5Zn0bal91WwfvSO0k/0NaqNr5eMZqomPEMp1qCmbl6ST5KpANq7rGvQSx+ODJqCZayFBBCHRwmZi+Vw2KoOSiHmUqCXeVI/u23YVFXdOTnBFNl471i1JXbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kGp0uMhn; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kGp0uMhn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763440782; x=1794976782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PZzGd3bR0Bl6UypiMl97H7R3UISEc6zRnj5ZAM4g2cg=;
  b=kGp0uMhnHf31coM65bm8qgqwt2Vg+DzksnPbK0qoMC2t9o9GQYi6Hw+n
   Wv0C2aB3jC5Ku6hKQnTofixFA3K47m/s2Le16VDsF8mQ8pcgKf6aohyui
   MglAxZSqqxUYWxRkB4aAPyddoguoOSHimQOKfzm/f+FmVyNidbmJOiQo9
   NHtifUgwHB9zdiBDxxVAW+lateGFFtKC4gEnyAMe8hioayuBFyNDYTJhP
   C+6A2PVzakGFfgfskAuHcUCRcdJWwIpQxV9RUu6kmTC0sekmP82aezNKf
   PyJ59FwodIS7VjsQOIOwPlu7hAs+B922tPW2b7ewTgjB/eQ6pfO5urNKY
   w==;
X-CSE-ConnectionGUID: 6y0uv0OgR1WBda0LztCwEA==
X-CSE-MsgGUID: gWJt86XNR5GVf7jgMgMRug==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="82844667"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="82844667"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 20:39:39 -0800
X-CSE-ConnectionGUID: /g4q4hMuSs6xEhUONz0Lfw==
X-CSE-MsgGUID: /ymGi/hfTmeCshJ3DDh/sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="191092328"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Nov 2025 20:39:37 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLDV9-0001Kb-0Q;
	Tue, 18 Nov 2025 04:39:35 +0000
Date: Tue, 18 Nov 2025 12:39:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/rmap.o: warning: objtool: hugetlb_add_new_anon_rmap+0x34:
 unreachable instruction
Message-ID: <202511181207.1UGuLEWH-lkp@intel.com>
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
TO: Peter Zijlstra <peterz@infradead.org>

Hi Peter,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e7c375b181600caf135cfd03eadbc45eb530f2cb
commit: 06e24745985c8dd0da18337503afcf2f2fdbdff1 objtool: Remove annotate_{,un}reachable()
date:   12 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 12 months ago
config: loongarch-randconfig-r071-20251118 (https://download.01.org/0day-ci/archive/20251118/202511181207.1UGuLEWH-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511181207.1UGuLEWH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511181207.1UGuLEWH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from mm/rmap.c:55:
   include/linux/swapops.h: In function 'swp_entry_to_pmd':
   arch/loongarch/include/asm/pgtable.h:303:34: warning: missing braces around initializer [-Wmissing-braces]
     303 | #define __swp_entry_to_pmd(x)   ((pmd_t) { (x).val | _PAGE_HUGE })
         |                                  ^
   include/linux/swapops.h:578:16: note: in expansion of macro '__swp_entry_to_pmd'
     578 |         return __swp_entry_to_pmd(arch_entry);
         |                ^~~~~~~~~~~~~~~~~~
>> mm/rmap.o: warning: objtool: hugetlb_add_new_anon_rmap+0x34: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
