Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73ED535CC
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Apr 2024 22:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712441456; cv=none; b=Kpz4ATtq+OyiJ462XyLkz/KmpSkuqBHryvi0gl1EFDyZzENcbQe62klFEKUgoWyPinIN54D3cWfgJiftvNViwCYd+wD/GmJVk2sE1KSwcrYu/dl36GoZejabb422J4GLlINO8vvqDGDVQa4ZdMkPEoeTpeb4nlJ2KpfheoMqn/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712441456; c=relaxed/simple;
	bh=nYTwZVxHm5DXr+GF1PH1IDX9kYR49kz4ML25KzaT0CE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WzkVXQ3/4/DCp13Sq08yaoNh46vqvixHfyB4K9O+SJ8c/DXH9vRFsJuRZLtSybcj9Hh4jMh3JR7TIcAa43SFwXrIT3hOBFsd4l2e/MAlY9h+0HhX9yzYRv0EXwQ+9mLdt+mUT6qTutgbsTDHSNdwHIdopLk4E5LTeF74qy1HQVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A5fh6axN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A5fh6axN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712441455; x=1743977455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nYTwZVxHm5DXr+GF1PH1IDX9kYR49kz4ML25KzaT0CE=;
  b=A5fh6axNbYY393vTl4ygSnhADzDU9pxJsZl7/8PPbHEgeezY5ChlCQWM
   Agihlhm2OFgipviMluULCf5emtJdurncWf/SQGBovJguNoWCVhtAI5mOl
   hZT2ZD4TEtDQJZ9FtRRij3f8N/1PyvH0J2BrXW9Y2ctBgN0Oz8o0UFctg
   9jwwrk0HCQ9IYOvO7T2i8qZsnO4eNAc/0OXXxrk5ExFpgFoYYwuRbbjxB
   LjFdKTCUpyLyZkrvqk2jwdMJKAHNGyGly7UP50eJPNoilJSsa7hTTCxoa
   SDzBd+3qV50eKGZTRAU9j39Dz4ikl0gFw5thBGqUH+Jd51kKZDUT+BXlt
   Q==;
X-CSE-ConnectionGUID: HzR03MhrSj+3kCzq2KBw3g==
X-CSE-MsgGUID: dKVWkjdMSc66L5OzaE72uw==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="7586061"
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="7586061"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 15:10:52 -0700
X-CSE-ConnectionGUID: rssTpN35RP2IJyqHJuSvoQ==
X-CSE-MsgGUID: 6jns+umLTnujJmWzSleEJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,184,1708416000"; 
   d="scan'208";a="19353741"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Apr 2024 15:10:50 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtEFM-0003tW-1u;
	Sat, 06 Apr 2024 22:10:48 +0000
Date: Sun, 7 Apr 2024 06:10:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [net-next, RFC PATCH 2/5] netdev-genl: Add netlink framework
 functions for queue-set NAPI
Message-ID: <202404070550.poDa4rSI-lkp@intel.com>
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
In-Reply-To: <171234777883.5075.17163018772262453896.stgit@anambiarhost.jf.intel.com>
References: <171234777883.5075.17163018772262453896.stgit@anambiarhost.jf.intel.com>
TO: Amritha Nambiar <amritha.nambiar@intel.com>

