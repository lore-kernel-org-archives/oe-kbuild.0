Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D09764B
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Sep 2023 01:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695690165; x=1727226165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cTlSqMlAhvu++OnMTnUTDiQwqE6FhiVKekRqC+lNTo8=;
  b=A2yjqNE1vooJ5bwLUr6a3ociIe+3wD1aDjxC4++SHFJkSHRiWvCOJhDT
   vewJDjw004sIyOqtwigO4b+tdREkcZmSG2C7xM/QN8IA/C+x8g3vAuC4b
   WLzlZGRTOCSoSeXZey7Ps4hdn7UwAKMmxJfJVIBzwEqYv4moVBWHZnwbi
   OuHD031MYsraUs8+lFBlwwvkI0hsPe2qagxHJAG3gwbw8anNsdC+dsxtc
   wlOHV6Qrz5Xx7u6Mfl6yTJvZfn9DlFIid7AvXlFSnJStJmHXKpcA5khN0
   jwhjLdgT3oj+ZBGPg1QVoB2fxY5NHEASDLMnuHOTuiL4RSw6eN3Ys5nW5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="445579888"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="445579888"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 18:02:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="814267940"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="814267940"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 25 Sep 2023 18:02:40 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkwTG-0002D3-3C;
	Tue, 26 Sep 2023 01:02:38 +0000
Date: Tue, 26 Sep 2023 09:01:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2552/7575] fs/bcachefs/journal_reclaim.c:57:33:
 sparse: sparse: invalid access past the end of 'new' (4 8)
Message-ID: <202309260856.Hj9UGI77-lkp@intel.com>
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
head:   8fff9184d1b5810dca5dd1a02726d4f844af88fc
commit: 38e616ec358d67e922b7f82d55d2f5b64dd3124d [2552/7575] bcachefs: Eliminate memory barrier from fast path of journal_preres_put()
:::::: branch date: 20 hours ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-062-20230924 (https://download.01.org/0day-ci/archive/20230926/202309260856.Hj9UGI77-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309260856.Hj9UGI77-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309260856.Hj9UGI77-lkp@intel.com/

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
