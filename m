Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8945835E1AF
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Aug 2026 06:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786688870; cv=none; b=bK23KXJLpPDwzGoVbNikN+O6WYrYsGPGKCe2E8S+Sr26dZD5ecJROo/OwqSX0IaihWh74Gxcb1t6CPHpTrxG9aXqO4BwKstnBsEk0Mfoyh8TfHpsLwTKEMwNvJMrMvaPWDjvT2TnCB6C3G6jTvC0FyZMBggoY2q/CSDKBsfpxOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786688870; c=relaxed/simple;
	bh=nlEm56ixFbGxP6+I78Jl/kq9kR+3UQEwfW6/VteuakU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YMqdEfolqomLsOydzxcn8XwIZSl2pdtvW1QMvucCtW/q1br5OpBWhjF8IjC3Wlmt0t4wZOxeN7l4Tly1saSv3a6MtQhqGaf0bNvISCyCQSHCSdvGVIkuKqYdq+N/HFL+Oik+QJn0yPLKiU4aM4ymCEMC5JmTG5zn4SVB/CZul0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G67F/EB/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G67F/EB/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786688868; x=1818224868;
  h=date:from:to:cc:subject:message-id;
  bh=nlEm56ixFbGxP6+I78Jl/kq9kR+3UQEwfW6/VteuakU=;
  b=G67F/EB/3oCg92ly9uQdqvJECeSa2wo7ti05rUhrb5vMp9yQESza0ACU
   9eIDT7hmXKhkqM7BOUpvLOd9I/5I7MFE4y1SB2n2YKCIJszQ0apQKL+Ii
   4juElU/XoaX996WKTBFdQTTTS0jV5udlii2gk/TjKFOg3RYnh+WVEKGaZ
   adUXcZji0q18LUWGa07TsJJJ8O/lRr3SL8eekLS68mqJXK4NnnuCxrMvo
   XPP75/psof/KAQZibkf4vMxpEeuqhJOvfrUCbgoJTXS7T03vqOnsCSd93
   6OWelmvAV2/avKh1BFVV8e/5PAoMxldvqCk35pHHkXgDo0ZX0fvNbg1LP
   g==;
X-CSE-ConnectionGUID: et/U9++ySiG+XnRMcwGmfg==
X-CSE-MsgGUID: c/PQhk2yT0S1cJyCLa/asQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87029739"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87029739"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 23:27:47 -0700
X-CSE-ConnectionGUID: LjGfrplGQKSj1iAAxubsrA==
X-CSE-MsgGUID: PcfIrFkzR2q5Dar0RI1cZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="302382462"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Aug 2026 23:27:46 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wulOJ-00000000Y46-3ACd;
	Fri, 14 Aug 2026 06:27:43 +0000
Date: Fri, 14 Aug 2026 14:26:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/mailbox/bcm74110-mailbox.c:237:8-11: ERROR: invalid
 reference to the index variable of the iterator on line 224
Message-ID: <202608141433.DlAigdDS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Justin Chen <justin.chen@broadcom.com>
CC: Jassi Brar <jassisinghbrar@gmail.com>
CC: Florian Fainelli <florian.fainelli@broadcom.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3d6d817622b0a9721e3cc404df3469171582be13
commit: 52436007b862a90348ac8efc3a89eaceb2234f53 mailbox: Add support for bcm74110
date:   1 year ago
:::::: branch date: 2 days ago
:::::: commit date: 1 year ago
config: powerpc-randconfig-r053-20260812 (https://download.01.org/0day-ci/archive/20260814/202608141433.DlAigdDS-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 12df34b8469b8095359de8c249cb1b2753fadeea)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 52436007b862 ("mailbox: Add support for bcm74110")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202608141433.DlAigdDS-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/mailbox/bcm74110-mailbox.c:237:8-11: ERROR: invalid reference to the index variable of the iterator on line 224

vim +237 drivers/mailbox/bcm74110-mailbox.c

52436007b862a9 Justin Chen 2025-06-02  215  
52436007b862a9 Justin Chen 2025-06-02  216  static int bcm74110_rx_pop_init_msg(struct bcm74110_mbox *mbox, u32 func_type,
52436007b862a9 Justin Chen 2025-06-02  217  				    u32 *val)
52436007b862a9 Justin Chen 2025-06-02  218  {
52436007b862a9 Justin Chen 2025-06-02  219  	struct bcm74110_mbox_msg *msg, *msg_tmp;
52436007b862a9 Justin Chen 2025-06-02  220  	unsigned long flags;
52436007b862a9 Justin Chen 2025-06-02  221  	bool found = false;
52436007b862a9 Justin Chen 2025-06-02  222  
52436007b862a9 Justin Chen 2025-06-02  223  	spin_lock_irqsave(&mbox->rx_svc_list_lock, flags);
52436007b862a9 Justin Chen 2025-06-02 @224  	list_for_each_entry_safe(msg, msg_tmp, &mbox->rx_svc_init_list,
52436007b862a9 Justin Chen 2025-06-02  225  				 list_entry) {
52436007b862a9 Justin Chen 2025-06-02  226  		if (BCM_MSG_GET_FIELD(msg->msg, FUNC) == func_type) {
52436007b862a9 Justin Chen 2025-06-02  227  			list_del(&msg->list_entry);
52436007b862a9 Justin Chen 2025-06-02  228  			found = true;
52436007b862a9 Justin Chen 2025-06-02  229  			break;
52436007b862a9 Justin Chen 2025-06-02  230  		}
52436007b862a9 Justin Chen 2025-06-02  231  	}
52436007b862a9 Justin Chen 2025-06-02  232  	spin_unlock_irqrestore(&mbox->rx_svc_list_lock, flags);
52436007b862a9 Justin Chen 2025-06-02  233  
52436007b862a9 Justin Chen 2025-06-02  234  	if (!found)
52436007b862a9 Justin Chen 2025-06-02  235  		return -EINVAL;
52436007b862a9 Justin Chen 2025-06-02  236  
52436007b862a9 Justin Chen 2025-06-02 @237  	*val = msg->msg;
52436007b862a9 Justin Chen 2025-06-02  238  	kfree(msg);
52436007b862a9 Justin Chen 2025-06-02  239  
52436007b862a9 Justin Chen 2025-06-02  240  	return 0;
52436007b862a9 Justin Chen 2025-06-02  241  }
52436007b862a9 Justin Chen 2025-06-02  242  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
