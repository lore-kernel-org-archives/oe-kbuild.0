Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D37A57
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Sep 2023 22:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695595741; x=1727131741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=suckDHk9cPZSD8kA3e3PqhWFs4ZiF2sW+6Wq6zoUv/4=;
  b=dx05p4Ub07rFZaZESAOIEXRhxocVMieAHHpWilOThnRaBKDpBtvdi6y1
   KKbRCT3yP9M5EXCCpWWTV9ClCaEVRcLso1yM8zkMe+TOXU2Iaq3vceAPB
   4I0GMzN8SJ1SF8do5NJZum9nyP18SXfg+6Q8VCKUstBzt8iRWorH6sA5L
   d7NdPVMcPGyfJ1Dm1Z2rYrAWKSUWCA7DjmL9VLTCGyporKMFeTWJjGxOj
   w1aV8rSulELS9XlOxbyl9xM7EipyLO7XB1MuEeaAJwIoobZisZge8TqcF
   lJd+2F2AsXjWkbtn+KW0PPNw+DinT3npWXQhLMwgX9GJg3PBtPVQF5CAh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="378400003"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="378400003"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 15:49:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="921786110"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="921786110"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 24 Sep 2023 15:48:59 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkXuK-0000Yr-1O;
	Sun, 24 Sep 2023 22:48:56 +0000
Date: Mon, 25 Sep 2023 06:48:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2626/6975] fs/bcachefs/journal_reclaim.c:57:33:
 sparse: sparse: invalid access past the end of 'new' (4 8)
Message-ID: <202309250617.6EPwctHm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: fs/bcachefs/journal_reclaim.c:57:33: sparse: sparse: invalid access past the end of 'new' (4 8)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   940fcc189c51032dd0282cbee4497542c982ac59
commit: 38e616ec358d67e922b7f82d55d2f5b64dd3124d [2626/6975] bcachefs: Eliminate memory barrier from fast path of journal_preres_put()
:::::: branch date: 4 days ago
:::::: commit date: 13 days ago
config: i386-randconfig-062-20230924 (https://download.01.org/0day-ci/archive/20230925/202309250617.6EPwctHm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309250617.6EPwctHm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309250617.6EPwctHm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/journal_reclaim.c: note: in included file:
   fs/bcachefs/bcachefs.h:771:9: sparse: sparse: array of flexible structures
   fs/bcachefs/journal_reclaim.c:623:26: sparse: sparse: incompatible types in comparison expression (different type sizes):
   fs/bcachefs/journal_reclaim.c:623:26: sparse:    unsigned int *
   fs/bcachefs/journal_reclaim.c:623:26: sparse:    unsigned long *
>> fs/bcachefs/journal_reclaim.c:57:33: sparse: sparse: invalid access past the end of 'new' (4 8)
   fs/bcachefs/journal_reclaim.c: note: in included file:
   fs/bcachefs/journal.h:388:34: sparse: sparse: invalid access past the end of 's' (4 8)

vim +/new +57 fs/bcachefs/journal_reclaim.c

cd44c469c719de Kent Overstreet 2019-02-21  49  
e65c9500a745e5 Kent Overstreet 2019-02-19  50  static void journal_set_remaining(struct journal *j, unsigned u64s_remaining)
e65c9500a745e5 Kent Overstreet 2019-02-19  51  {
e65c9500a745e5 Kent Overstreet 2019-02-19  52  	union journal_preres_state old, new;
e65c9500a745e5 Kent Overstreet 2019-02-19  53  	u64 v = atomic64_read(&j->prereserved.counter);
e65c9500a745e5 Kent Overstreet 2019-02-19  54  
e65c9500a745e5 Kent Overstreet 2019-02-19  55  	do {
e65c9500a745e5 Kent Overstreet 2019-02-19  56  		old.v = new.v = v;
e65c9500a745e5 Kent Overstreet 2019-02-19 @57  		new.remaining = u64s_remaining;
e65c9500a745e5 Kent Overstreet 2019-02-19  58  	} while ((v = atomic64_cmpxchg(&j->prereserved.counter,
e65c9500a745e5 Kent Overstreet 2019-02-19  59  				       old.v, new.v)) != old.v);
e65c9500a745e5 Kent Overstreet 2019-02-19  60  }
e65c9500a745e5 Kent Overstreet 2019-02-19  61  

:::::: The code at line 57 was first introduced by commit
:::::: e65c9500a745e5e75c3f01d6e5246a135ec7c019 bcachefs: Add a pre-reserve mechanism for the journal

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
