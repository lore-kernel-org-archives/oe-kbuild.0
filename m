Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8865BAF0
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Jun 2025 02:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750385897; cv=none; b=VG3IKF/bOsQ8RngIUalca71BmH4kAmyCIrowLRPHxuEhL4C9lXzOGi9H/29hgF3pdCQZNm4q2CWDUaOXnrLxVqQwS56gpy5O+DqSmLBAG0iGZXXC45Pyk5mgh5aoT3lPU+ekS6wT6Tt2o59IJWmdHHL04aljuotZBp1MTo38p/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750385897; c=relaxed/simple;
	bh=7JNBRTICgajNKpokAxjIxK0N3LanFwn/WuB4CJaYcBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uKDB79DkUiH6AzRcLWcX2KPY0D6la6YxHo8HEPKeCWe8NUsIlseOJOBMIjoUkUb0ppdCNrNyKKrn1UbHfOxDB/HrS77aqug1a+RTAi75M8Vr1KKKnopVFRU9eaeBrNqed1mrVu5gIKFHYMIUoSxG4iW7yo7pb2hg0zWtZrG33oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FrxEX4oH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FrxEX4oH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750385895; x=1781921895;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7JNBRTICgajNKpokAxjIxK0N3LanFwn/WuB4CJaYcBM=;
  b=FrxEX4oHesSgrfbWmX1t4YKRM967oddcuyNK3nD9wFvfTe2r2F2l81G7
   n7kJKGS5Is5CRwvyz96CeGBPq6QNJDE2ypvJfUY0bFRSMuApLLTukIsyV
   cmUE7WCvoH8vx1Y86eaafHCl/gAWmT0CDpNTDgooXmIXsG4ScktIMCc67
   7Bmhc53z84OZA6InY/SSRKkMS5FZv0hCISI1eyQcyrIf6RTbBktMm+6ir
   52zvBsY/yVzu4Sw4upVee0aiRuPg6C5RK1eyvQAyorgqcxBHcCJGnTHTx
   E/6Pgltc/wShjuqFw6XkT5VY082pPkgUHYuE0qQSnzfXEUX5F+Ny3l/JS
   g==;
X-CSE-ConnectionGUID: N0vwApyCQxm63SJ5OVX14w==
X-CSE-MsgGUID: I7D8StvuQueQkY/N71GmVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="70207018"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="70207018"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 19:18:14 -0700
X-CSE-ConnectionGUID: 7Olig6XwQ1epoZjCbbV2xQ==
X-CSE-MsgGUID: fvc1ORPVRpqZCvwlAuE5Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="151322361"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Jun 2025 19:18:14 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSRKV-000LIM-27;
	Fri, 20 Jun 2025 02:18:11 +0000
Date: Fri, 20 Jun 2025 10:18:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 2/3] media: v4l2-ctrls: Return the handler's error in
 v4l2_ctrl_handler_free()
Message-ID: <202506201045.80WKwL22-lkp@intel.com>
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
In-Reply-To: <20250619095227.1939114-3-sakari.ailus@linux.intel.com>
References: <20250619095227.1939114-3-sakari.ailus@linux.intel.com>
TO: Sakari Ailus <sakari.ailus@linux.intel.com>
TO: linux-media@vger.kernel.org
CC: Hans Verkuil <hverkuil@xs4all.nl>
CC: laurent.pinchart@ideasonboard.com

