Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AF812F399
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Dec 2024 07:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735197343; cv=none; b=ELST3wgNjSXZgYPpldxzvaHKj/cjVuM6MmtsnA5UIwlwVUv5yBjGgrfkrhiZRUTjfi272O0NxNXZrc1pFEEzIM3XpjaOFZq/NOw40o4Pgf3F8NSYLjEkI1g8GUX4Isv7s6U6H/wvQM7tRy9a56Fa4cABMfYNG3gZptXV2M0nd8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735197343; c=relaxed/simple;
	bh=eNudUhy06UNJy/V4wfMvUKiwoyaSBnAGgXTV1yKCJLs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LJ7vBPL8wvPEJvu5PmB/xpGYPqBWNcM5DkuiP+USSRCwT2mVwCBXSvgc1QZNU63VB/7qSerEflyNQtBLMexdfiU0qhqIgz+b7HQcA5cJLQFVzpBfKCYO+9s/JCSs42iFTWMhlpbe8NImIA7vyaDfJv/wR6AZlKQ4GwGVw1x/CLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbRLxNwU; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbRLxNwU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735197342; x=1766733342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eNudUhy06UNJy/V4wfMvUKiwoyaSBnAGgXTV1yKCJLs=;
  b=FbRLxNwUORoSXVCuUdWBP2RMj/tjML5uCJLAbRRJBgMYAARC39+kauGi
   4q+eYdR58eFTXaQd6UaS0aYMeXxkMxXvogZcxGpUqFZDelb8eVF/GJ28j
   PpiH0fyNDnIIuPJwnwRzwq2fSCx7Pitql0tTQIXv1QyRAiZMISgcvVmFa
   Dm/nl1laKjV+JrMiV7y6I8rDRByQdMr4IJ8cImyTgc/sky9YUfUfeGtRt
   ki8R9LHHQe5+7yxpbT0PxMEilmK5j4Pzy/HwdiDXJ1fhkxbGgAdRjE1BT
   EORCw25jCO2glNTfwp6u0af3jwCn2bfdjOq4qQZ+yk925VQrI+GdAD8xr
   g==;
X-CSE-ConnectionGUID: EQBQFOehRJ+7/8HU+xL7nw==
X-CSE-MsgGUID: IvtuFNDmTWGYwk49FfhNSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="39393675"
X-IronPort-AV: E=Sophos;i="6.12,265,1728975600"; 
   d="scan'208";a="39393675"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 23:15:39 -0800
X-CSE-ConnectionGUID: SdkAmvfxQWKIxmDTcS1lIg==
X-CSE-MsgGUID: pQxVUXqQSHC3NZd8b+3pHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="130846453"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Dec 2024 23:15:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQi5n-0002OE-2H;
	Thu, 26 Dec 2024 07:15:35 +0000
Date: Thu, 26 Dec 2024 15:14:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [intel-lts:6.12/linux 1/1]
 drivers/gpu/drm/virtio/virtgpu_object.c:313 virtio_gpu_object_restore_all()
 error: uninitialized symbol 'ret'.
Message-ID: <202412261554.1TMUmRI5-lkp@intel.com>
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
TO: Dongwon Kim <dongwon.kim@intel.com>
CC: Junxiao Chang <junxiao.chang@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 6.12/linux
head:   af28adffb0fe876a7f6b55f145e6cae4861209a9
commit: 07735a37132102968679d247d7a774cf00ad85d4 [1/1] drm/virtio: save and restore virtio_gpu_objects
:::::: branch date: 6 days ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-141-20241226 (https://download.01.org/0day-ci/archive/20241226/202412261554.1TMUmRI5-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412261554.1TMUmRI5-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/virtio/virtgpu_object.c:313 virtio_gpu_object_restore_all() error: uninitialized symbol 'ret'.

vim +/ret +313 drivers/gpu/drm/virtio/virtgpu_object.c

07735a37132102 Dongwon Kim 2022-08-18  286  
07735a37132102 Dongwon Kim 2022-08-18  287  int virtio_gpu_object_restore_all(struct virtio_gpu_device *vgdev)
07735a37132102 Dongwon Kim 2022-08-18  288  {
07735a37132102 Dongwon Kim 2022-08-18  289  	struct virtio_gpu_object_restore *curr, *tmp;
07735a37132102 Dongwon Kim 2022-08-18  290  	struct virtio_gpu_mem_entry *ents;
07735a37132102 Dongwon Kim 2022-08-18  291  	unsigned int nents;
07735a37132102 Dongwon Kim 2022-08-18  292  	int ret;
07735a37132102 Dongwon Kim 2022-08-18  293  
07735a37132102 Dongwon Kim 2022-08-18  294  	list_for_each_entry_safe(curr, tmp, &vgdev->obj_rec, node) {
07735a37132102 Dongwon Kim 2022-08-18  295  		ret = virtio_gpu_object_shmem_init(vgdev, curr->bo, &ents, &nents);
07735a37132102 Dongwon Kim 2022-08-18  296  		if (ret)
07735a37132102 Dongwon Kim 2022-08-18  297  			break;
07735a37132102 Dongwon Kim 2022-08-18  298  
07735a37132102 Dongwon Kim 2022-08-18  299  		if (curr->params.blob) {
07735a37132102 Dongwon Kim 2022-08-18  300  			virtio_gpu_cmd_resource_create_blob(vgdev, curr->bo, &curr->params,
07735a37132102 Dongwon Kim 2022-08-18  301  							    ents, nents);
07735a37132102 Dongwon Kim 2022-08-18  302  		} else if (curr->params.virgl) {
07735a37132102 Dongwon Kim 2022-08-18  303  			virtio_gpu_cmd_resource_create_3d(vgdev, curr->bo, &curr->params,
07735a37132102 Dongwon Kim 2022-08-18  304  							  NULL, NULL);
07735a37132102 Dongwon Kim 2022-08-18  305  			virtio_gpu_object_attach(vgdev, curr->bo, ents, nents);
07735a37132102 Dongwon Kim 2022-08-18  306  		} else {
07735a37132102 Dongwon Kim 2022-08-18  307  			virtio_gpu_cmd_create_resource(vgdev, curr->bo, &curr->params,
07735a37132102 Dongwon Kim 2022-08-18  308  						       NULL, NULL);
07735a37132102 Dongwon Kim 2022-08-18  309  			virtio_gpu_object_attach(vgdev, curr->bo, ents, nents);
07735a37132102 Dongwon Kim 2022-08-18  310  		}
07735a37132102 Dongwon Kim 2022-08-18  311  	}
07735a37132102 Dongwon Kim 2022-08-18  312  
07735a37132102 Dongwon Kim 2022-08-18 @313  	return ret;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
