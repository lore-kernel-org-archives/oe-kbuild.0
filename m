Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825D719ABBB
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Oct 2024 11:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729597598; cv=none; b=WutIkSa5eTKoLNrqKM6uXzIfH2BkCiACcsNGeiCW0X7J1Ei4+6OIgbQDuk/QaLIqtvoiIne8Upc845tjeSEiZ1RQxj+57/xwF9iiJIlNGtT9ptecJM5q5foMq0Zsy0riY+FH/+2zCQlYF0gZHkGm0dCRKtw1B4+ze53iYSTB01o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729597598; c=relaxed/simple;
	bh=EZG9uu1EQKY0/+jnaCqK8mFB9rrI7NPSuqAziLdQGFg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gYGp2gWiALXM1GdpxBBSRfrplzhIhBtS9rQaN8tE4VXpsbPRFNtArRmqKHe0CzTiZQeL4aULCErSYEoz+VRt7GooM1RDuxjhO8tK+XKuuL2/e7NBeRmIjeMHpZBHm/cYfTaOYjsDog+Zyrj5wYjsCi66DHN+9EN2SFHR+alSIH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U2ZpXWe5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U2ZpXWe5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729597596; x=1761133596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EZG9uu1EQKY0/+jnaCqK8mFB9rrI7NPSuqAziLdQGFg=;
  b=U2ZpXWe5pgqEQovH0dNZWY4CfMPEWgvHVGyJB5PBthtCQC9phGoY3B19
   nu2oaOSEG/z/0+FWdJeGFjLi0FXPj5qrTfAkGcCYqavg873P7A8olnubN
   yoYpQVq8R0anWWI/YE+tiK8qNasVT7GHw1u1TK66adePK5s6uXaf3MRN3
   xxmodT3fLW4rZNIH49Bmf4WN9TmdW9ilpRna6UaBD/48Ayd2We/q09Guf
   3qs+ra//tqdXTKx3rjvVwTlC1PLhi/KnBWf5kSigHaAE2dcGXsaSE+Xi3
   JLHptoeO6izXtZWeJPlMn2+HMNFYvaO8V0KbYPpaqd2IPzqPengaxefNV
   Q==;
X-CSE-ConnectionGUID: izeDR9NaSfy47QBRE9zWBg==
X-CSE-MsgGUID: WGDUWiTwSm2hItuk4Tpicg==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29019090"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="29019090"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 04:46:35 -0700
X-CSE-ConnectionGUID: VJGBqjNST+mjOFOyNXEndg==
X-CSE-MsgGUID: 7/IPKScmQUK9eoGwuOJf0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="84634655"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Oct 2024 04:46:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3DLL-000TVg-39;
	Tue, 22 Oct 2024 11:46:31 +0000
Date: Tue, 22 Oct 2024 19:46:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 918/2444]
 arch/x86/events/intel/uncore_snbep.c:3788:17-21: ERROR: eas is NULL but
 dereferenced.
