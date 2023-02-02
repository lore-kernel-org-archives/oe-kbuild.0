Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC0E63B7
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Feb 2023 13:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675343315; x=1706879315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l0gCHNql8HG86Sh9/LXjGJmf1qiqN8OhJT0Xn5eQD3c=;
  b=UlP1OytRbdlNjtRcTZgrT+lHcHeU77gQgz1FBHKNBjX4e9538bBd+dJO
   wrjFHR9/5L8s307NEmsQqtA7AwH53FzoCUAUzEDD5qNuWH4A1Ni96KRlm
   M5H6HZCoXaG8RtF5b8KH7XHIoK4PpudXIExgtLH3jQIAdNDwLBIVTz1qn
   mrF5lKSGLSVIW/qz/wtEDsH5ipUsBRS3F9Z0itzjaFkSI+SGPKkrKEujd
   48lnVc3KlcBTFJjHk2PzzlwPGghraUpZX0Cftm9l+aFdiMwglT20g/FP+
   /nNZDp+tD+E0U0Fe9vyFrSzo2IQKl1c0brbKrtcqCJA0BBcuT00YoJN6y
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="327090861"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="327090861"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 05:08:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="728855724"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="728855724"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Feb 2023 05:08:31 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNZKJ-0006Wh-0w;
	Thu, 02 Feb 2023 13:08:31 +0000
Date: Thu, 2 Feb 2023 21:07:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/vfio/group.c:400:48: warning: Parameter 'iommu_group' can be
 declared as pointer to const [constParameter]
Message-ID: <202302022144.V4v62TII-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/vfio/group.c:400:48: warning: Parameter 'iommu_group' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Yi Liu <yi.l.liu@intel.com>
CC: Jason Gunthorpe <jgg@ziepe.ca>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>

Hi Yi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f266ccaa2f5228bfe67ad58a94ca4e0109b954a
commit: 9eefba8002c27d65ab52a533fd0611b099b73591 vfio: Move vfio group specific code into group.c
date:   8 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 8 weeks ago
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 9eefba8002c27d65ab52a533fd0611b099b73591
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/vfio/group.c:400:48: warning: Parameter 'iommu_group' can be declared as pointer to const [constParameter]
   vfio_group_find_from_iommu(struct iommu_group *iommu_group)
                                                  ^
>> drivers/vfio/group.c:535:76: warning: Parameter 'dev' can be declared as pointer to const [constParameter]
   static bool vfio_group_has_device(struct vfio_group *group, struct device *dev)
                                                                              ^
   drivers/vfio/group.c:411:14: warning: Uninitialized variable: group->iommu_group [uninitvar]
     if (group->iommu_group == iommu_group)
                ^

vim +/iommu_group +400 drivers/vfio/group.c

