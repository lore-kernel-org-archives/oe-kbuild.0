Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B66730215A
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Feb 2026 11:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771242293; cv=none; b=awX1INOVqxYteQjDKEDEeeL+rZZeR2CrNi6NHvjPydRDbFx40eqlIq6mBfSzhcOVoCQTmBvr3y+YCveUH7BPYocWgEVG6yap/wMnLOW2BHQguKrDa2LnZVaLHKj4LMDo/Qi2xonXbIpGFaz3bf08+YePcTAKMDz5JUIiHZI0vsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771242293; c=relaxed/simple;
	bh=YBp3HZ585iTbJDm5NX4XMUyPBzE6wPjaQOIOai+VzO0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z/X5ZyfD+GB8QqDmOYgnzVHfin//wsNsadlppDy+ZlYV6nV7QY4tYx3znO2LbzmSSIqoHiCE7k2X+obXT1G9Z3TCvAmOoqOiUfIrdCLvk/FJe1TOrT0c0yUlKNJe+QfdZ4LVJBEWbHlNyRcqP8xatwOCbg2dcJuYmzXdxpUTpzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aFEoIS2W; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aFEoIS2W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771242292; x=1802778292;
  h=date:from:to:cc:subject:message-id;
  bh=YBp3HZ585iTbJDm5NX4XMUyPBzE6wPjaQOIOai+VzO0=;
  b=aFEoIS2Wu9IhXcUnVivaDBN60cuQ3YVBgxW3yOY5ixjGpxhEbzgVJCJV
   u0oRKknsZevTz7sDoC7Vr/wM+4vSXMvkfL9iRSNd+tqOKmefENG+KYHbu
   tnryG1B8+nAbZwaAZwFruLWmMyHXWX2Btm2l6b7v0rwqTKM/fFXPwRDEm
   0c9ZhSzDj7087or3CQm2Jq/NmYI3Wnxloneq9XZSMs7RDyaSsxRg4IZQc
   TFobLfkAGg2dP7hJVeSRrfcmBkOVMDcTBfi0PNV7HKMEkV+7V2jhoBKLt
   h45Jmz5lBzYT/R2KjtUMRwoX+2fTYOJHLKGlKVGPVX1KEc/qxdARNvElK
   A==;
X-CSE-ConnectionGUID: WQFquw1dRs+Nf8fdiIVIFg==
X-CSE-MsgGUID: Y24nQcj6Rem+edketgH+dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72227986"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="72227986"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 03:44:50 -0800
X-CSE-ConnectionGUID: UVfiC8QeSkShT/TSb7BxGQ==
X-CSE-MsgGUID: AjG7fQ7cQrCIQkbxZa/CcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="212838019"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Feb 2026 03:44:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrx1y-00000000zid-2ZkX;
	Mon, 16 Feb 2026 11:44:46 +0000
Date: Mon, 16 Feb 2026 19:44:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:264
 nvkm_acr_lsfw_load_bl_inst_data_sig() warn: passing zero to 'PTR_ERR'
Message-ID: <202602161908.jJxiWpqy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tiwei Bie <tiwei.btw@antgroup.com>
CC: Johannes Berg <johannes.berg@intel.com>

