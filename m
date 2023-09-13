Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4516C33D4
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Sep 2023 19:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694634303; x=1726170303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sU3ijG1Ixvn77lgXNiTZ8u0nN354TGFiDKaaoRkJHg8=;
  b=oAZNbsHkV43BBiFDUhF3HTXNCsRdsuLI+B3Jq9CqxLMya/LOf7igOg9y
   DTdI3+NecW3CbeyFGjgCp0PwHC/h3ORDHE8D8OVp7+xe9i1eNvWwfcC79
   Fy9LUqSJTidzJ3pRylYdGAWXL769lDVP+4HiU1UWQTJtqwSzE4Cdn1wnG
   ymbvCbBjkVMt8UEq156LKZIDA2QdPGqsT3AScE+aKKOCU3TqbzTBaIofu
   YdoPqH1RUw0wRU9k8n72X2ZGo0IKexl8kKfYIHHvtruOgc6Dik4BIa/dL
   Cb7U7G8/qtXOzBnui9MqJAh5Sa3XkcceN95FjtlYNLnXzu3VmC4Pft8hY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="376104312"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="376104312"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 12:45:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="693966587"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="693966587"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 13 Sep 2023 12:45:00 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgVnF-0000Y8-2x;
	Wed, 13 Sep 2023 19:44:57 +0000
Date: Thu, 14 Sep 2023 03:44:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [staging:staging-testing 17/17] drivers/staging/vme_user/vme.c:296
 vme_slave_request() error: we previously assumed 'slave_image' could be null
 (see line 297)
Message-ID: <202309140330.fgOxoRhE-lkp@intel.com>
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
CC: devel@driverdev.osuosl.org
TO: Jinjie Ruan <ruanjinjie@huawei.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

