Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611E51A83F9
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Oct 2025 13:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761311813; cv=none; b=tV5rL5sZHKuZcV9TzFs4z2VTFVy7qXCCznQwIJwDPceR2yin1V6rJLAxsduiBttlt4nrH0v7VzQnDDI/FBvHWgrqA50vzMcShocoWRxlc5TG7lNv4iKmW6+pPcILmb7/JXF9BBG/ehwbURrjATVePO6seQC4Tw4KgWSJj7TchWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761311813; c=relaxed/simple;
	bh=PuszPAKAPzkSo0wbT6ydTi/iYYbDYaI3B74rEGvoAls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PTm2wPKmuz6IpVBvNtQeoBbmFhzh+08Rj0qwyCb4aSY6SdcuFN8AUaNXlSIg9DhL42eQVB/LHXLKR5ebkfs5ujvvE6e6s9YAUHd9X1dXiumsws732AUiud5ZC2QrqdepszjSOO99FrayIz/9aYD1Zio53fEP+umSii/w4Q4p3pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OrFLQFgM; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OrFLQFgM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761311810; x=1792847810;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=PuszPAKAPzkSo0wbT6ydTi/iYYbDYaI3B74rEGvoAls=;
  b=OrFLQFgM3HHvfvMlBlrqdLIW0ab+FjNmTDLK8HHkEmYztdLzqA4TqV9E
   DWg+gCPJgdHxGpoIajlvqADDg/c7ilgVbkBpzMcPUXUrE5/ktIL69//C5
   iGXBck0OoVSp68ASPRc3kFeZ5VYq0+skpRAAVA6+DN0x9V3MCPKVj9jms
   o2vPDv6KQUEMzqxAP3br12f6QKzMJEY4PTdFTglwFVlL97JESKlRjKiQ/
   3eGWvzXA4qPcTQfkL0oSDzGEBF6DUnoe+v9yJN5mEK0mqlh4aoX/OBvMt
   ItMT6ec2cPQSdJ1kj/v/rqB04a0u/Pw5JqslQvXtBFXBGbjfImwj81sR4
   A==;
X-CSE-ConnectionGUID: XZkDfMXYTeWAX5vQm5VCMg==
X-CSE-MsgGUID: O1Poy/VRRaWoz7KabrdwZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88961491"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="88961491"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 06:16:49 -0700
X-CSE-ConnectionGUID: IdN/7mRSQyyqQNdbjGRjgA==
X-CSE-MsgGUID: 1vTu9ql1QmuPCHsB6qx9+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="189554263"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 24 Oct 2025 06:16:46 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCHeu-000EWT-2n;
	Fri, 24 Oct 2025 13:16:44 +0000
Date: Fri, 24 Oct 2025 21:15:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3297/4098]
 drivers/gpu/drm/vkms/vkms_configfs.c:102 make_plane_group() error:
 dereferencing freed memory 'plane' (line 101)
Message-ID: <202510242155.afchO66g-lkp@intel.com>
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
commit: 2f1734ba271bb98d582b02f72d77d1c7710a8d7a [3297/4098] drm/vkms: Allow to configure multiple planes via configfs
:::::: branch date: 9 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20251024 (https://download.01.org/0day-ci/archive/20251024/202510242155.afchO66g-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510242155.afchO66g-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/vkms/vkms_configfs.c:102 make_plane_group() error: dereferencing freed memory 'plane' (line 101)

Old smatch warnings:
drivers/gpu/drm/vkms/vkms_configfs.c:209 make_device_group() error: dereferencing freed memory 'dev' (line 208)

vim +/plane +102 drivers/gpu/drm/vkms/vkms_configfs.c

2f1734ba271bb9 Louis Chauvet 2025-10-16   80  
2f1734ba271bb9 Louis Chauvet 2025-10-16   81  static struct config_group *make_plane_group(struct config_group *group,
2f1734ba271bb9 Louis Chauvet 2025-10-16   82  					     const char *name)
2f1734ba271bb9 Louis Chauvet 2025-10-16   83  {
2f1734ba271bb9 Louis Chauvet 2025-10-16   84  	struct vkms_configfs_device *dev;
2f1734ba271bb9 Louis Chauvet 2025-10-16   85  	struct vkms_configfs_plane *plane;
2f1734ba271bb9 Louis Chauvet 2025-10-16   86  
2f1734ba271bb9 Louis Chauvet 2025-10-16   87  	dev = child_group_to_vkms_configfs_device(group);
2f1734ba271bb9 Louis Chauvet 2025-10-16   88  
2f1734ba271bb9 Louis Chauvet 2025-10-16   89  	scoped_guard(mutex, &dev->lock) {
2f1734ba271bb9 Louis Chauvet 2025-10-16   90  		if (dev->enabled)
2f1734ba271bb9 Louis Chauvet 2025-10-16   91  			return ERR_PTR(-EBUSY);
2f1734ba271bb9 Louis Chauvet 2025-10-16   92  
2f1734ba271bb9 Louis Chauvet 2025-10-16   93  		plane = kzalloc(sizeof(*plane), GFP_KERNEL);
2f1734ba271bb9 Louis Chauvet 2025-10-16   94  		if (!plane)
2f1734ba271bb9 Louis Chauvet 2025-10-16   95  			return ERR_PTR(-ENOMEM);
2f1734ba271bb9 Louis Chauvet 2025-10-16   96  
2f1734ba271bb9 Louis Chauvet 2025-10-16   97  		plane->dev = dev;
2f1734ba271bb9 Louis Chauvet 2025-10-16   98  
2f1734ba271bb9 Louis Chauvet 2025-10-16   99  		plane->config = vkms_config_create_plane(dev->config);
2f1734ba271bb9 Louis Chauvet 2025-10-16  100  		if (IS_ERR(plane->config)) {
2f1734ba271bb9 Louis Chauvet 2025-10-16 @101  			kfree(plane);
2f1734ba271bb9 Louis Chauvet 2025-10-16 @102  			return ERR_CAST(plane->config);
2f1734ba271bb9 Louis Chauvet 2025-10-16  103  		}
2f1734ba271bb9 Louis Chauvet 2025-10-16  104  
2f1734ba271bb9 Louis Chauvet 2025-10-16  105  		config_group_init_type_name(&plane->group, name, &plane_item_type);
2f1734ba271bb9 Louis Chauvet 2025-10-16  106  	}
2f1734ba271bb9 Louis Chauvet 2025-10-16  107  
2f1734ba271bb9 Louis Chauvet 2025-10-16  108  	return &plane->group;
2f1734ba271bb9 Louis Chauvet 2025-10-16  109  }
2f1734ba271bb9 Louis Chauvet 2025-10-16  110  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
