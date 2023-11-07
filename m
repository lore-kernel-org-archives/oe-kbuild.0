Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F392EB1F
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Nov 2023 12:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RLVZ4liU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699359405; x=1730895405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=meFYGY931eh2KeAYsz2XdxNtqJRO84zFvacsf96AVCY=;
  b=RLVZ4liUgNYwS0O64A38ZGwCuWjm16z/gpsJIdIWm35oeO9esmrDw+3y
   VmIkZtJLY1DyXvk6RfT4VFgSvopI7/hNSZ9TdI8XQEfIRXvAJaYGcrysh
   xlEEFQVNDRs+EVGMZFGQwEMGIB9J9J7hh8irM5/BYG+3WAfWkuiCMLVtW
   P+3OsDzPdyiK8GkD/yf+8JSGX2Bny7cG/g5JU0OxRKsSY4jI4FBR00p3a
   DCKzS7M9qLdxiWJKEOn17PlCAXO4TsT6hSUBOCOsVrz2FJUWft1TrmWdK
   CCH/JkQh3WMafzeSB0pvy+vGb5Gj7ztwDaE5YYLWJfK5YocN4gIx7Gu15
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="420603764"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="420603764"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 04:16:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="762683589"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; 
   d="scan'208";a="762683589"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Nov 2023 04:16:43 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0L0b-00075S-1o;
	Tue, 07 Nov 2023 12:16:41 +0000
Date: Tue, 7 Nov 2023 20:15:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/m68k/virt/ints.c:139:30: sparse: sparse: cast to non-scalar
Message-ID: <202311072040.jWf9w1e3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/m68k/virt/ints.c:139:30: sparse: sparse: cast to non-scalar"
:::::: Manual check reason: "Committer is Greg Kroah-Hartman, remote is linus!"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   be3ca57cfb777ad820c6659d52e60bbdd36bf5ff
commit: 52c4d11f1dce60453ab2a75fd7103118cedb2b58 resource: Convert DEFINE_RES_NAMED() to be compound literal
date:   12 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 12 months ago
config: m68k-randconfig-r123-20231107 (https://download.01.org/0day-ci/archive/20231107/202311072040.jWf9w1e3-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231107/202311072040.jWf9w1e3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311072040.jWf9w1e3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/m68k/virt/ints.c:139:30: sparse: sparse: cast to non-scalar
>> arch/m68k/virt/ints.c:139:30: sparse: sparse: cast from non-scalar
--
>> arch/m68k/virt/config.c:116:20: sparse: sparse: cast to non-scalar
>> arch/m68k/virt/config.c:116:20: sparse: sparse: cast from non-scalar

vim +139 arch/m68k/virt/ints.c

05d51e42df06f0 Laurent Vivier 2022-04-06  129  
05d51e42df06f0 Laurent Vivier 2022-04-06  130  void __init virt_init_IRQ(void)
05d51e42df06f0 Laurent Vivier 2022-04-06  131  {
05d51e42df06f0 Laurent Vivier 2022-04-06  132  	unsigned int i;
05d51e42df06f0 Laurent Vivier 2022-04-06  133  
05d51e42df06f0 Laurent Vivier 2022-04-06  134  	m68k_setup_irq_controller(&virt_irq_chip, handle_simple_irq, IRQ_USER,
05d51e42df06f0 Laurent Vivier 2022-04-06  135  				  NUM_VIRT_SOURCES - IRQ_USER);
05d51e42df06f0 Laurent Vivier 2022-04-06  136  
05d51e42df06f0 Laurent Vivier 2022-04-06  137  	for (i = 0; i < 6; i++) {
05d51e42df06f0 Laurent Vivier 2022-04-06  138  
05d51e42df06f0 Laurent Vivier 2022-04-06 @139  		picres[i] = (struct resource)

:::::: The code at line 139 was first introduced by commit
:::::: 05d51e42df06f0211c7029ab9aa46c492ee85043 m68k: Introduce a virtual m68k machine

:::::: TO: Laurent Vivier <laurent@vivier.eu>
:::::: CC: Geert Uytterhoeven <geert@linux-m68k.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
