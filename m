Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5080118784E
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Sep 2024 11:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726055754; cv=none; b=q021Pu1ZSjXQVr0CSKURuFmwRDDasSlRomCLmmlOlwexvOoBPxmhMqfwKn92Y52aKmnAxI4/H9Yc1cISS4qy4tD5ni0KA+J6zEa40i6zKgSa/tHwHuTPa6xx1t0wO8M1t/iHAyuOHpZuRG9t6oi9ZZOGfx0N9EskTr1+ts43I2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726055754; c=relaxed/simple;
	bh=u1W9CVOEQM+6Ys3xOeHp8/58MCqJOkWez55qBYrkYk8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UUqrGzvX5dekfyUbHPSuCPhIK/+Hvog5TiefJHJffUqbG7GDuZDQE2TIbPTN0l2ir6pM9AfR5Eqn4MYnUE7Qkh+MUiKoKcSjXlku7POkYtpomEhi+tayQ1TRJ6B+6F7+AFgqXTvsw1hLDu5PxO2TldJcBeG1uOqwnDEmUoMODlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dfrIUxnI; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dfrIUxnI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726055751; x=1757591751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u1W9CVOEQM+6Ys3xOeHp8/58MCqJOkWez55qBYrkYk8=;
  b=dfrIUxnIyE0TYgmNN9G/ywyquGGB9sLUuoYqvBbrb/31izMuRezoeW+T
   2bNlO62uK5wO7S9JxLqLtMrGVkcMKz1Yi+nID45FJwENMqsT3Rd4d8q59
   XPd3otHJZkTAZsxpZi5v3/EBESbDE7oaSNsXxbrVzNBUiwchEYSBtlMQf
   4LoPgXsmuB3D+OjwgDVbtUrO5gaxm1UOvrLZKr1eCm6x+AaFSBaMGri4T
   y0Qx7clsdVTlfT5FY8i8M55gB5OcquQBPRieoAxg2KIGcSob2XK44TIRg
   vHyzpU13/eOd54Gsp/U2FrcMFKCC3aKVHX6uKhrVxKU6emotSew/NmQzR
   A==;
X-CSE-ConnectionGUID: 2oo/YCFyTPumUNDCrCLxgg==
X-CSE-MsgGUID: UkicPuorS0qFaWbl792ntg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="36202826"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="36202826"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 04:55:51 -0700
X-CSE-ConnectionGUID: Gxqr1EuBR0aUnfnuesQ7ug==
X-CSE-MsgGUID: NTZLoI5CTQe9cY0dK5ZP4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="98045780"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Sep 2024 04:55:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soLwp-0003V8-1V;
	Wed, 11 Sep 2024 11:55:47 +0000
Date: Wed, 11 Sep 2024 19:55:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/btrfs/volumes.c:591:7-22: ERROR: invalid reference to the index
 variable of the iterator on line 575
