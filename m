Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489E98C04
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Jun 2023 08:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686126653; x=1717662653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xpsmGaHzCKO7n7BwdRYmD9bQHZ4uljKQcygSR34imDY=;
  b=M6Tk2HGDk7mxL3e7S7/GbBgwXwir/0QwRyuHlffWJnVRbx/Kt51BxpaJ
   szc1PeqzneVS/TuGiTb5woqIUegUBnQCPi44gotRe8QjvzF39epJImyky
   tHS/5W/ungH1INWHmD6SVj2UTpjYkWPYENXysH+LVMydl/90J15c5nyfS
   cmqthZINiLp1gEUUt4Un8xRGpZURPNl5o5p5fzMJgUH25co/u9dHJqVwL
   cbgtc5LFkSq2/qc38pKuEXEVFci1WUChrPhI4PZvaKZ4SSzrMbMJ1iPOc
   fgqVD4ZB+5mdrOJSBrFkbj7JNsmqTXcvjPtGoex8FbiKIHvBqVHipW/6j
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="346537705"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="346537705"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 01:30:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="686852325"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="686852325"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 07 Jun 2023 01:30:51 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6oZ8-0006Nn-1Y;
	Wed, 07 Jun 2023 08:30:50 +0000
Date: Wed, 7 Jun 2023 16:30:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/x86/kernel/hpet.c:520:46: error: invalid use of incomplete
 typedef 'msi_alloc_info_t' {aka 'struct irq_alloc_info'}
Message-ID: <202306071634.yDD1iNAE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/x86/kernel/hpet.c:520:46: error: invalid use of incomplete typedef 'msi_alloc_info_t' {aka 'struct irq_alloc_info'}"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Frank Li <Frank.Li@nxp.com>
CC: Marc Zyngier <maz@kernel.org>

Hi Frank,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a4d7d701121981e3c3fe69ade376fe9f26324161
commit: 70afdab904d2d1e68bffe75fe08e7e48e0b0ff8e irqchip: Add IMX MU MSI controller driver
date:   8 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 8 months ago
config: i386-randconfig-s002-20230607 (https://download.01.org/0day-ci/archive/20230607/202306071634.yDD1iNAE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=70afdab904d2d1e68bffe75fe08e7e48e0b0ff8e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 70afdab904d2d1e68bffe75fe08e7e48e0b0ff8e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202306071634.yDD1iNAE-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/hpet.c: In function 'hpet_msi_init':
>> arch/x86/kernel/hpet.c:520:46: error: invalid use of incomplete typedef 'msi_alloc_info_t' {aka 'struct irq_alloc_info'}
     520 |         irq_domain_set_info(domain, virq, arg->hwirq, info->chip, NULL,
         |                                              ^~
   arch/x86/kernel/hpet.c:521:49: error: invalid use of incomplete typedef 'msi_alloc_info_t' {aka 'struct irq_alloc_info'}
     521 |                             handle_edge_irq, arg->data, "edge");
         |                                                 ^~
   arch/x86/kernel/hpet.c: In function 'hpet_create_irq_domain':
>> arch/x86/kernel/hpet.c:550:13: error: 'x86_vector_domain' undeclared (first use in this function)
     550 |         if (x86_vector_domain == NULL)
         |             ^~~~~~~~~~~~~~~~~
   arch/x86/kernel/hpet.c:550:13: note: each undeclared identifier is reported only once for each function it appears in
   arch/x86/kernel/hpet.c: In function 'hpet_assign_irq':
>> arch/x86/kernel/hpet.c:598:31: error: storage size of 'info' isn't known
     598 |         struct irq_alloc_info info;
         |                               ^~~~
>> arch/x86/kernel/hpet.c:600:9: error: implicit declaration of function 'init_irq_alloc_info' [-Werror=implicit-function-declaration]
     600 |         init_irq_alloc_info(&info, NULL);
         |         ^~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/hpet.c:601:21: error: 'X86_IRQ_ALLOC_TYPE_HPET' undeclared (first use in this function)
     601 |         info.type = X86_IRQ_ALLOC_TYPE_HPET;
         |                     ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/hpet.c:598:31: error: unused variable 'info' [-Werror=unused-variable]
     598 |         struct irq_alloc_info info;
         |                               ^~~~
   arch/x86/kernel/hpet.c:607:1: error: control reaches end of non-void function [-Werror=return-type]
     607 | }
         | ^
   cc1: all warnings being treated as errors


vim +520 arch/x86/kernel/hpet.c

