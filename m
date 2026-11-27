Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807612;
	b=Ut7GW3c2x9+hiYL959GoHr/YnvgcXcDz+hfd3fuVHVrUaJJVXGvLHdteFk1LO2vJFnCs
	 embXZcNx7TFLvVh9iuGWnnnc+jhCLcTpXL78QTOjepcSN+BwGBCjTEixRjBJMTwh0wbeH
	 L9VHNAd3IPWl2rPmA3xfhPepRy0HT9t/W+feJQNQUQsbs0wDMwD1xjHr6t71Fof/id4dE
	 9pO7Yu+SqmdvMl794h5JP+IBVqGWOokWf4phEic39rhJBfiDjzQBq+NjF3PIs2zIixMSr
	 CWV1AQPb/q2feYGdtLNjiK7TqQuGGYVadC+FXiAUROjwzDirBmVx102FV88V7yFMwag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807612;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=+lottc2oQKDDcvkc+Axm/U8kBpF2XUNrC1PAza2OJSM=;
	b=lQy7W9w3fDwDVqWJfGmHqAO6ahyoB3KwtmM7ep3gvhJ7dLWMAK7PMjrARDkzUD+ln4Jy
	 oxGin4jAr6xQBN/VpRnYmsXDqX36KRElCaSJrgvTbVFu+9aumOm4V4kdCE+3/OBn4ZSgg
	 WbKw/ZaND8tgYP0i/VD28ue8vFGJ9Xvp+vSRXJ+1xmpakybeXwvYcLOnbJlRoVS9z7W0z
	 Rg/jOVEg89T6+jXLUWFmcFEgSHHqQ6KbPl9rdR3kaZImGU3JxTar9TA21QNdNmrW1ekfD
	 uKehZlgzCHz8lbDZLXpbsoQxL3Sz0sFrs+/jIDnQ0f4uaiFX/m1UgsyI15yNL9oA47g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k2RZck+p;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513CB606A32D
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Nov 2026 19:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 513CB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k2RZck+p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795807610; x=1827343610;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bYpPHxNREHslivTtn9mYHC38BJgIsICMoFuqvtPKWqM=;
  b=k2RZck+pzbF38H97d3f5BWUGYHTbifguNF/4XHTIhMbFa8E6A8rTI1Pq
   Jvtvz0x+bOXok4+fCTqnjPKhFWVms8vmzkOCbDZEWV0XiTEPUg9443g4J
   p1ptMlD5e8C5TD0GF/z/JBAwvhb+hyexP/CVbFFrMmhH0hQplec/3gfMk
   wBLdl91YVqg9YWJh2BAxhdSknpompKrMqQHA+yQRSxu8WERmITqNou7kN
   6I1i2w9RO/A6JIdMNivSLj/EflWuHToduC7l1hZtClV4DdgSA0byB1IH7
   /a/h2km3q3t6ztkV/sI3Gv1ZUKvHe5+0d4HclhszJtdrdhHcl3nY6wKz8
   w==;
X-CSE-ConnectionGUID: +tYUgA1pQgirAhwsePttiQ==
X-CSE-MsgGUID: S9DWYM7oTSWBCF5Yn4lzWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4629387"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4629387"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 11:26:49 -0800
X-CSE-ConnectionGUID: 0ZCFyAbKQZ2mnLy7h16D0g==
X-CSE-MsgGUID: So93qKtzTYGq/elVzZapvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12742267"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 27 Nov 2026 11:26:48 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xX1ao-000000000Kg-07HO;
	Fri, 27 Nov 2026 19:26:46 +0000
Date: Fri, 27 Nov 2026 20:26:20 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v4 21/21] drbd: remove BROKEN for DRBD
Message-ID: <20261127202012.a0XYgpRR-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261125153511.3060599-22-christoph.boehmwalder@linbit.com>
References: <20261125153511.3060599-22-christoph.boehmwalder@linbit.com>
TO: "Christoph Böhmwalder" <christoph.boehmwalder@linbit.com>
TO: Jens Axboe <axboe@kernel.dk>
CC: drbd-dev@lists.linux.dev
CC: linux-block@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Philipp Reisner <philipp.reisner@linbit.com>
CC: Lars Ellenberg <lars.ellenberg@linbit.com>
CC: "Christoph Böhmwalder" <christoph.boehmwalder@linbit.com>

Hi Christoph,

kernel test robot noticed the following build warnings:

[auto build test WARNING on aa7014f8d7565cfea117eac36a5de0a05eba65a4]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-B-hmwalder/drbd-mark-as-BROKEN-during-DRBD-9-rework/20261125-163451
base:   aa7014f8d7565cfea117eac36a5de0a05eba65a4
patch link:    https://lore.kernel.org/r/20261125153511.3060599-22-christoph.boehmwalder%40linbit.com
patch subject: [PATCH v4 21/21] drbd: remove BROKEN for DRBD
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: alpha-randconfig-r2101-20261127 (https://download.01.org/0day-ci/archive/20261127/20261127202012.a0XYgpRR-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/20261127202012.a0XYgpRR-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/block/drbd/drbd_main.c:6925:2-11: second lock on line 6925
--
>> drivers/block/drbd/drbd_main.c:4621:1-7: preceding lock on line 4519
--
>> drivers/block/drbd/drbd_main.c:4572:22-33: ERROR: invalid reference to the index variable of the iterator on line 4538

vim +6925 drivers/block/drbd/drbd_main.c

b411b3637fa71f Philipp Reisner      2009-09-25  6915  
00ab136fef9ec4 Christoph Böhmwalder 2026-11-25  6916  
28bc3b8c71cda0 Andreas Gruenbacher  2014-08-14  6917  void lock_all_resources(void)
28bc3b8c71cda0 Andreas Gruenbacher  2014-08-14  6918  {
28bc3b8c71cda0 Andreas Gruenbacher  2014-08-14  6919  	struct drbd_resource *resource;
28bc3b8c71cda0 Andreas Gruenbacher  2014-08-14  6920  	int __maybe_unused i = 0;
28bc3b8c71cda0 Andreas Gruenbacher  2014-08-14  6921  
28bc3b8c71cda0 Andreas Gruenbacher  2014-08-14  6922  	mutex_lock(&resources_mutex);
28bc3b8c71cda0 Andreas Gruenbacher  2014-08-14  6923  	local_irq_disable();
28bc3b8c71cda0 Andreas Gruenbacher  2014-08-14  6924  	for_each_resource(resource, &drbd_resources)
00ab136fef9ec4 Christoph Böhmwalder 2026-11-25 @6925  		read_lock(&resource->state_rwlock);
28bc3b8c71cda0 Andreas Gruenbacher  2014-08-14  6926  }
28bc3b8c71cda0 Andreas Gruenbacher  2014-08-14  6927  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
