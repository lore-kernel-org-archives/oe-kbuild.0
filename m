Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC22D36BCFA
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Feb 2026 08:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772179868; cv=none; b=CSYVTZUEubPpcEl5Vf+e4h/QgWUKHPnwCmE5WPdA3QHipPpLWG3r/V5Uw3iCm9JcoCTYwrxhE8eOsQg7t3I/mF/lkqmZy/zsFx/sEEY1rvQ2pBb8Es6ULGMV+cAtyf1b/UVeQ6kqBCZUEQjno+4a6bJWqvfM0RjL/0qioDmuT+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772179868; c=relaxed/simple;
	bh=h545sH5JP7cq0FYBaba5LSLeqkoazSa5z5sgcGMTMm0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=TY1/jMRiOyfHhnPXMSe3QVI4cAg6SAaIeFsEfOlx2mYw5+ZR2oQyYFHNgL2otLFrnfFVw25w1Pf8Snj7kg3nV25eVCsimk2LeRH/0grULdw4orzMJhj19AGmQLR8soJBDtEvQT5IrUxeDNTQaz9Q4nr+CgGshXvMecfZ1DeOz+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jOSjRvlP; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jOSjRvlP"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so14182115e9.3
        for <oe-kbuild@lists.linux.dev>; Fri, 27 Feb 2026 00:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772179865; x=1772784665; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qZmaHsQoW2ym4yvD8dDk2Aay7lPHS5+f4YhmsNPYSH8=;
        b=jOSjRvlPG2bzqFqebxRlzSGq0ETht4A7EgNaVQmTn+maH5ZYBRcHbpGmWaWMZQZMT7
         6Vnk8cNrFPtUemmqunwhRZ+o70V+s5J+27lAiICIYvvasKl8pBd04+IUoPVMTdRzUaAE
         QSEba3QoP29VXtA0VYVGZicNF7sKKc5/p0clI2n41FqX0r7DrOpxwycO7ZFaA4h5fZow
         WwHKRa0qKV9p2XcFk9jwk9+gIYAmJwELsh9wVDBMvkQqBzWOj2SWZ/M52XX0yF2dDvP0
         MT+MRuxEuTWC4KfiGVBzOSbaldj2hKed8srfK0EvcJwwd6uMy7WG+6YmkProCQCevfsh
         08Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772179865; x=1772784665;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZmaHsQoW2ym4yvD8dDk2Aay7lPHS5+f4YhmsNPYSH8=;
        b=U/WXTmwQ25E4BU3VniSTFHsBXBCVAqMeBMpmhpM/T11i0lb96Nd4akjIeF0BL5E1BE
         n1JRhpdCR/oCrWJ4ZXp1Ip63gnGkFVHN6sMgtD6Kt3+4rR77qcHSWhat4Rp8ylJDSW4E
         eCHRki8vT9PlqZaTrRpMeWIRCbjd6zxzGyM01dRASzZtyg+jqY2ASGnMUQZbAkNYi2o5
         sFfDzXnK1pn6l1KroUEXxmeBjncf3K5llffLqMLs19kt6+I4JG767cvwLbWmQj5C2EyS
         WzM6G/yVelCjbJ5hnkM5npKP4sApJOVOLu/vUgB1devDbaoapwDDNjHpTCh3377dhTGk
         Qj4g==
X-Gm-Message-State: AOJu0YwhOeaFCyP3q6egREgiBWlzAmheGa+pGYocg7jlM512leZoEgwo
	nikGFQiEI6ecKGG+XPZGXYz3itC/gUN+/gJFQYMwkdxxl+UleCCSJpzXWfZQ8GLfL95huXzCw7Z
	ZYSpZ
X-Gm-Gg: ATEYQzyuBOwKkAdI/nmZr2UwX9IcewbQPa2QVdJ8pG3Taw9DBNtn8BtpJ/tEMRGqvoQ
	OI8OX+Gr+k2r1gj3fom7GbOT+ARRNfttPZhIYSnvOmG/uDgGxmwMmuEXknQPPRkpV5nVJaFMuJp
	hXEWYfMF1GVGZ3JgNjbTeusu4wF2iIRqC/mYfl6Mw6xYst3hE5DGVT0FwXOZ/BX1YxcxYNpPu8c
	wSzF1+HS75s5ZJqFc5Xygw37FDPpbXxVRSK46Bnw+XMn1yu4ePb8aNXIuEOyBuGanl/oEhwI6zz
	ymJcnQ0/o8PJ6w2dVO1DtwMxXF5/p+5p1b+6/OMiSrZN01qQVknd4qdQxiSKMlT+W5VTFOJzg2c
	ZRbyAwLjiNYeMA+li+pdMC3elEMSHKNxvGxmI8y5+CWZBSJlVhmCAGpg6IJDw1Vzn+lCEv7NTvK
	jII0GtIl7zEdRk4Fvk7/mViYGSMWtKIlgKYtYPPeQ=
X-Received: by 2002:a05:600c:1f91:b0:47d:92bb:2723 with SMTP id 5b1f17b1804b1-483c9ba3683mr24302515e9.3.1772179864758;
        Fri, 27 Feb 2026 00:11:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b3471asm98930155e9.3.2026.02.27.00.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 00:11:04 -0800 (PST)
Date: Fri, 27 Feb 2026 11:11:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, longli@microsoft.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org
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
In-Reply-To: <177213348504.92223.5330421592610811972.stgit@skinsburskii-cloud-desktop.internal.cloudapp.net>
Message-ID: <20260227081101.tzD-hLY1elWss2pgySe6UMpwfOUvCZk2hwbcx_9KWyI@z>

Hi Stanislav,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stanislav-Kinsburskii/mshv-Introduce-tracing-support/20260227-031942
base:   linus/master
patch link:    https://lore.kernel.org/r/177213348504.92223.5330421592610811972.stgit%40skinsburskii-cloud-desktop.internal.cloudapp.net
patch subject: [PATCH] mshv: Introduce tracing support
config: x86_64-randconfig-161-20260227 (https://download.01.org/0day-ci/archive/20260227/202602271528.jLhA59mn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602271528.jLhA59mn-lkp@intel.com/

New smatch warnings:
drivers/hv/mshv_root_main.c:1177 mshv_partition_ioctl_create_vp() error: we previously assumed 'vp' could be null (see line 1110)
drivers/hv/mshv_root_main.c:1177 mshv_partition_ioctl_create_vp() error: dereferencing freed memory 'vp' (line 1157)

vim +/vp +1177 drivers/hv/mshv_root_main.c

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

vp is NULL

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
                                                              ^^
freed.

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
                                                                                               ^^^^^^^^^^^^
vp dereferenced.

621191d709b148 Nuno Das Neves        2025-03-14  1178  	return ret;
621191d709b148 Nuno Das Neves        2025-03-14  1179  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

