Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32ABD2EF
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Nov 2023 07:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DFVxM+cS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699429573; x=1730965573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1l8QsFXVGsRnqv5LjgHjmldKQiU/Q9ruCmJR11J1Gb0=;
  b=DFVxM+cSjekzkF06/s2aVWlzsO/Kl7eRSjLgNcTSD/f6g2lyQ4KUwDqW
   q8y6Bd11vcSjAVt6TTVIiw7Bxxg8//KvixbdezKXnemiR2obOeAu78g89
   NvSs4LOhgcA+2LcEX8ytsIfMfSHtFsjpnm44R3Qi7GbPQREavDUWMv356
   yZR4uE9V5dFS+8fqUKIKdnRmQArjPDnUeE5j9c9h7YPR984cevfp7j8zf
   BCTkZ2Qcfi2iEMh7jNQtYuTC9hpnIhV/D0JCxOgjHOSa9R2DEhk4e/MY3
   aanwEpe7SkFpiYEDPqLAfaayv4Q9LCgGB72uky1WONbhrbkMJOwZ9nqGX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="456206965"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="456206965"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 23:46:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="792108439"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="792108439"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Nov 2023 23:46:11 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0dGL-0007mB-1r;
	Wed, 08 Nov 2023 07:46:09 +0000
Date: Wed, 8 Nov 2023 15:41:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/net/xen-netback/xenbus.c:994:65: warning: '%u' directive
 output may be truncated writing between 1 and 10 bytes into a region of size
 between 4 and 19
