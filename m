Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5DC41E6AD
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Jul 2026 10:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785233277; cv=none; b=EgjXrw20z+2obgxNKMbKk25B/MIDGLOpjltD9+iG5SGAXo3oi8U0C6cj+7zXVK/4zqc9V+17MIdwpkJIs88oY/vLB4eSdv73bh+CL6rJE7CRvx2D9RK+Wpz8xGWVgS2bDUJhTqxP9KXGZs8oP38GRVx6CZX9x/m9CxFkdgt38GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785233277; c=relaxed/simple;
	bh=f4Y6E652d9yOLOBFcHnscdUfShowycA0yLcyWHEfz9M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Xao1S8VkV99zuU09fSp+3dYlql282gTwbk+V/xh3IOBLY0lGKp+sFwCW5sCT6m5y0vTRTG34znyAkUGYKn+5rATWkxxFBpa4FWnihxkcioVvhxQl6vXalLgxr4EU3bUhd+rcU8tEy2wwdfqOMXjToqtfkGrAEAlwORRFeEK60Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KAP6zsg4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KAP6zsg4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785233275; x=1816769275;
  h=date:from:to:cc:subject:message-id;
  bh=f4Y6E652d9yOLOBFcHnscdUfShowycA0yLcyWHEfz9M=;
  b=KAP6zsg4pc1SwuZSL4fLIf9kVFXA97L73dQ2AU4nrlk0jbgS7lodIhHg
   VZVUsPN7FOHD7t/Vm28y4dNhZxCh+MEWxEcgCUjVLiQXLilsMIPGrMPDJ
   thyV/bDL8iSx4BqWCTSQGhhGKjbcamp8o6U2rTp2khmMZXC/caQLekjsp
   lqtDlUXeSvdTl3mrlfsOc5P5D/DsnbqNCqwO9uMjbxoKAm/jnt5HiBLDz
   nAr7eHtuzmB5PVT+83sHuA556ypXwq5gTBaZJgp2dDqTUf+Ly8GZRz3SY
   TLglqUm1+yhjvrJRoOOslFhkMW6gaxOrd+yilZlrYrhhSadR1p6iXBvdV
   A==;
X-CSE-ConnectionGUID: 4qze4otzSleUkxnd3rwvAw==
X-CSE-MsgGUID: PfKceRBDRIOwW4CHIfMFyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="85931155"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="85931155"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 03:07:47 -0700
X-CSE-ConnectionGUID: Vi5ClxoiTNGxvUSu8xrFyw==
X-CSE-MsgGUID: St5Xe9HXQ2+EIaIrLoJabg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="256322112"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 28 Jul 2026 03:07:46 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woeit-000000001wk-26mz;
	Tue, 28 Jul 2026 10:07:43 +0000
Date: Tue, 28 Jul 2026 12:06:52 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mda-next:icssg-dev 13/15] hsr_ptp_test.c:297:35: error:
 unknown type name 'bool'
Message-ID: <202607281205.aZmuCDpi-lkp@intel.com>
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
CC: MD Danish Anwar <danishanwar@ti.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mda/linux-next.git icssg-dev
head:   9f0cef2c942f471aa9823635ff26c85e6e667056
commit: 30e1205e7c0df4aa1557ab2718cc402a0c086618 [13/15] selftests: hsr: Add test for the inline PTP header on HSR
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260728/202607281205.aZmuCDpi-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607281205.aZmuCDpi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607281205.aZmuCDpi-lkp@intel.com/

Note: the mda-next/icssg-dev HEAD 9f0cef2c942f471aa9823635ff26c85e6e667056 builds fine.
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
