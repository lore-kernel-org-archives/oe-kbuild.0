Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0ABC192D7B
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Dec 2024 07:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733211666; cv=none; b=aZyxrkDe3NAaJFsSt7g4WqD+coGp1JXTA1XItVzRk9NVkGO46uL6jtMtCzwJJD7eAwamujZDrTk7g11jT3kEAFX2oUI9VeOxC1iRioI+j2XuPtUBUWLBtAs0DjqVkwIMR2d+tGmuE7ZxI3P0lOoNxMXc7s+IcqUvkcZke2fvzi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733211666; c=relaxed/simple;
	bh=LLwdmeMOGnjKIMlW/43oHk0YQyZb0HbHjeI5BJFAZ5A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oawXl6+cB8cejGiHqAw1oiBGiSd1xzgfdflEdZ6QvL2V2y46t/xHxXnYJgxxeUi9pujltkEzM8cQlh/b4Ygcqn9bnLXrDdlu3OsAojDIUAW67oLeDPlfW+k6j4aFxULzce/8OWUwui4PclEp7Z5V8t1GY1oRiQuSUHc/6cXqAkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QQI08lzw; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQI08lzw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733211662; x=1764747662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LLwdmeMOGnjKIMlW/43oHk0YQyZb0HbHjeI5BJFAZ5A=;
  b=QQI08lzwz0Ex+mykTeMyzAd82Ox3eueHAVobsIe4Qfoqe8pLpEn5+s3M
   ITn8YHxhiVJKfBLmz/0BzRgrLygCxrMkMkECrNaviRriQ/bjkFViBzPtJ
   LLG0lWhuT8cOKmC0lOulpa9zULA03EWVrepDkC1tGixfh3Zlru8X6tJ2R
   Goo13HEVXo5IUxynKXg1IgeMJd+tQQw1YP3jT6yjijuKyo1amLjaciWVY
   Ong9WMuirPgdT9hq6OemF2hdo8Uk7pXBW17yXb2NGr/U03bjaB7Lqjjf4
   5Jjl6Gi2sAxChtpmt6+6jZ+EdQ6Wy0VhzBnmbVHV9dmY3Pu6XIFWT5+m4
   Q==;
X-CSE-ConnectionGUID: J2Z/wjPaT2mFTI3JGwMokg==
X-CSE-MsgGUID: xhxghKefRLaqMjicOrYHog==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33468511"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="33468511"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 23:41:00 -0800
X-CSE-ConnectionGUID: 8Di5jeDYQKu6wocCN9u12w==
X-CSE-MsgGUID: VA4NB1+FQKi5CS3/q5kKew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="98126678"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Dec 2024 23:40:59 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tINWh-0000IL-1O;
	Tue, 03 Dec 2024 07:40:55 +0000
Date: Tue, 3 Dec 2024 15:40:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/direct-io.c:1180:7-23: WARNING: kmem_cache_zalloc should be used
 for dio, instead of kmem_cache_alloc/memset
