Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EC933EC
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Dec 2025 10:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766831864; cv=none; b=fGnNwvMfBSz0LvySuh/XtAILbHeiyZ3boRFXCJ6XGdSFLuDV9ek0HZxwtUQ47kt2Qmk7Iem3kgDQ+Vr2Z1xdNwiUs7ngNmXYUz8P/4yc0rOxuppepxi+UxnRr7Wh73SWnyRTrnLzKUyvh1hyV4jxO9cvwvHs9duA6eyLUY2M6+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766831864; c=relaxed/simple;
	bh=9czJ3Z8SrXM2G9kamvG9nyi8ORET5+8rYWpxqngXnUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fT5Rolq8uwc3EY5H5T6f/p+VomOZVq5Vme/q8fnJqwuypm/1bkHhARaQFlqo7Dr6brDJkVcIozQlG+XzZsra4tXHTr4Ud1X9RO6srPJW5GYTNtIaihP76668uQiDxIXtXP/D50tg+edaR1ZTVQl6zcXDcEx5iFNhS5P7YHuLYuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvDAq4ZW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvDAq4ZW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766831862; x=1798367862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9czJ3Z8SrXM2G9kamvG9nyi8ORET5+8rYWpxqngXnUU=;
  b=mvDAq4ZWPOcKcqVSOXzp+LE5bbAhH2eRrBOa/IhnPMmePKTJMYWFsX0q
   B6TObS05OTrfm0T9cag78SLcAUWkllkulyoWFPd8AygwA1juEDPgMEj86
   KYuVZs6KLK8HvX/nrsIaRe0C6qfJdhY4PmNXEYZ3UskfLvLx1ubxFE/8N
   xA+eirX7E3TDH1NiQJdWSMp1hiVewpBnd03ijv/ipnp4wMd8AL5bu7ZIn
   1XN/s8GEHR1gAhKbRUhe2hQmMD+Na2+dO/OqxDNwmwqwt2XpHPY03/juH
   fUF7+Zp+HOvERYw5H98NA5FjKTvtUq+Hj3OgOvd6eAVilaB8yMV5qQff/
   Q==;
X-CSE-ConnectionGUID: xFN4xQAoTV2PDoia+WwVKQ==
X-CSE-MsgGUID: LabYubtqT7OnDQDzPKn3VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="68614918"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="68614918"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 02:37:41 -0800
X-CSE-ConnectionGUID: LJi+nvIZQYa4uL/G7J24nA==
X-CSE-MsgGUID: q3oImaOERFWh4hdUrjuz+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="200451561"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 27 Dec 2025 02:37:38 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZRft-000000005kH-2dtS;
	Sat, 27 Dec 2025 10:37:34 +0000
Date: Sat, 27 Dec 2025 18:37:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v22 2/2] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
Message-ID: <202512271806.n2lycyZw-lkp@intel.com>
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
In-Reply-To: <20251227-next-15nov_expose_sysfs-v22-2-2d153438ba19@oss.qualcomm.com>
References: <20251227-next-15nov_expose_sysfs-v22-2-2d153438ba19@oss.qualcomm.com>
TO: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
TO: Sebastian Reichel <sre@kernel.org>
TO: Bartosz Golaszewski <bgolasze@quicinc.com>
TO: Bjorn Andersson <andersson@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: linux-pm@vger.kernel.org
CC: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Hi Shivendra,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cc3aa43b44bdb43dfbac0fcb51c56594a11338a8]

url:    https://github.com/intel-lab-lkp/linux/commits/Shivendra-Pratap/Documentation-ABI-Add-sysfs-class-reboot-mode-reboot_modes/20251227-025914
base:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
patch link:    https://lore.kernel.org/r/20251227-next-15nov_expose_sysfs-v22-2-2d153438ba19%40oss.qualcomm.com
patch subject: [PATCH v22 2/2] power: reset: reboot-mode: Expose sysfs for registered reboot_modes
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-randconfig-161-20251227 (https://download.01.org/0day-ci/archive/20251227/202512271806.n2lycyZw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512271806.n2lycyZw-lkp@intel.com/

smatch warnings:
drivers/power/reset/reboot-mode.c:147 reboot_mode_create_device() error: we previously assumed 'head' could be null (see line 112)

vim +/head +147 drivers/power/reset/reboot-mode.c

4fcd504edbf7c7 Andy Yan         2016-07-06  102  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  103  static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
e5f49083a20ae0 Shivendra Pratap 2025-12-27  104  {
e5f49083a20ae0 Shivendra Pratap 2025-12-27  105  	struct sysfs_data *sysfs_info;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  106  	struct sysfs_data *next;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  107  	struct list_head *head;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  108  	struct mode_info *info;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  109  	int ret;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  110  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  111  	head = kzalloc(sizeof(*head), GFP_KERNEL);
e5f49083a20ae0 Shivendra Pratap 2025-12-27 @112  	if (!head) {
e5f49083a20ae0 Shivendra Pratap 2025-12-27  113  		ret = -ENOMEM;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  114  		goto error;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  115  	}
e5f49083a20ae0 Shivendra Pratap 2025-12-27  116  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  117  	INIT_LIST_HEAD(head);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  118  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  119  	list_for_each_entry(info, &reboot->head, list) {
e5f49083a20ae0 Shivendra Pratap 2025-12-27  120  		sysfs_info = kzalloc(sizeof(*sysfs_info), GFP_KERNEL);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  121  		if (!sysfs_info) {
e5f49083a20ae0 Shivendra Pratap 2025-12-27  122  			ret = -ENOMEM;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  123  			goto error;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  124  		}
e5f49083a20ae0 Shivendra Pratap 2025-12-27  125  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  126  		sysfs_info->mode = kstrdup_const(info->mode, GFP_KERNEL);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  127  		if (!sysfs_info->mode) {
e5f49083a20ae0 Shivendra Pratap 2025-12-27  128  			kfree(sysfs_info);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  129  			ret = -ENOMEM;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  130  			goto error;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  131  		}
e5f49083a20ae0 Shivendra Pratap 2025-12-27  132  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  133  		list_add_tail(&sysfs_info->list, head);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  134  	}
e5f49083a20ae0 Shivendra Pratap 2025-12-27  135  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  136  	reboot->reboot_mode_device = device_create(&reboot_mode_class, NULL, 0,
e5f49083a20ae0 Shivendra Pratap 2025-12-27  137  						   (void *)head, reboot->dev->driver->name);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  138  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  139  	if (IS_ERR(reboot->reboot_mode_device)) {
e5f49083a20ae0 Shivendra Pratap 2025-12-27  140  		ret = PTR_ERR(reboot->reboot_mode_device);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  141  		goto error;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  142  	}
e5f49083a20ae0 Shivendra Pratap 2025-12-27  143  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  144  	return 0;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  145  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  146  error:
e5f49083a20ae0 Shivendra Pratap 2025-12-27 @147  	list_for_each_entry_safe(sysfs_info, next, head, list) {
e5f49083a20ae0 Shivendra Pratap 2025-12-27  148  		list_del(&sysfs_info->list);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  149  		kfree_const(sysfs_info->mode);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  150  		kfree(sysfs_info);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  151  	}
e5f49083a20ae0 Shivendra Pratap 2025-12-27  152  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  153  	kfree(head);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  154  	reboot->reboot_mode_device = NULL;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  155  	return ret;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  156  }
e5f49083a20ae0 Shivendra Pratap 2025-12-27  157  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
