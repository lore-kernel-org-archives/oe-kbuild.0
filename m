Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8FB4176D
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Apr 2024 07:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714462409; cv=none; b=Y9rY+OZj7HNaNwGdg3W9nGxVIfdBVN8nea7kirtnVyk1jYTzDsxonLL4oGfP6cxHZxUsE/himwrcQQRcN2dvcRPswVVCKMKAKm1LXVCM9Rob0QDRESCMyOY8mcZpeaqiCOv2UN9dEuypsBb5GYfUkrO3p0yNNr2qg3lDsw+W0zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714462409; c=relaxed/simple;
	bh=usao4WAlYXr8kcI9QgFXoJORxGd4PqxjfZxpOYnNC9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YZ7/LQBp5hIrl4PZMMPDi5FTV5vIdAFHec9ROC3zTPca5B4V03nS7ztmtc4CW+0+RGO2YuhQWXCrFn5IoSF3kNPR4IrvFt4SNga9hWJGcPq4710bIpYrv/5TzzGAluyQ+VCVew4i8GgPw54M4C/8f3uabnxFtqONP55kZjO3OcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q8YFDwPJ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q8YFDwPJ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57232e47a81so8705157a12.0
        for <oe-kbuild@lists.linux.dev>; Tue, 30 Apr 2024 00:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714462405; x=1715067205; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BELG/VPBraGO7uII+UjoA23wnh5dvAeA/xpYuXhlAqo=;
        b=Q8YFDwPJ+OehgkXw7Q831yq8P2pPwKpNXJXJRG1nRxlGcCVK9X4EQiQC6QaFiCnx54
         2pmBHC/qoSCd0tvSJFN6pa/n42Hlp02qW1hY6tGPGkUIdPrtumLusjEFknLNNoVSXjea
         62GONYK9V2DGZwgekl9wraVHLOQOg30Z+7l0OAfz07ednrvxfIJg9872x1+uWocrqri/
         HeVBZv36ZQxZlgUcJz0qTy7jmDFnXuV3D2PWOp9jL1E62AAx8YmizJEZQwPktzoZI2Jn
         2w5ScpN7T6zJW8nLexml0iikF7Q9CU9+gqZ6mnMpK9bf+3GgwolCPkeg8ECg2nYiA/7I
         3iKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714462405; x=1715067205;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BELG/VPBraGO7uII+UjoA23wnh5dvAeA/xpYuXhlAqo=;
        b=AnY4qlP2bBJ1Ga2ZAE4PrREikDc1t4aAZrxXQCJAPdYs5AUSNdRPAyrRVcTYfYooLL
         1YY1ht+WQux/rNmQX3t6+8viqrdm5Mf3Vl/lsWK+ggbaQ27aATRJgkVI9vCkveB5ZzEi
         wAtzksTN2AjQadRGYTgawAfxBzumw40IDCZ253DqtFUTX7kCxGQryAD6Sb1+5sTK411o
         8GWqWdEzWpoN8AnAxxL12jKBwbBv91nGd3NCOyM31VDpVaPGouk/yXkRyI5LahRswNqv
         ne8jWk6nbkHN2YahI8U4tpYI4WwWLj6mNC1Q2FbBgHk6vLErfnl4RDZ940bJlFaXYDqi
         7QzA==
X-Gm-Message-State: AOJu0YxyksbSTRNMHjD7PHjXOn7gEq9I/F6B2ie2vVPWZ/b8McJqr62j
	lXChN7aDPO8fpINl9fas4SbjzAG3lZYO85iMQ7ZwYP1aruVu7q8Hw3pup+5breWJ7A2yuRCiFYQ
	6
X-Google-Smtp-Source: AGHT+IFpPQefdWqsOcGW4xVCqQg6dLiSu9f0gk3ocsobkDMKst688OBb71Zev8gcwAek+9QtNPs5nA==
X-Received: by 2002:a50:9f6a:0:b0:572:61:8560 with SMTP id b97-20020a509f6a000000b0057200618560mr1686980edf.20.1714462404606;
        Tue, 30 Apr 2024 00:33:24 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id u25-20020a056402111900b005720c59dc57sm9506286edv.23.2024.04.30.00.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 00:33:24 -0700 (PDT)
Date: Tue, 30 Apr 2024 10:33:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, kernel@openeuler.org,
	Yongqiang Liu <duanzi@zju.edu.cn>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20772/22256] drivers/block/loop.c:1338
 loop_set_status() warn: inconsistent returns '&loop_ctl_mutex'.
Message-ID: <1ea41018-809e-4f9d-84b9-fbb3dfa18142@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3c3550371ac3e9d3326c8263a6eb52d3bb0b43a8
commit: 1472bb0a05bd28cae465d19e9ab40c13c8f2a716 [20772/22256] loop: Check for overflow while configuring loop
config: x86_64-randconfig-161-20240430 (https://download.01.org/0day-ci/archive/20240430/202404300746.qh94rwDQ-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202404300746.qh94rwDQ-lkp@intel.com/

New smatch warnings:
drivers/block/loop.c:1338 loop_set_status() warn: inconsistent returns '&loop_ctl_mutex'.

Old smatch warnings:
drivers/block/loop.c:785 loop_attr_backing_file_show() warn: passing zero to 'PTR_ERR'
drivers/block/loop.c:2019 loop_add() warn: passing zero to 'PTR_ERR'

vim +1338 drivers/block/loop.c

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

goto out_unlock?

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

