Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F62E168B7
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Apr 2024 03:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713063751; cv=none; b=pGraT0OwuQ1UE0vXw7olRBmyY5YfrSZibEoPaNoNWCvBUx3FHLtyu+nopOEb9bWJJvGW9nPlYqDg3d3EMMMAdMGyjmpERXJS4YRJcrQ7z6c8yeXY3sILG3w7MYL6WaiBjxeQhks42HW7Z7am5DFdYylvF3YyAdSkgrhvP0qrCFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713063751; c=relaxed/simple;
	bh=pjYrLoNqQh2CQrTP2jQ+7/hEHQLklyr0z22ODyPX00o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rBnmNV7nAojLlqH9XQDTb3wA8nbULL5pjoCR4q5urOBJLMPuszFIrR3BLgQo2DYrGCi+jt5EnWgBwHxGdWYbJsJ5IGZX38ZCiZXZjNG+bhR29VnNXaYQdXRm4SmFRqRGUFAGwFspOdpqdPngkTvfb31ZRiPGn5I7XAA360tIM4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jNXkVB/T; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jNXkVB/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713063750; x=1744599750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pjYrLoNqQh2CQrTP2jQ+7/hEHQLklyr0z22ODyPX00o=;
  b=jNXkVB/TrSjGyJX/T2HnbnpeWfk/q6k6sI7IK5/w/5VJug9S91KQ2mSG
   Kgc5M909b97IwGvc+vzTDyjBBwqiP2hiiMEc3WGCcOhnBC96qGe4h0ETY
   3EMy1xEf4US+g29ZGAIHrq6EFxglxg9VE3JqXtwzsFerKMZeqJ+9et3JV
   9TrT3v9y+l39LJtIZh3yFKlNKXQ0WrNpVpx3uONBCFkNToNdfIyBL8Oh1
   8assyhLMhaC25kXhKQB4uF1OKn12YBHC1vj+P7NqPY0EmaaROhe4QStYa
   EfWjN9IHRIQFLhGSmwWi01pnVXtG4ub35dwW4IB3cv6UwCKpRHNzLYh1J
   g==;
X-CSE-ConnectionGUID: 9Mir6aEWRGuW8U+NAoNZag==
X-CSE-MsgGUID: TvP9niQxRMuwhVG2zDIdwA==
X-IronPort-AV: E=McAfee;i="6600,9927,11043"; a="8650232"
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; 
   d="scan'208";a="8650232"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 20:02:29 -0700
X-CSE-ConnectionGUID: lWXDAqt4Rc+CwQeZDrzSMg==
X-CSE-MsgGUID: JgBk3oJpT3ivdezUgWqCAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; 
   d="scan'208";a="21569836"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 13 Apr 2024 20:02:28 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvq8P-0003Bc-1Q;
	Sun, 14 Apr 2024 03:02:25 +0000
Date: Sun, 14 Apr 2024 11:01:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2570/6010] drivers/char/ipmi/ipmi_msghandler.c:
 linux/workqueue.h is included more than once.
Message-ID: <202404141026.U9TuWR8P-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Allen Pais <apais@linux.microsoft.com>
CC: Corey Minyard <minyard@acm.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9ed46da14b9b9b2ad4edb3b0c545b6dbe5c00d39
commit: 740d0a267c8d319202523bef474e74505749d183 [2570/6010] ipmi: Convert from tasklet to BH workqueue
:::::: branch date: 2 days ago
:::::: commit date: 11 days ago
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404141026.U9TuWR8P-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/char/ipmi/ipmi_msghandler.c: linux/workqueue.h is included more than once.

vim +34 drivers/char/ipmi/ipmi_msghandler.c

    16	
    17	#include <linux/module.h>
    18	#include <linux/errno.h>
    19	#include <linux/panic_notifier.h>
    20	#include <linux/poll.h>
    21	#include <linux/sched.h>
    22	#include <linux/seq_file.h>
    23	#include <linux/spinlock.h>
    24	#include <linux/mutex.h>
    25	#include <linux/slab.h>
    26	#include <linux/ipmi.h>
    27	#include <linux/ipmi_smi.h>
    28	#include <linux/notifier.h>
    29	#include <linux/init.h>
    30	#include <linux/proc_fs.h>
    31	#include <linux/rcupdate.h>
    32	#include <linux/interrupt.h>
    33	#include <linux/moduleparam.h>
  > 34	#include <linux/workqueue.h>
    35	#include <linux/uuid.h>
    36	#include <linux/nospec.h>
    37	#include <linux/vmalloc.h>
    38	#include <linux/delay.h>
  > 39	#include <linux/workqueue.h>
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
