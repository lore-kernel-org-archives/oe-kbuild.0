Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D6A1A0726
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Dec 2024 22:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733955501; cv=none; b=A+EZq75YKkmtJhESSDNTZcgW0sd0SnHjiI+pRrLB3WWX3s2Lx+p3VFqQ/7e/r/O2Gagys7jWUtxS14Cn0yQi+W1Gqo/zv/FVTPUBoJhysAZphfNICDlS7fyqI1vbc77JJld/FEmX06aqTMThDWdV5pGj2xoU4EVBF2D+n9yEd80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733955501; c=relaxed/simple;
	bh=w/mME3HFFiBmkHbcNxHiVR2VZfq8ATqUo1oVGypq+2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nJyk4ccYEOXptXTudbmypBcPV0PVh2gzrfZ/7U2XFHCdH/CSLNbOkNhV9B++eMhRtG9Uu0pzGSdzCVlzD8k1f8DYYb64+61Xhvs91zCWSLQp7JLO13LusKoa1D/MOwFisIGAP5Jdd8qq4uOuy87u6R+RxvH8aVAjNdXTVtSAiA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UsAlmMgg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UsAlmMgg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733955500; x=1765491500;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=w/mME3HFFiBmkHbcNxHiVR2VZfq8ATqUo1oVGypq+2M=;
  b=UsAlmMggaozaXTbkG0jkJSS0TCdFqMKSPbxXPoeFk2KDT7bUFzTdTty/
   RIV7fVj9KwlFv5xVbVDJEAZP0AxP1RDq6f9Eob+x9DdXjlwdCpNeJFBNp
   /fehF+u5dOqFyT3N0HXClvLAgkjNUuDUAXzaxqH4bTo0LLYjAOEVvQ7yW
   /Ki8wyY3zjJ8VwZhTVJnX5dGU7EYKX8Bj6YtiIIoKw7ZhPOo1sbfsN18Z
   QZyV68jEVoAVtvPtbJFS4jQAtbDCdTaxTblBJ5SlZPxfhdtJ+rOeAC0+G
   pcjIsgoGugiY0yLz+KxAjkcUCC386umT7YyLHLcmhdXFLKN8wJPNt8uQR
   g==;
X-CSE-ConnectionGUID: Umv+PZeRQTC5yX8UbdLBSw==
X-CSE-MsgGUID: xydxKq9fTN2blQo8r13OQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="59753004"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="59753004"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 14:18:19 -0800
X-CSE-ConnectionGUID: IGr7QEcQQWO7u3lVD8zIvQ==
X-CSE-MsgGUID: vpWgtzPERlSmZhLCdrRAcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="96186458"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Dec 2024 14:18:17 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLV26-00079W-1t;
	Wed, 11 Dec 2024 22:18:14 +0000
Date: Thu, 12 Dec 2024 06:17:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v6 28/28] ntsync: No longer depend on BROKEN.
Message-ID: <202412120618.cqaPBBkL-lkp@intel.com>
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
In-Reply-To: <20241209185904.507350-29-zfigura@codeweavers.com>
References: <20241209185904.507350-29-zfigura@codeweavers.com>
TO: Elizabeth Figura <zfigura@codeweavers.com>
TO: Arnd Bergmann <arnd@arndb.de>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Shuah Khan <skhan@linuxfoundation.org>
CC: linux-kernel@vger.kernel.org
CC: linux-api@vger.kernel.org
CC: wine-devel@winehq.org
CC: "André Almeida" <andrealmeid@igalia.com>
CC: Wolfram Sang <wsa-dev@sang-engineering.com>
CC: Arkadiusz Hiler <ahiler@codeweavers.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Andy Lutomirski <luto@kernel.org>
CC: linux-doc@vger.kernel.org
CC: linux-kselftest@vger.kernel.org
CC: Randy Dunlap <rdunlap@infradead.org>
CC: Ingo Molnar <mingo@redhat.com>
CC: Will Deacon <will@kernel.org>
CC: Waiman Long <longman@redhat.com>
CC: Boqun Feng <boqun.feng@gmail.com>
CC: Elizabeth Figura <zfigura@codeweavers.com>

Hi Elizabeth,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cdd30ebb1b9f36159d66f088b61aee264e649d7a]

