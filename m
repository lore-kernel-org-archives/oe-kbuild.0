Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F011FB0
	for <oe-kbuild@lists.linux.dev>; Sat,  6 May 2023 08:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683360246; x=1714896246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0+wH4RhUyP8y7xHy+j0DSncQTN+GZig9KNQ3hO1ZeQE=;
  b=DghP0f5LSL0YI0sPLKXrVDXepfOKaidKDgyExbwoYmsdtiz17pyVJVFO
   7FocXjlKTTW2M7mTOiqMRXo9saVYcXHZfB01BBcomIxaiIsyOVT2jtZkw
   GUJr1CejFwnZqrZg8MUwDvC8yR1cCI0Xl0LLKItHWLnzhYAKl/CiwV/K4
   AMyqxQpsROyNode1Nery8d+0BaucfrfaEhbrDXLV76WlidGa6aebkNpRf
   8YBxUyIRXxJKTTVCQFn68JJ9TJIj6sJbgiVNKVPjQBrKPd6Uk05SMaLfM
   5B7ovE34rzKF9IpCOdLfJQTbq1XPLtiX8vpBdbpxJZ+HVPJ1AK66XWVlr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="333789762"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="333789762"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 01:04:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="822027738"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="822027738"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 May 2023 01:04:05 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvCth-00002f-0P;
	Sat, 06 May 2023 08:04:05 +0000
Date: Sat, 6 May 2023 16:03:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: tools/perf/util/syscalltbl.c: asm/syscalls.c is included more than
 once.
Message-ID: <202305061615.UP7Cpr2T-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Huacai Chen <chenhuacai@loongson.cn>
CC: Ming Wang <wangming01@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2e1e1337881b0e9844d687982aa54b31b1269b11
commit: 2fa5ebe3bc4e31e07a99196455498472417842f2 tools/perf: Add basic support for LoongArch
date:   5 days ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 days ago
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202305061615.UP7Cpr2T-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
   tools/perf/util/syscalltbl.c: asm/syscalls_64.c is included more than once.
>> tools/perf/util/syscalltbl.c: asm/syscalls.c is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
