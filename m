Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CC434B669
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Aug 2026 11:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786101570; cv=none; b=Ay9tc1q3qFuUSYOqcJ1gyeFGQXJX//zJ8ius3n+FgsM4Hk04MnYMaQcqSIJ2NVasezE9DrDBXZYRCNvawGqEvpu01aC4zKiuyPfea4HkGjiKlBNDLrXMjVazK5ByM/DukVn5S5n2Z9RMzC2X3i2CGGHKQBfljXyxxl/tz+1hKcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786101570; c=relaxed/simple;
	bh=d7XxPHtfGd5d2sRVaDyQx+a+HqHpbD2tl3pPkoyrUHg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GlB2lk1uJWBHnDFiBTG9K6ga5svNtb1QtidWEtTSK21kt3IF95dvHw3kJaFLxAIgIDz/mLpLp49feQ0Uyp6vWvMm0ZObRiOxiXYd6jfRBbNZq2aG2ANMUVvcJfu4JZWgXlGDGAPDVs1r83uCs8ay4f8aTYQVO5X2261nePx96OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KAQ5Tcx1; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KAQ5Tcx1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786101568; x=1817637568;
  h=date:from:to:cc:subject:message-id;
  bh=d7XxPHtfGd5d2sRVaDyQx+a+HqHpbD2tl3pPkoyrUHg=;
  b=KAQ5Tcx1re1iHwDqp54TSn8y7RFxgSgJnd9TU+/XnhApIxBuDJrlrnkX
   +6WXJtIC+lfKtCcnpABX1XJk4lcGMK8mT2Fo8QUlSX5XEEywUWnc2cjoZ
   SXxRTNmBEAVtLYX8s20Ct6Olkvqssqe8bzhMREM98NlrWhONJDWSHhyt+
   gPU+62DY5mbI58Wa2g+EwzF9fnfBM6tsMajL0o2EREKyeQWP08Ir9WpxQ
   oLHsZjZD6JBJkgTrBRfBX4wJvC9M/tpacBRjSMDr6eDipK7SbL9rI7JHR
   B724VgQH6DPuZpDnwGEoVKYIgXadNRjM370445+Aaq1asIwEclLCyTutQ
   A==;
X-CSE-ConnectionGUID: o5Wvpg61QdmycDfTxWOpNg==
X-CSE-MsgGUID: w+Ok/WwjRmK4o+D+jygysQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="104241078"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="104241078"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 04:19:26 -0700
X-CSE-ConnectionGUID: JbPbM1KBTeOTpoVWKyNQBA==
X-CSE-MsgGUID: 9q3Xj5oGRvmsrqtt38msGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="262421625"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Aug 2026 04:19:26 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsIbj-00000000I1p-1kGW;
	Fri, 07 Aug 2026 11:19:23 +0000
Date: Fri, 07 Aug 2026 19:18:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/char/xillybus/xillybus_class.c:74:7: warning:
 variable 'rc' is used uninitialized whenever 'if' condition is true
