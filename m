Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E09B7C
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Jul 2023 01:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690594240; x=1722130240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ivqrcjVInmNorF2YiFLZTTl1vdJxK1mnDjuOK8M7Vjw=;
  b=UZkuK42vMM+8MEdt4J7wfhcccOU2vo3U7/sR9XTPcecsP0E0a7Rq5aMr
   PZc7yLokzOz9ZhJtUroAh21SEVA0rPpnhtPPFlPuB4LcgTD3W6OWm8QL2
   XZdMQvix1mlSQXfRmXM6laew5EmUeyWcFYlOCOfJRy4zL5k30t1qNi6eD
   09f2SyEvisNmG0r1AkYnLm05upJdtfwGXyCin/HzutO1zwljJvwFaH3g0
   8aVqtltImvhMQkOAaTheGO866Tkgs/BUCs7FgLU21sFTzXZPw7/E8MkiG
   SaIBD+1vziTskX8nv2+K7Lax0lY3BnkyyYKcW9MFj1uLUBs2oAWxk8Dk/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="348322794"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="348322794"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 18:30:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="871017715"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 28 Jul 2023 18:30:39 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPYmy-0003jj-2k;
	Sat, 29 Jul 2023 01:30:36 +0000
Date: Sat, 29 Jul 2023 09:30:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/2] btrfs: do not commit transaction after adding one
 device
Message-ID: <202307290923.KsYv4vGD-lkp@intel.com>
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
In-Reply-To: <878afba7683a3d7cfcc55850499ab4134449000d.1690437675.git.wqu@suse.com>
References: <878afba7683a3d7cfcc55850499ab4134449000d.1690437675.git.wqu@suse.com>
TO: Qu Wenruo <wqu@suse.com>
TO: linux-btrfs@vger.kernel.org

