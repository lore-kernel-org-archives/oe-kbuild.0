Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEB215A4
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Nov 2023 03:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZ7foA8w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700881987; x=1732417987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=48OQlRGK1aA41fKsWoGSclC2wrpLaRQtiTL8v4T9JCk=;
  b=jZ7foA8wUyQyZ/K5hlVrH/ptVX5owYd/1BM9kaGz7rJp0qS/KsGIg661
   WtYuVNcXQTC0C+kajhXl4AOS3uv57zoJw2aJee+YZL3N8jd6GAM4dsGIu
   vuC5GluF2zEgtBhbBmivbEGCSXeJy/LbhmXQ9I9RIJOTILUmuY8h5esU3
   mWjghkVjjZ6EVPc736KP8i6wIJjG0uACc9UoUGfmi6SFZ7PEvZ/siiF7E
   j2v2+1OKHxi1WAlwBfeHzWC59NkAk7wUFhQxQk3WPDFCq4+hYHmZFQW6K
   081zSJC/Y3bUUiScxMw5DtZ6QR6qXhzp+UaAUbFlft52O1PtPmM0umK6d
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="5716336"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="5716336"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 19:13:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="744025384"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="744025384"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 24 Nov 2023 19:13:04 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6j6L-0003a5-10;
	Sat, 25 Nov 2023 03:13:01 +0000
Date: Sat, 25 Nov 2023 11:11:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v7 5/5] misc: fastrpc: Add support to allocate shared
 context bank
Message-ID: <202311250922.W9tgrGT9-lkp@intel.com>
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
In-Reply-To: <20231121094844.5764-6-quic_ekangupt@quicinc.com>
References: <20231121094844.5764-6-quic_ekangupt@quicinc.com>
TO: Ekansh Gupta <quic_ekangupt@quicinc.com>
TO: srinivas.kandagatla@linaro.org
TO: linux-arm-msm@vger.kernel.org
CC: gregkh@linuxfoundation.org
CC: linux-kernel@vger.kernel.org

