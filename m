Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7371FAC57
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jan 2025 17:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735924607; cv=none; b=bHveZlInU7shfI2dDiZKK/Ri4mhejcI22+5G6oWxbCw8Viz6QnEbIBimdcj1uyQwE0fH/ORQaKyNLPzYGkLeDvSHZ/drdVF+ozrsjzv7h9J4zTsGXI2w0cUqa6/qPvAPxL267/JzoAaIS89BQnNucSGdldkmno66TO1OrsfDfTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735924607; c=relaxed/simple;
	bh=bbKIeg1qYMc5K8AL702qUy9nZRGjQ8v2u23R5JsMeFI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Riv3+5DST2pyUsn6Py756GBQzMFEui3FlEL8Q5gqqTsLE9YTjsnTx9+2O4WxneOhRLV1Fz38Pk2UAlnf2Uxc7rz9Gdk/4EhH51qnzW+c/VnfgwLW01EhsFkHwW4OTuTgLvulj+VZIi7bD2z8/p2zukQssiMDLf4g9FRZ3fqJp2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VOrK6NAd; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VOrK6NAd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735924606; x=1767460606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bbKIeg1qYMc5K8AL702qUy9nZRGjQ8v2u23R5JsMeFI=;
  b=VOrK6NAdG/MpwoT8gLxcu92f8E+f+Y4TMMSt/QeoENAd0oJNLLfwORot
   DmjgQbMZiGJs6I2u+ZfzSTCTVHLWx+PRrI01uiUQnSXQdwunbCMZRAIZp
   tYlqTr7yUTnGXJSnnCbEBHV6RdScBjdGpuI3kzuLYdqlb8T1uGccgG6n1
   1KUcnO2RMOLVRGQhaNP5OnvqQFWA0J+PU+W9BtvbexWj8RByrmm7Z7DdU
   f5ACqVQQPMGgNrsdX2ARCWBIVl44iXFS7orFJiv1OLvkPPhPvHvy5n9L6
   +NIk5EvStLMYpalOvUILPaYXoeBfd0nmCbuDhrwEO1wFzFlMMb4QZyQIG
   Q==;
X-CSE-ConnectionGUID: 5KVDff3DQFqJFBCeLduBNw==
X-CSE-MsgGUID: XSaw9HydQFihXUGssBfPHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="47529791"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="47529791"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 09:16:45 -0800
X-CSE-ConnectionGUID: fDhlYvEHTVSEG6hMYcX30A==
X-CSE-MsgGUID: qwwSv8JTT5W9bxuu+rPacw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="106881476"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Jan 2025 09:16:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTlHt-000A58-2d;
	Fri, 03 Jan 2025 17:16:41 +0000
Date: Sat, 4 Jan 2025 01:15:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 05/10] btrfs: add read count tracking for filesystem
 stats
Message-ID: <202501040304.Ju24l8yd-lkp@intel.com>
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
In-Reply-To: <c4010cee5398e35a695def3ad97d4de6f136ae2c.1735748715.git.anand.jain@oracle.com>
References: <c4010cee5398e35a695def3ad97d4de6f136ae2c.1735748715.git.anand.jain@oracle.com>
TO: Anand Jain <anand.jain@oracle.com>
TO: linux-btrfs@vger.kernel.org
CC: dsterba@suse.com
CC: Naohiro.Aota@wdc.com
CC: wqu@suse.com
CC: hrx@bupt.moe
CC: waxhead@dirtcellar.net

Hi Anand,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.13-rc5]
[also build test WARNING on linus/master]
[cannot apply to kdave/for-next next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anand-Jain/btrfs-initialize-fs_devices-fs_info-earlier/20250102-021904
base:   v6.13-rc5
patch link:    https://lore.kernel.org/r/c4010cee5398e35a695def3ad97d4de6f136ae2c.1735748715.git.anand.jain%40oracle.com
patch subject: [PATCH v5 05/10] btrfs: add read count tracking for filesystem stats
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-r072-20250103 (https://download.01.org/0day-ci/archive/20250104/202501040304.Ju24l8yd-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501040304.Ju24l8yd-lkp@intel.com/

New smatch warnings:
fs/btrfs/volumes.c:7691 btrfs_init_dev_stats() warn: inconsistent returns '&fs_devices->device_list_mutex'.

Old smatch warnings:
fs/btrfs/volumes.c:893 device_list_add() warn: inconsistent indenting

vim +7691 fs/btrfs/volumes.c

124604eb50f88e Josef Bacik    2020-09-18  7662  
124604eb50f88e Josef Bacik    2020-09-18  7663  int btrfs_init_dev_stats(struct btrfs_fs_info *fs_info)
124604eb50f88e Josef Bacik    2020-09-18  7664  {
124604eb50f88e Josef Bacik    2020-09-18  7665  	struct btrfs_fs_devices *fs_devices = fs_info->fs_devices, *seed_devs;
124604eb50f88e Josef Bacik    2020-09-18  7666  	struct btrfs_device *device;
124604eb50f88e Josef Bacik    2020-09-18  7667  	struct btrfs_path *path = NULL;
92e26df43b1a97 Josef Bacik    2020-09-18  7668  	int ret = 0;
124604eb50f88e Josef Bacik    2020-09-18  7669  
124604eb50f88e Josef Bacik    2020-09-18  7670  	path = btrfs_alloc_path();
124604eb50f88e Josef Bacik    2020-09-18  7671  	if (!path)
124604eb50f88e Josef Bacik    2020-09-18  7672  		return -ENOMEM;
124604eb50f88e Josef Bacik    2020-09-18  7673  
124604eb50f88e Josef Bacik    2020-09-18  7674  	mutex_lock(&fs_devices->device_list_mutex);
92e26df43b1a97 Josef Bacik    2020-09-18  7675  	list_for_each_entry(device, &fs_devices->devices, dev_list) {
92e26df43b1a97 Josef Bacik    2020-09-18  7676  		ret = btrfs_device_init_dev_stats(device, path);
92e26df43b1a97 Josef Bacik    2020-09-18  7677  		if (ret)
ec90aa75ef29fb Anand Jain     2025-01-02  7678  			return ret;
92e26df43b1a97 Josef Bacik    2020-09-18  7679  	}
124604eb50f88e Josef Bacik    2020-09-18  7680  	list_for_each_entry(seed_devs, &fs_devices->seed_list, seed_list) {
92e26df43b1a97 Josef Bacik    2020-09-18  7681  		list_for_each_entry(device, &seed_devs->devices, dev_list) {
92e26df43b1a97 Josef Bacik    2020-09-18  7682  			ret = btrfs_device_init_dev_stats(device, path);
92e26df43b1a97 Josef Bacik    2020-09-18  7683  			if (ret)
92e26df43b1a97 Josef Bacik    2020-09-18  7684  				goto out;
124604eb50f88e Josef Bacik    2020-09-18  7685  		}
92e26df43b1a97 Josef Bacik    2020-09-18  7686  	}
92e26df43b1a97 Josef Bacik    2020-09-18  7687  out:
733f4fbbc1083a Stefan Behrens 2012-05-25  7688  	mutex_unlock(&fs_devices->device_list_mutex);
733f4fbbc1083a Stefan Behrens 2012-05-25  7689  
733f4fbbc1083a Stefan Behrens 2012-05-25  7690  	btrfs_free_path(path);
92e26df43b1a97 Josef Bacik    2020-09-18 @7691  	return ret;
733f4fbbc1083a Stefan Behrens 2012-05-25  7692  }
733f4fbbc1083a Stefan Behrens 2012-05-25  7693  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
