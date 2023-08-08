Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A35B1B7F0
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Aug 2023 21:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691528897; x=1723064897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZmN912JnTxk5nic9HLQNX+3HfVuY8/UB5rTe4LbiEvE=;
  b=cQycBnv/trJXa89yqVdzQLCP6DiWw4CvXVFHNnEGlVNqx4lyFSgMi46r
   LfTA6Uo9PIa27YH5cZMpcDQQO3SVnj5WWexHuJI+EDCfhNbtO0SgiY0ao
   CmRY2SnKRn9n3aoumWxDNQQDtv1vTpqJf3NKexBBNBvc1JknpqlVeGxaJ
   Sj1g99xuPd5J0aowp/DC3YMqr0mljLY+rrZXkFwJZdh9PgklFZyQ6fLt3
   YI33X111wpOfmGgozmImUo2UjLZk7EYbb/8s/OvhAWgOucK0oThIUzRJx
   cYprFbbzv9m2voaaMvBVf65PMaeFg3xMSbOyVplPy6DDI7UTI4y8mv53K
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="457335050"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="457335050"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 14:08:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="801475884"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="801475884"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 08 Aug 2023 14:08:15 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTTw6-0005cc-1w;
	Tue, 08 Aug 2023 21:08:14 +0000
Date: Wed, 9 Aug 2023 05:07:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 5193/7933] sound/soc/sh/rcar/core.c:1287:1-23:
 WARNING: Function "for_each_child_of_node" should have of_node_put() before
 break around line 1296.
Message-ID: <202308090538.FnBjBHsL-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   71cd4fc492ec41e4acd85e98bbf7a13753fc1e03
commit: 547b02f74e4ac1e7d295a6266d5bc93a647cd4ac [5193/7933] ASoC: rsnd: enable multi Component support for Audio Graph Card/Card2
:::::: branch date: 16 hours ago
:::::: commit date: 8 days ago
config: arm-randconfig-r053-20230808 (https://download.01.org/0day-ci/archive/20230809/202308090538.FnBjBHsL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090538.FnBjBHsL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202308090538.FnBjBHsL-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/soc/sh/rcar/core.c:1287:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before break around line 1296.
   sound/soc/sh/rcar/core.c:1306:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before break around line 1315.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
