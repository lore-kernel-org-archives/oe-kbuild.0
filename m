Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BE817C2
	for <oe-kbuild@lists.linux.dev>; Sun, 31 Dec 2023 03:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VP1n3WKj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703992661; x=1735528661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pMH3zG8gVWyzj042kUcEt17YW9/Psr6Lglic44qLE7s=;
  b=VP1n3WKjDmP1lrblbH3DE6aQjbDaR6G6//tDP6dd6GxUyIvY9kPX9g3C
   BpIPR7If8/37ZEBIIRVQgi1FVbDbPjnmPhZOBjOYGUS/4hmXAjHSBuREx
   0p+7VeuH/Xjm4H4alVZAL0MYGnG+sL+ewqvQddmvTTL+o3j3SXo+8uBIt
   McJBD+Nk0z7dsZgIZzc0C2uu+E7DNBaT1hKind+cVsZ0bCCcK6xB9ulYn
   ab4nkcjPzxgBfmddTmjwGCJDts8fOMv+2A9/McR1j14lMWwaShYyoX3eA
   CHFYgRMPq7vuosoS3kmfZ3LpnqkQfqpoH5QmF/ZZbit5TDlKu1JElkT5+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10939"; a="3806999"
X-IronPort-AV: E=Sophos;i="6.04,319,1695711600"; 
   d="scan'208";a="3806999"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2023 19:17:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10939"; a="755359746"
X-IronPort-AV: E=Sophos;i="6.04,319,1695711600"; 
   d="scan'208";a="755359746"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 30 Dec 2023 19:17:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJmKV-000IyB-1C;
	Sun, 31 Dec 2023 03:17:35 +0000
Date: Sun, 31 Dec 2023 11:17:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-block:blk-limits 25/46] drivers/block/virtio_blk.c:1266
 virtblk_read_limits() error: uninitialized symbol 'virtio_cread_v'.
