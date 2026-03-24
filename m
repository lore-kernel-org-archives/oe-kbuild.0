Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68080283FEA
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Mar 2026 05:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774329306; cv=none; b=IjDTwTnANa26fOAY4S+ci6VLM2G236RENgHZZRCBR37hs2a9UihNiFufB2CISy+skUxJPERxUOB092AHu86v5Dy9qEbREAyatLtXB1KxN37TP/9z4+xwNItdveTO/QBROw8t5nJ+4Au+5anfMZb9Q2FrIwaTrj+02oeZkX0QV7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774329306; c=relaxed/simple;
	bh=Kvv69rxlrrJZWI5WxOo5dpAFLry/54YdWE2YM0I1sg0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EMoPY96gG7M97nBE5L2zpuA35NMivjGct+DF4sG6oRHZL3XQf1Fyg/II2/RqzEkCKJ/or3TXQrB4qsiqsKqbOvBVGgyvh2pkF0dVek8dJgm0zOLvnOJ158Lpyooq4i+ARbdY0re/mjBwX5dAIZjlN16yGEMObaIEeFhEOGzuiiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UR9nuNxq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UR9nuNxq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774329305; x=1805865305;
  h=date:from:to:cc:subject:message-id;
  bh=Kvv69rxlrrJZWI5WxOo5dpAFLry/54YdWE2YM0I1sg0=;
  b=UR9nuNxqw08DOqmA+OvMl1xzbphIFjJobLRTxb37KgZSwIrGZkVqATOd
   8rEHuolGQntjZ1nvRygo8wxQI/6GJdEMiCmPe0IpavRJeANrzF4YS7i8c
   41Yk1QBnnaGugU58+xlWg0YnjyfAnH96UuhsdWV/o95W1koBBt7U1wLLJ
   3JCDL+AhD5o5lvv6AgYH9sjby1RONg+cj5Q1iUtjXU0Q1H9/JS57y2lFZ
   AM4FaelIdp0MO6m7+sh6DPldgOTUNcjHfw079KUixGirMOtviJXOVp639
   UyJ36FYknGllW5cV3K89Co8G3WG9lArbL3N19TU5UvSIi4yGpYychCLIb
   A==;
X-CSE-ConnectionGUID: IxrsRs/2RbqsRwkNXyuF3A==
X-CSE-MsgGUID: HE1HX447Tu2GYi+Kj06KVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75531363"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75531363"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 22:15:03 -0700
X-CSE-ConnectionGUID: GUqk5eHBQA2OLJYBqeyuqw==
X-CSE-MsgGUID: MzePpSKzQSiy43YfSoKcCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="228994439"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Mar 2026 22:15:00 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4u6U-000000003sz-0zqn;
	Tue, 24 Mar 2026 05:14:58 +0000
Date: Tue, 24 Mar 2026 13:14:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/stratix10-svc.c:1119
 stratix10_svc_add_async_client() error: Calling ida_alloc_max() with a 'max'
 argument which is a power of 2. -1 missing?
Message-ID: <202603241328.naBWhr1K-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mahesh Rao <mahesh.rao@altera.com>
CC: Dinh Nguyen <dinguyen@kernel.org>
CC: Matthew Gerlach <matthew.gerlach@altera.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: bcb9f4f0706147afc62c48533276a18fe7b8f354 firmware: stratix10-svc: Add support for async communication
date:   4 months ago
:::::: branch date: 31 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-r072-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241328.naBWhr1K-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603241328.naBWhr1K-lkp@intel.com/

New smatch warnings:
drivers/firmware/stratix10-svc.c:1119 stratix10_svc_add_async_client() error: Calling ida_alloc_max() with a 'max' argument which is a power of 2. -1 missing?
drivers/firmware/stratix10-svc.c:1256 stratix10_svc_async_send() error: Calling ida_alloc_max() with a 'max' argument which is a power of 2. -1 missing?
drivers/firmware/stratix10-svc.c:1493 stratix10_svc_async_init() warn: always true condition '(res.a2 >= 0) => (0-u64max >= 0)'

Old smatch warnings:
drivers/firmware/stratix10-svc.c:1302 stratix10_svc_async_send() warn: inconsistent indenting
drivers/firmware/stratix10-svc.c:1630 stratix10_svc_send() warn: inconsistent indenting

vim +/max +1119 drivers/firmware/stratix10-svc.c

