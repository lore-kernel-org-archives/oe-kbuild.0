Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7661715B4
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Sep 2023 04:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694232950; x=1725768950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QHfmxB5H25b1HX3Zz1CFgDcP/wlhjWm0GCXUgYaar0Q=;
  b=MeGzVvmmZJAVINv/lnKr9rAXAvR2g4mVdvrAglkOQDBIybBX4et5cVZY
   V8D9Aj30aLsxE2fWoCG1ujYaaLCBS1IZWoT33Ox8sMcolQwdAlKHV9GXS
   C5c6hbNNmDgluMWfr2RvD2wpPlOEPQTzF2hiAUN9KT5G9fXjQ+QtXx8qW
   h3G8qVf52LgZhVSfGdtURR7/rQmwKx+5UynPqoquBolqKx5G1d16OlPHk
   68rpixtoQwjeVf9OD1uTBC0tyYnPIeiHgx5GGRKS1HNT+h9PyNwOhB5GR
   Y0L9Hk4/H0ow3SEgnpXXlBGT2pPtj6GgSspjxymqsvGxuL14fWeXFLQGu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="408772703"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="408772703"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 21:15:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="1073537462"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="1073537462"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 08 Sep 2023 21:15:43 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qepNl-0002uh-1o;
	Sat, 09 Sep 2023 04:15:41 +0000
Date: Sat, 9 Sep 2023 12:15:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] Revert "comedi: add HAS_IOPORT dependencies"
Message-ID: <202309091129.yMBfRcKk-lkp@intel.com>
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
In-Reply-To: <20230905090922.3314-1-abbotti@mev.co.uk>
References: <20230905090922.3314-1-abbotti@mev.co.uk>
TO: Ian Abbott <abbotti@mev.co.uk>
TO: linux-kernel@vger.kernel.org
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Ian Abbott <abbotti@mev.co.uk>
CC: H Hartley Sweeten <hsweeten@visionengravers.com>
CC: Niklas Schnelle <schnelle@linux.ibm.com>
CC: Arnd Bergmann <arnd@kernel.org>
CC: stable@vger.kernel.org

Hi Ian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.5 next-20230908]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Abbott/Revert-comedi-add-HAS_IOPORT-dependencies/20230906-013027
base:   linus/master
patch link:    https://lore.kernel.org/r/20230905090922.3314-1-abbotti%40mev.co.uk
patch subject: [PATCH] Revert "comedi: add HAS_IOPORT dependencies"
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20230909 (https://download.01.org/0day-ci/archive/20230909/202309091129.yMBfRcKk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230909/202309091129.yMBfRcKk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309091129.yMBfRcKk-lkp@intel.com/

smatch warnings:
drivers/comedi/drivers/pcl816.c:169 pcl816_ai_setup_chanlist() error: uninitialized symbol 'last_chan'.

vim +/last_chan +169 drivers/comedi/drivers/pcl816.c

19720c07f1f82c drivers/staging/comedi/drivers/pcl816.c H Hartley Sweeten 2014-03-04  149  
19720c07f1f82c drivers/staging/comedi/drivers/pcl816.c H Hartley Sweeten 2014-03-04  150  static void pcl816_ai_setup_chanlist(struct comedi_device *dev,
19720c07f1f82c drivers/staging/comedi/drivers/pcl816.c H Hartley Sweeten 2014-03-04  151  				     unsigned int *chanlist,
19720c07f1f82c drivers/staging/comedi/drivers/pcl816.c H Hartley Sweeten 2014-03-04  152  				     unsigned int seglen)
19720c07f1f82c drivers/staging/comedi/drivers/pcl816.c H Hartley Sweeten 2014-03-04  153  {
19720c07f1f82c drivers/staging/comedi/drivers/pcl816.c H Hartley Sweeten 2014-03-04  154  	unsigned int first_chan = CR_CHAN(chanlist[0]);
19720c07f1f82c drivers/staging/comedi/drivers/pcl816.c H Hartley Sweeten 2014-03-04  155  	unsigned int last_chan;
19720c07f1f82c drivers/staging/comedi/drivers/pcl816.c H Hartley Sweeten 2014-03-04  156  	unsigned int range;
19720c07f1f82c drivers/staging/comedi/drivers/pcl816.c H Hartley Sweeten 2014-03-04  157  	unsigned int i;
19720c07f1f82c drivers/staging/comedi/drivers/pcl816.c H Hartley Sweeten 2014-03-04  158  
19720c07f1f82c drivers/staging/comedi/drivers/pcl816.c H Hartley Sweeten 2014-03-04  159  	/* store range list to card */
19720c07f1f82c drivers/staging/comedi/drivers/pcl816.c H Hartley Sweeten 2014-03-04  160  	for (i = 0; i < seglen; i++) {
19720c07f1f82c drivers/staging/comedi/drivers/pcl816.c H Hartley Sweeten 2014-03-04  161  		last_chan = CR_CHAN(chanlist[i]);
19720c07f1f82c drivers/staging/comedi/drivers/pcl816.c H Hartley Sweeten 2014-03-04  162  		range = CR_RANGE(chanlist[i]);
19720c07f1f82c drivers/staging/comedi/drivers/pcl816.c H Hartley Sweeten 2014-03-04  163  
19720c07f1f82c drivers/staging/comedi/drivers/pcl816.c H Hartley Sweeten 2014-03-04  164  		pcl816_ai_set_chan_range(dev, last_chan, range);
19720c07f1f82c drivers/staging/comedi/drivers/pcl816.c H Hartley Sweeten 2014-03-04  165  	}
19720c07f1f82c drivers/staging/comedi/drivers/pcl816.c H Hartley Sweeten 2014-03-04  166  
19720c07f1f82c drivers/staging/comedi/drivers/pcl816.c H Hartley Sweeten 2014-03-04  167  	udelay(1);
19720c07f1f82c drivers/staging/comedi/drivers/pcl816.c H Hartley Sweeten 2014-03-04  168  
19720c07f1f82c drivers/staging/comedi/drivers/pcl816.c H Hartley Sweeten 2014-03-04 @169  	pcl816_ai_set_chan_scan(dev, first_chan, last_chan);
19720c07f1f82c drivers/staging/comedi/drivers/pcl816.c H Hartley Sweeten 2014-03-04  170  }
19720c07f1f82c drivers/staging/comedi/drivers/pcl816.c H Hartley Sweeten 2014-03-04  171  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
