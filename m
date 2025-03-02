Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225D01E51EE
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Mar 2025 07:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740899913; cv=none; b=QDjaXb2CCpBRu0Vsb+1yfcEk3cafzbSlAxzTMShLrmHJVv1LL0Ro/u7eGT/R6rMRDr6ymWGY23e0Z5MB9wWcHZ3zzsjYj4F2iO7Hf8NNUFWykd1RUSmwm9gVQxIo+4cCyGRoKc4ESlTSEz6tZ9rTTdc1LLJHk0eRJGsHKt38O88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740899913; c=relaxed/simple;
	bh=apBCrp+6rUrNsZfFXX7MaBLmGwCrKizfWqDRMzP51o4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RIgHFlbBKi2ieAPyp0ntDbL8DTUCIyxxiPHYmOp4Dao5c6lD98kbx8drM3sZNVy2yhtIfSHjyUm1dxb9szh5UrMbgAYAQDQdy4bPIde588TAA1UbxYHRQy010YX7wvOhMVJdvzo5+N0zBrxDFMd9/cXkf2Vl125AnGXAdTjxgss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZnxXDF7L; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZnxXDF7L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740899911; x=1772435911;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=apBCrp+6rUrNsZfFXX7MaBLmGwCrKizfWqDRMzP51o4=;
  b=ZnxXDF7L25sofQeNFhvMt2iiNF0AiCUErdz1JXhSmX79U6lAIIp/hGbC
   DsFHSHaypOi7sLcWoIgz3VnHq2zW2Z2eKIVe69d8SX8clNVgJwUs0MN4S
   N0TWctJA9c1gZ3DexQK+tjZ8BuWhk4uOKoIUZ2n7Yj5piUb2ymURxJSUq
   tbfVEdregfZhs90dyvc4lDD/UsYoO/cP3UTUGI8qAl0WH9VOzvBwCR+Pn
   4QhauB7CKP2lI6br2LHiJTgY+m+uOmudYFU8QYkePPinxLOD73bU7uFul
   lnXrSzBTVqF/lHqFCmgBm/yBr0fTrx1SMuuM2XeTu1EOnyjGjJzBJ/XL5
   g==;
X-CSE-ConnectionGUID: FGubo/ZuT/GGDCtbC4LLRQ==
X-CSE-MsgGUID: UCLoDeLBSlyMhy/0En/g9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="40963344"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="40963344"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 23:18:30 -0800
X-CSE-ConnectionGUID: eYgXpmijS8qbP1pcvxIrlg==
X-CSE-MsgGUID: dM41ulmHQu+5I+45ZdkZ+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122957655"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 01 Mar 2025 23:18:29 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1todak-000H9s-1k;
	Sun, 02 Mar 2025 07:18:26 +0000
Date: Sun, 2 Mar 2025 15:17:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [jic23-iio:testing 131/172] drivers/iio/imu/adis16550.c:1029:22-52:
 duplicated argument to & or |
Message-ID: <202503021535.37zbQXIZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Robert Budai <robert.budai@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
CC: Ramona Gradinariu <ramona.gradinariu@analog.com>
CC: Antoniu Miclaus <antoniu.miclaus@analog.com>
CC: "Nuno Sá" <nuno.sa@analog.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   bd9ffb54e566ad6f94ec4293f82f06d417b6cfc8
commit: 55be950cfc6031263d6dd3d6518a5a934ae414cd [131/172] iio: imu: adis16550: add adis16550 support
:::::: branch date: 28 hours ago
:::::: commit date: 8 days ago
config: m68k-randconfig-r064-20250302 (https://download.01.org/0day-ci/archive/20250302/202503021535.37zbQXIZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202503021535.37zbQXIZ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iio/imu/adis16550.c:1029:22-52: duplicated argument to & or |

vim +1029 drivers/iio/imu/adis16550.c

55be950cfc6031 Robert Budai 2025-02-17  1018  
55be950cfc6031 Robert Budai 2025-02-17  1019  static const struct adis_data adis16550_data = {
55be950cfc6031 Robert Budai 2025-02-17  1020  	.diag_stat_reg = ADIS16550_REG_STATUS,
55be950cfc6031 Robert Budai 2025-02-17  1021  	.diag_stat_size = 4,
55be950cfc6031 Robert Budai 2025-02-17  1022  	.prod_id_reg = ADIS16550_REG_PROD_ID,
55be950cfc6031 Robert Budai 2025-02-17  1023  	.prod_id = 16550,
55be950cfc6031 Robert Budai 2025-02-17  1024  	.self_test_mask = BIT(1),
55be950cfc6031 Robert Budai 2025-02-17  1025  	.self_test_reg = ADIS16550_REG_COMMAND,
55be950cfc6031 Robert Budai 2025-02-17  1026  	.cs_change_delay = 5,
55be950cfc6031 Robert Budai 2025-02-17  1027  	.unmasked_drdy = true,
55be950cfc6031 Robert Budai 2025-02-17  1028  	.status_error_msgs = adis16550_status_error_msgs,
55be950cfc6031 Robert Budai 2025-02-17 @1029  	.status_error_mask = BIT(ADIS16550_STATUS_CRC_CODE) |
55be950cfc6031 Robert Budai 2025-02-17  1030  			BIT(ADIS16550_STATUS_CRC_CONFIG) |
55be950cfc6031 Robert Budai 2025-02-17  1031  			BIT(ADIS16550_STATUS_FLASH_UPDATE) |
55be950cfc6031 Robert Budai 2025-02-17  1032  			BIT(ADIS16550_STATUS_INERIAL) |
55be950cfc6031 Robert Budai 2025-02-17  1033  			BIT(ADIS16550_STATUS_SENSOR) |
55be950cfc6031 Robert Budai 2025-02-17  1034  			BIT(ADIS16550_STATUS_TEMPERATURE) |
55be950cfc6031 Robert Budai 2025-02-17  1035  			BIT(ADIS16550_STATUS_SPI) |
55be950cfc6031 Robert Budai 2025-02-17  1036  			BIT(ADIS16550_STATUS_PROCESSING) |
55be950cfc6031 Robert Budai 2025-02-17  1037  			BIT(ADIS16550_STATUS_POWER) |
55be950cfc6031 Robert Budai 2025-02-17  1038  			BIT(ADIS16550_STATUS_BOOT) |
55be950cfc6031 Robert Budai 2025-02-17  1039  			BIT(ADIS16550_STATUS_WATCHDOG) |
55be950cfc6031 Robert Budai 2025-02-17  1040  			BIT(ADIS16550_STATUS_REGULATOR) |
55be950cfc6031 Robert Budai 2025-02-17  1041  			BIT(ADIS16550_STATUS_SENSOR_SUPPLY) |
55be950cfc6031 Robert Budai 2025-02-17  1042  			BIT(ADIS16550_STATUS_CPU_SUPPLY) |
55be950cfc6031 Robert Budai 2025-02-17  1043  			BIT(ADIS16550_STATUS_5V_SUPPLY) |
55be950cfc6031 Robert Budai 2025-02-17  1044  			BIT(ADIS16550_STATUS_CRC_CODE),
55be950cfc6031 Robert Budai 2025-02-17  1045  	.timeouts = &adis16550_timeouts,
55be950cfc6031 Robert Budai 2025-02-17  1046  };
55be950cfc6031 Robert Budai 2025-02-17  1047  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
