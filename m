Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242BF1A275
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Mar 2026 07:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773560255; cv=none; b=KgpykQm3zLdAG400lueRHxjaHC+ihTcAh1Y3THJdeCHPMOtdoPpm0e2TWCW7W61hbkDz2y5owmaCFOSqsK4tRMLVDWNxnEayO4XQwtxJAAYXAhhtGqGndctI9w1Y74pp2PxIXWr3J5tGMrp4bJ6N0IcQbmtZ6p/RdlHfW/Sv/Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773560255; c=relaxed/simple;
	bh=DIoUj1YLZSW0ODJMt5usPPK/VDndsJ8xfg8GuZJfLBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pLqOwu14YNLEAgBPLoa+7ljx9W3VdPFsyyZfbiCttYjQIL6zERWVWFsUf1qwlEEqFeVcTM4DiqruoRAWKkc0bX8K+bkF3v1//ezzTgWE0qVl2wdIQHCN12nC728kPlj9ZILVgPq6wX8io3fBeYe8Fn0lC4/2aqCqpA0P7TXoO7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aI/TnRfy; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aI/TnRfy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773560254; x=1805096254;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DIoUj1YLZSW0ODJMt5usPPK/VDndsJ8xfg8GuZJfLBE=;
  b=aI/TnRfynQOf4r1NUPhEWkkZSPne1AzHp9v/B7ZPpYY54aIBir9ZvJsT
   DLJdUkpDV6HScWPQdLvoj2/y6WSVudXmJtkBwlKhRAP4XxLU4HWT9K5I4
   3SIwUfBcXEBS6T5S8vAW6HX9x4uce031mk/GKLZJmbAj0HA5xhmoaK3vn
   4ejP0g8UJ0ZA+MkqwXOEAQfJPGCBb2qPNcs378JfyDhAvxx00wqYx5glr
   c+0vSFZQTcO91MDDsJi7gfdk171LQHcg39IBkWcPbTw53N249vVwREZ4l
   C5eVdc23659XtX8xPJn0rsHMhd2TCm0WbqPXo/Fwn+RPvZsROuiSZXwsV
   Q==;
X-CSE-ConnectionGUID: QnLsv2u/QxGf7TeZ3m57wA==
X-CSE-MsgGUID: C1V1tw3XR9qFZOZo42m7Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11729"; a="84923508"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="84923508"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 00:37:33 -0700
X-CSE-ConnectionGUID: HaaIzGasSIqJM5eZhKKEcQ==
X-CSE-MsgGUID: HXXsiFWCToW0RG0h4vxstQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 15 Mar 2026 00:37:31 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1g2T-000000003zp-2pCY;
	Sun, 15 Mar 2026 07:37:29 +0000
Date: Sun, 15 Mar 2026 08:36:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 1/4] IPC: Added New system call do_mq_timedreceive2()
 for non-destructive peek on posix mqueue
Message-ID: <202603150853.00qBX9c6-lkp@intel.com>
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
In-Reply-To: <20260315040827.156558-2-academic1mathura@gmail.com>
References: <20260315040827.156558-2-academic1mathura@gmail.com>
TO: "Mathura_Kumar" <academic1mathura@gmail.com>
TO: brauner@kernel.org
CC: academic1mathura@gmail.com
CC: linux-arch@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: viro@zeniv.linux.org.uk

Hi Mathura_Kumar,

kernel test robot noticed the following build errors:

[auto build test ERROR on perf-tools-next/perf-tools-next]
[also build test ERROR on tip/perf/core perf-tools/perf-tools linus/master v7.0-rc3 next-20260313]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathura_Kumar/IPC-Added-New-system-call-do_mq_timedreceive2-for-non-destructive-peek-on-posix-mqueue/20260315-143134
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20260315040827.156558-2-academic1mathura%40gmail.com
patch subject: [PATCH v1 1/4] IPC: Added New system call do_mq_timedreceive2() for non-destructive peek on posix mqueue
:::::: branch date: 61 minutes ago
:::::: commit date: 61 minutes ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260315/202603150853.00qBX9c6-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260315/202603150853.00qBX9c6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603150853.00qBX9c6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: include/uapi/linux/mqueue.h: leak CONFIG_COMPAT to user-space

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