Hi Qu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kdave/for-next]
[also build test WARNING on linus/master v6.5-rc3 next-20230728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qu-Wenruo/btrfs-do-not-commit-transaction-after-adding-one-device/20230727-141857
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/878afba7683a3d7cfcc55850499ab4134449000d.1690437675.git.wqu%40suse.com
patch subject: [PATCH 1/2] btrfs: do not commit transaction after adding one device
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m001-20230727 (https://download.01.org/0day-ci/archive/20230729/202307290923.KsYv4vGD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307290923.KsYv4vGD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307290923.KsYv4vGD-lkp@intel.com/

smatch warnings:
fs/btrfs/volumes.c:2844 btrfs_init_new_device() warn: variable dereferenced before check 'trans' (see line 2691)

vim +/trans +2844 fs/btrfs/volumes.c

2b82032c34ec40 Yan Zheng          2008-11-17  2619  
da353f6b30bc02 David Sterba       2017-02-14  2620  int btrfs_init_new_device(struct btrfs_fs_info *fs_info, const char *device_path)
788f20eb5affef Chris Mason        2008-04-28  2621  {
5112febbc77283 Jeff Mahoney       2016-06-21  2622  	struct btrfs_root *root = fs_info->dev_root;
788f20eb5affef Chris Mason        2008-04-28  2623  	struct btrfs_trans_handle *trans;
788f20eb5affef Chris Mason        2008-04-28  2624  	struct btrfs_device *device;
788f20eb5affef Chris Mason        2008-04-28  2625  	struct block_device *bdev;
0b246afa62b0cf Jeff Mahoney       2016-06-22  2626  	struct super_block *sb = fs_info->sb;
5da54bc13801d3 Anand Jain         2018-07-03  2627  	struct btrfs_fs_devices *fs_devices = fs_info->fs_devices;
8ba7d5f5ba931b Genjian Zhang      2023-03-24  2628  	struct btrfs_fs_devices *seed_devices = NULL;
39379faaad79e3 Naohiro Aota       2018-07-27  2629  	u64 orig_super_total_bytes;
39379faaad79e3 Naohiro Aota       2018-07-27  2630  	u64 orig_super_num_devices;
788f20eb5affef Chris Mason        2008-04-28  2631  	int ret = 0;
fd8808097ad23a Anand Jain         2021-09-21  2632  	bool seeding_dev = false;
44cab9ba374a03 Nikolay Borisov    2020-07-22  2633  	bool locked = false;
788f20eb5affef Chris Mason        2008-04-28  2634  
5da54bc13801d3 Anand Jain         2018-07-03  2635  	if (sb_rdonly(sb) && !fs_devices->seeding)
f8c5d0b443ff87 Liu Bo             2012-05-10  2636  		return -EROFS;
788f20eb5affef Chris Mason        2008-04-28  2637  
05bdb9965305bb Christoph Hellwig  2023-06-08  2638  	bdev = blkdev_get_by_path(device_path, BLK_OPEN_WRITE,
0718afd47f70cf Christoph Hellwig  2023-06-01  2639  				  fs_info->bdev_holder, NULL);
7f59203abeaf18 Josef Bacik        2010-01-27  2640  	if (IS_ERR(bdev))
7f59203abeaf18 Josef Bacik        2010-01-27  2641  		return PTR_ERR(bdev);
a213501153fd66 Chris Mason        2008-06-25  2642  
b70f509774ad4b Naohiro Aota       2020-11-10  2643  	if (!btrfs_check_device_zone_type(fs_info, bdev)) {
b70f509774ad4b Naohiro Aota       2020-11-10  2644  		ret = -EINVAL;
b70f509774ad4b Naohiro Aota       2020-11-10  2645  		goto error;
b70f509774ad4b Naohiro Aota       2020-11-10  2646  	}
b70f509774ad4b Naohiro Aota       2020-11-10  2647  
5da54bc13801d3 Anand Jain         2018-07-03  2648  	if (fs_devices->seeding) {
fd8808097ad23a Anand Jain         2021-09-21  2649  		seeding_dev = true;
2b82032c34ec40 Yan Zheng          2008-11-17  2650  		down_write(&sb->s_umount);
2b82032c34ec40 Yan Zheng          2008-11-17  2651  		mutex_lock(&uuid_mutex);
44cab9ba374a03 Nikolay Borisov    2020-07-22  2652  		locked = true;
2b82032c34ec40 Yan Zheng          2008-11-17  2653  	}
2b82032c34ec40 Yan Zheng          2008-11-17  2654  
b9ba017fb0771f Nikolay Borisov    2020-07-22  2655  	sync_blockdev(bdev);
a213501153fd66 Chris Mason        2008-06-25  2656  
f4cfa9bdd40c03 Nikolay Borisov    2020-07-22  2657  	rcu_read_lock();
f4cfa9bdd40c03 Nikolay Borisov    2020-07-22  2658  	list_for_each_entry_rcu(device, &fs_devices->devices, dev_list) {
788f20eb5affef Chris Mason        2008-04-28  2659  		if (device->bdev == bdev) {
788f20eb5affef Chris Mason        2008-04-28  2660  			ret = -EEXIST;
f4cfa9bdd40c03 Nikolay Borisov    2020-07-22  2661  			rcu_read_unlock();
2b82032c34ec40 Yan Zheng          2008-11-17  2662  			goto error;
788f20eb5affef Chris Mason        2008-04-28  2663  		}
788f20eb5affef Chris Mason        2008-04-28  2664  	}
f4cfa9bdd40c03 Nikolay Borisov    2020-07-22  2665  	rcu_read_unlock();
788f20eb5affef Chris Mason        2008-04-28  2666  
bb21e30260a672 Anand Jain         2022-11-07  2667  	device = btrfs_alloc_device(fs_info, NULL, NULL, device_path);
12bd2fc0d2f589 Ilya Dryomov       2013-08-23  2668  	if (IS_ERR(device)) {
788f20eb5affef Chris Mason        2008-04-28  2669  		/* we can safely leave the fs_devices entry around */
12bd2fc0d2f589 Ilya Dryomov       2013-08-23  2670  		ret = PTR_ERR(device);
2b82032c34ec40 Yan Zheng          2008-11-17  2671  		goto error;
788f20eb5affef Chris Mason        2008-04-28  2672  	}
788f20eb5affef Chris Mason        2008-04-28  2673  
5b316468983dfa Naohiro Aota       2020-11-10  2674  	device->fs_info = fs_info;
5b316468983dfa Naohiro Aota       2020-11-10  2675  	device->bdev = bdev;
4889bc05a96e03 Anand Jain         2022-01-12  2676  	ret = lookup_bdev(device_path, &device->devt);
4889bc05a96e03 Anand Jain         2022-01-12  2677  	if (ret)
4889bc05a96e03 Anand Jain         2022-01-12  2678  		goto error_free_device;
5b316468983dfa Naohiro Aota       2020-11-10  2679  
16beac87e95e2f Naohiro Aota       2021-11-11  2680  	ret = btrfs_get_dev_zone_info(device, false);
5b316468983dfa Naohiro Aota       2020-11-10  2681  	if (ret)
5b316468983dfa Naohiro Aota       2020-11-10  2682  		goto error_free_device;
5b316468983dfa Naohiro Aota       2020-11-10  2683  
a22285a6a32390 Yan, Zheng         2010-05-16  2684  	trans = btrfs_start_transaction(root, 0);
98d5dc13e7e74b Tsutomu Itoh       2011-01-20  2685  	if (IS_ERR(trans)) {
98d5dc13e7e74b Tsutomu Itoh       2011-01-20  2686  		ret = PTR_ERR(trans);
5b316468983dfa Naohiro Aota       2020-11-10  2687  		goto error_free_zone;
98d5dc13e7e74b Tsutomu Itoh       2011-01-20  2688  	}
98d5dc13e7e74b Tsutomu Itoh       2011-01-20  2689  
ebbede42d47dc7 Anand Jain         2017-12-04  2690  	set_bit(BTRFS_DEV_STATE_WRITEABLE, &device->dev_state);
2b82032c34ec40 Yan Zheng          2008-11-17 @2691  	device->generation = trans->transid;
0b246afa62b0cf Jeff Mahoney       2016-06-22  2692  	device->io_width = fs_info->sectorsize;
0b246afa62b0cf Jeff Mahoney       2016-06-22  2693  	device->io_align = fs_info->sectorsize;
0b246afa62b0cf Jeff Mahoney       2016-06-22  2694  	device->sector_size = fs_info->sectorsize;
cda00eba022d6a Christoph Hellwig  2021-10-18  2695  	device->total_bytes =
cda00eba022d6a Christoph Hellwig  2021-10-18  2696  		round_down(bdev_nr_bytes(bdev), fs_info->sectorsize);
2cc3c559fb2fe8 Yan Zheng          2009-06-04  2697  	device->disk_total_bytes = device->total_bytes;
935e5cc935bcbf Miao Xie           2014-09-03  2698  	device->commit_total_bytes = device->total_bytes;
e12c96214d28f9 Anand Jain         2017-12-04  2699  	set_bit(BTRFS_DEV_STATE_IN_FS_METADATA, &device->dev_state);
401e29c124eac2 Anand Jain         2017-12-04  2700  	clear_bit(BTRFS_DEV_STATE_REPLACE_TGT, &device->dev_state);
2736e8eeb0ccdc Christoph Hellwig  2023-06-08  2701  	device->holder = fs_info->bdev_holder;
27087f370174eb Stefan Behrens     2013-10-11  2702  	device->dev_stats_valid = 1;
9f6d251033bc5b David Sterba       2017-06-16  2703  	set_blocksize(device->bdev, BTRFS_BDEV_BLOCKSIZE);
788f20eb5affef Chris Mason        2008-04-28  2704  
2b82032c34ec40 Yan Zheng          2008-11-17  2705  	if (seeding_dev) {
a0a1db70df5f48 Filipe Manana      2020-12-14  2706  		btrfs_clear_sb_rdonly(sb);
849eae5e57a703 Anand Jain         2021-11-09  2707  
849eae5e57a703 Anand Jain         2021-11-09  2708  		/* GFP_KERNEL allocation must not be under device_list_mutex */
849eae5e57a703 Anand Jain         2021-11-09  2709  		seed_devices = btrfs_init_sprout(fs_info);
849eae5e57a703 Anand Jain         2021-11-09  2710  		if (IS_ERR(seed_devices)) {
849eae5e57a703 Anand Jain         2021-11-09  2711  			ret = PTR_ERR(seed_devices);
d31c32f6745a64 Anand Jain         2017-09-28  2712  			btrfs_abort_transaction(trans, ret);
d31c32f6745a64 Anand Jain         2017-09-28  2713  			goto error_trans;
d31c32f6745a64 Anand Jain         2017-09-28  2714  		}
849eae5e57a703 Anand Jain         2021-11-09  2715  	}
849eae5e57a703 Anand Jain         2021-11-09  2716  
849eae5e57a703 Anand Jain         2021-11-09  2717  	mutex_lock(&fs_devices->device_list_mutex);
849eae5e57a703 Anand Jain         2021-11-09  2718  	if (seeding_dev) {
849eae5e57a703 Anand Jain         2021-11-09  2719  		btrfs_setup_sprout(fs_info, seed_devices);
b7cb29e666fe79 Anand Jain         2021-08-24  2720  		btrfs_assign_next_active_device(fs_info->fs_devices->latest_dev,
b7cb29e666fe79 Anand Jain         2021-08-24  2721  						device);
2b82032c34ec40 Yan Zheng          2008-11-17  2722  	}
788f20eb5affef Chris Mason        2008-04-28  2723  
5da54bc13801d3 Anand Jain         2018-07-03  2724  	device->fs_devices = fs_devices;
e5e9a5206a171b Chris Mason        2009-06-10  2725  
34441361c4f52a David Sterba       2016-10-04  2726  	mutex_lock(&fs_info->chunk_mutex);
5da54bc13801d3 Anand Jain         2018-07-03  2727  	list_add_rcu(&device->dev_list, &fs_devices->devices);
5da54bc13801d3 Anand Jain         2018-07-03  2728  	list_add(&device->dev_alloc_list, &fs_devices->alloc_list);
5da54bc13801d3 Anand Jain         2018-07-03  2729  	fs_devices->num_devices++;
5da54bc13801d3 Anand Jain         2018-07-03  2730  	fs_devices->open_devices++;
5da54bc13801d3 Anand Jain         2018-07-03  2731  	fs_devices->rw_devices++;
5da54bc13801d3 Anand Jain         2018-07-03  2732  	fs_devices->total_devices++;
5da54bc13801d3 Anand Jain         2018-07-03  2733  	fs_devices->total_rw_bytes += device->total_bytes;
325cd4bafeb6cf Zheng Yan          2008-09-05  2734  
a5ed45f8224f2c Nikolay Borisov    2017-05-11  2735  	atomic64_add(device->total_bytes, &fs_info->free_chunk_space);
2bf64758fd6290 Josef Bacik        2011-09-26  2736  
10f0d2a517796b Christoph Hellwig  2022-04-15  2737  	if (!bdev_nonrot(bdev))
7f0432d0d8dc1d Johannes Thumshirn 2019-11-13  2738  		fs_devices->rotating = true;
c289811cc096c5 Chris Mason        2009-06-10  2739  
39379faaad79e3 Naohiro Aota       2018-07-27  2740  	orig_super_total_bytes = btrfs_super_total_bytes(fs_info->super_copy);
0b246afa62b0cf Jeff Mahoney       2016-06-22  2741  	btrfs_set_super_total_bytes(fs_info->super_copy,
39379faaad79e3 Naohiro Aota       2018-07-27  2742  		round_down(orig_super_total_bytes + device->total_bytes,
39379faaad79e3 Naohiro Aota       2018-07-27  2743  			   fs_info->sectorsize));
788f20eb5affef Chris Mason        2008-04-28  2744  
39379faaad79e3 Naohiro Aota       2018-07-27  2745  	orig_super_num_devices = btrfs_super_num_devices(fs_info->super_copy);
39379faaad79e3 Naohiro Aota       2018-07-27  2746  	btrfs_set_super_num_devices(fs_info->super_copy,
39379faaad79e3 Naohiro Aota       2018-07-27  2747  				    orig_super_num_devices + 1);
0d39376aa28eba Anand Jain         2014-06-03  2748  
2196d6e8a71fc9 Miao Xie           2014-09-03  2749  	/*
2196d6e8a71fc9 Miao Xie           2014-09-03  2750  	 * we've got more storage, clear any full flags on the space
2196d6e8a71fc9 Miao Xie           2014-09-03  2751  	 * infos
2196d6e8a71fc9 Miao Xie           2014-09-03  2752  	 */
0b246afa62b0cf Jeff Mahoney       2016-06-22  2753  	btrfs_clear_space_info_full(fs_info);
2196d6e8a71fc9 Miao Xie           2014-09-03  2754  
34441361c4f52a David Sterba       2016-10-04  2755  	mutex_unlock(&fs_info->chunk_mutex);
ca10845a56856f Josef Bacik        2020-09-01  2756  
ca10845a56856f Josef Bacik        2020-09-01  2757  	/* Add sysfs device entry */
cd36da2e7ec67f Anand Jain         2020-09-05  2758  	btrfs_sysfs_add_device(device);
ca10845a56856f Josef Bacik        2020-09-01  2759  
5da54bc13801d3 Anand Jain         2018-07-03  2760  	mutex_unlock(&fs_devices->device_list_mutex);
788f20eb5affef Chris Mason        2008-04-28  2761  
2b82032c34ec40 Yan Zheng          2008-11-17  2762  	if (seeding_dev) {
34441361c4f52a David Sterba       2016-10-04  2763  		mutex_lock(&fs_info->chunk_mutex);
6f8e0fc77cd553 David Sterba       2019-03-20  2764  		ret = init_first_rw_device(trans);
34441361c4f52a David Sterba       2016-10-04  2765  		mutex_unlock(&fs_info->chunk_mutex);
005d6427ac4f27 David Sterba       2012-09-18  2766  		if (ret) {
66642832f06a43 Jeff Mahoney       2016-06-10  2767  			btrfs_abort_transaction(trans, ret);
d31c32f6745a64 Anand Jain         2017-09-28  2768  			goto error_sysfs;
005d6427ac4f27 David Sterba       2012-09-18  2769  		}
2196d6e8a71fc9 Miao Xie           2014-09-03  2770  	}
2196d6e8a71fc9 Miao Xie           2014-09-03  2771  
8e87e8562744e2 Nikolay Borisov    2018-07-20  2772  	ret = btrfs_add_dev_item(trans, device);
2196d6e8a71fc9 Miao Xie           2014-09-03  2773  	if (ret) {
66642832f06a43 Jeff Mahoney       2016-06-10  2774  		btrfs_abort_transaction(trans, ret);
d31c32f6745a64 Anand Jain         2017-09-28  2775  		goto error_sysfs;
2196d6e8a71fc9 Miao Xie           2014-09-03  2776  	}
2196d6e8a71fc9 Miao Xie           2014-09-03  2777  
2196d6e8a71fc9 Miao Xie           2014-09-03  2778  	if (seeding_dev) {
5c466629e27a34 David Sterba       2019-03-20  2779  		ret = btrfs_finish_sprout(trans);
005d6427ac4f27 David Sterba       2012-09-18  2780  		if (ret) {
66642832f06a43 Jeff Mahoney       2016-06-10  2781  			btrfs_abort_transaction(trans, ret);
d31c32f6745a64 Anand Jain         2017-09-28  2782  			goto error_sysfs;
005d6427ac4f27 David Sterba       2012-09-18  2783  		}
b2373f255cacdc Anand Jain         2014-06-03  2784  
8e5600818022bd Nikolay Borisov    2020-08-12  2785  		/*
8e5600818022bd Nikolay Borisov    2020-08-12  2786  		 * fs_devices now represents the newly sprouted filesystem and
849eae5e57a703 Anand Jain         2021-11-09  2787  		 * its fsid has been changed by btrfs_sprout_splice().
8e5600818022bd Nikolay Borisov    2020-08-12  2788  		 */
8e5600818022bd Nikolay Borisov    2020-08-12  2789  		btrfs_sysfs_update_sprout_fsid(fs_devices);
005d6427ac4f27 David Sterba       2012-09-18  2790  	}
2b82032c34ec40 Yan Zheng          2008-11-17  2791  
e91281da9e860d Qu Wenruo          2023-07-27  2792  	ret = btrfs_end_transaction(trans);
e91281da9e860d Qu Wenruo          2023-07-27  2793  	trans = NULL;
a213501153fd66 Chris Mason        2008-06-25  2794  
2b82032c34ec40 Yan Zheng          2008-11-17  2795  	if (seeding_dev) {
2b82032c34ec40 Yan Zheng          2008-11-17  2796  		mutex_unlock(&uuid_mutex);
2b82032c34ec40 Yan Zheng          2008-11-17  2797  		up_write(&sb->s_umount);
44cab9ba374a03 Nikolay Borisov    2020-07-22  2798  		locked = false;
788f20eb5affef Chris Mason        2008-04-28  2799  
79787eaab46121 Jeff Mahoney       2012-03-12  2800  		if (ret) /* transaction commit */
79787eaab46121 Jeff Mahoney       2012-03-12  2801  			return ret;
79787eaab46121 Jeff Mahoney       2012-03-12  2802  
2ff7e61e0d30ff Jeff Mahoney       2016-06-22  2803  		ret = btrfs_relocate_sys_chunks(fs_info);
79787eaab46121 Jeff Mahoney       2012-03-12  2804  		if (ret < 0)
0b246afa62b0cf Jeff Mahoney       2016-06-22  2805  			btrfs_handle_fs_error(fs_info, ret,
5d163e0e68ce74 Jeff Mahoney       2016-09-20  2806  				    "Failed to relocate sys chunks after device initialization. This can be fixed using the \"btrfs balance\" command.");
2b82032c34ec40 Yan Zheng          2008-11-17  2807  	}
c9e9f97bdfb64d Ilya Dryomov       2012-01-16  2808  
7f551d969037cc Anand Jain         2020-05-05  2809  	/*
7f551d969037cc Anand Jain         2020-05-05  2810  	 * Now that we have written a new super block to this device, check all
7f551d969037cc Anand Jain         2020-05-05  2811  	 * other fs_devices list if device_path alienates any other scanned
7f551d969037cc Anand Jain         2020-05-05  2812  	 * device.
7f551d969037cc Anand Jain         2020-05-05  2813  	 * We can ignore the return value as it typically returns -EINVAL and
7f551d969037cc Anand Jain         2020-05-05  2814  	 * only succeeds if the device was an alien.
7f551d969037cc Anand Jain         2020-05-05  2815  	 */
4889bc05a96e03 Anand Jain         2022-01-12  2816  	btrfs_forget_devices(device->devt);
7f551d969037cc Anand Jain         2020-05-05  2817  
7f551d969037cc Anand Jain         2020-05-05  2818  	/* Update ctime/mtime for blkid or udev */
54fde91f52f515 Josef Bacik        2021-10-14  2819  	update_dev_time(device_path);
7f551d969037cc Anand Jain         2020-05-05  2820  
2b82032c34ec40 Yan Zheng          2008-11-17  2821  	return ret;
79787eaab46121 Jeff Mahoney       2012-03-12  2822  
d31c32f6745a64 Anand Jain         2017-09-28  2823  error_sysfs:
53f8a74cbeffd4 Anand Jain         2020-09-05  2824  	btrfs_sysfs_remove_device(device);
39379faaad79e3 Naohiro Aota       2018-07-27  2825  	mutex_lock(&fs_info->fs_devices->device_list_mutex);
39379faaad79e3 Naohiro Aota       2018-07-27  2826  	mutex_lock(&fs_info->chunk_mutex);
39379faaad79e3 Naohiro Aota       2018-07-27  2827  	list_del_rcu(&device->dev_list);
39379faaad79e3 Naohiro Aota       2018-07-27  2828  	list_del(&device->dev_alloc_list);
39379faaad79e3 Naohiro Aota       2018-07-27  2829  	fs_info->fs_devices->num_devices--;
39379faaad79e3 Naohiro Aota       2018-07-27  2830  	fs_info->fs_devices->open_devices--;
39379faaad79e3 Naohiro Aota       2018-07-27  2831  	fs_info->fs_devices->rw_devices--;
39379faaad79e3 Naohiro Aota       2018-07-27  2832  	fs_info->fs_devices->total_devices--;
39379faaad79e3 Naohiro Aota       2018-07-27  2833  	fs_info->fs_devices->total_rw_bytes -= device->total_bytes;
39379faaad79e3 Naohiro Aota       2018-07-27  2834  	atomic64_sub(device->total_bytes, &fs_info->free_chunk_space);
39379faaad79e3 Naohiro Aota       2018-07-27  2835  	btrfs_set_super_total_bytes(fs_info->super_copy,
39379faaad79e3 Naohiro Aota       2018-07-27  2836  				    orig_super_total_bytes);
39379faaad79e3 Naohiro Aota       2018-07-27  2837  	btrfs_set_super_num_devices(fs_info->super_copy,
39379faaad79e3 Naohiro Aota       2018-07-27  2838  				    orig_super_num_devices);
39379faaad79e3 Naohiro Aota       2018-07-27  2839  	mutex_unlock(&fs_info->chunk_mutex);
39379faaad79e3 Naohiro Aota       2018-07-27  2840  	mutex_unlock(&fs_info->fs_devices->device_list_mutex);
79787eaab46121 Jeff Mahoney       2012-03-12  2841  error_trans:
0af2c4bf5a012a Anand Jain         2017-09-28  2842  	if (seeding_dev)
a0a1db70df5f48 Filipe Manana      2020-12-14  2843  		btrfs_set_sb_rdonly(sb);
7132a262595a43 Anand Jain         2017-09-28 @2844  	if (trans)
3a45bb207ee2c5 Jeff Mahoney       2016-09-09  2845  		btrfs_end_transaction(trans);
5b316468983dfa Naohiro Aota       2020-11-10  2846  error_free_zone:
5b316468983dfa Naohiro Aota       2020-11-10  2847  	btrfs_destroy_dev_zone_info(device);
5c4cf6c91d717b David Sterba       2017-10-30  2848  error_free_device:
a425f9d4755a14 David Sterba       2018-03-20  2849  	btrfs_free_device(device);
2b82032c34ec40 Yan Zheng          2008-11-17  2850  error:
2736e8eeb0ccdc Christoph Hellwig  2023-06-08  2851  	blkdev_put(bdev, fs_info->bdev_holder);
44cab9ba374a03 Nikolay Borisov    2020-07-22  2852  	if (locked) {
2b82032c34ec40 Yan Zheng          2008-11-17  2853  		mutex_unlock(&uuid_mutex);
2b82032c34ec40 Yan Zheng          2008-11-17  2854  		up_write(&sb->s_umount);
2b82032c34ec40 Yan Zheng          2008-11-17  2855  	}
c9e9f97bdfb64d Ilya Dryomov       2012-01-16  2856  	return ret;
788f20eb5affef Chris Mason        2008-04-28  2857  }
788f20eb5affef Chris Mason        2008-04-28  2858  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
