Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F22932F771
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Oct 2025 17:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761326912; cv=none; b=ejTtzQwrK4GJ9SxVeI7Xh61NHxoP4zMxVAGlUuf7i0Dn2DtjTGH4AiT722VWVbIO99SDed00yP0333KUQWonjKHgXDMMayHrj8S7kb8uPg/3EYjQ9tpuFxwNeeUV3Q8iKXL/YaCm4KNDdRtoS5F6cCCBcLN+MeDf8vWE213LKOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761326912; c=relaxed/simple;
	bh=TxMLXRbLpHtAFrJSRh+r+pASXD5XmizlJKGeKY3BlTI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ICahHumVJ06yQ8CtzrnQbc+RIqEXRxZKJbDREv06Et/Qv6lpkTtJA0m5f+Ozh5oDtwg/FiTVnnzfKRgXfkYPuRsd2ir7WBcW20muAFfpORDhEgkMVQDjQqydvdykIs36sbr4IKeTrfDC205v8fGKI4SJmX5nMezDb5BVNDsrC7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dfXIewA+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dfXIewA+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761326910; x=1792862910;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=TxMLXRbLpHtAFrJSRh+r+pASXD5XmizlJKGeKY3BlTI=;
  b=dfXIewA+iYWfVtEE/uzpOO7jvcSWLXSVGHtkKKB6DVmn0g+loHFGW8xc
   AhX19QYzpSOrMRTXypLqR2K84idtfHVfcHx++MPtJ8fC3aI8RiZw1FLpP
   CekhMkk44vZbOw/PsbB5yjY2Y+AmTsUE0P/CS4zQLL6rn0+OCHcIe6XYp
   V34vj/kfU1Mgdr3DNSOcfE5H3Xa12LlSMhImswyf75jCcCDBNXo6ZhaWU
   xX7whC7akdXMtQcqlCrmhV6jT4upnDShff8x6CGYDyoSsqxVZAEvnrKQo
   Xh0JOo/AKx57xIdRMulpO1z+VffPSwWeWf5ihxGAX65EI2vEYpyu1YCXO
   w==;
X-CSE-ConnectionGUID: 0S0DhsrISgyeKSagO0JGxw==
X-CSE-MsgGUID: XEGPO8erRW+UsPxcJdiZRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67156433"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="67156433"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 10:28:27 -0700
X-CSE-ConnectionGUID: p15CE9ccT26FhzYCRCmYSg==
X-CSE-MsgGUID: Iry9WgoRRHq21+2gbUqb9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="183702165"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 24 Oct 2025 10:28:26 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCLaR-000Ejl-12;
	Fri, 24 Oct 2025 17:28:23 +0000
Date: Sat, 25 Oct 2025 01:28:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3304/4098]
 drivers/gpu/drm/vkms/vkms_configfs.c:552 make_connector_group() error:
 dereferencing freed memory 'connector' (line 551)
Message-ID: <202510250132.FdNONf4v-lkp@intel.com>
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
commit: 272acbca96a3c6f43414e10d433befe2bb906d7c [3304/4098] drm/vkms: Allow to configure multiple connectors via configfs
:::::: branch date: 13 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20251024 (https://download.01.org/0day-ci/archive/20251025/202510250132.FdNONf4v-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510250132.FdNONf4v-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/vkms/vkms_configfs.c:552 make_connector_group() error: dereferencing freed memory 'connector' (line 551)

Old smatch warnings:
drivers/gpu/drm/vkms/vkms_configfs.c:215 make_crtc_group() error: dereferencing freed memory 'crtc' (line 214)
drivers/gpu/drm/vkms/vkms_configfs.c:369 make_plane_group() error: dereferencing freed memory 'plane' (line 368)
drivers/gpu/drm/vkms/vkms_configfs.c:483 make_encoder_group() error: dereferencing freed memory 'encoder' (line 482)
drivers/gpu/drm/vkms/vkms_configfs.c:660 make_device_group() error: dereferencing freed memory 'dev' (line 659)

vim +/connector +552 drivers/gpu/drm/vkms/vkms_configfs.c

272acbca96a3c6 Louis Chauvet 2025-10-16  530  
272acbca96a3c6 Louis Chauvet 2025-10-16  531  static struct config_group *make_connector_group(struct config_group *group,
272acbca96a3c6 Louis Chauvet 2025-10-16  532  						 const char *name)
272acbca96a3c6 Louis Chauvet 2025-10-16  533  {
272acbca96a3c6 Louis Chauvet 2025-10-16  534  	struct vkms_configfs_device *dev;
272acbca96a3c6 Louis Chauvet 2025-10-16  535  	struct vkms_configfs_connector *connector;
272acbca96a3c6 Louis Chauvet 2025-10-16  536  
272acbca96a3c6 Louis Chauvet 2025-10-16  537  	dev = child_group_to_vkms_configfs_device(group);
272acbca96a3c6 Louis Chauvet 2025-10-16  538  
272acbca96a3c6 Louis Chauvet 2025-10-16  539  	scoped_guard(mutex, &dev->lock) {
272acbca96a3c6 Louis Chauvet 2025-10-16  540  		if (dev->enabled)
272acbca96a3c6 Louis Chauvet 2025-10-16  541  			return ERR_PTR(-EBUSY);
272acbca96a3c6 Louis Chauvet 2025-10-16  542  
272acbca96a3c6 Louis Chauvet 2025-10-16  543  		connector = kzalloc(sizeof(*connector), GFP_KERNEL);
272acbca96a3c6 Louis Chauvet 2025-10-16  544  		if (!connector)
272acbca96a3c6 Louis Chauvet 2025-10-16  545  			return ERR_PTR(-ENOMEM);
272acbca96a3c6 Louis Chauvet 2025-10-16  546  
272acbca96a3c6 Louis Chauvet 2025-10-16  547  		connector->dev = dev;
272acbca96a3c6 Louis Chauvet 2025-10-16  548  
272acbca96a3c6 Louis Chauvet 2025-10-16  549  		connector->config = vkms_config_create_connector(dev->config);
272acbca96a3c6 Louis Chauvet 2025-10-16  550  		if (IS_ERR(connector->config)) {
272acbca96a3c6 Louis Chauvet 2025-10-16 @551  			kfree(connector);
272acbca96a3c6 Louis Chauvet 2025-10-16 @552  			return ERR_CAST(connector->config);
272acbca96a3c6 Louis Chauvet 2025-10-16  553  		}
272acbca96a3c6 Louis Chauvet 2025-10-16  554  
272acbca96a3c6 Louis Chauvet 2025-10-16  555  		config_group_init_type_name(&connector->group, name,
272acbca96a3c6 Louis Chauvet 2025-10-16  556  					    &connector_item_type);
272acbca96a3c6 Louis Chauvet 2025-10-16  557  	}
272acbca96a3c6 Louis Chauvet 2025-10-16  558  
272acbca96a3c6 Louis Chauvet 2025-10-16  559  	return &connector->group;
272acbca96a3c6 Louis Chauvet 2025-10-16  560  }
272acbca96a3c6 Louis Chauvet 2025-10-16  561  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
