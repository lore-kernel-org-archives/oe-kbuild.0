Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A56A82487
	for <oe-kbuild@lists.linux.dev>; Thu, 23 May 2024 15:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716479864; cv=none; b=mhU/PTd2mUbV9nFnfdd9OjyZz3dPkJju4H4RPQfy6lCS05EqBtPQkbez9hvlPxM/7py/P0eUlPXrFVgGmvzJdu8CF1D52emb4ZDAcqwoRkp9p7AYiVJN2tS6Z0bY51U/Zvyew8BKLJ+sTo27BKz+ApWE1UEywNzo3V30LAiVSjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716479864; c=relaxed/simple;
	bh=Kvy1EufGMzo+A1BYW/cSy8t0yUnVuiE7ze95b6IquVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FVI3FeiTBY3sbgfW9stPZ2SSbYNgVnhrK+fI1aTuIjR6mznzv6D3yG3YMnAkivLWQOpOS2a5Bupa6dD7K+4SSX26GCiqTjsGm+ZkRIRwwfvTETaGaqvtgpZ7MqSv9otx7tf7sf1M29HZj2x0UYhk0zbACBgDetP25wKVF9GoHLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cP8+ACnO; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cP8+ACnO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716479862; x=1748015862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kvy1EufGMzo+A1BYW/cSy8t0yUnVuiE7ze95b6IquVg=;
  b=cP8+ACnOdJ175UySuIm4VIINRl5aJashEmsoZp+wqTkEf28NeBKiKQ9v
   SSFYssH5c/E973C7c4+mY/vc2ksZRXMtrp0bUZnutAsY8RG/kA1uZdcEW
   BHAgYcLXPvva2eWb0ksyHo5cUgj+skZziwphV9Lwi7PR17vs6JeTs8EU7
   pDp61XnXpgG/RXBYWD9wbtJ23wVcuXVaIpaeTLOO+54aDXcv1LNTvjVFF
   pOV4PE2+Y8CV2hc6yBWglDznf9CduvrbbMwlcomITV6yProCIpA7SDA2k
   YWuGn2KjsJX1qWfAWaUAJFORXNkgKMRtL/7+MRbwcznsOl4T4qcyqyw3Z
   g==;
X-CSE-ConnectionGUID: ybh5NOfmRHSNk5UhwGKkdQ==
X-CSE-MsgGUID: vJNaHyhQStmp9DdyDAauDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="30309718"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="30309718"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 08:57:42 -0700
X-CSE-ConnectionGUID: d4TLX829RoqZJg2nh1Asow==
X-CSE-MsgGUID: V2IQZiKkT+y1GVtiC4Bxqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; 
   d="scan'208";a="38296514"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 23 May 2024 08:57:40 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAAoy-00033Z-0f;
	Thu, 23 May 2024 15:57:37 +0000
Date: Thu, 23 May 2024 23:56:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:openEuler-1.0-LTS 20772/22482] drivers/block/loop.c:1338
 loop_set_status() warn: inconsistent returns '&loop_ctl_mutex'.
