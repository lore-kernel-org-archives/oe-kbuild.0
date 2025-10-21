Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FA7157493
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Oct 2025 23:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761091143; cv=none; b=CHedYSyzLt15eCNkJj7LhK5eKjCZaIK5MQ/JLiVFCPrronefhrNSJDtSJIEVwg9AZrZZ4le7GG3MNVsKE1AXaywXCLLPw6AOJwjFAQYDBjoHdQLwFvxC8ZPVUgKIp1GWZzt677c9kGjpm8X/8pSDzgOBtFPw4Q9VjH/t1JfZIDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761091143; c=relaxed/simple;
	bh=w8B7cnO6xCRWh7CrwwDlLm6gyFfi5aVZbhqHCQ/JXJE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nj25JytZ6ylH13i/xgeF2oE+yfcJ9xX7PTuyNvKkD6kMIaetAqjRn0ZLo1hHPcYriHSJbkEo24wPzfcK+HtW5aLwO+EPfFcwaEk1thVeOWNHb/QDSNpS3ySTuoR1wl5AnBCnZ+Q6BAqR8ZPwsGSgVhJh6akoZkHGavhDxMTk+Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WIcrwCcs; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WIcrwCcs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761091141; x=1792627141;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=w8B7cnO6xCRWh7CrwwDlLm6gyFfi5aVZbhqHCQ/JXJE=;
  b=WIcrwCcsxVWZjadlaoxz/YMiyaRyzwCsYLVRiZAyThvSTstyhBbPqovD
   xZaj5ae6Sqhd9x8v9Lki0JyJEcQA9PDB1M/T7HQ6FJCbf8dGTIz5Uo586
   Z9TK9B9cUGKgRiQP1rJhp348EwlZhfGFayve+S9Api+XUeCZIwNvYKgKM
   HotEN6s53e51Q1ehENVmL5pwyp0GTTlar/jtBae3WbieeoalzzpZlYq7L
   hgE0WvVWnKzgjcsoKFnhYL+WSd/GCNRoVxWtgGYW2sR3WgWB8xpRHiXiE
   eBHcU9ZPF5C2IG4PPq+Lc94fEWnPqtht3SpFZcVP4qmyLb7/eXJCVA6KC
   w==;
X-CSE-ConnectionGUID: 8oVFwXV1SMmhG/XPSzUNkQ==
X-CSE-MsgGUID: Bi1dvyH5ShWrRwAth0a+og==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63140790"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="63140790"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 16:59:00 -0700
X-CSE-ConnectionGUID: X1cdbLE2TgimSS9qCPzhJg==
X-CSE-MsgGUID: QeNQzRJsStyDISC6tX9btA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="188126570"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 21 Oct 2025 16:58:59 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBMFk-000BqV-39;
	Tue, 21 Oct 2025 23:58:56 +0000
Date: Wed, 22 Oct 2025 07:58:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/vdpa/vdpa_user/vduse_dev.c:1215:23: sparse: signed value
 source