Hi Sakari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linuxtv-media-pending/master]
[also build test WARNING on sailus-media-tree/master linus/master sailus-media-tree/streams v6.16-rc2 next-20250619]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/media-v4l2-ctrls-Don-t-reset-handler-s-error-in-v4l2_ctrl_handler_free/20250619-175457
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250619095227.1939114-3-sakari.ailus%40linux.intel.com
patch subject: [PATCH v2 2/3] media: v4l2-ctrls: Return the handler's error in v4l2_ctrl_handler_free()
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: i386-randconfig-141-20250620 (https://download.01.org/0day-ci/archive/20250620/202506201045.80WKwL22-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506201045.80WKwL22-lkp@intel.com/

smatch warnings:
drivers/media/v4l2-core/v4l2-ctrls-core.c:1641 v4l2_ctrl_handler_free() error: we previously assumed 'hdl' could be null (see line 1640)

vim +/hdl +1641 drivers/media/v4l2-core/v4l2-ctrls-core.c

71c689dc2e732d Hans Verkuil 2021-04-27  1632  
71c689dc2e732d Hans Verkuil 2021-04-27  1633  /* Free all controls and control refs */
b56f94c6d2dfdd Sakari Ailus 2025-06-19  1634  int v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
71c689dc2e732d Hans Verkuil 2021-04-27  1635  {
71c689dc2e732d Hans Verkuil 2021-04-27  1636  	struct v4l2_ctrl_ref *ref, *next_ref;
71c689dc2e732d Hans Verkuil 2021-04-27  1637  	struct v4l2_ctrl *ctrl, *next_ctrl;
71c689dc2e732d Hans Verkuil 2021-04-27  1638  	struct v4l2_subscribed_event *sev, *next_sev;
71c689dc2e732d Hans Verkuil 2021-04-27  1639  
71c689dc2e732d Hans Verkuil 2021-04-27 @1640  	if (hdl == NULL || hdl->buckets == NULL)
b56f94c6d2dfdd Sakari Ailus 2025-06-19 @1641  		return hdl->error;
71c689dc2e732d Hans Verkuil 2021-04-27  1642  
71c689dc2e732d Hans Verkuil 2021-04-27  1643  	v4l2_ctrl_handler_free_request(hdl);
71c689dc2e732d Hans Verkuil 2021-04-27  1644  
71c689dc2e732d Hans Verkuil 2021-04-27  1645  	mutex_lock(hdl->lock);
71c689dc2e732d Hans Verkuil 2021-04-27  1646  	/* Free all nodes */
71c689dc2e732d Hans Verkuil 2021-04-27  1647  	list_for_each_entry_safe(ref, next_ref, &hdl->ctrl_refs, node) {
71c689dc2e732d Hans Verkuil 2021-04-27  1648  		list_del(&ref->node);
7392d87a9febb5 Hans Verkuil 2022-07-11  1649  		if (ref->p_req_array_alloc_elems)
fb582cba44928f Hans Verkuil 2022-07-08  1650  			kvfree(ref->p_req.p);
71c689dc2e732d Hans Verkuil 2021-04-27  1651  		kfree(ref);
71c689dc2e732d Hans Verkuil 2021-04-27  1652  	}
71c689dc2e732d Hans Verkuil 2021-04-27  1653  	/* Free all controls owned by the handler */
71c689dc2e732d Hans Verkuil 2021-04-27  1654  	list_for_each_entry_safe(ctrl, next_ctrl, &hdl->ctrls, node) {
71c689dc2e732d Hans Verkuil 2021-04-27  1655  		list_del(&ctrl->node);
71c689dc2e732d Hans Verkuil 2021-04-27  1656  		list_for_each_entry_safe(sev, next_sev, &ctrl->ev_subs, node)
71c689dc2e732d Hans Verkuil 2021-04-27  1657  			list_del(&sev->node);
5f2c5c69a61dc5 Hans Verkuil 2022-07-11  1658  		kvfree(ctrl->p_array);
71c689dc2e732d Hans Verkuil 2021-04-27  1659  		kvfree(ctrl);
71c689dc2e732d Hans Verkuil 2021-04-27  1660  	}
71c689dc2e732d Hans Verkuil 2021-04-27  1661  	kvfree(hdl->buckets);
71c689dc2e732d Hans Verkuil 2021-04-27  1662  	hdl->buckets = NULL;
71c689dc2e732d Hans Verkuil 2021-04-27  1663  	hdl->cached = NULL;
71c689dc2e732d Hans Verkuil 2021-04-27  1664  	mutex_unlock(hdl->lock);
71c689dc2e732d Hans Verkuil 2021-04-27  1665  	mutex_destroy(&hdl->_lock);
b56f94c6d2dfdd Sakari Ailus 2025-06-19  1666  
b56f94c6d2dfdd Sakari Ailus 2025-06-19  1667  	return hdl->error;
71c689dc2e732d Hans Verkuil 2021-04-27  1668  }
71c689dc2e732d Hans Verkuil 2021-04-27  1669  EXPORT_SYMBOL(v4l2_ctrl_handler_free);
71c689dc2e732d Hans Verkuil 2021-04-27  1670  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
