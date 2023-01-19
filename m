Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2DF33FB
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jan 2023 09:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674119002; x=1705655002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WSJWV4um1lsG9iypjW6rRqFEbDaDIPs9PS2g1UC0+EU=;
  b=dnLQA/Zoq5M/3XGE8yuZhSq6PN9iMxzfjMZiTmn6T/2V+K+xs2N+a7z+
   WcQaahvj07BRAzhx9J8NPFKXOWuptiakRKZI5tWCe/Yce98tE3WwOnSm6
   jKk//3MJlNLG6oLiwXr3tBoadkU6Wb20Lbu++JgANc9wzqBBRCYwmCy+1
   V7GfckVShqlJa0jBjqt3sOMb4E3LbMAbws5bb62aCaYcQt7d1uVreBgch
   XZld8/OBRZEkx8DRTF+lNPVUeo4QMkGxHCq6FsrIZYZexlKyo/7xzKrC/
   kCFFIvp+d7E45QZR9XGdfbLrsI6uFhTIY9/smf+EyFAp/K9gP+NIeNkka
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="313109379"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="313109379"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 01:01:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="783982190"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="783982190"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Jan 2023 01:01:44 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIQnn-0001Kk-1m;
	Thu, 19 Jan 2023 09:01:43 +0000
Date: Thu, 19 Jan 2023 17:01:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iio/industrialio-core.c:1446 current_timestamp_clock_show()
 error: uninitialized symbol 'name'.
Message-ID: <202301191652.dGVQIj29-lkp@intel.com>
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
:::::: branch date: 10 hours ago
:::::: commit date: 7 months ago
config: ia64-randconfig-m041-20230118 (https://download.01.org/0day-ci/archive/20230119/202301191652.dGVQIj29-lkp@intel.com/config)
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
