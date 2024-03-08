Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C518F55C3A
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Mar 2024 11:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709896613; cv=none; b=Sf45N+HjTN0p8/wwynUa6P6D8gysDam9FbaIW1eobi9uxsjrNFD9zlUrYqgTpRqaAPB/h/toSIGTtZGjQ6j0xvb74bMGqzfLbmyQN/P0pJz8G7MzhZev/++IvVF1GZ1lxnc22atSwRZR0CKFun0Wbe2DtVd8WCFOFF6Lxryo+Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709896613; c=relaxed/simple;
	bh=+A0kld+/8IiTLG1M93SfL/TpEK77zqWtotvM1KgR39s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QBdDmpDC8eJxQRPHEEKx+wSgILFf0KUvFY1Lm0INhgJR4tWcXnE2mOb8nQIeCndPzx7UMHilViHJsXkLk5+uV8REYAXb+50GTJfZHr1xGI6sBOyBloHT4mrWBDo26/MUu5FHTVGtibMx4kSjyl//vWv1/mjUAhdS87Bu8rfc2lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QFMYzsiE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QFMYzsiE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709896611; x=1741432611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+A0kld+/8IiTLG1M93SfL/TpEK77zqWtotvM1KgR39s=;
  b=QFMYzsiEsXiz3blQDbWNFfXGiW96nzrIPjDjZPZAsnJ51xoVdcC4+acd
   j8vkRQg60SpMnvtAs22uaJCQHQ2/0DJe16uJYN1LYurYQXN2gDnSdc5Rm
   hWo47nZuYFyhZ/6o8NoJkWFS1nIiWfqv4qQ9N0lUlSPpylR7LXOapb22+
   WznHXxrnVbzThVQ0HErUYS6E0gNBnYAv6RKddVNrNK7be8TXjVETTO++A
   XrNH1+pBTm4SkcrSHLtxD/m+9RAM3LaFyl9SZ18Gdr4Ug5F5BKznCw+Gl
   uAP8UOnwfL2A0fzbTpQwsIAKosK1Ij6XF3dNiisls15cyx/WyKjj22bPJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4458345"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4458345"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 03:16:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="10447566"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Mar 2024 03:16:48 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riYDW-0006KR-0X;
	Fri, 08 Mar 2024 11:16:46 +0000
Date: Fri, 8 Mar 2024 19:16:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: arch/x86/events/intel/uncore_snbep.c:3788:17-21: ERROR: eas is NULL
 but dereferenced.
