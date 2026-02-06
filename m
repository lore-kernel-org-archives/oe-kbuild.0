Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B9226ED40
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Feb 2026 15:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770391307; cv=none; b=tRQ/S96ig1YLB0/sMHiC2HlET/luO5eldrJ4BBlSmQY8ppNN4jUD86aYDTFrt4afuRMgpoMZHYPZEfg4z/ihuqXIQWE0No7l1NJ+ip2M9wlWL+qpa9dunvfwci9ZpXZJpZC6EZMVzCYRWGJKO8FoXwheHtkYTGkslOiKo39fda8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770391307; c=relaxed/simple;
	bh=jYuSg8V1CT32I92HxbPZUIPTUsy8ejU80d331xl7jns=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nm7BkXW1Y1df0/mRd68oLF2UhybnL10hzgHoO5b4XTxa8F+G1mu1RVKlo1irDU4ZmP9gm59n9/ca0frueypE5oFZN1TOrfAN6qIaOwhP6CZ26hQIfWpyat8YmZT1WmEp61MNDljYKH8lkGFvG3wLcyD2deRRlDZVyXh9mvhyyoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VkNzsKoc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VkNzsKoc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770391307; x=1801927307;
  h=date:from:to:cc:subject:message-id;
  bh=jYuSg8V1CT32I92HxbPZUIPTUsy8ejU80d331xl7jns=;
  b=VkNzsKocNl3fR3zPBNZm5ZetlxiXvz3f1iOQzcFvXk2pLtwGog7rUlRJ
   58ElDVeqAlMcGhwjcll/H700jlU+RWLecgXN360AxV+rYKv2YoSWLZLZ0
   NLw86bV54e0nMMFDM67sJ9nTH9exswtR0/ZhGSciak2jxoyszvi3FBqBN
   THsqrahTcYFyby4e0tkMN/Ct6zKZhth0HNhR0WHPWq2fjGFHbrbIx1aLA
   OcMN3ijGxAWQXhDxYoyNADbIqA/9jKtaxpmi5kj04W1E76VsJ8LEE11L2
   TlBhJxVs9CHA+SSYoRUKbfz99o/37sd7EazvX94sNBvcmJWFBLg6eU+9y
   Q==;
X-CSE-ConnectionGUID: YhDOCHu5TvCBxtgFXaT84A==
X-CSE-MsgGUID: lhE2B7CLSZqTELSkWF7Tuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="74201935"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="74201935"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 07:21:46 -0800
X-CSE-ConnectionGUID: 87UuvDBlTVOHDBEfJbOmhA==
X-CSE-MsgGUID: YYOk8Xv3SpGpJMkWWiY4Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="215464416"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 06 Feb 2026 07:21:45 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voNeR-000000004aj-0rUb;
	Fri, 06 Feb 2026 15:21:43 +0000
Date: Fri, 06 Feb 2026 16:21:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kvms390:next 30/31] s390/keyop.c:10:10: fatal error:
 stdio.h: No such file or directory
Message-ID: <202602061603.OmxEuvfJ-lkp@intel.com>
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
CC: linux-s390@vger.kernel.org
TO: Claudio Imbrenda <imbrenda@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git next
head:   f7ab71f178d56447e5efb55b65436feb68662f8f
commit: 52940a34a85bc8a17a095f6fae80c33a18c1f7ec [30/31] KVM: s390: selftests: Add selftest for the KVM_S390_KEYOP ioctl
:::::: branch date: 5 hours ago
:::::: commit date: 2 days ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260206/202602061603.OmxEuvfJ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602061603.OmxEuvfJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602061603.OmxEuvfJ-lkp@intel.com/

Note: the kvms390/next HEAD f7ab71f178d56447e5efb55b65436feb68662f8f builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> s390/keyop.c:10:10: fatal error: stdio.h: No such file or directory
      10 | #include <stdio.h>
         |          ^~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
