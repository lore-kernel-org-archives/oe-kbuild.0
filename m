Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D11629406
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Sep 2024 01:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725240816; cv=none; b=grtAl33JQMFsOI6Yy/MPEIJPYmFJoIueY6N0kb8KsWxndcN93LwVCSMcENcaqjpofs5646NQ49yTdKPUM0xIeYUJiJ+3hgmmCp7sjHQTyYJbiz4j4cUg8PtA64uHwe/SaowDArpAi8Oyflq7q43q8QpaefE/81LEncX1GhQRg10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725240816; c=relaxed/simple;
	bh=QFqy9QiTrV+/qg+8hNxBNckJ+pdsm22YcbBfl2NCJIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lw9fp6H+RKMp+0LQA3wgcWPXwCUKJb3Sll4lYib2FM16pE8HiFNHzmOrwZhtZyHwL0hk5nhK9HpfdNqJSc0mH3zd4DTZH3sinbFlG4LDDH0aUYagF59YjhctlMoD36CjQB7F7Og34bCqIwhylbnf25Ug9SUR1zv1NNxIlu8fBm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OHhioEKU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OHhioEKU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725240814; x=1756776814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QFqy9QiTrV+/qg+8hNxBNckJ+pdsm22YcbBfl2NCJIY=;
  b=OHhioEKUSj3dsAaCqtSBySW4JtHIyhB8QXIUckEKDB06Zglbd4mgv1o8
   WSJ9x1j+cUu9pOTrYlcbc85AuWn+i3XZOOgTp3RzUK8CY3HN5wzygbZug
   ES66wrrgNPvTGSP3WznxAkwB4yTtyNRpzBpkmC68OzPSinXCWyiZJlAF8
   mp66exUzIr5fDqIlNLYlnuMZEhuAwmCjlQqTp2GNqlhvCd8QQiLL/229c
   fQsbo2zHNi9TQ4isYKg6RIuPwCdU4hB+9F9oVHN+juUPZHIXjtnBDpefW
   88UHF6UmKe/Sjjt0Zqrk+0HKARmaKG0j7W/LATau4fafDF7h+ie5GlboU
   Q==;
X-CSE-ConnectionGUID: p7UrgQp/SJ2y48drAXaFww==
X-CSE-MsgGUID: +GoFY7NBRDm9mqxFvYHXpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23966484"
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="23966484"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 18:33:33 -0700
X-CSE-ConnectionGUID: vv4ZLRuYT4aw6s5XgOqr+A==
X-CSE-MsgGUID: hmvpf/VWRfexaIZtd8p6YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="64090591"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 01 Sep 2024 18:33:33 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skvwg-000522-2R;
	Mon, 02 Sep 2024 01:33:30 +0000
Date: Mon, 2 Sep 2024 09:33:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFC v3 05/17] fuse: Add a uring config ioctl
Message-ID: <202409020829.pfrqKsc1-lkp@intel.com>
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
In-Reply-To: <20240901-b4-fuse-uring-rfcv3-without-mmap-v3-5-9207f7391444@ddn.com>
References: <20240901-b4-fuse-uring-rfcv3-without-mmap-v3-5-9207f7391444@ddn.com>
TO: Bernd Schubert <bschubert@ddn.com>

Hi Bernd,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 0c3836482481200ead7b416ca80c68a29cfdaabd]

url:    https://github.com/intel-lab-lkp/linux/commits/Bernd-Schubert/fuse-rename-to-fuse_dev_end_requests-and-make-non-static/20240901-213956
base:   0c3836482481200ead7b416ca80c68a29cfdaabd
patch link:    https://lore.kernel.org/r/20240901-b4-fuse-uring-rfcv3-without-mmap-v3-5-9207f7391444%40ddn.com
patch subject: [PATCH RFC v3 05/17] fuse: Add a uring config ioctl
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409020829.pfrqKsc1-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/fuse/dev_uring.c: linux/io_uring.h is included more than once.
>> fs/fuse/dev_uring.c: linux/io_uring/cmd.h is included more than once.

vim +24 fs/fuse/dev_uring.c

    10	
    11	#include <linux/init.h>
    12	#include <linux/module.h>
    13	#include <linux/poll.h>
    14	#include <linux/sched/signal.h>
    15	#include <linux/uio.h>
    16	#include <linux/miscdevice.h>
    17	#include <linux/pagemap.h>
    18	#include <linux/file.h>
    19	#include <linux/slab.h>
    20	#include <linux/pipe_fs_i.h>
    21	#include <linux/swap.h>
    22	#include <linux/splice.h>
    23	#include <linux/sched.h>
  > 24	#include <linux/io_uring.h>
    25	#include <linux/mm.h>
    26	#include <linux/io.h>
  > 27	#include <linux/io_uring.h>
    28	#include <linux/io_uring/cmd.h>
    29	#include <linux/topology.h>
    30	#include <linux/io_uring/cmd.h>
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
