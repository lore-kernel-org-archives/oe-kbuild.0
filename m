Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCB63290CA
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Feb 2026 07:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772178688; cv=none; b=o1opfmxlqfnQqFwGOcwlyfRcJU8oK/CX8TZ6aqEvcKjcPpEFdYEaHxIrN0wZ5+whkDGQHW4HzHXbqG1whMBMZq9UEuzmojmH6cWyM9HJlvcAaC1mX38xQP37xgL7AO8SCjEUa+ZUn7XitXHcfQXtlmtT1u6Q/NFhcCeESf6M2OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772178688; c=relaxed/simple;
	bh=8/IGEfioCTeXib4ThqQJXz4Qn7DpSf/a1LlM+8TuvgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jql8lTC2Z3XhWlSqaOxuL5RXOTFUUOzMYLbiBdjILnVPb3lYF5qeSpxYXPvBXDZCF96/Eu9Um7MmcevQLsZa/0XoYfYjty1yor8WiDelx/R+VjSHJU7yUv5VLR+D7qTF38X79sxLBHNAVZlJ7T6SfIG8OhLOF+bYkRctPKqEmG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ysaow6XW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ysaow6XW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772178686; x=1803714686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8/IGEfioCTeXib4ThqQJXz4Qn7DpSf/a1LlM+8TuvgU=;
  b=Ysaow6XWBye9/P7iZqP5OOqVhCcjUin3yignk7mpNcikf+MimtrhAnbe
   jMxF/lhVwoeFEXxCagsVP8SXBMsGejJJb84+zJDnbXm3ZBWfxcGd+8Tlw
   8clDlAOm+4/sC6BkyJem1lfCmSeh331QJpcdhUhQGeHsDx9E/Z2XZNxvF
   2xuJizz9r+8HLgtYUv4S2rtn97CRVNe+ZpAigEyvOPoF34v31Us5mD6F9
   /wlMIe58DVsWn+8XPNAEliIDAMcghZTc/IysQrcR5utDqUXRq3VdDBUFw
   ohyNjBaso9Otx014AR1aovGrX7nIxQTghzyAbUyg1+7XitKW8LXVehoHx
   g==;
X-CSE-ConnectionGUID: vOrBBCxwQJydmf+2cs+zJQ==
X-CSE-MsgGUID: rqScBoEoRWas4VbUDFbLXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73128772"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="73128772"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 23:51:25 -0800
X-CSE-ConnectionGUID: x7cxkwg1QsGQOOTBI4U6bA==
X-CSE-MsgGUID: 6vUZjqMBTySpCZ4X6UA48Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="254608407"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 26 Feb 2026 23:51:23 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvscb-00000000AL9-32d4;
	Fri, 27 Feb 2026 07:50:54 +0000
