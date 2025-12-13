Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AA3239085
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 13:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765633671; cv=none; b=M8AdXR8nLYNlI8Ykurl+zotx+rhIoVa8ZgyofFYLWxeEFvwu9Ck4pg85VdB+fS1+yZ4DziYt62AOBdefoPhUyCdGEqMJAD4jyR17ZPyDvTFIg6vESwUTxheQNuXq44Dc2vQY6evTUj+7boeIP/DRRj5xEDfIgPx0U4yA1QqXtpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765633671; c=relaxed/simple;
	bh=caO16k4skHzPF/lNDwd8i6QO38Dx/LiypErEfn8ViNw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T/bz/qG8EYr9iNFt/8LvhdlAAVU4Evu0YXMX7R/Gj3WZO7GYqytzXIqGjGCTwXM4Lb943GUqRqLJlu7wCkakWau9PY4hiUusFQtphQ/fgAYC/KN6Us4sAjDojDUc80uzi/SleDXnL9PAaiKbu9EKO6gw2bPf6fpZL7NqB8wq9e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dA4T0579; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dA4T0579"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765633669; x=1797169669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=caO16k4skHzPF/lNDwd8i6QO38Dx/LiypErEfn8ViNw=;
  b=dA4T0579m2wyTA4z97Ojsqj1aEOvWqOULHK43MczfG9NM3HYN4yaYAYX
   AQ/CS6eh6FG20xmAOYCZlftKfPbVec1yB2+PiY1hvVfl3frux8qehBS3t
   KDeqip+Qo85n2YwYvofAkosJ+9cbo9N5ihOFnjMZ3k8b8/s115YoXjRa3
   Fy7DsmAyUxgdeVRoi0M2KjxF3lUM6feUhR+iwmQQjBAaKs35TjaNRXajA
   IwINE+C/6Eo3V2WH8hc1NR5Rkx+r2BHgWLEji1JqBGYNobyRG1WjwLPMd
   H57bcDduHRdZWG8NOLodgzkBIFDgVDhZdIkXehArFSloslLWpxoL3bKhS
   g==;
X-CSE-ConnectionGUID: qtjDCo2kSsOknIbwnPrcKw==
X-CSE-MsgGUID: IiLUkd40TEWoMetBm4X8+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="70193107"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="70193107"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 05:47:46 -0800
X-CSE-ConnectionGUID: 6/IxCyuzSAW7qNjimq3Wsw==
X-CSE-MsgGUID: 0nnCAasfS2SwJz8Ckj1l1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="198145275"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Dec 2025 05:47:45 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUPyJ-000000007hE-08ap;
	Sat, 13 Dec 2025 13:47:43 +0000
Date: Sat, 13 Dec 2025 21:47:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/misc/ntsync.c:1068 ntsync_wait_all() warn: potential spectre
 issue 'q->entries' [r] (local cap)
