Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F4B33342C
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Oct 2025 15:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761321323; cv=none; b=u8CIiXernJWEq08/bsjfNt88mATyeSSCPbEvhTsOz1aGX9aG108OdlASZz8JIRsnlAot3oY3IpNEn0uUN1nYcHW/w6R+FebHiQX2K8zDrrZeCNhklGWt4Olgu7Oi5jNSQZEVVFmkTGEhvvtAbJOQHtBGlM3J2RXzqSe21wYSnN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761321323; c=relaxed/simple;
	bh=kitNp9LFhJSp2A+u49xMzgTUnUvh7o72Wa2m64jjh0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l+RgQhHf+1qfPCEPcE9j0COC3IglJ8OgjymVoqdSH3Ir2xdUKi6oZH/yDvO7yGCNCn1mAuipQtlXL8VK44Bj8nJ1NG6hIEwanAH+aOjSAYqnA0g+LY6X6znTTpMuyOVSYDunrqG58dZFjMXAN7fqCbpsWkwwSHiuEtuZn4r819E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARZk2rlR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARZk2rlR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761321321; x=1792857321;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kitNp9LFhJSp2A+u49xMzgTUnUvh7o72Wa2m64jjh0A=;
  b=ARZk2rlRmlLt7n/AVIQdN3llzSldf2JmVO+REKAqwSgVk4acwSCm7bhN
   A7EM77LhU6uN9t/z0wNSXevBdYhl+xJmYXu/mQJkYQYpUaO4ToDFF3/1o
   9uixQXf5FCT2/tKJyOPPQjwGJLksMnIKVAVcOL0EqJq82o5RSZ6bmAT33
   LtwUgNkTLuRCsn9vC1cSltYD1AeSxEEwPY8p3lJ7W3B/c0izMDl0wEcy5
   ai+R5520H7Qjxm1RVTTQ2vhLQHJaLhm2U+fLX+gaymgi0nIbDoD+j6+Wd
   z4Mi+MzrCfguJebOCbtQvfJ7lhpJz1ZVDvvEqHnB0g/HN7JkNDKCVbxfL
   A==;
X-CSE-ConnectionGUID: GgKoHNlJTxeuLY6QjCQMqg==
X-CSE-MsgGUID: C+1cYDo0Sa+dKXcj7DsAuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73793457"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="73793457"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 08:55:12 -0700
X-CSE-ConnectionGUID: ukzP3qqvRYCLBeOGbhubkA==
X-CSE-MsgGUID: wH9bF6UlQzKUIFoKGB19eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="184168412"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 24 Oct 2025 08:55:10 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCK7S-000Ed1-1D;
	Fri, 24 Oct 2025 15:54:41 +0000
Date: Fri, 24 Oct 2025 23:52:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3302/4098]
 drivers/gpu/drm/vkms/vkms_configfs.c:411 make_encoder_group() error:
 dereferencing freed memory 'encoder' (line 410)
Message-ID: <202510242322.aWclvr7e-lkp@intel.com>
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
commit: 67d8cf92e13ec05e64745ae7b63545de5d8e867a [3302/4098] drm/vkms: Allow to configure multiple encoders via configfs
:::::: branch date: 12 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20251024 (https://download.01.org/0day-ci/archive/20251024/202510242322.aWclvr7e-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510242322.aWclvr7e-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/vkms/vkms_configfs.c:411 make_encoder_group() error: dereferencing freed memory 'encoder' (line 410)

Old smatch warnings:
drivers/gpu/drm/vkms/vkms_configfs.c:189 make_crtc_group() error: dereferencing freed memory 'crtc' (line 188)
drivers/gpu/drm/vkms/vkms_configfs.c:343 make_plane_group() error: dereferencing freed memory 'plane' (line 342)
drivers/gpu/drm/vkms/vkms_configfs.c:519 make_device_group() error: dereferencing freed memory 'dev' (line 518)

vim +/encoder +411 drivers/gpu/drm/vkms/vkms_configfs.c

67d8cf92e13ec05 Louis Chauvet 2025-10-16  389  
67d8cf92e13ec05 Louis Chauvet 2025-10-16  390  static struct config_group *make_encoder_group(struct config_group *group,
67d8cf92e13ec05 Louis Chauvet 2025-10-16  391  					       const char *name)
67d8cf92e13ec05 Louis Chauvet 2025-10-16  392  {
67d8cf92e13ec05 Louis Chauvet 2025-10-16  393  	struct vkms_configfs_device *dev;
67d8cf92e13ec05 Louis Chauvet 2025-10-16  394  	struct vkms_configfs_encoder *encoder;
67d8cf92e13ec05 Louis Chauvet 2025-10-16  395  
67d8cf92e13ec05 Louis Chauvet 2025-10-16  396  	dev = child_group_to_vkms_configfs_device(group);
67d8cf92e13ec05 Louis Chauvet 2025-10-16  397  
67d8cf92e13ec05 Louis Chauvet 2025-10-16  398  	scoped_guard(mutex, &dev->lock) {
67d8cf92e13ec05 Louis Chauvet 2025-10-16  399  		if (dev->enabled)
67d8cf92e13ec05 Louis Chauvet 2025-10-16  400  			return ERR_PTR(-EBUSY);
67d8cf92e13ec05 Louis Chauvet 2025-10-16  401  
67d8cf92e13ec05 Louis Chauvet 2025-10-16  402  		encoder = kzalloc(sizeof(*encoder), GFP_KERNEL);
67d8cf92e13ec05 Louis Chauvet 2025-10-16  403  		if (!encoder)
67d8cf92e13ec05 Louis Chauvet 2025-10-16  404  			return ERR_PTR(-ENOMEM);
67d8cf92e13ec05 Louis Chauvet 2025-10-16  405  
67d8cf92e13ec05 Louis Chauvet 2025-10-16  406  		encoder->dev = dev;
67d8cf92e13ec05 Louis Chauvet 2025-10-16  407  
67d8cf92e13ec05 Louis Chauvet 2025-10-16  408  		encoder->config = vkms_config_create_encoder(dev->config);
67d8cf92e13ec05 Louis Chauvet 2025-10-16  409  		if (IS_ERR(encoder->config)) {
67d8cf92e13ec05 Louis Chauvet 2025-10-16 @410  			kfree(encoder);
67d8cf92e13ec05 Louis Chauvet 2025-10-16 @411  			return ERR_CAST(encoder->config);
67d8cf92e13ec05 Louis Chauvet 2025-10-16  412  		}
67d8cf92e13ec05 Louis Chauvet 2025-10-16  413  
67d8cf92e13ec05 Louis Chauvet 2025-10-16  414  		config_group_init_type_name(&encoder->group, name,
67d8cf92e13ec05 Louis Chauvet 2025-10-16  415  					    &encoder_item_type);
67d8cf92e13ec05 Louis Chauvet 2025-10-16  416  	}
67d8cf92e13ec05 Louis Chauvet 2025-10-16  417  
67d8cf92e13ec05 Louis Chauvet 2025-10-16  418  	return &encoder->group;
67d8cf92e13ec05 Louis Chauvet 2025-10-16  419  }
67d8cf92e13ec05 Louis Chauvet 2025-10-16  420  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
