Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB929D290
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Sep 2023 07:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694763575; x=1726299575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0u4sjZTKDePYU14w0JEmv5tHWi9dNdncrGXKdN+ovP8=;
  b=HkN+5t03FsGMukTz9Fk0I5Bgm4ma5pfmb2dJ3Zz8UEPcg4GnG0Pq2Qyn
   jK+hnh54+aWvcKCT54nxQmuL5k3xCaMoa0sUKUHwCOPqfYg5LejpUcSVy
   KYVAduM6l8FHOgOMAMlREJdjkiIkn1jZVvwE3pGnMzei66YN14HZ502IP
   5yN0ULQG/lbKUg8L+FZahBq4MDI3tnQXf2h55PJYsFiNZFYI0qsokYYrP
   sH+kXA9m17B9k5bEUfahYYLmbVuAT4YfxAc/mtS6CqvJoXw0NL/hDEHKl
   /gghBE76BFp66eyuMMmmN3reqKuHFLwtHmkpr4GUqkHM8x/Lw5qn0rbYh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="378101988"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="378101988"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 00:39:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="744876505"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; 
   d="scan'208";a="744876505"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 15 Sep 2023 00:39:33 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qh3QJ-0002eP-0h;
	Fri, 15 Sep 2023 07:39:31 +0000
Date: Fri, 15 Sep 2023 15:38:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH vfio] vfio/pci: remove msi domain on msi disable
Message-ID: <202309151535.q1bqfuzX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230914191406.54656-1-shannon.nelson@amd.com>
References: <20230914191406.54656-1-shannon.nelson@amd.com>
TO: Shannon Nelson <shannon.nelson@amd.com>
TO: alex.williamson@redhat.com
TO: jgg@ziepe.ca
TO: kevin.tian@intel.com
TO: reinette.chatre@intel.com
TO: tglx@linutronix.de
TO: kvm@vger.kernel.org
CC: shannon.nelson@amd.com
CC: brett.creeley@amd.com
CC: linux-kernel@vger.kernel.org

Hi Shannon,

kernel test robot noticed the following build errors:

[auto build test ERROR on awilliam-vfio/for-linus]
[cannot apply to awilliam-vfio/next linus/master v6.6-rc1 next-20230915]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shannon-Nelson/vfio-pci-remove-msi-domain-on-msi-disable/20230915-031544
base:   https://github.com/awilliam/linux-vfio.git for-linus
patch link:    https://lore.kernel.org/r/20230914191406.54656-1-shannon.nelson%40amd.com
patch subject: [PATCH vfio] vfio/pci: remove msi domain on msi disable
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: i386-randconfig-004-20230915 (https://download.01.org/0day-ci/archive/20230915/202309151535.q1bqfuzX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309151535.q1bqfuzX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309151535.q1bqfuzX-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/vfio/pci/vfio_pci_intrs.c: In function 'vfio_msi_disable':
>> drivers/vfio/pci/vfio_pci_intrs.c:541:9: error: implicit declaration of function 'msi_remove_device_irq_domain' [-Werror=implicit-function-declaration]
     541 |         msi_remove_device_irq_domain(&pdev->dev, MSI_DEFAULT_DOMAIN);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/msi_remove_device_irq_domain +541 drivers/vfio/pci/vfio_pci_intrs.c

89e1f7d4c66d85f Alex Williamson   2012-07-31  524  
536475109c82841 Max Gurtovoy      2021-08-26  525  static void vfio_msi_disable(struct vfio_pci_core_device *vdev, bool msix)
89e1f7d4c66d85f Alex Williamson   2012-07-31  526  {
89e1f7d4c66d85f Alex Williamson   2012-07-31  527  	struct pci_dev *pdev = vdev->pdev;
d74e9fd8c9c81e2 Reinette Chatre   2023-05-11  528  	struct vfio_pci_irq_ctx *ctx;
7f95ee792e66322 Reinette Chatre   2023-05-11  529  	unsigned long i;
abafbc551fddede Alex Williamson   2020-04-22  530  	u16 cmd;
89e1f7d4c66d85f Alex Williamson   2012-07-31  531  
7f95ee792e66322 Reinette Chatre   2023-05-11  532  	xa_for_each(&vdev->ctx, i, ctx) {
d74e9fd8c9c81e2 Reinette Chatre   2023-05-11  533  		vfio_virqfd_disable(&ctx->unmask);
d74e9fd8c9c81e2 Reinette Chatre   2023-05-11  534  		vfio_virqfd_disable(&ctx->mask);
287c9512e767e82 Reinette Chatre   2023-05-11  535  		vfio_msi_set_vector_signal(vdev, i, -1, msix);
89e1f7d4c66d85f Alex Williamson   2012-07-31  536  	}
89e1f7d4c66d85f Alex Williamson   2012-07-31  537  
abafbc551fddede Alex Williamson   2020-04-22  538  	cmd = vfio_pci_memory_lock_and_enable(vdev);
61771468e0a567f Christoph Hellwig 2016-09-11  539  	pci_free_irq_vectors(pdev);
abafbc551fddede Alex Williamson   2020-04-22  540  	vfio_pci_memory_unlock_and_restore(vdev, cmd);
d32739dbb39d42c Shannon Nelson    2023-09-14 @541  	msi_remove_device_irq_domain(&pdev->dev, MSI_DEFAULT_DOMAIN);
89e1f7d4c66d85f Alex Williamson   2012-07-31  542  
c93a97ee0583cd6 Alex Williamson   2016-09-26  543  	/*
c93a97ee0583cd6 Alex Williamson   2016-09-26  544  	 * Both disable paths above use pci_intx_for_msi() to clear DisINTx
c93a97ee0583cd6 Alex Williamson   2016-09-26  545  	 * via their shutdown paths.  Restore for NoINTx devices.
c93a97ee0583cd6 Alex Williamson   2016-09-26  546  	 */
c93a97ee0583cd6 Alex Williamson   2016-09-26  547  	if (vdev->nointx)
c93a97ee0583cd6 Alex Williamson   2016-09-26  548  		pci_intx(pdev, 0);
c93a97ee0583cd6 Alex Williamson   2016-09-26  549  
89e1f7d4c66d85f Alex Williamson   2012-07-31  550  	vdev->irq_type = VFIO_PCI_NUM_IRQS;
89e1f7d4c66d85f Alex Williamson   2012-07-31  551  }
89e1f7d4c66d85f Alex Williamson   2012-07-31  552  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
