Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCBF28F4
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Jan 2023 17:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675013901; x=1706549901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YH3g+r2cFYciLlO0nLNCSQsC4zzXrO+aw0Bgoac9HEQ=;
  b=HwnwJzI80BcvDYUY/0hOzSjbgITqZEiuUPJ+wRq8Am3RUNWjx/xfhCg8
   U2ZW12jjbL2PEcK88NRWll3Qq7J9nWWoFvayNmyy7wO3iJI+1W3q+a4wg
   oniXJWPyH35GIzAhhGk1lAZpuEOzMZDCqVR+fCl6Vca++yzvngc9UtJDy
   dUB4hAu+AsPkDFwAHZ0HMT5qyYXG7VHhuMlLS7j66PmvhPVXljq0QMpUd
   HhGqJUrGZ7rQC7xhYp581FsiD5sxT6tbtce2pCabxYR5NvSjOALSKhpye
   lx403ErQr0NpvbPo2wHBNSF2yB7d0MQq8EA+1gz7Ht2u+KLbKNFt91d31
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="329542719"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="329542719"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 09:38:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="696153875"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="696153875"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 29 Jan 2023 09:38:19 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMBdC-0002zC-19;
	Sun, 29 Jan 2023 17:38:18 +0000
Date: Mon, 30 Jan 2023 01:37:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/irq/msi.c:96:16: warning: Local variable 'index' shadows
 outer argument [shadowArgument]
Message-ID: <202301300150.GKbVOFfh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/irq/msi.c:96:16: warning: Local variable 'index' shadows outer argument [shadowArgument]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>
CC: Kevin Tian <kevin.tian@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c96618275234ad03d44eafe9f8844305bb44fda4
commit: 3d393b21740bffbeeae7d4fa534a6b16c3e3e832 genirq/msi: Provide msi_domain_alloc_irq_at()
date:   8 weeks ago
:::::: branch date: 22 hours ago
:::::: commit date: 8 weeks ago
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 3d393b21740bffbeeae7d4fa534a6b16c3e3e832
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> kernel/irq/msi.c:96:16: warning: Local variable 'index' shadows outer argument [shadowArgument]
     unsigned int index;
                  ^
   kernel/irq/msi.c:85:40: note: Shadowed declaration
         unsigned int domid, unsigned int index)
                                          ^
   kernel/irq/msi.c:96:16: note: Shadow variable
     unsigned int index;
                  ^
>> kernel/irq/msi.c:1445:39: warning: Parameter 'icookie' can be declared as pointer to const [constParameter]
              union msi_instance_cookie *icookie)
                                         ^

vim +/index +96 kernel/irq/msi.c

aa48b6f708868a Jiang Liu       2015-07-09   83  
36db3d9003ea85 Thomas Gleixner 2022-11-25   84  static int msi_insert_desc(struct device *dev, struct msi_desc *desc,
fc8ab388325ddf Thomas Gleixner 2022-11-25   85  			   unsigned int domid, unsigned int index)
cd6cf06590b979 Thomas Gleixner 2021-12-06   86  {
36db3d9003ea85 Thomas Gleixner 2022-11-25   87  	struct msi_device_data *md = dev->msi.data;
fc8ab388325ddf Thomas Gleixner 2022-11-25   88  	struct xarray *xa = &md->__domains[domid].store;
36db3d9003ea85 Thomas Gleixner 2022-11-25   89  	unsigned int hwsize;
cd6cf06590b979 Thomas Gleixner 2021-12-06   90  	int ret;
cd6cf06590b979 Thomas Gleixner 2021-12-06   91  
36db3d9003ea85 Thomas Gleixner 2022-11-25   92  	hwsize = msi_domain_get_hwsize(dev, domid);
3d393b21740bff Thomas Gleixner 2022-11-25   93  
3d393b21740bff Thomas Gleixner 2022-11-25   94  	if (index == MSI_ANY_INDEX) {
3d393b21740bff Thomas Gleixner 2022-11-25   95  		struct xa_limit limit = { .min = 0, .max = hwsize - 1 };
3d393b21740bff Thomas Gleixner 2022-11-25  @96  		unsigned int index;
3d393b21740bff Thomas Gleixner 2022-11-25   97  
3d393b21740bff Thomas Gleixner 2022-11-25   98  		/* Let the xarray allocate a free index within the limit */
3d393b21740bff Thomas Gleixner 2022-11-25   99  		ret = xa_alloc(xa, &index, desc, limit, GFP_KERNEL);
3d393b21740bff Thomas Gleixner 2022-11-25  100  		if (ret)
3d393b21740bff Thomas Gleixner 2022-11-25  101  			goto fail;
3d393b21740bff Thomas Gleixner 2022-11-25  102  
3d393b21740bff Thomas Gleixner 2022-11-25  103  		desc->msi_index = index;
3d393b21740bff Thomas Gleixner 2022-11-25  104  		return 0;
3d393b21740bff Thomas Gleixner 2022-11-25  105  	} else {
36db3d9003ea85 Thomas Gleixner 2022-11-25  106  		if (index >= hwsize) {
36db3d9003ea85 Thomas Gleixner 2022-11-25  107  			ret = -ERANGE;
36db3d9003ea85 Thomas Gleixner 2022-11-25  108  			goto fail;
36db3d9003ea85 Thomas Gleixner 2022-11-25  109  		}
36db3d9003ea85 Thomas Gleixner 2022-11-25  110  
cd6cf06590b979 Thomas Gleixner 2021-12-06  111  		desc->msi_index = index;
f1139f905bd2d8 Thomas Gleixner 2022-11-25  112  		ret = xa_insert(xa, index, desc, GFP_KERNEL);
cd6cf06590b979 Thomas Gleixner 2021-12-06  113  		if (ret)
36db3d9003ea85 Thomas Gleixner 2022-11-25  114  			goto fail;
36db3d9003ea85 Thomas Gleixner 2022-11-25  115  		return 0;
3d393b21740bff Thomas Gleixner 2022-11-25  116  	}
36db3d9003ea85 Thomas Gleixner 2022-11-25  117  fail:
cd6cf06590b979 Thomas Gleixner 2021-12-06  118  	msi_free_desc(desc);
cd6cf06590b979 Thomas Gleixner 2021-12-06  119  	return ret;
cd6cf06590b979 Thomas Gleixner 2021-12-06  120  }
cd6cf06590b979 Thomas Gleixner 2021-12-06  121  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
