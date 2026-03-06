Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DE0374748
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Mar 2026 08:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772784194; cv=none; b=IfgGXmgvjcEv1s2XWs+CReBK8/Bc8RmKk9fjQBC0d/J0yL0XS0MC/0J11706DfNg+z+xeo4YbwErKiGclovXQReypkY+fS66wzsbD7ADc4OXENwvPyrn5YXSncOEcMGiYO5q5VMc9j1JlwqV25LUNBa7kQLKDJDJt4og6pp1eng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772784194; c=relaxed/simple;
	bh=IAM7ZcPBJ1tujqnjP4Dy5QMCRUdE30TWoYh7quLMeF8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rWbUlMEVtJ+teqUvoBMuaMudAa2YBPcID5TR/3FbLa2tlA5QtGBtZyaFiFDcht8jZf6+zoylW2kmtbkyOWMVNXa12ISZ7paP59r7Z+S/ocAdpIW0kwDq+feUdB9qEOMVtCIww2UDBaoC2iw4kcjeBZTxAKQt0PdGxg6fZ8VmRA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LWcATgW4; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LWcATgW4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772784192; x=1804320192;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=IAM7ZcPBJ1tujqnjP4Dy5QMCRUdE30TWoYh7quLMeF8=;
  b=LWcATgW4gioyv6MxtjXn3yTgOo5latr0nr/Yeqzw3QcsvQtm/DwJuK1T
   g3ibq8xnZbNMXWN0w0RSvnnM563aPWmBssOuxSzMAe9DKRrA+cSNS+hnk
   DutLhEy54hQbQLGahG49fQTqgzW724tMeE1fBRxtMIbtZHFOAnfavUrgW
   E/P3Bijgbi+0AJ5Q8Xad/SAeuqATvGS2qopcH9/PDRTYVCdaOEK+Ty00P
   Glz+xPW0zCnYFrBHpivGEmJ2Vm1HP+kV7+XludpEkzVZt/9kY0L9diQyX
   VM2sa0pD/xfFEvpSpnCP5i0X4wVH+nbdKoaGTPJRSW7LkphUGkiKGoe9a
   A==;
X-CSE-ConnectionGUID: h//SYDO2RB+kG3r6sIZC/g==
X-CSE-MsgGUID: rXXlXgO4T92alIgmjptiHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73855549"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="73855549"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 00:03:12 -0800
X-CSE-ConnectionGUID: kuXM9Vx3Sv6sr8VlS/9Ygg==
X-CSE-MsgGUID: eYFHMGSGTmK2SY/7cjvXyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="223630594"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Mar 2026 00:03:10 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyQ9M-000000000Y9-06Y5;
	Fri, 06 Mar 2026 08:03:08 +0000
Date: Fri, 6 Mar 2026 16:02:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 14/14] block: Enable lock context analysis for all block
 drivers
Message-ID: <202603061658.H8q89fcs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260304194843.760669-15-bvanassche@acm.org>
References: <20260304194843.760669-15-bvanassche@acm.org>
TO: Bart Van Assche <bvanassche@acm.org>
TO: Jens Axboe <axboe@kernel.dk>
CC: Christoph Hellwig <hch@lst.de>
CC: Damien Le Moal <dlemoal@kernel.org>
CC: Marco Elver <elver@google.com>
CC: linux-block@vger.kernel.org
CC: Bart Van Assche <bvanassche@acm.org>
CC: Justin Sanders <justin@coraid.com>
CC: Philipp Reisner <philipp.reisner@linbit.com>
CC: Lars Ellenberg <lars.ellenberg@linbit.com>
CC: "Christoph Böhmwalder" <christoph.boehmwalder@linbit.com>
CC: "Md. Haris Iqbal" <haris.iqbal@ionos.com>
CC: Jack Wang <jinpu.wang@ionos.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Minchan Kim <minchan@kernel.org>
CC: Sergey Senozhatsky <senozhatsky@chromium.org>

Hi Bart,

kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe/for-next]
[also build test WARNING on bpf-next/net bpf-next/master bpf/master linus/master v7.0-rc2 next-20260305]
[cannot apply to ceph-client/testing ceph-client/for-linus hch-configfs/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bart-Van-Assche/drbd-Balance-RCU-calls-in-drbd_adm_dump_devices/20260305-035510
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/20260304194843.760669-15-bvanassche%40acm.org
patch subject: [PATCH 14/14] block: Enable lock context analysis for all block drivers
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260306/202603061658.H8q89fcs-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061658.H8q89fcs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603061658.H8q89fcs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/block/sunvdc.c:1124:2: warning: releasing spinlock 'port->vio.lock' that was not held [-Wthread-safety-analysis]
    1124 |         spin_unlock_irq(&port->vio.lock);
         |         ^
>> drivers/block/sunvdc.c:1133:1: warning: spinlock 'port->vio.lock' is still held at the end of function [-Wthread-safety-analysis]
    1133 | }
         | ^
   drivers/block/sunvdc.c:1129:2: note: spinlock acquired here
    1129 |         spin_lock_irq(&port->vio.lock);
         |         ^
   2 warnings generated.


vim +1124 drivers/block/sunvdc.c

76e74bbe0a38c67 Dwight Engen      2014-12-11  1113  
76e74bbe0a38c67 Dwight Engen      2014-12-11  1114  static void vdc_queue_drain(struct vdc_port *port)
76e74bbe0a38c67 Dwight Engen      2014-12-11  1115  {
fa182a1fa97dff5 Jens Axboe        2018-10-15  1116  	struct request_queue *q = port->disk->queue;
1e1a9cecfab3f22 Christoph Hellwig 2025-01-31  1117  	unsigned int memflags;
fa182a1fa97dff5 Jens Axboe        2018-10-15  1118  
fa182a1fa97dff5 Jens Axboe        2018-10-15  1119  	/*
fa182a1fa97dff5 Jens Axboe        2018-10-15  1120  	 * Mark the queue as draining, then freeze/quiesce to ensure
fa182a1fa97dff5 Jens Axboe        2018-10-15  1121  	 * that all existing requests are seen in ->queue_rq() and killed
fa182a1fa97dff5 Jens Axboe        2018-10-15  1122  	 */
fa182a1fa97dff5 Jens Axboe        2018-10-15  1123  	port->drain = 1;
fa182a1fa97dff5 Jens Axboe        2018-10-15 @1124  	spin_unlock_irq(&port->vio.lock);
76e74bbe0a38c67 Dwight Engen      2014-12-11  1125  
1e1a9cecfab3f22 Christoph Hellwig 2025-01-31  1126  	memflags = blk_mq_freeze_queue(q);
fa182a1fa97dff5 Jens Axboe        2018-10-15  1127  	blk_mq_quiesce_queue(q);
fa182a1fa97dff5 Jens Axboe        2018-10-15  1128  
fa182a1fa97dff5 Jens Axboe        2018-10-15  1129  	spin_lock_irq(&port->vio.lock);
fa182a1fa97dff5 Jens Axboe        2018-10-15  1130  	port->drain = 0;
64b48ec36dbed56 Stephen Rothwell  2025-02-03  1131  	blk_mq_unquiesce_queue(q);
64b48ec36dbed56 Stephen Rothwell  2025-02-03  1132  	blk_mq_unfreeze_queue(q, memflags);
76e74bbe0a38c67 Dwight Engen      2014-12-11 @1133  }
76e74bbe0a38c67 Dwight Engen      2014-12-11  1134  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
