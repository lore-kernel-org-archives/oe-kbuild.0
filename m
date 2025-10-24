Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34B125C711
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Oct 2025 14:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761316825; cv=none; b=kHl31CbdsVzkyPFRKQA2XOaUgDeNRYIjoMBEB0IxozMQAf4UU1FB3Hixotpqogycq3QKCsp78g6nTpmhJhg/EQhNI3UmUyIneZBgAOMs8NDGPK3fm1mgvwHgiA4bbLZ+JkXUnBPryxj2YauKIgGmplsV7/mepNtZ8VhkInIkk+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761316825; c=relaxed/simple;
	bh=lTy2mDFCBIDaTqlHfkhubtiia9DPr6C53CxPQGzWo0w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hK0rlFP399OT+J2xLYSqYOEFQlZelbjstCh4twJ6gD7N3u5UT/57M4PFgfi8tDxMYe1821rfBA7V8vyilHPAofgVyYOVg7sMg7R5TYOhVfmgqr2KEiOsnuq37X+6vtHw1feuVtxNJI9OTaQ2ynB59GIbeZYAAYH6q2YM49fRCW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ki23Re27; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ki23Re27"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761316823; x=1792852823;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lTy2mDFCBIDaTqlHfkhubtiia9DPr6C53CxPQGzWo0w=;
  b=ki23Re2739CbcC4RHqDs43oYWcDiFmZSAl3h/j+eEQoLZE0iayqtn815
   UkiHAkZNrCsz5Otbe8hi+BxPs33c+2D2uivWMxqE5nC9sYvoF6wCiPI+y
   pTm1mfZrWuEs5plfvz4ySRpWw2USfP4jfwh+cG46zQILEf76UnJepo7l4
   N99FxbMBXMi+DVpFbWbPVncw+y/Z5mQh7OHYQ8j7IRHhRjUU3R7XKkrU9
   ZgWVlD8mQmKSjRnLKpgfJtxsQQ47jE3xJ/8gjC7nmC8ZlQ6TKUG006faz
   DbaCjmMvhW/OQe2MhtSuraeLnMKthC5Hd8AFRsyNTrBmGodYFdhw2qAhm
   Q==;
X-CSE-ConnectionGUID: QKWmifyHSF2k5NC5TzIUKQ==
X-CSE-MsgGUID: D0QDEq7RQh+kp1TpRel7Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63535344"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="63535344"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 07:40:22 -0700
X-CSE-ConnectionGUID: lIG7Mf1PSVuK1Hrrh1h53w==
X-CSE-MsgGUID: /LMP7pWmTwWRlfyc+Ghy/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="184820675"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 24 Oct 2025 07:40:21 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCIxm-000EYo-2l;
	Fri, 24 Oct 2025 14:40:18 +0000
Date: Fri, 24 Oct 2025 22:40:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3299/4098]
 drivers/gpu/drm/vkms/vkms_configfs.c:121 make_crtc_group() error:
 dereferencing freed memory 'crtc' (line 120)
Message-ID: <202510242250.ZzaqW0pV-lkp@intel.com>
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
commit: 3e4d5b30d2b262c6db84773cafe9097f7ec61ff5 [3299/4098] drm/vkms: Allow to configure multiple CRTCs via configfs
:::::: branch date: 11 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20251024 (https://download.01.org/0day-ci/archive/20251024/202510242250.ZzaqW0pV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510242250.ZzaqW0pV-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/vkms/vkms_configfs.c:121 make_crtc_group() error: dereferencing freed memory 'crtc' (line 120)

Old smatch warnings:
drivers/gpu/drm/vkms/vkms_configfs.c:229 make_plane_group() error: dereferencing freed memory 'plane' (line 228)
drivers/gpu/drm/vkms/vkms_configfs.c:336 make_device_group() error: dereferencing freed memory 'dev' (line 335)

vim +/crtc +121 drivers/gpu/drm/vkms/vkms_configfs.c

3e4d5b30d2b262 Louis Chauvet 2025-10-16   99  
3e4d5b30d2b262 Louis Chauvet 2025-10-16  100  static struct config_group *make_crtc_group(struct config_group *group,
3e4d5b30d2b262 Louis Chauvet 2025-10-16  101  					    const char *name)
3e4d5b30d2b262 Louis Chauvet 2025-10-16  102  {
3e4d5b30d2b262 Louis Chauvet 2025-10-16  103  	struct vkms_configfs_device *dev;
3e4d5b30d2b262 Louis Chauvet 2025-10-16  104  	struct vkms_configfs_crtc *crtc;
3e4d5b30d2b262 Louis Chauvet 2025-10-16  105  
3e4d5b30d2b262 Louis Chauvet 2025-10-16  106  	dev = child_group_to_vkms_configfs_device(group);
3e4d5b30d2b262 Louis Chauvet 2025-10-16  107  
3e4d5b30d2b262 Louis Chauvet 2025-10-16  108  	scoped_guard(mutex, &dev->lock) {
3e4d5b30d2b262 Louis Chauvet 2025-10-16  109  		if (dev->enabled)
3e4d5b30d2b262 Louis Chauvet 2025-10-16  110  			return ERR_PTR(-EBUSY);
3e4d5b30d2b262 Louis Chauvet 2025-10-16  111  
3e4d5b30d2b262 Louis Chauvet 2025-10-16  112  		crtc = kzalloc(sizeof(*crtc), GFP_KERNEL);
3e4d5b30d2b262 Louis Chauvet 2025-10-16  113  		if (!crtc)
3e4d5b30d2b262 Louis Chauvet 2025-10-16  114  			return ERR_PTR(-ENOMEM);
3e4d5b30d2b262 Louis Chauvet 2025-10-16  115  
3e4d5b30d2b262 Louis Chauvet 2025-10-16  116  		crtc->dev = dev;
3e4d5b30d2b262 Louis Chauvet 2025-10-16  117  
3e4d5b30d2b262 Louis Chauvet 2025-10-16  118  		crtc->config = vkms_config_create_crtc(dev->config);
3e4d5b30d2b262 Louis Chauvet 2025-10-16  119  		if (IS_ERR(crtc->config)) {
3e4d5b30d2b262 Louis Chauvet 2025-10-16 @120  			kfree(crtc);
3e4d5b30d2b262 Louis Chauvet 2025-10-16 @121  			return ERR_CAST(crtc->config);
3e4d5b30d2b262 Louis Chauvet 2025-10-16  122  		}
3e4d5b30d2b262 Louis Chauvet 2025-10-16  123  
3e4d5b30d2b262 Louis Chauvet 2025-10-16  124  		config_group_init_type_name(&crtc->group, name, &crtc_item_type);
3e4d5b30d2b262 Louis Chauvet 2025-10-16  125  	}
3e4d5b30d2b262 Louis Chauvet 2025-10-16  126  
3e4d5b30d2b262 Louis Chauvet 2025-10-16  127  	return &crtc->group;
3e4d5b30d2b262 Louis Chauvet 2025-10-16  128  }
3e4d5b30d2b262 Louis Chauvet 2025-10-16  129  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