Message-ID: <202409111919.jUmq1AP7-lkp@intel.com>
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
TO: Anand Jain <anand.jain@oracle.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8d8d276ba2fb5f9ac4984f5c10ae60858090babc
commit: a5b8a5f9f8355d27a4f8d0afa93427f16d2f3c1e btrfs: support cloned-device mount capability
date:   11 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 11 months ago
config: m68k-randconfig-r064-20240911 (https://download.01.org/0day-ci/archive/20240911/202409111919.jUmq1AP7-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409111919.jUmq1AP7-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/btrfs/volumes.c:591:7-22: ERROR: invalid reference to the index variable of the iterator on line 575
   fs/btrfs/volumes.c:600:10-25: ERROR: invalid reference to the index variable of the iterator on line 575

vim +591 fs/btrfs/volumes.c

4fde46f0cc71c7 Anand Jain 2015-06-17  555  
69d427f34ca097 Anand Jain 2023-09-28  556  static struct btrfs_fs_devices *find_fsid_by_device(
a5b8a5f9f8355d Anand Jain 2023-09-28  557  					struct btrfs_super_block *disk_super,
a5b8a5f9f8355d Anand Jain 2023-09-28  558  					dev_t devt, bool *same_fsid_diff_dev)
69d427f34ca097 Anand Jain 2023-09-28  559  {
69d427f34ca097 Anand Jain 2023-09-28  560  	struct btrfs_fs_devices *fsid_fs_devices;
a5b8a5f9f8355d Anand Jain 2023-09-28  561  	struct btrfs_fs_devices *devt_fs_devices;
69d427f34ca097 Anand Jain 2023-09-28  562  	const bool has_metadata_uuid = (btrfs_super_incompat_flags(disk_super) &
69d427f34ca097 Anand Jain 2023-09-28  563  					BTRFS_FEATURE_INCOMPAT_METADATA_UUID);
a5b8a5f9f8355d Anand Jain 2023-09-28  564  	bool found_by_devt = false;
69d427f34ca097 Anand Jain 2023-09-28  565  
69d427f34ca097 Anand Jain 2023-09-28  566  	/* Find the fs_device by the usual method, if found use it. */
69d427f34ca097 Anand Jain 2023-09-28  567  	fsid_fs_devices = find_fsid(disk_super->fsid,
69d427f34ca097 Anand Jain 2023-09-28  568  		    has_metadata_uuid ? disk_super->metadata_uuid : NULL);
69d427f34ca097 Anand Jain 2023-09-28  569  
a5b8a5f9f8355d Anand Jain 2023-09-28  570  	/* The temp_fsid feature is supported only with single device filesystem. */
a5b8a5f9f8355d Anand Jain 2023-09-28  571  	if (btrfs_super_num_devices(disk_super) != 1)
69d427f34ca097 Anand Jain 2023-09-28  572  		return fsid_fs_devices;
a5b8a5f9f8355d Anand Jain 2023-09-28  573  
a5b8a5f9f8355d Anand Jain 2023-09-28  574  	/* Try to find a fs_devices by matching devt. */
a5b8a5f9f8355d Anand Jain 2023-09-28 @575  	list_for_each_entry(devt_fs_devices, &fs_uuids, fs_list) {
a5b8a5f9f8355d Anand Jain 2023-09-28  576  		struct btrfs_device *device;
a5b8a5f9f8355d Anand Jain 2023-09-28  577  
a5b8a5f9f8355d Anand Jain 2023-09-28  578  		list_for_each_entry(device, &devt_fs_devices->devices, dev_list) {
a5b8a5f9f8355d Anand Jain 2023-09-28  579  			if (device->devt == devt) {
a5b8a5f9f8355d Anand Jain 2023-09-28  580  				found_by_devt = true;
a5b8a5f9f8355d Anand Jain 2023-09-28  581  				break;
a5b8a5f9f8355d Anand Jain 2023-09-28  582  			}
a5b8a5f9f8355d Anand Jain 2023-09-28  583  		}
a5b8a5f9f8355d Anand Jain 2023-09-28  584  		if (found_by_devt)
a5b8a5f9f8355d Anand Jain 2023-09-28  585  			break;
a5b8a5f9f8355d Anand Jain 2023-09-28  586  	}
a5b8a5f9f8355d Anand Jain 2023-09-28  587  
a5b8a5f9f8355d Anand Jain 2023-09-28  588  	if (found_by_devt) {
a5b8a5f9f8355d Anand Jain 2023-09-28  589  		/* Existing device. */
a5b8a5f9f8355d Anand Jain 2023-09-28  590  		if (fsid_fs_devices == NULL) {
a5b8a5f9f8355d Anand Jain 2023-09-28 @591  			if (devt_fs_devices->opened == 0) {
a5b8a5f9f8355d Anand Jain 2023-09-28  592  				/* Stale device. */
a5b8a5f9f8355d Anand Jain 2023-09-28  593  				return NULL;
a5b8a5f9f8355d Anand Jain 2023-09-28  594  			} else {
a5b8a5f9f8355d Anand Jain 2023-09-28  595  				/* temp_fsid is mounting a subvol. */
a5b8a5f9f8355d Anand Jain 2023-09-28  596  				return devt_fs_devices;
a5b8a5f9f8355d Anand Jain 2023-09-28  597  			}
a5b8a5f9f8355d Anand Jain 2023-09-28  598  		} else {
a5b8a5f9f8355d Anand Jain 2023-09-28  599  			/* Regular or temp_fsid device mounting a subvol. */
a5b8a5f9f8355d Anand Jain 2023-09-28  600  			return devt_fs_devices;
a5b8a5f9f8355d Anand Jain 2023-09-28  601  		}
a5b8a5f9f8355d Anand Jain 2023-09-28  602  	} else {
a5b8a5f9f8355d Anand Jain 2023-09-28  603  		/* New device. */
a5b8a5f9f8355d Anand Jain 2023-09-28  604  		if (fsid_fs_devices == NULL) {
a5b8a5f9f8355d Anand Jain 2023-09-28  605  			return NULL;
a5b8a5f9f8355d Anand Jain 2023-09-28  606  		} else {
a5b8a5f9f8355d Anand Jain 2023-09-28  607  			/* sb::fsid is already used create a new temp_fsid. */
a5b8a5f9f8355d Anand Jain 2023-09-28  608  			*same_fsid_diff_dev = true;
a5b8a5f9f8355d Anand Jain 2023-09-28  609  			return NULL;
a5b8a5f9f8355d Anand Jain 2023-09-28  610  		}
a5b8a5f9f8355d Anand Jain 2023-09-28  611  	}
a5b8a5f9f8355d Anand Jain 2023-09-28  612  
a5b8a5f9f8355d Anand Jain 2023-09-28  613  	/* Not reached. */
69d427f34ca097 Anand Jain 2023-09-28  614  }
69d427f34ca097 Anand Jain 2023-09-28  615  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
