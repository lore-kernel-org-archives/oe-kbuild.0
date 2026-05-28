Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E842FD1B6
	for <oe-kbuild@lists.linux.dev>; Thu, 28 May 2026 03:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779940090; cv=none; b=AoSIqc0Eb5LtKHo5is9uvu9az6JbmG6kiuM/vTkUsiIIq32vqRoCVSOrrcHclp2f6xOsWJOnQy/bgzcbjB7t+r/3+mghuvKsDNzrMLrd4HJz3IUGGqYs5e6vhkzRr2NTWju40KlrkV8LWvlruoXBGhQZok62PT+SJ8xAJPAHNWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779940090; c=relaxed/simple;
	bh=lK/OM8FmzIiaIIi0Jaaz6gZOpAY0fDronNAv999sENc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q141FP70TmH+6FSP9LABN27FYXtnM0jjhTBNJyzS3NUJi3uwohMaX90BSxPzbp89XMEY1k0yOgd20lmux3atLR7oK+hPMQwr/+2twiHmQF5NMEZd4b7xsNo8uSid15KgOm3GTgGK1z88hb9p+NdM0Q/LXtZbi5RDXSQAyZDM1YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TG5sVv4f; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TG5sVv4f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779940089; x=1811476089;
  h=date:from:to:cc:subject:message-id;
  bh=lK/OM8FmzIiaIIi0Jaaz6gZOpAY0fDronNAv999sENc=;
  b=TG5sVv4fz9hRG6KB4jPjWlXjk3KqbMIxlOYu400HY0+2SEYPyZ4RVjrD
   tqSeBKdYXGqc0jxzNs6DVv4gPrvz9+JBDr6y5Tw8448UbtDgKnw2P8WcF
   qiCMQPQeAbnMJXC78eH3Nh6tA44qkqR9D4Udm4XJ/doRw3ls1LjqkmFWT
   ygZoScwDgjELcHMxCRfhYddYY9y7F/dU23gEtz5tWaI/wQ5ioKspwSqZ/
   kmP0H+H9ocijvjfuoE/iDJRa1lBTyqxUNhl8eL1W3mfsKo63Rj8IAadfR
   U+amO/YkXOBY8KbDAFKmRp4sGY4pwGhz8fN6oBbwh6QEsKIyNMJeucyC3
   g==;
X-CSE-ConnectionGUID: iForOTUYTm6SI5pRRHyZuQ==
X-CSE-MsgGUID: B8miuoC8RdypzOKe2B+OkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80749899"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="80749899"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 20:48:08 -0700
X-CSE-ConnectionGUID: 8iYHbpMoRIKJ34a4n1brQQ==
X-CSE-MsgGUID: 7gxwGaBTRkexeIggsUF/aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="280547986"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 27 May 2026 20:48:07 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSRj2-000000000H7-3H4A;
	Thu, 28 May 2026 03:48:04 +0000
Date: Thu, 28 May 2026 05:48:02 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bigeasy-staging:b4/hsr_ptp 9/9] hsr_ptp_test.c:297:35:
 error: unknown type name 'bool'
Message-ID: <202605280501.YkSR7zdn-lkp@intel.com>
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
TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git b4/hsr_ptp
head:   faf1318dad835e0286f66a9a91a329ccb8f7c001
commit: faf1318dad835e0286f66a9a91a329ccb8f7c001 [9/9] selftests: hsr: Add test for the inline PTP header on HSR
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260528/202605280501.YkSR7zdn-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605280501.YkSR7zdn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605280501.YkSR7zdn-lkp@intel.com/

Note: the bigeasy-staging/b4/hsr_ptp HEAD faf1318dad835e0286f66a9a91a329ccb8f7c001 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> hsr_ptp_test.c:297:35: error: unknown type name 'bool'
     297 | static int32_t pkt_send(int port, bool hsr_hdr, void *data, int data_len)
         |                                   ^~~~
   hsr_ptp_test.c:22:1: note: 'bool' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'
      21 | #include <sys/ioctl.h>
     +++ |+#include <stdbool.h>
      22 | 
   hsr_ptp_test.c: In function 'main':
>> hsr_ptp_test.c:395:13: error: implicit declaration of function 'pkt_send' [-Wimplicit-function-declaration]
     395 |         if (pkt_send(PORT_1, false, ptp_packet, sizeof(ptp_packet)) < 0) {
         |             ^~~~~~~~
>> hsr_ptp_test.c:395:30: error: 'false' undeclared (first use in this function)
     395 |         if (pkt_send(PORT_1, false, ptp_packet, sizeof(ptp_packet)) < 0) {
         |                              ^~~~~
   hsr_ptp_test.c:395:30: note: 'false' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'
   hsr_ptp_test.c:395:30: note: each undeclared identifier is reported only once for each function it appears in
>> hsr_ptp_test.c:417:30: error: 'true' undeclared (first use in this function)
     417 |         if (pkt_send(PORT_1, true, ptp_packet, sizeof(ptp_packet)) < 0) {
         |                              ^~~~
   hsr_ptp_test.c:417:30: note: 'true' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
