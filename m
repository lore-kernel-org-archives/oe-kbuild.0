Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E04F5687
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Aug 2023 20:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692043495; x=1723579495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z4sU4LPqlXpgxO7G9Fxm3EHLSWOS+CEc6xmVUbfJDps=;
  b=hmjeXT2PuWNnCN2kHzCSfHPjacLd7T27cLUbvdtx4YtKNE8KZus9W1ey
   P2Yro5tP+keVcKkYVojy8wngywUychcRuESkAbloaJtLjc0KLVrl417mP
   zlY6diL1FB2u4jBJ+HOEqoJYAzAaCCzTh2nGuVkX9/gAStSa7HbGi2esW
   EgNUFjseWfmHrqt+M+p95Q8oFWGifGXnx6sGPsp0erz3o64B3G2KRuuD4
   WjFPT38ZKfACWn8NznTBPNcsZGDrKidOZS2u9XLUOOAGaTcmsFz4sRFhI
   2CY6JBdJZ/1jlCSRkBimktbs0u4WmNDexkYjbwmpEPo2QYpby68EueMqo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="369602561"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="369602561"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 13:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="727125569"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="727125569"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Aug 2023 13:04:53 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVdo4-0000O7-2M;
	Mon, 14 Aug 2023 20:04:52 +0000
Date: Tue, 15 Aug 2023 04:04:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [shenki:dev-6.5 44/93] drivers/soc/aspeed/aspeed-xdma.c:911:2-9:
 line 911 is redundant because platform_get_irq() already prints an error
Message-ID: <202308150346.vIWV4NS6-lkp@intel.com>
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
TO: Joel Stanley <joel@jms.id.au>

tree:   https://github.com/shenki/linux dev-6.5
head:   e874a83263bd783e23411cf6ab12622ac36362f5
commit: 41affdd4fbf5a3b0d97377938955a0a3a596efed [44/93] soc: aspeed: xdma: Add user interface
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-r054-20230815 (https://download.01.org/0day-ci/archive/20230815/202308150346.vIWV4NS6-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150346.vIWV4NS6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202308150346.vIWV4NS6-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/soc/aspeed/aspeed-xdma.c:911:2-9: line 911 is redundant because platform_get_irq() already prints an error

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