Message-ID: <202410221930.CUeMYN5B-lkp@intel.com>
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
TO: kaixuxia@tencent.com
TO: frankjpliu@tencent.com
TO: kasong@tencent.com
TO: sagazchen@tencent.com
TO: kernelxing@tencent.com
TO: aurelianliu@tencent.com
TO: deshengwu@tencent.com
TO: flyingpeng@tencent.com
TO: jingqunli@tencent.com
TO: jason.zeng@intel.com
TO: wu.zheng@intel.com
TO: yingbao.jia@intel.com
TO: pei.p.jia@intel.com

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: 435038c65bed240b598479fbd4002a0765affbd5 [918/2444] perf/x86/intel/uncore: Expose an Uncore unit to IIO PMON mapping
:::::: branch date: 29 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-101-20241022 (https://download.01.org/0day-ci/archive/20241022/202410221930.CUeMYN5B-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410221930.CUeMYN5B-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/events/intel/uncore_snbep.c:3788:17-21: ERROR: eas is NULL but dereferenced.

vim +3788 arch/x86/events/intel/uncore_snbep.c

435038c65bed24 Roman Sudarikov 2020-06-01  3749  
435038c65bed24 Roman Sudarikov 2020-06-01  3750  static int skx_iio_set_mapping(struct intel_uncore_type *type)
435038c65bed24 Roman Sudarikov 2020-06-01  3751  {
435038c65bed24 Roman Sudarikov 2020-06-01  3752  	char buf[64];
435038c65bed24 Roman Sudarikov 2020-06-01  3753  	int ret;
435038c65bed24 Roman Sudarikov 2020-06-01  3754  	long die = -1;
435038c65bed24 Roman Sudarikov 2020-06-01  3755  	struct attribute **attrs = NULL;
435038c65bed24 Roman Sudarikov 2020-06-01  3756  	struct dev_ext_attribute *eas = NULL;
435038c65bed24 Roman Sudarikov 2020-06-01  3757  
435038c65bed24 Roman Sudarikov 2020-06-01  3758  	ret = skx_iio_get_topology(type);
435038c65bed24 Roman Sudarikov 2020-06-01  3759  	if (ret)
435038c65bed24 Roman Sudarikov 2020-06-01  3760  		return ret;
435038c65bed24 Roman Sudarikov 2020-06-01  3761  
435038c65bed24 Roman Sudarikov 2020-06-01  3762  	/* One more for NULL. */
435038c65bed24 Roman Sudarikov 2020-06-01  3763  	attrs = kcalloc((uncore_max_dies() + 1), sizeof(*attrs), GFP_KERNEL);
435038c65bed24 Roman Sudarikov 2020-06-01  3764  	if (!attrs)
435038c65bed24 Roman Sudarikov 2020-06-01  3765  		goto err;
435038c65bed24 Roman Sudarikov 2020-06-01  3766  
435038c65bed24 Roman Sudarikov 2020-06-01  3767  	eas = kcalloc(uncore_max_dies(), sizeof(*eas), GFP_KERNEL);
435038c65bed24 Roman Sudarikov 2020-06-01  3768  	if (!eas)
435038c65bed24 Roman Sudarikov 2020-06-01  3769  		goto err;
435038c65bed24 Roman Sudarikov 2020-06-01  3770  
435038c65bed24 Roman Sudarikov 2020-06-01  3771  	for (die = 0; die < uncore_max_dies(); die++) {
435038c65bed24 Roman Sudarikov 2020-06-01  3772  		sprintf(buf, "die%ld", die);
435038c65bed24 Roman Sudarikov 2020-06-01  3773  		sysfs_attr_init(&eas[die].attr.attr);
435038c65bed24 Roman Sudarikov 2020-06-01  3774  		eas[die].attr.attr.name = kstrdup(buf, GFP_KERNEL);
435038c65bed24 Roman Sudarikov 2020-06-01  3775  		if (!eas[die].attr.attr.name)
435038c65bed24 Roman Sudarikov 2020-06-01  3776  			goto err;
435038c65bed24 Roman Sudarikov 2020-06-01  3777  		eas[die].attr.attr.mode = 0444;
435038c65bed24 Roman Sudarikov 2020-06-01  3778  		eas[die].attr.show = skx_iio_mapping_show;
435038c65bed24 Roman Sudarikov 2020-06-01  3779  		eas[die].attr.store = NULL;
435038c65bed24 Roman Sudarikov 2020-06-01  3780  		eas[die].var = (void *)die;
435038c65bed24 Roman Sudarikov 2020-06-01  3781  		attrs[die] = &eas[die].attr.attr;
435038c65bed24 Roman Sudarikov 2020-06-01  3782  	}
435038c65bed24 Roman Sudarikov 2020-06-01  3783  	skx_iio_mapping_group.attrs = attrs;
435038c65bed24 Roman Sudarikov 2020-06-01  3784  
435038c65bed24 Roman Sudarikov 2020-06-01  3785  	return 0;
435038c65bed24 Roman Sudarikov 2020-06-01  3786  err:
435038c65bed24 Roman Sudarikov 2020-06-01  3787  	for (; die >= 0; die--)
435038c65bed24 Roman Sudarikov 2020-06-01 @3788  		kfree(eas[die].attr.attr.name);
435038c65bed24 Roman Sudarikov 2020-06-01  3789  	kfree(eas);
435038c65bed24 Roman Sudarikov 2020-06-01  3790  	kfree(attrs);
435038c65bed24 Roman Sudarikov 2020-06-01  3791  	kfree(type->topology);
435038c65bed24 Roman Sudarikov 2020-06-01  3792  	type->attr_update = NULL;
435038c65bed24 Roman Sudarikov 2020-06-01  3793  	return -ENOMEM;
435038c65bed24 Roman Sudarikov 2020-06-01  3794  }
435038c65bed24 Roman Sudarikov 2020-06-01  3795  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