Date: Fri, 27 Feb 2026 15:50:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] mshv: Introduce tracing support
Message-ID: <202602271528.jLhA59mn-lkp@intel.com>
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
In-Reply-To: <177213348504.92223.5330421592610811972.stgit@skinsburskii-cloud-desktop.internal.cloudapp.net>
References: <177213348504.92223.5330421592610811972.stgit@skinsburskii-cloud-desktop.internal.cloudapp.net>
TO: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
TO: kys@microsoft.com
TO: haiyangz@microsoft.com
TO: wei.liu@kernel.org
TO: decui@microsoft.com
TO: longli@microsoft.com
CC: linux-hyperv@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Stanislav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.0-rc1 next-20260226]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Kinsburskii/mshv-Introduce-tracing-support/20260227-031942
base:   linus/master
patch link:    https://lore.kernel.org/r/177213348504.92223.5330421592610811972.stgit%40skinsburskii-cloud-desktop.internal.cloudapp.net
patch subject: [PATCH] mshv: Introduce tracing support
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: x86_64-randconfig-161-20260227 (https://download.01.org/0day-ci/archive/20260227/202602271528.jLhA59mn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602271528.jLhA59mn-lkp@intel.com/

New smatch warnings:
drivers/hv/mshv_root_main.c:1177 mshv_partition_ioctl_create_vp() error: we previously assumed 'vp' could be null (see line 1110)
drivers/hv/mshv_root_main.c:1177 mshv_partition_ioctl_create_vp() error: dereferencing freed memory 'vp' (line 1157)

Old smatch warnings:
drivers/hv/mshv_root_main.c:1148 mshv_partition_ioctl_create_vp() warn: potential spectre issue 'partition->pt_vp_array' [w]

vim +/vp +1177 drivers/hv/mshv_root_main.c

621191d709b148 Nuno Das Neves        2025-03-14  1056  
621191d709b148 Nuno Das Neves        2025-03-14  1057  static long
621191d709b148 Nuno Das Neves        2025-03-14  1058  mshv_partition_ioctl_create_vp(struct mshv_partition *partition,
621191d709b148 Nuno Das Neves        2025-03-14  1059  			       void __user *arg)
621191d709b148 Nuno Das Neves        2025-03-14  1060  {
621191d709b148 Nuno Das Neves        2025-03-14  1061  	struct mshv_create_vp args;
621191d709b148 Nuno Das Neves        2025-03-14  1062  	struct mshv_vp *vp;
19c515c27cee3b Jinank Jain           2025-10-10  1063  	struct page *intercept_msg_page, *register_page, *ghcb_page;
2de4516aa8f726 Stanislav Kinsburskii 2026-01-28  1064  	struct hv_stats_page *stats_pages[2];
621191d709b148 Nuno Das Neves        2025-03-14  1065  	long ret;
621191d709b148 Nuno Das Neves        2025-03-14  1066  
621191d709b148 Nuno Das Neves        2025-03-14  1067  	if (copy_from_user(&args, arg, sizeof(args)))
621191d709b148 Nuno Das Neves        2025-03-14  1068  		return -EFAULT;
621191d709b148 Nuno Das Neves        2025-03-14  1069  
621191d709b148 Nuno Das Neves        2025-03-14  1070  	if (args.vp_index >= MSHV_MAX_VPS)
621191d709b148 Nuno Das Neves        2025-03-14  1071  		return -EINVAL;
621191d709b148 Nuno Das Neves        2025-03-14  1072  
621191d709b148 Nuno Das Neves        2025-03-14  1073  	if (partition->pt_vp_array[args.vp_index])
621191d709b148 Nuno Das Neves        2025-03-14  1074  		return -EEXIST;
621191d709b148 Nuno Das Neves        2025-03-14  1075  
621191d709b148 Nuno Das Neves        2025-03-14  1076  	ret = hv_call_create_vp(NUMA_NO_NODE, partition->pt_id, args.vp_index,
621191d709b148 Nuno Das Neves        2025-03-14  1077  				0 /* Only valid for root partition VPs */);
621191d709b148 Nuno Das Neves        2025-03-14  1078  	if (ret)
621191d709b148 Nuno Das Neves        2025-03-14  1079  		return ret;
621191d709b148 Nuno Das Neves        2025-03-14  1080  
19c515c27cee3b Jinank Jain           2025-10-10  1081  	ret = hv_map_vp_state_page(partition->pt_id, args.vp_index,
621191d709b148 Nuno Das Neves        2025-03-14  1082  				   HV_VP_STATE_PAGE_INTERCEPT_MESSAGE,
19c515c27cee3b Jinank Jain           2025-10-10  1083  				   input_vtl_zero, &intercept_msg_page);
621191d709b148 Nuno Das Neves        2025-03-14  1084  	if (ret)
621191d709b148 Nuno Das Neves        2025-03-14  1085  		goto destroy_vp;
621191d709b148 Nuno Das Neves        2025-03-14  1086  
621191d709b148 Nuno Das Neves        2025-03-14  1087  	if (!mshv_partition_encrypted(partition)) {
19c515c27cee3b Jinank Jain           2025-10-10  1088  		ret = hv_map_vp_state_page(partition->pt_id, args.vp_index,
621191d709b148 Nuno Das Neves        2025-03-14  1089  					   HV_VP_STATE_PAGE_REGISTERS,
19c515c27cee3b Jinank Jain           2025-10-10  1090  					   input_vtl_zero, &register_page);
621191d709b148 Nuno Das Neves        2025-03-14  1091  		if (ret)
621191d709b148 Nuno Das Neves        2025-03-14  1092  			goto unmap_intercept_message_page;
621191d709b148 Nuno Das Neves        2025-03-14  1093  	}
621191d709b148 Nuno Das Neves        2025-03-14  1094  
621191d709b148 Nuno Das Neves        2025-03-14  1095  	if (mshv_partition_encrypted(partition) &&
621191d709b148 Nuno Das Neves        2025-03-14  1096  	    is_ghcb_mapping_available()) {
19c515c27cee3b Jinank Jain           2025-10-10  1097  		ret = hv_map_vp_state_page(partition->pt_id, args.vp_index,
621191d709b148 Nuno Das Neves        2025-03-14  1098  					   HV_VP_STATE_PAGE_GHCB,
19c515c27cee3b Jinank Jain           2025-10-10  1099  					   input_vtl_normal, &ghcb_page);
621191d709b148 Nuno Das Neves        2025-03-14  1100  		if (ret)
621191d709b148 Nuno Das Neves        2025-03-14  1101  			goto unmap_register_page;
621191d709b148 Nuno Das Neves        2025-03-14  1102  	}
621191d709b148 Nuno Das Neves        2025-03-14  1103  
621191d709b148 Nuno Das Neves        2025-03-14  1104  	ret = mshv_vp_stats_map(partition->pt_id, args.vp_index,
621191d709b148 Nuno Das Neves        2025-03-14  1105  				stats_pages);
621191d709b148 Nuno Das Neves        2025-03-14  1106  	if (ret)
621191d709b148 Nuno Das Neves        2025-03-14  1107  		goto unmap_ghcb_page;
621191d709b148 Nuno Das Neves        2025-03-14  1108  
bf4afc53b77aea Linus Torvalds        2026-02-21  1109  	vp = kzalloc_obj(*vp);
621191d709b148 Nuno Das Neves        2025-03-14 @1110  	if (!vp)
621191d709b148 Nuno Das Neves        2025-03-14  1111  		goto unmap_stats_pages;
621191d709b148 Nuno Das Neves        2025-03-14  1112  
621191d709b148 Nuno Das Neves        2025-03-14  1113  	vp->vp_partition = mshv_partition_get(partition);
621191d709b148 Nuno Das Neves        2025-03-14  1114  	if (!vp->vp_partition) {
621191d709b148 Nuno Das Neves        2025-03-14  1115  		ret = -EBADF;
621191d709b148 Nuno Das Neves        2025-03-14  1116  		goto free_vp;
621191d709b148 Nuno Das Neves        2025-03-14  1117  	}
621191d709b148 Nuno Das Neves        2025-03-14  1118  
621191d709b148 Nuno Das Neves        2025-03-14  1119  	mutex_init(&vp->vp_mutex);
621191d709b148 Nuno Das Neves        2025-03-14  1120  	init_waitqueue_head(&vp->run.vp_suspend_queue);
621191d709b148 Nuno Das Neves        2025-03-14  1121  	atomic64_set(&vp->run.vp_signaled_count, 0);
621191d709b148 Nuno Das Neves        2025-03-14  1122  
621191d709b148 Nuno Das Neves        2025-03-14  1123  	vp->vp_index = args.vp_index;
19c515c27cee3b Jinank Jain           2025-10-10  1124  	vp->vp_intercept_msg_page = page_to_virt(intercept_msg_page);
621191d709b148 Nuno Das Neves        2025-03-14  1125  	if (!mshv_partition_encrypted(partition))
621191d709b148 Nuno Das Neves        2025-03-14  1126  		vp->vp_register_page = page_to_virt(register_page);
621191d709b148 Nuno Das Neves        2025-03-14  1127  
621191d709b148 Nuno Das Neves        2025-03-14  1128  	if (mshv_partition_encrypted(partition) && is_ghcb_mapping_available())
621191d709b148 Nuno Das Neves        2025-03-14  1129  		vp->vp_ghcb_page = page_to_virt(ghcb_page);
621191d709b148 Nuno Das Neves        2025-03-14  1130  
621191d709b148 Nuno Das Neves        2025-03-14  1131  	memcpy(vp->vp_stats_pages, stats_pages, sizeof(stats_pages));
621191d709b148 Nuno Das Neves        2025-03-14  1132  
ff225ba9ad71c4 Nuno Das Neves        2026-01-28  1133  	ret = mshv_debugfs_vp_create(vp);
ff225ba9ad71c4 Nuno Das Neves        2026-01-28  1134  	if (ret)
ff225ba9ad71c4 Nuno Das Neves        2026-01-28  1135  		goto put_partition;
ff225ba9ad71c4 Nuno Das Neves        2026-01-28  1136  
621191d709b148 Nuno Das Neves        2025-03-14  1137  	/*
621191d709b148 Nuno Das Neves        2025-03-14  1138  	 * Keep anon_inode_getfd last: it installs fd in the file struct and
621191d709b148 Nuno Das Neves        2025-03-14  1139  	 * thus makes the state accessible in user space.
621191d709b148 Nuno Das Neves        2025-03-14  1140  	 */
621191d709b148 Nuno Das Neves        2025-03-14  1141  	ret = anon_inode_getfd("mshv_vp", &mshv_vp_fops, vp,
621191d709b148 Nuno Das Neves        2025-03-14  1142  			       O_RDWR | O_CLOEXEC);
621191d709b148 Nuno Das Neves        2025-03-14  1143  	if (ret < 0)
ff225ba9ad71c4 Nuno Das Neves        2026-01-28  1144  		goto remove_debugfs_vp;
621191d709b148 Nuno Das Neves        2025-03-14  1145  
621191d709b148 Nuno Das Neves        2025-03-14  1146  	/* already exclusive with the partition mutex for all ioctls */
621191d709b148 Nuno Das Neves        2025-03-14  1147  	partition->pt_vp_count++;
621191d709b148 Nuno Das Neves        2025-03-14  1148  	partition->pt_vp_array[args.vp_index] = vp;
621191d709b148 Nuno Das Neves        2025-03-14  1149  
33c08ba966cf23 Stanislav Kinsburskii 2026-02-26  1150  	goto out;
621191d709b148 Nuno Das Neves        2025-03-14  1151  
ff225ba9ad71c4 Nuno Das Neves        2026-01-28  1152  remove_debugfs_vp:
ff225ba9ad71c4 Nuno Das Neves        2026-01-28  1153  	mshv_debugfs_vp_remove(vp);
621191d709b148 Nuno Das Neves        2025-03-14  1154  put_partition:
621191d709b148 Nuno Das Neves        2025-03-14  1155  	mshv_partition_put(partition);
621191d709b148 Nuno Das Neves        2025-03-14  1156  free_vp:
621191d709b148 Nuno Das Neves        2025-03-14 @1157  	kfree(vp);
621191d709b148 Nuno Das Neves        2025-03-14  1158  unmap_stats_pages:
d62313bdf5961b Jinank Jain           2025-10-10  1159  	mshv_vp_stats_unmap(partition->pt_id, args.vp_index, stats_pages);
621191d709b148 Nuno Das Neves        2025-03-14  1160  unmap_ghcb_page:
19c515c27cee3b Jinank Jain           2025-10-10  1161  	if (mshv_partition_encrypted(partition) && is_ghcb_mapping_available())
19c515c27cee3b Jinank Jain           2025-10-10  1162  		hv_unmap_vp_state_page(partition->pt_id, args.vp_index,
19c515c27cee3b Jinank Jain           2025-10-10  1163  				       HV_VP_STATE_PAGE_GHCB, ghcb_page,
621191d709b148 Nuno Das Neves        2025-03-14  1164  				       input_vtl_normal);
621191d709b148 Nuno Das Neves        2025-03-14  1165  unmap_register_page:
19c515c27cee3b Jinank Jain           2025-10-10  1166  	if (!mshv_partition_encrypted(partition))
19c515c27cee3b Jinank Jain           2025-10-10  1167  		hv_unmap_vp_state_page(partition->pt_id, args.vp_index,
621191d709b148 Nuno Das Neves        2025-03-14  1168  				       HV_VP_STATE_PAGE_REGISTERS,
19c515c27cee3b Jinank Jain           2025-10-10  1169  				       register_page, input_vtl_zero);
621191d709b148 Nuno Das Neves        2025-03-14  1170  unmap_intercept_message_page:
19c515c27cee3b Jinank Jain           2025-10-10  1171  	hv_unmap_vp_state_page(partition->pt_id, args.vp_index,
621191d709b148 Nuno Das Neves        2025-03-14  1172  			       HV_VP_STATE_PAGE_INTERCEPT_MESSAGE,
19c515c27cee3b Jinank Jain           2025-10-10  1173  			       intercept_msg_page, input_vtl_zero);
621191d709b148 Nuno Das Neves        2025-03-14  1174  destroy_vp:
621191d709b148 Nuno Das Neves        2025-03-14  1175  	hv_call_delete_vp(partition->pt_id, args.vp_index);
33c08ba966cf23 Stanislav Kinsburskii 2026-02-26  1176  out:
33c08ba966cf23 Stanislav Kinsburskii 2026-02-26 @1177  	trace_mshv_create_vp(partition->pt_id, vp->vp_index, ret);
621191d709b148 Nuno Das Neves        2025-03-14  1178  	return ret;
621191d709b148 Nuno Das Neves        2025-03-14  1179  }
621191d709b148 Nuno Das Neves        2025-03-14  1180  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
