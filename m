Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346C824200
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Oct 2023 21:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ML9ZXHCr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697231799; x=1728767799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i8ggQBNdDz4qxHCc+FdT7DRBBX5Muu9WISaQyTps0qA=;
  b=ML9ZXHCrG1e4r3fQWqkssN8eqq0zs6wTkFp9qie8tKflAMOh5F/GAmZt
   IivrbjMEZML4Moqq5pi4aH3Qg5Qr/k4LlDrTQHc549t+yZExqfxl8nRCF
   wmlZuxNqBLAHr5y/6RxfHdPuZySw1qG2h1O4vCK6/YGGGw7mQiwVdrZF+
   6SWJ+SVlvx3Ozb+he4wswGC+sw7iV29NgcBzk3TXP6TGlIQkFKthacqm/
   Y6ejkU7VcNVPdEB2fwiRiuwFL76JEEq8KWBYcihEQp2hSQz/PhbTWlFNy
   XFzy0gbGGVLie/Drk9/W+xdLrx4QGnif2HLDfk3MefTSRq+x9maO5ja0N
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="375620267"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="375620267"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 14:16:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="789998790"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="789998790"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 13 Oct 2023 14:16:37 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrPWM-0005Od-12;
	Fri, 13 Oct 2023 21:16:34 +0000
Date: Sat, 14 Oct 2023 05:15:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/3] mm: multi-gen LRU: fold lru_gen run cmd
Message-ID: <202310140550.OJEub4oD-lkp@intel.com>
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
In-Reply-To: <20231009025726.5982-2-link@vivo.com>
References: <20231009025726.5982-2-link@vivo.com>
TO: Huan Yang <link@vivo.com>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Johannes Weiner <hannes@cmpxchg.org>
TO: Michal Hocko <mhocko@kernel.org>
TO: Roman Gushchin <roman.gushchin@linux.dev>
TO: Shakeel Butt <shakeelb@google.com>
TO: Muchun Song <muchun.song@linux.dev>
TO: Yu Zhao <yuzhao@google.com>
TO: Peter Xu <peterx@redhat.com>
TO: David Hildenbrand <david@redhat.com>
TO: "T.J. Alumbaugh" <talumbau@google.com>
TO: Axel Rasmussen <axelrasmussen@google.com>
TO: Ryan Roberts <ryan.roberts@arm.com>
TO: Kefeng Wang <wangkefeng.wang@huawei.com>
TO: Suren Baghdasaryan <surenb@google.com>
TO: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
TO: open list <linux-kernel@vger.kernel.org>
TO: "open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>
CC: opensource.kernel@vivo.com
CC: Huan Yang <link@vivo.com>

Hi Huan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.6-rc5 next-20231013]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Huan-Yang/mm-multi-gen-LRU-fold-lru_gen-run-cmd/20231009-105856
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231009025726.5982-2-link%40vivo.com
patch subject: [PATCH 1/3] mm: multi-gen LRU: fold lru_gen run cmd
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-161-20231013 (https://download.01.org/0day-ci/archive/20231014/202310140550.OJEub4oD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310140550.OJEub4oD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310140550.OJEub4oD-lkp@intel.com/

smatch warnings:
mm/vmscan.c:5378 __process_one_cmd() error: uninitialized symbol 'err'.

vim +/err +5378 mm/vmscan.c

d6c3af7d8a2ba5 Yu Zhao  2022-09-18  5357  
dde447709e6fa8 HuanYang 2023-10-09  5358  static int __process_one_cmd(char cmd, struct lruvec *lruvec, unsigned long seq,
dde447709e6fa8 HuanYang 2023-10-09  5359  			     struct scan_control *sc, int swappiness,
dde447709e6fa8 HuanYang 2023-10-09  5360  			     unsigned long opt)
dde447709e6fa8 HuanYang 2023-10-09  5361  {
dde447709e6fa8 HuanYang 2023-10-09  5362  	int err;
dde447709e6fa8 HuanYang 2023-10-09  5363  
dde447709e6fa8 HuanYang 2023-10-09  5364  	if (swappiness < 0)
dde447709e6fa8 HuanYang 2023-10-09  5365  		swappiness = get_swappiness(lruvec, sc);
dde447709e6fa8 HuanYang 2023-10-09  5366  	else if (swappiness > 200)
dde447709e6fa8 HuanYang 2023-10-09  5367  		return -EINVAL;
dde447709e6fa8 HuanYang 2023-10-09  5368  
dde447709e6fa8 HuanYang 2023-10-09  5369  	switch (cmd) {
dde447709e6fa8 HuanYang 2023-10-09  5370  	case '+':
dde447709e6fa8 HuanYang 2023-10-09  5371  		err = run_aging(lruvec, seq, sc, swappiness, opt);
dde447709e6fa8 HuanYang 2023-10-09  5372  		break;
dde447709e6fa8 HuanYang 2023-10-09  5373  	case '-':
dde447709e6fa8 HuanYang 2023-10-09  5374  		err = run_eviction(lruvec, seq, sc, swappiness, opt);
dde447709e6fa8 HuanYang 2023-10-09  5375  		break;
dde447709e6fa8 HuanYang 2023-10-09  5376  	}
dde447709e6fa8 HuanYang 2023-10-09  5377  
dde447709e6fa8 HuanYang 2023-10-09 @5378  	return err;
dde447709e6fa8 HuanYang 2023-10-09  5379  }
dde447709e6fa8 HuanYang 2023-10-09  5380  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