url:    https://github.com/intel-lab-lkp/linux/commits/Elizabeth-Figura/ntsync-Introduce-NTSYNC_IOC_WAIT_ANY/20241210-031155
base:   cdd30ebb1b9f36159d66f088b61aee264e649d7a
patch link:    https://lore.kernel.org/r/20241209185904.507350-29-zfigura%40codeweavers.com
patch subject: [PATCH v6 28/28] ntsync: No longer depend on BROKEN.
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: microblaze-randconfig-r073-20241210 (https://download.01.org/0day-ci/archive/20241212/202412120618.cqaPBBkL-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412120618.cqaPBBkL-lkp@intel.com/

smatch warnings:
drivers/misc/ntsync.c:1083 ntsync_wait_all() warn: potential spectre issue 'q->entries' [r] (local cap)

vim +1083 drivers/misc/ntsync.c

e48f54281af61c1 Elizabeth Figura 2024-12-09  1049  
e48f54281af61c1 Elizabeth Figura 2024-12-09  1050  static int ntsync_wait_all(struct ntsync_device *dev, void __user *argp)
e48f54281af61c1 Elizabeth Figura 2024-12-09  1051  {
e48f54281af61c1 Elizabeth Figura 2024-12-09  1052  	struct ntsync_wait_args args;
e48f54281af61c1 Elizabeth Figura 2024-12-09  1053  	struct ntsync_q *q;
e48f54281af61c1 Elizabeth Figura 2024-12-09  1054  	int signaled;
e48f54281af61c1 Elizabeth Figura 2024-12-09  1055  	__u32 i;
e48f54281af61c1 Elizabeth Figura 2024-12-09  1056  	int ret;
e48f54281af61c1 Elizabeth Figura 2024-12-09  1057  
e48f54281af61c1 Elizabeth Figura 2024-12-09  1058  	if (copy_from_user(&args, argp, sizeof(args)))
e48f54281af61c1 Elizabeth Figura 2024-12-09  1059  		return -EFAULT;
e48f54281af61c1 Elizabeth Figura 2024-12-09  1060  
e48f54281af61c1 Elizabeth Figura 2024-12-09  1061  	ret = setup_wait(dev, &args, true, &q);
e48f54281af61c1 Elizabeth Figura 2024-12-09  1062  	if (ret < 0)
e48f54281af61c1 Elizabeth Figura 2024-12-09  1063  		return ret;
e48f54281af61c1 Elizabeth Figura 2024-12-09  1064  
e48f54281af61c1 Elizabeth Figura 2024-12-09  1065  	/* queue ourselves */
e48f54281af61c1 Elizabeth Figura 2024-12-09  1066  
e48f54281af61c1 Elizabeth Figura 2024-12-09  1067  	mutex_lock(&dev->wait_all_lock);
e48f54281af61c1 Elizabeth Figura 2024-12-09  1068  
e48f54281af61c1 Elizabeth Figura 2024-12-09  1069  	for (i = 0; i < args.count; i++) {
e48f54281af61c1 Elizabeth Figura 2024-12-09  1070  		struct ntsync_q_entry *entry = &q->entries[i];
e48f54281af61c1 Elizabeth Figura 2024-12-09  1071  		struct ntsync_obj *obj = entry->obj;
e48f54281af61c1 Elizabeth Figura 2024-12-09  1072  
e48f54281af61c1 Elizabeth Figura 2024-12-09  1073  		atomic_inc(&obj->all_hint);
e48f54281af61c1 Elizabeth Figura 2024-12-09  1074  
e48f54281af61c1 Elizabeth Figura 2024-12-09  1075  		/*
e48f54281af61c1 Elizabeth Figura 2024-12-09  1076  		 * obj->all_waiters is protected by dev->wait_all_lock rather
e48f54281af61c1 Elizabeth Figura 2024-12-09  1077  		 * than obj->lock, so there is no need to acquire obj->lock
e48f54281af61c1 Elizabeth Figura 2024-12-09  1078  		 * here.
e48f54281af61c1 Elizabeth Figura 2024-12-09  1079  		 */
e48f54281af61c1 Elizabeth Figura 2024-12-09  1080  		list_add_tail(&entry->node, &obj->all_waiters);
e48f54281af61c1 Elizabeth Figura 2024-12-09  1081  	}
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1082  	if (args.alert) {
24ce2f869ab8577 Elizabeth Figura 2024-12-09 @1083  		struct ntsync_q_entry *entry = &q->entries[args.count];
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1084  		struct ntsync_obj *obj = entry->obj;
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1085  
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1086  		dev_lock_obj(dev, obj);
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1087  		list_add_tail(&entry->node, &obj->any_waiters);
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1088  		dev_unlock_obj(dev, obj);
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1089  	}
e48f54281af61c1 Elizabeth Figura 2024-12-09  1090  
e48f54281af61c1 Elizabeth Figura 2024-12-09  1091  	/* check if we are already signaled */
e48f54281af61c1 Elizabeth Figura 2024-12-09  1092  
e48f54281af61c1 Elizabeth Figura 2024-12-09  1093  	try_wake_all(dev, q, NULL);
e48f54281af61c1 Elizabeth Figura 2024-12-09  1094  
e48f54281af61c1 Elizabeth Figura 2024-12-09  1095  	mutex_unlock(&dev->wait_all_lock);
e48f54281af61c1 Elizabeth Figura 2024-12-09  1096  
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1097  	/*
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1098  	 * Check if the alert event is signaled, making sure to do so only
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1099  	 * after checking if the other objects are signaled.
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1100  	 */
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1101  
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1102  	if (args.alert) {
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1103  		struct ntsync_obj *obj = q->entries[args.count].obj;
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1104  
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1105  		if (atomic_read(&q->signaled) == -1) {
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1106  			bool all = ntsync_lock_obj(dev, obj);
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1107  			try_wake_any_obj(obj);
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1108  			ntsync_unlock_obj(dev, obj, all);
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1109  		}
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1110  	}
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1111  
e48f54281af61c1 Elizabeth Figura 2024-12-09  1112  	/* sleep */
e48f54281af61c1 Elizabeth Figura 2024-12-09  1113  
e48f54281af61c1 Elizabeth Figura 2024-12-09  1114  	ret = ntsync_schedule(q, &args);
e48f54281af61c1 Elizabeth Figura 2024-12-09  1115  
e48f54281af61c1 Elizabeth Figura 2024-12-09  1116  	/* and finally, unqueue */
e48f54281af61c1 Elizabeth Figura 2024-12-09  1117  
e48f54281af61c1 Elizabeth Figura 2024-12-09  1118  	mutex_lock(&dev->wait_all_lock);
e48f54281af61c1 Elizabeth Figura 2024-12-09  1119  
e48f54281af61c1 Elizabeth Figura 2024-12-09  1120  	for (i = 0; i < args.count; i++) {
e48f54281af61c1 Elizabeth Figura 2024-12-09  1121  		struct ntsync_q_entry *entry = &q->entries[i];
e48f54281af61c1 Elizabeth Figura 2024-12-09  1122  		struct ntsync_obj *obj = entry->obj;
e48f54281af61c1 Elizabeth Figura 2024-12-09  1123  
e48f54281af61c1 Elizabeth Figura 2024-12-09  1124  		/*
e48f54281af61c1 Elizabeth Figura 2024-12-09  1125  		 * obj->all_waiters is protected by dev->wait_all_lock rather
e48f54281af61c1 Elizabeth Figura 2024-12-09  1126  		 * than obj->lock, so there is no need to acquire it here.
e48f54281af61c1 Elizabeth Figura 2024-12-09  1127  		 */
e48f54281af61c1 Elizabeth Figura 2024-12-09  1128  		list_del(&entry->node);
e48f54281af61c1 Elizabeth Figura 2024-12-09  1129  
e48f54281af61c1 Elizabeth Figura 2024-12-09  1130  		atomic_dec(&obj->all_hint);
266531700b4e125 Elizabeth Figura 2024-12-09  1131  
266531700b4e125 Elizabeth Figura 2024-12-09  1132  		put_obj(obj);
266531700b4e125 Elizabeth Figura 2024-12-09  1133  	}
266531700b4e125 Elizabeth Figura 2024-12-09  1134  
e48f54281af61c1 Elizabeth Figura 2024-12-09  1135  	mutex_unlock(&dev->wait_all_lock);
e48f54281af61c1 Elizabeth Figura 2024-12-09  1136  
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1137  	if (args.alert) {
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1138  		struct ntsync_q_entry *entry = &q->entries[args.count];
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1139  		struct ntsync_obj *obj = entry->obj;
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1140  		bool all;
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1141  
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1142  		all = ntsync_lock_obj(dev, obj);
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1143  		list_del(&entry->node);
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1144  		ntsync_unlock_obj(dev, obj, all);
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1145  
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1146  		put_obj(obj);
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1147  	}
24ce2f869ab8577 Elizabeth Figura 2024-12-09  1148  
266531700b4e125 Elizabeth Figura 2024-12-09  1149  	signaled = atomic_read(&q->signaled);
266531700b4e125 Elizabeth Figura 2024-12-09  1150  	if (signaled != -1) {
266531700b4e125 Elizabeth Figura 2024-12-09  1151  		struct ntsync_wait_args __user *user_args = argp;
266531700b4e125 Elizabeth Figura 2024-12-09  1152  
266531700b4e125 Elizabeth Figura 2024-12-09  1153  		/* even if we caught a signal, we need to communicate success */
8492d88b692b51d Elizabeth Figura 2024-12-09  1154  		ret = q->ownerdead ? -EOWNERDEAD : 0;
266531700b4e125 Elizabeth Figura 2024-12-09  1155  
266531700b4e125 Elizabeth Figura 2024-12-09  1156  		if (put_user(signaled, &user_args->index))
266531700b4e125 Elizabeth Figura 2024-12-09  1157  			ret = -EFAULT;
266531700b4e125 Elizabeth Figura 2024-12-09  1158  	} else if (!ret) {
266531700b4e125 Elizabeth Figura 2024-12-09  1159  		ret = -ETIMEDOUT;
266531700b4e125 Elizabeth Figura 2024-12-09  1160  	}
266531700b4e125 Elizabeth Figura 2024-12-09  1161  
266531700b4e125 Elizabeth Figura 2024-12-09  1162  	kfree(q);
266531700b4e125 Elizabeth Figura 2024-12-09  1163  	return ret;
266531700b4e125 Elizabeth Figura 2024-12-09  1164  }
266531700b4e125 Elizabeth Figura 2024-12-09  1165  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
