Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550731C07
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Apr 2023 13:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680960112; x=1712496112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+RQu5gF2B7fUG2Oly/go/dBczyhJrDHSqCzDwLsGB1w=;
  b=BGnuiqv6DW6JVe5TQ0IduNOPnOy5W8WzXm4WUb3yrfNeE0O8eeSoBzmw
   0XH7ofTYW1jNqN9LeEKHP1Wqozuji6vPPJe/XUnA8IfKnxjzbq6kRzsKV
   eb4xQGZgDm8mKqAbeaAnFagsnh8iFO1RDCVbIL8JIXnhhMlzhTPGHqu0k
   f7sId4CRJPEpnyhiAraHwVqZ2kS962vIses/ZpUzF032dxWeTTAveTEys
   235lhIF+JKCR+lsknnKv1nsvfP4Mz9EJ1y6sM3vAcX8JMjo8loQsJF6k9
   EabgUtrk/89WHwmmOnpaKipZMWHrAVXA83MiDYb1Fxj3MRMliD70W1O1I
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="323507735"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="323507735"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2023 06:21:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="777095683"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="777095683"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Apr 2023 06:21:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pl8Vp-000Tkt-2n;
	Sat, 08 Apr 2023 13:21:49 +0000
Date: Sat, 8 Apr 2023 21:21:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [chrome-os:chromeos-6.1 47/76] drivers/regulator/core.c:252:16-17:
 WARNING opportunity for swap()
Message-ID: <202304082153.iyN7CwuV-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   ba182faf669dff6e8eaef91b0df486c9056c3fcd
commit: 2e1bccb7c31940097e64b9b2bc54c26330225087 [47/76] FROMGIT: regulator: core: Avoid lockdep reports when resolving supplies
:::::: branch date: 9 hours ago
:::::: commit date: 20 hours ago
config: arc-randconfig-c004-20230403 (https://download.01.org/0day-ci/archive/20230408/202304082153.iyN7CwuV-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202304082153.iyN7CwuV-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/regulator/core.c:252:16-17: WARNING opportunity for swap()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