Message-ID: <202608071903.TcTqEIgg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Eli-Billauer/char-xillybus-Improve-control-of-execution-flow-with-mutexes/20260806-033404, commit: 16edb90c39a5645b3803be32b2b77476efae2402"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Eli Billauer <eli.billauer@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Eli-Billauer/char-xillybus-Improve-control-of-execution-flow-with-mutexes/20260806-033404
head:   d05c024c9354aabd2ea64be46e6fccbf24ba33cd
commit: 16edb90c39a5645b3803be32b2b77476efae2402 char: xillybus: Add defensive sanity checks
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: loongarch-randconfig-002-20260807 (https://download.01.org/0day-ci/archive/20260807/202608071903.TcTqEIgg-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260807/202608071903.TcTqEIgg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608071903.TcTqEIgg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/xillybus/xillybus_class.c:74:7: warning: variable 'rc' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
      74 |                 if (i > 99) {
         |                     ^~~~~~
   drivers/char/xillybus/xillybus_class.c:179:9: note: uninitialized use occurs here
     179 |         return rc;
         |                ^~
   drivers/char/xillybus/xillybus_class.c:74:3: note: remove the 'if' if its condition is always false
      74 |                 if (i > 99) {
         |                 ^~~~~~~~~~~~~
      75 |                         dev_err(dev, "Failed to obtain unique unit name\n");
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      76 |                         goto fail_obtain;
         |                         ~~~~~~~~~~~~~~~~~
      77 |                 }
         |                 ~
   drivers/char/xillybus/xillybus_class.c:51:8: note: initialize the variable 'rc' to silence this warning
      51 |         int rc;
         |               ^
         |                = 0
   1 warning generated.


vim +74 drivers/char/xillybus/xillybus_class.c

8cb5d216ab3365 Eli Billauer   2021-05-26   42  
8cb5d216ab3365 Eli Billauer   2021-05-26   43  int xillybus_init_chrdev(struct device *dev,
8cb5d216ab3365 Eli Billauer   2021-05-26   44  			 const struct file_operations *fops,
8cb5d216ab3365 Eli Billauer   2021-05-26   45  			 struct module *owner,
8cb5d216ab3365 Eli Billauer   2021-05-26   46  			 void *private_data,
8cb5d216ab3365 Eli Billauer   2021-05-26   47  			 unsigned char *idt, unsigned int len,
8cb5d216ab3365 Eli Billauer   2021-05-26   48  			 int num_nodes,
8cb5d216ab3365 Eli Billauer   2021-05-26   49  			 const char *prefix, bool enumerate)
8cb5d216ab3365 Eli Billauer   2021-05-26   50  {
8cb5d216ab3365 Eli Billauer   2021-05-26   51  	int rc;
8cb5d216ab3365 Eli Billauer   2021-05-26   52  	dev_t mdev;
8cb5d216ab3365 Eli Billauer   2021-05-26   53  	int i;
8cb5d216ab3365 Eli Billauer   2021-05-26   54  	char devname[48];
8cb5d216ab3365 Eli Billauer   2021-05-26   55  
8cb5d216ab3365 Eli Billauer   2021-05-26   56  	struct device *device;
8cb5d216ab3365 Eli Billauer   2021-05-26   57  	size_t namelen;
8cb5d216ab3365 Eli Billauer   2021-05-26   58  	struct xilly_unit *unit, *u;
8cb5d216ab3365 Eli Billauer   2021-05-26   59  
16edb90c39a564 Eli Billauer   2026-06-30   60  	if (num_nodes <= 0 || num_nodes > XILLYBUS_MAX_NODES || !idt || !prefix || !dev)
16edb90c39a564 Eli Billauer   2026-06-30   61  		return -ENODEV;
16edb90c39a564 Eli Billauer   2026-06-30   62  
bf4afc53b77aea Linus Torvalds 2026-02-21   63  	unit = kzalloc_obj(*unit);
8cb5d216ab3365 Eli Billauer   2021-05-26   64  
8cb5d216ab3365 Eli Billauer   2021-05-26   65  	if (!unit)
8cb5d216ab3365 Eli Billauer   2021-05-26   66  		return -ENOMEM;
8cb5d216ab3365 Eli Billauer   2021-05-26   67  
8cb5d216ab3365 Eli Billauer   2021-05-26   68  	mutex_lock(&unit_mutex);
8cb5d216ab3365 Eli Billauer   2021-05-26   69  
8cb5d216ab3365 Eli Billauer   2021-05-26   70  	if (!enumerate)
8cb5d216ab3365 Eli Billauer   2021-05-26   71  		snprintf(unit->name, UNITNAMELEN, "%s", prefix);
8cb5d216ab3365 Eli Billauer   2021-05-26   72  
8cb5d216ab3365 Eli Billauer   2021-05-26   73  	for (i = 0; enumerate; i++) {
16edb90c39a564 Eli Billauer   2026-06-30  @74  		if (i > 99) {
16edb90c39a564 Eli Billauer   2026-06-30   75  			dev_err(dev, "Failed to obtain unique unit name\n");
16edb90c39a564 Eli Billauer   2026-06-30   76  			goto fail_obtain;
16edb90c39a564 Eli Billauer   2026-06-30   77  		}
16edb90c39a564 Eli Billauer   2026-06-30   78  
8cb5d216ab3365 Eli Billauer   2021-05-26   79  		snprintf(unit->name, UNITNAMELEN, "%s_%02d",
8cb5d216ab3365 Eli Billauer   2021-05-26   80  			 prefix, i);
8cb5d216ab3365 Eli Billauer   2021-05-26   81  
8cb5d216ab3365 Eli Billauer   2021-05-26   82  		enumerate = false;
8cb5d216ab3365 Eli Billauer   2021-05-26   83  		list_for_each_entry(u, &unit_list, list_entry)
8cb5d216ab3365 Eli Billauer   2021-05-26   84  			if (!strcmp(unit->name, u->name)) {
8cb5d216ab3365 Eli Billauer   2021-05-26   85  				enumerate = true;
8cb5d216ab3365 Eli Billauer   2021-05-26   86  				break;
8cb5d216ab3365 Eli Billauer   2021-05-26   87  			}
8cb5d216ab3365 Eli Billauer   2021-05-26   88  	}
8cb5d216ab3365 Eli Billauer   2021-05-26   89  
8cb5d216ab3365 Eli Billauer   2021-05-26   90  	rc = alloc_chrdev_region(&mdev, 0, num_nodes, unit->name);
8cb5d216ab3365 Eli Billauer   2021-05-26   91  
8cb5d216ab3365 Eli Billauer   2021-05-26   92  	if (rc) {
8cb5d216ab3365 Eli Billauer   2021-05-26   93  		dev_warn(dev, "Failed to obtain major/minors");
8cb5d216ab3365 Eli Billauer   2021-05-26   94  		goto fail_obtain;
8cb5d216ab3365 Eli Billauer   2021-05-26   95  	}
8cb5d216ab3365 Eli Billauer   2021-05-26   96  
8cb5d216ab3365 Eli Billauer   2021-05-26   97  	unit->major = MAJOR(mdev);
8cb5d216ab3365 Eli Billauer   2021-05-26   98  	unit->lowest_minor = MINOR(mdev);
8cb5d216ab3365 Eli Billauer   2021-05-26   99  	unit->num_nodes = num_nodes;
8cb5d216ab3365 Eli Billauer   2021-05-26  100  	unit->private_data = private_data;
8cb5d216ab3365 Eli Billauer   2021-05-26  101  
8cb5d216ab3365 Eli Billauer   2021-05-26  102  	unit->cdev = cdev_alloc();
8cb5d216ab3365 Eli Billauer   2021-05-26  103  	if (!unit->cdev) {
8cb5d216ab3365 Eli Billauer   2021-05-26  104  		rc = -ENOMEM;
8cb5d216ab3365 Eli Billauer   2021-05-26  105  		goto unregister_chrdev;
8cb5d216ab3365 Eli Billauer   2021-05-26  106  	}
8cb5d216ab3365 Eli Billauer   2021-05-26  107  	unit->cdev->ops = fops;
8cb5d216ab3365 Eli Billauer   2021-05-26  108  	unit->cdev->owner = owner;
8cb5d216ab3365 Eli Billauer   2021-05-26  109  
8cb5d216ab3365 Eli Billauer   2021-05-26  110  	rc = cdev_add(unit->cdev, MKDEV(unit->major, unit->lowest_minor),
8cb5d216ab3365 Eli Billauer   2021-05-26  111  		      unit->num_nodes);
8cb5d216ab3365 Eli Billauer   2021-05-26  112  	if (rc) {
8cb5d216ab3365 Eli Billauer   2021-05-26  113  		dev_err(dev, "Failed to add cdev.\n");
8cb5d216ab3365 Eli Billauer   2021-05-26  114  		/* kobject_put() is normally done by cdev_del() */
8cb5d216ab3365 Eli Billauer   2021-05-26  115  		kobject_put(&unit->cdev->kobj);
8cb5d216ab3365 Eli Billauer   2021-05-26  116  		goto unregister_chrdev;
8cb5d216ab3365 Eli Billauer   2021-05-26  117  	}
8cb5d216ab3365 Eli Billauer   2021-05-26  118  
8cb5d216ab3365 Eli Billauer   2021-05-26  119  	for (i = 0; i < num_nodes; i++) {
8cb5d216ab3365 Eli Billauer   2021-05-26  120  		namelen = strnlen(idt, len);
8cb5d216ab3365 Eli Billauer   2021-05-26  121  
8cb5d216ab3365 Eli Billauer   2021-05-26  122  		if (namelen == len) {
8cb5d216ab3365 Eli Billauer   2021-05-26  123  			dev_err(dev, "IDT's list of names is too short. This is exceptionally weird, because its CRC is OK\n");
8cb5d216ab3365 Eli Billauer   2021-05-26  124  			rc = -ENODEV;
8cb5d216ab3365 Eli Billauer   2021-05-26  125  			goto unroll_device_create;
8cb5d216ab3365 Eli Billauer   2021-05-26  126  		}
8cb5d216ab3365 Eli Billauer   2021-05-26  127  
8cb5d216ab3365 Eli Billauer   2021-05-26  128  		snprintf(devname, sizeof(devname), "%s_%s",
8cb5d216ab3365 Eli Billauer   2021-05-26  129  			 unit->name, idt);
8cb5d216ab3365 Eli Billauer   2021-05-26  130  
8cb5d216ab3365 Eli Billauer   2021-05-26  131  		len -= namelen + 1;
8cb5d216ab3365 Eli Billauer   2021-05-26  132  		idt += namelen + 1;
8cb5d216ab3365 Eli Billauer   2021-05-26  133  
9ee202e69e2947 Ivan Orlov     2023-06-20  134  		device = device_create(&xillybus_class,
8cb5d216ab3365 Eli Billauer   2021-05-26  135  				       NULL,
8cb5d216ab3365 Eli Billauer   2021-05-26  136  				       MKDEV(unit->major,
8cb5d216ab3365 Eli Billauer   2021-05-26  137  					     i + unit->lowest_minor),
8cb5d216ab3365 Eli Billauer   2021-05-26  138  				       NULL,
8cb5d216ab3365 Eli Billauer   2021-05-26  139  				       "%s", devname);
8cb5d216ab3365 Eli Billauer   2021-05-26  140  
8cb5d216ab3365 Eli Billauer   2021-05-26  141  		if (IS_ERR(device)) {
8cb5d216ab3365 Eli Billauer   2021-05-26  142  			dev_err(dev, "Failed to create %s device. Aborting.\n",
8cb5d216ab3365 Eli Billauer   2021-05-26  143  				devname);
8cb5d216ab3365 Eli Billauer   2021-05-26  144  			rc = -ENODEV;
8cb5d216ab3365 Eli Billauer   2021-05-26  145  			goto unroll_device_create;
8cb5d216ab3365 Eli Billauer   2021-05-26  146  		}
8cb5d216ab3365 Eli Billauer   2021-05-26  147  	}
8cb5d216ab3365 Eli Billauer   2021-05-26  148  
8cb5d216ab3365 Eli Billauer   2021-05-26  149  	if (len) {
8cb5d216ab3365 Eli Billauer   2021-05-26  150  		dev_err(dev, "IDT's list of names is too long. This is exceptionally weird, because its CRC is OK\n");
8cb5d216ab3365 Eli Billauer   2021-05-26  151  		rc = -ENODEV;
8cb5d216ab3365 Eli Billauer   2021-05-26  152  		goto unroll_device_create;
8cb5d216ab3365 Eli Billauer   2021-05-26  153  	}
8cb5d216ab3365 Eli Billauer   2021-05-26  154  
8cb5d216ab3365 Eli Billauer   2021-05-26  155  	list_add_tail(&unit->list_entry, &unit_list);
8cb5d216ab3365 Eli Billauer   2021-05-26  156  
8cb5d216ab3365 Eli Billauer   2021-05-26  157  	dev_info(dev, "Created %d device files.\n", num_nodes);
8cb5d216ab3365 Eli Billauer   2021-05-26  158  
8cb5d216ab3365 Eli Billauer   2021-05-26  159  	mutex_unlock(&unit_mutex);
8cb5d216ab3365 Eli Billauer   2021-05-26  160  
8cb5d216ab3365 Eli Billauer   2021-05-26  161  	return 0;
8cb5d216ab3365 Eli Billauer   2021-05-26  162  
8cb5d216ab3365 Eli Billauer   2021-05-26  163  unroll_device_create:
8cb5d216ab3365 Eli Billauer   2021-05-26  164  	for (i--; i >= 0; i--)
9ee202e69e2947 Ivan Orlov     2023-06-20  165  		device_destroy(&xillybus_class, MKDEV(unit->major,
8cb5d216ab3365 Eli Billauer   2021-05-26  166  						     i + unit->lowest_minor));
8cb5d216ab3365 Eli Billauer   2021-05-26  167  
8cb5d216ab3365 Eli Billauer   2021-05-26  168  	cdev_del(unit->cdev);
8cb5d216ab3365 Eli Billauer   2021-05-26  169  
8cb5d216ab3365 Eli Billauer   2021-05-26  170  unregister_chrdev:
8cb5d216ab3365 Eli Billauer   2021-05-26  171  	unregister_chrdev_region(MKDEV(unit->major, unit->lowest_minor),
8cb5d216ab3365 Eli Billauer   2021-05-26  172  				 unit->num_nodes);
8cb5d216ab3365 Eli Billauer   2021-05-26  173  
8cb5d216ab3365 Eli Billauer   2021-05-26  174  fail_obtain:
8cb5d216ab3365 Eli Billauer   2021-05-26  175  	mutex_unlock(&unit_mutex);
8cb5d216ab3365 Eli Billauer   2021-05-26  176  
8cb5d216ab3365 Eli Billauer   2021-05-26  177  	kfree(unit);
8cb5d216ab3365 Eli Billauer   2021-05-26  178  
8cb5d216ab3365 Eli Billauer   2021-05-26  179  	return rc;
8cb5d216ab3365 Eli Billauer   2021-05-26  180  }
8cb5d216ab3365 Eli Billauer   2021-05-26  181  EXPORT_SYMBOL(xillybus_init_chrdev);
8cb5d216ab3365 Eli Billauer   2021-05-26  182  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
