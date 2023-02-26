Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2333D6D
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Feb 2023 21:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677448148; x=1708984148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=at5KBZNsr/YBjsZSwF1mYzg/xICSIytgp5qy8uDZLFU=;
  b=EZsp51nt9uoUeaqTnOM4Y/Jg8jdAh1MVHq/ce99om9aaj6qJjDyDyFgy
   9uMH9s6/T38q7mLXbzDxDj20Go0yalBTMJgS/mKp+3S2AN0dcl6YZpsOd
   15/cXCtuekRbq0X1tg+dW5NGXchRekh7LvYcoH0T0QdDKG381gSYOUx2S
   IlYHieVOfjXqqgIH+ALvCYYc4C8dvrmyzpqgbrliC/Cnok3OEShw/q+fY
   es+Q8Mgcdnr+4ayxFgKbjRGu44jiGK4lH7WdRrMhqWkF5UKkXmR+1Kiw6
   UMRTcuyTGEj3n9BIFzg31LAPCvOJFdUKtmQ3QggwOqjNwmUVsvtDTTfCg
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="336023198"
X-IronPort-AV: E=Sophos;i="5.97,330,1669104000"; 
   d="scan'208";a="336023198"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 13:49:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="703797704"
X-IronPort-AV: E=Sophos;i="5.97,330,1669104000"; 
   d="scan'208";a="703797704"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 26 Feb 2023 13:49:08 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWOtH-0003uV-1P;
	Sun, 26 Feb 2023 21:49:07 +0000
Date: Mon, 27 Feb 2023 05:48:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/irq/msi.c:96:16: warning: Local variable 'index' shadows
 outer argument [shadowArgument]
Message-ID: <202302270539.3oPoYYuI-lkp@intel.com>
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
head:   f3a2439f20d918930cc4ae8f76fe1c1afd26958f
commit: 3d393b21740bffbeeae7d4fa534a6b16c3e3e832 genirq/msi: Provide msi_domain_alloc_irq_at()
date:   3 months ago
:::::: branch date: 81 minutes ago
:::::: commit date: 3 months ago
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 3d393b21740bffbeeae7d4fa534a6b16c3e3e832
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302270539.3oPoYYuI-lkp@intel.com/


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