3d7295eb3003ae David Woodhouse 2020-10-24  514  
3d7295eb3003ae David Woodhouse 2020-10-24  515  static int hpet_msi_init(struct irq_domain *domain,
3d7295eb3003ae David Woodhouse 2020-10-24  516  			 struct msi_domain_info *info, unsigned int virq,
3d7295eb3003ae David Woodhouse 2020-10-24  517  			 irq_hw_number_t hwirq, msi_alloc_info_t *arg)
3d7295eb3003ae David Woodhouse 2020-10-24  518  {
3d7295eb3003ae David Woodhouse 2020-10-24  519  	irq_set_status_flags(virq, IRQ_MOVE_PCNTXT);
3d7295eb3003ae David Woodhouse 2020-10-24 @520  	irq_domain_set_info(domain, virq, arg->hwirq, info->chip, NULL,
3d7295eb3003ae David Woodhouse 2020-10-24  521  			    handle_edge_irq, arg->data, "edge");
3d7295eb3003ae David Woodhouse 2020-10-24  522  
3d7295eb3003ae David Woodhouse 2020-10-24  523  	return 0;
3d7295eb3003ae David Woodhouse 2020-10-24  524  }
3d7295eb3003ae David Woodhouse 2020-10-24  525  
3d7295eb3003ae David Woodhouse 2020-10-24  526  static void hpet_msi_free(struct irq_domain *domain,
3d7295eb3003ae David Woodhouse 2020-10-24  527  			  struct msi_domain_info *info, unsigned int virq)
3d7295eb3003ae David Woodhouse 2020-10-24  528  {
3d7295eb3003ae David Woodhouse 2020-10-24  529  	irq_clear_status_flags(virq, IRQ_MOVE_PCNTXT);
3d7295eb3003ae David Woodhouse 2020-10-24  530  }
3d7295eb3003ae David Woodhouse 2020-10-24  531  
3d7295eb3003ae David Woodhouse 2020-10-24  532  static struct msi_domain_ops hpet_msi_domain_ops = {
3d7295eb3003ae David Woodhouse 2020-10-24  533  	.msi_init	= hpet_msi_init,
3d7295eb3003ae David Woodhouse 2020-10-24  534  	.msi_free	= hpet_msi_free,
3d7295eb3003ae David Woodhouse 2020-10-24  535  };
3d7295eb3003ae David Woodhouse 2020-10-24  536  
3d7295eb3003ae David Woodhouse 2020-10-24  537  static struct msi_domain_info hpet_msi_domain_info = {
3d7295eb3003ae David Woodhouse 2020-10-24  538  	.ops		= &hpet_msi_domain_ops,
3d7295eb3003ae David Woodhouse 2020-10-24  539  	.chip		= &hpet_msi_controller,
3d7295eb3003ae David Woodhouse 2020-10-24  540  	.flags		= MSI_FLAG_USE_DEF_DOM_OPS,
3d7295eb3003ae David Woodhouse 2020-10-24  541  };
3d7295eb3003ae David Woodhouse 2020-10-24  542  
3d7295eb3003ae David Woodhouse 2020-10-24  543  static struct irq_domain *hpet_create_irq_domain(int hpet_id)
3d7295eb3003ae David Woodhouse 2020-10-24  544  {
3d7295eb3003ae David Woodhouse 2020-10-24  545  	struct msi_domain_info *domain_info;
3d7295eb3003ae David Woodhouse 2020-10-24  546  	struct irq_domain *parent, *d;
3d7295eb3003ae David Woodhouse 2020-10-24  547  	struct fwnode_handle *fn;
c2a5881c28e5bb David Woodhouse 2020-10-24  548  	struct irq_fwspec fwspec;
3d7295eb3003ae David Woodhouse 2020-10-24  549  
3d7295eb3003ae David Woodhouse 2020-10-24 @550  	if (x86_vector_domain == NULL)
3d7295eb3003ae David Woodhouse 2020-10-24  551  		return NULL;
3d7295eb3003ae David Woodhouse 2020-10-24  552  
3d7295eb3003ae David Woodhouse 2020-10-24  553  	domain_info = kzalloc(sizeof(*domain_info), GFP_KERNEL);
3d7295eb3003ae David Woodhouse 2020-10-24  554  	if (!domain_info)
3d7295eb3003ae David Woodhouse 2020-10-24  555  		return NULL;
3d7295eb3003ae David Woodhouse 2020-10-24  556  
3d7295eb3003ae David Woodhouse 2020-10-24  557  	*domain_info = hpet_msi_domain_info;
3d7295eb3003ae David Woodhouse 2020-10-24  558  	domain_info->data = (void *)(long)hpet_id;
3d7295eb3003ae David Woodhouse 2020-10-24  559  
3d7295eb3003ae David Woodhouse 2020-10-24  560  	fn = irq_domain_alloc_named_id_fwnode(hpet_msi_controller.name,
3d7295eb3003ae David Woodhouse 2020-10-24  561  					      hpet_id);
3d7295eb3003ae David Woodhouse 2020-10-24  562  	if (!fn) {
3d7295eb3003ae David Woodhouse 2020-10-24  563  		kfree(domain_info);
3d7295eb3003ae David Woodhouse 2020-10-24  564  		return NULL;
3d7295eb3003ae David Woodhouse 2020-10-24  565  	}
3d7295eb3003ae David Woodhouse 2020-10-24  566  
c2a5881c28e5bb David Woodhouse 2020-10-24  567  	fwspec.fwnode = fn;
c2a5881c28e5bb David Woodhouse 2020-10-24  568  	fwspec.param_count = 1;
c2a5881c28e5bb David Woodhouse 2020-10-24  569  	fwspec.param[0] = hpet_id;
c2a5881c28e5bb David Woodhouse 2020-10-24  570  
c2a5881c28e5bb David Woodhouse 2020-10-24  571  	parent = irq_find_matching_fwspec(&fwspec, DOMAIN_BUS_ANY);
c2a5881c28e5bb David Woodhouse 2020-10-24  572  	if (!parent) {
c2a5881c28e5bb David Woodhouse 2020-10-24  573  		irq_domain_free_fwnode(fn);
c2a5881c28e5bb David Woodhouse 2020-10-24  574  		kfree(domain_info);
c2a5881c28e5bb David Woodhouse 2020-10-24  575  		return NULL;
c2a5881c28e5bb David Woodhouse 2020-10-24  576  	}
c2a5881c28e5bb David Woodhouse 2020-10-24  577  	if (parent != x86_vector_domain)
c2a5881c28e5bb David Woodhouse 2020-10-24  578  		hpet_msi_controller.name = "IR-HPET-MSI";
c2a5881c28e5bb David Woodhouse 2020-10-24  579  
3d7295eb3003ae David Woodhouse 2020-10-24  580  	d = msi_create_irq_domain(fn, domain_info, parent);
3d7295eb3003ae David Woodhouse 2020-10-24  581  	if (!d) {
3d7295eb3003ae David Woodhouse 2020-10-24  582  		irq_domain_free_fwnode(fn);
3d7295eb3003ae David Woodhouse 2020-10-24  583  		kfree(domain_info);
3d7295eb3003ae David Woodhouse 2020-10-24  584  	}
3d7295eb3003ae David Woodhouse 2020-10-24  585  	return d;
3d7295eb3003ae David Woodhouse 2020-10-24  586  }
3d7295eb3003ae David Woodhouse 2020-10-24  587  
3d7295eb3003ae David Woodhouse 2020-10-24  588  static inline int hpet_dev_id(struct irq_domain *domain)
3d7295eb3003ae David Woodhouse 2020-10-24  589  {
3d7295eb3003ae David Woodhouse 2020-10-24  590  	struct msi_domain_info *info = msi_get_domain_info(domain);
3d7295eb3003ae David Woodhouse 2020-10-24  591  
3d7295eb3003ae David Woodhouse 2020-10-24  592  	return (int)(long)info->data;
3d7295eb3003ae David Woodhouse 2020-10-24  593  }
3d7295eb3003ae David Woodhouse 2020-10-24  594  
3d7295eb3003ae David Woodhouse 2020-10-24  595  static int hpet_assign_irq(struct irq_domain *domain, struct hpet_channel *hc,
3d7295eb3003ae David Woodhouse 2020-10-24  596  			   int dev_num)
3d7295eb3003ae David Woodhouse 2020-10-24  597  {
3d7295eb3003ae David Woodhouse 2020-10-24 @598  	struct irq_alloc_info info;
3d7295eb3003ae David Woodhouse 2020-10-24  599  
3d7295eb3003ae David Woodhouse 2020-10-24 @600  	init_irq_alloc_info(&info, NULL);
3d7295eb3003ae David Woodhouse 2020-10-24 @601  	info.type = X86_IRQ_ALLOC_TYPE_HPET;
3d7295eb3003ae David Woodhouse 2020-10-24  602  	info.data = hc;
3d7295eb3003ae David Woodhouse 2020-10-24  603  	info.devid = hpet_dev_id(domain);
3d7295eb3003ae David Woodhouse 2020-10-24  604  	info.hwirq = dev_num;
3d7295eb3003ae David Woodhouse 2020-10-24  605  
3d7295eb3003ae David Woodhouse 2020-10-24  606  	return irq_domain_alloc_irqs(domain, 1, NUMA_NO_NODE, &info);
3d7295eb3003ae David Woodhouse 2020-10-24  607  }
3d7295eb3003ae David Woodhouse 2020-10-24  608  

:::::: The code at line 520 was first introduced by commit
:::::: 3d7295eb3003aea9f89de35304b3a88ae4d5036b x86/hpet: Move MSI support into hpet.c

:::::: TO: David Woodhouse <dwmw@amazon.co.uk>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
