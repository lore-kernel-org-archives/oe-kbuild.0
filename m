Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150D520F8F
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Jul 2023 19:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689967156; x=1721503156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nt5IzyjtEsvFRsqUfUazZtoCzYG1/Q65IFUV8S5rFSA=;
  b=HBSek9kVEwt86pjhKcPvrnEw6q4HP/3y0qDxrR2VqjlrixWTFVUD3DmH
   jE62VURQ5ms3EDua4s9hlGlVWfFKKNPDf+rE1bBz0NaQrsLn5ioK9ZGML
   Mj/j2MFfnaTwOCrns14W1JtLg6/kRa8erEFHGfQ1fve+qR6rkiRm5tnJE
   t1CtwaEkG1EYru7wI1CBUD1VN/box+4mIK3NeUEVIY4upqhNBH8fufzTQ
   DkjYxWQAWcKxrPIjgq8LJ4kIO7/hB6mmtfov5MKclJQWzkQ3unnHyIkh9
   sVhGYN8p4pBr46Vh239olCDJC8g9VIPGRPFWFtSLo/6New5IthttVL3hp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="347392754"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="347392754"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 12:19:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="760062305"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; 
   d="scan'208";a="760062305"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 21 Jul 2023 12:19:13 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMvei-0007ZN-1w;
	Fri, 21 Jul 2023 19:19:12 +0000
Date: Sat, 22 Jul 2023 03:18:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/s390/block/dasd_devmap.c:2067
 dasd_devmap_clear_copy_relation() error: 'devmap' dereferencing possible
 ERR_PTR()
Message-ID: <202307220335.Spd6Y6Xm-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Stefan Haberland <sth@linux.ibm.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Jan Hoeppner <hoeppner@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f7e3a1bafdea735050dfde00523cf505dc7fd309
commit: a91ff09d39f9b6545254839ac91f1ff7bd21d39e s390/dasd: add copy pair setup
date:   10 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 10 months ago
config: s390-randconfig-m031-20230720 (https://download.01.org/0day-ci/archive/20230722/202307220335.Spd6Y6Xm-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307220335.Spd6Y6Xm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307220335.Spd6Y6Xm-lkp@intel.com/

New smatch warnings:
drivers/s390/block/dasd_devmap.c:2067 dasd_devmap_clear_copy_relation() error: 'devmap' dereferencing possible ERR_PTR()

Old smatch warnings:
drivers/s390/block/dasd_devmap.c:1959 dasd_copy_pair_show() error: buffer overflow 'copy->entry' 5 <= 5 (assuming for loop doesn't break)
arch/s390/include/asm/cio.h:356 pathmask_to_pos() warn: signedness bug returning '(-119)'

vim +/devmap +2067 drivers/s390/block/dasd_devmap.c

a91ff09d39f9b6 Stefan Haberland 2022-09-20  2030  
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2031  static int dasd_devmap_clear_copy_relation(struct device *dev)
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2032  {
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2033  	struct dasd_copy_relation *copy;
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2034  	struct dasd_devmap *devmap;
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2035  	int i, rc = 1;
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2036  
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2037  	devmap = dasd_devmap_from_cdev(to_ccwdev(dev));
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2038  	if (IS_ERR(devmap))
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2039  		return 1;
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2040  
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2041  	spin_lock(&dasd_devmap_lock);
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2042  	if (!devmap->copy)
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2043  		goto out;
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2044  
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2045  	copy = devmap->copy;
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2046  	/* first check if all secondary devices are offline*/
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2047  	for (i = 0; i < DASD_CP_ENTRIES; i++) {
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2048  		if (!copy->entry[i].configured)
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2049  			continue;
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2050  
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2051  		if (copy->entry[i].device == copy->active->device)
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2052  			continue;
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2053  
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2054  		if (copy->entry[i].device)
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2055  			goto out;
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2056  	}
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2057  	/* clear all devmap entries */
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2058  	for (i = 0; i < DASD_CP_ENTRIES; i++) {
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2059  		if (strlen(copy->entry[i].busid) == 0)
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2060  			continue;
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2061  		if (copy->entry[i].device) {
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2062  			dasd_put_device(copy->entry[i].device);
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2063  			copy->entry[i].device->copy = NULL;
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2064  			copy->entry[i].device = NULL;
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2065  		}
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2066  		devmap = dasd_find_busid_locked(copy->entry[i].busid);
a91ff09d39f9b6 Stefan Haberland 2022-09-20 @2067  		devmap->copy = NULL;
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2068  		memset(copy->entry[i].busid, 0, DASD_BUS_ID_SIZE);
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2069  	}
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2070  	kfree(copy);
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2071  	rc = 0;
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2072  out:
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2073  	spin_unlock(&dasd_devmap_lock);
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2074  	return rc;
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2075  }
a91ff09d39f9b6 Stefan Haberland 2022-09-20  2076  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
