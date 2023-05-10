Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A6616413
	for <oe-kbuild@lists.linux.dev>; Wed, 10 May 2023 19:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683748607; x=1715284607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kOl8jcmGvlApFnbUVVAk+XHLjhOFPPFlwpoZ1JMMacM=;
  b=eCzJjgkW7yC/zyZzpfcEjgLFnrS92J/Y/vw6AlewhSwyitTSdYeCVBVd
   mlIKVK9ovYtU4nTXH6Kv12/wr/a6ljSlrGyxoP3f4/cz/Nc9zj6unzQpH
   IkBnlWInaqBjSiRD1ZMd3oRiaAop4a08oa9nRo5fRAqiP3De0uzUJQaO/
   jCasrROLN6z84be3yoTsuWhgYSHZxdqSITzYeD204jeDpbPtRSRcWmofa
   m1zeCF/8NhWVfRfF9QzkHRC9aSl8Nij84alR9671iNluG7JMLQhOI/7D0
   f23yb+2lnBA01KVKNF3bO66HI20zCDoaWy4serygb+y/siYSiv4eWBRd+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="339560335"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="339560335"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 12:56:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="823654527"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="823654527"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 May 2023 12:56:45 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwpvY-0003Xw-2n;
	Wed, 10 May 2023 19:56:44 +0000
Date: Thu, 11 May 2023 03:55:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 22/32] vfs: inode cache conversion to hash-bl
Message-ID: <202305110304.n2TEQd6l-lkp@intel.com>
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
In-Reply-To: <20230509165657.1735798-23-kent.overstreet@linux.dev>
References: <20230509165657.1735798-23-kent.overstreet@linux.dev>
TO: Kent Overstreet <kmo@daterainc.com>
TO: linux-kernel@vger.kernel.org
TO: linux-fsdevel@vger.kernel.org
TO: linux-bcachefs@vger.kernel.org
CC: Dave Chinner <dchinner@redhat.com>
CC: Alexander Viro <viro@zeniv.linux.org.uk>
CC: Christian Brauner <brauner@kernel.org>
CC: Kent Overstreet <kmo@daterainc.com>

Hi Kent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/locking/core]
[cannot apply to axboe-block/for-next akpm-mm/mm-everything kdave/for-next linus/master v6.4-rc1 next-20230510]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kent-Overstreet/Compiler-Attributes-add-__flatten/20230510-010302
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20230509165657.1735798-23-kent.overstreet%40linux.dev
patch subject: [PATCH 22/32] vfs: inode cache conversion to hash-bl
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230511/202305110304.n2TEQd6l-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305110304.n2TEQd6l-lkp@intel.com/

New smatch warnings:
fs/inode.c:1232 inode_insert5() warn: sleeping in atomic context
fs/inode.c:1331 iget_locked() warn: sleeping in atomic context
fs/inode.c:1543 ilookup() warn: sleeping in atomic context
fs/inode.c:1724 insert_inode_locked() warn: sleeping in atomic context

Old smatch warnings:
fs/inode.c:1371 iget_locked() warn: sleeping in atomic context

vim +1232 fs/inode.c

