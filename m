Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FD82C190
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Sep 2024 20:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727728597; cv=none; b=Y/yILnUu9WxNz2E63AkLzb9yI0nIUMt9K2C7tkPatWnNhCLO6AXlCW4eCiuT/LRPNhy0i+KwYD+E235A/MK+gnOP1nB/P2nGBTQXAjnoZIcrovOugHygUtnbGxmRnyVgAh5/naKWl8OmJjQIjeAvU3d9N9P1aft/d7TYZLLxKaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727728597; c=relaxed/simple;
	bh=C5he4H1D6R3QZYlUS0zKx9PxVtJwDo7BvPN7pNSwvPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PFUh62Lf+ZNtN1roDZR+/5fshcDL7gQsTV3/p9qUldDKyhNWM0sjU2uWTAgHn2uN6ZX3awcz3XdS0hefTXma08o+ZwvGGAnn9W3Rn1KznWCTyr8cAD128iS203WwjiN0Ho4p+g6ue5zx9wW58gB4kUfPPimFtl2vDGpVtMTwkxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VhKmHTuk; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VhKmHTuk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727728595; x=1759264595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C5he4H1D6R3QZYlUS0zKx9PxVtJwDo7BvPN7pNSwvPQ=;
  b=VhKmHTuk88b+H41b/dAJK7m9NWJccMjE5bWvrHoOSfEWC7XrBIptbyCF
   EQ3YmcoYdwh5K7JRpZofA3pAhgkQyn1U8t2Q7FSrbEIkhBC8HSoJAwl8+
   w9zUf8U65rxtCCEdITIK1PQQ/RxAWaWfVapUQMIqyGPGT9/K9UqgPRH10
   tm/6+1qoHgOkW2M5h/FsJnRc19tAnw515TflJ3wWKuJhLSyxm4PYTrIK5
   YQFnidUqUTEpjrpW3Axlzk/Qu5FxeBQn+8KRT2WzGfZafR3Fod5oJ+h4T
   y92LLwvJgEV0YUYfXFGjZ/g2KyFf3cjLQ5JZs00F8JSiJlamhOLPrFJKY
   w==;
X-CSE-ConnectionGUID: Bq95rARFTU2R30/Q7j9Esg==
X-CSE-MsgGUID: 1Y8e8ojXRrapki+chEcyIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="38195542"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="38195542"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 13:36:34 -0700
X-CSE-ConnectionGUID: 2tpWw1KXQBKMM60WRTokrA==
X-CSE-MsgGUID: nB00Vk7/R+ewgQXYTRehMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="73689713"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Sep 2024 13:36:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svN8B-000Prl-04;
	Mon, 30 Sep 2024 20:36:31 +0000
Date: Tue, 1 Oct 2024 04:36:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/btrfs/volumes.c:591:7-22: ERROR: invalid reference to the index
 variable of the iterator on line 575
Message-ID: <202410010442.vBwXSMXs-lkp@intel.com>
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
head:   9852d85ec9d492ebef56dc5f229416c925758edc
commit: a5b8a5f9f8355d27a4f8d0afa93427f16d2f3c1e btrfs: support cloned-device mount capability
date:   12 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 12 months ago
config: m68k-randconfig-r053-20240930 (https://download.01.org/0day-ci/archive/20241001/202410010442.vBwXSMXs-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410010442.vBwXSMXs-lkp@intel.com/

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