9eefba8002c27d Yi Liu 2022-11-25  395  
9eefba8002c27d Yi Liu 2022-11-25  396  /*
9eefba8002c27d Yi Liu 2022-11-25  397   * Group objects - create, release, get, put, search
9eefba8002c27d Yi Liu 2022-11-25  398   */
9eefba8002c27d Yi Liu 2022-11-25  399  static struct vfio_group *
9eefba8002c27d Yi Liu 2022-11-25 @400  vfio_group_find_from_iommu(struct iommu_group *iommu_group)
9eefba8002c27d Yi Liu 2022-11-25  401  {
9eefba8002c27d Yi Liu 2022-11-25  402  	struct vfio_group *group;
9eefba8002c27d Yi Liu 2022-11-25  403  
9eefba8002c27d Yi Liu 2022-11-25  404  	lockdep_assert_held(&vfio.group_lock);
9eefba8002c27d Yi Liu 2022-11-25  405  
9eefba8002c27d Yi Liu 2022-11-25  406  	/*
9eefba8002c27d Yi Liu 2022-11-25  407  	 * group->iommu_group from the vfio.group_list cannot be NULL
9eefba8002c27d Yi Liu 2022-11-25  408  	 * under the vfio.group_lock.
9eefba8002c27d Yi Liu 2022-11-25  409  	 */
9eefba8002c27d Yi Liu 2022-11-25  410  	list_for_each_entry(group, &vfio.group_list, vfio_next) {
9eefba8002c27d Yi Liu 2022-11-25  411  		if (group->iommu_group == iommu_group)
9eefba8002c27d Yi Liu 2022-11-25  412  			return group;
9eefba8002c27d Yi Liu 2022-11-25  413  	}
9eefba8002c27d Yi Liu 2022-11-25  414  	return NULL;
9eefba8002c27d Yi Liu 2022-11-25  415  }
9eefba8002c27d Yi Liu 2022-11-25  416  
9eefba8002c27d Yi Liu 2022-11-25  417  static void vfio_group_release(struct device *dev)
9eefba8002c27d Yi Liu 2022-11-25  418  {
9eefba8002c27d Yi Liu 2022-11-25  419  	struct vfio_group *group = container_of(dev, struct vfio_group, dev);
9eefba8002c27d Yi Liu 2022-11-25  420  
9eefba8002c27d Yi Liu 2022-11-25  421  	mutex_destroy(&group->device_lock);
9eefba8002c27d Yi Liu 2022-11-25  422  	mutex_destroy(&group->group_lock);
9eefba8002c27d Yi Liu 2022-11-25  423  	WARN_ON(group->iommu_group);
9eefba8002c27d Yi Liu 2022-11-25  424  	ida_free(&vfio.group_ida, MINOR(group->dev.devt));
9eefba8002c27d Yi Liu 2022-11-25  425  	kfree(group);
9eefba8002c27d Yi Liu 2022-11-25  426  }
9eefba8002c27d Yi Liu 2022-11-25  427  
9eefba8002c27d Yi Liu 2022-11-25  428  static struct vfio_group *vfio_group_alloc(struct iommu_group *iommu_group,
9eefba8002c27d Yi Liu 2022-11-25  429  					   enum vfio_group_type type)
9eefba8002c27d Yi Liu 2022-11-25  430  {
9eefba8002c27d Yi Liu 2022-11-25  431  	struct vfio_group *group;
9eefba8002c27d Yi Liu 2022-11-25  432  	int minor;
9eefba8002c27d Yi Liu 2022-11-25  433  
9eefba8002c27d Yi Liu 2022-11-25  434  	group = kzalloc(sizeof(*group), GFP_KERNEL);
9eefba8002c27d Yi Liu 2022-11-25  435  	if (!group)
9eefba8002c27d Yi Liu 2022-11-25  436  		return ERR_PTR(-ENOMEM);
9eefba8002c27d Yi Liu 2022-11-25  437  
9eefba8002c27d Yi Liu 2022-11-25  438  	minor = ida_alloc_max(&vfio.group_ida, MINORMASK, GFP_KERNEL);
9eefba8002c27d Yi Liu 2022-11-25  439  	if (minor < 0) {
9eefba8002c27d Yi Liu 2022-11-25  440  		kfree(group);
9eefba8002c27d Yi Liu 2022-11-25  441  		return ERR_PTR(minor);
9eefba8002c27d Yi Liu 2022-11-25  442  	}
9eefba8002c27d Yi Liu 2022-11-25  443  
9eefba8002c27d Yi Liu 2022-11-25  444  	device_initialize(&group->dev);
9eefba8002c27d Yi Liu 2022-11-25  445  	group->dev.devt = MKDEV(MAJOR(vfio.group_devt), minor);
9eefba8002c27d Yi Liu 2022-11-25  446  	group->dev.class = vfio.class;
9eefba8002c27d Yi Liu 2022-11-25  447  	group->dev.release = vfio_group_release;
9eefba8002c27d Yi Liu 2022-11-25  448  	cdev_init(&group->cdev, &vfio_group_fops);
9eefba8002c27d Yi Liu 2022-11-25  449  	group->cdev.owner = THIS_MODULE;
9eefba8002c27d Yi Liu 2022-11-25  450  
9eefba8002c27d Yi Liu 2022-11-25  451  	refcount_set(&group->drivers, 1);
9eefba8002c27d Yi Liu 2022-11-25  452  	mutex_init(&group->group_lock);
9eefba8002c27d Yi Liu 2022-11-25  453  	INIT_LIST_HEAD(&group->device_list);
9eefba8002c27d Yi Liu 2022-11-25  454  	mutex_init(&group->device_lock);
9eefba8002c27d Yi Liu 2022-11-25  455  	group->iommu_group = iommu_group;
9eefba8002c27d Yi Liu 2022-11-25  456  	/* put in vfio_group_release() */
9eefba8002c27d Yi Liu 2022-11-25  457  	iommu_group_ref_get(iommu_group);
9eefba8002c27d Yi Liu 2022-11-25  458  	group->type = type;
9eefba8002c27d Yi Liu 2022-11-25  459  	BLOCKING_INIT_NOTIFIER_HEAD(&group->notifier);
9eefba8002c27d Yi Liu 2022-11-25  460  
9eefba8002c27d Yi Liu 2022-11-25  461  	return group;
9eefba8002c27d Yi Liu 2022-11-25  462  }
9eefba8002c27d Yi Liu 2022-11-25  463  
9eefba8002c27d Yi Liu 2022-11-25  464  static struct vfio_group *vfio_create_group(struct iommu_group *iommu_group,
9eefba8002c27d Yi Liu 2022-11-25  465  		enum vfio_group_type type)
9eefba8002c27d Yi Liu 2022-11-25  466  {
9eefba8002c27d Yi Liu 2022-11-25  467  	struct vfio_group *group;
9eefba8002c27d Yi Liu 2022-11-25  468  	struct vfio_group *ret;
9eefba8002c27d Yi Liu 2022-11-25  469  	int err;
9eefba8002c27d Yi Liu 2022-11-25  470  
9eefba8002c27d Yi Liu 2022-11-25  471  	lockdep_assert_held(&vfio.group_lock);
9eefba8002c27d Yi Liu 2022-11-25  472  
9eefba8002c27d Yi Liu 2022-11-25  473  	group = vfio_group_alloc(iommu_group, type);
9eefba8002c27d Yi Liu 2022-11-25  474  	if (IS_ERR(group))
9eefba8002c27d Yi Liu 2022-11-25  475  		return group;
9eefba8002c27d Yi Liu 2022-11-25  476  
9eefba8002c27d Yi Liu 2022-11-25  477  	err = dev_set_name(&group->dev, "%s%d",
9eefba8002c27d Yi Liu 2022-11-25  478  			   group->type == VFIO_NO_IOMMU ? "noiommu-" : "",
9eefba8002c27d Yi Liu 2022-11-25  479  			   iommu_group_id(iommu_group));
9eefba8002c27d Yi Liu 2022-11-25  480  	if (err) {
9eefba8002c27d Yi Liu 2022-11-25  481  		ret = ERR_PTR(err);
9eefba8002c27d Yi Liu 2022-11-25  482  		goto err_put;
9eefba8002c27d Yi Liu 2022-11-25  483  	}
9eefba8002c27d Yi Liu 2022-11-25  484  
9eefba8002c27d Yi Liu 2022-11-25  485  	err = cdev_device_add(&group->cdev, &group->dev);
9eefba8002c27d Yi Liu 2022-11-25  486  	if (err) {
9eefba8002c27d Yi Liu 2022-11-25  487  		ret = ERR_PTR(err);
9eefba8002c27d Yi Liu 2022-11-25  488  		goto err_put;
9eefba8002c27d Yi Liu 2022-11-25  489  	}
9eefba8002c27d Yi Liu 2022-11-25  490  
9eefba8002c27d Yi Liu 2022-11-25  491  	list_add(&group->vfio_next, &vfio.group_list);
9eefba8002c27d Yi Liu 2022-11-25  492  
9eefba8002c27d Yi Liu 2022-11-25  493  	return group;
9eefba8002c27d Yi Liu 2022-11-25  494  
9eefba8002c27d Yi Liu 2022-11-25  495  err_put:
9eefba8002c27d Yi Liu 2022-11-25  496  	put_device(&group->dev);
9eefba8002c27d Yi Liu 2022-11-25  497  	return ret;
9eefba8002c27d Yi Liu 2022-11-25  498  }
9eefba8002c27d Yi Liu 2022-11-25  499  
9eefba8002c27d Yi Liu 2022-11-25  500  static struct vfio_group *vfio_noiommu_group_alloc(struct device *dev,
9eefba8002c27d Yi Liu 2022-11-25  501  		enum vfio_group_type type)
9eefba8002c27d Yi Liu 2022-11-25  502  {
9eefba8002c27d Yi Liu 2022-11-25  503  	struct iommu_group *iommu_group;
9eefba8002c27d Yi Liu 2022-11-25  504  	struct vfio_group *group;
9eefba8002c27d Yi Liu 2022-11-25  505  	int ret;
9eefba8002c27d Yi Liu 2022-11-25  506  
9eefba8002c27d Yi Liu 2022-11-25  507  	iommu_group = iommu_group_alloc();
9eefba8002c27d Yi Liu 2022-11-25  508  	if (IS_ERR(iommu_group))
9eefba8002c27d Yi Liu 2022-11-25  509  		return ERR_CAST(iommu_group);
9eefba8002c27d Yi Liu 2022-11-25  510  
9eefba8002c27d Yi Liu 2022-11-25  511  	ret = iommu_group_set_name(iommu_group, "vfio-noiommu");
9eefba8002c27d Yi Liu 2022-11-25  512  	if (ret)
9eefba8002c27d Yi Liu 2022-11-25  513  		goto out_put_group;
9eefba8002c27d Yi Liu 2022-11-25  514  	ret = iommu_group_add_device(iommu_group, dev);
9eefba8002c27d Yi Liu 2022-11-25  515  	if (ret)
9eefba8002c27d Yi Liu 2022-11-25  516  		goto out_put_group;
9eefba8002c27d Yi Liu 2022-11-25  517  
9eefba8002c27d Yi Liu 2022-11-25  518  	mutex_lock(&vfio.group_lock);
9eefba8002c27d Yi Liu 2022-11-25  519  	group = vfio_create_group(iommu_group, type);
9eefba8002c27d Yi Liu 2022-11-25  520  	mutex_unlock(&vfio.group_lock);
9eefba8002c27d Yi Liu 2022-11-25  521  	if (IS_ERR(group)) {
9eefba8002c27d Yi Liu 2022-11-25  522  		ret = PTR_ERR(group);
9eefba8002c27d Yi Liu 2022-11-25  523  		goto out_remove_device;
9eefba8002c27d Yi Liu 2022-11-25  524  	}
9eefba8002c27d Yi Liu 2022-11-25  525  	iommu_group_put(iommu_group);
9eefba8002c27d Yi Liu 2022-11-25  526  	return group;
9eefba8002c27d Yi Liu 2022-11-25  527  
9eefba8002c27d Yi Liu 2022-11-25  528  out_remove_device:
9eefba8002c27d Yi Liu 2022-11-25  529  	iommu_group_remove_device(dev);
9eefba8002c27d Yi Liu 2022-11-25  530  out_put_group:
9eefba8002c27d Yi Liu 2022-11-25  531  	iommu_group_put(iommu_group);
9eefba8002c27d Yi Liu 2022-11-25  532  	return ERR_PTR(ret);
9eefba8002c27d Yi Liu 2022-11-25  533  }
9eefba8002c27d Yi Liu 2022-11-25  534  
9eefba8002c27d Yi Liu 2022-11-25 @535  static bool vfio_group_has_device(struct vfio_group *group, struct device *dev)
9eefba8002c27d Yi Liu 2022-11-25  536  {
9eefba8002c27d Yi Liu 2022-11-25  537  	struct vfio_device *device;
9eefba8002c27d Yi Liu 2022-11-25  538  
9eefba8002c27d Yi Liu 2022-11-25  539  	mutex_lock(&group->device_lock);
9eefba8002c27d Yi Liu 2022-11-25  540  	list_for_each_entry(device, &group->device_list, group_next) {
9eefba8002c27d Yi Liu 2022-11-25  541  		if (device->dev == dev) {
9eefba8002c27d Yi Liu 2022-11-25  542  			mutex_unlock(&group->device_lock);
9eefba8002c27d Yi Liu 2022-11-25  543  			return true;
9eefba8002c27d Yi Liu 2022-11-25  544  		}
9eefba8002c27d Yi Liu 2022-11-25  545  	}
9eefba8002c27d Yi Liu 2022-11-25  546  	mutex_unlock(&group->device_lock);
9eefba8002c27d Yi Liu 2022-11-25  547  	return false;
9eefba8002c27d Yi Liu 2022-11-25  548  }
9eefba8002c27d Yi Liu 2022-11-25  549  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
