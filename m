Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A56A10E7
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Feb 2023 16:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677084600; x=1708620600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=22zg0+DDKOoAk/6brD+++fiUAsJZz7dcq+NLcMG4bSE=;
  b=klwiXMu4+FZ5PS1+2sxPGDS7UGrXXWB7z+Uevomkxz02h7/hXveA/wyw
   cU3xDXGBv1S1Lc/vH/nIrCiv1DexShYbC0J1Wy3nio2beZbBf9taoEEIw
   qeAwm84lDLUgoqKN95VZ2w8l17/fz1RzZLiYnbiJHzGxv0Lc+fHHpJAFc
   xeRdwIUFHLVk8ho6eLTr96OO1nDLZw8Kq4+cOYgy8lTws8XsVm0lVyOGw
   RNZNt7iuKahez0isUL6j/OixIPGfiFvi3M3TY6G+nBd8kxlu9dDOAne7J
   cKNG7eYhYeiVgcKgHdlCMTtlyvVX/iz6i8tBbdVC4VoXkV0MsWBFQHP+e
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="331643741"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="331643741"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 08:49:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="704526396"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="704526396"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Feb 2023 08:49:26 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUsJ3-0000aZ-0X;
	Wed, 22 Feb 2023 16:49:25 +0000
Date: Thu, 23 Feb 2023 00:48:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/iommu/iommufd/device.c:539:11: warning: Uninitialized
 variable: access->ops [uninitvar]
Message-ID: <202302230036.XXeTGy7y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iommu/iommufd/device.c:539:11: warning: Uninitialized variable: access->ops [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: Kevin Tian <kevin.tian@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5b7c4cabbb65f5c469464da6c5f614cbd7f730f2
commit: 8d40205f6093f18e07fe3dc5920fc85e9f82b8b3 iommufd: Add kAPI toward external drivers for kernel access
date:   3 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 3 months ago
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 8d40205f6093f18e07fe3dc5920fc85e9f82b8b3
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302230036.XXeTGy7y-lkp@intel.com/


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/iommu/iommufd/device.c:193:29: warning: Parameter 'group' can be declared as pointer to const [constParameter]
           struct iommu_group *group)
                               ^
   drivers/iommu/iommufd/device.c:288:14: warning: Uninitialized variable: hwpt->auto_domain [uninitvar]
     if (!hwpt->auto_domain)
                ^
>> drivers/iommu/iommufd/device.c:539:11: warning: Uninitialized variable: access->ops [uninitvar]
     access->ops->unmap(access->data, iova, length);
             ^
   drivers/iommu/iommufd/device.c:535:7: note: Assuming condition is false
     if (!iommufd_lock_obj(&access->obj))
         ^
   drivers/iommu/iommufd/device.c:539:11: note: Uninitialized variable: access->ops
     access->ops->unmap(access->data, iova, length);
             ^

vim +539 drivers/iommu/iommufd/device.c

8d40205f6093f1 Jason Gunthorpe 2022-11-29  508  
8d40205f6093f1 Jason Gunthorpe 2022-11-29  509  /**
8d40205f6093f1 Jason Gunthorpe 2022-11-29  510   * iommufd_access_notify_unmap - Notify users of an iopt to stop using it
8d40205f6093f1 Jason Gunthorpe 2022-11-29  511   * @iopt: iopt to work on
8d40205f6093f1 Jason Gunthorpe 2022-11-29  512   * @iova: Starting iova in the iopt
8d40205f6093f1 Jason Gunthorpe 2022-11-29  513   * @length: Number of bytes
8d40205f6093f1 Jason Gunthorpe 2022-11-29  514   *
8d40205f6093f1 Jason Gunthorpe 2022-11-29  515   * After this function returns there should be no users attached to the pages
8d40205f6093f1 Jason Gunthorpe 2022-11-29  516   * linked to this iopt that intersect with iova,length. Anyone that has attached
8d40205f6093f1 Jason Gunthorpe 2022-11-29  517   * a user through iopt_access_pages() needs to detach it through
8d40205f6093f1 Jason Gunthorpe 2022-11-29  518   * iommufd_access_unpin_pages() before this function returns.
8d40205f6093f1 Jason Gunthorpe 2022-11-29  519   *
8d40205f6093f1 Jason Gunthorpe 2022-11-29  520   * iommufd_access_destroy() will wait for any outstanding unmap callback to
8d40205f6093f1 Jason Gunthorpe 2022-11-29  521   * complete. Once iommufd_access_destroy() no unmap ops are running or will
8d40205f6093f1 Jason Gunthorpe 2022-11-29  522   * run in the future. Due to this a driver must not create locking that prevents
8d40205f6093f1 Jason Gunthorpe 2022-11-29  523   * unmap to complete while iommufd_access_destroy() is running.
8d40205f6093f1 Jason Gunthorpe 2022-11-29  524   */
8d40205f6093f1 Jason Gunthorpe 2022-11-29  525  void iommufd_access_notify_unmap(struct io_pagetable *iopt, unsigned long iova,
8d40205f6093f1 Jason Gunthorpe 2022-11-29  526  				 unsigned long length)
8d40205f6093f1 Jason Gunthorpe 2022-11-29  527  {
8d40205f6093f1 Jason Gunthorpe 2022-11-29  528  	struct iommufd_ioas *ioas =
8d40205f6093f1 Jason Gunthorpe 2022-11-29  529  		container_of(iopt, struct iommufd_ioas, iopt);
8d40205f6093f1 Jason Gunthorpe 2022-11-29  530  	struct iommufd_access *access;
8d40205f6093f1 Jason Gunthorpe 2022-11-29  531  	unsigned long index;
8d40205f6093f1 Jason Gunthorpe 2022-11-29  532  
8d40205f6093f1 Jason Gunthorpe 2022-11-29  533  	xa_lock(&ioas->iopt.access_list);
8d40205f6093f1 Jason Gunthorpe 2022-11-29  534  	xa_for_each(&ioas->iopt.access_list, index, access) {
8d40205f6093f1 Jason Gunthorpe 2022-11-29  535  		if (!iommufd_lock_obj(&access->obj))
8d40205f6093f1 Jason Gunthorpe 2022-11-29  536  			continue;
8d40205f6093f1 Jason Gunthorpe 2022-11-29  537  		xa_unlock(&ioas->iopt.access_list);
8d40205f6093f1 Jason Gunthorpe 2022-11-29  538  
8d40205f6093f1 Jason Gunthorpe 2022-11-29 @539  		access->ops->unmap(access->data, iova, length);
8d40205f6093f1 Jason Gunthorpe 2022-11-29  540  
8d40205f6093f1 Jason Gunthorpe 2022-11-29  541  		iommufd_put_object(&access->obj);
8d40205f6093f1 Jason Gunthorpe 2022-11-29  542  		xa_lock(&ioas->iopt.access_list);
8d40205f6093f1 Jason Gunthorpe 2022-11-29  543  	}
8d40205f6093f1 Jason Gunthorpe 2022-11-29  544  	xa_unlock(&ioas->iopt.access_list);
8d40205f6093f1 Jason Gunthorpe 2022-11-29  545  }
8d40205f6093f1 Jason Gunthorpe 2022-11-29  546  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
