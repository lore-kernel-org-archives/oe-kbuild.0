Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8ED52F6597
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 09:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765447031; cv=none; b=a8CftNpwCETDu3gnWaZnpwFDU7M5KtPISJgP78R1btp/wQCtBcVJhbKmIFwNLfqtlx89Kw5Hr+Q1bcQZTz8ZZ8mB2GMSjlYd6/eTAszDLUEMgdJ5hG8JBfPCoV1mmyugFQ9TcyStl0HuKTiafTM0w74UN+QGSTC7b2wipDHcWz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765447031; c=relaxed/simple;
	bh=StQHCPlVibd7g58huSubQQPq7xIvnnWV8MmQFvX2PdI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lr7iCIEkZn4dxNLqV4iUPRaGr2VS6LnAMVwjMcwYGbWkBd5U8jxj0HvKydxBwv4MGZAdaumDfYm5ZJAlFNdiGbMZkp8ZByyhvSEgPHPfn+jfsSfCCe3+wRZ3XEC3t+HN2LyEJUWdt9NzPfsfl35oK+gjEy+iAlFiMK5R0XLZJFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=avyY+thx; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="avyY+thx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765447029; x=1796983029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=StQHCPlVibd7g58huSubQQPq7xIvnnWV8MmQFvX2PdI=;
  b=avyY+thxmb9yVMJgcuZid10LoTnvo30bMg8EB8WysruX8j/U4Fw2YI9B
   xOOLqpE535jJRT4+G6MwdI+KdqMxIsgi5bkrCw2CbZPvxIwt+zC07eU5c
   M0bO0XZaFkXmgGh8dpfiS2t2vb7WKrO0L2HWuCzv/1492gvmsxKnehsnZ
   sITfqkVFJ1OCnH0Vu4f+Fvrb6MZ86ZuTeKEXgzuGY4g8G+a/MRGavA4by
   tQ9EMG9g71cJN7dAWWhbUpcp+diNAjcAj9ZHgH9E9+5P44WrD6Ummi0RX
   WenM+U/PuYS00KAgUVwdRvrQANH7V+oc6x+PrTVctji7iLPi2p0clU1wi
   Q==;
X-CSE-ConnectionGUID: 8PuLBydUTauEvmePEEYXtg==
X-CSE-MsgGUID: Wfb1pJkSQraK0FiVmilZVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67312202"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67312202"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 01:56:54 -0800
X-CSE-ConnectionGUID: XppqyfIeRZuVe01XzZME1w==
X-CSE-MsgGUID: qa48FtUBT6u9P4KfBTAvEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201851979"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Dec 2025 01:56:52 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTdPm-000000004Tz-1DVF;
	Thu, 11 Dec 2025 09:56:50 +0000
Date: Thu, 11 Dec 2025 17:56:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/params.c:785 lookup_or_create_module_kobject() warn: Calling
 kobject_put|get with state->initialized unset from line: 773
Message-ID: <202512111740.l7SRwAfl-lkp@intel.com>
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
TO: Shyam Saini <shyamsaini@linux.microsoft.com>
CC: Petr Pavlu <petr.pavlu@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: bbc9462f0cb0c8917a4908e856731708f0cee910 kernel: param: rename locate_module_kobject
date:   8 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 8 months ago
config: um-randconfig-r073-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111740.l7SRwAfl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512111740.l7SRwAfl-lkp@intel.com/

smatch warnings:
kernel/params.c:785 lookup_or_create_module_kobject() warn: Calling kobject_put|get with state->initialized unset from line: 773

vim +785 kernel/params.c

e180a6b7759a99 Rusty Russell      2009-03-31  762  
bbc9462f0cb0c8 Shyam Saini        2025-02-27  763  static struct module_kobject * __init lookup_or_create_module_kobject(const char *name)
^1da177e4c3f41 Linus Torvalds     2005-04-16  764  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  765  	struct module_kobject *mk;
9b473de87209fa Rusty Russell      2008-10-22  766  	struct kobject *kobj;
9b473de87209fa Rusty Russell      2008-10-22  767  	int err;
^1da177e4c3f41 Linus Torvalds     2005-04-16  768  
9b473de87209fa Rusty Russell      2008-10-22  769  	kobj = kset_find_obj(module_kset, name);
9b473de87209fa Rusty Russell      2008-10-22  770  	if (kobj) {
9b473de87209fa Rusty Russell      2008-10-22  771  		mk = to_module_kobject(kobj);
9b473de87209fa Rusty Russell      2008-10-22  772  	} else {
dd3927105b6f65 Pekka J Enberg     2005-09-06  773  		mk = kzalloc(sizeof(struct module_kobject), GFP_KERNEL);
dd3927105b6f65 Pekka J Enberg     2005-09-06  774  		BUG_ON(!mk);
^1da177e4c3f41 Linus Torvalds     2005-04-16  775  
^1da177e4c3f41 Linus Torvalds     2005-04-16  776  		mk->mod = THIS_MODULE;
7405c1e15edfe4 Greg Kroah-Hartman 2007-11-01  777  		mk->kobj.kset = module_kset;
9b473de87209fa Rusty Russell      2008-10-22  778  		err = kobject_init_and_add(&mk->kobj, &module_ktype, NULL,
9b473de87209fa Rusty Russell      2008-10-22  779  					   "%s", name);
88bfa3247961fe Kay Sievers        2011-07-24  780  #ifdef CONFIG_MODULES
88bfa3247961fe Kay Sievers        2011-07-24  781  		if (!err)
88bfa3247961fe Kay Sievers        2011-07-24  782  			err = sysfs_create_file(&mk->kobj, &module_uevent.attr);
88bfa3247961fe Kay Sievers        2011-07-24  783  #endif
9b473de87209fa Rusty Russell      2008-10-22  784  		if (err) {
e43b9192c59402 Greg Kroah-Hartman 2007-12-17 @785  			kobject_put(&mk->kobj);
b5f3abf950f16f Jim Cromie         2012-05-03  786  			pr_crit("Adding module '%s' to sysfs failed (%d), the system may be unstable.\n",
e94965ed5beb23 Dmitry Torokhov    2010-12-15  787  				name, err);
e94965ed5beb23 Dmitry Torokhov    2010-12-15  788  			return NULL;
74c5b597e9c2fc Greg Kroah-Hartman 2007-07-30  789  		}
e94965ed5beb23 Dmitry Torokhov    2010-12-15  790  
e94965ed5beb23 Dmitry Torokhov    2010-12-15  791  		/* So that we hold reference in both cases. */
9b473de87209fa Rusty Russell      2008-10-22  792  		kobject_get(&mk->kobj);
9b473de87209fa Rusty Russell      2008-10-22  793  	}
9b473de87209fa Rusty Russell      2008-10-22  794  
e94965ed5beb23 Dmitry Torokhov    2010-12-15  795  	return mk;
e94965ed5beb23 Dmitry Torokhov    2010-12-15  796  }
e94965ed5beb23 Dmitry Torokhov    2010-12-15  797  

:::::: The code at line 785 was first introduced by commit
:::::: e43b9192c59402685bd1f809068dd13aa5931570 Kobject: convert kernel/params.c to use kobject_init/add_ng()

:::::: TO: Greg Kroah-Hartman <gregkh@suse.de>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
