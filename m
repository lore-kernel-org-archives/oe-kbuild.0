Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45A02C9C
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jan 2023 16:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674146587; x=1705682587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mnXffyzGxyTdYFhnISwe0RePlCX9Ivi1Cq7sYmy4JpA=;
  b=A/GIIPJey14SCD38Eq4ZSxpDTt7AA9W8c58/wf3mAJobYAlddxNpDMYW
   XojkI3iKncQSkQmLePhbeZg71du8funTGpT4Y/oU9qd2GuihKhR/B9Yxw
   iKjb2mTafBGYtf+8oqfzitskfm2RdGgreMxiq+Y78UMSKjqkz01HRZKuq
   x4evvBIFS42gYSWxkVT4r2Se/XDDaVWxNsQo4z1WNAIVIjLB1UtwhiHpc
   +J9f2a1Dh8QcD7X08KHt1YZ2smOHp1Z3lTEWl6C7xfuVmz/dLRaahtl3Q
   GOkg6sbJMQpG9x2a/S/crvjerUo8Q2l0Rat+Ucht9LU/REyXRXChf69u9
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="324027293"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="324027293"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 08:43:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="690682677"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="690682677"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 Jan 2023 08:43:05 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIY0B-0001e4-37;
	Thu, 19 Jan 2023 16:42:59 +0000
Date: Fri, 20 Jan 2023 00:42:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iio/industrialio-core.c:1446 current_timestamp_clock_show()
 error: uninitialized symbol 'name'.
Message-ID: <202301200025.PS63pnzj-lkp@intel.com>
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
TO: "Joe Simmons-Talbott" <joetalbott@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7287904c8771b77b9504f53623bb477065c19a58
commit: 9cf0b618599487f456ef5596dd30b5c162291e3c iio: Use octal permissions and DEVICE_ATTR_{RO,RW}.
date:   7 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 7 months ago
config: ia64-randconfig-m041-20230118 (https://download.01.org/0day-ci/archive/20230120/202301200025.PS63pnzj-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/iio/industrialio-core.c:1446 current_timestamp_clock_show() error: uninitialized symbol 'name'.
drivers/iio/industrialio-core.c:1446 current_timestamp_clock_show() error: uninitialized symbol 'sz'.

vim +/name +1446 drivers/iio/industrialio-core.c

2c3d0c9ffd24d9 Phil Reid           2019-09-19  1403  
9cf0b618599487 Joe Simmons-Talbott 2022-06-01  1404  static ssize_t current_timestamp_clock_show(struct device *dev,
bc2b7dab629a51 Gregor Boirie       2016-03-09  1405  					    struct device_attribute *attr,
bc2b7dab629a51 Gregor Boirie       2016-03-09  1406  					    char *buf)
bc2b7dab629a51 Gregor Boirie       2016-03-09  1407  {
bc2b7dab629a51 Gregor Boirie       2016-03-09  1408  	const struct iio_dev *indio_dev = dev_to_iio_dev(dev);
bc2b7dab629a51 Gregor Boirie       2016-03-09  1409  	const clockid_t clk = iio_device_get_clock(indio_dev);
bc2b7dab629a51 Gregor Boirie       2016-03-09  1410  	const char *name;
bc2b7dab629a51 Gregor Boirie       2016-03-09  1411  	ssize_t sz;
bc2b7dab629a51 Gregor Boirie       2016-03-09  1412  
bc2b7dab629a51 Gregor Boirie       2016-03-09  1413  	switch (clk) {
bc2b7dab629a51 Gregor Boirie       2016-03-09  1414  	case CLOCK_REALTIME:
bc2b7dab629a51 Gregor Boirie       2016-03-09  1415  		name = "realtime\n";
bc2b7dab629a51 Gregor Boirie       2016-03-09  1416  		sz = sizeof("realtime\n");
bc2b7dab629a51 Gregor Boirie       2016-03-09  1417  		break;
bc2b7dab629a51 Gregor Boirie       2016-03-09  1418  	case CLOCK_MONOTONIC:
bc2b7dab629a51 Gregor Boirie       2016-03-09  1419  		name = "monotonic\n";
bc2b7dab629a51 Gregor Boirie       2016-03-09  1420  		sz = sizeof("monotonic\n");
bc2b7dab629a51 Gregor Boirie       2016-03-09  1421  		break;
bc2b7dab629a51 Gregor Boirie       2016-03-09  1422  	case CLOCK_MONOTONIC_RAW:
bc2b7dab629a51 Gregor Boirie       2016-03-09  1423  		name = "monotonic_raw\n";
bc2b7dab629a51 Gregor Boirie       2016-03-09  1424  		sz = sizeof("monotonic_raw\n");
bc2b7dab629a51 Gregor Boirie       2016-03-09  1425  		break;
bc2b7dab629a51 Gregor Boirie       2016-03-09  1426  	case CLOCK_REALTIME_COARSE:
bc2b7dab629a51 Gregor Boirie       2016-03-09  1427  		name = "realtime_coarse\n";
bc2b7dab629a51 Gregor Boirie       2016-03-09  1428  		sz = sizeof("realtime_coarse\n");
bc2b7dab629a51 Gregor Boirie       2016-03-09  1429  		break;
bc2b7dab629a51 Gregor Boirie       2016-03-09  1430  	case CLOCK_MONOTONIC_COARSE:
bc2b7dab629a51 Gregor Boirie       2016-03-09  1431  		name = "monotonic_coarse\n";
bc2b7dab629a51 Gregor Boirie       2016-03-09  1432  		sz = sizeof("monotonic_coarse\n");
bc2b7dab629a51 Gregor Boirie       2016-03-09  1433  		break;
bc2b7dab629a51 Gregor Boirie       2016-03-09  1434  	case CLOCK_BOOTTIME:
bc2b7dab629a51 Gregor Boirie       2016-03-09  1435  		name = "boottime\n";
bc2b7dab629a51 Gregor Boirie       2016-03-09  1436  		sz = sizeof("boottime\n");
bc2b7dab629a51 Gregor Boirie       2016-03-09  1437  		break;
bc2b7dab629a51 Gregor Boirie       2016-03-09  1438  	case CLOCK_TAI:
bc2b7dab629a51 Gregor Boirie       2016-03-09  1439  		name = "tai\n";
bc2b7dab629a51 Gregor Boirie       2016-03-09  1440  		sz = sizeof("tai\n");
bc2b7dab629a51 Gregor Boirie       2016-03-09  1441  		break;
bc2b7dab629a51 Gregor Boirie       2016-03-09  1442  	default:
bc2b7dab629a51 Gregor Boirie       2016-03-09  1443  		BUG();
bc2b7dab629a51 Gregor Boirie       2016-03-09  1444  	}
bc2b7dab629a51 Gregor Boirie       2016-03-09  1445  
bc2b7dab629a51 Gregor Boirie       2016-03-09 @1446  	memcpy(buf, name, sz);
bc2b7dab629a51 Gregor Boirie       2016-03-09  1447  	return sz;
bc2b7dab629a51 Gregor Boirie       2016-03-09  1448  }
bc2b7dab629a51 Gregor Boirie       2016-03-09  1449  

:::::: The code at line 1446 was first introduced by commit
:::::: bc2b7dab629a51e8beb5fda4222c62a23b729f26 iio:core: timestamping clock selection support

:::::: TO: Gregor Boirie <gregor.boirie@parrot.com>
:::::: CC: Jonathan Cameron <jic23@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
