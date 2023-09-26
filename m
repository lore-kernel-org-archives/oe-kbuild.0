Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12315221
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Sep 2023 06:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695709704; x=1727245704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WHcklMqs0DB7Glk664DZ3XZDmqfRZcHhWZu1aLFiqqg=;
  b=ZYxXAraMxZguYg6qgjYor/77xgW64zCSJC8a9XNlsyRDWklQ8Ykx76xG
   kRsD5kLwMxVEH0sREoaFXAP66RHXJdWU4s8+GS/RALXil2HK8zVt3gT0P
   zDb4GghEZLxA/yuVdJ9ZVf9N7Dei/uFbA6GWJuAkBGQcy792Akc9/MkLp
   uZtLg+uzKSVKff8NYURw5cITyQ2TY+NyE1XqkWiWo7Q3f2dzH7KwhNEaX
   gvVDYHsrJhQ3ZpeShzrkB9QV0Oa+DJyg+LH+wWb2fAECbJFpo0TQdEhVs
   GPtiLrB4IcXyRvV7IXsN0iGavq4baucYCuXrxtHZJ9SrILb4vWeSuxnpa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="378775436"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="378775436"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 23:28:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="748709403"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="748709403"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 25 Sep 2023 23:28:21 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ql1YR-0002Wb-0z;
	Tue, 26 Sep 2023 06:28:19 +0000
