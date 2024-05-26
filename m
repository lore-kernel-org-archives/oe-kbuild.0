Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEA31849
	for <oe-kbuild@lists.linux.dev>; Sun, 26 May 2024 06:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716703985; cv=none; b=Vy46rkfOhoVSr/TCAgCp1X7oYfqsIu2ZIsunXiBijWki0q8Uwndbpn4/PCy9K4DbRMOcybzsEn63moTjbMhrUyWAnTjzrao/cVAhCZzeqIuoFByQ6AgaHiCZ4Lrtb4BeHmcFV6WznRDQ7/YeDKEoJgjxZQ2UzEbztAW3IyNlvLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716703985; c=relaxed/simple;
	bh=BCallZzW09PQsLx0PLc6t/i0O+4O8XJXSk8mxgdkQzY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jH0qemSEO5kWBi1updWqezIDVI4coU59NKEFPPjRewbF2XHIKAV1HyxzFsphprm9+zyY9YZA1uCrRlaZmphDuGPGqiP+qmlLvjUHQNm+t/ZujhyLEorYtji/rG1bV7OIEVFIFdQcwqC2u4hIR990gEJm509CHlJ0ebtumGSR3FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c8y4a6Ky; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c8y4a6Ky"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716703984; x=1748239984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BCallZzW09PQsLx0PLc6t/i0O+4O8XJXSk8mxgdkQzY=;
  b=c8y4a6Kyd/ANrNYAz1nLReGaqxtjhmTcvLxjIqW9MXQuNDyL9DTw84+9
   YmczJzrowMfDDrjTICI3LRgM4uIVGeOUtShdRxndZq6+aiQtFeHXSJxgg
   iYe7VE3Tu+E9NUEDnjhhW3e+VbqSrhYPGqf0uzUiY12GQdF3GeB9VHinY
   39uY5fi+JNBPc494QZ6GWqCXQg+ruZZ/D5U6DiizjUkNraLX20THkzjuH
   hAMYcliUU7JlkJyJNCqE7fewXlbRhZPOiSr2dfJKD6w/01w0kuNqpgzDO
   lwNTRUdmQMkPtSoM7Z6lhIjt8PDIkRRscQVnX3PjGBy1tu6pX7brolkqr
   g==;
X-CSE-ConnectionGUID: qsDqb/rmTsaMihMmf50Rsg==
X-CSE-MsgGUID: DjHLxIj0SCm0ZskAMbsYkg==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="16868923"
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="16868923"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 23:13:03 -0700
X-CSE-ConnectionGUID: MoYBGFxmR1y3s7XOz/AVFw==
X-CSE-MsgGUID: 2EQIw54KS6Sb9FPfGl94+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="34520994"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 25 May 2024 23:13:02 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sB774-0007n9-2T;
	Sun, 26 May 2024 06:12:32 +0000
Date: Sun, 26 May 2024 14:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cip:linux-4.19.y-cip-rt 7456/30000] include/linux/blk-cgroup.h:
 linux/kthread.h is included more than once.
Message-ID: <202405261422.IpTAGHQ0-lkp@intel.com>
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
TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
TO: Pavel Machek <pavel@denx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt
head:   da10157ad010420d48b93fe1b2ea5866f2983bf4
commit: 827b6f6962daf2e13170c0185c0f7b51cf74a0ed [7456/30000] workqueue: rework
:::::: branch date: 3 days ago
:::::: commit date: 4 years, 8 months ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405261422.IpTAGHQ0-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/blk-cgroup.h: linux/kthread.h is included more than once.

vim +17 include/linux/blk-cgroup.h

  > 17	#include <linux/kthread.h>
    18	#include <linux/percpu_counter.h>
    19	#include <linux/seq_file.h>
    20	#include <linux/radix-tree.h>
    21	#include <linux/blkdev.h>
    22	#include <linux/atomic.h>
  > 23	#include <linux/kthread.h>
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