Hi Jinjie,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-testing
head:   4c5ba1d7a93e098aececbf93afbdd7add98ec6f3
commit: 4c5ba1d7a93e098aececbf93afbdd7add98ec6f3 [17/17] staging: vme_user: Use list_for_each_entry() helper
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: x86_64-randconfig-161-20230913 (https://download.01.org/0day-ci/archive/20230914/202309140330.fgOxoRhE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230914/202309140330.fgOxoRhE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309140330.fgOxoRhE-lkp@intel.com/

smatch warnings:
drivers/staging/vme_user/vme.c:296 vme_slave_request() error: we previously assumed 'slave_image' could be null (see line 297)
drivers/staging/vme_user/vme.c:492 vme_master_request() error: we previously assumed 'master_image' could be null (see line 493)
drivers/staging/vme_user/vme.c:866 vme_dma_request() error: we previously assumed 'dma_ctrlr' could be null (see line 867)
drivers/staging/vme_user/vme.c:1460 vme_lm_request() error: we previously assumed 'lm' could be null (see line 1461)

vim +/slave_image +296 drivers/staging/vme_user/vme.c

472f16f33c7d53 drivers/vme/vme.c              Dmitry Kalinkin 2015-09-18  269  
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  270  /**
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  271   * vme_slave_request - Request a VME slave window resource.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  272   * @vdev: Pointer to VME device struct vme_dev assigned to driver instance.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  273   * @address: Required VME address space.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  274   * @cycle: Required VME data transfer cycle type.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  275   *
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  276   * Request use of a VME window resource capable of being set for the requested
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  277   * address space and data transfer cycle.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  278   *
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  279   * Return: Pointer to VME resource on success, NULL on failure.
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  280   */
6af04b065b048e drivers/staging/vme/vme.c      Martyn Welch    2011-12-01  281  struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
6af04b065b048e drivers/staging/vme/vme.c      Martyn Welch    2011-12-01  282  				       u32 cycle)
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  283  {
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  284  	struct vme_bridge *bridge;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  285  	struct vme_slave_resource *allocated_image = NULL;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  286  	struct vme_slave_resource *slave_image = NULL;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  287  	struct vme_resource *resource = NULL;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  288  
8f966dc444b11a drivers/staging/vme/vme.c      Manohar Vanga   2011-09-26  289  	bridge = vdev->bridge;
61282c04984e40 drivers/vme/vme.c              Markus Elfring  2017-08-24  290  	if (!bridge) {
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  291  		printk(KERN_ERR "Can't find VME bus\n");
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  292  		goto err_bus;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  293  	}
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  294  
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  295  	/* Loop through slave resources */
4c5ba1d7a93e09 drivers/staging/vme_user/vme.c Jinjie Ruan     2023-08-23 @296  	list_for_each_entry(slave_image, &bridge->slave_resources, list) {
61282c04984e40 drivers/vme/vme.c              Markus Elfring  2017-08-24 @297  		if (!slave_image) {
ead1f3e301e2d8 drivers/staging/vme/vme.c      Martyn Welch    2009-12-15  298  			printk(KERN_ERR "Registered NULL Slave resource\n");
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  299  			continue;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  300  		}
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  301  
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  302  		/* Find an unlocked and compatible image */
886953e9b70bcb drivers/staging/vme/vme.c      Emilio G. Cota  2010-11-12  303  		mutex_lock(&slave_image->mtx);
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  304  		if (((slave_image->address_attr & address) == address) &&
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  305  		    ((slave_image->cycle_attr & cycle) == cycle) &&
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  306  		    (slave_image->locked == 0)) {
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  307  			slave_image->locked = 1;
886953e9b70bcb drivers/staging/vme/vme.c      Emilio G. Cota  2010-11-12  308  			mutex_unlock(&slave_image->mtx);
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  309  			allocated_image = slave_image;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  310  			break;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  311  		}
886953e9b70bcb drivers/staging/vme/vme.c      Emilio G. Cota  2010-11-12  312  		mutex_unlock(&slave_image->mtx);
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  313  	}
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  314  
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  315  	/* No free image */
61282c04984e40 drivers/vme/vme.c              Markus Elfring  2017-08-24  316  	if (!allocated_image)
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  317  		goto err_image;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  318  
1ff0a19ce12c82 drivers/vme/vme.c              Markus Elfring  2017-08-24  319  	resource = kmalloc(sizeof(*resource), GFP_KERNEL);
94eefcc1cb648a drivers/vme/vme.c              Markus Elfring  2017-08-24  320  	if (!resource)
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  321  		goto err_alloc;
94eefcc1cb648a drivers/vme/vme.c              Markus Elfring  2017-08-24  322  
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  323  	resource->type = VME_SLAVE;
886953e9b70bcb drivers/staging/vme/vme.c      Emilio G. Cota  2010-11-12  324  	resource->entry = &allocated_image->list;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  325  
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  326  	return resource;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  327  
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  328  err_alloc:
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  329  	/* Unlock image */
886953e9b70bcb drivers/staging/vme/vme.c      Emilio G. Cota  2010-11-12  330  	mutex_lock(&slave_image->mtx);
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  331  	slave_image->locked = 0;
886953e9b70bcb drivers/staging/vme/vme.c      Emilio G. Cota  2010-11-12  332  	mutex_unlock(&slave_image->mtx);
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  333  err_image:
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  334  err_bus:
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  335  	return NULL;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  336  }
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  337  EXPORT_SYMBOL(vme_slave_request);
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  338  
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  339  /**
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  340   * vme_slave_set - Set VME slave window configuration.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  341   * @resource: Pointer to VME slave resource.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  342   * @enabled: State to which the window should be configured.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  343   * @vme_base: Base address for the window.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  344   * @size: Size of the VME window.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  345   * @buf_base: Based address of buffer used to provide VME slave window storage.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  346   * @aspace: VME address space for the VME window.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  347   * @cycle: VME data transfer cycle type for the VME window.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  348   *
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  349   * Set configuration for provided VME slave window.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  350   *
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  351   * Return: Zero on success, -EINVAL if operation is not supported on this
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  352   *         device, if an invalid resource has been provided or invalid
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  353   *         attributes are provided. Hardware specific errors may also be
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  354   *         returned.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  355   */
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  356  int vme_slave_set(struct vme_resource *resource, int enabled,
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  357  		  unsigned long long vme_base, unsigned long long size,
6af04b065b048e drivers/staging/vme/vme.c      Martyn Welch    2011-12-01  358  		  dma_addr_t buf_base, u32 aspace, u32 cycle)
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  359  {
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  360  	struct vme_bridge *bridge = find_bridge(resource);
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  361  	struct vme_slave_resource *image;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  362  	int retval;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  363  
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  364  	if (resource->type != VME_SLAVE) {
ead1f3e301e2d8 drivers/staging/vme/vme.c      Martyn Welch    2009-12-15  365  		printk(KERN_ERR "Not a slave resource\n");
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  366  		return -EINVAL;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  367  	}
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  368  
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  369  	image = list_entry(resource->entry, struct vme_slave_resource, list);
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  370  
61282c04984e40 drivers/vme/vme.c              Markus Elfring  2017-08-24  371  	if (!bridge->slave_set) {
ead1f3e301e2d8 drivers/staging/vme/vme.c      Martyn Welch    2009-12-15  372  		printk(KERN_ERR "Function not supported\n");
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  373  		return -ENOSYS;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  374  	}
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  375  
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  376  	if (!(((image->address_attr & aspace) == aspace) &&
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  377  	      ((image->cycle_attr & cycle) == cycle))) {
ead1f3e301e2d8 drivers/staging/vme/vme.c      Martyn Welch    2009-12-15  378  		printk(KERN_ERR "Invalid attributes\n");
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  379  		return -EINVAL;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  380  	}
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  381  
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  382  	retval = vme_check_window(aspace, vme_base, size);
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  383  	if (retval)
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  384  		return retval;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  385  
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  386  	return bridge->slave_set(image, enabled, vme_base, size, buf_base,
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  387  		aspace, cycle);
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  388  }
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  389  EXPORT_SYMBOL(vme_slave_set);
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  390  
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  391  /**
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  392   * vme_slave_get - Retrieve VME slave window configuration.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  393   * @resource: Pointer to VME slave resource.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  394   * @enabled: Pointer to variable for storing state.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  395   * @vme_base: Pointer to variable for storing window base address.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  396   * @size: Pointer to variable for storing window size.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  397   * @buf_base: Pointer to variable for storing slave buffer base address.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  398   * @aspace: Pointer to variable for storing VME address space.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  399   * @cycle: Pointer to variable for storing VME data transfer cycle type.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  400   *
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  401   * Return configuration for provided VME slave window.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  402   *
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  403   * Return: Zero on success, -EINVAL if operation is not supported on this
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  404   *         device or if an invalid resource has been provided.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  405   */
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  406  int vme_slave_get(struct vme_resource *resource, int *enabled,
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  407  		  unsigned long long *vme_base, unsigned long long *size,
6af04b065b048e drivers/staging/vme/vme.c      Martyn Welch    2011-12-01  408  		  dma_addr_t *buf_base, u32 *aspace, u32 *cycle)
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  409  {
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  410  	struct vme_bridge *bridge = find_bridge(resource);
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  411  	struct vme_slave_resource *image;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  412  
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  413  	if (resource->type != VME_SLAVE) {
ead1f3e301e2d8 drivers/staging/vme/vme.c      Martyn Welch    2009-12-15  414  		printk(KERN_ERR "Not a slave resource\n");
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  415  		return -EINVAL;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  416  	}
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  417  
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  418  	image = list_entry(resource->entry, struct vme_slave_resource, list);
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  419  
61282c04984e40 drivers/vme/vme.c              Markus Elfring  2017-08-24  420  	if (!bridge->slave_get) {
ead1f3e301e2d8 drivers/staging/vme/vme.c      Martyn Welch    2009-12-15  421  		printk(KERN_ERR "vme_slave_get not supported\n");
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  422  		return -EINVAL;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  423  	}
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  424  
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  425  	return bridge->slave_get(image, enabled, vme_base, size, buf_base,
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  426  		aspace, cycle);
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  427  }
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  428  EXPORT_SYMBOL(vme_slave_get);
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  429  
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  430  /**
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  431   * vme_slave_free - Free VME slave window
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  432   * @resource: Pointer to VME slave resource.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  433   *
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  434   * Free the provided slave resource so that it may be reallocated.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  435   */
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  436  void vme_slave_free(struct vme_resource *resource)
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  437  {
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  438  	struct vme_slave_resource *slave_image;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  439  
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  440  	if (resource->type != VME_SLAVE) {
ead1f3e301e2d8 drivers/staging/vme/vme.c      Martyn Welch    2009-12-15  441  		printk(KERN_ERR "Not a slave resource\n");
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  442  		return;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  443  	}
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  444  
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  445  	slave_image = list_entry(resource->entry, struct vme_slave_resource,
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  446  				 list);
61282c04984e40 drivers/vme/vme.c              Markus Elfring  2017-08-24  447  	if (!slave_image) {
ead1f3e301e2d8 drivers/staging/vme/vme.c      Martyn Welch    2009-12-15  448  		printk(KERN_ERR "Can't find slave resource\n");
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  449  		return;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  450  	}
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  451  
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  452  	/* Unlock image */
886953e9b70bcb drivers/staging/vme/vme.c      Emilio G. Cota  2010-11-12  453  	mutex_lock(&slave_image->mtx);
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  454  	if (slave_image->locked == 0)
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  455  		printk(KERN_ERR "Image is already free\n");
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  456  
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  457  	slave_image->locked = 0;
886953e9b70bcb drivers/staging/vme/vme.c      Emilio G. Cota  2010-11-12  458  	mutex_unlock(&slave_image->mtx);
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  459  
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  460  	/* Free up resource memory */
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  461  	kfree(resource);
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  462  }
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  463  EXPORT_SYMBOL(vme_slave_free);
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  464  
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  465  /**
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  466   * vme_master_request - Request a VME master window resource.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  467   * @vdev: Pointer to VME device struct vme_dev assigned to driver instance.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  468   * @address: Required VME address space.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  469   * @cycle: Required VME data transfer cycle type.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  470   * @dwidth: Required VME data transfer width.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  471   *
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  472   * Request use of a VME window resource capable of being set for the requested
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  473   * address space, data transfer cycle and width.
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  474   *
b5bc980a4929bb drivers/vme/vme.c              Martyn Welch    2017-03-04  475   * Return: Pointer to VME resource on success, NULL on failure.
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  476   */
6af04b065b048e drivers/staging/vme/vme.c      Martyn Welch    2011-12-01  477  struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
6af04b065b048e drivers/staging/vme/vme.c      Martyn Welch    2011-12-01  478  					u32 cycle, u32 dwidth)
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  479  {
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  480  	struct vme_bridge *bridge;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  481  	struct vme_master_resource *allocated_image = NULL;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  482  	struct vme_master_resource *master_image = NULL;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  483  	struct vme_resource *resource = NULL;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  484  
8f966dc444b11a drivers/staging/vme/vme.c      Manohar Vanga   2011-09-26  485  	bridge = vdev->bridge;
61282c04984e40 drivers/vme/vme.c              Markus Elfring  2017-08-24  486  	if (!bridge) {
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  487  		printk(KERN_ERR "Can't find VME bus\n");
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  488  		goto err_bus;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  489  	}
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  490  
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  491  	/* Loop through master resources */
4c5ba1d7a93e09 drivers/staging/vme_user/vme.c Jinjie Ruan     2023-08-23 @492  	list_for_each_entry(master_image, &bridge->master_resources, list) {
61282c04984e40 drivers/vme/vme.c              Markus Elfring  2017-08-24 @493  		if (!master_image) {
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  494  			printk(KERN_WARNING "Registered NULL master resource\n");
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  495  			continue;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  496  		}
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  497  
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  498  		/* Find an unlocked and compatible image */
886953e9b70bcb drivers/staging/vme/vme.c      Emilio G. Cota  2010-11-12  499  		spin_lock(&master_image->lock);
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  500  		if (((master_image->address_attr & address) == address) &&
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  501  		    ((master_image->cycle_attr & cycle) == cycle) &&
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  502  		    ((master_image->width_attr & dwidth) == dwidth) &&
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  503  		    (master_image->locked == 0)) {
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  504  			master_image->locked = 1;
886953e9b70bcb drivers/staging/vme/vme.c      Emilio G. Cota  2010-11-12  505  			spin_unlock(&master_image->lock);
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  506  			allocated_image = master_image;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  507  			break;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  508  		}
886953e9b70bcb drivers/staging/vme/vme.c      Emilio G. Cota  2010-11-12  509  		spin_unlock(&master_image->lock);
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  510  	}
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  511  
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  512  	/* Check to see if we found a resource */
61282c04984e40 drivers/vme/vme.c              Markus Elfring  2017-08-24  513  	if (!allocated_image) {
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  514  		printk(KERN_ERR "Can't find a suitable resource\n");
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  515  		goto err_image;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  516  	}
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  517  
1ff0a19ce12c82 drivers/vme/vme.c              Markus Elfring  2017-08-24  518  	resource = kmalloc(sizeof(*resource), GFP_KERNEL);
94eefcc1cb648a drivers/vme/vme.c              Markus Elfring  2017-08-24  519  	if (!resource)
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  520  		goto err_alloc;
94eefcc1cb648a drivers/vme/vme.c              Markus Elfring  2017-08-24  521  
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  522  	resource->type = VME_MASTER;
886953e9b70bcb drivers/staging/vme/vme.c      Emilio G. Cota  2010-11-12  523  	resource->entry = &allocated_image->list;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  524  
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  525  	return resource;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  526  
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  527  err_alloc:
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  528  	/* Unlock image */
886953e9b70bcb drivers/staging/vme/vme.c      Emilio G. Cota  2010-11-12  529  	spin_lock(&master_image->lock);
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  530  	master_image->locked = 0;
886953e9b70bcb drivers/staging/vme/vme.c      Emilio G. Cota  2010-11-12  531  	spin_unlock(&master_image->lock);
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  532  err_image:
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  533  err_bus:
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  534  	return NULL;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  535  }
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  536  EXPORT_SYMBOL(vme_master_request);
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  537  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
