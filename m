Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220E718C25
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Jul 2023 18:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689879559; x=1721415559;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SZd503+BVXQnUtk4h5W9W6tZkrB5qSWCp2OD2k+rpX4=;
  b=PYYw/Wb/QDPlb+TktIZNa1A0mMytkaMy/D+HGg91ULMC1Wfb9Gc1Tdoa
   scKoZ/5SqeNAtgtiXvou7WNphuRJAZcsQat1SoLTRpGOcLnf5i3YcRMeG
   7lcbWBbLxoZd+PO34B3gFmhL6tT1S3I0hnyzY5z3uErToaCMDqamPFSqW
   reBXoo+y5lZrHbZiMHcyAhCSDjedpzfiDyoFFEXc36LKGQJ1bgMc+oV0i
   ygpz+pSf5IuhMKdtQgIBkhYTw1NIHuaEemWP4zg6TgCPU6I+XmWKjQWsm
   I832nFLlX9c8n6GXIh1WitErg0CUCEuezj6aUCdX+LoapY+dHnWaoNj9T
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="364302346"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="364302346"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 11:59:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="701765445"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="701765445"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 20 Jul 2023 11:59:14 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMYrp-0006PP-1t;
	Thu, 20 Jul 2023 18:59:13 +0000
Date: Fri, 21 Jul 2023 02:58:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/block/drbd/drbd_worker.c:588 make_resync_request() warn:
 variable dereferenced before check 'peer_device' (see line 587)
