Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282793806D7
	for <oe-kbuild@lists.linux.dev>; Sat,  2 May 2026 15:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777736657; cv=none; b=ZDUk0BJG5yIBtl0b2n4u8inReLF2igumErpxLp73NQOOBXDS5QSoq0DiXr9dPrH/mZmq/sPkfIQRaJnHKCrq2w1Lu202mqHImjw1hmJHaEWRQsSSCtdptOzNhoBvSNNPoqD6gNdhcPL/6U7cLdYexPh6OUiEn41R0o3UT/8+AYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777736657; c=relaxed/simple;
	bh=gWdnSxSkANXhBiXFY3TXGdzpaTSp1sLZSiBDAcsUtBY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Wug918MUDiczAeh1B7ini5bCJotRh8yfkajn3kGKZ00EM0n/Z2Idznct11eLbF353wk3Lo6Fi5g9nV5VvR5n4fL/DPNQ9vqzqwj77zeWxXDgEoW8JjANzZjX12e0qkeOeWm6yrD3d+LemKWnZarlRw00Ew/OdpFKs0x88VuYtJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lhjK8Ytp; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lhjK8Ytp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777736656; x=1809272656;
  h=date:from:to:cc:subject:message-id;
  bh=gWdnSxSkANXhBiXFY3TXGdzpaTSp1sLZSiBDAcsUtBY=;
  b=lhjK8YtpxLtVegsp+eWAudJ/JyfHIxufk+IdbWGouIuZS9FQRhVDqiwB
   fScMnXrpGWEi60t0aSpPOFcftax2c6s0YIYx01QD1xMJNJMg+gOw2pBza
   r2Jyfluk6QMqDVWZ+m3roBMX0bKOjAYqJUJ9bLG7j6nmZsp8JPpHO+EYu
   aLIq95MKfys/kIwfWJ3Bv3ZxHUHmal/ZTYP5C9nqyW/XEWRCgwtt9UoxN
   1GMJSWfTl8sreS3Z7uMyv3JZ50ZT+fgD9ZJC1g65sLWfPQJL6mCILqFJN
   oUWyG1EYxwUN48VLtPLRMymQ/57B2l+m1RyQgGnrFRkC5MFEQOGVwgHP5
   g==;
X-CSE-ConnectionGUID: Wrn+gH5GQ7ibB9t5rVCRkg==
X-CSE-MsgGUID: 7QReXyVKReCCUfz8TW8YKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="89768115"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="89768115"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 08:44:16 -0700
X-CSE-ConnectionGUID: AZ4wiuDET3qsrBb1wP49NA==
X-CSE-MsgGUID: bfUZutn+TCSR9b85CajvMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="239443186"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 May 2026 08:44:15 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJCVn-000000001VJ-2Yp7;
	Sat, 02 May 2026 15:44:11 +0000
Date: Sat, 02 May 2026 23:43:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-nonmm-unstable 38/57] ERROR: modpost:
 "__sync_add_and_fetch_4" [kernel/trace/ring_buffer_benchmark.ko] undefined!
Message-ID: <202605022314.CyfLKqrA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: David Hildenbrand <david@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: mm-commits@vger.kernel.org
TO: Konstantin Khorenko <khorenko@virtuozzo.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Peter Oberparleiter <oberpar@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   e672d8e8696b8a51ad9326bf38a97f2011d6ba31
commit: 5f17c8a4261c0fb72783bc1d6cb2ec4b1611897c [38/57] gcov: use atomic counter updates to fix concurrent access crashes
:::::: branch date: 25 hours ago
:::::: commit date: 8 days ago
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260502/202605022314.CyfLKqrA-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605022314.CyfLKqrA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605022314.CyfLKqrA-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__sync_add_and_fetch_4" [kernel/trace/ring_buffer_benchmark.ko] undefined!
>> ERROR: modpost: "__sync_add_and_fetch_4" [kernel/trace/preemptirq_delay_test.ko] undefined!
>> ERROR: modpost: "__sync_add_and_fetch_4" [kernel/trace/synth_event_gen_test.ko] undefined!
>> ERROR: modpost: "__sync_add_and_fetch_4" [kernel/trace/kprobe_event_gen_test.ko] undefined!
>> ERROR: modpost: "__sync_add_and_fetch_4" [kernel/trace/remote_test.ko] undefined!
>> ERROR: modpost: "__sync_add_and_fetch_4" [io_uring/mock_file.ko] undefined!
>> ERROR: modpost: "__sync_add_and_fetch_4" [net/rds/rds.ko] undefined!
>> ERROR: modpost: "__sync_add_and_fetch_4" [net/rds/rds_rdma.ko] undefined!
>> ERROR: modpost: "__sync_add_and_fetch_4" [net/rds/rds_tcp.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