Hi Tiwei,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f2acd3148e0ef42bdacbd477f90e8533f96b2ac
commit: a0e2cb6a90634f3dc80f16e882a683ee5761b0b0 um: Add VFIO-based virtual PCI driver
date:   10 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 10 months ago
config: um-randconfig-r071-20260215 (https://download.01.org/0day-ci/archive/20260216/202602161908.jJxiWpqy-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602161908.jJxiWpqy-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:264 nvkm_acr_lsfw_load_bl_inst_data_sig() warn: passing zero to 'PTR_ERR'
drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.c:188 gk104_pcie_set_link() warn: error code type promoted to positive: 'lnk_cap_speed'

Old smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:349 nvkm_acr_lsfw_load_bl_sig_net() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +264 drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c

4b569ded09fdad Ben Skeggs 2022-06-01  247  
c63fe2e704e2c1 Ben Skeggs 2020-01-15  248  int
c63fe2e704e2c1 Ben Skeggs 2020-01-15  249  nvkm_acr_lsfw_load_bl_inst_data_sig(struct nvkm_subdev *subdev,
c63fe2e704e2c1 Ben Skeggs 2020-01-15  250  				    struct nvkm_falcon *falcon,
c63fe2e704e2c1 Ben Skeggs 2020-01-15  251  				    enum nvkm_acr_lsf_id id,
c63fe2e704e2c1 Ben Skeggs 2020-01-15  252  				    const char *path, int ver,
c63fe2e704e2c1 Ben Skeggs 2020-01-15  253  				    const struct nvkm_acr_lsf_func *func)
c63fe2e704e2c1 Ben Skeggs 2020-01-15  254  {
c63fe2e704e2c1 Ben Skeggs 2020-01-15  255  	struct nvkm_acr *acr = subdev->device->acr;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  256  	struct nvkm_acr_lsfw *lsfw;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  257  	const struct firmware *bl = NULL, *inst = NULL, *data = NULL;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  258  	const struct nvfw_bin_hdr *hdr;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  259  	const struct nvfw_bl_desc *desc;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  260  	u32 *bldata;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  261  	int ret;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  262  
c63fe2e704e2c1 Ben Skeggs 2020-01-15  263  	if (IS_ERR((lsfw = nvkm_acr_lsfw_add(func, acr, falcon, id))))
c63fe2e704e2c1 Ben Skeggs 2020-01-15 @264  		return PTR_ERR(lsfw);
c63fe2e704e2c1 Ben Skeggs 2020-01-15  265  
c63fe2e704e2c1 Ben Skeggs 2020-01-15  266  	ret = nvkm_firmware_load_name(subdev, path, "bl", ver, &bl);
c63fe2e704e2c1 Ben Skeggs 2020-01-15  267  	if (ret)
c63fe2e704e2c1 Ben Skeggs 2020-01-15  268  		goto done;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  269  
c63fe2e704e2c1 Ben Skeggs 2020-01-15  270  	hdr = nvfw_bin_hdr(subdev, bl->data);
c63fe2e704e2c1 Ben Skeggs 2020-01-15  271  	desc = nvfw_bl_desc(subdev, bl->data + hdr->header_offset);
c63fe2e704e2c1 Ben Skeggs 2020-01-15  272  	bldata = (void *)(bl->data + hdr->data_offset);
c63fe2e704e2c1 Ben Skeggs 2020-01-15  273  
c63fe2e704e2c1 Ben Skeggs 2020-01-15  274  	ret = nvkm_firmware_load_name(subdev, path, "inst", ver, &inst);
c63fe2e704e2c1 Ben Skeggs 2020-01-15  275  	if (ret)
c63fe2e704e2c1 Ben Skeggs 2020-01-15  276  		goto done;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  277  
c63fe2e704e2c1 Ben Skeggs 2020-01-15  278  	ret = nvkm_firmware_load_name(subdev, path, "data", ver, &data);
c63fe2e704e2c1 Ben Skeggs 2020-01-15  279  	if (ret)
c63fe2e704e2c1 Ben Skeggs 2020-01-15  280  		goto done;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  281  
c63fe2e704e2c1 Ben Skeggs 2020-01-15  282  	ret = nvkm_firmware_load_name(subdev, path, "sig", ver, &lsfw->sig);
c63fe2e704e2c1 Ben Skeggs 2020-01-15  283  	if (ret)
c63fe2e704e2c1 Ben Skeggs 2020-01-15  284  		goto done;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  285  
c63fe2e704e2c1 Ben Skeggs 2020-01-15  286  	lsfw->bootloader_size = ALIGN(desc->code_size, 256);
c63fe2e704e2c1 Ben Skeggs 2020-01-15  287  	lsfw->bootloader_imem_offset = desc->start_tag << 8;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  288  
c63fe2e704e2c1 Ben Skeggs 2020-01-15  289  	lsfw->app_start_offset = lsfw->bootloader_size;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  290  	lsfw->app_imem_entry = 0;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  291  	lsfw->app_resident_code_offset = 0;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  292  	lsfw->app_resident_code_size = ALIGN(inst->size, 256);
c63fe2e704e2c1 Ben Skeggs 2020-01-15  293  	lsfw->app_resident_data_offset = lsfw->app_resident_code_size;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  294  	lsfw->app_resident_data_size = ALIGN(data->size, 256);
c63fe2e704e2c1 Ben Skeggs 2020-01-15  295  	lsfw->app_size = lsfw->app_resident_code_size +
c63fe2e704e2c1 Ben Skeggs 2020-01-15  296  			 lsfw->app_resident_data_size;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  297  
c63fe2e704e2c1 Ben Skeggs 2020-01-15  298  	lsfw->img.size = lsfw->bootloader_size + lsfw->app_size;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  299  	if (!(lsfw->img.data = kzalloc(lsfw->img.size, GFP_KERNEL))) {
c63fe2e704e2c1 Ben Skeggs 2020-01-15  300  		ret = -ENOMEM;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  301  		goto done;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  302  	}
c63fe2e704e2c1 Ben Skeggs 2020-01-15  303  
c63fe2e704e2c1 Ben Skeggs 2020-01-15  304  	memcpy(lsfw->img.data, bldata, lsfw->bootloader_size);
c63fe2e704e2c1 Ben Skeggs 2020-01-15  305  	memcpy(lsfw->img.data + lsfw->app_start_offset +
c63fe2e704e2c1 Ben Skeggs 2020-01-15  306  	       lsfw->app_resident_code_offset, inst->data, inst->size);
c63fe2e704e2c1 Ben Skeggs 2020-01-15  307  	memcpy(lsfw->img.data + lsfw->app_start_offset +
c63fe2e704e2c1 Ben Skeggs 2020-01-15  308  	       lsfw->app_resident_data_offset, data->data, data->size);
c63fe2e704e2c1 Ben Skeggs 2020-01-15  309  
c63fe2e704e2c1 Ben Skeggs 2020-01-15  310  	lsfw->ucode_size = ALIGN(lsfw->app_resident_data_offset, 256) +
c63fe2e704e2c1 Ben Skeggs 2020-01-15  311  			   lsfw->bootloader_size;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  312  	lsfw->data_size = lsfw->app_size + lsfw->bootloader_size -
c63fe2e704e2c1 Ben Skeggs 2020-01-15  313  			  lsfw->ucode_size;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  314  
c63fe2e704e2c1 Ben Skeggs 2020-01-15  315  done:
c63fe2e704e2c1 Ben Skeggs 2020-01-15  316  	if (ret)
c63fe2e704e2c1 Ben Skeggs 2020-01-15  317  		nvkm_acr_lsfw_del(lsfw);
c63fe2e704e2c1 Ben Skeggs 2020-01-15  318  	nvkm_firmware_put(data);
c63fe2e704e2c1 Ben Skeggs 2020-01-15  319  	nvkm_firmware_put(inst);
c63fe2e704e2c1 Ben Skeggs 2020-01-15  320  	nvkm_firmware_put(bl);
c63fe2e704e2c1 Ben Skeggs 2020-01-15  321  	return ret;
c63fe2e704e2c1 Ben Skeggs 2020-01-15  322  }
c4bdac754ca0bb Ben Skeggs 2022-06-01  323  

:::::: The code at line 264 was first introduced by commit
:::::: c63fe2e704e2c1fa9a4614f31a567925d00503f1 drm/nouveau/acr: add loaders for currently available LS firmware images

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Ben Skeggs <bskeggs@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
