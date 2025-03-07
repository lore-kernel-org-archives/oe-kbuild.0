Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CF018FDDF
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Mar 2025 03:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741318826; cv=none; b=jnofTYlTJNawoFjQ1VPlGJnXvHBwgcb822KuLfva7caCIBdCzx0BUdlbOGkS9/4JJVJFRmPg7hDOA+IorBXRA0jgbh+PGcDCnCMbiUoqzjqiSlIhDgFF5EF8QA+HG1mt7bGy+G1cdpBRJAFr73jZ1vU9dFXTsJf+Jdh2ar05jD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741318826; c=relaxed/simple;
	bh=9dvLJCg9NozuiUuidgykl8fQOxwCV+sgufQ7C6/yqyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tqSffkv9YQThXELuZ+GXJpXQQuOYtGX8jmWTuy8uuz5VXo2pPAH8ElZuOfcBLddVGshs2alwnpaz0yfO0C+EXqJWWVO68CfhYVLwFhS6zSWCUsLflNTy1z6PqCDLs+Mk6jmHWcXk7yQoGInwlUfmFWjaA1tRBzZ9S/tsIr0aG5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WMDw9Fqz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WMDw9Fqz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741318825; x=1772854825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9dvLJCg9NozuiUuidgykl8fQOxwCV+sgufQ7C6/yqyg=;
  b=WMDw9Fqzf8lyU7aBs27sl4fECQXHpoQqMn401UCjlLVyjLCws5jDIKNi
   cpix97OGB35VrlIb1fmqzpSyTKajffkBjOFIhQCSVLKMZhADdRijpfa9l
   niN+BxnmF4mInzs+e31bFIiAuctlZM2PRYcBhPcoiMnps5OUUxTQgPsdD
   FL3MM4M/A5ER3Jwal1Xfk5CTcGddb9xZEv466Zx/bOjxW66RP2R7j43RB
   +QTOdo2wlIBFzDYooXwxQ/AJd2tGqE4aGno3MFpyTT0+8X2mq6EXaqQ11
   RI8JGqH813h9VPmgL0+VSvtdMy1IqHRyG33nRFNF08Pq3wuTuP7UAhi0k
   g==;
X-CSE-ConnectionGUID: 7cAvowPmSK64Hh/NvxNOLg==
X-CSE-MsgGUID: N9RZ8EeHRuiEFZlUAf0W/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53757042"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="53757042"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 19:40:24 -0800
X-CSE-ConnectionGUID: 26umpJePRPKpCC4UrMFpIA==
X-CSE-MsgGUID: yVpkr0lbS3S+cBlndlU6Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="124139564"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 06 Mar 2025 19:40:22 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqOZJ-000OEW-2m;
	Fri, 07 Mar 2025 03:40:15 +0000
Date: Fri, 7 Mar 2025 11:39:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 06/11] misc: amd-sbi: Add support for AMD_SBI IOCTL
Message-ID: <202503071145.fhmAEjMr-lkp@intel.com>
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
In-Reply-To: <20250303105902.215009-7-akshay.gupta@amd.com>
References: <20250303105902.215009-7-akshay.gupta@amd.com>
TO: Akshay Gupta <akshay.gupta@amd.com>
TO: linux-hwmon@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: linux@roeck-us.net
CC: gregkh@linuxfoundation.org
CC: arnd@arndb.de
CC: shyam-sundar.s-k@amd.com
CC: gautham.shenoy@amd.com
CC: mario.limonciello@amd.com
CC: naveenkrishna.chatradhi@amd.com
CC: Akshay Gupta <akshay.gupta@amd.com>

