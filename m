Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1585923A6
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Nov 2024 19:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730749597; cv=none; b=eLRiVCVbh5dsVliOebZRQA0HXi04PwCSMbpPBiojbrlVLqFvDZWReWVg9Sv2GhshprPHa0wAb8NuuIDUivV1AM9aSkmw0PHrta7HIZVyKJJMTSsaIdv8yqojFfBbgHC4gXeWxYbBgSS2yGtTx8h8CuZaE1kUk61v5bWHwVFaQ0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730749597; c=relaxed/simple;
	bh=VIGru9dkgTRNDA+AxheGc3oz5K9RgEOg/i5IlxSlLaw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nYPXdd2gxGlKNa/b2fjOnd37egs3lWyrl620FFgXheOB46MnDcAT25S4Asv9PSmDLeu9ESTCZ2eUAdXmZH6Nz5tbR4Djw62EpnqQv+RniKPQalni0XkP1SK8EcP7X0i0UuihZhpxylN7HbfTy9gzQbI1Fdumwf82hzCE35xRh4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S95TOxhq; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S95TOxhq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730749595; x=1762285595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VIGru9dkgTRNDA+AxheGc3oz5K9RgEOg/i5IlxSlLaw=;
  b=S95TOxhqezkHy2NohTipaMne3HpF0KHW4YqMsd0HvM2xs5Jj4fWNK77E
   mE0Ly8BeQvjzIS94Cmq5sbQH4TZ0CcwpSveWqcstUy+ZxEY0tGzR1mQrG
   B0wdK1aZdmRijzl8yERoivp1qBLIuhB32dLQE6JHpgeo6l1m5M5Hdt7zC
   IcjpV/8Fpor6715s/w5KMuifNtgcYn4aPAnrpXX5erzK86M8CZC51j8mN
   aKFLSPNvvXiz3PL+bfEHFWdpTKpcM8v8+IvRh3GSvEkKnhb69RIBK9P8f
   UXUD38CfYVm9yeGnjf8TCncTCD51VgZ+Ws4zZalFYsTUFWslk1/Tecv9l
   g==;
X-CSE-ConnectionGUID: YC8T9CrnQCucFvkzM20GOg==
X-CSE-MsgGUID: 8FSUQDo0TS+PRalK7VsVxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41015235"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41015235"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 11:46:34 -0800
X-CSE-ConnectionGUID: /eDPcS+aRseyrz1TMlIFcg==
X-CSE-MsgGUID: f/Uqg+PSTzWjeR+lk4u0KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="84184523"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Nov 2024 11:46:33 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t831z-000lDl-0R;
	Mon, 04 Nov 2024 19:46:31 +0000
Date: Tue, 5 Nov 2024 03:46:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/btrfs/volumes.c:591:7-22: ERROR: invalid reference to the index
 variable of the iterator on line 575
Message-ID: <202411050329.t2a3my0s-lkp@intel.com>
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
head:   557329bcecc2f55e134db8974953b32b69db9d15
commit: a5b8a5f9f8355d27a4f8d0afa93427f16d2f3c1e btrfs: support cloned-device mount capability
date:   1 year, 1 month ago
:::::: branch date: 2 hours ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-103-20241104 (https://download.01.org/0day-ci/archive/20241105/202411050329.t2a3my0s-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411050329.t2a3my0s-lkp@intel.com/

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
