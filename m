Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D413E1373
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Feb 2026 01:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770428397; cv=none; b=YwHr7AWCd87Gu+m7Cp4Y//4aq9UBMCI1qny/ofPOr1C05YyXt1TdJoKx0PzKv0LxAgmHpzugaDmRY/Asyoh2lRyLwQ+V1XLhYC2ko+UEOI9VkM+Wpn5LdYp8KavizU6qvVFE1NfyFfzmb6rwntlhArgaI7V25vFH/GiL7wC0wRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770428397; c=relaxed/simple;
	bh=tzqUadsPB0mDdorRAD7C63nHAehN6dQEvLKRNEJ4u9A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nDMOH2Ejq+0QaT1QRalAyj4+5DnawiL5nj7y4GwRpes9x16qZNG+SgHQbdvrKZ3LPCBpIAtDwhkKlc7VHI6NsR3cV7eWxIP7BXAcKGeYJwPiyOaPlFEoV4h9ZgFtw9dDdsHz24Mkx+HFtrJ0PTRj/u7VVZgbQBtf2uVCzeONExc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UtbKdmte; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UtbKdmte"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770428396; x=1801964396;
  h=date:from:to:cc:subject:message-id;
  bh=tzqUadsPB0mDdorRAD7C63nHAehN6dQEvLKRNEJ4u9A=;
  b=UtbKdmtejPLlklrqKj35GttwI8Wk1/YyfShD38SVlZ14AyYCdRYCAh9t
   GTTKfFagm9Ec4Uk2znLdK6HSE5s7sLdhZtR7SxwoJVk7dDOVPOtWsZFOG
   14psH9Bbp+siyvhxOTTHYEBrPeMICidw0zcAhA7b+Sf4TlElhciVRdDuk
   yb6Lhr63F9iq0A3GOaP/sfRrj4bvCvrD2ZDP+msiQbneq3RkIXevhDweU
   /ruEH5ucw/vHcLWBDDjGKL7Qz1pJbTU5YvywM0J9m5Z6b7ZsDCbIIEN5+
   lJ+10MPVH8Mq4U+gsTWyrzt0ZL3vG5F1CBHuUQ49FXBxOL+KHWHqeePQf
   g==;
X-CSE-ConnectionGUID: +hZudmCcSpyuw2fpuHIOqQ==
X-CSE-MsgGUID: vABVEgi6Q2uQ91a0Py9CNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71530823"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="71530823"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 17:39:55 -0800
X-CSE-ConnectionGUID: /i5qc/73RSm7mNLgcbP1TA==
X-CSE-MsgGUID: Lmq2QG3JQQq/nYVYijseIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="211055902"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 06 Feb 2026 17:39:54 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voXId-000000004ll-4AG2;
	Sat, 07 Feb 2026 01:39:51 +0000
Date: Sat, 07 Feb 2026 02:39:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-kiwi-6.1 105/105]
 maple.c:35872:39: error: 'mt_dump_dec' undeclared; did you mean
 'mt_dump_node'?
Message-ID: <202602070217.eWkNq71c-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d9208b34f28d2b57c8c195fd5e1a9d0688f7eb78
commit: 7befa7bbc90ae65849a08dce9bf5ce1845f19494 [105/105] FROMGIT: maple_tree: add test for mtree_dup()
:::::: branch date: 31 hours ago
:::::: commit date: 2 years, 1 month ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260207/202602070217.eWkNq71c-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070217.eWkNq71c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602070217.eWkNq71c-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from maple.c:24:
   ../../../lib/maple_tree.c: In function 'mt_clear_meta':
   ../../../lib/maple_tree.c:944:17: error: 'fallthrough' undeclared (first use in this function)
     944 |                 fallthrough;
         |                 ^~~~~~~~~~~
   ../../../lib/maple_tree.c:944:17: note: each undeclared identifier is reported only once for each function it appears in
   maple.c: In function 'compare_tree':
>> maple.c:35872:39: error: 'mt_dump_dec' undeclared (first use in this function); did you mean 'mt_dump_node'?
   35872 |                         mt_dump(mt_a, mt_dump_dec);
         |                                       ^~~~~~~~~~~
         |                                       mt_dump_node
>> maple.c:35872:25: error: too many arguments to function 'mt_dump'
   35872 |                         mt_dump(mt_a, mt_dump_dec);
         |                         ^~~~~~~
   ../../../lib/maple_tree.c:7264:6: note: declared here
    7264 | void mt_dump(const struct maple_tree *mt)
         |      ^~~~~~~
   maple.c:35873:25: error: too many arguments to function 'mt_dump'
   35873 |                         mt_dump(mt_b, mt_dump_dec);
         |                         ^~~~~~~
   ../../../lib/maple_tree.c:7264:6: note: declared here
    7264 | void mt_dump(const struct maple_tree *mt)
         |      ^~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
