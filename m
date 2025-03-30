Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAD429D0D
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Mar 2025 18:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743359143; cv=none; b=u8fGZjaDeB+ftZHqklsfBH9n2hxegLiUXsegqwzGMOW8eZmL4zJl11uhSYj+lKbfOYbGZTRGCLKFn0J9WZfQWM74Zr6IlkJjE97SO2+ZZuhhEYwzFe6TySsdmrgU3h/KU3h/6C8l21y+fbpNfwsRWVfGH1/goPZtV6AV2lZ4xIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743359143; c=relaxed/simple;
	bh=yeC5qTEw74CLJXXHMiIJSwSs7W3M2ppoSG+kMw1k0fo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J9H/nXjg96QEnck4GpnmXuaadH+ySY3+o64fWVh8Qu1JbTx3iqqVvK2SC3A8P7rGw+5rI64VKWNugGEBVVw0O401PbXmlxX7oEhEw3XCeWkVa1md+bzWyb9AkW3WJQA8FfWS5d+e2rSzf43AcSZBJEtA28avhR5dtQ9DY53mQkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fEjIOpbs; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fEjIOpbs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743359141; x=1774895141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yeC5qTEw74CLJXXHMiIJSwSs7W3M2ppoSG+kMw1k0fo=;
  b=fEjIOpbsTGtLVSf1TTXQYqJVbF6OwPQoh9FhGuQWnTjrZ9KczlfYoes0
   YXxAyxswbck7KzLDLJbMv7nX0Bh3HDcafoUI+5UI/tF4NGuTQk1chO2Y6
   2IBgM8MT6/VtQ6ZQSou2dXJngqmuRK6dfQHuTQTq4NH7PX5YflsVK8/7N
   uOtDLbWanoKFwyREgitC6MxieJgl4SS69H7r5ZKMWKSUJoj2GYR7Qw/tZ
   TD4xzzRKlTTPru3yZr7TOIsQbUHTzJ5FgkUJEouvfxtCgNh2tkWG2hNd1
   4GeJQJumfpacPoWaRFHuKimi7lqPt/eL2v/joIIfJD0R8ZUtWD0Chlszx
   w==;
X-CSE-ConnectionGUID: s3am3jypSm61E28OQ4GewA==
X-CSE-MsgGUID: q4Y73ztBTnCu/rFKt/hKfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="48317234"
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="48317234"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 11:25:40 -0700
X-CSE-ConnectionGUID: B+Z4xqZgQmKAej7/VGk5YQ==
X-CSE-MsgGUID: TVKdIazMQTi8Xjck8RkoGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="130612249"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 30 Mar 2025 11:25:39 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyxLl-0008qs-0j;
	Sun, 30 Mar 2025 18:25:37 +0000
Date: Mon, 31 Mar 2025 02:25:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/trace/rv/rv.c:812:2-8: preceding lock on line 790
Message-ID: <202503310200.UBXGitB4-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Gabriele Monaco <gmonaco@redhat.com>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7f2ff7b6261742ed52aa973ccdf99151b7cc3a50
commit: cb85c660fcd4b3a03ed993affa0b2d1a8af2f06b rv: Add option for nested monitors and include sched
date:   6 days ago
:::::: branch date: 17 hours ago
:::::: commit date: 6 days ago
config: loongarch-randconfig-r061-20250330 (https://download.01.org/0day-ci/archive/20250331/202503310200.UBXGitB4-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202503310200.UBXGitB4-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/trace/rv/rv.c:812:2-8: preceding lock on line 790

vim +812 kernel/trace/rv/rv.c

102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  771  
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  772  /**
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  773   * rv_register_monitor - register a rv monitor.
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  774   * @monitor:    The rv_monitor to be registered.
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  775   * @parent:     The parent of the monitor to be registered, NULL if not nested.
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  776   *
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  777   * Returns 0 if successful, error otherwise.
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  778   */
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  779  int rv_register_monitor(struct rv_monitor *monitor, struct rv_monitor *parent)
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  780  {
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  781  	struct rv_monitor_def *r, *p = NULL;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  782  	int retval = 0;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  783  
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  784  	if (strlen(monitor->name) >= MAX_RV_MONITOR_NAME_SIZE) {
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  785  		pr_info("Monitor %s has a name longer than %d\n", monitor->name,
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  786  			MAX_RV_MONITOR_NAME_SIZE);
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  787  		return -EINVAL;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  788  	}
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  789  
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29 @790  	mutex_lock(&rv_interface_lock);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  791  
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  792  	list_for_each_entry(r, &rv_monitors_list, list) {
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  793  		if (strcmp(monitor->name, r->monitor->name) == 0) {
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  794  			pr_info("Monitor %s is already registered\n", monitor->name);
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  795  			retval = -EEXIST;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  796  			goto out_unlock;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  797  		}
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  798  	}
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  799  
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  800  	if (parent) {
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  801  		list_for_each_entry(r, &rv_monitors_list, list) {
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  802  			if (strcmp(parent->name, r->monitor->name) == 0) {
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  803  				p = r;
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  804  				break;
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  805  			}
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  806  		}
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  807  	}
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  808  
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  809  	if (p && rv_is_nested_monitor(p)) {
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  810  		pr_info("Parent monitor %s is already nested, cannot nest further\n",
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  811  			parent->name);
cb85c660fcd4b3a Gabriele Monaco            2025-03-05 @812  		return -EINVAL;
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  813  	}
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  814  
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  815  	r = kzalloc(sizeof(struct rv_monitor_def), GFP_KERNEL);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  816  	if (!r) {
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  817  		retval = -ENOMEM;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  818  		goto out_unlock;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  819  	}
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  820  
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  821  	r->monitor = monitor;
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  822  	r->parent = parent;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  823  
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  824  	retval = create_monitor_dir(r, p);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  825  	if (retval) {
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  826  		kfree(r);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  827  		goto out_unlock;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  828  	}
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  829  
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  830  	/* keep children close to the parent for easier visualisation */
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  831  	if (p)
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  832  		list_add(&r->list, &p->list);
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  833  	else
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  834  		list_add_tail(&r->list, &rv_monitors_list);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  835  
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  836  out_unlock:
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  837  	mutex_unlock(&rv_interface_lock);
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  838  	return retval;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  839  }
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  840  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