Message-ID: <202412031557.vMRhQOgR-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Gabriel Krisman Bertazi <krisman@collabora.com>
CC: Jan Kara <jack@suse.cz>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cdd30ebb1b9f36159d66f088b61aee264e649d7a
commit: 46d716025a228de835a8fd51c8420e3ce3c88795 direct-io: clean up error paths of do_blockdev_direct_IO
date:   4 years, 2 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 4 years, 2 months ago
config: i386-randconfig-r062-20241203 (https://download.01.org/0day-ci/archive/20241203/202412031557.vMRhQOgR-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412031557.vMRhQOgR-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/direct-io.c:1180:7-23: WARNING: kmem_cache_zalloc should be used for dio, instead of kmem_cache_alloc/memset

vim +1180 fs/direct-io.c

^1da177e4c3f415 Linus Torvalds          2005-04-16  1118  
eafdc7d190a944c Christoph Hellwig       2010-06-04  1119  /*
eafdc7d190a944c Christoph Hellwig       2010-06-04  1120   * This is a library function for use by filesystem drivers.
eafdc7d190a944c Christoph Hellwig       2010-06-04  1121   *
eafdc7d190a944c Christoph Hellwig       2010-06-04  1122   * The locking rules are governed by the flags parameter:
eafdc7d190a944c Christoph Hellwig       2010-06-04  1123   *  - if the flags value contains DIO_LOCKING we use a fancy locking
eafdc7d190a944c Christoph Hellwig       2010-06-04  1124   *    scheme for dumb filesystems.
eafdc7d190a944c Christoph Hellwig       2010-06-04  1125   *    For writes this function is called under i_mutex and returns with
eafdc7d190a944c Christoph Hellwig       2010-06-04  1126   *    i_mutex held, for reads, i_mutex is not held on entry, but it is
eafdc7d190a944c Christoph Hellwig       2010-06-04  1127   *    taken and dropped again before returning.
eafdc7d190a944c Christoph Hellwig       2010-06-04  1128   *  - if the flags value does NOT contain DIO_LOCKING we don't use any
eafdc7d190a944c Christoph Hellwig       2010-06-04  1129   *    internal locking but rather rely on the filesystem to synchronize
eafdc7d190a944c Christoph Hellwig       2010-06-04  1130   *    direct I/O reads/writes versus each other and truncate.
df2d6f26586f12a Christoph Hellwig       2011-06-24  1131   *
df2d6f26586f12a Christoph Hellwig       2011-06-24  1132   * To help with locking against truncate we incremented the i_dio_count
df2d6f26586f12a Christoph Hellwig       2011-06-24  1133   * counter before starting direct I/O, and decrement it once we are done.
df2d6f26586f12a Christoph Hellwig       2011-06-24  1134   * Truncate can wait for it to reach zero to provide exclusion.  It is
df2d6f26586f12a Christoph Hellwig       2011-06-24  1135   * expected that filesystem provide exclusion between new direct I/O
df2d6f26586f12a Christoph Hellwig       2011-06-24  1136   * and truncates.  For DIO_LOCKING filesystems this is done by i_mutex,
df2d6f26586f12a Christoph Hellwig       2011-06-24  1137   * but other filesystems need to take care of this on their own.
ba253fbf6d3502c Andi Kleen              2011-08-01  1138   *
ba253fbf6d3502c Andi Kleen              2011-08-01  1139   * NOTE: if you pass "sdio" to anything by pointer make sure that function
ba253fbf6d3502c Andi Kleen              2011-08-01  1140   * is always inlined. Otherwise gcc is unable to split the structure into
ba253fbf6d3502c Andi Kleen              2011-08-01  1141   * individual fields and will generate much worse code. This is important
ba253fbf6d3502c Andi Kleen              2011-08-01  1142   * for the whole file.
eafdc7d190a944c Christoph Hellwig       2010-06-04  1143   */
65dd2aa90aa17a2 Andi Kleen              2012-01-12  1144  static inline ssize_t
17f8c842d24ac05 Omar Sandoval           2015-03-16  1145  do_blockdev_direct_IO(struct kiocb *iocb, struct inode *inode,
17f8c842d24ac05 Omar Sandoval           2015-03-16  1146  		      struct block_device *bdev, struct iov_iter *iter,
c8b8e32d700fe94 Christoph Hellwig       2016-04-07  1147  		      get_block_t get_block, dio_iodone_t end_io,
facd07b07d2a798 Josef Bacik             2010-05-23  1148  		      dio_submit_t submit_io, int flags)
^1da177e4c3f415 Linus Torvalds          2005-04-16  1149  {
6aa7de059173a98 Mark Rutland            2017-10-23  1150  	unsigned i_blkbits = READ_ONCE(inode->i_blkbits);
ab73857e354ab9e Linus Torvalds          2012-11-29  1151  	unsigned blkbits = i_blkbits;
^1da177e4c3f415 Linus Torvalds          2005-04-16  1152  	unsigned blocksize_mask = (1 << blkbits) - 1;
^1da177e4c3f415 Linus Torvalds          2005-04-16  1153  	ssize_t retval = -EINVAL;
1c0ff0f1bdeb183 Nikolay Borisov         2018-04-05  1154  	const size_t count = iov_iter_count(iter);
c8b8e32d700fe94 Christoph Hellwig       2016-04-07  1155  	loff_t offset = iocb->ki_pos;
1c0ff0f1bdeb183 Nikolay Borisov         2018-04-05  1156  	const loff_t end = offset + count;
^1da177e4c3f415 Linus Torvalds          2005-04-16  1157  	struct dio *dio;
eb28be2b4c0a060 Andi Kleen              2011-08-01  1158  	struct dio_submit sdio = { 0, };
847cc6371ba8207 Andi Kleen              2011-08-01  1159  	struct buffer_head map_bh = { 0, };
647d1e4c5235763 Fengguang Wu            2012-08-09  1160  	struct blk_plug plug;
886a39115005ced Al Viro                 2014-03-05  1161  	unsigned long align = offset | iov_iter_alignment(iter);
^1da177e4c3f415 Linus Torvalds          2005-04-16  1162  
65dd2aa90aa17a2 Andi Kleen              2012-01-12  1163  	/*
65dd2aa90aa17a2 Andi Kleen              2012-01-12  1164  	 * Avoid references to bdev if not absolutely needed to give
65dd2aa90aa17a2 Andi Kleen              2012-01-12  1165  	 * the early prefetch in the caller enough time.
65dd2aa90aa17a2 Andi Kleen              2012-01-12  1166  	 */
^1da177e4c3f415 Linus Torvalds          2005-04-16  1167  
886a39115005ced Al Viro                 2014-03-05  1168  	if (align & blocksize_mask) {
^1da177e4c3f415 Linus Torvalds          2005-04-16  1169  		if (bdev)
65dd2aa90aa17a2 Andi Kleen              2012-01-12  1170  			blkbits = blksize_bits(bdev_logical_block_size(bdev));
^1da177e4c3f415 Linus Torvalds          2005-04-16  1171  		blocksize_mask = (1 << blkbits) - 1;
886a39115005ced Al Viro                 2014-03-05  1172  		if (align & blocksize_mask)
46d716025a228de Gabriel Krisman Bertazi 2020-10-08  1173  			return -EINVAL;
^1da177e4c3f415 Linus Torvalds          2005-04-16  1174  	}
^1da177e4c3f415 Linus Torvalds          2005-04-16  1175  
f9b5570d7fdedff Christoph Hellwig       2011-06-24  1176  	/* watch out for a 0 len io from a tricksy fs */
1c0ff0f1bdeb183 Nikolay Borisov         2018-04-05  1177  	if (iov_iter_rw(iter) == READ && !count)
f9b5570d7fdedff Christoph Hellwig       2011-06-24  1178  		return 0;
f9b5570d7fdedff Christoph Hellwig       2011-06-24  1179  
6e8267f532a1716 Andi Kleen              2011-08-01 @1180  	dio = kmem_cache_alloc(dio_cache, GFP_KERNEL);
^1da177e4c3f415 Linus Torvalds          2005-04-16  1181  	if (!dio)
46d716025a228de Gabriel Krisman Bertazi 2020-10-08  1182  		return -ENOMEM;
23aee091d804efa Jeff Moyer              2009-12-15  1183  	/*
23aee091d804efa Jeff Moyer              2009-12-15  1184  	 * Believe it or not, zeroing out the page array caused a .5%
23aee091d804efa Jeff Moyer              2009-12-15  1185  	 * performance regression in a database benchmark.  So, we take
23aee091d804efa Jeff Moyer              2009-12-15  1186  	 * care to only zero out what's needed.
23aee091d804efa Jeff Moyer              2009-12-15  1187  	 */
23aee091d804efa Jeff Moyer              2009-12-15  1188  	memset(dio, 0, offsetof(struct dio, pages));
^1da177e4c3f415 Linus Torvalds          2005-04-16  1189  
5fe878ae7f82fbf Christoph Hellwig       2009-12-15  1190  	dio->flags = flags;
5fe878ae7f82fbf Christoph Hellwig       2009-12-15  1191  	if (dio->flags & DIO_LOCKING) {
17f8c842d24ac05 Omar Sandoval           2015-03-16  1192  		if (iov_iter_rw(iter) == READ) {
5fe878ae7f82fbf Christoph Hellwig       2009-12-15  1193  			struct address_space *mapping =
5fe878ae7f82fbf Christoph Hellwig       2009-12-15  1194  					iocb->ki_filp->f_mapping;
^1da177e4c3f415 Linus Torvalds          2005-04-16  1195  
5fe878ae7f82fbf Christoph Hellwig       2009-12-15  1196  			/* will be released by direct_io_worker */
5955102c9984fa0 Al Viro                 2016-01-22  1197  			inode_lock(inode);
^1da177e4c3f415 Linus Torvalds          2005-04-16  1198  
^1da177e4c3f415 Linus Torvalds          2005-04-16  1199  			retval = filemap_write_and_wait_range(mapping, offset,
^1da177e4c3f415 Linus Torvalds          2005-04-16  1200  							      end - 1);
46d716025a228de Gabriel Krisman Bertazi 2020-10-08  1201  			if (retval)
46d716025a228de Gabriel Krisman Bertazi 2020-10-08  1202  				goto fail_dio;
^1da177e4c3f415 Linus Torvalds          2005-04-16  1203  		}
df2d6f26586f12a Christoph Hellwig       2011-06-24  1204  	}
^1da177e4c3f415 Linus Torvalds          2005-04-16  1205  
74cedf9b6c603f2 Jan Kara                2015-11-30  1206  	/* Once we sampled i_size check for reads beyond EOF */
74cedf9b6c603f2 Jan Kara                2015-11-30  1207  	dio->i_size = i_size_read(inode);
74cedf9b6c603f2 Jan Kara                2015-11-30  1208  	if (iov_iter_rw(iter) == READ && offset >= dio->i_size) {
2d4594acbf6d8f7 Al Viro                 2015-12-08  1209  		retval = 0;
46d716025a228de Gabriel Krisman Bertazi 2020-10-08  1210  		goto fail_dio;
74cedf9b6c603f2 Jan Kara                2015-11-30  1211  	}
74cedf9b6c603f2 Jan Kara                2015-11-30  1212  
^1da177e4c3f415 Linus Torvalds          2005-04-16  1213  	/*
6039257378e4c84 Christoph Hellwig       2014-02-10  1214  	 * For file extending writes updating i_size before data writeouts
6039257378e4c84 Christoph Hellwig       2014-02-10  1215  	 * complete can expose uninitialized blocks in dumb filesystems.
6039257378e4c84 Christoph Hellwig       2014-02-10  1216  	 * In that case we need to wait for I/O completion even if asked
6039257378e4c84 Christoph Hellwig       2014-02-10  1217  	 * for an asynchronous write.
^1da177e4c3f415 Linus Torvalds          2005-04-16  1218  	 */
6039257378e4c84 Christoph Hellwig       2014-02-10  1219  	if (is_sync_kiocb(iocb))
6039257378e4c84 Christoph Hellwig       2014-02-10  1220  		dio->is_async = false;
c8f4c36f8162300 Nikolay Borisov         2018-02-23  1221  	else if (iov_iter_rw(iter) == WRITE && end > i_size_read(inode))
6039257378e4c84 Christoph Hellwig       2014-02-10  1222  		dio->is_async = false;
6039257378e4c84 Christoph Hellwig       2014-02-10  1223  	else
6039257378e4c84 Christoph Hellwig       2014-02-10  1224  		dio->is_async = true;
6039257378e4c84 Christoph Hellwig       2014-02-10  1225  
847cc6371ba8207 Andi Kleen              2011-08-01  1226  	dio->inode = inode;
8a4c1e42e0eb718 Mike Christie           2016-06-05  1227  	if (iov_iter_rw(iter) == WRITE) {
8a4c1e42e0eb718 Mike Christie           2016-06-05  1228  		dio->op = REQ_OP_WRITE;
70fd76140a6cb63 Christoph Hellwig       2016-11-01  1229  		dio->op_flags = REQ_SYNC | REQ_IDLE;
03a07c92a9ed993 Goldwyn Rodrigues       2017-06-20  1230  		if (iocb->ki_flags & IOCB_NOWAIT)
03a07c92a9ed993 Goldwyn Rodrigues       2017-06-20  1231  			dio->op_flags |= REQ_NOWAIT;
8a4c1e42e0eb718 Mike Christie           2016-06-05  1232  	} else {
8a4c1e42e0eb718 Mike Christie           2016-06-05  1233  		dio->op = REQ_OP_READ;
8a4c1e42e0eb718 Mike Christie           2016-06-05  1234  	}
d1e36282b0bbd5d Jens Axboe              2018-08-29  1235  	if (iocb->ki_flags & IOCB_HIPRI)
d1e36282b0bbd5d Jens Axboe              2018-08-29  1236  		dio->op_flags |= REQ_HIPRI;
02afc27faec94c9 Christoph Hellwig       2013-09-04  1237  
02afc27faec94c9 Christoph Hellwig       2013-09-04  1238  	/*
02afc27faec94c9 Christoph Hellwig       2013-09-04  1239  	 * For AIO O_(D)SYNC writes we need to defer completions to a workqueue
02afc27faec94c9 Christoph Hellwig       2013-09-04  1240  	 * so that we can call ->fsync.
02afc27faec94c9 Christoph Hellwig       2013-09-04  1241  	 */
332391a9935da93 Lukas Czerner           2017-09-21  1242  	if (dio->is_async && iov_iter_rw(iter) == WRITE) {
332391a9935da93 Lukas Czerner           2017-09-21  1243  		retval = 0;
d9c10e5b8863cfb Jan Kara                2018-02-26  1244  		if (iocb->ki_flags & IOCB_DSYNC)
02afc27faec94c9 Christoph Hellwig       2013-09-04  1245  			retval = dio_set_defer_completion(dio);
332391a9935da93 Lukas Czerner           2017-09-21  1246  		else if (!dio->inode->i_sb->s_dio_done_wq) {
332391a9935da93 Lukas Czerner           2017-09-21  1247  			/*
332391a9935da93 Lukas Czerner           2017-09-21  1248  			 * In case of AIO write racing with buffered read we
332391a9935da93 Lukas Czerner           2017-09-21  1249  			 * need to defer completion. We can't decide this now,
332391a9935da93 Lukas Czerner           2017-09-21  1250  			 * however the workqueue needs to be initialized here.
332391a9935da93 Lukas Czerner           2017-09-21  1251  			 */
332391a9935da93 Lukas Czerner           2017-09-21  1252  			retval = sb_init_dio_done_wq(dio->inode->i_sb);
332391a9935da93 Lukas Czerner           2017-09-21  1253  		}
46d716025a228de Gabriel Krisman Bertazi 2020-10-08  1254  		if (retval)
46d716025a228de Gabriel Krisman Bertazi 2020-10-08  1255  			goto fail_dio;
02afc27faec94c9 Christoph Hellwig       2013-09-04  1256  	}
02afc27faec94c9 Christoph Hellwig       2013-09-04  1257  
02afc27faec94c9 Christoph Hellwig       2013-09-04  1258  	/*
02afc27faec94c9 Christoph Hellwig       2013-09-04  1259  	 * Will be decremented at I/O completion time.
02afc27faec94c9 Christoph Hellwig       2013-09-04  1260  	 */
fe0f07d08ee35fb Jens Axboe              2015-04-15  1261  	inode_dio_begin(inode);
02afc27faec94c9 Christoph Hellwig       2013-09-04  1262  
02afc27faec94c9 Christoph Hellwig       2013-09-04  1263  	retval = 0;
847cc6371ba8207 Andi Kleen              2011-08-01  1264  	sdio.blkbits = blkbits;
ab73857e354ab9e Linus Torvalds          2012-11-29  1265  	sdio.blkfactor = i_blkbits - blkbits;
847cc6371ba8207 Andi Kleen              2011-08-01  1266  	sdio.block_in_file = offset >> blkbits;
847cc6371ba8207 Andi Kleen              2011-08-01  1267  
847cc6371ba8207 Andi Kleen              2011-08-01  1268  	sdio.get_block = get_block;
847cc6371ba8207 Andi Kleen              2011-08-01  1269  	dio->end_io = end_io;
847cc6371ba8207 Andi Kleen              2011-08-01  1270  	sdio.submit_io = submit_io;
847cc6371ba8207 Andi Kleen              2011-08-01  1271  	sdio.final_block_in_bio = -1;
847cc6371ba8207 Andi Kleen              2011-08-01  1272  	sdio.next_block_for_io = -1;
847cc6371ba8207 Andi Kleen              2011-08-01  1273  
847cc6371ba8207 Andi Kleen              2011-08-01  1274  	dio->iocb = iocb;
847cc6371ba8207 Andi Kleen              2011-08-01  1275  
847cc6371ba8207 Andi Kleen              2011-08-01  1276  	spin_lock_init(&dio->bio_lock);
847cc6371ba8207 Andi Kleen              2011-08-01  1277  	dio->refcount = 1;
847cc6371ba8207 Andi Kleen              2011-08-01  1278  
00e23707442a75b David Howells           2018-10-22  1279  	dio->should_dirty = iter_is_iovec(iter) && iov_iter_rw(iter) == READ;
7b2c99d15559e28 Al Viro                 2014-03-15  1280  	sdio.iter = iter;
1c0ff0f1bdeb183 Nikolay Borisov         2018-04-05  1281  	sdio.final_block_in_request = end >> blkbits;
7b2c99d15559e28 Al Viro                 2014-03-15  1282  
847cc6371ba8207 Andi Kleen              2011-08-01  1283  	/*
847cc6371ba8207 Andi Kleen              2011-08-01  1284  	 * In case of non-aligned buffers, we may need 2 more
847cc6371ba8207 Andi Kleen              2011-08-01  1285  	 * pages since we need to zero out first and last block.
847cc6371ba8207 Andi Kleen              2011-08-01  1286  	 */
847cc6371ba8207 Andi Kleen              2011-08-01  1287  	if (unlikely(sdio.blkfactor))
847cc6371ba8207 Andi Kleen              2011-08-01  1288  		sdio.pages_in_io = 2;
847cc6371ba8207 Andi Kleen              2011-08-01  1289  
f67da30c1d5fc9e Al Viro                 2014-03-19  1290  	sdio.pages_in_io += iov_iter_npages(iter, INT_MAX);
847cc6371ba8207 Andi Kleen              2011-08-01  1291  
647d1e4c5235763 Fengguang Wu            2012-08-09  1292  	blk_start_plug(&plug);
647d1e4c5235763 Fengguang Wu            2012-08-09  1293  
847cc6371ba8207 Andi Kleen              2011-08-01  1294  	retval = do_direct_IO(dio, &sdio, &map_bh);
7b2c99d15559e28 Al Viro                 2014-03-15  1295  	if (retval)
847cc6371ba8207 Andi Kleen              2011-08-01  1296  		dio_cleanup(dio, &sdio);
847cc6371ba8207 Andi Kleen              2011-08-01  1297  
847cc6371ba8207 Andi Kleen              2011-08-01  1298  	if (retval == -ENOTBLK) {
847cc6371ba8207 Andi Kleen              2011-08-01  1299  		/*
847cc6371ba8207 Andi Kleen              2011-08-01  1300  		 * The remaining part of the request will be
847cc6371ba8207 Andi Kleen              2011-08-01  1301  		 * be handled by buffered I/O when we return
847cc6371ba8207 Andi Kleen              2011-08-01  1302  		 */
847cc6371ba8207 Andi Kleen              2011-08-01  1303  		retval = 0;
847cc6371ba8207 Andi Kleen              2011-08-01  1304  	}
847cc6371ba8207 Andi Kleen              2011-08-01  1305  	/*
847cc6371ba8207 Andi Kleen              2011-08-01  1306  	 * There may be some unwritten disk at the end of a part-written
847cc6371ba8207 Andi Kleen              2011-08-01  1307  	 * fs-block-sized block.  Go zero that now.
847cc6371ba8207 Andi Kleen              2011-08-01  1308  	 */
847cc6371ba8207 Andi Kleen              2011-08-01  1309  	dio_zero_block(dio, &sdio, 1, &map_bh);
847cc6371ba8207 Andi Kleen              2011-08-01  1310  
847cc6371ba8207 Andi Kleen              2011-08-01  1311  	if (sdio.cur_page) {
847cc6371ba8207 Andi Kleen              2011-08-01  1312  		ssize_t ret2;
847cc6371ba8207 Andi Kleen              2011-08-01  1313  
847cc6371ba8207 Andi Kleen              2011-08-01  1314  		ret2 = dio_send_cur_page(dio, &sdio, &map_bh);
847cc6371ba8207 Andi Kleen              2011-08-01  1315  		if (retval == 0)
847cc6371ba8207 Andi Kleen              2011-08-01  1316  			retval = ret2;
09cbfeaf1a5a67b Kirill A. Shutemov      2016-04-01  1317  		put_page(sdio.cur_page);
847cc6371ba8207 Andi Kleen              2011-08-01  1318  		sdio.cur_page = NULL;
847cc6371ba8207 Andi Kleen              2011-08-01  1319  	}
847cc6371ba8207 Andi Kleen              2011-08-01  1320  	if (sdio.bio)
847cc6371ba8207 Andi Kleen              2011-08-01  1321  		dio_bio_submit(dio, &sdio);
847cc6371ba8207 Andi Kleen              2011-08-01  1322  
647d1e4c5235763 Fengguang Wu            2012-08-09  1323  	blk_finish_plug(&plug);
647d1e4c5235763 Fengguang Wu            2012-08-09  1324  
847cc6371ba8207 Andi Kleen              2011-08-01  1325  	/*
847cc6371ba8207 Andi Kleen              2011-08-01  1326  	 * It is possible that, we return short IO due to end of file.
847cc6371ba8207 Andi Kleen              2011-08-01  1327  	 * In that case, we need to release all the pages we got hold on.
847cc6371ba8207 Andi Kleen              2011-08-01  1328  	 */
847cc6371ba8207 Andi Kleen              2011-08-01  1329  	dio_cleanup(dio, &sdio);
847cc6371ba8207 Andi Kleen              2011-08-01  1330  
847cc6371ba8207 Andi Kleen              2011-08-01  1331  	/*
847cc6371ba8207 Andi Kleen              2011-08-01  1332  	 * All block lookups have been performed. For READ requests
847cc6371ba8207 Andi Kleen              2011-08-01  1333  	 * we can let i_mutex go now that its achieved its purpose
847cc6371ba8207 Andi Kleen              2011-08-01  1334  	 * of protecting us from looking up uninitialized blocks.
847cc6371ba8207 Andi Kleen              2011-08-01  1335  	 */
17f8c842d24ac05 Omar Sandoval           2015-03-16  1336  	if (iov_iter_rw(iter) == READ && (dio->flags & DIO_LOCKING))
5955102c9984fa0 Al Viro                 2016-01-22  1337  		inode_unlock(dio->inode);
847cc6371ba8207 Andi Kleen              2011-08-01  1338  
847cc6371ba8207 Andi Kleen              2011-08-01  1339  	/*
847cc6371ba8207 Andi Kleen              2011-08-01  1340  	 * The only time we want to leave bios in flight is when a successful
847cc6371ba8207 Andi Kleen              2011-08-01  1341  	 * partial aio read or full aio write have been setup.  In that case
847cc6371ba8207 Andi Kleen              2011-08-01  1342  	 * bio completion will call aio_complete.  The only time it's safe to
847cc6371ba8207 Andi Kleen              2011-08-01  1343  	 * call aio_complete is when we return -EIOCBQUEUED, so we key on that.
847cc6371ba8207 Andi Kleen              2011-08-01  1344  	 * This had *better* be the only place that raises -EIOCBQUEUED.
847cc6371ba8207 Andi Kleen              2011-08-01  1345  	 */
847cc6371ba8207 Andi Kleen              2011-08-01  1346  	BUG_ON(retval == -EIOCBQUEUED);
847cc6371ba8207 Andi Kleen              2011-08-01  1347  	if (dio->is_async && retval == 0 && dio->result &&
17f8c842d24ac05 Omar Sandoval           2015-03-16  1348  	    (iov_iter_rw(iter) == READ || dio->result == count))
847cc6371ba8207 Andi Kleen              2011-08-01  1349  		retval = -EIOCBQUEUED;
af436472772d474 Christoph Hellwig       2014-07-30  1350  	else
847cc6371ba8207 Andi Kleen              2011-08-01  1351  		dio_await_completion(dio);
847cc6371ba8207 Andi Kleen              2011-08-01  1352  
847cc6371ba8207 Andi Kleen              2011-08-01  1353  	if (drop_refcount(dio) == 0) {
ffe51f0142a291a Lukas Czerner           2017-10-17  1354  		retval = dio_complete(dio, retval, DIO_COMPLETE_INVALIDATE);
847cc6371ba8207 Andi Kleen              2011-08-01  1355  	} else
847cc6371ba8207 Andi Kleen              2011-08-01  1356  		BUG_ON(retval != -EIOCBQUEUED);
^1da177e4c3f415 Linus Torvalds          2005-04-16  1357  
46d716025a228de Gabriel Krisman Bertazi 2020-10-08  1358  	return retval;
46d716025a228de Gabriel Krisman Bertazi 2020-10-08  1359  
46d716025a228de Gabriel Krisman Bertazi 2020-10-08  1360  fail_dio:
46d716025a228de Gabriel Krisman Bertazi 2020-10-08  1361  	if (dio->flags & DIO_LOCKING && iov_iter_rw(iter) == READ)
46d716025a228de Gabriel Krisman Bertazi 2020-10-08  1362  		inode_unlock(inode);
46d716025a228de Gabriel Krisman Bertazi 2020-10-08  1363  
46d716025a228de Gabriel Krisman Bertazi 2020-10-08  1364  	kmem_cache_free(dio_cache, dio);
7bb46a6734a7e1a npiggin@suse.de         2010-05-27  1365  	return retval;
7bb46a6734a7e1a npiggin@suse.de         2010-05-27  1366  }
65dd2aa90aa17a2 Andi Kleen              2012-01-12  1367  

:::::: The code at line 1180 was first introduced by commit
:::::: 6e8267f532a17165ab551ac5fdafcba5333dcca5 direct-io: use a slab cache for struct dio

:::::: TO: Andi Kleen <ak@linux.intel.com>
:::::: CC: root <root@serles.lst.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