375e289ea85166 J. Bruce Fields   2012-04-18  1193  
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1194  /**
80ea09a002bf43 Miklos Szeredi    2018-05-17  1195   * inode_insert5 - obtain an inode from a mounted file system
80ea09a002bf43 Miklos Szeredi    2018-05-17  1196   * @inode:	pre-allocated inode to use for insert to cache
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1197   * @hashval:	hash value (usually inode number) to get
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1198   * @test:	callback used for comparisons between inodes
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1199   * @set:	callback used to initialize a new struct inode
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1200   * @data:	opaque data pointer to pass to @test and @set
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1201   *
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1202   * Search for the inode specified by @hashval and @data in the inode cache,
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1203   * and if present it is return it with an increased reference count. This is
80ea09a002bf43 Miklos Szeredi    2018-05-17  1204   * a variant of iget5_locked() for callers that don't want to fail on memory
80ea09a002bf43 Miklos Szeredi    2018-05-17  1205   * allocation of inode.
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1206   *
80ea09a002bf43 Miklos Szeredi    2018-05-17  1207   * If the inode is not in cache, insert the pre-allocated inode to cache and
80ea09a002bf43 Miklos Szeredi    2018-05-17  1208   * return it locked, hashed, and with the I_NEW flag set. The file system gets
80ea09a002bf43 Miklos Szeredi    2018-05-17  1209   * to fill it in before unlocking it via unlock_new_inode().
^1da177e4c3f41 Linus Torvalds    2005-04-16  1210   *
c41f58169b510c Dave Chinner      2023-05-09  1211   * Note both @test and @set are called with the inode hash chain lock held,
c41f58169b510c Dave Chinner      2023-05-09  1212   * so can't sleep.
^1da177e4c3f41 Linus Torvalds    2005-04-16  1213   */
80ea09a002bf43 Miklos Szeredi    2018-05-17  1214  struct inode *inode_insert5(struct inode *inode, unsigned long hashval,
6b3304b5317047 Manish Katiyar    2009-03-31  1215  			    int (*test)(struct inode *, void *),
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1216  			    int (*set)(struct inode *, void *), void *data)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1217  {
c41f58169b510c Dave Chinner      2023-05-09  1218  	struct hlist_bl_head *b = i_hash_head(inode->i_sb, hashval);
80ea09a002bf43 Miklos Szeredi    2018-05-17  1219  	struct inode *old;
80ea09a002bf43 Miklos Szeredi    2018-05-17  1220  
2864f301424227 Al Viro           2016-07-03  1221  again:
c41f58169b510c Dave Chinner      2023-05-09  1222  	hlist_bl_lock(b);
c41f58169b510c Dave Chinner      2023-05-09  1223  	old = find_inode(inode->i_sb, b, test, data);
80ea09a002bf43 Miklos Szeredi    2018-05-17  1224  	if (unlikely(old)) {
80ea09a002bf43 Miklos Szeredi    2018-05-17  1225  		/*
80ea09a002bf43 Miklos Szeredi    2018-05-17  1226  		 * Uhhuh, somebody else created the same inode under us.
80ea09a002bf43 Miklos Szeredi    2018-05-17  1227  		 * Use the old inode instead of the preallocated one.
80ea09a002bf43 Miklos Szeredi    2018-05-17  1228  		 */
c41f58169b510c Dave Chinner      2023-05-09  1229  		hlist_bl_unlock(b);
c2b6d621c4ffe9 Al Viro           2018-06-28  1230  		if (IS_ERR(old))
c2b6d621c4ffe9 Al Viro           2018-06-28  1231  			return NULL;
80ea09a002bf43 Miklos Szeredi    2018-05-17 @1232  		wait_on_inode(old);
80ea09a002bf43 Miklos Szeredi    2018-05-17  1233  		if (unlikely(inode_unhashed(old))) {
80ea09a002bf43 Miklos Szeredi    2018-05-17  1234  			iput(old);
2864f301424227 Al Viro           2016-07-03  1235  			goto again;
2864f301424227 Al Viro           2016-07-03  1236  		}
80ea09a002bf43 Miklos Szeredi    2018-05-17  1237  		return old;
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1238  	}
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1239  
80ea09a002bf43 Miklos Szeredi    2018-05-17  1240  	if (set && unlikely(set(inode, data))) {
80ea09a002bf43 Miklos Szeredi    2018-05-17  1241  		inode = NULL;
80ea09a002bf43 Miklos Szeredi    2018-05-17  1242  		goto unlock;
80ea09a002bf43 Miklos Szeredi    2018-05-17  1243  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1244  
80ea09a002bf43 Miklos Szeredi    2018-05-17  1245  	/*
80ea09a002bf43 Miklos Szeredi    2018-05-17  1246  	 * Return the locked inode with I_NEW set, the
80ea09a002bf43 Miklos Szeredi    2018-05-17  1247  	 * caller is responsible for filling in the contents
80ea09a002bf43 Miklos Szeredi    2018-05-17  1248  	 */
250df6ed274d76 Dave Chinner      2011-03-22  1249  	spin_lock(&inode->i_lock);
80ea09a002bf43 Miklos Szeredi    2018-05-17  1250  	inode->i_state |= I_NEW;
c41f58169b510c Dave Chinner      2023-05-09  1251  	__insert_inode_hash_head(inode, b);
250df6ed274d76 Dave Chinner      2011-03-22  1252  	spin_unlock(&inode->i_lock);
18cc912b8a2aca Jeff Layton       2022-03-31  1253  
18cc912b8a2aca Jeff Layton       2022-03-31  1254  	/*
18cc912b8a2aca Jeff Layton       2022-03-31  1255  	 * Add inode to the sb list if it's not already. It has I_NEW at this
18cc912b8a2aca Jeff Layton       2022-03-31  1256  	 * point, so it should be safe to test i_sb_list locklessly.
18cc912b8a2aca Jeff Layton       2022-03-31  1257  	 */
18cc912b8a2aca Jeff Layton       2022-03-31  1258  	if (list_empty(&inode->i_sb_list))
e950564b97fd0f Miklos Szeredi    2018-07-24  1259  		inode_sb_list_add(inode);
80ea09a002bf43 Miklos Szeredi    2018-05-17  1260  unlock:
c41f58169b510c Dave Chinner      2023-05-09  1261  	hlist_bl_unlock(b);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1262  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1263  	return inode;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1264  }
80ea09a002bf43 Miklos Szeredi    2018-05-17  1265  EXPORT_SYMBOL(inode_insert5);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1266  
80ea09a002bf43 Miklos Szeredi    2018-05-17  1267  /**
80ea09a002bf43 Miklos Szeredi    2018-05-17  1268   * iget5_locked - obtain an inode from a mounted file system
80ea09a002bf43 Miklos Szeredi    2018-05-17  1269   * @sb:		super block of file system
80ea09a002bf43 Miklos Szeredi    2018-05-17  1270   * @hashval:	hash value (usually inode number) to get
80ea09a002bf43 Miklos Szeredi    2018-05-17  1271   * @test:	callback used for comparisons between inodes
80ea09a002bf43 Miklos Szeredi    2018-05-17  1272   * @set:	callback used to initialize a new struct inode
80ea09a002bf43 Miklos Szeredi    2018-05-17  1273   * @data:	opaque data pointer to pass to @test and @set
80ea09a002bf43 Miklos Szeredi    2018-05-17  1274   *
80ea09a002bf43 Miklos Szeredi    2018-05-17  1275   * Search for the inode specified by @hashval and @data in the inode cache,
80ea09a002bf43 Miklos Szeredi    2018-05-17  1276   * and if present it is return it with an increased reference count. This is
80ea09a002bf43 Miklos Szeredi    2018-05-17  1277   * a generalized version of iget_locked() for file systems where the inode
80ea09a002bf43 Miklos Szeredi    2018-05-17  1278   * number is not sufficient for unique identification of an inode.
80ea09a002bf43 Miklos Szeredi    2018-05-17  1279   *
80ea09a002bf43 Miklos Szeredi    2018-05-17  1280   * If the inode is not in cache, allocate a new inode and return it locked,
80ea09a002bf43 Miklos Szeredi    2018-05-17  1281   * hashed, and with the I_NEW flag set. The file system gets to fill it in
80ea09a002bf43 Miklos Szeredi    2018-05-17  1282   * before unlocking it via unlock_new_inode().
80ea09a002bf43 Miklos Szeredi    2018-05-17  1283   *
80ea09a002bf43 Miklos Szeredi    2018-05-17  1284   * Note both @test and @set are called with the inode_hash_lock held, so can't
80ea09a002bf43 Miklos Szeredi    2018-05-17  1285   * sleep.
^1da177e4c3f41 Linus Torvalds    2005-04-16  1286   */
80ea09a002bf43 Miklos Szeredi    2018-05-17  1287  struct inode *iget5_locked(struct super_block *sb, unsigned long hashval,
80ea09a002bf43 Miklos Szeredi    2018-05-17  1288  		int (*test)(struct inode *, void *),
80ea09a002bf43 Miklos Szeredi    2018-05-17  1289  		int (*set)(struct inode *, void *), void *data)
80ea09a002bf43 Miklos Szeredi    2018-05-17  1290  {
80ea09a002bf43 Miklos Szeredi    2018-05-17  1291  	struct inode *inode = ilookup5(sb, hashval, test, data);
80ea09a002bf43 Miklos Szeredi    2018-05-17  1292  
80ea09a002bf43 Miklos Szeredi    2018-05-17  1293  	if (!inode) {
e950564b97fd0f Miklos Szeredi    2018-07-24  1294  		struct inode *new = alloc_inode(sb);
80ea09a002bf43 Miklos Szeredi    2018-05-17  1295  
80ea09a002bf43 Miklos Szeredi    2018-05-17  1296  		if (new) {
e950564b97fd0f Miklos Szeredi    2018-07-24  1297  			new->i_state = 0;
80ea09a002bf43 Miklos Szeredi    2018-05-17  1298  			inode = inode_insert5(new, hashval, test, set, data);
80ea09a002bf43 Miklos Szeredi    2018-05-17  1299  			if (unlikely(inode != new))
e950564b97fd0f Miklos Szeredi    2018-07-24  1300  				destroy_inode(new);
2864f301424227 Al Viro           2016-07-03  1301  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1302  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1303  	return inode;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1304  }
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1305  EXPORT_SYMBOL(iget5_locked);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1306  
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1307  /**
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1308   * iget_locked - obtain an inode from a mounted file system
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1309   * @sb:		super block of file system
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1310   * @ino:	inode number to get
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1311   *
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1312   * Search for the inode specified by @ino in the inode cache and if present
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1313   * return it with an increased reference count. This is for file systems
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1314   * where the inode number is sufficient for unique identification of an inode.
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1315   *
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1316   * If the inode is not in cache, allocate a new inode and return it locked,
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1317   * hashed, and with the I_NEW flag set.  The file system gets to fill it in
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1318   * before unlocking it via unlock_new_inode().
^1da177e4c3f41 Linus Torvalds    2005-04-16  1319   */
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1320  struct inode *iget_locked(struct super_block *sb, unsigned long ino)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1321  {
c41f58169b510c Dave Chinner      2023-05-09  1322  	struct hlist_bl_head *b = i_hash_head(sb, ino);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1323  	struct inode *inode;
2864f301424227 Al Viro           2016-07-03  1324  again:
c41f58169b510c Dave Chinner      2023-05-09  1325  	hlist_bl_lock(b);
c41f58169b510c Dave Chinner      2023-05-09  1326  	inode = find_inode_fast(sb, b, ino);
c41f58169b510c Dave Chinner      2023-05-09  1327  	hlist_bl_unlock(b);
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1328  	if (inode) {
c2b6d621c4ffe9 Al Viro           2018-06-28  1329  		if (IS_ERR(inode))
c2b6d621c4ffe9 Al Viro           2018-06-28  1330  			return NULL;
0b2d0724e26a33 Christoph Hellwig 2011-03-23 @1331  		wait_on_inode(inode);
2864f301424227 Al Viro           2016-07-03  1332  		if (unlikely(inode_unhashed(inode))) {
2864f301424227 Al Viro           2016-07-03  1333  			iput(inode);
2864f301424227 Al Viro           2016-07-03  1334  			goto again;
2864f301424227 Al Viro           2016-07-03  1335  		}
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1336  		return inode;
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1337  	}
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1338  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1339  	inode = alloc_inode(sb);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1340  	if (inode) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1341  		struct inode *old;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1342  
c41f58169b510c Dave Chinner      2023-05-09  1343  		hlist_bl_lock(b);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1344  		/* We released the lock, so.. */
c41f58169b510c Dave Chinner      2023-05-09  1345  		old = find_inode_fast(sb, b, ino);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1346  		if (!old) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1347  			inode->i_ino = ino;
250df6ed274d76 Dave Chinner      2011-03-22  1348  			spin_lock(&inode->i_lock);
250df6ed274d76 Dave Chinner      2011-03-22  1349  			inode->i_state = I_NEW;
c41f58169b510c Dave Chinner      2023-05-09  1350  			__insert_inode_hash_head(inode, b);
250df6ed274d76 Dave Chinner      2011-03-22  1351  			spin_unlock(&inode->i_lock);
55fa6091d83160 Dave Chinner      2011-03-22  1352  			inode_sb_list_add(inode);
c41f58169b510c Dave Chinner      2023-05-09  1353  			hlist_bl_unlock(b);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1354  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1355  			/* Return the locked inode with I_NEW set, the
^1da177e4c3f41 Linus Torvalds    2005-04-16  1356  			 * caller is responsible for filling in the contents
^1da177e4c3f41 Linus Torvalds    2005-04-16  1357  			 */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1358  			return inode;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1359  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1360  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1361  		/*
^1da177e4c3f41 Linus Torvalds    2005-04-16  1362  		 * Uhhuh, somebody else created the same inode under
^1da177e4c3f41 Linus Torvalds    2005-04-16  1363  		 * us. Use the old inode instead of the one we just
^1da177e4c3f41 Linus Torvalds    2005-04-16  1364  		 * allocated.
^1da177e4c3f41 Linus Torvalds    2005-04-16  1365  		 */
c41f58169b510c Dave Chinner      2023-05-09  1366  		hlist_bl_unlock(b);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1367  		destroy_inode(inode);
c2b6d621c4ffe9 Al Viro           2018-06-28  1368  		if (IS_ERR(old))
c2b6d621c4ffe9 Al Viro           2018-06-28  1369  			return NULL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1370  		inode = old;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1371  		wait_on_inode(inode);
2864f301424227 Al Viro           2016-07-03  1372  		if (unlikely(inode_unhashed(inode))) {
2864f301424227 Al Viro           2016-07-03  1373  			iput(inode);
2864f301424227 Al Viro           2016-07-03  1374  			goto again;
2864f301424227 Al Viro           2016-07-03  1375  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1376  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1377  	return inode;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1378  }
0b2d0724e26a33 Christoph Hellwig 2011-03-23  1379  EXPORT_SYMBOL(iget_locked);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1380  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
