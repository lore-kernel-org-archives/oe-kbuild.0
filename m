Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AEE3093D3
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jun 2026 03:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781148432; cv=none; b=CMxUNfAVNvKroXwV1B8Gf1cmhq/yit72Djg6+NdlvL+LwR/VZYrPVI8JQBnlorkvjJKcpo+R0ZjND4g9u+eSIUExU0TZca9931LvUQZHoZt5j7rZ8QSTtXbWKehhbekSlSrmSeVUbpqedZeEXN26TG45wQuv3UAxPTeHB6WhErw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781148432; c=relaxed/simple;
	bh=16YAdpdx0i4UdfqcVReqe6vIxnJAF020ibbuvgwRr34=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tvXFaU7RkFtJBuxiKnXX9RLI3yRBiK9nEz9sjK5aUfPlLoJKufcfC769xgkkS/k1FIdcZOfjL2VWcfk2LDfPUyC/i3GRJ5x26kNZ9obJyxnqwHEXJ6Ah79osE65ZwbWosB8nLjgJnfRX87tKTRJ/4DwSV84hniazyC2gxQE4Cq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Of1NWO+z; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Of1NWO+z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781148430; x=1812684430;
  h=date:from:to:cc:subject:message-id;
  bh=16YAdpdx0i4UdfqcVReqe6vIxnJAF020ibbuvgwRr34=;
  b=Of1NWO+zGU+4mr0+FxEo7ebHaXT/VWQ6HXSXlDcu0MubKjsgd+K/zje2
   X/klqKOs/lq0vmMhrYzu+dbQ5OUQ/buMOmio7CwLrxw4Yxrpco5mywXIH
   rsVK7hiQkuNADSJQBY6CuBcz19CuEjHrojJq6vyGrKniTXYvt48wj5ReF
   N/CcnGVW9RSmnq0xcE/0Av7jDq/1dxRREG/47yAZiglcznCJf4nwawoSG
   UQkigaleFsJQhNG8B1CkuaCVr6ltD0B0jR2Y1NGFhyfoBrzaMo6b6VpDD
   xImD4elpmsU0O5LRofENuoXA/z8KFWIwmmnfNbabvnci33N/PqwL626BQ
   w==;
X-CSE-ConnectionGUID: m5U1y05vQGyYlhYFmp1DJQ==
X-CSE-MsgGUID: 6uwVoAvTQBO0vOTtPh+qDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81090272"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="81090272"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 20:27:10 -0700
X-CSE-ConnectionGUID: Mdh4/4vKSn+wyByhYlKjiA==
X-CSE-MsgGUID: yM6qXtDhT5aooY+ba7Xp0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="243904207"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Jun 2026 20:27:09 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXW4R-00000000MH4-0c4v;
	Thu, 11 Jun 2026 03:27:07 +0000
Date: Thu, 11 Jun 2026 11:26:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kbuild:kbuild-next-unstable 15/32]
 drivers/net/xen-netback/xenbus.c:780:65: warning: '%u' directive output may
 be truncated writing between 1 and 10 bytes into a region of size between 4
 and 19
