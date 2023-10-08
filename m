Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185CC7497
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Oct 2023 07:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ABuN8eGK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696749051; x=1728285051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tZQhFWzt6pcfLGNXs+OCq8C0vn5FYwclTbOL/Sdgd+I=;
  b=ABuN8eGKLL2Q19oUfaPT8gQ1v6VqgQgU3jute+pW5B5qUUqRElkK4/4p
   R4gB5J70QQfEkqR21hxyfHbbmuKj/1l2bzQRpaLayhTK/Pj1EXyz3uWt0
   41tRX5Vg/4Wk5DZS+VRg8fNX9iav/7zULtUCevTqex+rMCMILREtrSEnk
   Xe8BUfOOGA/NyBHVkdciCAzYcGzMgzrzRLoLRuEnEknqPjc7n80oIhJTl
   zb0SdRBnyYalz0MY+KhiUbNrAEjYAp1R6yEFnLGTii5sTCii1aF5e5rPX
   Wka9LiNB5SQhLxQDXdn0jAM5rBZowKvjhRlAsUmW2kc3C5B3d3i3U+H2b
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="369046749"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="369046749"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2023 00:10:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="746330297"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="746330297"
Received: from lkp-server01.sh.intel.com (HELO 8a3a91ad4240) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 08 Oct 2023 00:10:47 -0700
Received: from kbuild by 8a3a91ad4240 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpNw6-0005Cf-1F;
	Sun, 08 Oct 2023 07:10:46 +0000
Date: Sun, 8 Oct 2023 15:10:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [kdave-btrfs-devel:for-next-20231006 3/3]
 fs/btrfs/volumes.c:600:7-22: ERROR: invalid reference to the index variable
 of the iterator on line 584
Message-ID: <202310081506.ra13Wahl-lkp@intel.com>
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
TO: David Sterba <dsterba@suse.com>

