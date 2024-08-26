Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66E317B51C
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Aug 2024 13:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724680330; cv=none; b=YxUcS+OgKyu/HzkuE3jvPhIR6/Ugw2hVGzdkv7UQw+6qqNF2XB+HIFAEK3hRu3M4XFGEQgWfoHd6kErR6y0uXkTmEKovxGfLrBsd7Upf24sPXOWdHCh2JFgaNio4F1/FWGf60a+5+gGZ9/I/ZaQfWWK0k5z4QUa0XyzCia03Aoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724680330; c=relaxed/simple;
	bh=HsiG1djQOStR/hyt92gt5x2Cq8tyy1QdyeUIM2IoOA0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pmDT26hM3KitfalKTbmZHCHk7MpjXl05NqBgGoNzkhZ5yqPmr82NvalyN7LB7M0W1KO01ysyu+DNdu8gc4AzbQNzLUIeRV2qcq+b2YUu5+sxvrjXEOB197Y5z4NRFdizR8jMGYR7sFmNFHq+kaRiljAoZlzPMal3FpHIY+hyUuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T0m8LdFJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0m8LdFJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724680328; x=1756216328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HsiG1djQOStR/hyt92gt5x2Cq8tyy1QdyeUIM2IoOA0=;
  b=T0m8LdFJUbY5EMDy/irsCiR11NbQsAKBmN8sgKmUUkUfhnmis9Ti5OEu
   oqqnkTcJ5ZW3YRGqvYBytUFo/5warO82FpX2ExUUNQwm1b1EQgrHP+xtd
   /UdocPzDK57DtAVwC6bT2HBkV4qBPSHxe03oT/+An/A0whn35R3kA1ukO
   /MBJKoaJc+/ofMFjAperOlus9aM79PyXoPYGrYpPbXcuZT/mm3a9hc/YC
   p3aGHK0v3qLRsBTFSHaY9ZthLJQg2tEbFvhaXrwbEe5X5uH8KGMxQY3kb
   oU5RABrVZz1mjlUoi0hEPDQrb8ofjdu4uG35aZ/FdvNsXT4vNnybdQXy2
   A==;
X-CSE-ConnectionGUID: 0cL7hs1zRsOvn5j6V0RU3A==
X-CSE-MsgGUID: 3y6grC2kQbuw4okhK8KuBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="33673336"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="33673336"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 06:52:08 -0700
X-CSE-ConnectionGUID: 2mU/zjmUQkSPqTanY4OySQ==
X-CSE-MsgGUID: 6OXEbvBsRX2gNZsBBOHGFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="93246373"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Aug 2024 06:52:08 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sia8b-000H9v-0w;
	Mon, 26 Aug 2024 13:52:05 +0000
Date: Mon, 26 Aug 2024 21:51:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [isilence:zcrx/next 28/33] io_uring/zcrx.c: linux/skbuff_ref.h is
 included more than once.
Message-ID: <202408262156.PMUbu4mD-lkp@intel.com>
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
TO: Pavel Begunkov <asml.silence@gmail.com>

tree:   https://github.com/isilence/linux zcrx/next
head:   773c9084da07208b3562aaaa2253288cde569c8a
commit: 9c54a5b0b91b9441e14e18af2cde93830b87a3a8 [28/33] io_uring/zcrx: setup ZC for an Rx queue when registering an ifq
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408262156.PMUbu4mD-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> io_uring/zcrx.c: linux/skbuff_ref.h is included more than once.

vim +8 io_uring/zcrx.c

   > 8	#include <linux/skbuff_ref.h>
     9	#include <linux/io_uring/net.h>
    10	#include <net/netdev_rx_queue.h>
    11	#include <net/busy_poll.h>
    12	#include <net/tcp.h>
    13	#include <net/rps.h>
    14	#include <net/page_pool/helpers.h>
    15	
    16	#include <trace/events/page_pool.h>
  > 17	#include <linux/skbuff_ref.h>
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
