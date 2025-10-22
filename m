Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5484030DEB6
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Oct 2025 09:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761124788; cv=none; b=PQKgYNEZJIVIvqZtDbgW223ewjnLOHuWpLaOYnr7ABZKkbfQrBFsj+9u9owN0eBEVoQCt7l9pRZatXubV2eAJxXCYmIUghcZRICOvvqkBTanxdW4rOmdmVCZSpsr8rzpsLOY2OnwzMyJ1QTzdN/4zSmPJ1EAT9zgzw1kfBSaQzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761124788; c=relaxed/simple;
	bh=/ZNyiakJ5NLQZ/ZmgYIZpxc3kULA+gFLn9Fidmd/Wyg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TwDPFO6yDb37IjQaxCd6dBsmPDszDqxsAS33/Zyl+iqpcFbFLyXRnsgPKVTlClhVEx50+GATd7//c/WU88lwFZALYhiu7JbkbBcY3ZKwNkoD3ok3Asg5dZWXVcSHbtM114qcegFAh40QqlAu0QOyfLHpndF9PI1Cdw5eVzxgr5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U1yVv89i; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U1yVv89i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761124786; x=1792660786;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/ZNyiakJ5NLQZ/ZmgYIZpxc3kULA+gFLn9Fidmd/Wyg=;
  b=U1yVv89ifLcVoZGuZKT0dYtPm+psqFL5ZMXgU0TH8rRHnMaQ7m1doYIe
   7EE2UBRhvSJoYhIExJeeobSlAofk9gE1t0FY46rjDuEmGgc2IcrLJLe2/
   cvmoD5Ec7KIdD1zNUvdBvVa4qfjFNERqE6aj35cWVkYru7PqENqtyuFQW
   KXrdkh0iNDlnEFwHhVZLgkXWZ6QdVFrj6zTw/46DSoH8uoETmSTVUzWGE
   ZDv4ya5+p6pzl9RPdHtvUKMfThqjCObpwUFgth+BF7b9+eIG3rjoAke7I
   P3evqxzcUONQvG7g0C+4nUlj1CtKub90IBoy0zSp9OmOEi1JzMGOwwlSp
   g==;
X-CSE-ConnectionGUID: sxi7nAmHRYe5sY+NwBhpuw==
X-CSE-MsgGUID: ReW0oSs1RRGwqh3LiMM3FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74610672"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="74610672"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 02:19:45 -0700
X-CSE-ConnectionGUID: vmByEl0QRB63acAA9q/7bg==
X-CSE-MsgGUID: i/bsiaWHTVCxGn+oGTsGeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="183033899"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Oct 2025 02:19:44 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBV0P-000CBf-24;
	Wed, 22 Oct 2025 09:19:41 +0000
Date: Wed, 22 Oct 2025 17:18:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v14 4/9] platform/x86: asus-armoury: add apu-mem control
 support
Message-ID: <202510221626.BFkF6Hr0-lkp@intel.com>
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
In-Reply-To: <20251015014736.1402045-5-benato.denis96@gmail.com>
References: <20251015014736.1402045-5-benato.denis96@gmail.com>
TO: Denis Benato <benato.denis96@gmail.com>
TO: linux-kernel@vger.kernel.org
CC: platform-driver-x86@vger.kernel.org
CC: Hans de Goede <hdegoede@redhat.com>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: "Limonciello, Mario" <mario.limonciello@amd.com>
CC: "Luke D . Jones" <luke@ljones.dev>
CC: Alok Tiwari <alok.a.tiwari@oracle.com>
CC: Derek John Clark <derekjohn.clark@gmail.com>
CC: Mateusz Schyboll <dragonn@op.pl>
CC: porfet828@gmail.com
CC: Denis Benato <benato.denis96@gmail.com>

Hi Denis,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on linus/master v6.18-rc2 next-20251021]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Denis-Benato/platform-x86-asus-wmi-export-symbols-used-for-read-write-WMI/20251015-095436
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20251015014736.1402045-5-benato.denis96%40gmail.com
patch subject: [PATCH v14 4/9] platform/x86: asus-armoury: add apu-mem control support
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: i386-randconfig-141-20251020 (https://download.01.org/0day-ci/archive/20251022/202510221626.BFkF6Hr0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510221626.BFkF6Hr0-lkp@intel.com/

smatch warnings:
drivers/platform/x86/asus-armoury.c:453 apu_mem_current_value_store() warn: potential spectre issue 'apu_mem_map' [r] (local cap)
drivers/platform/x86/asus-armoury.c:455 apu_mem_current_value_store() warn: possible spectre second half.  'mem'

vim +/apu_mem_map +453 drivers/platform/x86/asus-armoury.c

3666eea3ea3d46 Luke D. Jones 2025-10-15  439  
3666eea3ea3d46 Luke D. Jones 2025-10-15  440  static ssize_t apu_mem_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
3666eea3ea3d46 Luke D. Jones 2025-10-15  441  					   const char *buf, size_t count)
3666eea3ea3d46 Luke D. Jones 2025-10-15  442  {
3666eea3ea3d46 Luke D. Jones 2025-10-15  443  	int result, err;
3666eea3ea3d46 Luke D. Jones 2025-10-15  444  	u32 requested, mem;
3666eea3ea3d46 Luke D. Jones 2025-10-15  445  
3666eea3ea3d46 Luke D. Jones 2025-10-15  446  	result = kstrtou32(buf, 10, &requested);
3666eea3ea3d46 Luke D. Jones 2025-10-15  447  	if (result)
3666eea3ea3d46 Luke D. Jones 2025-10-15  448  		return result;
3666eea3ea3d46 Luke D. Jones 2025-10-15  449  
3666eea3ea3d46 Luke D. Jones 2025-10-15  450  	if (requested >= ARRAY_SIZE(apu_mem_map))
3666eea3ea3d46 Luke D. Jones 2025-10-15  451  		return -EINVAL;
3666eea3ea3d46 Luke D. Jones 2025-10-15  452  
3666eea3ea3d46 Luke D. Jones 2025-10-15 @453  	mem = apu_mem_map[requested];
3666eea3ea3d46 Luke D. Jones 2025-10-15  454  
3666eea3ea3d46 Luke D. Jones 2025-10-15 @455  	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_APU_MEM, mem, &result);
3666eea3ea3d46 Luke D. Jones 2025-10-15  456  	if (err) {
3666eea3ea3d46 Luke D. Jones 2025-10-15  457  		pr_warn("Failed to set apu_mem: %d\n", err);
3666eea3ea3d46 Luke D. Jones 2025-10-15  458  		return err;
3666eea3ea3d46 Luke D. Jones 2025-10-15  459  	}
3666eea3ea3d46 Luke D. Jones 2025-10-15  460  
3666eea3ea3d46 Luke D. Jones 2025-10-15  461  	pr_info("APU memory changed to %uGB, reboot required\n", requested+1);
3666eea3ea3d46 Luke D. Jones 2025-10-15  462  	sysfs_notify(kobj, NULL, attr->attr.name);
3666eea3ea3d46 Luke D. Jones 2025-10-15  463  
3666eea3ea3d46 Luke D. Jones 2025-10-15  464  	asus_set_reboot_and_signal_event();
3666eea3ea3d46 Luke D. Jones 2025-10-15  465  
3666eea3ea3d46 Luke D. Jones 2025-10-15  466  	return count;
3666eea3ea3d46 Luke D. Jones 2025-10-15  467  }
3666eea3ea3d46 Luke D. Jones 2025-10-15  468  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
