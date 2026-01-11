Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FE53BB40
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jan 2026 20:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768163701; cv=none; b=vF90TrWPa749sdLh+wbB4FK8gvUTsCo7wV4q/IpXPwpygc6bTv0Jp0Sj05oHh8BYud17Q3doyFvZqjbhvlNjQTcD59IwRmmkf4KPFdEDxBL1/JLhyElBWPnZR6tehzc+8CbW93R8Ows/Md7E1MB9B5YdFKfNZ57Nt6eJtfyiSKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768163701; c=relaxed/simple;
	bh=SvGkyPpIpwBus6MRLXVn0qiWBaqsTuKgNiFAA5ymmjU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=T51WiTK05Q3JHDgsBMMtOGBbljWZwXMEOlC880C/yfZ75Wb5x9cSkCrGoX8VhqwJjmXMLb0r+iWcCB0UVvo3G8MmbRs39wuHqcWpwDlAywwuSmcD6EerUL70qTVyRRQVNDESZH8DVd4klKuEPkoHoZUwtjvc6QxqbZuCDKP5glU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f3/awD6/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f3/awD6/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768163699; x=1799699699;
  h=date:from:to:cc:subject:message-id;
  bh=SvGkyPpIpwBus6MRLXVn0qiWBaqsTuKgNiFAA5ymmjU=;
  b=f3/awD6/4xjZj7fCw6HXaGpH57nM/9kCMVW5nlHbIWh9aTfU3UIRzy0t
   8+ofTyzWOiw0zRCUHNoT68JQV1Khx/WYdWDpUQiU696uD0XRlTGECxEiu
   4OQkweUUDqexXaqHhT65wUculHzHElsm9JhfVHpLQyCgipyfY5IpKaIRB
   u1C9ioDrNI4KBmXkROHrzuYGcez+H1bY5kdr9nryZFqGVp3JT09N9mrjB
   HDSek/YX1+kY9L96Y8Ge3wZA3JXLDZTvSzYfm7ihckYy/SloQDuK224II
   i7zts9onnNl/NnPv4yR6wkZ0AN3SfoBVrGnusCuwXPr8gU5uslo1kgMZP
   Q==;
X-CSE-ConnectionGUID: wBiXB8NRTHmOuhNzBUrWOg==
X-CSE-MsgGUID: dDFFt7BETOefJYDxL+UYeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69500800"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69500800"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 12:34:59 -0800
X-CSE-ConnectionGUID: RWRRitDUQwqeJzbVi7NpRw==
X-CSE-MsgGUID: Lo+qF6KTQmuR5tkfFlXI7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208459317"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Jan 2026 12:34:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf29H-00000000CgW-0sTG;
	Sun, 11 Jan 2026 20:34:55 +0000
Date: Mon, 12 Jan 2026 04:33:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2049/5095]
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:323 sched_groups_config_write()
 warn: impossible condition '(input[i + 1] > (((~0) >> 1))) => (0-s32max >
 s32max)'
Message-ID: <202601120430.yynirssI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
commit: f474911fe16b3baad218d5b8cd499cd8dc3eb3fb [2049/5095] drm/xe/pf: Add debugfs to set EQ and PT for scheduler groups
:::::: branch date: 3 days ago
:::::: commit date: 3 weeks ago
config: alpha-randconfig-r072-20260111 (https://download.01.org/0day-ci/archive/20260112/202601120430.yynirssI-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.3.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601120430.yynirssI-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:323 sched_groups_config_write() warn: impossible condition '(input[i + 1] > (((~0) >> 1))) => (0-s32max > s32max)'

Old smatch warnings:
drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:603 pf_add_config_attrs() warn: if();
drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:603 pf_add_config_attrs() warn: if();
drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:603 pf_add_config_attrs() warn: if();
drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:603 pf_add_config_attrs() warn: if();
drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:603 pf_add_config_attrs() warn: if();
drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:603 pf_add_config_attrs() warn: if();
drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c:603 pf_add_config_attrs() warn: if();

vim +323 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c

f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  294  
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  295  static ssize_t sched_groups_config_write(struct file *file, const char __user *ubuf,
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  296  					 size_t size, loff_t *pos,
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  297  					 int (*set)(struct xe_gt *, unsigned int, u32 *, u32))
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  298  {
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  299  	struct dentry *parent = file_inode(file)->i_private;
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  300  	unsigned int vfid = extract_vfid(parent);
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  301  	struct xe_gt *gt = extract_gt(parent);
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  302  	u32 values[GUC_MAX_SCHED_GROUPS];
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  303  	int *input __free(kfree) = NULL;
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  304  	u32 count;
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  305  	int ret;
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  306  	int i;
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  307  
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  308  	if (*pos)
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  309  		return -ESPIPE;
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  310  
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  311  	if (!size)
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  312  		return -ENODATA;
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  313  
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  314  	ret = parse_int_array_user(ubuf, min(size, GUC_MAX_SCHED_GROUPS * sizeof(u32)), &input);
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  315  	if (ret)
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  316  		return ret;
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  317  
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  318  	count = input[0];
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  319  	if (count > GUC_MAX_SCHED_GROUPS)
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  320  		return -E2BIG;
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  321  
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  322  	for (i = 0; i < count; i++) {
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18 @323  		if (input[i + 1] < 0 || input[i + 1] > S32_MAX)
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  324  			return -EINVAL;
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  325  
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  326  		values[i] = input[i + 1];
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  327  	}
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  328  
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  329  	guard(xe_pm_runtime)(gt_to_xe(gt));
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  330  	ret = set(gt, vfid, values, count);
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  331  
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  332  	return ret < 0 ? ret : size;
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  333  }
f474911fe16b3b Daniele Ceraolo Spurio 2025-12-18  334  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
