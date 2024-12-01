Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A6315A8
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Dec 2024 20:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733084619; cv=none; b=JTfpxZrK8LlzqRF1mUkVtobvKpBIMO1R/TzKf01G7MTX+UcXu1xxSy/X6zbk4N5LI2z/Ea5bvaiVl4NpSw+B1X4fK/wUOThFIZ035z+E+6KtWG4+cqKP26cxvTXBV8irGCrjDWeLPDn3B2pF01DoPSJVuzaoXgDIkTnpYwxvhZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733084619; c=relaxed/simple;
	bh=tqsY60tBOfY8vSgmunumrnEpFsZsEwhJiqE24UgcIXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QlJ08t02hKLpcQzkOE7vENeLiKmHBSnCB3C6KN596ORZl1qmLrcPxUPkZkOHnkEoreBLZLOwn1eVajh/tnLEqqCg3G+GAzGtn8Vfq5ypGsGDqoMVjrwy7DSditQA56xKMwyarJvd8eulTjKsbEXJ7rKD0mhtznXIiOhOiRzj0DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hBTKh9GZ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hBTKh9GZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733084617; x=1764620617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tqsY60tBOfY8vSgmunumrnEpFsZsEwhJiqE24UgcIXo=;
  b=hBTKh9GZ2OpJKdf2PYCIS6zNo5iXt2XNHa7NJjlzYRUCaSPeHI4FfAYo
   yel4hfvphle/408ssxHKDHDmV7EwXj8/um/8T7479+vty7Kyt3SNSePOC
   Kd+w3f26Vz+4pO/v3ZvbU/ZCdvZ/LBclQi8JVTPXvnJFIgINC+oDtcEoO
   R1LvZ6l1s/+zZ9P1TG2mv4S/RJCtXaqqsctbkbSAwGSX6/ulsLUaiTB7C
   AUo0kEYJ9cDoASHcKTNtcPRd6gYw1OT1j+XNrlvBAZjUy/lLhMRBHpgYa
   jZfrc/gcNhTorwI4C2vhtUE+oVhvpTwm/m1c9Iq3OeUosG4EgjfP9bj6C
   A==;
X-CSE-ConnectionGUID: ZoJDsWJ1TdCp+WArzvO5Sg==
X-CSE-MsgGUID: hOOI3t/QS6iAIjjIjEcGuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="44618163"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="44618163"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 12:23:36 -0800
X-CSE-ConnectionGUID: 6PUwtkf5RI+1EtfTjRvxqg==
X-CSE-MsgGUID: zDqM3vA+TCeZbZC1WTIjOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="97002789"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 01 Dec 2024 12:23:35 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHqTc-0001pN-1l;
	Sun, 01 Dec 2024 20:23:32 +0000
Date: Mon, 2 Dec 2024 04:23:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/ethernet/intel/ice/ice_main.c:978:12-13: WARNING
 opportunity for min()
