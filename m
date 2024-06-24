Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6254A1E
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Jun 2024 00:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719189319; cv=none; b=IQ7ikgjRI+mVJ7u6JDPjnP6EGr1Se0xtNYOYX2CwRnfEyG5SDtulPGxY5nK8RCyYwbWiYndpRjqLu/EuZ3KNIUDHDG05nhrZ4L+FQYn+giC0VmjgQ+e0E9y9YFH9uG4Gt4q88UEBLEj/r30qYBkMTafk+fMo5wE9XcedW0g6XZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719189319; c=relaxed/simple;
	bh=OZBjD2cmCbVW4ecyjlbc24rI7M+SmSv6+b/KW0bT+ho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q0ffXqw3jb6Z6rlQX7A1h7trwdoy3fdedlEI97elBuDIa/+WV7PREzeU/TDwgvZPpgFtaDkof49nciXy8Xt09xqJSIZTiXYS9KFDBYBep7aVFBSwEQFp8Mamz3NTfuwq9r07bRnEL2yZ5If2mRJnr8p7eG6wJOv6xxaEX68tM1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OWrEQXyY; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWrEQXyY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719189317; x=1750725317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OZBjD2cmCbVW4ecyjlbc24rI7M+SmSv6+b/KW0bT+ho=;
  b=OWrEQXyYlUgnSyrx8kwmxRFvzI49v5kg1nOxNtUEhEU8TTzBo9a/YKvI
   ktNIXC0LkifjlO3rJym4E8aM7WBQ18NoImtRiDyroSqYEkpgdEM3fd8LD
   Bg7nytzS1xqo30ioYyLQImMB56c5BWFJa/MNQmHYsnfR6IB92gEgPP4Us
   xOODF7ukAqxM3dxQVJEJkd6jpAU38Ck+rQUEwQibrZptc6miqXv6N5Kbq
   +sgfnT3+/kkA/KQIIcTYvuasAfRcYN5kSXOI3f6SscP0OocG2GSbJlztL
   nf8JVrO5PZ0FY9wfJmsizdq8Y+zvK/BMMiuWCoVlOzWXLfzaT8UPCde1A
   w==;
X-CSE-ConnectionGUID: rDh+pxvMSL2q+5xM4FK9LA==
X-CSE-MsgGUID: VHSBHrvLS26u7I+3nnl05w==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="19919737"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="19919737"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2024 17:35:16 -0700
X-CSE-ConnectionGUID: ca1yF9MlRZW6VhmUprBEzw==
X-CSE-MsgGUID: GwqROZBfT52H/zJ102i6yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; 
   d="scan'208";a="73883338"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Jun 2024 17:35:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLXfs-000Bne-0G;
	Mon, 24 Jun 2024 00:35:12 +0000
Date: Mon, 24 Jun 2024 08:34:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:openEuler-1.0-LTS 20772/23028] drivers/block/loop.c:1338
 loop_set_status() warn: inconsistent returns '&loop_ctl_mutex'.
