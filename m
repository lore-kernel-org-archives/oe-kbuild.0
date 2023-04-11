Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD25D5247
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Apr 2023 08:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681203009; x=1712739009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/w+Aim1zC/cyFjplBwrqWPQGXDWyQ5DQDv0/qWG2Hqk=;
  b=UwvSiKC9XiqzGBvkL29ycMHyqtE+sfK4szait9e1pyr34TrYmwb9LV6K
   KSDj2R/7/SdD5v59Mj5r+UaV2eDFpWCbSo3bmjdOPel9QWe6oDH4wmrwR
   IUVALrsEACY4OTIMMqyRRQjdPMXJoksMXVdEe/GZ/ip0EGO4o7ng+LhhG
   ReDB1k1Eunca7lr5HJKYlaMAjqZ6zr1FXYgpukEfCZkYlrggbW5FaCiZG
   fLQitpPuD/Smsyg/NQPlcMMm1tjRE/C9gDNltxBIS3uwfXeO+V8v21FQ+
   NDmLF+a7oeZ8mP9xbrVYfQfNTMLKGf8xoIxUT0F/m4OkdgZJHyPgBPeXW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="327660318"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="327660318"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 01:50:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="665902946"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="665902946"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 Apr 2023 01:50:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pm9hS-000W9a-1b;
	Tue, 11 Apr 2023 08:50:02 +0000
Date: Tue, 11 Apr 2023 16:49:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jic23-iio:testing 65/65]
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2639
 lsm6dsx_get_acpi_mount_matrix() warn: signedness bug returning '(-22)'
Message-ID: <202304111602.SD5o4kh1-lkp@intel.com>
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
TO: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   4c3b188facb2011e9edcdaaf71f2f553e9c230df
commit: 4c3b188facb2011e9edcdaaf71f2f553e9c230df [65/65] iio: imu: lsm6dsx: Add ACPI mount matrix retrieval
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230411/202304111602.SD5o4kh1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304111602.SD5o4kh1-lkp@intel.com/

New smatch warnings:
drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2639 lsm6dsx_get_acpi_mount_matrix() warn: signedness bug returning '(-22)'

Old smatch warnings:
drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2642 lsm6dsx_get_acpi_mount_matrix() warn: signedness bug returning '(-22)'
drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2647 lsm6dsx_get_acpi_mount_matrix() warn: signedness bug returning '(-22)'
drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:2680 lsm6dsx_get_acpi_mount_matrix() warn: signedness bug returning '(-22)'

vim +2639 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c