Message-ID: <202311081554.XuhPcZAq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jason Andryuk <jandryuk@gmail.com>
CC: Juergen Gross <jgross@suse.com>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   305230142ae0637213bf6e04f6d9f10bbcb74af8
commit: ea9e57d06e48239e19f67769703aa48554f6648b xen: Make XEN_BACKEND selectable by DomU
date:   5 years ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 years ago
config: x86_64-buildonly-randconfig-001-20231101 (https://download.01.org/0day-ci/archive/20231108/202311081554.XuhPcZAq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311081554.XuhPcZAq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311081554.XuhPcZAq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/xen-netback/xenbus.c: In function 'frontend_changed':
   drivers/net/xen-netback/xenbus.c:668:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
     668 |                 if (xenbus_dev_is_online(dev))
         |                    ^
   drivers/net/xen-netback/xenbus.c:671:9: note: here
     671 |         case XenbusStateUnknown:
         |         ^~~~
   drivers/net/xen-netback/xenbus.c: In function 'connect':
>> drivers/net/xen-netback/xenbus.c:994:65: warning: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size between 4 and 19 [-Wformat-truncation=]
     994 |                 snprintf(queue->name, sizeof(queue->name), "%s-q%u",
         |                                                                 ^~
   drivers/net/xen-netback/xenbus.c:994:60: note: directive argument in the range [0, 4294967294]
     994 |                 snprintf(queue->name, sizeof(queue->name), "%s-q%u",
         |                                                            ^~~~~~~~
   drivers/net/xen-netback/xenbus.c:994:17: note: 'snprintf' output between 4 and 28 bytes into a destination of size 21
     994 |                 snprintf(queue->name, sizeof(queue->name), "%s-q%u",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     995 |                                 be->vif->dev->name, queue->id);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/xen-netback/xenbus.c:284: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Entry point to this code when a new device is created.  Allocate the basic
   drivers/net/xen-netback/xenbus.c:639: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Callback received when the frontend's state changes.
   drivers/net/xen-netback/.tmp_xenbus.o: warning: objtool: xen_net_read_rate()+0x81: sibling call from callable instruction with modified stack frame
   drivers/net/xen-netback/.tmp_xenbus.o: warning: objtool: xenvif_write_io_ring()+0xc7: sibling call from callable instruction with modified stack frame
   drivers/net/xen-netback/.tmp_xenbus.o: warning: objtool: xen_register_mcast_ctrl_watch.isra.0()+0xc3: sibling call from callable instruction with modified stack frame
   drivers/net/xen-netback/.tmp_xenbus.o: warning: objtool: xen_register_credit_watch.isra.0()+0x87: sibling call from callable instruction with modified stack frame
   drivers/net/xen-netback/.tmp_xenbus.o: warning: objtool: connect()+0x839: sibling call from callable instruction with modified stack frame


vim +994 drivers/net/xen-netback/xenbus.c

4e15ee2cb46fed Paul Durrant         2016-05-13   938  
f942dc2552b8bf Ian Campbell         2011-03-15   939  static void connect(struct backend_info *be)
f942dc2552b8bf Ian Campbell         2011-03-15   940  {
f942dc2552b8bf Ian Campbell         2011-03-15   941  	int err;
f942dc2552b8bf Ian Campbell         2011-03-15   942  	struct xenbus_device *dev = be->dev;
e9ce7cb6b10740 Wei Liu              2014-06-04   943  	unsigned long credit_bytes, credit_usec;
e9ce7cb6b10740 Wei Liu              2014-06-04   944  	unsigned int queue_index;
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04   945  	unsigned int requested_num_queues;
e9ce7cb6b10740 Wei Liu              2014-06-04   946  	struct xenvif_queue *queue;
f942dc2552b8bf Ian Campbell         2011-03-15   947  
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04   948  	/* Check whether the frontend requested multiple queues
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04   949  	 * and read the number requested.
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04   950  	 */
f95842e7a9f235 Juergen Gross        2016-10-31   951  	requested_num_queues = xenbus_read_unsigned(dev->otherend,
f95842e7a9f235 Juergen Gross        2016-10-31   952  					"multi-queue-num-queues", 1);
f95842e7a9f235 Juergen Gross        2016-10-31   953  	if (requested_num_queues > xenvif_max_queues) {
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04   954  		/* buggy or malicious guest */
0f06ac3b6616b9 Arnd Bergmann        2016-11-10   955  		xenbus_dev_fatal(dev, -EINVAL,
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04   956  				 "guest requested %u queues, exceeding the maximum of %u.",
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04   957  				 requested_num_queues, xenvif_max_queues);
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04   958  		return;
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04   959  	}
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04   960  
f942dc2552b8bf Ian Campbell         2011-03-15   961  	err = xen_net_read_mac(dev, be->vif->fe_dev_addr);
f942dc2552b8bf Ian Campbell         2011-03-15   962  	if (err) {
f942dc2552b8bf Ian Campbell         2011-03-15   963  		xenbus_dev_fatal(dev, err, "parsing %s/mac", dev->nodename);
f942dc2552b8bf Ian Campbell         2011-03-15   964  		return;
f942dc2552b8bf Ian Campbell         2011-03-15   965  	}
f942dc2552b8bf Ian Campbell         2011-03-15   966  
e9ce7cb6b10740 Wei Liu              2014-06-04   967  	xen_net_read_rate(dev, &credit_bytes, &credit_usec);
12b322ac85208d Palik, Imre          2015-06-19   968  	xen_unregister_watchers(be->vif);
edafc132baac4f Palik, Imre          2015-03-19   969  	xen_register_watchers(dev, be->vif);
e9ce7cb6b10740 Wei Liu              2014-06-04   970  	read_xenbus_vif_flags(be);
e9ce7cb6b10740 Wei Liu              2014-06-04   971  
4e15ee2cb46fed Paul Durrant         2016-05-13   972  	err = connect_ctrl_ring(be);
4e15ee2cb46fed Paul Durrant         2016-05-13   973  	if (err) {
4e15ee2cb46fed Paul Durrant         2016-05-13   974  		xenbus_dev_fatal(dev, err, "connecting control ring");
4e15ee2cb46fed Paul Durrant         2016-05-13   975  		return;
4e15ee2cb46fed Paul Durrant         2016-05-13   976  	}
4e15ee2cb46fed Paul Durrant         2016-05-13   977  
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04   978  	/* Use the number of queues requested by the frontend */
fad953ce0b22cf Kees Cook            2018-06-12   979  	be->vif->queues = vzalloc(array_size(requested_num_queues,
fad953ce0b22cf Kees Cook            2018-06-12   980  					     sizeof(struct xenvif_queue)));
833b8f18adfcca Insu Yun             2015-10-15   981  	if (!be->vif->queues) {
833b8f18adfcca Insu Yun             2015-10-15   982  		xenbus_dev_fatal(dev, -ENOMEM,
833b8f18adfcca Insu Yun             2015-10-15   983  				 "allocating queues");
833b8f18adfcca Insu Yun             2015-10-15   984  		return;
833b8f18adfcca Insu Yun             2015-10-15   985  	}
833b8f18adfcca Insu Yun             2015-10-15   986  
f7b50c4e7ced70 Wei Liu              2014-06-23   987  	be->vif->num_queues = requested_num_queues;
ecf08d2dbb96d5 David Vrabel         2014-10-22   988  	be->vif->stalled_queues = requested_num_queues;
e9ce7cb6b10740 Wei Liu              2014-06-04   989  
e9ce7cb6b10740 Wei Liu              2014-06-04   990  	for (queue_index = 0; queue_index < requested_num_queues; ++queue_index) {
e9ce7cb6b10740 Wei Liu              2014-06-04   991  		queue = &be->vif->queues[queue_index];
e9ce7cb6b10740 Wei Liu              2014-06-04   992  		queue->vif = be->vif;
e9ce7cb6b10740 Wei Liu              2014-06-04   993  		queue->id = queue_index;
e9ce7cb6b10740 Wei Liu              2014-06-04  @994  		snprintf(queue->name, sizeof(queue->name), "%s-q%u",
e9ce7cb6b10740 Wei Liu              2014-06-04   995  				be->vif->dev->name, queue->id);
e9ce7cb6b10740 Wei Liu              2014-06-04   996  
e9ce7cb6b10740 Wei Liu              2014-06-04   997  		err = xenvif_init_queue(queue);
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04   998  		if (err) {
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04   999  			/* xenvif_init_queue() cleans up after itself on
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  1000  			 * failure, but we need to clean up any previously
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  1001  			 * initialised queues. Set num_queues to i so that
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  1002  			 * earlier queues can be destroyed using the regular
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  1003  			 * disconnect logic.
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  1004  			 */
f7b50c4e7ced70 Wei Liu              2014-06-23  1005  			be->vif->num_queues = queue_index;
e9ce7cb6b10740 Wei Liu              2014-06-04  1006  			goto err;
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  1007  		}
e9ce7cb6b10740 Wei Liu              2014-06-04  1008  
ce0e5c522d3924 Ross Lagerwall       2015-05-27  1009  		queue->credit_bytes = credit_bytes;
e9ce7cb6b10740 Wei Liu              2014-06-04  1010  		queue->remaining_credit = credit_bytes;
07ff890daeda31 Palik, Imre          2015-01-06  1011  		queue->credit_usec = credit_usec;
e9ce7cb6b10740 Wei Liu              2014-06-04  1012  
4e15ee2cb46fed Paul Durrant         2016-05-13  1013  		err = connect_data_rings(be, queue);
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  1014  		if (err) {
4e15ee2cb46fed Paul Durrant         2016-05-13  1015  			/* connect_data_rings() cleans up after itself on
4e15ee2cb46fed Paul Durrant         2016-05-13  1016  			 * failure, but we need to clean up after
4e15ee2cb46fed Paul Durrant         2016-05-13  1017  			 * xenvif_init_queue() here, and also clean up any
4e15ee2cb46fed Paul Durrant         2016-05-13  1018  			 * previously initialised queues.
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  1019  			 */
8d3d53b3e43363 Andrew J. Bennieston 2014-06-04  1020  			xenvif_deinit_queue(queue);
f7b50c4e7ced70 Wei Liu              2014-06-23  1021  			be->vif->num_queues = queue_index;
e9ce7cb6b10740 Wei Liu              2014-06-04  1022  			goto err;
e9ce7cb6b10740 Wei Liu              2014-06-04  1023  		}
628fa76b09d7b0 Wei Liu              2014-08-12  1024  	}
628fa76b09d7b0 Wei Liu              2014-08-12  1025  

:::::: The code at line 994 was first introduced by commit
:::::: e9ce7cb6b107407e4798e8905b18ad8b642766f6 xen-netback: Factor queue-specific data into queue struct

:::::: TO: Wei Liu <wei.liu2@citrix.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
