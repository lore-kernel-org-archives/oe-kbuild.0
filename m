Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2953536C
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Feb 2023 01:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675906882; x=1707442882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9RnFu1PIy839FyRuVAXsGHoWlK4vg5m1aNncHQMZI6g=;
  b=caeFEDcXLBJXS1X+Q42qe9VpLw7xQK6DLMX6liSNTM4I5NwWKr1nUjPI
   xChVagR9pl0JhXu6GIISMUct57mS+H3ZguqMixu0wvgN5dNdeYTo/W+rc
   qdvdZVzHwSjSJxXcbTDvvhHLHKhdqxEFEdGO3C6JRBupmMRu65U6WEpo6
   GhUtCyTORaRxvdkk3AKehlegqCf/XC2C4suoJPyXsLuwRt9/McXWMBWkL
   WkXdHFGu5ak/HjbZPV0Uiv8nc7KOscnIwUrBe9HhYr1qq0q90WpUCpO79
   DSF+i7jDrlGhBYmlcR7DHX4NV0UscDVQf1hP77aUlxGyoX2nYjch5glod
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="416202805"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="416202805"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 17:41:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="731079649"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="731079649"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 Feb 2023 17:41:20 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPvw7-0004kM-2O;
	Thu, 09 Feb 2023 01:41:19 +0000
Date: Thu, 9 Feb 2023 09:40:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 4437/11179] drivers/base/cacheinfo.c:265:5-11:
 WARNING: Unsigned expression compared with zero: leaves > 0
Message-ID: <202302090917.3QqKlABc-lkp@intel.com>
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
TO: Pierre Gondois <pierre.gondois@arm.com>
CC: Sudeep Holla <sudeep.holla@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   38d2b86a665b5e86371a1a30228bce259aa6c101
commit: de0df442ee49cb1f6ee58f3fec5dcb5e5eb70aab [4437/11179] cacheinfo: Check 'cache-unified' property to count cache leaves
:::::: branch date: 22 hours ago
:::::: commit date: 3 weeks ago
config: parisc-randconfig-c041-20230209 (https://download.01.org/0day-ci/archive/20230209/202302090917.3QqKlABc-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>

| Link: https://lore.kernel.org/r/202302090917.3QqKlABc-lkp@intel.com

cocci warnings: (new ones prefixed by >>)
>> drivers/base/cacheinfo.c:265:5-11: WARNING: Unsigned expression compared with zero: leaves > 0

vim +265 drivers/base/cacheinfo.c

de0df442ee49cb Pierre Gondois 2023-01-04  256  
de0df442ee49cb Pierre Gondois 2023-01-04  257  int init_of_cache_level(unsigned int cpu)
de0df442ee49cb Pierre Gondois 2023-01-04  258  {
de0df442ee49cb Pierre Gondois 2023-01-04  259  	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
de0df442ee49cb Pierre Gondois 2023-01-04  260  	struct device_node *np = of_cpu_device_node_get(cpu);
de0df442ee49cb Pierre Gondois 2023-01-04  261  	struct device_node *prev = NULL;
de0df442ee49cb Pierre Gondois 2023-01-04  262  	unsigned int levels = 0, leaves, level;
de0df442ee49cb Pierre Gondois 2023-01-04  263  
de0df442ee49cb Pierre Gondois 2023-01-04  264  	leaves = of_count_cache_leaves(np);
c3719bd9eeb2ed Pierre Gondois 2023-01-04 @265  	if (leaves > 0)
c3719bd9eeb2ed Pierre Gondois 2023-01-04  266  		levels = 1;
c3719bd9eeb2ed Pierre Gondois 2023-01-04  267  
c3719bd9eeb2ed Pierre Gondois 2023-01-04  268  	prev = np;
c3719bd9eeb2ed Pierre Gondois 2023-01-04  269  	while ((np = of_find_next_cache_node(np))) {
c3719bd9eeb2ed Pierre Gondois 2023-01-04  270  		of_node_put(prev);
c3719bd9eeb2ed Pierre Gondois 2023-01-04  271  		prev = np;
c3719bd9eeb2ed Pierre Gondois 2023-01-04  272  		if (!of_device_is_compatible(np, "cache"))
8844c3df001bc1 Pierre Gondois 2023-01-04  273  			goto err_out;
c3719bd9eeb2ed Pierre Gondois 2023-01-04  274  		if (of_property_read_u32(np, "cache-level", &level))
8844c3df001bc1 Pierre Gondois 2023-01-04  275  			goto err_out;
c3719bd9eeb2ed Pierre Gondois 2023-01-04  276  		if (level <= levels)
8844c3df001bc1 Pierre Gondois 2023-01-04  277  			goto err_out;
de0df442ee49cb Pierre Gondois 2023-01-04  278  
de0df442ee49cb Pierre Gondois 2023-01-04  279  		leaves += of_count_cache_leaves(np);
c3719bd9eeb2ed Pierre Gondois 2023-01-04  280  		levels = level;
c3719bd9eeb2ed Pierre Gondois 2023-01-04  281  	}
c3719bd9eeb2ed Pierre Gondois 2023-01-04  282  
c3719bd9eeb2ed Pierre Gondois 2023-01-04  283  	of_node_put(np);
c3719bd9eeb2ed Pierre Gondois 2023-01-04  284  	this_cpu_ci->num_levels = levels;
c3719bd9eeb2ed Pierre Gondois 2023-01-04  285  	this_cpu_ci->num_leaves = leaves;
c3719bd9eeb2ed Pierre Gondois 2023-01-04  286  
c3719bd9eeb2ed Pierre Gondois 2023-01-04  287  	return 0;
8844c3df001bc1 Pierre Gondois 2023-01-04  288  
8844c3df001bc1 Pierre Gondois 2023-01-04  289  err_out:
8844c3df001bc1 Pierre Gondois 2023-01-04  290  	of_node_put(np);
8844c3df001bc1 Pierre Gondois 2023-01-04  291  	return -EINVAL;
c3719bd9eeb2ed Pierre Gondois 2023-01-04  292  }
c3719bd9eeb2ed Pierre Gondois 2023-01-04  293  

:::::: The code at line 265 was first introduced by commit
:::::: c3719bd9eeb2edf84bd263d662e36ca0ba262a23 cacheinfo: Use RISC-V's init_cache_level() as generic OF implementation

:::::: TO: Pierre Gondois <pierre.gondois@arm.com>
:::::: CC: Sudeep Holla <sudeep.holla@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
