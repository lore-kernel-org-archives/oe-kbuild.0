Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF08253F1B
	for <oe-kbuild@lists.linux.dev>; Thu,  1 May 2025 20:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746132105; cv=none; b=pgwC/B4zXqyVQJtQ3edQ3FjNpsUNkB+xq9M6w9p3E32Dvy4tuhRIsldiR4TO0mmE24lQdt9yEgzNXhVsGHZyOcqh2iwoUGxskZ+d/RoGpW+Ft9gaa9fl3yLpRRFJPzHejUZZJ2nXjXxm3M07ouUB3op9kqgmIZFocNmW+STesv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746132105; c=relaxed/simple;
	bh=990ztEESifEaMPxRMzPeXlIwP2otN+5aHNCnnWKktSA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MFB8s2B3b0ZKvHbpY2RILoakLD1f+WvdJO7utnvd+OGEYnDstlZdEpyYS8JlDuMYTyQ+/2IUkl2LZ+j4I2Y69iTw7o8GXZE+MRN3zjOrcCVRjY9bCUfCZEEtVYk8a/SnmikPg+1vCMbUVVJXOjiNZhQF7lCF7QgIAVRE68TgkpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U1raUfLR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U1raUfLR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746132104; x=1777668104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=990ztEESifEaMPxRMzPeXlIwP2otN+5aHNCnnWKktSA=;
  b=U1raUfLRC5Dr0fLeWGiAJ7Myd4xUOgq5KYB/Il3Dlnf1Pw1iWpe6XL7P
   Hx70YDHG/GPvbUnMFo3l3TKRi583v94h92YtQ/l4xgW2AUk/ILUdJ330z
   MBquk0tnGiJvnNLer7FL1HHykpFzjgH6yZB1ZB1FTnE4SA/EPQ8pEpe3Z
   EF/xLfDLGsbwfYc+GOC8CmQlyGfKM24ySVLfiIbHo7XGY0V0tXn5LRgEG
   8IKSicCBPzz9iXtwRGBm0RllwQ+Q8lNrEv0v6glNyhDaHgckbytmiB4Sw
   pmyJyj3iRNiGLwqqSyUIvvcu4DdBvBRhM05MLKzcbybJ6Q2iCo7S87nom
   w==;
X-CSE-ConnectionGUID: /Q+P2i2lTIqlNG/tPf1JbA==
X-CSE-MsgGUID: vClwuqYyQKKcZYFQC8EcRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="58442899"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="58442899"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 13:41:38 -0700
X-CSE-ConnectionGUID: GhY3iVSdSUmUXQys0q+7Iw==
X-CSE-MsgGUID: rDZUhXBXRwGNITrV+hk8cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="138489642"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 01 May 2025 13:41:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAait-0004Nz-0D;
	Thu, 01 May 2025 20:41:35 +0000
Date: Fri, 2 May 2025 04:41:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6217/7105] mm/mempolicy.c:3572
 sysfs_wi_node_add() warn: missing error code 'ret'