f346b16f94af2a Lorenzo Bianconi 2020-11-17  2627  
4c3b188facb201 Jonathan Cameron 2023-01-30  2628  static bool lsm6dsx_get_acpi_mount_matrix(struct device *dev,
4c3b188facb201 Jonathan Cameron 2023-01-30  2629  					  struct iio_mount_matrix *orientation)
4c3b188facb201 Jonathan Cameron 2023-01-30  2630  {
4c3b188facb201 Jonathan Cameron 2023-01-30  2631  	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
4c3b188facb201 Jonathan Cameron 2023-01-30  2632  	struct acpi_device *adev = ACPI_COMPANION(dev);
4c3b188facb201 Jonathan Cameron 2023-01-30  2633  	union acpi_object *obj, *elements;
4c3b188facb201 Jonathan Cameron 2023-01-30  2634  	acpi_status status;
4c3b188facb201 Jonathan Cameron 2023-01-30  2635  	int i, j, val[3];
4c3b188facb201 Jonathan Cameron 2023-01-30  2636  	char *str;
4c3b188facb201 Jonathan Cameron 2023-01-30  2637  
4c3b188facb201 Jonathan Cameron 2023-01-30  2638  	if (!has_acpi_companion(dev))
4c3b188facb201 Jonathan Cameron 2023-01-30 @2639  		return -EINVAL;
4c3b188facb201 Jonathan Cameron 2023-01-30  2640  
4c3b188facb201 Jonathan Cameron 2023-01-30  2641  	if (!acpi_has_method(adev->handle, "ROTM"))
4c3b188facb201 Jonathan Cameron 2023-01-30  2642  		return -EINVAL;
4c3b188facb201 Jonathan Cameron 2023-01-30  2643  
4c3b188facb201 Jonathan Cameron 2023-01-30  2644  	status = acpi_evaluate_object(adev->handle, "ROTM", NULL, &buffer);
4c3b188facb201 Jonathan Cameron 2023-01-30  2645  	if (ACPI_FAILURE(status)) {
4c3b188facb201 Jonathan Cameron 2023-01-30  2646  		dev_warn(dev, "Failed to get ACPI mount matrix: %d\n", status);
4c3b188facb201 Jonathan Cameron 2023-01-30  2647  		return -EINVAL;
4c3b188facb201 Jonathan Cameron 2023-01-30  2648  	}
4c3b188facb201 Jonathan Cameron 2023-01-30  2649  
4c3b188facb201 Jonathan Cameron 2023-01-30  2650  	obj = buffer.pointer;
4c3b188facb201 Jonathan Cameron 2023-01-30  2651  	if (obj->type != ACPI_TYPE_PACKAGE || obj->package.count != 3)
4c3b188facb201 Jonathan Cameron 2023-01-30  2652  		goto unknown_format;
4c3b188facb201 Jonathan Cameron 2023-01-30  2653  
4c3b188facb201 Jonathan Cameron 2023-01-30  2654  	elements = obj->package.elements;
4c3b188facb201 Jonathan Cameron 2023-01-30  2655  	for (i = 0; i < 3; i++) {
4c3b188facb201 Jonathan Cameron 2023-01-30  2656  		if (elements[i].type != ACPI_TYPE_STRING)
4c3b188facb201 Jonathan Cameron 2023-01-30  2657  			goto unknown_format;
4c3b188facb201 Jonathan Cameron 2023-01-30  2658  
4c3b188facb201 Jonathan Cameron 2023-01-30  2659  		str = elements[i].string.pointer;
4c3b188facb201 Jonathan Cameron 2023-01-30  2660  		if (sscanf(str, "%d %d %d", &val[0], &val[1], &val[2]) != 3)
4c3b188facb201 Jonathan Cameron 2023-01-30  2661  			goto unknown_format;
4c3b188facb201 Jonathan Cameron 2023-01-30  2662  
4c3b188facb201 Jonathan Cameron 2023-01-30  2663  		for (j = 0; j < 3; j++) {
4c3b188facb201 Jonathan Cameron 2023-01-30  2664  			switch (val[j]) {
4c3b188facb201 Jonathan Cameron 2023-01-30  2665  			case -1: str = "-1"; break;
4c3b188facb201 Jonathan Cameron 2023-01-30  2666  			case 0:  str = "0";  break;
4c3b188facb201 Jonathan Cameron 2023-01-30  2667  			case 1:  str = "1";  break;
4c3b188facb201 Jonathan Cameron 2023-01-30  2668  			default: goto unknown_format;
4c3b188facb201 Jonathan Cameron 2023-01-30  2669  			}
4c3b188facb201 Jonathan Cameron 2023-01-30  2670  			orientation->rotation[i * 3 + j] = str;
4c3b188facb201 Jonathan Cameron 2023-01-30  2671  		}
4c3b188facb201 Jonathan Cameron 2023-01-30  2672  	}
4c3b188facb201 Jonathan Cameron 2023-01-30  2673  
4c3b188facb201 Jonathan Cameron 2023-01-30  2674  	kfree(buffer.pointer);
4c3b188facb201 Jonathan Cameron 2023-01-30  2675  	return 0;
4c3b188facb201 Jonathan Cameron 2023-01-30  2676  
4c3b188facb201 Jonathan Cameron 2023-01-30  2677  unknown_format:
4c3b188facb201 Jonathan Cameron 2023-01-30  2678  	dev_warn(dev, "Unknown ACPI mount matrix format, ignoring\n");
4c3b188facb201 Jonathan Cameron 2023-01-30  2679  	kfree(buffer.pointer);
4c3b188facb201 Jonathan Cameron 2023-01-30  2680  	return -EINVAL;
4c3b188facb201 Jonathan Cameron 2023-01-30  2681  }
4c3b188facb201 Jonathan Cameron 2023-01-30  2682  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
