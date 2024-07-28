Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E8E847B
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Jul 2024 15:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722180973; cv=none; b=b7h342kTaCqOKJPZWL1gYtQd5KtvCzh18DA3OjPqzWMfjGQrhXoVDWXNTkrIHZA74fDEjGN2oQX0KRzw0EnaaDTAQ0oXwLjU/xy9SySZYm7cumJNcULFa1GfQ+CBaP6XrSkYGnPM3PsgZiPWznlO0SXvCUzHvo30DZOrBUOpHUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722180973; c=relaxed/simple;
	bh=CBwUvcVZFFd3gVdo5T2iL+rEk+kzGaU6tLMU1YeaD1M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ALKSjAUokEBBvEjIKToS6C3Zccjz0zdOcxm3s2AZ0tSaWg1IDMfQAWW+/PxJz1vr9Wqb5nFq29K64TOebh98txR6MiCMvhdABhhlFhw4Mij31CPENxaw07OaJbbUdHodAIZ9Qi0r9xDcgGYLTHBdgIJ50SFXGXs1Dm1VSbp1IwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWu3x5Wp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWu3x5Wp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722180970; x=1753716970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CBwUvcVZFFd3gVdo5T2iL+rEk+kzGaU6tLMU1YeaD1M=;
  b=fWu3x5WpN4bqUQo2w8hZirGYEk/lwztjj9MmOmCgAVGKneQhqS9q8QYs
   6afrDRQZKQXRxbLmZztSSS7IFZydudBZDqD7GpEMB+FUU6s8PU8SUW13E
   bKJ3L57HmyRsuFMFMQVDr3ztUCHRY1PqaFkU9m1uHykntJ1S15UDmE7Xe
   ykjMqlCHqvZ6pgBfj+mK1ZW1ffVEkNwWZLOtT6SK/hLb3/axix3yxJagM
   kE+uIFPdvHvUJ1GxKlMroBGWmi/HzL7eErqiyTwdLdnDgFSqomj08XQim
   oLV8K08wMEIveVLy+VeHtHb4HVTeHx8bYOP5JNMGkh4I+5BqAX5XK9gZo
   Q==;
X-CSE-ConnectionGUID: fzpTRpQxRZW+1g6GB/NxHw==
X-CSE-MsgGUID: 4rr5dZDCSgOpOTezCO8U+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="19720551"
X-IronPort-AV: E=Sophos;i="6.09,244,1716274800"; 
   d="scan'208";a="19720551"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2024 08:36:10 -0700
X-CSE-ConnectionGUID: 7kJwJ9yNSnChPIaOujGBVg==
X-CSE-MsgGUID: H6KbGO/oQPGa/+xx6itutQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,244,1716274800"; 
   d="scan'208";a="58556436"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Jul 2024 08:36:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sY5wM-000qv2-0j;
	Sun, 28 Jul 2024 15:36:06 +0000
Date: Sun, 28 Jul 2024 23:35:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH V5 2/2] iio: proximity: aw9610x: Add support for aw9610x
 proximity sensor
Message-ID: <202407282339.D0ICTGHF-lkp@intel.com>
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
In-Reply-To: <20240726061312.1371450-3-wangshuaijie@awinic.com>
References: <20240726061312.1371450-3-wangshuaijie@awinic.com>
TO: wangshuaijie@awinic.com
TO: jic23@kernel.org
TO: lars@metafoo.de
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: waqar.hameed@axis.com
TO: linux-iio@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: wangshuaijie@awinic.com
CC: liweilei@awinic.com
CC: kangjiajun@awinic.com

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1722389b0d863056d78287a120a1d6cadb8d4f7b]

url:    https://github.com/intel-lab-lkp/linux/commits/wangshuaijie-awinic-com/dt-bindings-iio-aw9610x-Add-bindings-for-aw9610x-sensor/20240726-141450
base:   1722389b0d863056d78287a120a1d6cadb8d4f7b
patch link:    https://lore.kernel.org/r/20240726061312.1371450-3-wangshuaijie%40awinic.com
patch subject: [PATCH V5 2/2] iio: proximity: aw9610x: Add support for aw9610x proximity sensor
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-r071-20240728 (https://download.01.org/0day-ci/archive/20240728/202407282339.D0ICTGHF-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407282339.D0ICTGHF-lkp@intel.com/

smatch warnings:
drivers/iio/proximity/aw9610x.c:575 aw9610x_read_chipid() error: uninitialized symbol 'reg_val'.

vim +/reg_val +575 drivers/iio/proximity/aw9610x.c

1e0a5bf0d81329 shuaijie wang 2024-07-26  557  
1e0a5bf0d81329 shuaijie wang 2024-07-26  558  static int aw9610x_read_chipid(struct aw9610x *aw9610x)
1e0a5bf0d81329 shuaijie wang 2024-07-26  559  {
1e0a5bf0d81329 shuaijie wang 2024-07-26  560  	unsigned char cnt = 0;
1e0a5bf0d81329 shuaijie wang 2024-07-26  561  	u32 reg_val;
1e0a5bf0d81329 shuaijie wang 2024-07-26  562  	int ret;
1e0a5bf0d81329 shuaijie wang 2024-07-26  563  
1e0a5bf0d81329 shuaijie wang 2024-07-26  564  	while (cnt < AW_READ_CHIPID_RETRIES) {
1e0a5bf0d81329 shuaijie wang 2024-07-26  565  		ret = aw9610x_i2c_read(aw9610x, REG_CHIPID, &reg_val);
1e0a5bf0d81329 shuaijie wang 2024-07-26  566  		if (ret < 0) {
1e0a5bf0d81329 shuaijie wang 2024-07-26  567  			cnt++;
1e0a5bf0d81329 shuaijie wang 2024-07-26  568  			usleep_range(2000, 3000);
1e0a5bf0d81329 shuaijie wang 2024-07-26  569  		} else {
1e0a5bf0d81329 shuaijie wang 2024-07-26  570  			reg_val = FIELD_GET(AW9610X_CHIPID_MASK, reg_val);
1e0a5bf0d81329 shuaijie wang 2024-07-26  571  			break;
1e0a5bf0d81329 shuaijie wang 2024-07-26  572  		}
1e0a5bf0d81329 shuaijie wang 2024-07-26  573  	}
1e0a5bf0d81329 shuaijie wang 2024-07-26  574  
1e0a5bf0d81329 shuaijie wang 2024-07-26 @575  	if (reg_val == AW9610X_CHIP_ID)
1e0a5bf0d81329 shuaijie wang 2024-07-26  576  		return 0;
1e0a5bf0d81329 shuaijie wang 2024-07-26  577  
1e0a5bf0d81329 shuaijie wang 2024-07-26  578  	return -EINVAL;
1e0a5bf0d81329 shuaijie wang 2024-07-26  579  }
1e0a5bf0d81329 shuaijie wang 2024-07-26  580  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