Hi Akshay,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus groeck-staging/hwmon-next soc/for-next linus/master v6.14-rc5 next-20250306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Akshay-Gupta/hwmon-misc-amd-sbi-Move-core-sbrmi-from-hwmon-to-misc/20250303-190830
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20250303105902.215009-7-akshay.gupta%40amd.com
patch subject: [PATCH v5 06/11] misc: amd-sbi: Add support for AMD_SBI IOCTL
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: riscv-randconfig-r072-20250306 (https://download.01.org/0day-ci/archive/20250307/202503071145.fhmAEjMr-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503071145.fhmAEjMr-lkp@intel.com/

smatch warnings:
drivers/misc/amd-sbi/rmi-core.c:110 sbrmi_ioctl() warn: can 'data' even be NULL?

vim +/data +110 drivers/misc/amd-sbi/rmi-core.c

dd49a6be4bc20c Akshay Gupta 2025-03-03  100  
dd49a6be4bc20c Akshay Gupta 2025-03-03  101  static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
dd49a6be4bc20c Akshay Gupta 2025-03-03  102  {
dd49a6be4bc20c Akshay Gupta 2025-03-03  103  	int __user *arguser = (int  __user *)arg;
dd49a6be4bc20c Akshay Gupta 2025-03-03  104  	struct apml_message msg = { 0 };
dd49a6be4bc20c Akshay Gupta 2025-03-03  105  	bool read = false;
dd49a6be4bc20c Akshay Gupta 2025-03-03  106  	int ret;
dd49a6be4bc20c Akshay Gupta 2025-03-03  107  
dd49a6be4bc20c Akshay Gupta 2025-03-03  108  	struct sbrmi_data *data = container_of(fp->private_data, struct sbrmi_data,
dd49a6be4bc20c Akshay Gupta 2025-03-03  109  					       sbrmi_misc_dev);
dd49a6be4bc20c Akshay Gupta 2025-03-03 @110  	if (!data)
dd49a6be4bc20c Akshay Gupta 2025-03-03  111  		return -ENODEV;
dd49a6be4bc20c Akshay Gupta 2025-03-03  112  
dd49a6be4bc20c Akshay Gupta 2025-03-03  113  	/* Copy the structure from user */
dd49a6be4bc20c Akshay Gupta 2025-03-03  114  	if (copy_struct_from_user(&msg, sizeof(msg), arguser,
dd49a6be4bc20c Akshay Gupta 2025-03-03  115  				  sizeof(struct apml_message)))
dd49a6be4bc20c Akshay Gupta 2025-03-03  116  		return -EFAULT;
dd49a6be4bc20c Akshay Gupta 2025-03-03  117  
dd49a6be4bc20c Akshay Gupta 2025-03-03  118  	/* Is this a read/monitor/get request */
dd49a6be4bc20c Akshay Gupta 2025-03-03  119  	if (msg.data_in.reg_in[AMD_SBI_RD_FLAG_INDEX])
dd49a6be4bc20c Akshay Gupta 2025-03-03  120  		read = true;
dd49a6be4bc20c Akshay Gupta 2025-03-03  121  
dd49a6be4bc20c Akshay Gupta 2025-03-03  122  	switch (msg.cmd) {
dd49a6be4bc20c Akshay Gupta 2025-03-03  123  	case 0 ... 0x999:
dd49a6be4bc20c Akshay Gupta 2025-03-03  124  		/* Mailbox protocol */
dd49a6be4bc20c Akshay Gupta 2025-03-03  125  		ret = rmi_mailbox_xfer(data, &msg);
dd49a6be4bc20c Akshay Gupta 2025-03-03  126  		break;
dd49a6be4bc20c Akshay Gupta 2025-03-03  127  	default:
dd49a6be4bc20c Akshay Gupta 2025-03-03  128  		return -EINVAL;
dd49a6be4bc20c Akshay Gupta 2025-03-03  129  	}
dd49a6be4bc20c Akshay Gupta 2025-03-03  130  
dd49a6be4bc20c Akshay Gupta 2025-03-03  131  	/* Copy results back to user only for get/monitor commands and firmware failures */
dd49a6be4bc20c Akshay Gupta 2025-03-03  132  	if ((read && !ret) || ret == -EPROTOTYPE) {
dd49a6be4bc20c Akshay Gupta 2025-03-03  133  		if (copy_to_user(arguser, &msg, sizeof(struct apml_message)))
dd49a6be4bc20c Akshay Gupta 2025-03-03  134  			ret = -EFAULT;
dd49a6be4bc20c Akshay Gupta 2025-03-03  135  	}
dd49a6be4bc20c Akshay Gupta 2025-03-03  136  	return ret;
dd49a6be4bc20c Akshay Gupta 2025-03-03  137  }
dd49a6be4bc20c Akshay Gupta 2025-03-03  138  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