Date: Tue, 26 Sep 2023 14:27:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next v4 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202309261405.qSNuGpjv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/media/pci/solo6x10/solo6x10-core.c:362:24: sparse: sparse: too long token expansion"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <fe7e6c542e094bfca655abcd323c1c98@AcuMS.aculab.com>
References: <fe7e6c542e094bfca655abcd323c1c98@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
CC: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
CC: "'Christoph Hellwig'" <hch@infradead.org>
CC: "'Jason A. Donenfeld'" <Jason@zx2c4.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linux/master]
[also build test WARNING on linus/master v6.6-rc3]
[cannot apply to next-20230918 next-20230925]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Add-umin-a-b-and-umax-a-b/20230918-162441
base:   linux/master
patch link:    https://lore.kernel.org/r/fe7e6c542e094bfca655abcd323c1c98%40AcuMS.aculab.com
patch subject: [PATCH next v4 2/5] minmax: Allow min()/max()/clamp() if the arguments have the same signedness.
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: i386-randconfig-061-20230926 (https://download.01.org/0day-ci/archive/20230926/202309261405.qSNuGpjv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309261405.qSNuGpjv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309261405.qSNuGpjv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/pci/solo6x10/solo6x10-core.c:362:24: sparse: sparse: too long token expansion
>> drivers/media/pci/solo6x10/solo6x10-core.c:362:24: sparse: sparse: too long token expansion
>> drivers/media/pci/solo6x10/solo6x10-core.c:362:24: sparse: sparse: too long token expansion
>> drivers/media/pci/solo6x10/solo6x10-core.c:362:24: sparse: sparse: too long token expansion
--
>> drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: sparse: sparse: too long token expansion
>> drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: sparse: sparse: too long token expansion
>> drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: sparse: sparse: too long token expansion
>> drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: sparse: sparse: too long token expansion
--
>> drivers/media/pci/solo6x10/solo6x10-p2m.c:309:13: sparse: sparse: too long token expansion
>> drivers/media/pci/solo6x10/solo6x10-p2m.c:309:13: sparse: sparse: too long token expansion
>> drivers/media/pci/solo6x10/solo6x10-p2m.c:309:13: sparse: sparse: too long token expansion
>> drivers/media/pci/solo6x10/solo6x10-p2m.c:309:13: sparse: sparse: too long token expansion
   drivers/media/pci/solo6x10/solo6x10-p2m.c:310:17: sparse: sparse: too long token expansion
   drivers/media/pci/solo6x10/solo6x10-p2m.c:310:17: sparse: sparse: too long token expansion
   drivers/media/pci/solo6x10/solo6x10-p2m.c:310:17: sparse: sparse: too long token expansion
   drivers/media/pci/solo6x10/solo6x10-p2m.c:310:17: sparse: sparse: too long token expansion
--
>> drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: sparse: sparse: too long token expansion
>> drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: sparse: sparse: too long token expansion
>> drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: sparse: sparse: too long token expansion
>> drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: sparse: sparse: too long token expansion
   drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: sparse: sparse: too long token expansion
   drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: sparse: sparse: too long token expansion
   drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: sparse: sparse: too long token expansion
   drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: sparse: sparse: too long token expansion

vim +362 drivers/media/pci/solo6x10/solo6x10-core.c

dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  316  
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  317  static ssize_t sdram_offsets_show(struct device *dev,
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  318  				  struct device_attribute *attr,
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  319  				  char *buf)
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  320  {
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  321  	struct solo_dev *solo_dev =
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  322  		container_of(dev, struct solo_dev, dev);
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  323  	char *out = buf;
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  324  
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  325  	out += sprintf(out, "DISP: 0x%08x @ 0x%08x\n",
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  326  		       SOLO_DISP_EXT_ADDR,
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  327  		       SOLO_DISP_EXT_SIZE);
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  328  
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  329  	out += sprintf(out, "EOSD: 0x%08x @ 0x%08x (0x%08x * %d)\n",
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  330  		       SOLO_EOSD_EXT_ADDR,
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  331  		       SOLO_EOSD_EXT_AREA(solo_dev),
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  332  		       SOLO_EOSD_EXT_SIZE(solo_dev),
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  333  		       SOLO_EOSD_EXT_AREA(solo_dev) /
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  334  		       SOLO_EOSD_EXT_SIZE(solo_dev));
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  335  
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  336  	out += sprintf(out, "MOTI: 0x%08x @ 0x%08x\n",
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  337  		       SOLO_MOTION_EXT_ADDR(solo_dev),
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  338  		       SOLO_MOTION_EXT_SIZE);
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  339  
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  340  	out += sprintf(out, "G723: 0x%08x @ 0x%08x\n",
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  341  		       SOLO_G723_EXT_ADDR(solo_dev),
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  342  		       SOLO_G723_EXT_SIZE);
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  343  
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  344  	out += sprintf(out, "CAPT: 0x%08x @ 0x%08x (0x%08x * %d)\n",
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  345  		       SOLO_CAP_EXT_ADDR(solo_dev),
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  346  		       SOLO_CAP_EXT_SIZE(solo_dev),
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  347  		       SOLO_CAP_PAGE_SIZE,
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  348  		       SOLO_CAP_EXT_SIZE(solo_dev) / SOLO_CAP_PAGE_SIZE);
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  349  
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  350  	out += sprintf(out, "EREF: 0x%08x @ 0x%08x (0x%08x * %d)\n",
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  351  		       SOLO_EREF_EXT_ADDR(solo_dev),
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  352  		       SOLO_EREF_EXT_AREA(solo_dev),
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  353  		       SOLO_EREF_EXT_SIZE,
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  354  		       SOLO_EREF_EXT_AREA(solo_dev) / SOLO_EREF_EXT_SIZE);
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  355  
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  356  	out += sprintf(out, "MPEG: 0x%08x @ 0x%08x\n",
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  357  		       SOLO_MP4E_EXT_ADDR(solo_dev),
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  358  		       SOLO_MP4E_EXT_SIZE(solo_dev));
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  359  
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  360  	out += sprintf(out, "JPEG: 0x%08x @ 0x%08x\n",
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  361  		       SOLO_JPEG_EXT_ADDR(solo_dev),
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25 @362  		       SOLO_JPEG_EXT_SIZE(solo_dev));
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  363  
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  364  	return out - buf;
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  365  }
dcae5dacbce518 drivers/staging/media/solo6x10/core.c Hans Verkuil 2013-03-25  366  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