Message-ID: <202307210201.NF8Ro2N0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Christoph Böhmwalder" <christoph.boehmwalder@linbit.com>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   46670259519f4ee4ab378dc014798aabe77c5057
commit: 0d11f3cf279c5ad20a41f29242f170ba3c02f2da drbd: Pass a peer device to the resync and online verify functions
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
config: parisc-randconfig-m041-20230720 (https://download.01.org/0day-ci/archive/20230721/202307210201.NF8Ro2N0-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210201.NF8Ro2N0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307210201.NF8Ro2N0-lkp@intel.com/

smatch warnings:
drivers/block/drbd/drbd_worker.c:588 make_resync_request() warn: variable dereferenced before check 'peer_device' (see line 587)

vim +/peer_device +588 drivers/block/drbd/drbd_worker.c

e65f440d474d7d Lars Ellenberg       2010-11-05  584  
0d11f3cf279c5a Christoph Böhmwalder 2023-03-30  585  static int make_resync_request(struct drbd_peer_device *const peer_device, int cancel)
b411b3637fa71f Philipp Reisner      2009-09-25  586  {
0d11f3cf279c5a Christoph Böhmwalder 2023-03-30 @587  	struct drbd_device *const device = peer_device->device;
44a4d551846b8c Lars Ellenberg       2013-11-22 @588  	struct drbd_connection *const connection = peer_device ? peer_device->connection : NULL;
b411b3637fa71f Philipp Reisner      2009-09-25  589  	unsigned long bit;
b411b3637fa71f Philipp Reisner      2009-09-25  590  	sector_t sector;
155bd9d1abd604 Christoph Hellwig    2020-09-25  591  	const sector_t capacity = get_capacity(device->vdisk);
1816a2b47afae8 Lars Ellenberg       2010-11-11  592  	int max_bio_size;
e65f440d474d7d Lars Ellenberg       2010-11-05  593  	int number, rollback_i, size;
506afb6248af57 Lars Ellenberg       2014-01-31  594  	int align, requeue = 0;
0f0601f4ea2f53 Lars Ellenberg       2010-08-11  595  	int i = 0;
92d94ae66aebda Philipp Reisner      2016-06-14  596  	int discard_granularity = 0;
b411b3637fa71f Philipp Reisner      2009-09-25  597  
b411b3637fa71f Philipp Reisner      2009-09-25  598  	if (unlikely(cancel))
99920dc5c5fe52 Andreas Gruenbacher  2011-03-16  599  		return 0;
b411b3637fa71f Philipp Reisner      2009-09-25  600  
b30ab7913b0a7b Andreas Gruenbacher  2011-07-03  601  	if (device->rs_total == 0) {
af85e8e83d160f Lars Ellenberg       2010-10-07  602  		/* empty resync? */
0d11f3cf279c5a Christoph Böhmwalder 2023-03-30  603  		drbd_resync_finished(peer_device);
99920dc5c5fe52 Andreas Gruenbacher  2011-03-16  604  		return 0;
af85e8e83d160f Lars Ellenberg       2010-10-07  605  	}
af85e8e83d160f Lars Ellenberg       2010-10-07  606  
b30ab7913b0a7b Andreas Gruenbacher  2011-07-03  607  	if (!get_ldev(device)) {
b30ab7913b0a7b Andreas Gruenbacher  2011-07-03  608  		/* Since we only need to access device->rsync a
b30ab7913b0a7b Andreas Gruenbacher  2011-07-03  609  		   get_ldev_if_state(device,D_FAILED) would be sufficient, but
b411b3637fa71f Philipp Reisner      2009-09-25  610  		   to continue resync with a broken disk makes no sense at
b411b3637fa71f Philipp Reisner      2009-09-25  611  		   all */
d01801710265cf Andreas Gruenbacher  2011-07-03  612  		drbd_err(device, "Disk broke down during resync!\n");
99920dc5c5fe52 Andreas Gruenbacher  2011-03-16  613  		return 0;
b411b3637fa71f Philipp Reisner      2009-09-25  614  	}
b411b3637fa71f Philipp Reisner      2009-09-25  615  
9104d31a759fba Lars Ellenberg       2016-06-14  616  	if (connection->agreed_features & DRBD_FF_THIN_RESYNC) {
92d94ae66aebda Philipp Reisner      2016-06-14  617  		rcu_read_lock();
92d94ae66aebda Philipp Reisner      2016-06-14  618  		discard_granularity = rcu_dereference(device->ldev->disk_conf)->rs_discard_granularity;
92d94ae66aebda Philipp Reisner      2016-06-14  619  		rcu_read_unlock();
92d94ae66aebda Philipp Reisner      2016-06-14  620  	}
92d94ae66aebda Philipp Reisner      2016-06-14  621  
b30ab7913b0a7b Andreas Gruenbacher  2011-07-03  622  	max_bio_size = queue_max_hw_sectors(device->rq_queue) << 9;
0d11f3cf279c5a Christoph Böhmwalder 2023-03-30  623  	number = drbd_rs_number_requests(peer_device);
0e49d7b014c5d5 Lars Ellenberg       2014-04-28  624  	if (number <= 0)
0f0601f4ea2f53 Lars Ellenberg       2010-08-11  625  		goto requeue;
b411b3637fa71f Philipp Reisner      2009-09-25  626  
b411b3637fa71f Philipp Reisner      2009-09-25  627  	for (i = 0; i < number; i++) {
506afb6248af57 Lars Ellenberg       2014-01-31  628  		/* Stop generating RS requests when half of the send buffer is filled,
506afb6248af57 Lars Ellenberg       2014-01-31  629  		 * but notify TCP that we'd like to have more space. */
44a4d551846b8c Lars Ellenberg       2013-11-22  630  		mutex_lock(&connection->data.mutex);
44a4d551846b8c Lars Ellenberg       2013-11-22  631  		if (connection->data.socket) {
506afb6248af57 Lars Ellenberg       2014-01-31  632  			struct sock *sk = connection->data.socket->sk;
506afb6248af57 Lars Ellenberg       2014-01-31  633  			int queued = sk->sk_wmem_queued;
506afb6248af57 Lars Ellenberg       2014-01-31  634  			int sndbuf = sk->sk_sndbuf;
506afb6248af57 Lars Ellenberg       2014-01-31  635  			if (queued > sndbuf / 2) {
506afb6248af57 Lars Ellenberg       2014-01-31  636  				requeue = 1;
506afb6248af57 Lars Ellenberg       2014-01-31  637  				if (sk->sk_socket)
506afb6248af57 Lars Ellenberg       2014-01-31  638  					set_bit(SOCK_NOSPACE, &sk->sk_socket->flags);
b411b3637fa71f Philipp Reisner      2009-09-25  639  			}
506afb6248af57 Lars Ellenberg       2014-01-31  640  		} else
506afb6248af57 Lars Ellenberg       2014-01-31  641  			requeue = 1;
44a4d551846b8c Lars Ellenberg       2013-11-22  642  		mutex_unlock(&connection->data.mutex);
506afb6248af57 Lars Ellenberg       2014-01-31  643  		if (requeue)
b411b3637fa71f Philipp Reisner      2009-09-25  644  			goto requeue;
b411b3637fa71f Philipp Reisner      2009-09-25  645  
b411b3637fa71f Philipp Reisner      2009-09-25  646  next_sector:
b411b3637fa71f Philipp Reisner      2009-09-25  647  		size = BM_BLOCK_SIZE;
b30ab7913b0a7b Andreas Gruenbacher  2011-07-03  648  		bit  = drbd_bm_find_next(device, device->bm_resync_fo);
b411b3637fa71f Philipp Reisner      2009-09-25  649  
4b0715f09655e7 Lars Ellenberg       2010-12-14  650  		if (bit == DRBD_END_OF_BITMAP) {
b30ab7913b0a7b Andreas Gruenbacher  2011-07-03  651  			device->bm_resync_fo = drbd_bm_bits(device);
b30ab7913b0a7b Andreas Gruenbacher  2011-07-03  652  			put_ldev(device);
99920dc5c5fe52 Andreas Gruenbacher  2011-03-16  653  			return 0;
b411b3637fa71f Philipp Reisner      2009-09-25  654  		}
b411b3637fa71f Philipp Reisner      2009-09-25  655  
b411b3637fa71f Philipp Reisner      2009-09-25  656  		sector = BM_BIT_TO_SECT(bit);
b411b3637fa71f Philipp Reisner      2009-09-25  657  
0d11f3cf279c5a Christoph Böhmwalder 2023-03-30  658  		if (drbd_try_rs_begin_io(peer_device, sector)) {
b30ab7913b0a7b Andreas Gruenbacher  2011-07-03  659  			device->bm_resync_fo = bit;
b411b3637fa71f Philipp Reisner      2009-09-25  660  			goto requeue;
b411b3637fa71f Philipp Reisner      2009-09-25  661  		}
b30ab7913b0a7b Andreas Gruenbacher  2011-07-03  662  		device->bm_resync_fo = bit + 1;
b411b3637fa71f Philipp Reisner      2009-09-25  663  
b30ab7913b0a7b Andreas Gruenbacher  2011-07-03  664  		if (unlikely(drbd_bm_test_bit(device, bit) == 0)) {
b30ab7913b0a7b Andreas Gruenbacher  2011-07-03  665  			drbd_rs_complete_io(device, sector);
b411b3637fa71f Philipp Reisner      2009-09-25  666  			goto next_sector;
b411b3637fa71f Philipp Reisner      2009-09-25  667  		}
b411b3637fa71f Philipp Reisner      2009-09-25  668  

:::::: The code at line 588 was first introduced by commit
:::::: 44a4d551846b8c61aa430b9432c1fcdf88444708 drbd: refactor use of first_peer_device()

:::::: TO: Lars Ellenberg <lars.ellenberg@linbit.com>
:::::: CC: Philipp Reisner <philipp.reisner@linbit.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
