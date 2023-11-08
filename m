Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CBE3716B
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Nov 2023 20:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UoJSPfGC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699474797; x=1731010797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zjSSSjAwsgZSNNvV8/6jekGBFEpoQAbaGZZZ7G+gOIA=;
  b=UoJSPfGCUtCYYmpP4QiyszwgnmDqt0/TifZDiTD3lXl777tEb6D/QW8G
   cPMjw5fh0biAHSbK8cyzG0Jlf/o4KKS/3txMz0d6ZZkR9xpYliE1H/5YZ
   N4l+1hMB+4YCKkbbzC5/gAM14bMZ+Ruvub1xzrbg8i3uV95871Q08HKfR
   m5/O5ezMADcsHFYiYOajyeoA5SZ9/tiZqnoGczXGQVRtO6JCyCg98FDrf
   OciXLYdLB7nG8UjHsDV/+BYqeJRWPsagxFFkLpp/SGTxxA74cBOzMW1Hz
   i7xcm+BMoC2/3LyhkqB/kZ28/CzXCot/rOZR8hJVj7+XKlvMqK2h0AUvq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="370059451"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; 
   d="scan'208";a="370059451"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 12:19:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="739618769"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; 
   d="scan'208";a="739618769"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Nov 2023 12:19:55 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0p1l-00089w-0C;
	Wed, 08 Nov 2023 20:19:53 +0000
Date: Thu, 9 Nov 2023 04:19:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/locking/lockdep_proc.c:420:17: sparse:    struct
 lockdep_subclass_key const *