Message-ID: <202512132107.xxoLbsRS-lkp@intel.com>
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
TO: Elizabeth Figura <zfigura@codeweavers.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d9c1cfec01cdbf24bd9322ed555713a20422115
commit: c301e1fefc2d6c83a2beb47e9cdd7b59a90b0067 ntsync: No longer depend on BROKEN.
date:   11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-r072-20251213 (https://download.01.org/0day-ci/archive/20251213/202512132107.xxoLbsRS-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512132107.xxoLbsRS-lkp@intel.com/

smatch warnings:
drivers/misc/ntsync.c:1068 ntsync_wait_all() warn: potential spectre issue 'q->entries' [r] (local cap)

vim +1068 drivers/misc/ntsync.c

cdbb997822806c Elizabeth Figura 2024-12-13  1034  
cdbb997822806c Elizabeth Figura 2024-12-13  1035  static int ntsync_wait_all(struct ntsync_device *dev, void __user *argp)
cdbb997822806c Elizabeth Figura 2024-12-13  1036  {
cdbb997822806c Elizabeth Figura 2024-12-13  1037  	struct ntsync_wait_args args;
cdbb997822806c Elizabeth Figura 2024-12-13  1038  	struct ntsync_q *q;
cdbb997822806c Elizabeth Figura 2024-12-13  1039  	int signaled;
cdbb997822806c Elizabeth Figura 2024-12-13  1040  	__u32 i;
cdbb997822806c Elizabeth Figura 2024-12-13  1041  	int ret;
cdbb997822806c Elizabeth Figura 2024-12-13  1042  
cdbb997822806c Elizabeth Figura 2024-12-13  1043  	if (copy_from_user(&args, argp, sizeof(args)))
cdbb997822806c Elizabeth Figura 2024-12-13  1044  		return -EFAULT;
cdbb997822806c Elizabeth Figura 2024-12-13  1045  
cdbb997822806c Elizabeth Figura 2024-12-13  1046  	ret = setup_wait(dev, &args, true, &q);
cdbb997822806c Elizabeth Figura 2024-12-13  1047  	if (ret < 0)
cdbb997822806c Elizabeth Figura 2024-12-13  1048  		return ret;
cdbb997822806c Elizabeth Figura 2024-12-13  1049  
cdbb997822806c Elizabeth Figura 2024-12-13  1050  	/* queue ourselves */
cdbb997822806c Elizabeth Figura 2024-12-13  1051  
cdbb997822806c Elizabeth Figura 2024-12-13  1052  	mutex_lock(&dev->wait_all_lock);
cdbb997822806c Elizabeth Figura 2024-12-13  1053  
cdbb997822806c Elizabeth Figura 2024-12-13  1054  	for (i = 0; i < args.count; i++) {
cdbb997822806c Elizabeth Figura 2024-12-13  1055  		struct ntsync_q_entry *entry = &q->entries[i];
cdbb997822806c Elizabeth Figura 2024-12-13  1056  		struct ntsync_obj *obj = entry->obj;
cdbb997822806c Elizabeth Figura 2024-12-13  1057  
cdbb997822806c Elizabeth Figura 2024-12-13  1058  		atomic_inc(&obj->all_hint);
cdbb997822806c Elizabeth Figura 2024-12-13  1059  
cdbb997822806c Elizabeth Figura 2024-12-13  1060  		/*
cdbb997822806c Elizabeth Figura 2024-12-13  1061  		 * obj->all_waiters is protected by dev->wait_all_lock rather
cdbb997822806c Elizabeth Figura 2024-12-13  1062  		 * than obj->lock, so there is no need to acquire obj->lock
cdbb997822806c Elizabeth Figura 2024-12-13  1063  		 * here.
cdbb997822806c Elizabeth Figura 2024-12-13  1064  		 */
cdbb997822806c Elizabeth Figura 2024-12-13  1065  		list_add_tail(&entry->node, &obj->all_waiters);
cdbb997822806c Elizabeth Figura 2024-12-13  1066  	}
a138179a59d476 Elizabeth Figura 2024-12-13  1067  	if (args.alert) {
a138179a59d476 Elizabeth Figura 2024-12-13 @1068  		struct ntsync_q_entry *entry = &q->entries[args.count];
a138179a59d476 Elizabeth Figura 2024-12-13  1069  		struct ntsync_obj *obj = entry->obj;
a138179a59d476 Elizabeth Figura 2024-12-13  1070  
a138179a59d476 Elizabeth Figura 2024-12-13  1071  		dev_lock_obj(dev, obj);
a138179a59d476 Elizabeth Figura 2024-12-13  1072  		list_add_tail(&entry->node, &obj->any_waiters);
a138179a59d476 Elizabeth Figura 2024-12-13  1073  		dev_unlock_obj(dev, obj);
a138179a59d476 Elizabeth Figura 2024-12-13  1074  	}
cdbb997822806c Elizabeth Figura 2024-12-13  1075  
cdbb997822806c Elizabeth Figura 2024-12-13  1076  	/* check if we are already signaled */
cdbb997822806c Elizabeth Figura 2024-12-13  1077  
cdbb997822806c Elizabeth Figura 2024-12-13  1078  	try_wake_all(dev, q, NULL);
cdbb997822806c Elizabeth Figura 2024-12-13  1079  
cdbb997822806c Elizabeth Figura 2024-12-13  1080  	mutex_unlock(&dev->wait_all_lock);
cdbb997822806c Elizabeth Figura 2024-12-13  1081  
a138179a59d476 Elizabeth Figura 2024-12-13  1082  	/*
a138179a59d476 Elizabeth Figura 2024-12-13  1083  	 * Check if the alert event is signaled, making sure to do so only
a138179a59d476 Elizabeth Figura 2024-12-13  1084  	 * after checking if the other objects are signaled.
a138179a59d476 Elizabeth Figura 2024-12-13  1085  	 */
a138179a59d476 Elizabeth Figura 2024-12-13  1086  
a138179a59d476 Elizabeth Figura 2024-12-13  1087  	if (args.alert) {
a138179a59d476 Elizabeth Figura 2024-12-13  1088  		struct ntsync_obj *obj = q->entries[args.count].obj;
a138179a59d476 Elizabeth Figura 2024-12-13  1089  
a138179a59d476 Elizabeth Figura 2024-12-13  1090  		if (atomic_read(&q->signaled) == -1) {
a138179a59d476 Elizabeth Figura 2024-12-13  1091  			bool all = ntsync_lock_obj(dev, obj);
a138179a59d476 Elizabeth Figura 2024-12-13  1092  			try_wake_any_obj(obj);
a138179a59d476 Elizabeth Figura 2024-12-13  1093  			ntsync_unlock_obj(dev, obj, all);
a138179a59d476 Elizabeth Figura 2024-12-13  1094  		}
a138179a59d476 Elizabeth Figura 2024-12-13  1095  	}
a138179a59d476 Elizabeth Figura 2024-12-13  1096  
cdbb997822806c Elizabeth Figura 2024-12-13  1097  	/* sleep */
cdbb997822806c Elizabeth Figura 2024-12-13  1098  
cdbb997822806c Elizabeth Figura 2024-12-13  1099  	ret = ntsync_schedule(q, &args);
cdbb997822806c Elizabeth Figura 2024-12-13  1100  
cdbb997822806c Elizabeth Figura 2024-12-13  1101  	/* and finally, unqueue */
cdbb997822806c Elizabeth Figura 2024-12-13  1102  
cdbb997822806c Elizabeth Figura 2024-12-13  1103  	mutex_lock(&dev->wait_all_lock);
cdbb997822806c Elizabeth Figura 2024-12-13  1104  
cdbb997822806c Elizabeth Figura 2024-12-13  1105  	for (i = 0; i < args.count; i++) {
cdbb997822806c Elizabeth Figura 2024-12-13  1106  		struct ntsync_q_entry *entry = &q->entries[i];
cdbb997822806c Elizabeth Figura 2024-12-13  1107  		struct ntsync_obj *obj = entry->obj;
cdbb997822806c Elizabeth Figura 2024-12-13  1108  
cdbb997822806c Elizabeth Figura 2024-12-13  1109  		/*
cdbb997822806c Elizabeth Figura 2024-12-13  1110  		 * obj->all_waiters is protected by dev->wait_all_lock rather
cdbb997822806c Elizabeth Figura 2024-12-13  1111  		 * than obj->lock, so there is no need to acquire it here.
cdbb997822806c Elizabeth Figura 2024-12-13  1112  		 */
cdbb997822806c Elizabeth Figura 2024-12-13  1113  		list_del(&entry->node);
cdbb997822806c Elizabeth Figura 2024-12-13  1114  
cdbb997822806c Elizabeth Figura 2024-12-13  1115  		atomic_dec(&obj->all_hint);
b4a7b5fe3f5149 Elizabeth Figura 2024-12-13  1116  
b4a7b5fe3f5149 Elizabeth Figura 2024-12-13  1117  		put_obj(obj);
b4a7b5fe3f5149 Elizabeth Figura 2024-12-13  1118  	}
b4a7b5fe3f5149 Elizabeth Figura 2024-12-13  1119  
cdbb997822806c Elizabeth Figura 2024-12-13  1120  	mutex_unlock(&dev->wait_all_lock);
cdbb997822806c Elizabeth Figura 2024-12-13  1121  
a138179a59d476 Elizabeth Figura 2024-12-13  1122  	if (args.alert) {
a138179a59d476 Elizabeth Figura 2024-12-13  1123  		struct ntsync_q_entry *entry = &q->entries[args.count];
a138179a59d476 Elizabeth Figura 2024-12-13  1124  		struct ntsync_obj *obj = entry->obj;
a138179a59d476 Elizabeth Figura 2024-12-13  1125  		bool all;
a138179a59d476 Elizabeth Figura 2024-12-13  1126  
a138179a59d476 Elizabeth Figura 2024-12-13  1127  		all = ntsync_lock_obj(dev, obj);
a138179a59d476 Elizabeth Figura 2024-12-13  1128  		list_del(&entry->node);
a138179a59d476 Elizabeth Figura 2024-12-13  1129  		ntsync_unlock_obj(dev, obj, all);
a138179a59d476 Elizabeth Figura 2024-12-13  1130  
a138179a59d476 Elizabeth Figura 2024-12-13  1131  		put_obj(obj);
a138179a59d476 Elizabeth Figura 2024-12-13  1132  	}
a138179a59d476 Elizabeth Figura 2024-12-13  1133  
b4a7b5fe3f5149 Elizabeth Figura 2024-12-13  1134  	signaled = atomic_read(&q->signaled);
b4a7b5fe3f5149 Elizabeth Figura 2024-12-13  1135  	if (signaled != -1) {
b4a7b5fe3f5149 Elizabeth Figura 2024-12-13  1136  		struct ntsync_wait_args __user *user_args = argp;
b4a7b5fe3f5149 Elizabeth Figura 2024-12-13  1137  
b4a7b5fe3f5149 Elizabeth Figura 2024-12-13  1138  		/* even if we caught a signal, we need to communicate success */
ecc2ee361466e4 Elizabeth Figura 2024-12-13  1139  		ret = q->ownerdead ? -EOWNERDEAD : 0;
b4a7b5fe3f5149 Elizabeth Figura 2024-12-13  1140  
b4a7b5fe3f5149 Elizabeth Figura 2024-12-13  1141  		if (put_user(signaled, &user_args->index))
b4a7b5fe3f5149 Elizabeth Figura 2024-12-13  1142  			ret = -EFAULT;
b4a7b5fe3f5149 Elizabeth Figura 2024-12-13  1143  	} else if (!ret) {
b4a7b5fe3f5149 Elizabeth Figura 2024-12-13  1144  		ret = -ETIMEDOUT;
b4a7b5fe3f5149 Elizabeth Figura 2024-12-13  1145  	}
b4a7b5fe3f5149 Elizabeth Figura 2024-12-13  1146  
b4a7b5fe3f5149 Elizabeth Figura 2024-12-13  1147  	kfree(q);
b4a7b5fe3f5149 Elizabeth Figura 2024-12-13  1148  	return ret;
b4a7b5fe3f5149 Elizabeth Figura 2024-12-13  1149  }
b4a7b5fe3f5149 Elizabeth Figura 2024-12-13  1150  

:::::: The code at line 1068 was first introduced by commit
:::::: a138179a59d47690b069fbded1be12f47648ef07 ntsync: Introduce alertable waits.

:::::: TO: Elizabeth Figura <zfigura@codeweavers.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
