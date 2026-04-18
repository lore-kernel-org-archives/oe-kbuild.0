Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172D125D1E9
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Apr 2026 00:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776473658; cv=none; b=RCgYsAnBGM3+fnBuuZU389Ua5QBMD5RHtvG/PUMP0cHhIRXhH1zmCDr94yt0o9wcCrr09g1AgVO1vNNoWTMJhRK97T2xAsox9x7Z1UZbbHnB5/7P64JkBSVzjgfSXoWRP76CcfHKff6vosAbQrqocesZuZNR5f3VgPPiEALcv4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776473658; c=relaxed/simple;
	bh=nkQaK9P6kiGj0t7yqv5eIQq/WmQkBiBtKsoRk9tvjD8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c+FuOOzPAHnqwet/vt6seJSHXfr3fXqciFOzRDgg7rbOOa1UH9h55fPHXbFFnTk52T5Fbnqt10NwMZmir9BbvPG0+kMG7isYtHMxZHqjyDzQvhT2OD40V8fAxMYHM85Pc66OUB0ePgVk93OLaTIrKyXbiWJHQSGwWPqs2unbSQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ODX8CqfS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ODX8CqfS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776473658; x=1808009658;
  h=date:from:to:cc:subject:message-id;
  bh=nkQaK9P6kiGj0t7yqv5eIQq/WmQkBiBtKsoRk9tvjD8=;
  b=ODX8CqfSogS4Y/G+Tk0wJPRNaqTr5NFljxVT2ltmoafVvj+y6lEG/INc
   fAXJ8YE0XTi/JKFAM4Ux5WFRtTPUbWVoh5TQ5zFdz9GuVqKluaqAcOa+L
   ssoCcnfK43sOevMukSkP+ITRkD30h2nOTBlblhMZBMT2LFare9fCD5pMs
   ZUwXtQPZxWSza3DoENWmqDY7vZEnwzwHVAC/80ijxz7YIf/9XEkVNAeMn
   HuI8a95IhduihfD4wSLwAlTws7i6fEU6Pptt/EE+w2Ci04QhsWIUUqIe3
   BW71gLaVj8m7plUmGu/ip2RDGRnDZ0nNQuLmpKZ+Ku+irl6gJx7PJr1DV
   Q==;
X-CSE-ConnectionGUID: fgjZB7TPSgqQfQqNNz14wA==
X-CSE-MsgGUID: BXayi2vbQEKIwYaAa/1CRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="100138495"
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; 
   d="scan'208";a="100138495"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 17:54:16 -0700
X-CSE-ConnectionGUID: zn2asUrpRfKmyE4Q3mBZhQ==
X-CSE-MsgGUID: z/V1uwrDRaufH7fGvOBAHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; 
   d="scan'208";a="230176239"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 17 Apr 2026 17:54:14 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDtwp-000000001UL-2pbj;
	Sat, 18 Apr 2026 00:54:11 +0000
Date: Sat, 18 Apr 2026 02:53:36 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [davidhildenbrand:b4/zerotags 2/2]
 arch/arm64/mm/fault.c:982:undefined reference to `mte_clear_page_tags'
Message-ID: <202604180258.fMPl8ndR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "David Hildenbrand (Arm)" <david@kernel.org>

tree:   https://github.com/davidhildenbrand/linux b4/zerotags
head:   6c38f199ad55f69364c20618114673c93274ce83
commit: 6c38f199ad55f69364c20618114673c93274ce83 [2/2] mm/page_alloc: fix clearing of HW tags without __GFP_SKIP_KASAN and with init_on_free
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260418/202604180258.fMPl8ndR-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260418/202604180258.fMPl8ndR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604180258.fMPl8ndR-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-gnu-ld: arch/arm64/mm/fault.o: in function `tag_clear_highpages':
>> arch/arm64/mm/fault.c:982:(.text+0xa10): undefined reference to `mte_clear_page_tags'


vim +982 arch/arm64/mm/fault.c

013bb59dbb7cf8 Peter Collingbourne     2021-06-02  973  
6c38f199ad55f6 David Hildenbrand (Arm  2026-04-16  974) void tag_clear_highpages(struct page *page, int numpages, bool clear_pages)
013bb59dbb7cf8 Peter Collingbourne     2021-06-02  975  {
5bebe8de192649 Linus Torvalds          2025-11-18  976  	/* Newly allocated pages, shouldn't have been tagged yet */
5bebe8de192649 Linus Torvalds          2025-11-18  977  	for (int i = 0; i < numpages; i++, page++) {
d77e59a8fccde7 Catalin Marinas         2022-11-03  978  		WARN_ON_ONCE(!try_page_mte_tagging(page));
6c38f199ad55f6 David Hildenbrand (Arm  2026-04-16  979) 		if (clear_pages)
013bb59dbb7cf8 Peter Collingbourne     2021-06-02  980  			mte_zero_clear_page_tags(page_address(page));
6c38f199ad55f6 David Hildenbrand (Arm  2026-04-16  981) 		else
6c38f199ad55f6 David Hildenbrand (Arm  2026-04-16 @982) 			mte_clear_page_tags(page_address(page));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