7ca5ce896524f52 Richard Gong 2018-11-13  1062  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1063  /**
bcb9f4f0706147a Mahesh Rao   2025-10-27  1064   * stratix10_svc_add_async_client - Add an asynchronous client to the
bcb9f4f0706147a Mahesh Rao   2025-10-27  1065   * Stratix10 service channel.
bcb9f4f0706147a Mahesh Rao   2025-10-27  1066   * @chan: Pointer to the Stratix10 service channel structure.
bcb9f4f0706147a Mahesh Rao   2025-10-27  1067   * @use_unique_clientid: Boolean flag indicating whether to use a
bcb9f4f0706147a Mahesh Rao   2025-10-27  1068   * unique client ID.
bcb9f4f0706147a Mahesh Rao   2025-10-27  1069   *
bcb9f4f0706147a Mahesh Rao   2025-10-27  1070   * This function adds an asynchronous client to the specified
bcb9f4f0706147a Mahesh Rao   2025-10-27  1071   * Stratix10 service channel. If the `use_unique_clientid` flag is
bcb9f4f0706147a Mahesh Rao   2025-10-27  1072   * set to true, a unique client ID is allocated for the asynchronous
bcb9f4f0706147a Mahesh Rao   2025-10-27  1073   * channel. Otherwise, a common asynchronous channel is used.
bcb9f4f0706147a Mahesh Rao   2025-10-27  1074   *
bcb9f4f0706147a Mahesh Rao   2025-10-27  1075   * Return: 0 on success, or a negative error code on failure:
bcb9f4f0706147a Mahesh Rao   2025-10-27  1076   *         -EINVAL if the channel is NULL or the async controller is
bcb9f4f0706147a Mahesh Rao   2025-10-27  1077   *         not initialized.
bcb9f4f0706147a Mahesh Rao   2025-10-27  1078   *         -EALREADY if the async channel is already allocated.
bcb9f4f0706147a Mahesh Rao   2025-10-27  1079   *         -ENOMEM if memory allocation fails.
bcb9f4f0706147a Mahesh Rao   2025-10-27  1080   *         Other negative values if ID allocation fails.
bcb9f4f0706147a Mahesh Rao   2025-10-27  1081   */
bcb9f4f0706147a Mahesh Rao   2025-10-27  1082  int stratix10_svc_add_async_client(struct stratix10_svc_chan *chan,
bcb9f4f0706147a Mahesh Rao   2025-10-27  1083  				   bool use_unique_clientid)
bcb9f4f0706147a Mahesh Rao   2025-10-27  1084  {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1085  	struct stratix10_svc_controller *ctrl;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1086  	struct stratix10_async_ctrl *actrl;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1087  	struct stratix10_async_chan *achan;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1088  	int ret = 0;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1089  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1090  	if (!chan)
bcb9f4f0706147a Mahesh Rao   2025-10-27  1091  		return -EINVAL;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1092  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1093  	ctrl = chan->ctrl;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1094  	actrl = &ctrl->actrl;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1095  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1096  	if (!actrl->initialized) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1097  		dev_err(ctrl->dev, "Async controller not initialized\n");
bcb9f4f0706147a Mahesh Rao   2025-10-27  1098  		return -EINVAL;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1099  	}
bcb9f4f0706147a Mahesh Rao   2025-10-27  1100  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1101  	if (chan->async_chan) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1102  		dev_err(ctrl->dev, "async channel already allocated\n");
bcb9f4f0706147a Mahesh Rao   2025-10-27  1103  		return -EALREADY;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1104  	}
bcb9f4f0706147a Mahesh Rao   2025-10-27  1105  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1106  	if (use_unique_clientid &&
bcb9f4f0706147a Mahesh Rao   2025-10-27  1107  	    atomic_read(&actrl->common_achan_refcount) > 0) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1108  		chan->async_chan = actrl->common_async_chan;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1109  		atomic_inc(&actrl->common_achan_refcount);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1110  		return 0;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1111  	}
bcb9f4f0706147a Mahesh Rao   2025-10-27  1112  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1113  	achan = kzalloc(sizeof(*achan), GFP_KERNEL);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1114  	if (!achan)
bcb9f4f0706147a Mahesh Rao   2025-10-27  1115  		return -ENOMEM;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1116  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1117  	ida_init(&achan->job_id_pool);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1118  
bcb9f4f0706147a Mahesh Rao   2025-10-27 @1119  	ret = ida_alloc_max(&actrl->async_id_pool, MAX_SDM_CLIENT_IDS,
bcb9f4f0706147a Mahesh Rao   2025-10-27  1120  			    GFP_KERNEL);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1121  	if (ret < 0) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1122  		dev_err(ctrl->dev,
bcb9f4f0706147a Mahesh Rao   2025-10-27  1123  			"Failed to allocate async client id\n");
bcb9f4f0706147a Mahesh Rao   2025-10-27  1124  		ida_destroy(&achan->job_id_pool);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1125  		kfree(achan);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1126  		return ret;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1127  	}
bcb9f4f0706147a Mahesh Rao   2025-10-27  1128  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1129  	achan->async_client_id = ret;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1130  	chan->async_chan = achan;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1131  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1132  	if (use_unique_clientid &&
bcb9f4f0706147a Mahesh Rao   2025-10-27  1133  	    atomic_read(&actrl->common_achan_refcount) == 0) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1134  		actrl->common_async_chan = achan;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1135  		atomic_inc(&actrl->common_achan_refcount);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1136  	}
bcb9f4f0706147a Mahesh Rao   2025-10-27  1137  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1138  	return 0;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1139  }
bcb9f4f0706147a Mahesh Rao   2025-10-27  1140  EXPORT_SYMBOL_GPL(stratix10_svc_add_async_client);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1141  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1142  /**
bcb9f4f0706147a Mahesh Rao   2025-10-27  1143   * stratix10_svc_remove_async_client - Remove an asynchronous client
bcb9f4f0706147a Mahesh Rao   2025-10-27  1144   *                                     from the Stratix10 service
bcb9f4f0706147a Mahesh Rao   2025-10-27  1145   *                                     channel.
bcb9f4f0706147a Mahesh Rao   2025-10-27  1146   * @chan: Pointer to the Stratix10 service channel structure.
bcb9f4f0706147a Mahesh Rao   2025-10-27  1147   *
bcb9f4f0706147a Mahesh Rao   2025-10-27  1148   * This function removes an asynchronous client associated with the
bcb9f4f0706147a Mahesh Rao   2025-10-27  1149   * given service channel. It checks if the channel and the
bcb9f4f0706147a Mahesh Rao   2025-10-27  1150   * asynchronous channel are valid, and then proceeds to decrement
bcb9f4f0706147a Mahesh Rao   2025-10-27  1151   * the reference count for the common asynchronous channel if
bcb9f4f0706147a Mahesh Rao   2025-10-27  1152   * applicable. If the reference count reaches zero, it destroys the
bcb9f4f0706147a Mahesh Rao   2025-10-27  1153   * job ID pool and deallocates the asynchronous client ID. For
bcb9f4f0706147a Mahesh Rao   2025-10-27  1154   * non-common asynchronous channels, it directly destroys the job ID
bcb9f4f0706147a Mahesh Rao   2025-10-27  1155   * pool, deallocates the asynchronous client ID, and frees the
bcb9f4f0706147a Mahesh Rao   2025-10-27  1156   * memory allocated for the asynchronous channel.
bcb9f4f0706147a Mahesh Rao   2025-10-27  1157   *
bcb9f4f0706147a Mahesh Rao   2025-10-27  1158   * Return: 0 on success, -EINVAL if the channel or asynchronous
bcb9f4f0706147a Mahesh Rao   2025-10-27  1159   *         channel is invalid.
bcb9f4f0706147a Mahesh Rao   2025-10-27  1160   */
bcb9f4f0706147a Mahesh Rao   2025-10-27  1161  int stratix10_svc_remove_async_client(struct stratix10_svc_chan *chan)
bcb9f4f0706147a Mahesh Rao   2025-10-27  1162  {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1163  	struct stratix10_svc_controller *ctrl;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1164  	struct stratix10_async_ctrl *actrl;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1165  	struct stratix10_async_chan *achan;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1166  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1167  	if (!chan)
bcb9f4f0706147a Mahesh Rao   2025-10-27  1168  		return -EINVAL;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1169  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1170  	ctrl = chan->ctrl;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1171  	actrl = &ctrl->actrl;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1172  	achan = chan->async_chan;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1173  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1174  	if (!achan) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1175  		dev_err(ctrl->dev, "async channel not allocated\n");
bcb9f4f0706147a Mahesh Rao   2025-10-27  1176  		return -EINVAL;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1177  	}
bcb9f4f0706147a Mahesh Rao   2025-10-27  1178  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1179  	if (achan == actrl->common_async_chan) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1180  		atomic_dec(&actrl->common_achan_refcount);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1181  		if (atomic_read(&actrl->common_achan_refcount) == 0) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1182  			ida_destroy(&achan->job_id_pool);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1183  			ida_free(&actrl->async_id_pool,
bcb9f4f0706147a Mahesh Rao   2025-10-27  1184  				 achan->async_client_id);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1185  			kfree(achan);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1186  			actrl->common_async_chan = NULL;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1187  		}
bcb9f4f0706147a Mahesh Rao   2025-10-27  1188  	} else {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1189  		ida_destroy(&achan->job_id_pool);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1190  		ida_free(&actrl->async_id_pool, achan->async_client_id);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1191  		kfree(achan);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1192  	}
bcb9f4f0706147a Mahesh Rao   2025-10-27  1193  	chan->async_chan = NULL;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1194  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1195  	return 0;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1196  }
bcb9f4f0706147a Mahesh Rao   2025-10-27  1197  EXPORT_SYMBOL_GPL(stratix10_svc_remove_async_client);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1198  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1199  /**
bcb9f4f0706147a Mahesh Rao   2025-10-27  1200   * stratix10_svc_async_send - Send an asynchronous message to the
bcb9f4f0706147a Mahesh Rao   2025-10-27  1201   *                            Stratix10 service
bcb9f4f0706147a Mahesh Rao   2025-10-27  1202   * @chan: Pointer to the service channel structure
bcb9f4f0706147a Mahesh Rao   2025-10-27  1203   * @msg: Pointer to the message to be sent
bcb9f4f0706147a Mahesh Rao   2025-10-27  1204   * @handler: Pointer to the handler for the asynchronous message
bcb9f4f0706147a Mahesh Rao   2025-10-27  1205   *           used by caller for later reference.
bcb9f4f0706147a Mahesh Rao   2025-10-27  1206   * @cb: Callback function to be called upon completion
bcb9f4f0706147a Mahesh Rao   2025-10-27  1207   * @cb_arg: Argument to be passed to the callback function
bcb9f4f0706147a Mahesh Rao   2025-10-27  1208   *
bcb9f4f0706147a Mahesh Rao   2025-10-27  1209   * This function sends an asynchronous message to the SDM mailbox in
bcb9f4f0706147a Mahesh Rao   2025-10-27  1210   * EL3 secure firmware. It performs various checks and setups,
bcb9f4f0706147a Mahesh Rao   2025-10-27  1211   * including allocating a job ID, setting up the transaction ID and
bcb9f4f0706147a Mahesh Rao   2025-10-27  1212   * packaging it to El3 firmware. The function handles different
bcb9f4f0706147a Mahesh Rao   2025-10-27  1213   * commands by setting up the appropriate arguments for the SMC call.
bcb9f4f0706147a Mahesh Rao   2025-10-27  1214   * If the SMC call is successful, the handler is set up and the
bcb9f4f0706147a Mahesh Rao   2025-10-27  1215   * function returns 0. If the SMC call fails, appropriate error
bcb9f4f0706147a Mahesh Rao   2025-10-27  1216   * handling is performed along with cleanup of resources.
bcb9f4f0706147a Mahesh Rao   2025-10-27  1217   *
bcb9f4f0706147a Mahesh Rao   2025-10-27  1218   * Return: 0 on success, -EINVAL for invalid argument, -ENOMEM if
bcb9f4f0706147a Mahesh Rao   2025-10-27  1219   * memory is not available, -EAGAIN if EL3 firmware is busy, -EBADF
bcb9f4f0706147a Mahesh Rao   2025-10-27  1220   * if the message is rejected by EL3 firmware and -EIO on other
bcb9f4f0706147a Mahesh Rao   2025-10-27  1221   * errors from EL3 firmware.
bcb9f4f0706147a Mahesh Rao   2025-10-27  1222   */
bcb9f4f0706147a Mahesh Rao   2025-10-27  1223  int stratix10_svc_async_send(struct stratix10_svc_chan *chan, void *msg,
bcb9f4f0706147a Mahesh Rao   2025-10-27  1224  			     void **handler, async_callback_t cb, void *cb_arg)
bcb9f4f0706147a Mahesh Rao   2025-10-27  1225  {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1226  	struct arm_smccc_1_2_regs args = { 0 }, res = { 0 };
bcb9f4f0706147a Mahesh Rao   2025-10-27  1227  	struct stratix10_svc_async_handler *handle = NULL;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1228  	struct stratix10_svc_client_msg *p_msg =
bcb9f4f0706147a Mahesh Rao   2025-10-27  1229  		(struct stratix10_svc_client_msg *)msg;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1230  	struct stratix10_svc_controller *ctrl;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1231  	struct stratix10_async_ctrl *actrl;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1232  	struct stratix10_async_chan *achan;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1233  	int ret = 0;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1234  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1235  	if (!chan || !msg || !handler)
bcb9f4f0706147a Mahesh Rao   2025-10-27  1236  		return -EINVAL;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1237  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1238  	achan = chan->async_chan;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1239  	ctrl = chan->ctrl;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1240  	actrl = &ctrl->actrl;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1241  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1242  	if (!actrl->initialized) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1243  		dev_err(ctrl->dev, "Async controller not initialized\n");
bcb9f4f0706147a Mahesh Rao   2025-10-27  1244  		return -EINVAL;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1245  	}
bcb9f4f0706147a Mahesh Rao   2025-10-27  1246  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1247  	if (!achan) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1248  		dev_err(ctrl->dev, "Async channel not allocated\n");
bcb9f4f0706147a Mahesh Rao   2025-10-27  1249  		return -EINVAL;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1250  	}
bcb9f4f0706147a Mahesh Rao   2025-10-27  1251  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1252  	handle = kzalloc(sizeof(*handle), GFP_KERNEL);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1253  	if (!handle)
bcb9f4f0706147a Mahesh Rao   2025-10-27  1254  		return -ENOMEM;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1255  
bcb9f4f0706147a Mahesh Rao   2025-10-27 @1256  	ret = ida_alloc_max(&achan->job_id_pool, MAX_SDM_JOB_IDS,
bcb9f4f0706147a Mahesh Rao   2025-10-27  1257  			    GFP_KERNEL);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1258  	if (ret < 0) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1259  		dev_err(ctrl->dev, "Failed to allocate job id\n");
bcb9f4f0706147a Mahesh Rao   2025-10-27  1260  		kfree(handle);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1261  		return -ENOMEM;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1262  	}
bcb9f4f0706147a Mahesh Rao   2025-10-27  1263  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1264  	handle->transaction_id =
bcb9f4f0706147a Mahesh Rao   2025-10-27  1265  		STRATIX10_SET_TRANSACTIONID(achan->async_client_id, ret);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1266  	handle->cb = cb;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1267  	handle->msg = p_msg;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1268  	handle->cb_arg = cb_arg;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1269  	handle->achan = achan;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1270  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1271  	/*set the transaction jobid in args.a1*/
bcb9f4f0706147a Mahesh Rao   2025-10-27  1272  	args.a1 =
bcb9f4f0706147a Mahesh Rao   2025-10-27  1273  		STRATIX10_SIP_SMC_SET_TRANSACTIONID_X1(handle->transaction_id);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1274  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1275  	switch (p_msg->command) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1276  	default:
bcb9f4f0706147a Mahesh Rao   2025-10-27  1277  		dev_err(ctrl->dev, "Invalid command ,%d\n", p_msg->command);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1278  		ret = -EINVAL;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1279  		goto deallocate_id;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1280  	}
bcb9f4f0706147a Mahesh Rao   2025-10-27  1281  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1282  	/**
bcb9f4f0706147a Mahesh Rao   2025-10-27  1283  	 * There is a chance that during the execution of async_send()
bcb9f4f0706147a Mahesh Rao   2025-10-27  1284  	 * in one core, an interrupt might be received in another core;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1285  	 * to mitigate this we are adding the handle to the DB and then
bcb9f4f0706147a Mahesh Rao   2025-10-27  1286  	 * send the smc call. If the smc call is rejected or busy then
bcb9f4f0706147a Mahesh Rao   2025-10-27  1287  	 * we will deallocate the handle for the client to retry again.
bcb9f4f0706147a Mahesh Rao   2025-10-27  1288  	 */
bcb9f4f0706147a Mahesh Rao   2025-10-27  1289  	scoped_guard(spinlock_bh, &actrl->trx_list_lock) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1290  		hash_add(actrl->trx_list, &handle->next,
bcb9f4f0706147a Mahesh Rao   2025-10-27  1291  			 handle->transaction_id);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1292  	}
bcb9f4f0706147a Mahesh Rao   2025-10-27  1293  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1294  	actrl->invoke_fn(actrl, &args, &res);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1295  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1296  	switch (res.a0) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1297  	case INTEL_SIP_SMC_STATUS_OK:
bcb9f4f0706147a Mahesh Rao   2025-10-27  1298  		dev_dbg(ctrl->dev,
bcb9f4f0706147a Mahesh Rao   2025-10-27  1299  			"Async message sent with transaction_id 0x%02x\n",
bcb9f4f0706147a Mahesh Rao   2025-10-27  1300  			handle->transaction_id);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1301  			*handler = handle;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1302  		return 0;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1303  	case INTEL_SIP_SMC_STATUS_BUSY:
bcb9f4f0706147a Mahesh Rao   2025-10-27  1304  		dev_warn(ctrl->dev, "Mailbox is busy, try after some time\n");
bcb9f4f0706147a Mahesh Rao   2025-10-27  1305  		ret = -EAGAIN;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1306  		break;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1307  	case INTEL_SIP_SMC_STATUS_REJECTED:
bcb9f4f0706147a Mahesh Rao   2025-10-27  1308  		dev_err(ctrl->dev, "Async message rejected\n");
bcb9f4f0706147a Mahesh Rao   2025-10-27  1309  		ret = -EBADF;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1310  		break;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1311  	default:
bcb9f4f0706147a Mahesh Rao   2025-10-27  1312  		dev_err(ctrl->dev,
bcb9f4f0706147a Mahesh Rao   2025-10-27  1313  			"Failed to send async message ,got status as %ld\n",
bcb9f4f0706147a Mahesh Rao   2025-10-27  1314  			res.a0);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1315  		ret = -EIO;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1316  	}
bcb9f4f0706147a Mahesh Rao   2025-10-27  1317  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1318  	scoped_guard(spinlock_bh, &actrl->trx_list_lock) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1319  		hash_del(&handle->next);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1320  	}
bcb9f4f0706147a Mahesh Rao   2025-10-27  1321  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1322  deallocate_id:
bcb9f4f0706147a Mahesh Rao   2025-10-27  1323  	ida_free(&achan->job_id_pool,
bcb9f4f0706147a Mahesh Rao   2025-10-27  1324  		 STRATIX10_GET_JOBID(handle->transaction_id));
bcb9f4f0706147a Mahesh Rao   2025-10-27  1325  	kfree(handle);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1326  	return ret;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1327  }
bcb9f4f0706147a Mahesh Rao   2025-10-27  1328  EXPORT_SYMBOL_GPL(stratix10_svc_async_send);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1329  /**
bcb9f4f0706147a Mahesh Rao   2025-10-27  1330   * stratix10_svc_async_poll - Polls the status of an asynchronous
bcb9f4f0706147a Mahesh Rao   2025-10-27  1331   * transaction.
bcb9f4f0706147a Mahesh Rao   2025-10-27  1332   * @chan: Pointer to the service channel structure.
bcb9f4f0706147a Mahesh Rao   2025-10-27  1333   * @tx_handle: Handle to the transaction being polled.
bcb9f4f0706147a Mahesh Rao   2025-10-27  1334   * @data: Pointer to the callback data structure.
bcb9f4f0706147a Mahesh Rao   2025-10-27  1335   *
bcb9f4f0706147a Mahesh Rao   2025-10-27  1336   * This function polls the status of an asynchronous transaction
bcb9f4f0706147a Mahesh Rao   2025-10-27  1337   * identified by the given transaction handle. It ensures that the
bcb9f4f0706147a Mahesh Rao   2025-10-27  1338   * necessary structures are initialized and valid before proceeding
bcb9f4f0706147a Mahesh Rao   2025-10-27  1339   * with the poll operation. The function sets up the necessary
bcb9f4f0706147a Mahesh Rao   2025-10-27  1340   * arguments for the SMC call, invokes the call, and prepares the
bcb9f4f0706147a Mahesh Rao   2025-10-27  1341   * response data if the call is successful. If the call fails, the
bcb9f4f0706147a Mahesh Rao   2025-10-27  1342   * function returns the error mapped to the SVC status error.
bcb9f4f0706147a Mahesh Rao   2025-10-27  1343   *
bcb9f4f0706147a Mahesh Rao   2025-10-27  1344   * Return: 0 on success, -EINVAL if any input parameter is invalid,
bcb9f4f0706147a Mahesh Rao   2025-10-27  1345   *         -EAGAIN if the transaction is still in progress,
bcb9f4f0706147a Mahesh Rao   2025-10-27  1346   *         -EPERM if the command is invalid, or other negative
bcb9f4f0706147a Mahesh Rao   2025-10-27  1347   *         error codes on failure.
bcb9f4f0706147a Mahesh Rao   2025-10-27  1348   */
bcb9f4f0706147a Mahesh Rao   2025-10-27  1349  int stratix10_svc_async_poll(struct stratix10_svc_chan *chan,
bcb9f4f0706147a Mahesh Rao   2025-10-27  1350  			     void *tx_handle,
bcb9f4f0706147a Mahesh Rao   2025-10-27  1351  			     struct stratix10_svc_cb_data *data)
bcb9f4f0706147a Mahesh Rao   2025-10-27  1352  {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1353  	struct stratix10_svc_async_handler *handle;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1354  	struct arm_smccc_1_2_regs args = { 0 };
bcb9f4f0706147a Mahesh Rao   2025-10-27  1355  	struct stratix10_svc_controller *ctrl;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1356  	struct stratix10_async_ctrl *actrl;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1357  	struct stratix10_async_chan *achan;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1358  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1359  	if (!chan || !tx_handle || !data)
bcb9f4f0706147a Mahesh Rao   2025-10-27  1360  		return -EINVAL;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1361  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1362  	ctrl = chan->ctrl;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1363  	actrl = &ctrl->actrl;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1364  	achan = chan->async_chan;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1365  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1366  	if (!achan) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1367  		dev_err(ctrl->dev, "Async channel not allocated\n");
bcb9f4f0706147a Mahesh Rao   2025-10-27  1368  		return -EINVAL;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1369  	}
bcb9f4f0706147a Mahesh Rao   2025-10-27  1370  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1371  	handle = (struct stratix10_svc_async_handler *)tx_handle;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1372  	scoped_guard(spinlock_bh, &actrl->trx_list_lock) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1373  		if (!hash_hashed(&handle->next)) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1374  			dev_err(ctrl->dev, "Invalid transaction handler");
bcb9f4f0706147a Mahesh Rao   2025-10-27  1375  			return -EINVAL;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1376  		}
bcb9f4f0706147a Mahesh Rao   2025-10-27  1377  	}
bcb9f4f0706147a Mahesh Rao   2025-10-27  1378  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1379  	args.a0 = INTEL_SIP_SMC_ASYNC_POLL;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1380  	args.a1 =
bcb9f4f0706147a Mahesh Rao   2025-10-27  1381  		STRATIX10_SIP_SMC_SET_TRANSACTIONID_X1(handle->transaction_id);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1382  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1383  	actrl->invoke_fn(actrl, &args, &handle->res);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1384  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1385  	/*clear data for response*/
bcb9f4f0706147a Mahesh Rao   2025-10-27  1386  	memset(data, 0, sizeof(*data));
bcb9f4f0706147a Mahesh Rao   2025-10-27  1387  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1388  	if (handle->res.a0 == INTEL_SIP_SMC_STATUS_OK) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1389  		return 0;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1390  	} else if (handle->res.a0 == INTEL_SIP_SMC_STATUS_BUSY) {
bcb9f4f0706147a Mahesh Rao   2025-10-27  1391  		dev_dbg(ctrl->dev, "async message is still in progress\n");
bcb9f4f0706147a Mahesh Rao   2025-10-27  1392  		return -EAGAIN;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1393  	}
bcb9f4f0706147a Mahesh Rao   2025-10-27  1394  
bcb9f4f0706147a Mahesh Rao   2025-10-27  1395  	dev_err(ctrl->dev,
bcb9f4f0706147a Mahesh Rao   2025-10-27  1396  		"Failed to poll async message ,got status as %ld\n",
bcb9f4f0706147a Mahesh Rao   2025-10-27  1397  		handle->res.a0);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1398  	return -EINVAL;
bcb9f4f0706147a Mahesh Rao   2025-10-27  1399  }
bcb9f4f0706147a Mahesh Rao   2025-10-27  1400  EXPORT_SYMBOL_GPL(stratix10_svc_async_poll);
bcb9f4f0706147a Mahesh Rao   2025-10-27  1401  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