Message-ID: <202405232321.u9lWbOlo-lkp@intel.com>
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
head:   bcfa0f0eaaa58a3d5bc06386ca698a1eabce086a
commit: 1472bb0a05bd28cae465d19e9ab40c13c8f2a716 [20772/22482] loop: Check for overflow while configuring loop
:::::: branch date: 7 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-161-20240430 (https://download.01.org/0day-ci/archive/20240523/202405232321.u9lWbOlo-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405232321.u9lWbOlo-lkp@intel.com/

New smatch warnings:
drivers/block/loop.c:1338 loop_set_status() warn: inconsistent returns '&loop_ctl_mutex'.

Old smatch warnings:
drivers/block/loop.c:785 loop_attr_backing_file_show() warn: passing zero to 'PTR_ERR'
drivers/block/loop.c:2019 loop_add() warn: passing zero to 'PTR_ERR'

vim +1338 drivers/block/loop.c

04799b3a91ea37 Jan Kara          2018-11-08  1216  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1217  static int
^1da177e4c3f41 Linus Torvalds    2005-04-16  1218  loop_set_status(struct loop_device *lo, const struct loop_info64 *info)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1219  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1220  	int err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1221  	struct loop_func_table *xfer;
e4849737f76c87 Eric W. Biederman 2012-02-11  1222  	kuid_t uid = current_uid();
2a7d0112997407 Jan Kara          2018-11-08  1223  	struct block_device *bdev;
2a7d0112997407 Jan Kara          2018-11-08  1224  	bool partscan = false;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1225  
afa528900c5f5c Jan Kara          2018-11-08  1226  	err = mutex_lock_killable(&loop_ctl_mutex);
cb26630f042408 Jan Kara          2018-11-08  1227  	if (err)
cb26630f042408 Jan Kara          2018-11-08  1228  		return err;
b0fafa816ece00 David Howells     2008-11-14  1229  	if (lo->lo_encrypt_key_size &&
e4849737f76c87 Eric W. Biederman 2012-02-11  1230  	    !uid_eq(lo->lo_key_owner, uid) &&
cb26630f042408 Jan Kara          2018-11-08  1231  	    !capable(CAP_SYS_ADMIN)) {
cb26630f042408 Jan Kara          2018-11-08  1232  		err = -EPERM;
cb26630f042408 Jan Kara          2018-11-08  1233  		goto out_unlock;
cb26630f042408 Jan Kara          2018-11-08  1234  	}
cb26630f042408 Jan Kara          2018-11-08  1235  	if (lo->lo_state != Lo_bound) {
cb26630f042408 Jan Kara          2018-11-08  1236  		err = -ENXIO;
cb26630f042408 Jan Kara          2018-11-08  1237  		goto out_unlock;
cb26630f042408 Jan Kara          2018-11-08  1238  	}
cb26630f042408 Jan Kara          2018-11-08  1239  	if ((unsigned int) info->lo_encrypt_key_size > LO_KEY_SIZE) {
cb26630f042408 Jan Kara          2018-11-08  1240  		err = -EINVAL;
cb26630f042408 Jan Kara          2018-11-08  1241  		goto out_unlock;
cb26630f042408 Jan Kara          2018-11-08  1242  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1243  
5aa6c2bd16d797 Jaegeuk Kim       2019-01-09  1244  	if (lo->lo_offset != info->lo_offset ||
5aa6c2bd16d797 Jaegeuk Kim       2019-01-09  1245  	    lo->lo_sizelimit != info->lo_sizelimit) {
5aa6c2bd16d797 Jaegeuk Kim       2019-01-09  1246  		sync_blockdev(lo->lo_device);
2476d843de4788 Zheng Bin         2020-09-22  1247  		invalidate_bdev(lo->lo_device);
5aa6c2bd16d797 Jaegeuk Kim       2019-01-09  1248  	}
5aa6c2bd16d797 Jaegeuk Kim       2019-01-09  1249  
ecdd09597a5725 Ming Lei          2017-02-11  1250  	/* I/O need to be drained during transfer transition */
ecdd09597a5725 Ming Lei          2017-02-11  1251  	blk_mq_freeze_queue(lo->lo_queue);
ecdd09597a5725 Ming Lei          2017-02-11  1252  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1253  	err = loop_release_xfer(lo);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1254  	if (err)
cb26630f042408 Jan Kara          2018-11-08  1255  		goto out_unfreeze;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1256  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1257  	if (info->lo_encrypt_type) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1258  		unsigned int type = info->lo_encrypt_type;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1259  
1e047eaab3bb55 Tetsuo Handa      2018-04-06  1260  		if (type >= MAX_LO_CRYPT) {
1e047eaab3bb55 Tetsuo Handa      2018-04-06  1261  			err = -EINVAL;
cb26630f042408 Jan Kara          2018-11-08  1262  			goto out_unfreeze;
1e047eaab3bb55 Tetsuo Handa      2018-04-06  1263  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1264  		xfer = xfer_funcs[type];
1e047eaab3bb55 Tetsuo Handa      2018-04-06  1265  		if (xfer == NULL) {
1e047eaab3bb55 Tetsuo Handa      2018-04-06  1266  			err = -EINVAL;
cb26630f042408 Jan Kara          2018-11-08  1267  			goto out_unfreeze;
1e047eaab3bb55 Tetsuo Handa      2018-04-06  1268  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1269  	} else
^1da177e4c3f41 Linus Torvalds    2005-04-16  1270  		xfer = NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1271  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1272  	err = loop_init_xfer(lo, xfer, info);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1273  	if (err)
cb26630f042408 Jan Kara          2018-11-08  1274  		goto out_unfreeze;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1275  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1276  	if (lo->lo_offset != info->lo_offset ||
1e6ec9ea89d307 Omar Sandoval     2017-08-23  1277  	    lo->lo_sizelimit != info->lo_sizelimit) {
5aa6c2bd16d797 Jaegeuk Kim       2019-01-09  1278  		/* kill_bdev should have truncated all the pages */
5aa6c2bd16d797 Jaegeuk Kim       2019-01-09  1279  		if (lo->lo_device->bd_inode->i_mapping->nrpages) {
5aa6c2bd16d797 Jaegeuk Kim       2019-01-09  1280  			err = -EAGAIN;
5aa6c2bd16d797 Jaegeuk Kim       2019-01-09  1281  			pr_warn("%s: loop%d (%s) has still dirty pages (nrpages=%lu)\n",
5aa6c2bd16d797 Jaegeuk Kim       2019-01-09  1282  				__func__, lo->lo_number, lo->lo_file_name,
5aa6c2bd16d797 Jaegeuk Kim       2019-01-09  1283  				lo->lo_device->bd_inode->i_mapping->nrpages);
5aa6c2bd16d797 Jaegeuk Kim       2019-01-09  1284  			goto out_unfreeze;
5aa6c2bd16d797 Jaegeuk Kim       2019-01-09  1285  		}
1e6ec9ea89d307 Omar Sandoval     2017-08-23  1286  		if (figure_loop_size(lo, info->lo_offset, info->lo_sizelimit)) {
ecdd09597a5725 Ming Lei          2017-02-11  1287  			err = -EFBIG;
cb26630f042408 Jan Kara          2018-11-08  1288  			goto out_unfreeze;
ecdd09597a5725 Ming Lei          2017-02-11  1289  		}
1472bb0a05bd28 Siddh Raman Pant  2023-07-07  1290  		/* loff_t vars have been assigned __u64 */
1472bb0a05bd28 Siddh Raman Pant  2023-07-07  1291  		if (lo->lo_offset < 0 || lo->lo_sizelimit < 0)
1472bb0a05bd28 Siddh Raman Pant  2023-07-07  1292  			return -EOVERFLOW;
b040ad9cf6a169 Arnd Bergmann     2017-06-09  1293  	}
541c742a7559eb Guo Chao          2013-02-21  1294  
dfaa2ef68e80c3 Lukas Czerner     2011-08-19  1295  	loop_config_discard(lo);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1296  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1297  	memcpy(lo->lo_file_name, info->lo_file_name, LO_NAME_SIZE);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1298  	memcpy(lo->lo_crypt_name, info->lo_crypt_name, LO_NAME_SIZE);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1299  	lo->lo_file_name[LO_NAME_SIZE-1] = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1300  	lo->lo_crypt_name[LO_NAME_SIZE-1] = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1301  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1302  	if (!xfer)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1303  		xfer = &none_funcs;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1304  	lo->transfer = xfer->transfer;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1305  	lo->ioctl = xfer->ioctl;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1306  
96c5865559cee0 David Woodhouse   2008-02-06  1307  	if ((lo->lo_flags & LO_FLAGS_AUTOCLEAR) !=
96c5865559cee0 David Woodhouse   2008-02-06  1308  	     (info->lo_flags & LO_FLAGS_AUTOCLEAR))
96c5865559cee0 David Woodhouse   2008-02-06  1309  		lo->lo_flags ^= LO_FLAGS_AUTOCLEAR;
96c5865559cee0 David Woodhouse   2008-02-06  1310  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1311  	lo->lo_encrypt_key_size = info->lo_encrypt_key_size;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1312  	lo->lo_init[0] = info->lo_init[0];
^1da177e4c3f41 Linus Torvalds    2005-04-16  1313  	lo->lo_init[1] = info->lo_init[1];
^1da177e4c3f41 Linus Torvalds    2005-04-16  1314  	if (info->lo_encrypt_key_size) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1315  		memcpy(lo->lo_encrypt_key, info->lo_encrypt_key,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1316  		       info->lo_encrypt_key_size);
b0fafa816ece00 David Howells     2008-11-14  1317  		lo->lo_key_owner = uid;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1318  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1319  
2e5ab5f379f96a Ming Lei          2015-08-17  1320  	/* update dio if lo_offset or transfer is changed */
2e5ab5f379f96a Ming Lei          2015-08-17  1321  	__loop_update_dio(lo, lo->use_dio);
2e5ab5f379f96a Ming Lei          2015-08-17  1322  
cb26630f042408 Jan Kara          2018-11-08  1323  out_unfreeze:
ecdd09597a5725 Ming Lei          2017-02-11  1324  	blk_mq_unfreeze_queue(lo->lo_queue);
e02898b423802b Omar Sandoval     2017-03-01  1325  
e02898b423802b Omar Sandoval     2017-03-01  1326  	if (!err && (info->lo_flags & LO_FLAGS_PARTSCAN) &&
e02898b423802b Omar Sandoval     2017-03-01  1327  	     !(lo->lo_flags & LO_FLAGS_PARTSCAN)) {
e02898b423802b Omar Sandoval     2017-03-01  1328  		lo->lo_flags |= LO_FLAGS_PARTSCAN;
e02898b423802b Omar Sandoval     2017-03-01  1329  		lo->lo_disk->flags &= ~GENHD_FL_NO_PART_SCAN;
2a7d0112997407 Jan Kara          2018-11-08  1330  		bdev = lo->lo_device;
2a7d0112997407 Jan Kara          2018-11-08  1331  		partscan = true;
e02898b423802b Omar Sandoval     2017-03-01  1332  	}
cb26630f042408 Jan Kara          2018-11-08  1333  out_unlock:
cb26630f042408 Jan Kara          2018-11-08  1334  	mutex_unlock(&loop_ctl_mutex);
2a7d0112997407 Jan Kara          2018-11-08  1335  	if (partscan)
2a7d0112997407 Jan Kara          2018-11-08  1336  		loop_reread_partitions(lo, bdev);
e02898b423802b Omar Sandoval     2017-03-01  1337  
ecdd09597a5725 Ming Lei          2017-02-11 @1338  	return err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1339  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  1340  

:::::: The code at line 1338 was first introduced by commit
:::::: ecdd09597a57251323b0de50e3d45e69298c4a83 block/loop: fix race between I/O and set_status

:::::: TO: Ming Lei <tom.leiming@gmail.com>
:::::: CC: Jens Axboe <axboe@fb.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