Hi Ekansh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7-rc2 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ekansh-Gupta/misc-fastrpc-Add-fastrpc-multimode-invoke-request-support/20231121-175147
base:   linus/master
patch link:    https://lore.kernel.org/r/20231121094844.5764-6-quic_ekangupt%40quicinc.com
patch subject: [PATCH v7 5/5] misc: fastrpc: Add support to allocate shared context bank
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-r081-20231123 (https://download.01.org/0day-ci/archive/20231125/202311250922.W9tgrGT9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231125/202311250922.W9tgrGT9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311250922.W9tgrGT9-lkp@intel.com/

New smatch warnings:
drivers/misc/fastrpc.c:1621 fastrpc_init_create_process() warn: missing unwind goto?

Old smatch warnings:
drivers/misc/fastrpc.c:1505 fastrpc_init_create_static_process() error: we previously assumed 'fl->cctx->remote_heap' could be null (see line 1497)

vim +1621 drivers/misc/fastrpc.c

0871561055e666 Abel Vesa                2022-11-25  1575  
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1576  static int fastrpc_init_create_process(struct fastrpc_user *fl,
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1577  					char __user *argp)
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1578  {
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1579  	struct fastrpc_init_create init;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1580  	struct fastrpc_invoke_args *args;
becdceed7669e5 Ekansh Gupta             2023-11-21  1581  	struct fastrpc_enhanced_invoke ioctl;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1582  	struct fastrpc_phy_page pages[1];
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1583  	struct fastrpc_map *map = NULL;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1584  	struct fastrpc_buf *imem = NULL;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1585  	int memlen;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1586  	int err;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1587  	struct {
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1588  		int pgid;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1589  		u32 namelen;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1590  		u32 filelen;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1591  		u32 pageslen;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1592  		u32 attrs;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1593  		u32 siglen;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1594  	} inbuf;
7f1f481263c3ce Jeya R                   2022-02-14  1595  	bool unsigned_module = false;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1596  
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1597  	args = kcalloc(FASTRPC_CREATE_PROCESS_NARGS, sizeof(*args), GFP_KERNEL);
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1598  	if (!args)
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1599  		return -ENOMEM;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1600  
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1601  	if (copy_from_user(&init, argp, sizeof(init))) {
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1602  		err = -EFAULT;
b49f6d83e290f1 Thierry Escande          2019-03-07  1603  		goto err;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1604  	}
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1605  
7f1f481263c3ce Jeya R                   2022-02-14  1606  	if (init.attrs & FASTRPC_MODE_UNSIGNED_MODULE)
7f1f481263c3ce Jeya R                   2022-02-14  1607  		unsigned_module = true;
7f1f481263c3ce Jeya R                   2022-02-14  1608  
7f1f481263c3ce Jeya R                   2022-02-14  1609  	if (is_session_rejected(fl, unsigned_module)) {
7f1f481263c3ce Jeya R                   2022-02-14  1610  		err = -ECONNREFUSED;
7f1f481263c3ce Jeya R                   2022-02-14  1611  		goto err;
7f1f481263c3ce Jeya R                   2022-02-14  1612  	}
7f1f481263c3ce Jeya R                   2022-02-14  1613  
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1614  	if (init.filelen > INIT_FILELEN_MAX) {
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1615  		err = -EINVAL;
b49f6d83e290f1 Thierry Escande          2019-03-07  1616  		goto err;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1617  	}
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1618  
92fe4bcba19c31 Ekansh Gupta             2023-11-21  1619  	fl->sctx = fastrpc_session_alloc(fl->cctx, fl->sharedcb);
92fe4bcba19c31 Ekansh Gupta             2023-11-21  1620  	if (!fl->sctx)
92fe4bcba19c31 Ekansh Gupta             2023-11-21 @1621  		return -EBUSY;
92fe4bcba19c31 Ekansh Gupta             2023-11-21  1622  
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1623  	inbuf.pgid = fl->tgid;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1624  	inbuf.namelen = strlen(current->comm) + 1;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1625  	inbuf.filelen = init.filelen;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1626  	inbuf.pageslen = 1;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1627  	inbuf.attrs = init.attrs;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1628  	inbuf.siglen = init.siglen;
84195d206e1fbd Jonathan Marek           2020-09-08  1629  	fl->pd = USER_PD;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1630  
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1631  	if (init.filelen && init.filefd) {
e90d911906196b Vamsi Krishna Gattupalli 2022-02-14  1632  		err = fastrpc_map_create(fl, init.filefd, init.filelen, 0, &map);
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1633  		if (err)
b49f6d83e290f1 Thierry Escande          2019-03-07  1634  			goto err;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1635  	}
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1636  
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1637  	memlen = ALIGN(max(INIT_FILELEN_MAX, (int)init.filelen * 4),
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1638  		       1024 * 1024);
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1639  	err = fastrpc_buf_alloc(fl, fl->sctx->dev, memlen,
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1640  				&imem);
b49f6d83e290f1 Thierry Escande          2019-03-07  1641  	if (err)
b49f6d83e290f1 Thierry Escande          2019-03-07  1642  		goto err_alloc;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1643  
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1644  	fl->init_mem = imem;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1645  	args[0].ptr = (u64)(uintptr_t)&inbuf;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1646  	args[0].length = sizeof(inbuf);
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1647  	args[0].fd = -1;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1648  
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1649  	args[1].ptr = (u64)(uintptr_t)current->comm;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1650  	args[1].length = inbuf.namelen;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1651  	args[1].fd = -1;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1652  
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1653  	args[2].ptr = (u64) init.file;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1654  	args[2].length = inbuf.filelen;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1655  	args[2].fd = init.filefd;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1656  
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1657  	pages[0].addr = imem->phys;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1658  	pages[0].size = imem->size;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1659  
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1660  	args[3].ptr = (u64)(uintptr_t) pages;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1661  	args[3].length = 1 * sizeof(*pages);
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1662  	args[3].fd = -1;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1663  
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1664  	args[4].ptr = (u64)(uintptr_t)&inbuf.attrs;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1665  	args[4].length = sizeof(inbuf.attrs);
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1666  	args[4].fd = -1;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1667  
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1668  	args[5].ptr = (u64)(uintptr_t) &inbuf.siglen;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1669  	args[5].length = sizeof(inbuf.siglen);
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1670  	args[5].fd = -1;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1671  
becdceed7669e5 Ekansh Gupta             2023-11-21  1672  	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
becdceed7669e5 Ekansh Gupta             2023-11-21  1673  	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE, 4, 0);
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1674  	if (init.attrs)
becdceed7669e5 Ekansh Gupta             2023-11-21  1675  		ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_ATTR, 4, 0);
e27748f5c08306 Ekansh Gupta             2023-11-21  1676  	ioctl.inv.args = (u64)args;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1677  
becdceed7669e5 Ekansh Gupta             2023-11-21  1678  	err = fastrpc_internal_invoke(fl, true, &ioctl);
b49f6d83e290f1 Thierry Escande          2019-03-07  1679  	if (err)
b49f6d83e290f1 Thierry Escande          2019-03-07  1680  		goto err_invoke;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1681  
b49f6d83e290f1 Thierry Escande          2019-03-07  1682  	kfree(args);
b49f6d83e290f1 Thierry Escande          2019-03-07  1683  
b49f6d83e290f1 Thierry Escande          2019-03-07  1684  	return 0;
b49f6d83e290f1 Thierry Escande          2019-03-07  1685  
b49f6d83e290f1 Thierry Escande          2019-03-07  1686  err_invoke:
b49f6d83e290f1 Thierry Escande          2019-03-07  1687  	fl->init_mem = NULL;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1688  	fastrpc_buf_free(imem);
b49f6d83e290f1 Thierry Escande          2019-03-07  1689  err_alloc:
b49f6d83e290f1 Thierry Escande          2019-03-07  1690  	fastrpc_map_put(map);
b49f6d83e290f1 Thierry Escande          2019-03-07  1691  err:
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1692  	kfree(args);
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1693  
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1694  	return err;
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1695  }
d73f71c7c6ee15 Srinivas Kandagatla      2019-02-08  1696  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