Message-ID: <202505020458.yLHRAaW9-lkp@intel.com>
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
TO: Rakie Kim <rakie.kim@sk.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Honggyu Kim <honggyu.kim@sk.com>
CC: Yunjeong Mun <yunjeong.mun@sk.com>
CC: Oscar Salvador <osalvador@suse.de>
CC: Joshua Hahn <joshua.hahnjy@gmail.com>
CC: Gregory Price <gourry@gourry.net>
CC: Dan Williams <dan.j.williams@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3e039dcc9c1320c0d33ddd51c372dcc91d3ea3c7
commit: ea02ba7e054ddc000704088ac21c96128044a0f4 [6217/7105] mm/mempolicy: support memory hotplug in weighted interleave
:::::: branch date: 11 hours ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20250502 (https://download.01.org/0day-ci/archive/20250502/202505020458.yLHRAaW9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505020458.yLHRAaW9-lkp@intel.com/

smatch warnings:
mm/mempolicy.c:3572 sysfs_wi_node_add() warn: missing error code 'ret'

vim +/ret +3572 mm/mempolicy.c

dce41f5ae2539d Rakie Kim 2024-02-02  3539  
74f88993f17fe4 Rakie Kim 2025-04-17  3540  static int sysfs_wi_node_add(int nid)
dce41f5ae2539d Rakie Kim 2024-02-02  3541  {
ea02ba7e054ddc Rakie Kim 2025-04-17  3542  	int ret = 0;
dce41f5ae2539d Rakie Kim 2024-02-02  3543  	char *name;
ea02ba7e054ddc Rakie Kim 2025-04-17  3544  	struct iw_node_attr *new_attr;
dce41f5ae2539d Rakie Kim 2024-02-02  3545  
ea02ba7e054ddc Rakie Kim 2025-04-17  3546  	if (nid < 0 || nid >= nr_node_ids) {
ea02ba7e054ddc Rakie Kim 2025-04-17  3547  		pr_err("invalid node id: %d\n", nid);
ea02ba7e054ddc Rakie Kim 2025-04-17  3548  		return -EINVAL;
ea02ba7e054ddc Rakie Kim 2025-04-17  3549  	}
ea02ba7e054ddc Rakie Kim 2025-04-17  3550  
ea02ba7e054ddc Rakie Kim 2025-04-17  3551  	new_attr = kzalloc(sizeof(*new_attr), GFP_KERNEL);
ea02ba7e054ddc Rakie Kim 2025-04-17  3552  	if (!new_attr)
dce41f5ae2539d Rakie Kim 2024-02-02  3553  		return -ENOMEM;
dce41f5ae2539d Rakie Kim 2024-02-02  3554  
dce41f5ae2539d Rakie Kim 2024-02-02  3555  	name = kasprintf(GFP_KERNEL, "node%d", nid);
dce41f5ae2539d Rakie Kim 2024-02-02  3556  	if (!name) {
ea02ba7e054ddc Rakie Kim 2025-04-17  3557  		kfree(new_attr);
dce41f5ae2539d Rakie Kim 2024-02-02  3558  		return -ENOMEM;
dce41f5ae2539d Rakie Kim 2024-02-02  3559  	}
dce41f5ae2539d Rakie Kim 2024-02-02  3560  
ea02ba7e054ddc Rakie Kim 2025-04-17  3561  	sysfs_attr_init(&new_attr->kobj_attr.attr);
ea02ba7e054ddc Rakie Kim 2025-04-17  3562  	new_attr->kobj_attr.attr.name = name;
ea02ba7e054ddc Rakie Kim 2025-04-17  3563  	new_attr->kobj_attr.attr.mode = 0644;
ea02ba7e054ddc Rakie Kim 2025-04-17  3564  	new_attr->kobj_attr.show = node_show;
ea02ba7e054ddc Rakie Kim 2025-04-17  3565  	new_attr->kobj_attr.store = node_store;
ea02ba7e054ddc Rakie Kim 2025-04-17  3566  	new_attr->nid = nid;
dce41f5ae2539d Rakie Kim 2024-02-02  3567  
ea02ba7e054ddc Rakie Kim 2025-04-17  3568  	mutex_lock(&wi_group->kobj_lock);
ea02ba7e054ddc Rakie Kim 2025-04-17  3569  	if (wi_group->nattrs[nid]) {
ea02ba7e054ddc Rakie Kim 2025-04-17  3570  		mutex_unlock(&wi_group->kobj_lock);
ea02ba7e054ddc Rakie Kim 2025-04-17  3571  		pr_info("node%d already exists\n", nid);
ea02ba7e054ddc Rakie Kim 2025-04-17 @3572  		goto out;
dce41f5ae2539d Rakie Kim 2024-02-02  3573  	}
dce41f5ae2539d Rakie Kim 2024-02-02  3574  
ea02ba7e054ddc Rakie Kim 2025-04-17  3575  	ret = sysfs_create_file(&wi_group->wi_kobj, &new_attr->kobj_attr.attr);
ea02ba7e054ddc Rakie Kim 2025-04-17  3576  	if (ret) {
ea02ba7e054ddc Rakie Kim 2025-04-17  3577  		mutex_unlock(&wi_group->kobj_lock);
ea02ba7e054ddc Rakie Kim 2025-04-17  3578  		goto out;
ea02ba7e054ddc Rakie Kim 2025-04-17  3579  	}
ea02ba7e054ddc Rakie Kim 2025-04-17  3580  	wi_group->nattrs[nid] = new_attr;
ea02ba7e054ddc Rakie Kim 2025-04-17  3581  	mutex_unlock(&wi_group->kobj_lock);
dce41f5ae2539d Rakie Kim 2024-02-02  3582  	return 0;
ea02ba7e054ddc Rakie Kim 2025-04-17  3583  
ea02ba7e054ddc Rakie Kim 2025-04-17  3584  out:
ea02ba7e054ddc Rakie Kim 2025-04-17  3585  	kfree(new_attr->kobj_attr.attr.name);
ea02ba7e054ddc Rakie Kim 2025-04-17  3586  	kfree(new_attr);
ea02ba7e054ddc Rakie Kim 2025-04-17  3587  	return ret;
ea02ba7e054ddc Rakie Kim 2025-04-17  3588  }
ea02ba7e054ddc Rakie Kim 2025-04-17  3589  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
