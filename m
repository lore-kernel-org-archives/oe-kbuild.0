Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28B2DDAB
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Nov 2023 06:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zi68kYwe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700114680; x=1731650680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X+H7HkAl2f42Pi0UnPpKjizij8rxTlReYaQpG+gmGPQ=;
  b=Zi68kYwe254I5tG4+BB781O6YKg2913K+ggcyMtZt06YTkTZbiBcaIUj
   KqSpWCVOYS+2+mU6cZZAoflplm6z2qVv4FQ2CNSgUGQB+30Ii385eAhyi
   oUkhXFZ2AO6Ru4u21f966j9Bf82/bqXsLaknKmW1G/WWhHI4rbOmhYPVN
   mhxBkE4XK7Ol2Xi40w0TtkM2dzMzplhUkPtltLmh5l3TRsqKOhoZxg+rs
   0a5QcGYaT/iXxsALRIGpcCrZdjGYMYOvs2RVEfzmPhSPffJ2szvd6kKwW
   8eOFwGAvysedzpALRft71FG2fN5K0DFXCdmU5tFTDjo+Hi1gvkprX58IE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="12578860"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="12578860"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 22:04:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="758722576"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="758722576"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Nov 2023 22:04:38 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3VUS-0001Mq-0C;
	Thu, 16 Nov 2023 06:04:36 +0000
Date: Thu, 16 Nov 2023 14:03:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/tty/serial/sifive.c:1036:1: sparse: sparse: symbol
 'sifive_uart_pm_ops' was not declared. Should it be static?
Message-ID: <202311161334.K9mAPyUO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "Committer is Greg Kroah-Hartman, remote is linus!"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nick Hu <nick.hu@sifive.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Ben Dooks <ben.dooks@codethink.co.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 8a6498f2b94333f1793bc912b11830655f975470 serial: sifive: Add suspend and resume operations
date:   3 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-x001-20230717 (https://download.01.org/0day-ci/archive/20231116/202311161334.K9mAPyUO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311161334.K9mAPyUO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311161334.K9mAPyUO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tty/serial/sifive.c:1036:1: sparse: sparse: symbol 'sifive_uart_pm_ops' was not declared. Should it be static?

vim +/sifive_uart_pm_ops +1036 drivers/tty/serial/sifive.c

8a6498f2b94333 Nick Hu 2023-08-15  1035  
8a6498f2b94333 Nick Hu 2023-08-15 @1036  DEFINE_SIMPLE_DEV_PM_OPS(sifive_uart_pm_ops, sifive_serial_suspend,
8a6498f2b94333 Nick Hu 2023-08-15  1037  			 sifive_serial_resume);
8a6498f2b94333 Nick Hu 2023-08-15  1038  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