Message-ID: <202412020459.f9HCHXpB-lkp@intel.com>
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
TO: Jacob Keller <jacob.e.keller@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bcc8eda6d34934d80b96adb8dc4ff5dfc632a53a
commit: d69ea414c9b498064d4cd3ebbe2fd4b8298568bc ice: implement device flash update via devlink
date:   4 years, 4 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 4 years, 4 months ago
config: alpha-randconfig-r051-20241117 (https://download.01.org/0day-ci/archive/20241202/202412020459.f9HCHXpB-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412020459.f9HCHXpB-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/ice/ice_main.c:978:12-13: WARNING opportunity for min()

vim +978 drivers/net/ethernet/intel/ice/ice_main.c

d69ea414c9b498 Jacob Keller 2020-07-23  930  
d69ea414c9b498 Jacob Keller 2020-07-23  931  /**
d69ea414c9b498 Jacob Keller 2020-07-23  932   * ice_wait_for_aq_event - Wait for an AdminQ event from firmware
d69ea414c9b498 Jacob Keller 2020-07-23  933   * @pf: pointer to the PF private structure
d69ea414c9b498 Jacob Keller 2020-07-23  934   * @opcode: the opcode to wait for
d69ea414c9b498 Jacob Keller 2020-07-23  935   * @timeout: how long to wait, in jiffies
d69ea414c9b498 Jacob Keller 2020-07-23  936   * @event: storage for the event info
d69ea414c9b498 Jacob Keller 2020-07-23  937   *
d69ea414c9b498 Jacob Keller 2020-07-23  938   * Waits for a specific AdminQ completion event on the ARQ for a given PF. The
d69ea414c9b498 Jacob Keller 2020-07-23  939   * current thread will be put to sleep until the specified event occurs or
d69ea414c9b498 Jacob Keller 2020-07-23  940   * until the given timeout is reached.
d69ea414c9b498 Jacob Keller 2020-07-23  941   *
d69ea414c9b498 Jacob Keller 2020-07-23  942   * To obtain only the descriptor contents, pass an event without an allocated
d69ea414c9b498 Jacob Keller 2020-07-23  943   * msg_buf. If the complete data buffer is desired, allocate the
d69ea414c9b498 Jacob Keller 2020-07-23  944   * event->msg_buf with enough space ahead of time.
d69ea414c9b498 Jacob Keller 2020-07-23  945   *
d69ea414c9b498 Jacob Keller 2020-07-23  946   * Returns: zero on success, or a negative error code on failure.
d69ea414c9b498 Jacob Keller 2020-07-23  947   */
d69ea414c9b498 Jacob Keller 2020-07-23  948  int ice_aq_wait_for_event(struct ice_pf *pf, u16 opcode, unsigned long timeout,
d69ea414c9b498 Jacob Keller 2020-07-23  949  			  struct ice_rq_event_info *event)
d69ea414c9b498 Jacob Keller 2020-07-23  950  {
d69ea414c9b498 Jacob Keller 2020-07-23  951  	struct ice_aq_task *task;
d69ea414c9b498 Jacob Keller 2020-07-23  952  	long ret;
d69ea414c9b498 Jacob Keller 2020-07-23  953  	int err;
d69ea414c9b498 Jacob Keller 2020-07-23  954  
d69ea414c9b498 Jacob Keller 2020-07-23  955  	task = kzalloc(sizeof(*task), GFP_KERNEL);
d69ea414c9b498 Jacob Keller 2020-07-23  956  	if (!task)
d69ea414c9b498 Jacob Keller 2020-07-23  957  		return -ENOMEM;
d69ea414c9b498 Jacob Keller 2020-07-23  958  
d69ea414c9b498 Jacob Keller 2020-07-23  959  	INIT_HLIST_NODE(&task->entry);
d69ea414c9b498 Jacob Keller 2020-07-23  960  	task->opcode = opcode;
d69ea414c9b498 Jacob Keller 2020-07-23  961  	task->event = event;
d69ea414c9b498 Jacob Keller 2020-07-23  962  	task->state = ICE_AQ_TASK_WAITING;
d69ea414c9b498 Jacob Keller 2020-07-23  963  
d69ea414c9b498 Jacob Keller 2020-07-23  964  	spin_lock_bh(&pf->aq_wait_lock);
d69ea414c9b498 Jacob Keller 2020-07-23  965  	hlist_add_head(&task->entry, &pf->aq_wait_list);
d69ea414c9b498 Jacob Keller 2020-07-23  966  	spin_unlock_bh(&pf->aq_wait_lock);
d69ea414c9b498 Jacob Keller 2020-07-23  967  
d69ea414c9b498 Jacob Keller 2020-07-23  968  	ret = wait_event_interruptible_timeout(pf->aq_wait_queue, task->state,
d69ea414c9b498 Jacob Keller 2020-07-23  969  					       timeout);
d69ea414c9b498 Jacob Keller 2020-07-23  970  	switch (task->state) {
d69ea414c9b498 Jacob Keller 2020-07-23  971  	case ICE_AQ_TASK_WAITING:
d69ea414c9b498 Jacob Keller 2020-07-23  972  		err = ret < 0 ? ret : -ETIMEDOUT;
d69ea414c9b498 Jacob Keller 2020-07-23  973  		break;
d69ea414c9b498 Jacob Keller 2020-07-23  974  	case ICE_AQ_TASK_CANCELED:
d69ea414c9b498 Jacob Keller 2020-07-23  975  		err = ret < 0 ? ret : -ECANCELED;
d69ea414c9b498 Jacob Keller 2020-07-23  976  		break;
d69ea414c9b498 Jacob Keller 2020-07-23  977  	case ICE_AQ_TASK_COMPLETE:
d69ea414c9b498 Jacob Keller 2020-07-23 @978  		err = ret < 0 ? ret : 0;
d69ea414c9b498 Jacob Keller 2020-07-23  979  		break;
d69ea414c9b498 Jacob Keller 2020-07-23  980  	default:
d69ea414c9b498 Jacob Keller 2020-07-23  981  		WARN(1, "Unexpected AdminQ wait task state %u", task->state);
d69ea414c9b498 Jacob Keller 2020-07-23  982  		err = -EINVAL;
d69ea414c9b498 Jacob Keller 2020-07-23  983  		break;
d69ea414c9b498 Jacob Keller 2020-07-23  984  	}
d69ea414c9b498 Jacob Keller 2020-07-23  985  
d69ea414c9b498 Jacob Keller 2020-07-23  986  	spin_lock_bh(&pf->aq_wait_lock);
d69ea414c9b498 Jacob Keller 2020-07-23  987  	hlist_del(&task->entry);
d69ea414c9b498 Jacob Keller 2020-07-23  988  	spin_unlock_bh(&pf->aq_wait_lock);
d69ea414c9b498 Jacob Keller 2020-07-23  989  	kfree(task);
d69ea414c9b498 Jacob Keller 2020-07-23  990  
d69ea414c9b498 Jacob Keller 2020-07-23  991  	return err;
d69ea414c9b498 Jacob Keller 2020-07-23  992  }
d69ea414c9b498 Jacob Keller 2020-07-23  993  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