Message-ID: <202510221040.jczNvwGM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/vdpa/vdpa_user/vduse_dev.c:1215:23: sparse: signed value source"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jason Wang <jasowang@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>
CC: "Eugenio Pérez" <eperezma@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   552c50713f273b494ac6c77052032a49bc9255e2
commit: 1c14b0e4ba988381e362ad8a9651eff0b21bd47f vduse: switch to use virtio map API instead of DMA API
date:   3 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 weeks ago
config: um-randconfig-r123-20251021 (https://download.01.org/0day-ci/archive/20251022/202510221040.jczNvwGM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510221040.jczNvwGM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510221040.jczNvwGM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/vdpa/vdpa_user/vduse_dev.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/vdpa/vdpa_user/vduse_dev.c:1215:23: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/vdpa/vdpa_user/vduse_dev.c:1233:72: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/vdpa/vdpa_user/vduse_dev.c:1320:21: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/vdpa/vdpa_user/vduse_dev.c:1912:23: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/vdpa/vdpa_user/vduse_dev.c:1918:21: sparse: signed value source

vim +1215 drivers/vdpa/vdpa_user/vduse_dev.c

28f6288eb63d59 Xie Yongji        2023-03-23  1153  
c8a6153b6c59d9 Xie Yongji        2021-08-31  1154  static long vduse_dev_ioctl(struct file *file, unsigned int cmd,
c8a6153b6c59d9 Xie Yongji        2021-08-31  1155  			    unsigned long arg)
c8a6153b6c59d9 Xie Yongji        2021-08-31  1156  {
c8a6153b6c59d9 Xie Yongji        2021-08-31  1157  	struct vduse_dev *dev = file->private_data;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1158  	void __user *argp = (void __user *)arg;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1159  	int ret;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1160  
c8a6153b6c59d9 Xie Yongji        2021-08-31  1161  	if (unlikely(dev->broken))
c8a6153b6c59d9 Xie Yongji        2021-08-31  1162  		return -EPERM;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1163  
c8a6153b6c59d9 Xie Yongji        2021-08-31  1164  	switch (cmd) {
c8a6153b6c59d9 Xie Yongji        2021-08-31  1165  	case VDUSE_IOTLB_GET_FD: {
c8a6153b6c59d9 Xie Yongji        2021-08-31  1166  		struct vduse_iotlb_entry entry;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1167  		struct vhost_iotlb_map *map;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1168  		struct vdpa_map_file *map_file;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1169  		struct file *f = NULL;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1170  
c8a6153b6c59d9 Xie Yongji        2021-08-31  1171  		ret = -EFAULT;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1172  		if (copy_from_user(&entry, argp, sizeof(entry)))
c8a6153b6c59d9 Xie Yongji        2021-08-31  1173  			break;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1174  
c8a6153b6c59d9 Xie Yongji        2021-08-31  1175  		ret = -EINVAL;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1176  		if (entry.start > entry.last)
c8a6153b6c59d9 Xie Yongji        2021-08-31  1177  			break;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1178  
d4438d23eeeef8 Xie Yongji        2023-03-23  1179  		mutex_lock(&dev->domain_lock);
d4438d23eeeef8 Xie Yongji        2023-03-23  1180  		if (!dev->domain) {
d4438d23eeeef8 Xie Yongji        2023-03-23  1181  			mutex_unlock(&dev->domain_lock);
d4438d23eeeef8 Xie Yongji        2023-03-23  1182  			break;
d4438d23eeeef8 Xie Yongji        2023-03-23  1183  		}
d4438d23eeeef8 Xie Yongji        2023-03-23  1184  		spin_lock(&dev->domain->iotlb_lock);
d4438d23eeeef8 Xie Yongji        2023-03-23  1185  		map = vhost_iotlb_itree_first(dev->domain->iotlb,
c8a6153b6c59d9 Xie Yongji        2021-08-31  1186  					      entry.start, entry.last);
c8a6153b6c59d9 Xie Yongji        2021-08-31  1187  		if (map) {
c8a6153b6c59d9 Xie Yongji        2021-08-31  1188  			map_file = (struct vdpa_map_file *)map->opaque;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1189  			f = get_file(map_file->file);
c8a6153b6c59d9 Xie Yongji        2021-08-31  1190  			entry.offset = map_file->offset;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1191  			entry.start = map->start;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1192  			entry.last = map->last;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1193  			entry.perm = map->perm;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1194  		}
d4438d23eeeef8 Xie Yongji        2023-03-23  1195  		spin_unlock(&dev->domain->iotlb_lock);
d4438d23eeeef8 Xie Yongji        2023-03-23  1196  		mutex_unlock(&dev->domain_lock);
c8a6153b6c59d9 Xie Yongji        2021-08-31  1197  		ret = -EINVAL;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1198  		if (!f)
c8a6153b6c59d9 Xie Yongji        2021-08-31  1199  			break;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1200  
c8a6153b6c59d9 Xie Yongji        2021-08-31  1201  		ret = -EFAULT;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1202  		if (copy_to_user(argp, &entry, sizeof(entry))) {
c8a6153b6c59d9 Xie Yongji        2021-08-31  1203  			fput(f);
c8a6153b6c59d9 Xie Yongji        2021-08-31  1204  			break;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1205  		}
4e94ddfe2aab72 Christian Brauner 2023-11-30  1206  		ret = receive_fd(f, NULL, perm_to_file_flags(entry.perm));
c8a6153b6c59d9 Xie Yongji        2021-08-31  1207  		fput(f);
c8a6153b6c59d9 Xie Yongji        2021-08-31  1208  		break;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1209  	}
c8a6153b6c59d9 Xie Yongji        2021-08-31  1210  	case VDUSE_DEV_GET_FEATURES:
c8a6153b6c59d9 Xie Yongji        2021-08-31  1211  		/*
c8a6153b6c59d9 Xie Yongji        2021-08-31  1212  		 * Just mirror what driver wrote here.
c8a6153b6c59d9 Xie Yongji        2021-08-31  1213  		 * The driver is expected to check FEATURE_OK later.
c8a6153b6c59d9 Xie Yongji        2021-08-31  1214  		 */
c8a6153b6c59d9 Xie Yongji        2021-08-31 @1215  		ret = put_user(dev->driver_features, (u64 __user *)argp);
c8a6153b6c59d9 Xie Yongji        2021-08-31  1216  		break;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1217  	case VDUSE_DEV_SET_CONFIG: {
c8a6153b6c59d9 Xie Yongji        2021-08-31  1218  		struct vduse_config_data config;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1219  		unsigned long size = offsetof(struct vduse_config_data,
c8a6153b6c59d9 Xie Yongji        2021-08-31  1220  					      buffer);
c8a6153b6c59d9 Xie Yongji        2021-08-31  1221  
c8a6153b6c59d9 Xie Yongji        2021-08-31  1222  		ret = -EFAULT;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1223  		if (copy_from_user(&config, argp, size))
c8a6153b6c59d9 Xie Yongji        2021-08-31  1224  			break;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1225  
c8a6153b6c59d9 Xie Yongji        2021-08-31  1226  		ret = -EINVAL;
ff9f9c6e748481 Dan Carpenter     2021-12-08  1227  		if (config.offset > dev->config_size ||
ff9f9c6e748481 Dan Carpenter     2021-12-08  1228  		    config.length == 0 ||
c8a6153b6c59d9 Xie Yongji        2021-08-31  1229  		    config.length > dev->config_size - config.offset)
c8a6153b6c59d9 Xie Yongji        2021-08-31  1230  			break;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1231  
c8a6153b6c59d9 Xie Yongji        2021-08-31  1232  		ret = -EFAULT;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1233  		if (copy_from_user(dev->config + config.offset, argp + size,
c8a6153b6c59d9 Xie Yongji        2021-08-31  1234  				   config.length))
c8a6153b6c59d9 Xie Yongji        2021-08-31  1235  			break;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1236  
c8a6153b6c59d9 Xie Yongji        2021-08-31  1237  		ret = 0;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1238  		break;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1239  	}
c8a6153b6c59d9 Xie Yongji        2021-08-31  1240  	case VDUSE_DEV_INJECT_CONFIG_IRQ:
28f6288eb63d59 Xie Yongji        2023-03-23  1241  		ret = vduse_dev_queue_irq_work(dev, &dev->inject, IRQ_UNBOUND);
c8a6153b6c59d9 Xie Yongji        2021-08-31  1242  		break;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1243  	case VDUSE_VQ_SETUP: {
c8a6153b6c59d9 Xie Yongji        2021-08-31  1244  		struct vduse_vq_config config;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1245  		u32 index;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1246  
c8a6153b6c59d9 Xie Yongji        2021-08-31  1247  		ret = -EFAULT;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1248  		if (copy_from_user(&config, argp, sizeof(config)))
c8a6153b6c59d9 Xie Yongji        2021-08-31  1249  			break;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1250  
c8a6153b6c59d9 Xie Yongji        2021-08-31  1251  		ret = -EINVAL;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1252  		if (config.index >= dev->vq_num)
c8a6153b6c59d9 Xie Yongji        2021-08-31  1253  			break;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1254  
c8a6153b6c59d9 Xie Yongji        2021-08-31  1255  		if (!is_mem_zero((const char *)config.reserved,
c8a6153b6c59d9 Xie Yongji        2021-08-31  1256  				 sizeof(config.reserved)))
c8a6153b6c59d9 Xie Yongji        2021-08-31  1257  			break;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1258  
c8a6153b6c59d9 Xie Yongji        2021-08-31  1259  		index = array_index_nospec(config.index, dev->vq_num);
78885597b9ccf6 Xie Yongji        2023-03-23  1260  		dev->vqs[index]->num_max = config.max_size;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1261  		ret = 0;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1262  		break;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1263  	}
c8a6153b6c59d9 Xie Yongji        2021-08-31  1264  	case VDUSE_VQ_GET_INFO: {
c8a6153b6c59d9 Xie Yongji        2021-08-31  1265  		struct vduse_vq_info vq_info;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1266  		struct vduse_virtqueue *vq;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1267  		u32 index;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1268  
c8a6153b6c59d9 Xie Yongji        2021-08-31  1269  		ret = -EFAULT;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1270  		if (copy_from_user(&vq_info, argp, sizeof(vq_info)))
c8a6153b6c59d9 Xie Yongji        2021-08-31  1271  			break;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1272  
c8a6153b6c59d9 Xie Yongji        2021-08-31  1273  		ret = -EINVAL;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1274  		if (vq_info.index >= dev->vq_num)
c8a6153b6c59d9 Xie Yongji        2021-08-31  1275  			break;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1276  
c8a6153b6c59d9 Xie Yongji        2021-08-31  1277  		index = array_index_nospec(vq_info.index, dev->vq_num);
78885597b9ccf6 Xie Yongji        2023-03-23  1278  		vq = dev->vqs[index];
c8a6153b6c59d9 Xie Yongji        2021-08-31  1279  		vq_info.desc_addr = vq->desc_addr;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1280  		vq_info.driver_addr = vq->driver_addr;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1281  		vq_info.device_addr = vq->device_addr;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1282  		vq_info.num = vq->num;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1283  
c8a6153b6c59d9 Xie Yongji        2021-08-31  1284  		if (dev->driver_features & BIT_ULL(VIRTIO_F_RING_PACKED)) {
c8a6153b6c59d9 Xie Yongji        2021-08-31  1285  			vq_info.packed.last_avail_counter =
c8a6153b6c59d9 Xie Yongji        2021-08-31  1286  				vq->state.packed.last_avail_counter;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1287  			vq_info.packed.last_avail_idx =
c8a6153b6c59d9 Xie Yongji        2021-08-31  1288  				vq->state.packed.last_avail_idx;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1289  			vq_info.packed.last_used_counter =
c8a6153b6c59d9 Xie Yongji        2021-08-31  1290  				vq->state.packed.last_used_counter;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1291  			vq_info.packed.last_used_idx =
c8a6153b6c59d9 Xie Yongji        2021-08-31  1292  				vq->state.packed.last_used_idx;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1293  		} else
c8a6153b6c59d9 Xie Yongji        2021-08-31  1294  			vq_info.split.avail_index =
c8a6153b6c59d9 Xie Yongji        2021-08-31  1295  				vq->state.split.avail_index;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1296  
c8a6153b6c59d9 Xie Yongji        2021-08-31  1297  		vq_info.ready = vq->ready;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1298  
c8a6153b6c59d9 Xie Yongji        2021-08-31  1299  		ret = -EFAULT;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1300  		if (copy_to_user(argp, &vq_info, sizeof(vq_info)))
c8a6153b6c59d9 Xie Yongji        2021-08-31  1301  			break;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1302  
c8a6153b6c59d9 Xie Yongji        2021-08-31  1303  		ret = 0;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1304  		break;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1305  	}
c8a6153b6c59d9 Xie Yongji        2021-08-31  1306  	case VDUSE_VQ_SETUP_KICKFD: {
c8a6153b6c59d9 Xie Yongji        2021-08-31  1307  		struct vduse_vq_eventfd eventfd;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1308  
c8a6153b6c59d9 Xie Yongji        2021-08-31  1309  		ret = -EFAULT;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1310  		if (copy_from_user(&eventfd, argp, sizeof(eventfd)))
c8a6153b6c59d9 Xie Yongji        2021-08-31  1311  			break;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1312  
c8a6153b6c59d9 Xie Yongji        2021-08-31  1313  		ret = vduse_kickfd_setup(dev, &eventfd);
c8a6153b6c59d9 Xie Yongji        2021-08-31  1314  		break;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1315  	}
c8a6153b6c59d9 Xie Yongji        2021-08-31  1316  	case VDUSE_VQ_INJECT_IRQ: {
c8a6153b6c59d9 Xie Yongji        2021-08-31  1317  		u32 index;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1318  
c8a6153b6c59d9 Xie Yongji        2021-08-31  1319  		ret = -EFAULT;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1320  		if (get_user(index, (u32 __user *)argp))
c8a6153b6c59d9 Xie Yongji        2021-08-31  1321  			break;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1322  
c8a6153b6c59d9 Xie Yongji        2021-08-31  1323  		ret = -EINVAL;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1324  		if (index >= dev->vq_num)
c8a6153b6c59d9 Xie Yongji        2021-08-31  1325  			break;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1326  
e38632dd71818d Xie Yongji        2023-03-23  1327  		ret = 0;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1328  		index = array_index_nospec(index, dev->vq_num);
e38632dd71818d Xie Yongji        2023-03-23  1329  		if (!vduse_vq_signal_irqfd(dev->vqs[index])) {
28f6288eb63d59 Xie Yongji        2023-03-23  1330  			vduse_vq_update_effective_cpu(dev->vqs[index]);
e38632dd71818d Xie Yongji        2023-03-23  1331  			ret = vduse_dev_queue_irq_work(dev,
e38632dd71818d Xie Yongji        2023-03-23  1332  						&dev->vqs[index]->inject,
28f6288eb63d59 Xie Yongji        2023-03-23  1333  						dev->vqs[index]->irq_effective_cpu);
e38632dd71818d Xie Yongji        2023-03-23  1334  		}
c8a6153b6c59d9 Xie Yongji        2021-08-31  1335  		break;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1336  	}
79a463be9e0051 Xie Yongji        2022-08-03  1337  	case VDUSE_IOTLB_REG_UMEM: {
79a463be9e0051 Xie Yongji        2022-08-03  1338  		struct vduse_iova_umem umem;
79a463be9e0051 Xie Yongji        2022-08-03  1339  
79a463be9e0051 Xie Yongji        2022-08-03  1340  		ret = -EFAULT;
79a463be9e0051 Xie Yongji        2022-08-03  1341  		if (copy_from_user(&umem, argp, sizeof(umem)))
79a463be9e0051 Xie Yongji        2022-08-03  1342  			break;
79a463be9e0051 Xie Yongji        2022-08-03  1343  
79a463be9e0051 Xie Yongji        2022-08-03  1344  		ret = -EINVAL;
79a463be9e0051 Xie Yongji        2022-08-03  1345  		if (!is_mem_zero((const char *)umem.reserved,
79a463be9e0051 Xie Yongji        2022-08-03  1346  				 sizeof(umem.reserved)))
79a463be9e0051 Xie Yongji        2022-08-03  1347  			break;
79a463be9e0051 Xie Yongji        2022-08-03  1348  
d4438d23eeeef8 Xie Yongji        2023-03-23  1349  		mutex_lock(&dev->domain_lock);
79a463be9e0051 Xie Yongji        2022-08-03  1350  		ret = vduse_dev_reg_umem(dev, umem.iova,
79a463be9e0051 Xie Yongji        2022-08-03  1351  					 umem.uaddr, umem.size);
d4438d23eeeef8 Xie Yongji        2023-03-23  1352  		mutex_unlock(&dev->domain_lock);
79a463be9e0051 Xie Yongji        2022-08-03  1353  		break;
79a463be9e0051 Xie Yongji        2022-08-03  1354  	}
79a463be9e0051 Xie Yongji        2022-08-03  1355  	case VDUSE_IOTLB_DEREG_UMEM: {
79a463be9e0051 Xie Yongji        2022-08-03  1356  		struct vduse_iova_umem umem;
79a463be9e0051 Xie Yongji        2022-08-03  1357  
79a463be9e0051 Xie Yongji        2022-08-03  1358  		ret = -EFAULT;
79a463be9e0051 Xie Yongji        2022-08-03  1359  		if (copy_from_user(&umem, argp, sizeof(umem)))
79a463be9e0051 Xie Yongji        2022-08-03  1360  			break;
79a463be9e0051 Xie Yongji        2022-08-03  1361  
79a463be9e0051 Xie Yongji        2022-08-03  1362  		ret = -EINVAL;
79a463be9e0051 Xie Yongji        2022-08-03  1363  		if (!is_mem_zero((const char *)umem.reserved,
79a463be9e0051 Xie Yongji        2022-08-03  1364  				 sizeof(umem.reserved)))
79a463be9e0051 Xie Yongji        2022-08-03  1365  			break;
d4438d23eeeef8 Xie Yongji        2023-03-23  1366  		mutex_lock(&dev->domain_lock);
79a463be9e0051 Xie Yongji        2022-08-03  1367  		ret = vduse_dev_dereg_umem(dev, umem.iova,
79a463be9e0051 Xie Yongji        2022-08-03  1368  					   umem.size);
d4438d23eeeef8 Xie Yongji        2023-03-23  1369  		mutex_unlock(&dev->domain_lock);
79a463be9e0051 Xie Yongji        2022-08-03  1370  		break;
79a463be9e0051 Xie Yongji        2022-08-03  1371  	}
ad146355bfad62 Xie Yongji        2022-08-03  1372  	case VDUSE_IOTLB_GET_INFO: {
ad146355bfad62 Xie Yongji        2022-08-03  1373  		struct vduse_iova_info info;
ad146355bfad62 Xie Yongji        2022-08-03  1374  		struct vhost_iotlb_map *map;
ad146355bfad62 Xie Yongji        2022-08-03  1375  
ad146355bfad62 Xie Yongji        2022-08-03  1376  		ret = -EFAULT;
ad146355bfad62 Xie Yongji        2022-08-03  1377  		if (copy_from_user(&info, argp, sizeof(info)))
ad146355bfad62 Xie Yongji        2022-08-03  1378  			break;
ad146355bfad62 Xie Yongji        2022-08-03  1379  
ad146355bfad62 Xie Yongji        2022-08-03  1380  		ret = -EINVAL;
ad146355bfad62 Xie Yongji        2022-08-03  1381  		if (info.start > info.last)
ad146355bfad62 Xie Yongji        2022-08-03  1382  			break;
ad146355bfad62 Xie Yongji        2022-08-03  1383  
ad146355bfad62 Xie Yongji        2022-08-03  1384  		if (!is_mem_zero((const char *)info.reserved,
ad146355bfad62 Xie Yongji        2022-08-03  1385  				 sizeof(info.reserved)))
ad146355bfad62 Xie Yongji        2022-08-03  1386  			break;
ad146355bfad62 Xie Yongji        2022-08-03  1387  
d4438d23eeeef8 Xie Yongji        2023-03-23  1388  		mutex_lock(&dev->domain_lock);
d4438d23eeeef8 Xie Yongji        2023-03-23  1389  		if (!dev->domain) {
d4438d23eeeef8 Xie Yongji        2023-03-23  1390  			mutex_unlock(&dev->domain_lock);
d4438d23eeeef8 Xie Yongji        2023-03-23  1391  			break;
d4438d23eeeef8 Xie Yongji        2023-03-23  1392  		}
d4438d23eeeef8 Xie Yongji        2023-03-23  1393  		spin_lock(&dev->domain->iotlb_lock);
d4438d23eeeef8 Xie Yongji        2023-03-23  1394  		map = vhost_iotlb_itree_first(dev->domain->iotlb,
ad146355bfad62 Xie Yongji        2022-08-03  1395  					      info.start, info.last);
ad146355bfad62 Xie Yongji        2022-08-03  1396  		if (map) {
ad146355bfad62 Xie Yongji        2022-08-03  1397  			info.start = map->start;
ad146355bfad62 Xie Yongji        2022-08-03  1398  			info.last = map->last;
ad146355bfad62 Xie Yongji        2022-08-03  1399  			info.capability = 0;
d4438d23eeeef8 Xie Yongji        2023-03-23  1400  			if (dev->domain->bounce_map && map->start == 0 &&
d4438d23eeeef8 Xie Yongji        2023-03-23  1401  			    map->last == dev->domain->bounce_size - 1)
ad146355bfad62 Xie Yongji        2022-08-03  1402  				info.capability |= VDUSE_IOVA_CAP_UMEM;
ad146355bfad62 Xie Yongji        2022-08-03  1403  		}
d4438d23eeeef8 Xie Yongji        2023-03-23  1404  		spin_unlock(&dev->domain->iotlb_lock);
d4438d23eeeef8 Xie Yongji        2023-03-23  1405  		mutex_unlock(&dev->domain_lock);
ad146355bfad62 Xie Yongji        2022-08-03  1406  		if (!map)
ad146355bfad62 Xie Yongji        2022-08-03  1407  			break;
ad146355bfad62 Xie Yongji        2022-08-03  1408  
ad146355bfad62 Xie Yongji        2022-08-03  1409  		ret = -EFAULT;
ad146355bfad62 Xie Yongji        2022-08-03  1410  		if (copy_to_user(argp, &info, sizeof(info)))
ad146355bfad62 Xie Yongji        2022-08-03  1411  			break;
ad146355bfad62 Xie Yongji        2022-08-03  1412  
ad146355bfad62 Xie Yongji        2022-08-03  1413  		ret = 0;
ad146355bfad62 Xie Yongji        2022-08-03  1414  		break;
ad146355bfad62 Xie Yongji        2022-08-03  1415  	}
c8a6153b6c59d9 Xie Yongji        2021-08-31  1416  	default:
c8a6153b6c59d9 Xie Yongji        2021-08-31  1417  		ret = -ENOIOCTLCMD;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1418  		break;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1419  	}
c8a6153b6c59d9 Xie Yongji        2021-08-31  1420  
c8a6153b6c59d9 Xie Yongji        2021-08-31  1421  	return ret;
c8a6153b6c59d9 Xie Yongji        2021-08-31  1422  }
c8a6153b6c59d9 Xie Yongji        2021-08-31  1423  

:::::: The code at line 1215 was first introduced by commit
:::::: c8a6153b6c59d95c0e091f053f6f180952ade91e vduse: Introduce VDUSE - vDPA Device in Userspace

:::::: TO: Xie Yongji <xieyongji@bytedance.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