Message-ID: <202312311145.99PwA59X-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/block.git blk-limits
head:   2ac689ccdb138ca7b07b7a731204f8a66bc4eed7
commit: bbff658ceae79581d473a823249caa72164c47ad [25/46] virtio_blk: split virtblk_probe
:::::: branch date: 19 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20231231 (https://download.01.org/0day-ci/archive/20231231/202312311145.99PwA59X-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312311145.99PwA59X-lkp@intel.com/

New smatch warnings:
drivers/block/virtio_blk.c:1266 virtblk_read_limits() error: uninitialized symbol 'virtio_cread_v'.

Old smatch warnings:
drivers/block/virtio_blk.c:859 virtblk_getgeo() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:934 virtblk_update_capacity() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:982 init_vq() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1288 virtblk_read_limits() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1296 virtblk_read_limits() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1326 virtblk_read_limits() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1332 virtblk_read_limits() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1339 virtblk_read_limits() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1342 virtblk_read_limits() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1346 virtblk_read_limits() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1351 virtblk_read_limits() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1370 virtblk_read_limits() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1384 virtblk_read_limits() error: uninitialized symbol 'virtio_cread_v'.
drivers/block/virtio_blk.c:1398 virtblk_read_limits() error: uninitialized symbol 'virtio_cread_v'.

vim +/virtio_cread_v +1266 drivers/block/virtio_blk.c

1cf7e9c68fe842 Jens Axboe            2013-11-01  1252  
bbff658ceae795 Christoph Hellwig     2023-12-28  1253  static int virtblk_read_limits(struct virtio_blk *vblk)
e467cde238184d Rusty Russell         2007-10-22  1254  {
bbff658ceae795 Christoph Hellwig     2023-12-28  1255  	struct request_queue *q = vblk->disk->queue;
bbff658ceae795 Christoph Hellwig     2023-12-28  1256  	struct virtio_device *vdev = vblk->vdev;
fd1068e1860e44 Joerg Roedel          2019-02-07  1257  	u32 v, blk_size, max_size, sg_elems, opt_io_size;
e60d64074214db Alvaro Karsz          2022-09-21  1258  	u32 max_discard_segs = 0;
e60d64074214db Alvaro Karsz          2022-09-21  1259  	u32 discard_granularity = 0;
69740c8ba878f5 Christoph Hellwig     2010-02-24  1260  	u16 min_io_size;
69740c8ba878f5 Christoph Hellwig     2010-02-24  1261  	u8 physical_block_exp, alignment_offset;
fafb51a67fb883 zhenwei pi            2023-09-04  1262  	size_t max_dma_size;
bbff658ceae795 Christoph Hellwig     2023-12-28  1263  	int err;
4f3bf19c6e8164 Christian Borntraeger 2008-01-31  1264  
0864b79a153342 Rusty Russell         2008-12-30  1265  	/* We need to know how many segments before we allocate. */
855e0c5288177b Rusty Russell         2013-10-14 @1266  	err = virtio_cread_feature(vdev, VIRTIO_BLK_F_SEG_MAX,
855e0c5288177b Rusty Russell         2013-10-14  1267  				   struct virtio_blk_config, seg_max,
0864b79a153342 Rusty Russell         2008-12-30  1268  				   &sg_elems);
a5b365a652206c Christoph Hellwig     2010-05-25  1269  
a5b365a652206c Christoph Hellwig     2010-05-25  1270  	/* We need at least one SG element, whatever they say. */
a5b365a652206c Christoph Hellwig     2010-05-25  1271  	if (err || !sg_elems)
0864b79a153342 Rusty Russell         2008-12-30  1272  		sg_elems = 1;
0864b79a153342 Rusty Russell         2008-12-30  1273  
63947b3434f475 Stefan Hajnoczi       2021-05-24  1274  	/* Prevent integer overflows and honor max vq size */
63947b3434f475 Stefan Hajnoczi       2021-05-24  1275  	sg_elems = min_t(u32, sg_elems, VIRTIO_BLK_MAX_SG_ELEMS - 2);
63947b3434f475 Stefan Hajnoczi       2021-05-24  1276  
0864b79a153342 Rusty Russell         2008-12-30  1277  	/* We can handle whatever the host told us to handle. */
e030759a1ddcbf Xie Yongji            2022-03-04  1278  	blk_queue_max_segments(q, sg_elems);
0864b79a153342 Rusty Russell         2008-12-30  1279  
4b7f7e2049956f Rusty Russell         2008-12-30  1280  	/* No real sector limit. */
f4e468f708386c Angus Chen            2022-11-10  1281  	blk_queue_max_hw_sectors(q, UINT_MAX);
4b7f7e2049956f Rusty Russell         2008-12-30  1282  
fafb51a67fb883 zhenwei pi            2023-09-04  1283  	max_dma_size = virtio_max_dma_size(vdev);
fafb51a67fb883 zhenwei pi            2023-09-04  1284  	max_size = max_dma_size > U32_MAX ? U32_MAX : max_dma_size;
fd1068e1860e44 Joerg Roedel          2019-02-07  1285  
a586d4f6016f71 Rusty Russell         2008-02-04  1286  	/* Host can optionally specify maximum segment size and number of
a586d4f6016f71 Rusty Russell         2008-02-04  1287  	 * segments. */
855e0c5288177b Rusty Russell         2013-10-14  1288  	err = virtio_cread_feature(vdev, VIRTIO_BLK_F_SIZE_MAX,
855e0c5288177b Rusty Russell         2013-10-14  1289  				   struct virtio_blk_config, size_max, &v);
e467cde238184d Rusty Russell         2007-10-22  1290  	if (!err)
fd1068e1860e44 Joerg Roedel          2019-02-07  1291  		max_size = min(max_size, v);
fd1068e1860e44 Joerg Roedel          2019-02-07  1292  
fd1068e1860e44 Joerg Roedel          2019-02-07  1293  	blk_queue_max_segment_size(q, max_size);
e467cde238184d Rusty Russell         2007-10-22  1294  
066f4d82a67f62 Christian Borntraeger 2008-05-29  1295  	/* Host can optionally specify the block size of the device */
855e0c5288177b Rusty Russell         2013-10-14  1296  	err = virtio_cread_feature(vdev, VIRTIO_BLK_F_BLK_SIZE,
855e0c5288177b Rusty Russell         2013-10-14  1297  				   struct virtio_blk_config, blk_size,
066f4d82a67f62 Christian Borntraeger 2008-05-29  1298  				   &blk_size);
57a13a5b8157d9 Xie Yongji            2021-10-26  1299  	if (!err) {
57a13a5b8157d9 Xie Yongji            2021-10-26  1300  		err = blk_validate_block_size(blk_size);
57a13a5b8157d9 Xie Yongji            2021-10-26  1301  		if (err) {
57a13a5b8157d9 Xie Yongji            2021-10-26  1302  			dev_err(&vdev->dev,
57a13a5b8157d9 Xie Yongji            2021-10-26  1303  				"virtio_blk: invalid block size: 0x%x\n",
57a13a5b8157d9 Xie Yongji            2021-10-26  1304  				blk_size);
bbff658ceae795 Christoph Hellwig     2023-12-28  1305  			return err;
57a13a5b8157d9 Xie Yongji            2021-10-26  1306  		}
57a13a5b8157d9 Xie Yongji            2021-10-26  1307  
69740c8ba878f5 Christoph Hellwig     2010-02-24  1308  		blk_queue_logical_block_size(q, blk_size);
57a13a5b8157d9 Xie Yongji            2021-10-26  1309  	} else
69740c8ba878f5 Christoph Hellwig     2010-02-24  1310  		blk_size = queue_logical_block_size(q);
69740c8ba878f5 Christoph Hellwig     2010-02-24  1311  
69740c8ba878f5 Christoph Hellwig     2010-02-24  1312  	/* Use topology information if available */
855e0c5288177b Rusty Russell         2013-10-14  1313  	err = virtio_cread_feature(vdev, VIRTIO_BLK_F_TOPOLOGY,
855e0c5288177b Rusty Russell         2013-10-14  1314  				   struct virtio_blk_config, physical_block_exp,
69740c8ba878f5 Christoph Hellwig     2010-02-24  1315  				   &physical_block_exp);
69740c8ba878f5 Christoph Hellwig     2010-02-24  1316  	if (!err && physical_block_exp)
69740c8ba878f5 Christoph Hellwig     2010-02-24  1317  		blk_queue_physical_block_size(q,
69740c8ba878f5 Christoph Hellwig     2010-02-24  1318  				blk_size * (1 << physical_block_exp));
69740c8ba878f5 Christoph Hellwig     2010-02-24  1319  
855e0c5288177b Rusty Russell         2013-10-14  1320  	err = virtio_cread_feature(vdev, VIRTIO_BLK_F_TOPOLOGY,
855e0c5288177b Rusty Russell         2013-10-14  1321  				   struct virtio_blk_config, alignment_offset,
69740c8ba878f5 Christoph Hellwig     2010-02-24  1322  				   &alignment_offset);
69740c8ba878f5 Christoph Hellwig     2010-02-24  1323  	if (!err && alignment_offset)
69740c8ba878f5 Christoph Hellwig     2010-02-24  1324  		blk_queue_alignment_offset(q, blk_size * alignment_offset);
69740c8ba878f5 Christoph Hellwig     2010-02-24  1325  
855e0c5288177b Rusty Russell         2013-10-14  1326  	err = virtio_cread_feature(vdev, VIRTIO_BLK_F_TOPOLOGY,
855e0c5288177b Rusty Russell         2013-10-14  1327  				   struct virtio_blk_config, min_io_size,
69740c8ba878f5 Christoph Hellwig     2010-02-24  1328  				   &min_io_size);
69740c8ba878f5 Christoph Hellwig     2010-02-24  1329  	if (!err && min_io_size)
69740c8ba878f5 Christoph Hellwig     2010-02-24  1330  		blk_queue_io_min(q, blk_size * min_io_size);
69740c8ba878f5 Christoph Hellwig     2010-02-24  1331  
855e0c5288177b Rusty Russell         2013-10-14  1332  	err = virtio_cread_feature(vdev, VIRTIO_BLK_F_TOPOLOGY,
855e0c5288177b Rusty Russell         2013-10-14  1333  				   struct virtio_blk_config, opt_io_size,
69740c8ba878f5 Christoph Hellwig     2010-02-24  1334  				   &opt_io_size);
69740c8ba878f5 Christoph Hellwig     2010-02-24  1335  	if (!err && opt_io_size)
69740c8ba878f5 Christoph Hellwig     2010-02-24  1336  		blk_queue_io_opt(q, blk_size * opt_io_size);
69740c8ba878f5 Christoph Hellwig     2010-02-24  1337  
1f23816b8eb8fd Changpeng Liu         2018-11-01  1338  	if (virtio_has_feature(vdev, VIRTIO_BLK_F_DISCARD)) {
1f23816b8eb8fd Changpeng Liu         2018-11-01  1339  		virtio_cread(vdev, struct virtio_blk_config,
e60d64074214db Alvaro Karsz          2022-09-21  1340  			     discard_sector_alignment, &discard_granularity);
1f23816b8eb8fd Changpeng Liu         2018-11-01  1341  
1f23816b8eb8fd Changpeng Liu         2018-11-01  1342  		virtio_cread(vdev, struct virtio_blk_config,
1f23816b8eb8fd Changpeng Liu         2018-11-01  1343  			     max_discard_sectors, &v);
1f23816b8eb8fd Changpeng Liu         2018-11-01  1344  		blk_queue_max_discard_sectors(q, v ? v : UINT_MAX);
1f23816b8eb8fd Changpeng Liu         2018-11-01  1345  
1f23816b8eb8fd Changpeng Liu         2018-11-01  1346  		virtio_cread(vdev, struct virtio_blk_config, max_discard_seg,
e60d64074214db Alvaro Karsz          2022-09-21  1347  			     &max_discard_segs);
1f23816b8eb8fd Changpeng Liu         2018-11-01  1348  	}
1f23816b8eb8fd Changpeng Liu         2018-11-01  1349  
1f23816b8eb8fd Changpeng Liu         2018-11-01  1350  	if (virtio_has_feature(vdev, VIRTIO_BLK_F_WRITE_ZEROES)) {
1f23816b8eb8fd Changpeng Liu         2018-11-01  1351  		virtio_cread(vdev, struct virtio_blk_config,
1f23816b8eb8fd Changpeng Liu         2018-11-01  1352  			     max_write_zeroes_sectors, &v);
1f23816b8eb8fd Changpeng Liu         2018-11-01  1353  		blk_queue_max_write_zeroes_sectors(q, v ? v : UINT_MAX);
1f23816b8eb8fd Changpeng Liu         2018-11-01  1354  	}
1f23816b8eb8fd Changpeng Liu         2018-11-01  1355  
e60d64074214db Alvaro Karsz          2022-09-21  1356  	/* The discard and secure erase limits are combined since the Linux
e60d64074214db Alvaro Karsz          2022-09-21  1357  	 * block layer uses the same limit for both commands.
e60d64074214db Alvaro Karsz          2022-09-21  1358  	 *
e60d64074214db Alvaro Karsz          2022-09-21  1359  	 * If both VIRTIO_BLK_F_SECURE_ERASE and VIRTIO_BLK_F_DISCARD features
e60d64074214db Alvaro Karsz          2022-09-21  1360  	 * are negotiated, we will use the minimum between the limits.
e60d64074214db Alvaro Karsz          2022-09-21  1361  	 *
e60d64074214db Alvaro Karsz          2022-09-21  1362  	 * discard sector alignment is set to the minimum between discard_sector_alignment
e60d64074214db Alvaro Karsz          2022-09-21  1363  	 * and secure_erase_sector_alignment.
e60d64074214db Alvaro Karsz          2022-09-21  1364  	 *
e60d64074214db Alvaro Karsz          2022-09-21  1365  	 * max discard sectors is set to the minimum between max_discard_seg and
e60d64074214db Alvaro Karsz          2022-09-21  1366  	 * max_secure_erase_seg.
e60d64074214db Alvaro Karsz          2022-09-21  1367  	 */
e60d64074214db Alvaro Karsz          2022-09-21  1368  	if (virtio_has_feature(vdev, VIRTIO_BLK_F_SECURE_ERASE)) {
e60d64074214db Alvaro Karsz          2022-09-21  1369  
e60d64074214db Alvaro Karsz          2022-09-21  1370  		virtio_cread(vdev, struct virtio_blk_config,
e60d64074214db Alvaro Karsz          2022-09-21  1371  			     secure_erase_sector_alignment, &v);
e60d64074214db Alvaro Karsz          2022-09-21  1372  
e60d64074214db Alvaro Karsz          2022-09-21  1373  		/* secure_erase_sector_alignment should not be zero, the device should set a
e60d64074214db Alvaro Karsz          2022-09-21  1374  		 * valid number of sectors.
e60d64074214db Alvaro Karsz          2022-09-21  1375  		 */
e60d64074214db Alvaro Karsz          2022-09-21  1376  		if (!v) {
e60d64074214db Alvaro Karsz          2022-09-21  1377  			dev_err(&vdev->dev,
e60d64074214db Alvaro Karsz          2022-09-21  1378  				"virtio_blk: secure_erase_sector_alignment can't be 0\n");
bbff658ceae795 Christoph Hellwig     2023-12-28  1379  			return -EINVAL;
e60d64074214db Alvaro Karsz          2022-09-21  1380  		}
e60d64074214db Alvaro Karsz          2022-09-21  1381  
e60d64074214db Alvaro Karsz          2022-09-21  1382  		discard_granularity = min_not_zero(discard_granularity, v);
e60d64074214db Alvaro Karsz          2022-09-21  1383  
e60d64074214db Alvaro Karsz          2022-09-21  1384  		virtio_cread(vdev, struct virtio_blk_config,
e60d64074214db Alvaro Karsz          2022-09-21  1385  			     max_secure_erase_sectors, &v);
e60d64074214db Alvaro Karsz          2022-09-21  1386  
e60d64074214db Alvaro Karsz          2022-09-21  1387  		/* max_secure_erase_sectors should not be zero, the device should set a
e60d64074214db Alvaro Karsz          2022-09-21  1388  		 * valid number of sectors.
e60d64074214db Alvaro Karsz          2022-09-21  1389  		 */
e60d64074214db Alvaro Karsz          2022-09-21  1390  		if (!v) {
e60d64074214db Alvaro Karsz          2022-09-21  1391  			dev_err(&vdev->dev,
e60d64074214db Alvaro Karsz          2022-09-21  1392  				"virtio_blk: max_secure_erase_sectors can't be 0\n");
bbff658ceae795 Christoph Hellwig     2023-12-28  1393  			return -EINVAL;
e60d64074214db Alvaro Karsz          2022-09-21  1394  		}
e60d64074214db Alvaro Karsz          2022-09-21  1395  
e60d64074214db Alvaro Karsz          2022-09-21  1396  		blk_queue_max_secure_erase_sectors(q, v);
e60d64074214db Alvaro Karsz          2022-09-21  1397  
e60d64074214db Alvaro Karsz          2022-09-21  1398  		virtio_cread(vdev, struct virtio_blk_config,
e60d64074214db Alvaro Karsz          2022-09-21  1399  			     max_secure_erase_seg, &v);
e60d64074214db Alvaro Karsz          2022-09-21  1400  
e60d64074214db Alvaro Karsz          2022-09-21  1401  		/* max_secure_erase_seg should not be zero, the device should set a
e60d64074214db Alvaro Karsz          2022-09-21  1402  		 * valid number of segments
e60d64074214db Alvaro Karsz          2022-09-21  1403  		 */
e60d64074214db Alvaro Karsz          2022-09-21  1404  		if (!v) {
e60d64074214db Alvaro Karsz          2022-09-21  1405  			dev_err(&vdev->dev,
e60d64074214db Alvaro Karsz          2022-09-21  1406  				"virtio_blk: max_secure_erase_seg can't be 0\n");
bbff658ceae795 Christoph Hellwig     2023-12-28  1407  			return -EINVAL;
e60d64074214db Alvaro Karsz          2022-09-21  1408  		}
e60d64074214db Alvaro Karsz          2022-09-21  1409  
e60d64074214db Alvaro Karsz          2022-09-21  1410  		max_discard_segs = min_not_zero(max_discard_segs, v);
e60d64074214db Alvaro Karsz          2022-09-21  1411  	}
e60d64074214db Alvaro Karsz          2022-09-21  1412  
e60d64074214db Alvaro Karsz          2022-09-21  1413  	if (virtio_has_feature(vdev, VIRTIO_BLK_F_DISCARD) ||
e60d64074214db Alvaro Karsz          2022-09-21  1414  	    virtio_has_feature(vdev, VIRTIO_BLK_F_SECURE_ERASE)) {
e60d64074214db Alvaro Karsz          2022-09-21  1415  		/* max_discard_seg and discard_granularity will be 0 only
e60d64074214db Alvaro Karsz          2022-09-21  1416  		 * if max_discard_seg and discard_sector_alignment fields in the virtio
e60d64074214db Alvaro Karsz          2022-09-21  1417  		 * config are 0 and VIRTIO_BLK_F_SECURE_ERASE feature is not negotiated.
e60d64074214db Alvaro Karsz          2022-09-21  1418  		 * In this case, we use default values.
e60d64074214db Alvaro Karsz          2022-09-21  1419  		 */
e60d64074214db Alvaro Karsz          2022-09-21  1420  		if (!max_discard_segs)
e60d64074214db Alvaro Karsz          2022-09-21  1421  			max_discard_segs = sg_elems;
e60d64074214db Alvaro Karsz          2022-09-21  1422  
e60d64074214db Alvaro Karsz          2022-09-21  1423  		blk_queue_max_discard_segments(q,
e60d64074214db Alvaro Karsz          2022-09-21  1424  					       min(max_discard_segs, MAX_DISCARD_SEGMENTS));
e60d64074214db Alvaro Karsz          2022-09-21  1425  
e60d64074214db Alvaro Karsz          2022-09-21  1426  		if (discard_granularity)
e60d64074214db Alvaro Karsz          2022-09-21  1427  			q->limits.discard_granularity = discard_granularity << SECTOR_SHIFT;
e60d64074214db Alvaro Karsz          2022-09-21  1428  		else
e60d64074214db Alvaro Karsz          2022-09-21  1429  			q->limits.discard_granularity = blk_size;
e60d64074214db Alvaro Karsz          2022-09-21  1430  	}
e60d64074214db Alvaro Karsz          2022-09-21  1431  
bbff658ceae795 Christoph Hellwig     2023-12-28  1432  	return 0;
bbff658ceae795 Christoph Hellwig     2023-12-28  1433  }
bbff658ceae795 Christoph Hellwig     2023-12-28  1434  

:::::: The code at line 1266 was first introduced by commit
:::::: 855e0c5288177bcb193f6f6316952d2490478e1c virtio: use size-based config accessors.

:::::: TO: Rusty Russell <rusty@rustcorp.com.au>
:::::: CC: Rusty Russell <rusty@rustcorp.com.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