Hi Amritha,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tnguy-next-queue/dev-queue]
[also build test WARNING on tnguy-net-queue/dev-queue linus/master v6.9-rc2 next-20240405]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amritha-Nambiar/netdev-genl-spec-Extend-netdev-netlink-spec-in-YAML-for-queue-set/20240406-040214
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/171234777883.5075.17163018772262453896.stgit%40anambiarhost.jf.intel.com
patch subject: [net-next, RFC PATCH 2/5] netdev-genl: Add netlink framework functions for queue-set NAPI
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: x86_64-randconfig-101-20240407 (https://download.01.org/0day-ci/archive/20240407/202404070550.poDa4rSI-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202404070550.poDa4rSI-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/core/netdev-genl.c:744:26-57: WARNING avoid newline at end of message in GENL_SET_ERR_MSG

vim +744 net/core/netdev-genl.c

129a496664ebbe Amritha Nambiar 2024-04-05  711  
23cdb6fbba4290 Amritha Nambiar 2024-04-05  712  int netdev_nl_queue_set_doit(struct sk_buff *skb, struct genl_info *info)
23cdb6fbba4290 Amritha Nambiar 2024-04-05  713  {
129a496664ebbe Amritha Nambiar 2024-04-05  714  	u32 q_id, q_type, ifindex;
129a496664ebbe Amritha Nambiar 2024-04-05  715  	struct net_device *netdev;
129a496664ebbe Amritha Nambiar 2024-04-05  716  	struct sk_buff *rsp;
129a496664ebbe Amritha Nambiar 2024-04-05  717  	u32 napi_id = 0;
129a496664ebbe Amritha Nambiar 2024-04-05  718  	int err = 0;
129a496664ebbe Amritha Nambiar 2024-04-05  719  
129a496664ebbe Amritha Nambiar 2024-04-05  720  	if (GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_ID) ||
129a496664ebbe Amritha Nambiar 2024-04-05  721  	    GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_TYPE) ||
129a496664ebbe Amritha Nambiar 2024-04-05  722  	    GENL_REQ_ATTR_CHECK(info, NETDEV_A_QUEUE_IFINDEX))
129a496664ebbe Amritha Nambiar 2024-04-05  723  		return -EINVAL;
129a496664ebbe Amritha Nambiar 2024-04-05  724  
129a496664ebbe Amritha Nambiar 2024-04-05  725  	q_id = nla_get_u32(info->attrs[NETDEV_A_QUEUE_ID]);
129a496664ebbe Amritha Nambiar 2024-04-05  726  	q_type = nla_get_u32(info->attrs[NETDEV_A_QUEUE_TYPE]);
129a496664ebbe Amritha Nambiar 2024-04-05  727  	ifindex = nla_get_u32(info->attrs[NETDEV_A_QUEUE_IFINDEX]);
129a496664ebbe Amritha Nambiar 2024-04-05  728  
129a496664ebbe Amritha Nambiar 2024-04-05  729  	if (info->attrs[NETDEV_A_QUEUE_NAPI_ID]) {
129a496664ebbe Amritha Nambiar 2024-04-05  730  		napi_id = nla_get_u32(info->attrs[NETDEV_A_QUEUE_NAPI_ID]);
129a496664ebbe Amritha Nambiar 2024-04-05  731  		if (napi_id < MIN_NAPI_ID)
129a496664ebbe Amritha Nambiar 2024-04-05  732  			return -EINVAL;
129a496664ebbe Amritha Nambiar 2024-04-05  733  	}
129a496664ebbe Amritha Nambiar 2024-04-05  734  
129a496664ebbe Amritha Nambiar 2024-04-05  735  	rsp = genlmsg_new(GENLMSG_DEFAULT_SIZE, GFP_KERNEL);
129a496664ebbe Amritha Nambiar 2024-04-05  736  	if (!rsp)
129a496664ebbe Amritha Nambiar 2024-04-05  737  		return -ENOMEM;
129a496664ebbe Amritha Nambiar 2024-04-05  738  
129a496664ebbe Amritha Nambiar 2024-04-05  739  	rtnl_lock();
129a496664ebbe Amritha Nambiar 2024-04-05  740  
129a496664ebbe Amritha Nambiar 2024-04-05  741  	netdev = __dev_get_by_index(genl_info_net(info), ifindex);
129a496664ebbe Amritha Nambiar 2024-04-05  742  	if (netdev) {
129a496664ebbe Amritha Nambiar 2024-04-05  743  		if (!napi_id)
129a496664ebbe Amritha Nambiar 2024-04-05 @744  			GENL_SET_ERR_MSG(info, "No queue parameters changed\n");
129a496664ebbe Amritha Nambiar 2024-04-05  745  		else
129a496664ebbe Amritha Nambiar 2024-04-05  746  			err = netdev_nl_queue_set_napi(rsp, netdev, q_id,
129a496664ebbe Amritha Nambiar 2024-04-05  747  						       q_type, napi_id, info);
129a496664ebbe Amritha Nambiar 2024-04-05  748  		if (!err)
129a496664ebbe Amritha Nambiar 2024-04-05  749  			err = netdev_nl_queue_fill_one(rsp, netdev, q_id,
129a496664ebbe Amritha Nambiar 2024-04-05  750  						       q_type, info);
129a496664ebbe Amritha Nambiar 2024-04-05  751  	} else {
129a496664ebbe Amritha Nambiar 2024-04-05  752  		err = -ENODEV;
129a496664ebbe Amritha Nambiar 2024-04-05  753  	}
129a496664ebbe Amritha Nambiar 2024-04-05  754  
129a496664ebbe Amritha Nambiar 2024-04-05  755  	rtnl_unlock();
129a496664ebbe Amritha Nambiar 2024-04-05  756  
129a496664ebbe Amritha Nambiar 2024-04-05  757  	if (err)
129a496664ebbe Amritha Nambiar 2024-04-05  758  		goto err_free_msg;
129a496664ebbe Amritha Nambiar 2024-04-05  759  
129a496664ebbe Amritha Nambiar 2024-04-05  760  	return genlmsg_reply(rsp, info);
129a496664ebbe Amritha Nambiar 2024-04-05  761  
129a496664ebbe Amritha Nambiar 2024-04-05  762  err_free_msg:
129a496664ebbe Amritha Nambiar 2024-04-05  763  	nlmsg_free(rsp);
129a496664ebbe Amritha Nambiar 2024-04-05  764  	return err;
23cdb6fbba4290 Amritha Nambiar 2024-04-05  765  }
23cdb6fbba4290 Amritha Nambiar 2024-04-05  766  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
