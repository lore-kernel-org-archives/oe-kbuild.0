Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0021E318146
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Oct 2025 11:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761304929; cv=none; b=BlDXet9oZHNL1cGCl3H5KtCj6UlmYQlyt88L5BiSy194GKfmEvCI/mWgsMAjNL9dTM+0up39m3k82j1ne++g3cchdIcinaH0xgL5jLN1KiznD3S9Fs4Zn3d2tKLhOnQn5c4MGc2m9iIayS7f/i80q4DCUyKLNlLKsevgc9Tr0tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761304929; c=relaxed/simple;
	bh=rgu2s2F5mlD72nleoZj8t+IDU3ALLaQS0DlLg5aqdOs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dagyd4amWEEY6WVP+fa9lssrYckKonIQpne4n3Jsa1TEHofQZqsyRt086kovwT51WXx0Yn8yvlHY4P4ra02F+gOqgcWXPkTPN6X25+WMhOcrM73th5BgL3WnQReCzjMWk+ikEp7hnJQ0Yodah1nTrxv/9d/uUaHHRCf235sGV7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M3HPxUMY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M3HPxUMY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761304928; x=1792840928;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rgu2s2F5mlD72nleoZj8t+IDU3ALLaQS0DlLg5aqdOs=;
  b=M3HPxUMYFJQddoUt3IcdtgjEzWZLINPPvE+X/KbJpubwFH31f+ao4AhP
   L+5uZO9dqyp7UksjeHlfSd8Sn7xfD05PU3/3pwI2L5PfV33ckDU/nnPDs
   VjwaSJp6qdC+KrzzWhYJqlSoFn6GgNFsG5BFD28FLuh8bgl+n9JHSc5gr
   mfM9gmW9i+EHurO3/X6A4pU+xduCsITMUgELdd9C6Xxs3lXG6qGETY9rg
   LxvUU8lk7lEsfju+4ROcmfiGL0noPsEJBbLLwFFrgmIcpyUdyWgsISC0P
   fyaqrqOmu5SYhrMszbYlFerYY3pESkLMdcEZQ8kGSXAK6H0Rg6Mr7V5T/
   A==;
X-CSE-ConnectionGUID: VkzS5aAvQCO4Ii8k8Bz19A==
X-CSE-MsgGUID: ZtoQgHVoSyugh1hnImoj9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63412325"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63412325"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 04:22:07 -0700
X-CSE-ConnectionGUID: cufStABxT2+g9hgQGzaVRA==
X-CSE-MsgGUID: xGLbOp9+QaeHyWk+Io/JVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="184480416"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 24 Oct 2025 04:22:06 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCFrv-000ES3-04;
	Fri, 24 Oct 2025 11:22:03 +0000
Date: Fri, 24 Oct 2025 19:21:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3296/4098]
 drivers/gpu/drm/vkms/vkms_configfs.c:125 make_device_group() error:
 dereferencing freed memory 'dev' (line 124)
Message-ID: <202510241912.s8uQLYlp-lkp@intel.com>
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
TO: Louis Chauvet <louis.chauvet@bootlin.com>
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: Harry Wentland <harry.wentland@amd.com>
CC: "José Expósito" <jose.exposito89@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   72fb0170ef1f45addf726319c52a0562b6913707
commit: 13fc9b9745cc5dbf38c4d559114cf98f8179b95f [3296/4098] drm/vkms: Add and remove VKMS instances via configfs
:::::: branch date: 7 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20251024 (https://download.01.org/0day-ci/archive/20251024/202510241912.s8uQLYlp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510241912.s8uQLYlp-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/vkms/vkms_configfs.c:125 make_device_group() error: dereferencing freed memory 'dev' (line 124)

vim +/dev +125 drivers/gpu/drm/vkms/vkms_configfs.c

13fc9b9745cc5d Louis Chauvet 2025-10-16  109  
13fc9b9745cc5d Louis Chauvet 2025-10-16  110  static struct config_group *make_device_group(struct config_group *group,
13fc9b9745cc5d Louis Chauvet 2025-10-16  111  					      const char *name)
13fc9b9745cc5d Louis Chauvet 2025-10-16  112  {
13fc9b9745cc5d Louis Chauvet 2025-10-16  113  	struct vkms_configfs_device *dev;
13fc9b9745cc5d Louis Chauvet 2025-10-16  114  
13fc9b9745cc5d Louis Chauvet 2025-10-16  115  	if (strcmp(name, DEFAULT_DEVICE_NAME) == 0)
13fc9b9745cc5d Louis Chauvet 2025-10-16  116  		return ERR_PTR(-EINVAL);
13fc9b9745cc5d Louis Chauvet 2025-10-16  117  
13fc9b9745cc5d Louis Chauvet 2025-10-16  118  	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
13fc9b9745cc5d Louis Chauvet 2025-10-16  119  	if (!dev)
13fc9b9745cc5d Louis Chauvet 2025-10-16  120  		return ERR_PTR(-ENOMEM);
13fc9b9745cc5d Louis Chauvet 2025-10-16  121  
13fc9b9745cc5d Louis Chauvet 2025-10-16  122  	dev->config = vkms_config_create(name);
13fc9b9745cc5d Louis Chauvet 2025-10-16  123  	if (IS_ERR(dev->config)) {
13fc9b9745cc5d Louis Chauvet 2025-10-16 @124  		kfree(dev);
13fc9b9745cc5d Louis Chauvet 2025-10-16 @125  		return ERR_CAST(dev->config);
13fc9b9745cc5d Louis Chauvet 2025-10-16  126  	}
13fc9b9745cc5d Louis Chauvet 2025-10-16  127  
13fc9b9745cc5d Louis Chauvet 2025-10-16  128  	config_group_init_type_name(&dev->group, name, &device_item_type);
13fc9b9745cc5d Louis Chauvet 2025-10-16  129  	mutex_init(&dev->lock);
13fc9b9745cc5d Louis Chauvet 2025-10-16  130  
13fc9b9745cc5d Louis Chauvet 2025-10-16  131  	return &dev->group;
13fc9b9745cc5d Louis Chauvet 2025-10-16  132  }
13fc9b9745cc5d Louis Chauvet 2025-10-16  133  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