tree:   https://github.com/kdave/btrfs-devel.git for-next-20231006
head:   5a68c9e489ff1c909ad9d3d0099b8831ba00944b
commit: 5a68c9e489ff1c909ad9d3d0099b8831ba00944b [3/3] fixup opened/in_use in find_fsid_by_device()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-054-20231008 (https://download.01.org/0day-ci/archive/20231008/202310081506.ra13Wahl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231008/202310081506.ra13Wahl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202310081506.ra13Wahl-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/btrfs/volumes.c:600:7-22: ERROR: invalid reference to the index variable of the iterator on line 584
   fs/btrfs/volumes.c:609:10-25: ERROR: invalid reference to the index variable of the iterator on line 584

vim +600 fs/btrfs/volumes.c

4fde46f0cc71c7 Anand Jain   2015-06-17  556  
744a019be43f2d Anand Jain   2023-09-28  557  static struct btrfs_fs_devices *find_fsid_by_device(
279620e5a0860b Anand Jain   2023-09-28  558  					struct btrfs_super_block *disk_super,
279620e5a0860b Anand Jain   2023-09-28  559  					dev_t devt, bool *same_fsid_diff_dev)
744a019be43f2d Anand Jain   2023-09-28  560  {
744a019be43f2d Anand Jain   2023-09-28  561  	struct btrfs_fs_devices *fsid_fs_devices;
279620e5a0860b Anand Jain   2023-09-28  562  	struct btrfs_fs_devices *devt_fs_devices;
744a019be43f2d Anand Jain   2023-09-28  563  	const bool has_metadata_uuid = (btrfs_super_incompat_flags(disk_super) &
744a019be43f2d Anand Jain   2023-09-28  564  					BTRFS_FEATURE_INCOMPAT_METADATA_UUID);
279620e5a0860b Anand Jain   2023-09-28  565  	bool found_by_devt = false;
744a019be43f2d Anand Jain   2023-09-28  566  
744a019be43f2d Anand Jain   2023-09-28  567  	/* Find the fs_device by the usual method, if found use it. */
744a019be43f2d Anand Jain   2023-09-28  568  	fsid_fs_devices = find_fsid(disk_super->fsid,
744a019be43f2d Anand Jain   2023-09-28  569  		    has_metadata_uuid ? disk_super->metadata_uuid : NULL);
744a019be43f2d Anand Jain   2023-09-28  570  
279620e5a0860b Anand Jain   2023-09-28  571  	/* The temp_fsid feature is supported only with single device filesystem. */
279620e5a0860b Anand Jain   2023-09-28  572  	if (btrfs_super_num_devices(disk_super) != 1)
744a019be43f2d Anand Jain   2023-09-28  573  		return fsid_fs_devices;
279620e5a0860b Anand Jain   2023-09-28  574  
49f31140758081 Anand Jain   2023-10-04  575  	/*
49f31140758081 Anand Jain   2023-10-04  576  	 * A seed device is an integral component of the sprout device, which
49f31140758081 Anand Jain   2023-10-04  577  	 * functions as a multi-device filesystem. So, temp-fsid feature is
49f31140758081 Anand Jain   2023-10-04  578  	 * not supported.
49f31140758081 Anand Jain   2023-10-04  579  	 */
49f31140758081 Anand Jain   2023-10-04  580  	if (btrfs_super_flags(disk_super) & BTRFS_SUPER_FLAG_SEEDING)
49f31140758081 Anand Jain   2023-10-04  581  		return fsid_fs_devices;
49f31140758081 Anand Jain   2023-10-04  582  
279620e5a0860b Anand Jain   2023-09-28  583  	/* Try to find a fs_devices by matching devt. */
279620e5a0860b Anand Jain   2023-09-28 @584  	list_for_each_entry(devt_fs_devices, &fs_uuids, fs_list) {
279620e5a0860b Anand Jain   2023-09-28  585  		struct btrfs_device *device;
279620e5a0860b Anand Jain   2023-09-28  586  
279620e5a0860b Anand Jain   2023-09-28  587  		list_for_each_entry(device, &devt_fs_devices->devices, dev_list) {
279620e5a0860b Anand Jain   2023-09-28  588  			if (device->devt == devt) {
279620e5a0860b Anand Jain   2023-09-28  589  				found_by_devt = true;
279620e5a0860b Anand Jain   2023-09-28  590  				break;
279620e5a0860b Anand Jain   2023-09-28  591  			}
279620e5a0860b Anand Jain   2023-09-28  592  		}
279620e5a0860b Anand Jain   2023-09-28  593  		if (found_by_devt)
279620e5a0860b Anand Jain   2023-09-28  594  			break;
279620e5a0860b Anand Jain   2023-09-28  595  	}
279620e5a0860b Anand Jain   2023-09-28  596  
279620e5a0860b Anand Jain   2023-09-28  597  	if (found_by_devt) {
279620e5a0860b Anand Jain   2023-09-28  598  		/* Existing device. */
279620e5a0860b Anand Jain   2023-09-28  599  		if (fsid_fs_devices == NULL) {
5a68c9e489ff1c David Sterba 2023-10-06 @600  			if (devt_fs_devices->in_use == 0) {
279620e5a0860b Anand Jain   2023-09-28  601  				/* Stale device. */
279620e5a0860b Anand Jain   2023-09-28  602  				return NULL;
279620e5a0860b Anand Jain   2023-09-28  603  			} else {
279620e5a0860b Anand Jain   2023-09-28  604  				/* temp_fsid is mounting a subvol. */
279620e5a0860b Anand Jain   2023-09-28  605  				return devt_fs_devices;
279620e5a0860b Anand Jain   2023-09-28  606  			}
279620e5a0860b Anand Jain   2023-09-28  607  		} else {
279620e5a0860b Anand Jain   2023-09-28  608  			/* Regular or temp_fsid device mounting a subvol. */
279620e5a0860b Anand Jain   2023-09-28  609  			return devt_fs_devices;
279620e5a0860b Anand Jain   2023-09-28  610  		}
279620e5a0860b Anand Jain   2023-09-28  611  	} else {
279620e5a0860b Anand Jain   2023-09-28  612  		/* New device. */
279620e5a0860b Anand Jain   2023-09-28  613  		if (fsid_fs_devices == NULL) {
279620e5a0860b Anand Jain   2023-09-28  614  			return NULL;
279620e5a0860b Anand Jain   2023-09-28  615  		} else {
279620e5a0860b Anand Jain   2023-09-28  616  			/* sb::fsid is already used create a new temp_fsid. */
279620e5a0860b Anand Jain   2023-09-28  617  			*same_fsid_diff_dev = true;
279620e5a0860b Anand Jain   2023-09-28  618  			return NULL;
279620e5a0860b Anand Jain   2023-09-28  619  		}
279620e5a0860b Anand Jain   2023-09-28  620  	}
279620e5a0860b Anand Jain   2023-09-28  621  
279620e5a0860b Anand Jain   2023-09-28  622  	/* Not reached. */
744a019be43f2d Anand Jain   2023-09-28  623  }
744a019be43f2d Anand Jain   2023-09-28  624  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