Message-ID: <202403081935.EZxaxTK2-lkp@intel.com>
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
TO: jasperwang@tencent.com
TO: kaixuxia@tencent.com
TO: frankjpliu@tencent.com
TO: kasong@tencent.com
TO: sagazchen@tencent.com
TO: kernelxing@tencent.com
TO: aurelianliu@tencent.com
TO: jason.zeng@intel.com
TO: wu.zheng@intel.com
TO: yingbao.jia@intel.com
TO: pei.p.jia@intel.com

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e116ff64db9be38b70fd5b050f5900435d428547
commit: b01a905cd1afaea826719491abf1ea7378e21ccb perf/x86/intel/uncore: Expose an Uncore unit to IIO PMON mapping
date:   9 months ago
:::::: branch date: 4 days ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-103-20240308 (https://download.01.org/0day-ci/archive/20240308/202403081935.EZxaxTK2-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202403081935.EZxaxTK2-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/events/intel/uncore_snbep.c:3788:17-21: ERROR: eas is NULL but dereferenced.

vim +3788 arch/x86/events/intel/uncore_snbep.c

b01a905cd1afae Roman Sudarikov 2020-06-01  3749  
b01a905cd1afae Roman Sudarikov 2020-06-01  3750  static int skx_iio_set_mapping(struct intel_uncore_type *type)
b01a905cd1afae Roman Sudarikov 2020-06-01  3751  {
b01a905cd1afae Roman Sudarikov 2020-06-01  3752  	char buf[64];
b01a905cd1afae Roman Sudarikov 2020-06-01  3753  	int ret;
b01a905cd1afae Roman Sudarikov 2020-06-01  3754  	long die = -1;
b01a905cd1afae Roman Sudarikov 2020-06-01  3755  	struct attribute **attrs = NULL;
b01a905cd1afae Roman Sudarikov 2020-06-01  3756  	struct dev_ext_attribute *eas = NULL;
b01a905cd1afae Roman Sudarikov 2020-06-01  3757  
b01a905cd1afae Roman Sudarikov 2020-06-01  3758  	ret = skx_iio_get_topology(type);
b01a905cd1afae Roman Sudarikov 2020-06-01  3759  	if (ret)
b01a905cd1afae Roman Sudarikov 2020-06-01  3760  		return ret;
b01a905cd1afae Roman Sudarikov 2020-06-01  3761  
b01a905cd1afae Roman Sudarikov 2020-06-01  3762  	/* One more for NULL. */
b01a905cd1afae Roman Sudarikov 2020-06-01  3763  	attrs = kcalloc((uncore_max_dies() + 1), sizeof(*attrs), GFP_KERNEL);
b01a905cd1afae Roman Sudarikov 2020-06-01  3764  	if (!attrs)
b01a905cd1afae Roman Sudarikov 2020-06-01  3765  		goto err;
b01a905cd1afae Roman Sudarikov 2020-06-01  3766  
b01a905cd1afae Roman Sudarikov 2020-06-01  3767  	eas = kcalloc(uncore_max_dies(), sizeof(*eas), GFP_KERNEL);
b01a905cd1afae Roman Sudarikov 2020-06-01  3768  	if (!eas)
b01a905cd1afae Roman Sudarikov 2020-06-01  3769  		goto err;
b01a905cd1afae Roman Sudarikov 2020-06-01  3770  
b01a905cd1afae Roman Sudarikov 2020-06-01  3771  	for (die = 0; die < uncore_max_dies(); die++) {
b01a905cd1afae Roman Sudarikov 2020-06-01  3772  		sprintf(buf, "die%ld", die);
b01a905cd1afae Roman Sudarikov 2020-06-01  3773  		sysfs_attr_init(&eas[die].attr.attr);
b01a905cd1afae Roman Sudarikov 2020-06-01  3774  		eas[die].attr.attr.name = kstrdup(buf, GFP_KERNEL);
b01a905cd1afae Roman Sudarikov 2020-06-01  3775  		if (!eas[die].attr.attr.name)
b01a905cd1afae Roman Sudarikov 2020-06-01  3776  			goto err;
b01a905cd1afae Roman Sudarikov 2020-06-01  3777  		eas[die].attr.attr.mode = 0444;
b01a905cd1afae Roman Sudarikov 2020-06-01  3778  		eas[die].attr.show = skx_iio_mapping_show;
b01a905cd1afae Roman Sudarikov 2020-06-01  3779  		eas[die].attr.store = NULL;
b01a905cd1afae Roman Sudarikov 2020-06-01  3780  		eas[die].var = (void *)die;
b01a905cd1afae Roman Sudarikov 2020-06-01  3781  		attrs[die] = &eas[die].attr.attr;
b01a905cd1afae Roman Sudarikov 2020-06-01  3782  	}
b01a905cd1afae Roman Sudarikov 2020-06-01  3783  	skx_iio_mapping_group.attrs = attrs;
b01a905cd1afae Roman Sudarikov 2020-06-01  3784  
b01a905cd1afae Roman Sudarikov 2020-06-01  3785  	return 0;
b01a905cd1afae Roman Sudarikov 2020-06-01  3786  err:
b01a905cd1afae Roman Sudarikov 2020-06-01  3787  	for (; die >= 0; die--)
b01a905cd1afae Roman Sudarikov 2020-06-01 @3788  		kfree(eas[die].attr.attr.name);
b01a905cd1afae Roman Sudarikov 2020-06-01  3789  	kfree(eas);
b01a905cd1afae Roman Sudarikov 2020-06-01  3790  	kfree(attrs);
b01a905cd1afae Roman Sudarikov 2020-06-01  3791  	kfree(type->topology);
b01a905cd1afae Roman Sudarikov 2020-06-01  3792  	type->attr_update = NULL;
b01a905cd1afae Roman Sudarikov 2020-06-01  3793  	return -ENOMEM;
b01a905cd1afae Roman Sudarikov 2020-06-01  3794  }
b01a905cd1afae Roman Sudarikov 2020-06-01  3795  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