Message-ID: <202311090415.m7MsM8LN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/locking/lockdep_proc.c:420:17: sparse:    struct lockdep_subclass_key const *"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Bart Van Assche <bvanassche@acm.org>
CC: Ingo Molnar <mingo@kernel.org>
CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   90450a06162e6c71ab813ea22a83196fe7cff4bc
commit: 364f6afc4f5537b79cf454eb35cae92920676075 locking/lockdep: Make it clear that what lock_class::key points at is not modified
date:   4 years, 4 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 4 years, 4 months ago
config: i386-randconfig-062-20230912 (https://download.01.org/0day-ci/archive/20231109/202311090415.m7MsM8LN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311090415.m7MsM8LN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311090415.m7MsM8LN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/locking/lockdep_proc.c:419:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/locking/lockdep_proc.c:419:17: sparse:    char const [noderef] <asn:4> *
   kernel/locking/lockdep_proc.c:419:17: sparse:    char const *
   kernel/locking/lockdep_proc.c:420:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/locking/lockdep_proc.c:420:17: sparse:    struct lockdep_subclass_key const [noderef] <asn:4> *
>> kernel/locking/lockdep_proc.c:420:17: sparse:    struct lockdep_subclass_key const *

vim +420 kernel/locking/lockdep_proc.c

c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  399  
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  400  static void seq_stats(struct seq_file *m, struct lock_stat_data *data)
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  401  {
364f6afc4f5537 kernel/locking/lockdep_proc.c Bart Van Assche 2019-07-22  402  	const struct lockdep_subclass_key *ckey;
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  403  	struct lock_class_stats *stats;
cee34d88cabd1b kernel/locking/lockdep_proc.c Peter Zijlstra  2015-06-02  404  	struct lock_class *class;
cee34d88cabd1b kernel/locking/lockdep_proc.c Peter Zijlstra  2015-06-02  405  	const char *cname;
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  406  	int i, namelen;
cee34d88cabd1b kernel/locking/lockdep_proc.c Peter Zijlstra  2015-06-02  407  	char name[39];
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  408  
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  409  	class = data->class;
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  410  	stats = &data->stats;
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  411  
d38e1d5aaee384 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  412  	namelen = 38;
d38e1d5aaee384 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  413  	if (class->name_version > 1)
d38e1d5aaee384 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  414  		namelen -= 2; /* XXX truncates versions > 9 */
d38e1d5aaee384 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  415  	if (class->subclass)
d38e1d5aaee384 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  416  		namelen -= 2;
d38e1d5aaee384 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  417  
cee34d88cabd1b kernel/locking/lockdep_proc.c Peter Zijlstra  2015-06-02  418  	rcu_read_lock_sched();
cee34d88cabd1b kernel/locking/lockdep_proc.c Peter Zijlstra  2015-06-02  419  	cname = rcu_dereference_sched(class->name);
cee34d88cabd1b kernel/locking/lockdep_proc.c Peter Zijlstra  2015-06-02 @420  	ckey  = rcu_dereference_sched(class->key);
cee34d88cabd1b kernel/locking/lockdep_proc.c Peter Zijlstra  2015-06-02  421  
cee34d88cabd1b kernel/locking/lockdep_proc.c Peter Zijlstra  2015-06-02  422  	if (!cname && !ckey) {
cee34d88cabd1b kernel/locking/lockdep_proc.c Peter Zijlstra  2015-06-02  423  		rcu_read_unlock_sched();
cee34d88cabd1b kernel/locking/lockdep_proc.c Peter Zijlstra  2015-06-02  424  		return;
cee34d88cabd1b kernel/locking/lockdep_proc.c Peter Zijlstra  2015-06-02  425  
cee34d88cabd1b kernel/locking/lockdep_proc.c Peter Zijlstra  2015-06-02  426  	} else if (!cname) {
d38e1d5aaee384 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  427  		char str[KSYM_NAME_LEN];
d38e1d5aaee384 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  428  		const char *key_name;
d38e1d5aaee384 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  429  
cee34d88cabd1b kernel/locking/lockdep_proc.c Peter Zijlstra  2015-06-02  430  		key_name = __get_key_name(ckey, str);
d38e1d5aaee384 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  431  		snprintf(name, namelen, "%s", key_name);
d38e1d5aaee384 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  432  	} else {
cee34d88cabd1b kernel/locking/lockdep_proc.c Peter Zijlstra  2015-06-02  433  		snprintf(name, namelen, "%s", cname);
d38e1d5aaee384 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  434  	}
cee34d88cabd1b kernel/locking/lockdep_proc.c Peter Zijlstra  2015-06-02  435  	rcu_read_unlock_sched();
cee34d88cabd1b kernel/locking/lockdep_proc.c Peter Zijlstra  2015-06-02  436  
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  437  	namelen = strlen(name);
d38e1d5aaee384 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  438  	if (class->name_version > 1) {
d38e1d5aaee384 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  439  		snprintf(name+namelen, 3, "#%d", class->name_version);
d38e1d5aaee384 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  440  		namelen += 2;
d38e1d5aaee384 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  441  	}
d38e1d5aaee384 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  442  	if (class->subclass) {
d38e1d5aaee384 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  443  		snprintf(name+namelen, 3, "/%d", class->subclass);
d38e1d5aaee384 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  444  		namelen += 2;
d38e1d5aaee384 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  445  	}
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  446  
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  447  	if (stats->write_holdtime.nr) {
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  448  		if (stats->read_holdtime.nr)
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  449  			seq_printf(m, "%38s-W:", name);
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  450  		else
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  451  			seq_printf(m, "%40s:", name);
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  452  
96645678cd726e kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  453  		seq_printf(m, "%14lu ", stats->bounces[bounce_contended_write]);
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  454  		seq_lock_time(m, &stats->write_waittime);
96645678cd726e kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  455  		seq_printf(m, " %14lu ", stats->bounces[bounce_acquired_write]);
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  456  		seq_lock_time(m, &stats->write_holdtime);
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  457  		seq_puts(m, "\n");
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  458  	}
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  459  
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  460  	if (stats->read_holdtime.nr) {
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  461  		seq_printf(m, "%38s-R:", name);
96645678cd726e kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  462  		seq_printf(m, "%14lu ", stats->bounces[bounce_contended_read]);
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  463  		seq_lock_time(m, &stats->read_waittime);
96645678cd726e kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  464  		seq_printf(m, " %14lu ", stats->bounces[bounce_acquired_read]);
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  465  		seq_lock_time(m, &stats->read_holdtime);
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  466  		seq_puts(m, "\n");
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  467  	}
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  468  
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  469  	if (stats->read_waittime.nr + stats->write_waittime.nr == 0)
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  470  		return;
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  471  
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  472  	if (stats->read_holdtime.nr)
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  473  		namelen += 2;
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  474  
c7e78cff6b7518 kernel/lockdep_proc.c         Peter Zijlstra  2008-10-16  475  	for (i = 0; i < LOCKSTAT_POINTS; i++) {
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  476  		char ip[32];
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  477  
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  478  		if (class->contention_point[i] == 0)
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  479  			break;
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  480  
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  481  		if (!i)
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  482  			seq_line(m, '-', 40-namelen, namelen);
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  483  
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  484  		snprintf(ip, sizeof(ip), "[<%p>]",
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  485  				(void *)class->contention_point[i]);
3cf9b85b474e65 kernel/lockdep_proc.c         Joe Perches     2010-11-05  486  		seq_printf(m, "%40s %14lu %29s %pS\n",
3cf9b85b474e65 kernel/lockdep_proc.c         Joe Perches     2010-11-05  487  			   name, stats->contention_point[i],
3cf9b85b474e65 kernel/lockdep_proc.c         Joe Perches     2010-11-05  488  			   ip, (void *)class->contention_point[i]);
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  489  	}
c7e78cff6b7518 kernel/lockdep_proc.c         Peter Zijlstra  2008-10-16  490  	for (i = 0; i < LOCKSTAT_POINTS; i++) {
c7e78cff6b7518 kernel/lockdep_proc.c         Peter Zijlstra  2008-10-16  491  		char ip[32];
c7e78cff6b7518 kernel/lockdep_proc.c         Peter Zijlstra  2008-10-16  492  
c7e78cff6b7518 kernel/lockdep_proc.c         Peter Zijlstra  2008-10-16  493  		if (class->contending_point[i] == 0)
c7e78cff6b7518 kernel/lockdep_proc.c         Peter Zijlstra  2008-10-16  494  			break;
c7e78cff6b7518 kernel/lockdep_proc.c         Peter Zijlstra  2008-10-16  495  
c7e78cff6b7518 kernel/lockdep_proc.c         Peter Zijlstra  2008-10-16  496  		if (!i)
c7e78cff6b7518 kernel/lockdep_proc.c         Peter Zijlstra  2008-10-16  497  			seq_line(m, '-', 40-namelen, namelen);
c7e78cff6b7518 kernel/lockdep_proc.c         Peter Zijlstra  2008-10-16  498  
c7e78cff6b7518 kernel/lockdep_proc.c         Peter Zijlstra  2008-10-16  499  		snprintf(ip, sizeof(ip), "[<%p>]",
c7e78cff6b7518 kernel/lockdep_proc.c         Peter Zijlstra  2008-10-16  500  				(void *)class->contending_point[i]);
3cf9b85b474e65 kernel/lockdep_proc.c         Joe Perches     2010-11-05  501  		seq_printf(m, "%40s %14lu %29s %pS\n",
3cf9b85b474e65 kernel/lockdep_proc.c         Joe Perches     2010-11-05  502  			   name, stats->contending_point[i],
3cf9b85b474e65 kernel/lockdep_proc.c         Joe Perches     2010-11-05  503  			   ip, (void *)class->contending_point[i]);
c7e78cff6b7518 kernel/lockdep_proc.c         Peter Zijlstra  2008-10-16  504  	}
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  505  	if (i) {
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  506  		seq_puts(m, "\n");
1232e3807f5977 kernel/lockdep_proc.c         Davidlohr Bueso 2013-10-08  507  		seq_line(m, '.', 0, 40 + 1 + 12 * (14 + 1));
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  508  		seq_puts(m, "\n");
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  509  	}
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  510  }
c46261de0d9837 kernel/lockdep_proc.c         Peter Zijlstra  2007-07-19  511  

:::::: The code at line 420 was first introduced by commit
:::::: cee34d88cabd1ba5fc93e09b5b12232bc9338c7c lockdep: Fix a race between /proc/lock_stat and module unload

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
