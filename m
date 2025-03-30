Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D551B1DE88C
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Mar 2025 21:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743371687; cv=none; b=YMf5/FQXSgSNo4AqoJfHWCJmg9ZLfhW8zmS/4YblJmKEWBfk+eUAtVIuc/7aaGkLvaMpLdKUDGVsLI1ZUfvqWLzE1mI4OPMrPbqtKrS+XN8Zyqw5BKHTB3INrwn3Pia7x2yCLZyqd0svVBeBfcSG02UODa+cJ9rnm/eF14CtDaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743371687; c=relaxed/simple;
	bh=ca52ry81Lc1L6gIsmd4FPbk1+TlALfIBGr2Si7DvlA4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B2VnB6FRu7AjU4O5toXUBW0GmI3r1q6JbKHZmyr6J+rTgI/U1X+dHIET3RS1iblKZpnt50cYWgw4zYpiOaZQyHwhjI2vlxsDME1T0taCXeNbKchnIm8iWeiaccyd/fCMVlhLFZP9szhgpobW8G8+ZQJbsM2hRPD4il6tyXdb1KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FMYfoLAs; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FMYfoLAs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743371686; x=1774907686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ca52ry81Lc1L6gIsmd4FPbk1+TlALfIBGr2Si7DvlA4=;
  b=FMYfoLAsjIF3zeO4YcwSWITaN2cXEPNTSej/aAXwjqZ4g7FC5YGtJ+mx
   hBsFnb5U0EWoG1AE2rdhPSQO7hHyhwPLY9Ff1wyZ8rccuoGhuYcchgfBf
   hALZaAkhyZGXzyS/I2gDh/uPQrIPojSNfKtro+a4bdh1pb4X0kQCihqs6
   uxm53cP6TfUdHmq6wOAAy/anc2p3ofwxicM3EwedgNTzBRRKZwcNM9+fV
   A8nBCyPbI1UYNs85YaDYGeBO3OnReo8qYBRIENY+cpLLjrYoGDwiORanI
   xG8whjOsyP3etIMmtWAIviS3DArXjTdSzQdOdqjTMrAyvv8IQJ0xpFGNj
   g==;
X-CSE-ConnectionGUID: ENLdXdNWTHSGRO1c5jyK/w==
X-CSE-MsgGUID: vfruumCAS6qcxzzWoGNFuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="70020818"
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="70020818"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 14:54:45 -0700
X-CSE-ConnectionGUID: inYv3gXBRQeu/xANuTeqnw==
X-CSE-MsgGUID: Rdpj3GqjTRCxUoyeGIfJVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="126445863"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 30 Mar 2025 14:54:44 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tz0c5-0008ty-1Y;
	Sun, 30 Mar 2025 21:54:41 +0000
Date: Mon, 31 Mar 2025 05:54:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/trace/rv/rv.c:838 rv_register_monitor() warn: inconsistent
 returns 'global &rv_interface_lock'.
Message-ID: <202503310539.7BDDOPxq-lkp@intel.com>
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
:::::: branch date: 20 hours ago
:::::: commit date: 6 days ago
config: parisc-randconfig-r073-20250331 (https://download.01.org/0day-ci/archive/20250331/202503310539.7BDDOPxq-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503310539.7BDDOPxq-lkp@intel.com/

smatch warnings:
kernel/trace/rv/rv.c:838 rv_register_monitor() warn: inconsistent returns 'global &rv_interface_lock'.

vim +838 kernel/trace/rv/rv.c

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
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  790  	mutex_lock(&rv_interface_lock);
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
cb85c660fcd4b3a Gabriele Monaco            2025-03-05  812  		return -EINVAL;
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
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29 @838  	return retval;
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  839  }
102227b970a1525 Daniel Bristot de Oliveira 2022-07-29  840  

:::::: The code at line 838 was first introduced by commit
:::::: 102227b970a15256f5ffd12a6a276ddf978e6caf rv: Add Runtime Verification (RV) interface

:::::: TO: Daniel Bristot de Oliveira <bristot@kernel.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
