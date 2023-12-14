Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69C954BD8
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Dec 2023 13:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ql695Z0e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702560933; x=1734096933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vEkS+VPM5hQiQzzY5N71JXngEujdzPnpllsZRA8M9gU=;
  b=Ql695Z0er8s7yorqP1HmSUttElknCQwsaxNECzYMDC/rrI+sXFT4iBsa
   r3vXFUdQMNJnNmDKxnjj7urGUU/XXQPYr1fhqj7GF5Hps9qZVbrewV11Q
   XoZipRSxX2coGmYOvMU44LKJ9mppNiTEdnIBsNchjuOTJMv+tldoY8O2x
   TrzxSN1fMbOSeI2vev1ZRjE2w+BKS0wo86Do9HxT2SUKT5Utu8fpSW/V0
   3vHrOoz2eQjP81b48ERe0AXrqVXSeBfLakk1ojTEYinOZ/QaxU8dbNAJh
   uXs3CgUgL/2JzCR05omgJngHrHzDh6qlEMKcuMC3hReGjYQq0tIbABDRY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="397902673"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="397902673"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 05:35:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="808581825"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="808581825"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 14 Dec 2023 05:35:32 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDls9-000M8P-2m;
	Thu, 14 Dec 2023 13:35:29 +0000
Date: Thu, 14 Dec 2023 21:35:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/trace/trace_events_user.c:1826:16: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Message-ID: <202312142158.dqa8GNKr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5bd7ef53ffe5ca580e93e74eb8c81ed191ddc4bd
commit: 88fe1ec75fcb296579e05eaf3807da3ee83137e4 tracing: Unbreak user events
date:   9 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-061-20231101 (https://download.01.org/0day-ci/archive/20231214/202312142158.dqa8GNKr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312142158.dqa8GNKr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312142158.dqa8GNKr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/trace_events_user.c:1826:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> kernel/trace/trace_events_user.c:1826:16: sparse:    struct user_event_refs [noderef] __rcu *
>> kernel/trace/trace_events_user.c:1826:16: sparse:    struct user_event_refs *
   kernel/trace/trace_events_user.c:1934:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/trace_events_user.c:1934:16: sparse:    struct user_event_refs [noderef] __rcu *
   kernel/trace/trace_events_user.c:1934:16: sparse:    struct user_event_refs *
   kernel/trace/trace_events_user.c:1961:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/trace_events_user.c:1961:9: sparse:    struct user_event_refs [noderef] __rcu *
   kernel/trace/trace_events_user.c:1961:9: sparse:    struct user_event_refs *

vim +1826 kernel/trace/trace_events_user.c

7f5a08c79df35e Beau Belgrave 2022-01-18  1808  
7f5a08c79df35e Beau Belgrave 2022-01-18  1809  /*
7f5a08c79df35e Beau Belgrave 2022-01-18  1810   * Validates the user payload and writes via iterator.
7f5a08c79df35e Beau Belgrave 2022-01-18  1811   */
7f5a08c79df35e Beau Belgrave 2022-01-18  1812  static ssize_t user_events_write_core(struct file *file, struct iov_iter *i)
7f5a08c79df35e Beau Belgrave 2022-01-18  1813  {
e5d271812e7a4d Beau Belgrave 2022-09-30  1814  	struct user_event_file_info *info = file->private_data;
7f5a08c79df35e Beau Belgrave 2022-01-18  1815  	struct user_event_refs *refs;
7f5a08c79df35e Beau Belgrave 2022-01-18  1816  	struct user_event *user = NULL;
7f5a08c79df35e Beau Belgrave 2022-01-18  1817  	struct tracepoint *tp;
7f5a08c79df35e Beau Belgrave 2022-01-18  1818  	ssize_t ret = i->count;
7f5a08c79df35e Beau Belgrave 2022-01-18  1819  	int idx;
7f5a08c79df35e Beau Belgrave 2022-01-18  1820  
7f5a08c79df35e Beau Belgrave 2022-01-18  1821  	if (unlikely(copy_from_iter(&idx, sizeof(idx), i) != sizeof(idx)))
7f5a08c79df35e Beau Belgrave 2022-01-18  1822  		return -EFAULT;
7f5a08c79df35e Beau Belgrave 2022-01-18  1823  
7f5a08c79df35e Beau Belgrave 2022-01-18  1824  	rcu_read_lock_sched();
7f5a08c79df35e Beau Belgrave 2022-01-18  1825  
e5d271812e7a4d Beau Belgrave 2022-09-30 @1826  	refs = rcu_dereference_sched(info->refs);
7f5a08c79df35e Beau Belgrave 2022-01-18  1827  
7f5a08c79df35e Beau Belgrave 2022-01-18  1828  	/*
7f5a08c79df35e Beau Belgrave 2022-01-18  1829  	 * The refs->events array is protected by RCU, and new items may be
7f5a08c79df35e Beau Belgrave 2022-01-18  1830  	 * added. But the user retrieved from indexing into the events array
7f5a08c79df35e Beau Belgrave 2022-01-18  1831  	 * shall be immutable while the file is opened.
7f5a08c79df35e Beau Belgrave 2022-01-18  1832  	 */
7f5a08c79df35e Beau Belgrave 2022-01-18  1833  	if (likely(refs && idx < refs->count))
7f5a08c79df35e Beau Belgrave 2022-01-18  1834  		user = refs->events[idx];
7f5a08c79df35e Beau Belgrave 2022-01-18  1835  
7f5a08c79df35e Beau Belgrave 2022-01-18  1836  	rcu_read_unlock_sched();
7f5a08c79df35e Beau Belgrave 2022-01-18  1837  
7f5a08c79df35e Beau Belgrave 2022-01-18  1838  	if (unlikely(user == NULL))
7f5a08c79df35e Beau Belgrave 2022-01-18  1839  		return -ENOENT;
7f5a08c79df35e Beau Belgrave 2022-01-18  1840  
2467cda1b5c97a Beau Belgrave 2022-01-18  1841  	if (unlikely(i->count < user->min_size))
2467cda1b5c97a Beau Belgrave 2022-01-18  1842  		return -EINVAL;
2467cda1b5c97a Beau Belgrave 2022-01-18  1843  
7f5a08c79df35e Beau Belgrave 2022-01-18  1844  	tp = &user->tracepoint;
7f5a08c79df35e Beau Belgrave 2022-01-18  1845  
7f5a08c79df35e Beau Belgrave 2022-01-18  1846  	/*
7f5a08c79df35e Beau Belgrave 2022-01-18  1847  	 * It's possible key.enabled disables after this check, however
7f5a08c79df35e Beau Belgrave 2022-01-18  1848  	 * we don't mind if a few events are included in this condition.
7f5a08c79df35e Beau Belgrave 2022-01-18  1849  	 */
7f5a08c79df35e Beau Belgrave 2022-01-18  1850  	if (likely(atomic_read(&tp->key.enabled) > 0)) {
7f5a08c79df35e Beau Belgrave 2022-01-18  1851  		struct tracepoint_func *probe_func_ptr;
7f5a08c79df35e Beau Belgrave 2022-01-18  1852  		user_event_func_t probe_func;
0279400ad38d85 Beau Belgrave 2022-01-18  1853  		struct iov_iter copy;
7f5a08c79df35e Beau Belgrave 2022-01-18  1854  		void *tpdata;
2467cda1b5c97a Beau Belgrave 2022-01-18  1855  		bool faulted;
7f5a08c79df35e Beau Belgrave 2022-01-18  1856  
0279400ad38d85 Beau Belgrave 2022-01-18  1857  		if (unlikely(fault_in_iov_iter_readable(i, i->count)))
0279400ad38d85 Beau Belgrave 2022-01-18  1858  			return -EFAULT;
7f5a08c79df35e Beau Belgrave 2022-01-18  1859  
2467cda1b5c97a Beau Belgrave 2022-01-18  1860  		faulted = false;
2467cda1b5c97a Beau Belgrave 2022-01-18  1861  
7f5a08c79df35e Beau Belgrave 2022-01-18  1862  		rcu_read_lock_sched();
7f5a08c79df35e Beau Belgrave 2022-01-18  1863  
7f5a08c79df35e Beau Belgrave 2022-01-18  1864  		probe_func_ptr = rcu_dereference_sched(tp->funcs);
7f5a08c79df35e Beau Belgrave 2022-01-18  1865  
7f5a08c79df35e Beau Belgrave 2022-01-18  1866  		if (probe_func_ptr) {
7f5a08c79df35e Beau Belgrave 2022-01-18  1867  			do {
0279400ad38d85 Beau Belgrave 2022-01-18  1868  				copy = *i;
7f5a08c79df35e Beau Belgrave 2022-01-18  1869  				probe_func = probe_func_ptr->func;
7f5a08c79df35e Beau Belgrave 2022-01-18  1870  				tpdata = probe_func_ptr->data;
2467cda1b5c97a Beau Belgrave 2022-01-18  1871  				probe_func(user, &copy, tpdata, &faulted);
7f5a08c79df35e Beau Belgrave 2022-01-18  1872  			} while ((++probe_func_ptr)->func);
7f5a08c79df35e Beau Belgrave 2022-01-18  1873  		}
7f5a08c79df35e Beau Belgrave 2022-01-18  1874  
7f5a08c79df35e Beau Belgrave 2022-01-18  1875  		rcu_read_unlock_sched();
2467cda1b5c97a Beau Belgrave 2022-01-18  1876  
2467cda1b5c97a Beau Belgrave 2022-01-18  1877  		if (unlikely(faulted))
2467cda1b5c97a Beau Belgrave 2022-01-18  1878  			return -EFAULT;
7f5a08c79df35e Beau Belgrave 2022-01-18  1879  	}
7f5a08c79df35e Beau Belgrave 2022-01-18  1880  
7f5a08c79df35e Beau Belgrave 2022-01-18  1881  	return ret;
7f5a08c79df35e Beau Belgrave 2022-01-18  1882  }
7f5a08c79df35e Beau Belgrave 2022-01-18  1883  

:::::: The code at line 1826 was first introduced by commit
:::::: e5d271812e7a4d527e65b0228b4a16795c0e0c6c tracing/user_events: Move pages/locks into groups to prepare for namespaces

:::::: TO: Beau Belgrave <beaub@linux.microsoft.com>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
