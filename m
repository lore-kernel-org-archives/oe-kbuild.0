Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED103BB69D
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Jul 2026 06:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785221682; cv=none; b=BUav6ymDQaVmjc1Uyjqwmw5nHmHIIV1Gx78DPHm8cLgedtIEhBNY3hOmU4IOpSctag6WEfw6RImqtLasKk5YQnarcjV3z7k0t5hBwQ86UOQLCNi7+SCaMgzP6ufQSmYw2kBP661wc0Nt+0M/6OP+0QmKp353cZGqczhnK6DEbP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785221682; c=relaxed/simple;
	bh=GjGnML/G54ZFz33FTsWV+WluwWqGswl8tDZa/u/OHYs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=FHJjGSeX2lk67G6N+bLRBlGIctDOCGHnfJr9pwUJyVPzGoXj5aCuG1gIOnUt1NKrDrrVU+s7qTkC7c/4b64LPyOYrzdwadakdL50i7VJ3aCXfB5h54HOH9Ic4EFAel25bSrbGehJhJqVEg+U8kSQ9WsyxPPkltY3CR8xlevliJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YYjA7MJB; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YYjA7MJB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785221680; x=1816757680;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GjGnML/G54ZFz33FTsWV+WluwWqGswl8tDZa/u/OHYs=;
  b=YYjA7MJBL4So3ScI2QYkMJ7UdYw/KXpyxtWwZSzjZKFlWAabrB96cqwm
   /WrKBd6qxzamaddWoIqCjTUVv4FXhI8I+l1nUSclVUL/IRVJVTHxNnPe1
   CbaZhz9DZHwOh/INDNMDmD5NaaX2ETxLCmwfAXM5vObn8aEIYBypgE7jU
   UR+z7q2Uav/4CJ9wBtykYHjbmf8bPPj4+PIwCTqyeMMcBcvgpakaskGz/
   3ZGcuXlW+ID/Xebhjl0T+nAWdkyLgVQp+YplUiotvphXXR/y6CWUUumX1
   NXQ996pVzasV6URSITfNqc0ZHcCd8/2bdxbVG5u6O+vNr+0W5SVNuXAgC
   w==;
X-CSE-ConnectionGUID: d7M+BKHURpqS+dDhVQsHAQ==
X-CSE-MsgGUID: z57tduwJS+imfjwvD0cZ8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="96385505"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="96385505"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 23:54:40 -0700
X-CSE-ConnectionGUID: 1IOvI1sjRzeQ6CiVvZ428A==
X-CSE-MsgGUID: ZMl+Hnf5T3+3Iuh9Xa3ouA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="284159655"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jul 2026 23:54:39 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wobi0-000000001tS-3P76
	for oe-kbuild@lists.linux.dev;
	Tue, 28 Jul 2026 06:54:36 +0000
Date: Tue, 28 Jul 2026 08:54:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 36/130] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <202607280856.97zpgQVs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "checkpatch report for netdev code"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Stefan D=C3=B6singer" <stefandoesinger@gmail.com>

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   3d8eb1c72ad9937912307a2d4f3de812b572b9b3
commit: af253a816fd6535fda1138c21c053d91dd3261c1 [36/130] rtl81xxx: Hack in=
 SDIO.
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260728/202607280856.9=
7zpgQVs-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#1592: FILE: drivers/net/wireless/realtek/rtl8xxxu/core.c:5568:
+	switch (queue) {
+		case TXDESC_QUEUE_BK:
+		case TXDESC_QUEUE_BE:
+		case TXDESC_QUEUE_VI:
+		case TXDESC_QUEUE_VO:
+		case TXDESC_QUEUE_BEACON:
+		case TXDESC_QUEUE_HIGH:
+		case TXDESC_QUEUE_MGNT:
+		case TXDESC_QUEUE_CMD:

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