Message-ID: <202606111107.k8nf2OCl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable
head:   7158c5b67e92e52c2ca9a3617a7e768a84031da1
commit: 7b3281fcb43c5fce8d4d2b0996d3ac719cb5068b [15/32] x86/build: Drop unnecessary '-ffreestanding' addition to KBUILD_CFLAGS
:::::: branch date: 7 hours ago
:::::: commit date: 2 weeks ago
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20260611/202606111107.k8nf2OCl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606111107.k8nf2OCl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606111107.k8nf2OCl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/xen-netback/xenbus.c: In function 'connect':
>> drivers/net/xen-netback/xenbus.c:780:65: warning: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size between 4 and 19 [-Wformat-truncation=]
     780 |                 snprintf(queue->name, sizeof(queue->name), "%s-q%u",
         |                                                                 ^~
   drivers/net/xen-netback/xenbus.c:780:60: note: directive argument in the range [0, 4294967294]
     780 |                 snprintf(queue->name, sizeof(queue->name), "%s-q%u",
         |                                                            ^~~~~~~~
   drivers/net/xen-netback/xenbus.c:780:17: note: 'snprintf' output between 4 and 28 bytes into a destination of size 21
     780 |                 snprintf(queue->name, sizeof(queue->name), "%s-q%u",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     781 |                                 be->vif->dev->name, queue->id);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +780 drivers/net/xen-netback/xenbus.c

4e15ee2cb46fed Paul Durrant         2016-05-13  723  
f942dc2552b8bf Ian Campbell         2011-03-15  724  static void connect(struct backend_info *be)
f942dc2552b8bf Ian Campbell         2011-03-15  725  {
f942dc2552b8bf Ian Campbell         2011-03-15  726  	int err;
f942dc2552b8bf Ian Campbell         2011-03-15  727  	struct xenbus_device *dev = be->dev;
e9ce7cb6b10740 Wei Liu              2014-06-04  728  	unsigned long credit_bytes, credit_usec;
e9ce7cb6b10740 Wei Liu              2014-06-04  729  	unsigned int queue_index;
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  730  	unsigned int requested_num_queues;
e9ce7cb6b10740 Wei Liu              2014-06-04  731  	struct xenvif_queue *queue;
f942dc2552b8bf Ian Campbell         2011-03-15  732  
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  733  	/* Check whether the frontend requested multiple queues
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  734  	 * and read the number requested.
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  735  	 */
f95842e7a9f235 Juergen Gross        2016-10-31  736  	requested_num_queues = xenbus_read_unsigned(dev->otherend,
f95842e7a9f235 Juergen Gross        2016-10-31  737  					"multi-queue-num-queues", 1);
6d1dc8014334c7 Ziyi Guo             2026-02-12  738  	if (requested_num_queues > xenvif_max_queues ||
6d1dc8014334c7 Ziyi Guo             2026-02-12  739  	    requested_num_queues == 0) {
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  740  		/* buggy or malicious guest */
0f06ac3b6616b9 Arnd Bergmann        2016-11-10  741  		xenbus_dev_fatal(dev, -EINVAL,
6d1dc8014334c7 Ziyi Guo             2026-02-12  742  				 "guest requested %u queues, but valid range is 1 - %u.",
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  743  				 requested_num_queues, xenvif_max_queues);
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  744  		return;
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  745  	}
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  746  
f942dc2552b8bf Ian Campbell         2011-03-15  747  	err = xen_net_read_mac(dev, be->vif->fe_dev_addr);
f942dc2552b8bf Ian Campbell         2011-03-15  748  	if (err) {
f942dc2552b8bf Ian Campbell         2011-03-15  749  		xenbus_dev_fatal(dev, err, "parsing %s/mac", dev->nodename);
f942dc2552b8bf Ian Campbell         2011-03-15  750  		return;
f942dc2552b8bf Ian Campbell         2011-03-15  751  	}
f942dc2552b8bf Ian Campbell         2011-03-15  752  
e9ce7cb6b10740 Wei Liu              2014-06-04  753  	xen_net_read_rate(dev, &credit_bytes, &credit_usec);
12b322ac85208d Palik, Imre          2015-06-19  754  	xen_unregister_watchers(be->vif);
edafc132baac4f Palik, Imre          2015-03-19  755  	xen_register_watchers(dev, be->vif);
e9ce7cb6b10740 Wei Liu              2014-06-04  756  	read_xenbus_vif_flags(be);
e9ce7cb6b10740 Wei Liu              2014-06-04  757  
4e15ee2cb46fed Paul Durrant         2016-05-13  758  	err = connect_ctrl_ring(be);
4e15ee2cb46fed Paul Durrant         2016-05-13  759  	if (err) {
4e15ee2cb46fed Paul Durrant         2016-05-13  760  		xenbus_dev_fatal(dev, err, "connecting control ring");
4e15ee2cb46fed Paul Durrant         2016-05-13  761  		return;
4e15ee2cb46fed Paul Durrant         2016-05-13  762  	}
4e15ee2cb46fed Paul Durrant         2016-05-13  763  
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  764  	/* Use the number of queues requested by the frontend */
fad953ce0b22cf Kees Cook            2018-06-12  765  	be->vif->queues = vzalloc(array_size(requested_num_queues,
fad953ce0b22cf Kees Cook            2018-06-12  766  					     sizeof(struct xenvif_queue)));
833b8f18adfcca Insu Yun             2015-10-15  767  	if (!be->vif->queues) {
833b8f18adfcca Insu Yun             2015-10-15  768  		xenbus_dev_fatal(dev, -ENOMEM,
833b8f18adfcca Insu Yun             2015-10-15  769  				 "allocating queues");
833b8f18adfcca Insu Yun             2015-10-15  770  		return;
833b8f18adfcca Insu Yun             2015-10-15  771  	}
833b8f18adfcca Insu Yun             2015-10-15  772  
f7b50c4e7ced70 Wei Liu              2014-06-23  773  	be->vif->num_queues = requested_num_queues;
ecf08d2dbb96d5 David Vrabel         2014-10-22  774  	be->vif->stalled_queues = requested_num_queues;
e9ce7cb6b10740 Wei Liu              2014-06-04  775  
e9ce7cb6b10740 Wei Liu              2014-06-04  776  	for (queue_index = 0; queue_index < requested_num_queues; ++queue_index) {
e9ce7cb6b10740 Wei Liu              2014-06-04  777  		queue = &be->vif->queues[queue_index];
e9ce7cb6b10740 Wei Liu              2014-06-04  778  		queue->vif = be->vif;
e9ce7cb6b10740 Wei Liu              2014-06-04  779  		queue->id = queue_index;
e9ce7cb6b10740 Wei Liu              2014-06-04 @780  		snprintf(queue->name, sizeof(queue->name), "%s-q%u",
e9ce7cb6b10740 Wei Liu              2014-06-04  781  				be->vif->dev->name, queue->id);
e9ce7cb6b10740 Wei Liu              2014-06-04  782  
e9ce7cb6b10740 Wei Liu              2014-06-04  783  		err = xenvif_init_queue(queue);
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  784  		if (err) {
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  785  			/* xenvif_init_queue() cleans up after itself on
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  786  			 * failure, but we need to clean up any previously
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  787  			 * initialised queues. Set num_queues to i so that
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  788  			 * earlier queues can be destroyed using the regular
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  789  			 * disconnect logic.
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  790  			 */
f7b50c4e7ced70 Wei Liu              2014-06-23  791  			be->vif->num_queues = queue_index;
e9ce7cb6b10740 Wei Liu              2014-06-04  792  			goto err;
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  793  		}
e9ce7cb6b10740 Wei Liu              2014-06-04  794  
ce0e5c522d3924 Ross Lagerwall       2015-05-27  795  		queue->credit_bytes = credit_bytes;
e9ce7cb6b10740 Wei Liu              2014-06-04  796  		queue->remaining_credit = credit_bytes;
07ff890daeda31 Palik, Imre          2015-01-06  797  		queue->credit_usec = credit_usec;
e9ce7cb6b10740 Wei Liu              2014-06-04  798  
4e15ee2cb46fed Paul Durrant         2016-05-13  799  		err = connect_data_rings(be, queue);
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  800  		if (err) {
4e15ee2cb46fed Paul Durrant         2016-05-13  801  			/* connect_data_rings() cleans up after itself on
4e15ee2cb46fed Paul Durrant         2016-05-13  802  			 * failure, but we need to clean up after
4e15ee2cb46fed Paul Durrant         2016-05-13  803  			 * xenvif_init_queue() here, and also clean up any
4e15ee2cb46fed Paul Durrant         2016-05-13  804  			 * previously initialised queues.
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  805  			 */
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  806  			xenvif_deinit_queue(queue);
f7b50c4e7ced70 Wei Liu              2014-06-23  807  			be->vif->num_queues = queue_index;
e9ce7cb6b10740 Wei Liu              2014-06-04  808  			goto err;
e9ce7cb6b10740 Wei Liu              2014-06-04  809  		}
628fa76b09d7b0 Wei Liu              2014-08-12  810  	}
628fa76b09d7b0 Wei Liu              2014-08-12  811  

:::::: The code at line 780 was first introduced by commit
:::::: e9ce7cb6b107407e4798e8905b18ad8b642766f6 xen-netback: Factor queue-specific data into queue struct

:::::: TO: Wei Liu <wei.liu2@citrix.com>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