Message-ID: <202406240806.3IaHRTVb-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Yongqiang Liu <duanzi@zju.edu.cn>

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   10a294b680ddfda97a09883fe559dd418e5340cd
commit: 1472bb0a05bd28cae465d19e9ab40c13c8f2a716 [20772/23028] loop: Check for overflow while configuring loop
:::::: branch date: 2 days ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-161-20240430 (https://download.01.org/0day-ci/archive/20240624/202406240806.3IaHRTVb-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406240806.3IaHRTVb-lkp@intel.com/

New smatch warnings:
drivers/block/loop.c:1338 loop_set_status() warn: inconsistent returns '&loop_ctl_mutex'.

Old smatch warnings:
drivers/block/loop.c:785 loop_attr_backing_file_show() warn: passing zero to 'PTR_ERR'
drivers/block/loop.c:2019 loop_add() warn: passing zero to 'PTR_ERR'

vim +1338 drivers/block/loop.c

04799b3a91ea371 Jan Kara          2018-11-08  1216  
^1da177e4c3f415 Linus Torvalds    2005-04-16  1217  static int
^1da177e4c3f415 Linus Torvalds    2005-04-16  1218  loop_set_status(struct loop_device *lo, const struct loop_info64 *info)
^1da177e4c3f415 Linus Torvalds    2005-04-16  1219  {
^1da177e4c3f415 Linus Torvalds    2005-04-16  1220  	int err;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1221  	struct loop_func_table *xfer;
e4849737f76c876 Eric W. Biederman 2012-02-11  1222  	kuid_t uid = current_uid();
2a7d01129974075 Jan Kara          2018-11-08  1223  	struct block_device *bdev;
2a7d01129974075 Jan Kara          2018-11-08  1224  	bool partscan = false;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1225  
afa528900c5f5ca Jan Kara          2018-11-08  1226  	err = mutex_lock_killable(&loop_ctl_mutex);
cb26630f0424088 Jan Kara          2018-11-08  1227  	if (err)
cb26630f0424088 Jan Kara          2018-11-08  1228  		return err;
b0fafa816ece008 David Howells     2008-11-14  1229  	if (lo->lo_encrypt_key_size &&
e4849737f76c876 Eric W. Biederman 2012-02-11  1230  	    !uid_eq(lo->lo_key_owner, uid) &&
cb26630f0424088 Jan Kara          2018-11-08  1231  	    !capable(CAP_SYS_ADMIN)) {
cb26630f0424088 Jan Kara          2018-11-08  1232  		err = -EPERM;
cb26630f0424088 Jan Kara          2018-11-08  1233  		goto out_unlock;
cb26630f0424088 Jan Kara          2018-11-08  1234  	}
cb26630f0424088 Jan Kara          2018-11-08  1235  	if (lo->lo_state != Lo_bound) {
cb26630f0424088 Jan Kara          2018-11-08  1236  		err = -ENXIO;
cb26630f0424088 Jan Kara          2018-11-08  1237  		goto out_unlock;
cb26630f0424088 Jan Kara          2018-11-08  1238  	}
cb26630f0424088 Jan Kara          2018-11-08  1239  	if ((unsigned int) info->lo_encrypt_key_size > LO_KEY_SIZE) {
cb26630f0424088 Jan Kara          2018-11-08  1240  		err = -EINVAL;
cb26630f0424088 Jan Kara          2018-11-08  1241  		goto out_unlock;
cb26630f0424088 Jan Kara          2018-11-08  1242  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  1243  
5aa6c2bd16d7977 Jaegeuk Kim       2019-01-09  1244  	if (lo->lo_offset != info->lo_offset ||
5aa6c2bd16d7977 Jaegeuk Kim       2019-01-09  1245  	    lo->lo_sizelimit != info->lo_sizelimit) {
5aa6c2bd16d7977 Jaegeuk Kim       2019-01-09  1246  		sync_blockdev(lo->lo_device);
2476d843de47880 Zheng Bin         2020-09-22  1247  		invalidate_bdev(lo->lo_device);
5aa6c2bd16d7977 Jaegeuk Kim       2019-01-09  1248  	}
5aa6c2bd16d7977 Jaegeuk Kim       2019-01-09  1249  
ecdd09597a57251 Ming Lei          2017-02-11  1250  	/* I/O need to be drained during transfer transition */
ecdd09597a57251 Ming Lei          2017-02-11  1251  	blk_mq_freeze_queue(lo->lo_queue);
ecdd09597a57251 Ming Lei          2017-02-11  1252  
^1da177e4c3f415 Linus Torvalds    2005-04-16  1253  	err = loop_release_xfer(lo);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1254  	if (err)
cb26630f0424088 Jan Kara          2018-11-08  1255  		goto out_unfreeze;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1256  
^1da177e4c3f415 Linus Torvalds    2005-04-16  1257  	if (info->lo_encrypt_type) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  1258  		unsigned int type = info->lo_encrypt_type;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1259  
1e047eaab3bb556 Tetsuo Handa      2018-04-06  1260  		if (type >= MAX_LO_CRYPT) {
1e047eaab3bb556 Tetsuo Handa      2018-04-06  1261  			err = -EINVAL;
cb26630f0424088 Jan Kara          2018-11-08  1262  			goto out_unfreeze;
1e047eaab3bb556 Tetsuo Handa      2018-04-06  1263  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  1264  		xfer = xfer_funcs[type];
1e047eaab3bb556 Tetsuo Handa      2018-04-06  1265  		if (xfer == NULL) {
1e047eaab3bb556 Tetsuo Handa      2018-04-06  1266  			err = -EINVAL;
cb26630f0424088 Jan Kara          2018-11-08  1267  			goto out_unfreeze;
1e047eaab3bb556 Tetsuo Handa      2018-04-06  1268  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  1269  	} else
^1da177e4c3f415 Linus Torvalds    2005-04-16  1270  		xfer = NULL;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1271  
^1da177e4c3f415 Linus Torvalds    2005-04-16  1272  	err = loop_init_xfer(lo, xfer, info);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1273  	if (err)
cb26630f0424088 Jan Kara          2018-11-08  1274  		goto out_unfreeze;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1275  
^1da177e4c3f415 Linus Torvalds    2005-04-16  1276  	if (lo->lo_offset != info->lo_offset ||
1e6ec9ea89d3073 Omar Sandoval     2017-08-23  1277  	    lo->lo_sizelimit != info->lo_sizelimit) {
5aa6c2bd16d7977 Jaegeuk Kim       2019-01-09  1278  		/* kill_bdev should have truncated all the pages */
5aa6c2bd16d7977 Jaegeuk Kim       2019-01-09  1279  		if (lo->lo_device->bd_inode->i_mapping->nrpages) {
5aa6c2bd16d7977 Jaegeuk Kim       2019-01-09  1280  			err = -EAGAIN;
5aa6c2bd16d7977 Jaegeuk Kim       2019-01-09  1281  			pr_warn("%s: loop%d (%s) has still dirty pages (nrpages=%lu)\n",
5aa6c2bd16d7977 Jaegeuk Kim       2019-01-09  1282  				__func__, lo->lo_number, lo->lo_file_name,
5aa6c2bd16d7977 Jaegeuk Kim       2019-01-09  1283  				lo->lo_device->bd_inode->i_mapping->nrpages);
5aa6c2bd16d7977 Jaegeuk Kim       2019-01-09  1284  			goto out_unfreeze;
5aa6c2bd16d7977 Jaegeuk Kim       2019-01-09  1285  		}
1e6ec9ea89d3073 Omar Sandoval     2017-08-23  1286  		if (figure_loop_size(lo, info->lo_offset, info->lo_sizelimit)) {
ecdd09597a57251 Ming Lei          2017-02-11  1287  			err = -EFBIG;
cb26630f0424088 Jan Kara          2018-11-08  1288  			goto out_unfreeze;
ecdd09597a57251 Ming Lei          2017-02-11  1289  		}
1472bb0a05bd28c Siddh Raman Pant  2023-07-07  1290  		/* loff_t vars have been assigned __u64 */
1472bb0a05bd28c Siddh Raman Pant  2023-07-07  1291  		if (lo->lo_offset < 0 || lo->lo_sizelimit < 0)
1472bb0a05bd28c Siddh Raman Pant  2023-07-07  1292  			return -EOVERFLOW;
b040ad9cf6a169c Arnd Bergmann     2017-06-09  1293  	}
541c742a7559eb6 Guo Chao          2013-02-21  1294  
dfaa2ef68e80c37 Lukas Czerner     2011-08-19  1295  	loop_config_discard(lo);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1296  
^1da177e4c3f415 Linus Torvalds    2005-04-16  1297  	memcpy(lo->lo_file_name, info->lo_file_name, LO_NAME_SIZE);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1298  	memcpy(lo->lo_crypt_name, info->lo_crypt_name, LO_NAME_SIZE);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1299  	lo->lo_file_name[LO_NAME_SIZE-1] = 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1300  	lo->lo_crypt_name[LO_NAME_SIZE-1] = 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1301  
^1da177e4c3f415 Linus Torvalds    2005-04-16  1302  	if (!xfer)
^1da177e4c3f415 Linus Torvalds    2005-04-16  1303  		xfer = &none_funcs;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1304  	lo->transfer = xfer->transfer;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1305  	lo->ioctl = xfer->ioctl;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1306  
96c5865559cee0f David Woodhouse   2008-02-06  1307  	if ((lo->lo_flags & LO_FLAGS_AUTOCLEAR) !=
96c5865559cee0f David Woodhouse   2008-02-06  1308  	     (info->lo_flags & LO_FLAGS_AUTOCLEAR))
96c5865559cee0f David Woodhouse   2008-02-06  1309  		lo->lo_flags ^= LO_FLAGS_AUTOCLEAR;
96c5865559cee0f David Woodhouse   2008-02-06  1310  
^1da177e4c3f415 Linus Torvalds    2005-04-16  1311  	lo->lo_encrypt_key_size = info->lo_encrypt_key_size;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1312  	lo->lo_init[0] = info->lo_init[0];
^1da177e4c3f415 Linus Torvalds    2005-04-16  1313  	lo->lo_init[1] = info->lo_init[1];
^1da177e4c3f415 Linus Torvalds    2005-04-16  1314  	if (info->lo_encrypt_key_size) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  1315  		memcpy(lo->lo_encrypt_key, info->lo_encrypt_key,
^1da177e4c3f415 Linus Torvalds    2005-04-16  1316  		       info->lo_encrypt_key_size);
b0fafa816ece008 David Howells     2008-11-14  1317  		lo->lo_key_owner = uid;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1318  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  1319  
2e5ab5f379f96a6 Ming Lei          2015-08-17  1320  	/* update dio if lo_offset or transfer is changed */
2e5ab5f379f96a6 Ming Lei          2015-08-17  1321  	__loop_update_dio(lo, lo->use_dio);
2e5ab5f379f96a6 Ming Lei          2015-08-17  1322  
cb26630f0424088 Jan Kara          2018-11-08  1323  out_unfreeze:
ecdd09597a57251 Ming Lei          2017-02-11  1324  	blk_mq_unfreeze_queue(lo->lo_queue);
e02898b423802b1 Omar Sandoval     2017-03-01  1325  
e02898b423802b1 Omar Sandoval     2017-03-01  1326  	if (!err && (info->lo_flags & LO_FLAGS_PARTSCAN) &&
e02898b423802b1 Omar Sandoval     2017-03-01  1327  	     !(lo->lo_flags & LO_FLAGS_PARTSCAN)) {
e02898b423802b1 Omar Sandoval     2017-03-01  1328  		lo->lo_flags |= LO_FLAGS_PARTSCAN;
e02898b423802b1 Omar Sandoval     2017-03-01  1329  		lo->lo_disk->flags &= ~GENHD_FL_NO_PART_SCAN;
2a7d01129974075 Jan Kara          2018-11-08  1330  		bdev = lo->lo_device;
2a7d01129974075 Jan Kara          2018-11-08  1331  		partscan = true;
e02898b423802b1 Omar Sandoval     2017-03-01  1332  	}
cb26630f0424088 Jan Kara          2018-11-08  1333  out_unlock:
cb26630f0424088 Jan Kara          2018-11-08  1334  	mutex_unlock(&loop_ctl_mutex);
2a7d01129974075 Jan Kara          2018-11-08  1335  	if (partscan)
2a7d01129974075 Jan Kara          2018-11-08  1336  		loop_reread_partitions(lo, bdev);
e02898b423802b1 Omar Sandoval     2017-03-01  1337  
ecdd09597a57251 Ming Lei          2017-02-11 @1338  	return err;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1339  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  1340  

:::::: The code at line 1338 was first introduced by commit
:::::: ecdd09597a57251323b0de50e3d45e69298c4a83 block/loop: fix race between I/O and set_status

:::::: TO: Ming Lei <tom.leiming@gmail.com>
:::::: CC: Jens Axboe <axboe@fb.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
