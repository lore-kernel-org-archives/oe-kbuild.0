Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51301094D
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Dec 2023 05:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l0WLUtd1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701842372; x=1733378372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MyifuJchlbnrtcXs9gnNdsBm2QBX+d+pvtsYtsVL+hs=;
  b=l0WLUtd1vOHvAYBhkrkaAXH4n+DCieUnt//6qbbJvWXaVSzRbxFRd/oU
   kIxJGpKsiw0vEdbRO1ch2jSuC33TOTp8cl42LnvCSn5y+nSK1koNZvKqv
   sqlFivCqp5zNQ2cwAD+4tR+upC3p4L8E7Irb4Z75krh5gbykbKm/L/xfT
   6hevYVSwvFCcPbt024PqlwK3QqLRV0Ur/rdyTLyM6RFKjRXmmRIwIvW7f
   HKuAyEWyIOwlD82vLKgL5zL4pQV9LK5wLJ5T+eIN2lhfV0aDcqq62GTzT
   yBijsxbgdnozf53dX1r7Sku0mnhf2igdsm02bVye8lR0W68R3/qrQ/DUu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="384413928"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="384413928"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 21:59:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="19221098"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 05 Dec 2023 21:59:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAkwQ-000ALj-1R;
	Wed, 06 Dec 2023 05:59:26 +0000
Date: Wed, 6 Dec 2023 13:59:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/btrfs/volumes.c:591:7-22: ERROR: invalid reference to the index
 variable of the iterator on line 575
Message-ID: <202312061311.icx8tr6B-lkp@intel.com>
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
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: a5b8a5f9f8355d27a4f8d0afa93427f16d2f3c1e btrfs: support cloned-device mount capability
date:   8 weeks ago
:::::: branch date: 32 hours ago
:::::: commit date: 8 weeks ago
config: x86_64-randconfig-102-20231202 (https://download.01.org/0day-ci/archive/20231206/202312061311.icx8tr6B-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312061311.icx8tr6B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312061311.icx8tr6B-lkp@intel.com/

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
