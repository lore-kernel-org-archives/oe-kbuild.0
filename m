Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D2923A7
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Apr 2023 14:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681049013; x=1712585013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Nr8bfXfyT0hsN6TArdpWTULgE3fPmpNJq51+AOVWk4=;
  b=Y9WorNwYnWTiCYkTI052x7oYmazHL35MVIi9PHlDza++GWdx8JFScXdb
   xLWZlsApUs2HaRob1oHOC+o14WKQXWcgtxqjxbNOOu0w0brhk7IviJ0Yu
   YPOlU84TMO8VnPlVzdchg1vy4Z1XyFPUQUgMTrG1lUED4Ds8NMX8blGWJ
   a0KW/ExxaQJeEiDenLieKkD4czr10oiCa81OA7L6lRqwTWjRBtmRZK6Fl
   4Sg4VoPEC7vHI9n5U2I9xnn/ELPxpADDL3C5TzxvevSOzMN7E56gcj9vs
   /PcGG5TFbbcfaqPWhPB1VKB6csfEfCZ4GdlNJvP+1T1/xu8nNVpBeGd3j
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="406049233"
X-IronPort-AV: E=Sophos;i="5.98,331,1673942400"; 
   d="scan'208";a="406049233"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 07:03:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="777320181"
X-IronPort-AV: E=Sophos;i="5.98,331,1673942400"; 
   d="scan'208";a="777320181"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Apr 2023 07:03:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plVdi-000UXd-2Z;
	Sun, 09 Apr 2023 14:03:30 +0000
Date: Sun, 9 Apr 2023 22:02:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cxl:for-6.5/dcd-preview 13/15] drivers/cxl/pci.c:570:8-33: WARNING:
 Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
 it is nested IRQ)
Message-ID: <202304092144.OTGgyFkD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Alison Schofield <alison.schofield@intel.com>
CC: Vishal Verma <vishal.l.verma@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>
CC: Ben Widawsky <ben.widawsky@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>
TO: Navneet Singh <navneet.singh@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git for-6.5/dcd-preview
head:   f425bc34c600e2a3721d6560202962ec41622815
commit: 3113a430f1ccbad8340234cf38b00f271ccee103 [13/15] cxl/mem: Add support to handle DCD add and release capacity events.
:::::: branch date: 11 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-c022 (https://download.01.org/0day-ci/archive/20230409/202304092144.OTGgyFkD-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202304092144.OTGgyFkD-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/cxl/pci.c:570:8-33: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
