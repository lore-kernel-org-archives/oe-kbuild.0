Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3222309DAB
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 12:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766493625; cv=none; b=RXkCzLAtEsnL0qAQU/XNCWYjeX9YfF9/gXurN5FGNmUy2zxx1pwnH1KF21TFXXduaTbGoM38jGSY6jMzzA+OIyiCiFbCgbl1s5kYtr3crU7F3USS+/5jNbmQyGnxUH0RnY+FSpI8dYYG7iUIQO0KKPBicbMz7I1ewlUpk93Hobs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766493625; c=relaxed/simple;
	bh=QrhvRanPCp1RqlxJPE5SALx9q7xLlfT6A+arRacQ41U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oHnJ17JW1MF0bkQaiZWpjRSDh0LoXMdS3rxjP6gaYARYYHvvxm/SE52eHdfStPXZf9TyRDBFk7CLbvaZFv2PE3Ic2viYKqe+SuZJ1zr6e6HMygjf+MT64Z0IVyhW6X9u4ZrSmgj7tJB8TSQY6ql0Qu6HSWtBNR4xPNreUQu9DdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fR22TX17; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fR22TX17"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766493622; x=1798029622;
  h=date:from:to:cc:subject:message-id;
  bh=QrhvRanPCp1RqlxJPE5SALx9q7xLlfT6A+arRacQ41U=;
  b=fR22TX17aBvi2KwD3ZlgNdrv0z0SJ8zNMLDYy/MjvxHQZQ1YAm7eHoax
   ch5pOQ3B0xoo7ZQ5oCrxQeTEE6UgYfjtMa/yOh3L2RimDAmMnP032eQ50
   q3dV8Q9fpYI22se1Ja8bI9AK8GbTAw+Fdc4yTmqeClbZMxUHFLh2VRmrJ
   DAGYfrXdgJKUOxx4duRC2ROev+QzI19ydBQ6gKy5oDXcVLCuuuRuSozfu
   KbewWCAVfdUaV17mH6IN6WpwNuoP31IPLbnNv5p1a4KwzFWgm0OMY/mnU
   HeZWGNq/UWuH4ykm5hFnaS6DK2MarnXJu1Iq23eceew/Be+PVLGm4CiZQ
   g==;
X-CSE-ConnectionGUID: 1r2csK6sSmyLVxpGGqhPBw==
X-CSE-MsgGUID: 66x+CO34R/2Oicpj1ZblDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79458566"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="79458566"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 04:40:21 -0800
X-CSE-ConnectionGUID: Dp4EtPAwS2CM8G0EiO++Ww==
X-CSE-MsgGUID: vaw/9XglQxOhs3iohkCD3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="237182976"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 23 Dec 2025 04:40:19 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY1gX-000000001uD-1eGw;
	Tue, 23 Dec 2025 12:40:17 +0000
Date: Tue, 23 Dec 2025 20:39:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [arm-platforms:kvm-arm64/gicv5-full 80/82]
 arch/arm64/kvm/vgic/vgic-its-v5.c:1213:2-8: preceding lock on line 1181
Message-ID: <202512232029.FJOH3tvX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
TO: Sascha Bischoff <sascha.bischoff@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/gicv5-full
head:   1426b88096b597395df4c82f089b87c62bab45da
commit: e01f1868ec7bf5d212cd8daf67da77fc8c1cd320 [80/82] KVM: arm64: gic-v5: Implement has/set/get attr for ITS MMIO regions
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-r064-20251223 (https://download.01.org/0day-ci/archive/20251223/202512232029.FJOH3tvX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202512232029.FJOH3tvX-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/vgic/vgic-its-v5.c:1213:2-8: preceding lock on line 1181
   arch/arm64/kvm/vgic/vgic-its-v5.c:1213:2-8: preceding lock on line 1188

vim +1213 arch/arm64/kvm/vgic/vgic-its-v5.c

e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1167  
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1168  static int vgic_v5_its_attr_regs_access(struct kvm_device *dev,
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1169  				 struct kvm_device_attr *attr,
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1170  				 u64 *reg, bool is_write)
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1171  {
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1172  	const struct vgic_register_region *region;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1173  	struct vgic_v5_its *its;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1174  	gpa_t addr, offset;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1175  	unsigned int len;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1176  	int align, ret = 0;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1177  
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1178  	its = dev->private;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1179  	offset = attr->attr;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1180  
e01f1868ec7bf5 Sascha Bischoff 2025-09-05 @1181  	mutex_lock(&dev->kvm->lock);
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1182  
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1183  	if (kvm_trylock_all_vcpus(dev->kvm)) {
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1184  		mutex_unlock(&dev->kvm->lock);
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1185  		return -EBUSY;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1186  	}
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1187  
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1188  	mutex_lock(&dev->kvm->arch.config_lock);
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1189  
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1190  	if (IS_VGIC_ADDR_UNDEF(its->vgic_v5_its_base)) {
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1191  		ret = -ENXIO;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1192  		goto out;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1193  	}
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1194  
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1195  	region = vgic_find_mmio_region(vgic_v5_its_registers,
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1196  				       ARRAY_SIZE(vgic_v5_its_registers),
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1197  				       offset);
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1198  	if (!region) {
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1199  		ret = -ENXIO;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1200  		goto out;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1201  	}
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1202  
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1203  	/*
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1204  	 * Although the spec supports upper/lower 32-bit accesses to
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1205  	 * 64-bit ITS registers, the userspace ABI requires 64-bit
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1206  	 * accesses to all 64-bit wide registers. We therefore only
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1207  	 * support 32-bit accesses to 32-bit-wide registers.
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1208  	 */
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1209  	align = region->access_flags & VGIC_ACCESS_64bit ? 0x7 : 0x3;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1210  	len = region->access_flags & VGIC_ACCESS_64bit ? 8 : 4;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1211  
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1212  	if (offset & align)
e01f1868ec7bf5 Sascha Bischoff 2025-09-05 @1213  		return -EINVAL;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1214  
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1215  	addr = its->vgic_v5_its_base + offset;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1216  
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1217  	if (is_write) {
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1218  		region->its_write(dev->kvm, its, addr, len, *reg);
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1219  	} else {
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1220  		*reg = region->its_read(dev->kvm, its, addr, len);
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1221  	}
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1222  out:
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1223  	mutex_unlock(&dev->kvm->arch.config_lock);
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1224  	kvm_unlock_all_vcpus(dev->kvm);
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1225  	mutex_unlock(&dev->kvm->lock);
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1226  
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1227  	return ret;
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1228  }
e01f1868ec7bf5 Sascha Bischoff 2025-09-05  1229  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
