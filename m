Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49F1433AE
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 20:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BfnHz/HM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700079626; x=1731615626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hp197C/TmiAw/Ds2iRFPtgL4o9Q75RMlvf9heHucO98=;
  b=BfnHz/HMekJS9VFn91+FIUdNSONmc0dWaGVrLLEkIcNb88fVh+mrxrSP
   IvTALkrWmx9bIZ3mLTjoGlX8TpI7niJvJXCu6NaN1sajXTyrRO2HGGQP0
   jSSrb6F2ezf1OhNQEEgv/8rV0iZBdVMSnAOhc+stWIVqRtXx1EJYEyR0q
   tRPwznZCJNQLJOWi0ZYODfhK8kogNLhhUZfQqeoC6GTwd3lh5EsyXKpm4
   RD8SRndSEJvYhZ4szU6Y5RhSYoUrpkvWzb0wryJYbRPczFv09i3aJhfWD
   +ZWg3m1+XVIfvC6tK+3MLQEyyBFCZJu3GVVdvxO4+2nzaNPgbgX4rMTvY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="375988900"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="375988900"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 12:20:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="741532518"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; 
   d="scan'208";a="741532518"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 15 Nov 2023 12:20:22 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3MN2-0000n6-1h;
	Wed, 15 Nov 2023 20:20:20 +0000
Date: Thu, 16 Nov 2023 04:19:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/ceph/file.c:1634:29: sparse: sparse: self-comparison always
 evaluates to false
Message-ID: <202311160430.1snXs4za-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/ceph/file.c:1634:29: sparse: sparse: self-comparison always evaluates to false"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jeff Layton <jlayton@kernel.org>
CC: Ilya Dryomov <idryomov@gmail.com>
CC: Xiubo Li <xiubli@redhat.com>
CC: Milind Changire <mchangir@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 33a5f1709a44efa7253b84832fe4a49fccf4924b ceph: add read/modify/write to ceph_sync_write
date:   3 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 3 months ago
config: mips-randconfig-r123-20231115 (https://download.01.org/0day-ci/archive/20231116/202311160430.1snXs4za-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311160430.1snXs4za-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311160430.1snXs4za-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ceph/file.c:1634:29: sparse: sparse: self-comparison always evaluates to false

vim +1634 fs/ceph/file.c

e8344e668915a7 majianpeng         2013-09-12  1558  
e8344e668915a7 majianpeng         2013-09-12  1559  /*
e8344e668915a7 majianpeng         2013-09-12  1560   * Synchronous write, straight from __user pointer or user pages.
e8344e668915a7 majianpeng         2013-09-12  1561   *
e8344e668915a7 majianpeng         2013-09-12  1562   * If write spans object boundary, just do multiple writes.  (For a
e8344e668915a7 majianpeng         2013-09-12  1563   * correct atomic write, we should e.g. take write locks on all
e8344e668915a7 majianpeng         2013-09-12  1564   * objects, rollback on failure, etc.)
e8344e668915a7 majianpeng         2013-09-12  1565   */
06fee30f6a31f1 Yan, Zheng         2014-07-28  1566  static ssize_t
5dda377cf0a6bd Yan, Zheng         2015-04-30  1567  ceph_sync_write(struct kiocb *iocb, struct iov_iter *from, loff_t pos,
5dda377cf0a6bd Yan, Zheng         2015-04-30  1568  		struct ceph_snap_context *snapc)
e8344e668915a7 majianpeng         2013-09-12  1569  {
e8344e668915a7 majianpeng         2013-09-12  1570  	struct file *file = iocb->ki_filp;
e8344e668915a7 majianpeng         2013-09-12  1571  	struct inode *inode = file_inode(file);
e8344e668915a7 majianpeng         2013-09-12  1572  	struct ceph_inode_info *ci = ceph_inode(inode);
e8344e668915a7 majianpeng         2013-09-12  1573  	struct ceph_fs_client *fsc = ceph_inode_to_client(inode);
33a5f1709a44ef Jeff Layton        2022-08-25  1574  	struct ceph_osd_client *osdc = &fsc->client->osdc;
e8344e668915a7 majianpeng         2013-09-12  1575  	struct ceph_osd_request *req;
e8344e668915a7 majianpeng         2013-09-12  1576  	struct page **pages;
e8344e668915a7 majianpeng         2013-09-12  1577  	u64 len;
e8344e668915a7 majianpeng         2013-09-12  1578  	int num_pages;
e8344e668915a7 majianpeng         2013-09-12  1579  	int written = 0;
e8344e668915a7 majianpeng         2013-09-12  1580  	int ret;
efb0ca765ac6f4 Yan, Zheng         2017-05-22  1581  	bool check_caps = false;
fac02ddf910814 Arnd Bergmann      2018-07-13  1582  	struct timespec64 mtime = current_time(inode);
4908b822b300d2 Al Viro            2014-04-03  1583  	size_t count = iov_iter_count(from);
e8344e668915a7 majianpeng         2013-09-12  1584  
e8344e668915a7 majianpeng         2013-09-12  1585  	if (ceph_snap(file_inode(file)) != CEPH_NOSNAP)
e8344e668915a7 majianpeng         2013-09-12  1586  		return -EROFS;
e8344e668915a7 majianpeng         2013-09-12  1587  
1c0a9c2d978360 Yan, Zheng         2017-08-16  1588  	dout("sync_write on file %p %lld~%u snapc %p seq %lld\n",
1c0a9c2d978360 Yan, Zheng         2017-08-16  1589  	     file, pos, (unsigned)count, snapc, snapc->seq);
e8344e668915a7 majianpeng         2013-09-12  1590  
e450f4d1a5d633 zhengbin           2019-02-01  1591  	ret = filemap_write_and_wait_range(inode->i_mapping,
e450f4d1a5d633 zhengbin           2019-02-01  1592  					   pos, pos + count - 1);
e8344e668915a7 majianpeng         2013-09-12  1593  	if (ret < 0)
e8344e668915a7 majianpeng         2013-09-12  1594  		return ret;
e8344e668915a7 majianpeng         2013-09-12  1595  
400e1286c0ec3f Jeff Layton        2021-12-07  1596  	ceph_fscache_invalidate(inode, false);
e8344e668915a7 majianpeng         2013-09-12  1597  	ret = invalidate_inode_pages2_range(inode->i_mapping,
09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  1598  					    pos >> PAGE_SHIFT,
e450f4d1a5d633 zhengbin           2019-02-01  1599  					    (pos + count - 1) >> PAGE_SHIFT);
e8344e668915a7 majianpeng         2013-09-12  1600  	if (ret < 0)
e8344e668915a7 majianpeng         2013-09-12  1601  		dout("invalidate_inode_pages2_range returned %d\n", ret);
e8344e668915a7 majianpeng         2013-09-12  1602  
4908b822b300d2 Al Viro            2014-04-03  1603  	while ((len = iov_iter_count(from)) > 0) {
e8344e668915a7 majianpeng         2013-09-12  1604  		size_t left;
e8344e668915a7 majianpeng         2013-09-12  1605  		int n;
33a5f1709a44ef Jeff Layton        2022-08-25  1606  		u64 write_pos = pos;
33a5f1709a44ef Jeff Layton        2022-08-25  1607  		u64 write_len = len;
33a5f1709a44ef Jeff Layton        2022-08-25  1608  		u64 objnum, objoff;
33a5f1709a44ef Jeff Layton        2022-08-25  1609  		u32 xlen;
33a5f1709a44ef Jeff Layton        2022-08-25  1610  		u64 assert_ver = 0;
33a5f1709a44ef Jeff Layton        2022-08-25  1611  		bool rmw;
33a5f1709a44ef Jeff Layton        2022-08-25  1612  		bool first, last;
33a5f1709a44ef Jeff Layton        2022-08-25  1613  		struct iov_iter saved_iter = *from;
33a5f1709a44ef Jeff Layton        2022-08-25  1614  		size_t off;
e8344e668915a7 majianpeng         2013-09-12  1615  
33a5f1709a44ef Jeff Layton        2022-08-25  1616  		ceph_fscrypt_adjust_off_and_len(inode, &write_pos, &write_len);
33a5f1709a44ef Jeff Layton        2022-08-25  1617  
33a5f1709a44ef Jeff Layton        2022-08-25  1618  		/* clamp the length to the end of first object */
33a5f1709a44ef Jeff Layton        2022-08-25  1619  		ceph_calc_file_object_mapping(&ci->i_layout, write_pos,
33a5f1709a44ef Jeff Layton        2022-08-25  1620  					      write_len, &objnum, &objoff,
33a5f1709a44ef Jeff Layton        2022-08-25  1621  					      &xlen);
33a5f1709a44ef Jeff Layton        2022-08-25  1622  		write_len = xlen;
33a5f1709a44ef Jeff Layton        2022-08-25  1623  
33a5f1709a44ef Jeff Layton        2022-08-25  1624  		/* adjust len downward if it goes beyond current object */
33a5f1709a44ef Jeff Layton        2022-08-25  1625  		if (pos + len > write_pos + write_len)
33a5f1709a44ef Jeff Layton        2022-08-25  1626  			len = write_pos + write_len - pos;
33a5f1709a44ef Jeff Layton        2022-08-25  1627  
33a5f1709a44ef Jeff Layton        2022-08-25  1628  		/*
33a5f1709a44ef Jeff Layton        2022-08-25  1629  		 * If we had to adjust the length or position to align with a
33a5f1709a44ef Jeff Layton        2022-08-25  1630  		 * crypto block, then we must do a read/modify/write cycle. We
33a5f1709a44ef Jeff Layton        2022-08-25  1631  		 * use a version assertion to redrive the thing if something
33a5f1709a44ef Jeff Layton        2022-08-25  1632  		 * changes in between.
33a5f1709a44ef Jeff Layton        2022-08-25  1633  		 */
33a5f1709a44ef Jeff Layton        2022-08-25 @1634  		first = pos != write_pos;
33a5f1709a44ef Jeff Layton        2022-08-25  1635  		last = (pos + len) != (write_pos + write_len);
33a5f1709a44ef Jeff Layton        2022-08-25  1636  		rmw = first || last;
33a5f1709a44ef Jeff Layton        2022-08-25  1637  
33a5f1709a44ef Jeff Layton        2022-08-25  1638  		dout("sync_write ino %llx %lld~%llu adjusted %lld~%llu -- %srmw\n",
33a5f1709a44ef Jeff Layton        2022-08-25  1639  		     ci->i_vino.ino, pos, len, write_pos, write_len,
33a5f1709a44ef Jeff Layton        2022-08-25  1640  		     rmw ? "" : "no ");
33a5f1709a44ef Jeff Layton        2022-08-25  1641  
33a5f1709a44ef Jeff Layton        2022-08-25  1642  		/*
33a5f1709a44ef Jeff Layton        2022-08-25  1643  		 * The data is emplaced into the page as it would be if it were
33a5f1709a44ef Jeff Layton        2022-08-25  1644  		 * in an array of pagecache pages.
33a5f1709a44ef Jeff Layton        2022-08-25  1645  		 */
33a5f1709a44ef Jeff Layton        2022-08-25  1646  		num_pages = calc_pages_for(write_pos, write_len);
33a5f1709a44ef Jeff Layton        2022-08-25  1647  		pages = ceph_alloc_page_vector(num_pages, GFP_KERNEL);
33a5f1709a44ef Jeff Layton        2022-08-25  1648  		if (IS_ERR(pages)) {
33a5f1709a44ef Jeff Layton        2022-08-25  1649  			ret = PTR_ERR(pages);
33a5f1709a44ef Jeff Layton        2022-08-25  1650  			break;
33a5f1709a44ef Jeff Layton        2022-08-25  1651  		}
33a5f1709a44ef Jeff Layton        2022-08-25  1652  
33a5f1709a44ef Jeff Layton        2022-08-25  1653  		/* Do we need to preload the pages? */
33a5f1709a44ef Jeff Layton        2022-08-25  1654  		if (rmw) {
33a5f1709a44ef Jeff Layton        2022-08-25  1655  			u64 first_pos = write_pos;
33a5f1709a44ef Jeff Layton        2022-08-25  1656  			u64 last_pos = (write_pos + write_len) - CEPH_FSCRYPT_BLOCK_SIZE;
33a5f1709a44ef Jeff Layton        2022-08-25  1657  			u64 read_len = CEPH_FSCRYPT_BLOCK_SIZE;
33a5f1709a44ef Jeff Layton        2022-08-25  1658  			struct ceph_osd_req_op *op;
33a5f1709a44ef Jeff Layton        2022-08-25  1659  
33a5f1709a44ef Jeff Layton        2022-08-25  1660  			/* We should only need to do this for encrypted inodes */
33a5f1709a44ef Jeff Layton        2022-08-25  1661  			WARN_ON_ONCE(!IS_ENCRYPTED(inode));
33a5f1709a44ef Jeff Layton        2022-08-25  1662  
33a5f1709a44ef Jeff Layton        2022-08-25  1663  			/* No need to do two reads if first and last blocks are same */
33a5f1709a44ef Jeff Layton        2022-08-25  1664  			if (first && last_pos == first_pos)
33a5f1709a44ef Jeff Layton        2022-08-25  1665  				last = false;
33a5f1709a44ef Jeff Layton        2022-08-25  1666  
33a5f1709a44ef Jeff Layton        2022-08-25  1667  			/*
33a5f1709a44ef Jeff Layton        2022-08-25  1668  			 * Allocate a read request for one or two extents,
33a5f1709a44ef Jeff Layton        2022-08-25  1669  			 * depending on how the request was aligned.
33a5f1709a44ef Jeff Layton        2022-08-25  1670  			 */
33a5f1709a44ef Jeff Layton        2022-08-25  1671  			req = ceph_osdc_new_request(osdc, &ci->i_layout,
33a5f1709a44ef Jeff Layton        2022-08-25  1672  					ci->i_vino, first ? first_pos : last_pos,
33a5f1709a44ef Jeff Layton        2022-08-25  1673  					&read_len, 0, (first && last) ? 2 : 1,
33a5f1709a44ef Jeff Layton        2022-08-25  1674  					CEPH_OSD_OP_SPARSE_READ, CEPH_OSD_FLAG_READ,
33a5f1709a44ef Jeff Layton        2022-08-25  1675  					NULL, ci->i_truncate_seq,
33a5f1709a44ef Jeff Layton        2022-08-25  1676  					ci->i_truncate_size, false);
e8344e668915a7 majianpeng         2013-09-12  1677  			if (IS_ERR(req)) {
33a5f1709a44ef Jeff Layton        2022-08-25  1678  				ceph_release_page_vector(pages, num_pages);
e8344e668915a7 majianpeng         2013-09-12  1679  				ret = PTR_ERR(req);
eab87235c0f597 Al Viro            2014-04-03  1680  				break;
e8344e668915a7 majianpeng         2013-09-12  1681  			}
e8344e668915a7 majianpeng         2013-09-12  1682  
33a5f1709a44ef Jeff Layton        2022-08-25  1683  			/* Something is misaligned! */
33a5f1709a44ef Jeff Layton        2022-08-25  1684  			if (read_len != CEPH_FSCRYPT_BLOCK_SIZE) {
33a5f1709a44ef Jeff Layton        2022-08-25  1685  				ceph_osdc_put_request(req);
33a5f1709a44ef Jeff Layton        2022-08-25  1686  				ceph_release_page_vector(pages, num_pages);
33a5f1709a44ef Jeff Layton        2022-08-25  1687  				ret = -EIO;
33a5f1709a44ef Jeff Layton        2022-08-25  1688  				break;
33a5f1709a44ef Jeff Layton        2022-08-25  1689  			}
33a5f1709a44ef Jeff Layton        2022-08-25  1690  
33a5f1709a44ef Jeff Layton        2022-08-25  1691  			/* Add extent for first block? */
33a5f1709a44ef Jeff Layton        2022-08-25  1692  			op = &req->r_ops[0];
33a5f1709a44ef Jeff Layton        2022-08-25  1693  
33a5f1709a44ef Jeff Layton        2022-08-25  1694  			if (first) {
33a5f1709a44ef Jeff Layton        2022-08-25  1695  				osd_req_op_extent_osd_data_pages(req, 0, pages,
33a5f1709a44ef Jeff Layton        2022-08-25  1696  							 CEPH_FSCRYPT_BLOCK_SIZE,
33a5f1709a44ef Jeff Layton        2022-08-25  1697  							 offset_in_page(first_pos),
33a5f1709a44ef Jeff Layton        2022-08-25  1698  							 false, false);
33a5f1709a44ef Jeff Layton        2022-08-25  1699  				/* We only expect a single extent here */
33a5f1709a44ef Jeff Layton        2022-08-25  1700  				ret = __ceph_alloc_sparse_ext_map(op, 1);
33a5f1709a44ef Jeff Layton        2022-08-25  1701  				if (ret) {
33a5f1709a44ef Jeff Layton        2022-08-25  1702  					ceph_osdc_put_request(req);
33a5f1709a44ef Jeff Layton        2022-08-25  1703  					ceph_release_page_vector(pages, num_pages);
33a5f1709a44ef Jeff Layton        2022-08-25  1704  					break;
33a5f1709a44ef Jeff Layton        2022-08-25  1705  				}
33a5f1709a44ef Jeff Layton        2022-08-25  1706  			}
33a5f1709a44ef Jeff Layton        2022-08-25  1707  
33a5f1709a44ef Jeff Layton        2022-08-25  1708  			/* Add extent for last block */
33a5f1709a44ef Jeff Layton        2022-08-25  1709  			if (last) {
33a5f1709a44ef Jeff Layton        2022-08-25  1710  				/* Init the other extent if first extent has been used */
33a5f1709a44ef Jeff Layton        2022-08-25  1711  				if (first) {
33a5f1709a44ef Jeff Layton        2022-08-25  1712  					op = &req->r_ops[1];
33a5f1709a44ef Jeff Layton        2022-08-25  1713  					osd_req_op_extent_init(req, 1,
33a5f1709a44ef Jeff Layton        2022-08-25  1714  							CEPH_OSD_OP_SPARSE_READ,
33a5f1709a44ef Jeff Layton        2022-08-25  1715  							last_pos, CEPH_FSCRYPT_BLOCK_SIZE,
33a5f1709a44ef Jeff Layton        2022-08-25  1716  							ci->i_truncate_size,
33a5f1709a44ef Jeff Layton        2022-08-25  1717  							ci->i_truncate_seq);
33a5f1709a44ef Jeff Layton        2022-08-25  1718  				}
33a5f1709a44ef Jeff Layton        2022-08-25  1719  
33a5f1709a44ef Jeff Layton        2022-08-25  1720  				ret = __ceph_alloc_sparse_ext_map(op, 1);
33a5f1709a44ef Jeff Layton        2022-08-25  1721  				if (ret) {
33a5f1709a44ef Jeff Layton        2022-08-25  1722  					ceph_osdc_put_request(req);
33a5f1709a44ef Jeff Layton        2022-08-25  1723  					ceph_release_page_vector(pages, num_pages);
33a5f1709a44ef Jeff Layton        2022-08-25  1724  					break;
33a5f1709a44ef Jeff Layton        2022-08-25  1725  				}
33a5f1709a44ef Jeff Layton        2022-08-25  1726  
33a5f1709a44ef Jeff Layton        2022-08-25  1727  				osd_req_op_extent_osd_data_pages(req, first ? 1 : 0,
33a5f1709a44ef Jeff Layton        2022-08-25  1728  							&pages[num_pages - 1],
33a5f1709a44ef Jeff Layton        2022-08-25  1729  							CEPH_FSCRYPT_BLOCK_SIZE,
33a5f1709a44ef Jeff Layton        2022-08-25  1730  							offset_in_page(last_pos),
33a5f1709a44ef Jeff Layton        2022-08-25  1731  							false, false);
33a5f1709a44ef Jeff Layton        2022-08-25  1732  			}
33a5f1709a44ef Jeff Layton        2022-08-25  1733  
33a5f1709a44ef Jeff Layton        2022-08-25  1734  			ceph_osdc_start_request(osdc, req);
33a5f1709a44ef Jeff Layton        2022-08-25  1735  			ret = ceph_osdc_wait_request(osdc, req);
33a5f1709a44ef Jeff Layton        2022-08-25  1736  
33a5f1709a44ef Jeff Layton        2022-08-25  1737  			/* FIXME: length field is wrong if there are 2 extents */
33a5f1709a44ef Jeff Layton        2022-08-25  1738  			ceph_update_read_metrics(&fsc->mdsc->metric,
33a5f1709a44ef Jeff Layton        2022-08-25  1739  						 req->r_start_latency,
33a5f1709a44ef Jeff Layton        2022-08-25  1740  						 req->r_end_latency,
33a5f1709a44ef Jeff Layton        2022-08-25  1741  						 read_len, ret);
33a5f1709a44ef Jeff Layton        2022-08-25  1742  
33a5f1709a44ef Jeff Layton        2022-08-25  1743  			/* Ok if object is not already present */
33a5f1709a44ef Jeff Layton        2022-08-25  1744  			if (ret == -ENOENT) {
33a5f1709a44ef Jeff Layton        2022-08-25  1745  				/*
33a5f1709a44ef Jeff Layton        2022-08-25  1746  				 * If there is no object, then we can't assert
33a5f1709a44ef Jeff Layton        2022-08-25  1747  				 * on its version. Set it to 0, and we'll use an
33a5f1709a44ef Jeff Layton        2022-08-25  1748  				 * exclusive create instead.
33a5f1709a44ef Jeff Layton        2022-08-25  1749  				 */
33a5f1709a44ef Jeff Layton        2022-08-25  1750  				ceph_osdc_put_request(req);
33a5f1709a44ef Jeff Layton        2022-08-25  1751  				ret = 0;
33a5f1709a44ef Jeff Layton        2022-08-25  1752  
33a5f1709a44ef Jeff Layton        2022-08-25  1753  				/*
33a5f1709a44ef Jeff Layton        2022-08-25  1754  				 * zero out the soon-to-be uncopied parts of the
33a5f1709a44ef Jeff Layton        2022-08-25  1755  				 * first and last pages.
33a5f1709a44ef Jeff Layton        2022-08-25  1756  				 */
33a5f1709a44ef Jeff Layton        2022-08-25  1757  				if (first)
33a5f1709a44ef Jeff Layton        2022-08-25  1758  					zero_user_segment(pages[0], 0,
33a5f1709a44ef Jeff Layton        2022-08-25  1759  							  offset_in_page(first_pos));
33a5f1709a44ef Jeff Layton        2022-08-25  1760  				if (last)
33a5f1709a44ef Jeff Layton        2022-08-25  1761  					zero_user_segment(pages[num_pages - 1],
33a5f1709a44ef Jeff Layton        2022-08-25  1762  							  offset_in_page(last_pos),
33a5f1709a44ef Jeff Layton        2022-08-25  1763  							  PAGE_SIZE);
33a5f1709a44ef Jeff Layton        2022-08-25  1764  			} else {
33a5f1709a44ef Jeff Layton        2022-08-25  1765  				if (ret < 0) {
33a5f1709a44ef Jeff Layton        2022-08-25  1766  					ceph_osdc_put_request(req);
33a5f1709a44ef Jeff Layton        2022-08-25  1767  					ceph_release_page_vector(pages, num_pages);
33a5f1709a44ef Jeff Layton        2022-08-25  1768  					break;
33a5f1709a44ef Jeff Layton        2022-08-25  1769  				}
33a5f1709a44ef Jeff Layton        2022-08-25  1770  
33a5f1709a44ef Jeff Layton        2022-08-25  1771  				op = &req->r_ops[0];
33a5f1709a44ef Jeff Layton        2022-08-25  1772  				if (op->extent.sparse_ext_cnt == 0) {
33a5f1709a44ef Jeff Layton        2022-08-25  1773  					if (first)
33a5f1709a44ef Jeff Layton        2022-08-25  1774  						zero_user_segment(pages[0], 0,
33a5f1709a44ef Jeff Layton        2022-08-25  1775  								  offset_in_page(first_pos));
33a5f1709a44ef Jeff Layton        2022-08-25  1776  					else
33a5f1709a44ef Jeff Layton        2022-08-25  1777  						zero_user_segment(pages[num_pages - 1],
33a5f1709a44ef Jeff Layton        2022-08-25  1778  								  offset_in_page(last_pos),
33a5f1709a44ef Jeff Layton        2022-08-25  1779  								  PAGE_SIZE);
33a5f1709a44ef Jeff Layton        2022-08-25  1780  				} else if (op->extent.sparse_ext_cnt != 1 ||
33a5f1709a44ef Jeff Layton        2022-08-25  1781  					   ceph_sparse_ext_map_end(op) !=
33a5f1709a44ef Jeff Layton        2022-08-25  1782  						CEPH_FSCRYPT_BLOCK_SIZE) {
33a5f1709a44ef Jeff Layton        2022-08-25  1783  					ret = -EIO;
33a5f1709a44ef Jeff Layton        2022-08-25  1784  					ceph_osdc_put_request(req);
33a5f1709a44ef Jeff Layton        2022-08-25  1785  					ceph_release_page_vector(pages, num_pages);
33a5f1709a44ef Jeff Layton        2022-08-25  1786  					break;
33a5f1709a44ef Jeff Layton        2022-08-25  1787  				}
33a5f1709a44ef Jeff Layton        2022-08-25  1788  
33a5f1709a44ef Jeff Layton        2022-08-25  1789  				if (first && last) {
33a5f1709a44ef Jeff Layton        2022-08-25  1790  					op = &req->r_ops[1];
33a5f1709a44ef Jeff Layton        2022-08-25  1791  					if (op->extent.sparse_ext_cnt == 0) {
33a5f1709a44ef Jeff Layton        2022-08-25  1792  						zero_user_segment(pages[num_pages - 1],
33a5f1709a44ef Jeff Layton        2022-08-25  1793  								  offset_in_page(last_pos),
33a5f1709a44ef Jeff Layton        2022-08-25  1794  								  PAGE_SIZE);
33a5f1709a44ef Jeff Layton        2022-08-25  1795  					} else if (op->extent.sparse_ext_cnt != 1 ||
33a5f1709a44ef Jeff Layton        2022-08-25  1796  						   ceph_sparse_ext_map_end(op) !=
33a5f1709a44ef Jeff Layton        2022-08-25  1797  							CEPH_FSCRYPT_BLOCK_SIZE) {
33a5f1709a44ef Jeff Layton        2022-08-25  1798  						ret = -EIO;
33a5f1709a44ef Jeff Layton        2022-08-25  1799  						ceph_osdc_put_request(req);
33a5f1709a44ef Jeff Layton        2022-08-25  1800  						ceph_release_page_vector(pages, num_pages);
33a5f1709a44ef Jeff Layton        2022-08-25  1801  						break;
33a5f1709a44ef Jeff Layton        2022-08-25  1802  					}
33a5f1709a44ef Jeff Layton        2022-08-25  1803  				}
33a5f1709a44ef Jeff Layton        2022-08-25  1804  
33a5f1709a44ef Jeff Layton        2022-08-25  1805  				/* Grab assert version. It must be non-zero. */
33a5f1709a44ef Jeff Layton        2022-08-25  1806  				assert_ver = req->r_version;
33a5f1709a44ef Jeff Layton        2022-08-25  1807  				WARN_ON_ONCE(ret > 0 && assert_ver == 0);
33a5f1709a44ef Jeff Layton        2022-08-25  1808  
33a5f1709a44ef Jeff Layton        2022-08-25  1809  				ceph_osdc_put_request(req);
33a5f1709a44ef Jeff Layton        2022-08-25  1810  				if (first) {
33a5f1709a44ef Jeff Layton        2022-08-25  1811  					ret = ceph_fscrypt_decrypt_block_inplace(inode,
33a5f1709a44ef Jeff Layton        2022-08-25  1812  							pages[0], CEPH_FSCRYPT_BLOCK_SIZE,
33a5f1709a44ef Jeff Layton        2022-08-25  1813  							offset_in_page(first_pos),
33a5f1709a44ef Jeff Layton        2022-08-25  1814  							first_pos >> CEPH_FSCRYPT_BLOCK_SHIFT);
33a5f1709a44ef Jeff Layton        2022-08-25  1815  					if (ret < 0) {
33a5f1709a44ef Jeff Layton        2022-08-25  1816  						ceph_release_page_vector(pages, num_pages);
33a5f1709a44ef Jeff Layton        2022-08-25  1817  						break;
33a5f1709a44ef Jeff Layton        2022-08-25  1818  					}
33a5f1709a44ef Jeff Layton        2022-08-25  1819  				}
33a5f1709a44ef Jeff Layton        2022-08-25  1820  				if (last) {
33a5f1709a44ef Jeff Layton        2022-08-25  1821  					ret = ceph_fscrypt_decrypt_block_inplace(inode,
33a5f1709a44ef Jeff Layton        2022-08-25  1822  							pages[num_pages - 1],
33a5f1709a44ef Jeff Layton        2022-08-25  1823  							CEPH_FSCRYPT_BLOCK_SIZE,
33a5f1709a44ef Jeff Layton        2022-08-25  1824  							offset_in_page(last_pos),
33a5f1709a44ef Jeff Layton        2022-08-25  1825  							last_pos >> CEPH_FSCRYPT_BLOCK_SHIFT);
33a5f1709a44ef Jeff Layton        2022-08-25  1826  					if (ret < 0) {
33a5f1709a44ef Jeff Layton        2022-08-25  1827  						ceph_release_page_vector(pages, num_pages);
33a5f1709a44ef Jeff Layton        2022-08-25  1828  						break;
33a5f1709a44ef Jeff Layton        2022-08-25  1829  					}
33a5f1709a44ef Jeff Layton        2022-08-25  1830  				}
33a5f1709a44ef Jeff Layton        2022-08-25  1831  			}
124e68e7409909 Sage Weil          2009-10-06  1832  		}
e8344e668915a7 majianpeng         2013-09-12  1833  
e8344e668915a7 majianpeng         2013-09-12  1834  		left = len;
b294fa295ff47a Jeff Layton        2022-08-25  1835  		off = offset_in_page(pos);
e8344e668915a7 majianpeng         2013-09-12  1836  		for (n = 0; n < num_pages; n++) {
b294fa295ff47a Jeff Layton        2022-08-25  1837  			size_t plen = min_t(size_t, left, PAGE_SIZE - off);
b294fa295ff47a Jeff Layton        2022-08-25  1838  
33a5f1709a44ef Jeff Layton        2022-08-25  1839  			/* copy the data */
b294fa295ff47a Jeff Layton        2022-08-25  1840  			ret = copy_page_from_iter(pages[n], off, plen, from);
e8344e668915a7 majianpeng         2013-09-12  1841  			if (ret != plen) {
e8344e668915a7 majianpeng         2013-09-12  1842  				ret = -EFAULT;
e8344e668915a7 majianpeng         2013-09-12  1843  				break;
e8344e668915a7 majianpeng         2013-09-12  1844  			}
33a5f1709a44ef Jeff Layton        2022-08-25  1845  			off = 0;
e8344e668915a7 majianpeng         2013-09-12  1846  			left -= ret;
e8344e668915a7 majianpeng         2013-09-12  1847  		}
33a5f1709a44ef Jeff Layton        2022-08-25  1848  		if (ret < 0) {
33a5f1709a44ef Jeff Layton        2022-08-25  1849  			dout("sync_write write failed with %d\n", ret);
33a5f1709a44ef Jeff Layton        2022-08-25  1850  			ceph_release_page_vector(pages, num_pages);
33a5f1709a44ef Jeff Layton        2022-08-25  1851  			break;
33a5f1709a44ef Jeff Layton        2022-08-25  1852  		}
e8344e668915a7 majianpeng         2013-09-12  1853  
33a5f1709a44ef Jeff Layton        2022-08-25  1854  		if (IS_ENCRYPTED(inode)) {
33a5f1709a44ef Jeff Layton        2022-08-25  1855  			ret = ceph_fscrypt_encrypt_pages(inode, pages,
33a5f1709a44ef Jeff Layton        2022-08-25  1856  							 write_pos, write_len,
33a5f1709a44ef Jeff Layton        2022-08-25  1857  							 GFP_KERNEL);
124e68e7409909 Sage Weil          2009-10-06  1858  			if (ret < 0) {
33a5f1709a44ef Jeff Layton        2022-08-25  1859  				dout("encryption failed with %d\n", ret);
124e68e7409909 Sage Weil          2009-10-06  1860  				ceph_release_page_vector(pages, num_pages);
33a5f1709a44ef Jeff Layton        2022-08-25  1861  				break;
33a5f1709a44ef Jeff Layton        2022-08-25  1862  			}
124e68e7409909 Sage Weil          2009-10-06  1863  		}
124e68e7409909 Sage Weil          2009-10-06  1864  
33a5f1709a44ef Jeff Layton        2022-08-25  1865  		req = ceph_osdc_new_request(osdc, &ci->i_layout,
33a5f1709a44ef Jeff Layton        2022-08-25  1866  					    ci->i_vino, write_pos, &write_len,
33a5f1709a44ef Jeff Layton        2022-08-25  1867  					    rmw ? 1 : 0, rmw ? 2 : 1,
33a5f1709a44ef Jeff Layton        2022-08-25  1868  					    CEPH_OSD_OP_WRITE,
33a5f1709a44ef Jeff Layton        2022-08-25  1869  					    CEPH_OSD_FLAG_WRITE,
33a5f1709a44ef Jeff Layton        2022-08-25  1870  					    snapc, ci->i_truncate_seq,
33a5f1709a44ef Jeff Layton        2022-08-25  1871  					    ci->i_truncate_size, false);
33a5f1709a44ef Jeff Layton        2022-08-25  1872  		if (IS_ERR(req)) {
33a5f1709a44ef Jeff Layton        2022-08-25  1873  			ret = PTR_ERR(req);
33a5f1709a44ef Jeff Layton        2022-08-25  1874  			ceph_release_page_vector(pages, num_pages);
33a5f1709a44ef Jeff Layton        2022-08-25  1875  			break;
33a5f1709a44ef Jeff Layton        2022-08-25  1876  		}
33a5f1709a44ef Jeff Layton        2022-08-25  1877  
33a5f1709a44ef Jeff Layton        2022-08-25  1878  		dout("sync_write write op %lld~%llu\n", write_pos, write_len);
33a5f1709a44ef Jeff Layton        2022-08-25  1879  		osd_req_op_extent_osd_data_pages(req, rmw ? 1 : 0, pages, write_len,
33a5f1709a44ef Jeff Layton        2022-08-25  1880  						 offset_in_page(write_pos), false,
33a5f1709a44ef Jeff Layton        2022-08-25  1881  						 true);
26be88087ae8a0 Alex Elder         2013-04-15  1882  		req->r_inode = inode;
33a5f1709a44ef Jeff Layton        2022-08-25  1883  		req->r_mtime = mtime;
e8344e668915a7 majianpeng         2013-09-12  1884  
33a5f1709a44ef Jeff Layton        2022-08-25  1885  		/* Set up the assertion */
33a5f1709a44ef Jeff Layton        2022-08-25  1886  		if (rmw) {
33a5f1709a44ef Jeff Layton        2022-08-25  1887  			/*
33a5f1709a44ef Jeff Layton        2022-08-25  1888  			 * Set up the assertion. If we don't have a version
33a5f1709a44ef Jeff Layton        2022-08-25  1889  			 * number, then the object doesn't exist yet. Use an
33a5f1709a44ef Jeff Layton        2022-08-25  1890  			 * exclusive create instead of a version assertion in
33a5f1709a44ef Jeff Layton        2022-08-25  1891  			 * that case.
33a5f1709a44ef Jeff Layton        2022-08-25  1892  			 */
33a5f1709a44ef Jeff Layton        2022-08-25  1893  			if (assert_ver) {
33a5f1709a44ef Jeff Layton        2022-08-25  1894  				osd_req_op_init(req, 0, CEPH_OSD_OP_ASSERT_VER, 0);
33a5f1709a44ef Jeff Layton        2022-08-25  1895  				req->r_ops[0].assert_ver.ver = assert_ver;
33a5f1709a44ef Jeff Layton        2022-08-25  1896  			} else {
33a5f1709a44ef Jeff Layton        2022-08-25  1897  				osd_req_op_init(req, 0, CEPH_OSD_OP_CREATE,
33a5f1709a44ef Jeff Layton        2022-08-25  1898  						CEPH_OSD_OP_FLAG_EXCL);
33a5f1709a44ef Jeff Layton        2022-08-25  1899  			}
33a5f1709a44ef Jeff Layton        2022-08-25  1900  		}
124e68e7409909 Sage Weil          2009-10-06  1901  
33a5f1709a44ef Jeff Layton        2022-08-25  1902  		ceph_osdc_start_request(osdc, req);
33a5f1709a44ef Jeff Layton        2022-08-25  1903  		ret = ceph_osdc_wait_request(osdc, req);
124e68e7409909 Sage Weil          2009-10-06  1904  
8ae99ae2b40766 Xiubo Li           2021-03-22  1905  		ceph_update_write_metrics(&fsc->mdsc->metric, req->r_start_latency,
903f4fec78dd05 Xiubo Li           2021-05-13  1906  					  req->r_end_latency, len, ret);
124e68e7409909 Sage Weil          2009-10-06  1907  		ceph_osdc_put_request(req);
26544c623e741a Jeff Layton        2017-04-04  1908  		if (ret != 0) {
33a5f1709a44ef Jeff Layton        2022-08-25  1909  			dout("sync_write osd write returned %d\n", ret);
33a5f1709a44ef Jeff Layton        2022-08-25  1910  			/* Version changed! Must re-do the rmw cycle */
33a5f1709a44ef Jeff Layton        2022-08-25  1911  			if ((assert_ver && (ret == -ERANGE || ret == -EOVERFLOW)) ||
33a5f1709a44ef Jeff Layton        2022-08-25  1912  			    (!assert_ver && ret == -EEXIST)) {
33a5f1709a44ef Jeff Layton        2022-08-25  1913  				/* We should only ever see this on a rmw */
33a5f1709a44ef Jeff Layton        2022-08-25  1914  				WARN_ON_ONCE(!rmw);
33a5f1709a44ef Jeff Layton        2022-08-25  1915  
33a5f1709a44ef Jeff Layton        2022-08-25  1916  				/* The version should never go backward */
33a5f1709a44ef Jeff Layton        2022-08-25  1917  				WARN_ON_ONCE(ret == -EOVERFLOW);
33a5f1709a44ef Jeff Layton        2022-08-25  1918  
33a5f1709a44ef Jeff Layton        2022-08-25  1919  				*from = saved_iter;
33a5f1709a44ef Jeff Layton        2022-08-25  1920  
33a5f1709a44ef Jeff Layton        2022-08-25  1921  				/* FIXME: limit number of times we loop? */
33a5f1709a44ef Jeff Layton        2022-08-25  1922  				continue;
33a5f1709a44ef Jeff Layton        2022-08-25  1923  			}
26544c623e741a Jeff Layton        2017-04-04  1924  			ceph_set_error_write(ci);
26544c623e741a Jeff Layton        2017-04-04  1925  			break;
26544c623e741a Jeff Layton        2017-04-04  1926  		}
26544c623e741a Jeff Layton        2017-04-04  1927  
26544c623e741a Jeff Layton        2017-04-04  1928  		ceph_clear_error_write(ci);
124e68e7409909 Sage Weil          2009-10-06  1929  		pos += len;
124e68e7409909 Sage Weil          2009-10-06  1930  		written += len;
33a5f1709a44ef Jeff Layton        2022-08-25  1931  		dout("sync_write written %d\n", written);
e8344e668915a7 majianpeng         2013-09-12  1932  		if (pos > i_size_read(inode)) {
124e68e7409909 Sage Weil          2009-10-06  1933  			check_caps = ceph_inode_set_size(inode, pos);
124e68e7409909 Sage Weil          2009-10-06  1934  			if (check_caps)
e8344e668915a7 majianpeng         2013-09-12  1935  				ceph_check_caps(ceph_inode(inode),
e4b731ccb0975f Xiubo Li           2022-10-18  1936  						CHECK_CAPS_AUTHONLY);
e8344e668915a7 majianpeng         2013-09-12  1937  		}
26544c623e741a Jeff Layton        2017-04-04  1938  
e8344e668915a7 majianpeng         2013-09-12  1939  	}
e8344e668915a7 majianpeng         2013-09-12  1940  
e8344e668915a7 majianpeng         2013-09-12  1941  	if (ret != -EOLDSNAPC && written > 0) {
ee7289bfadda5f majianpeng         2013-08-21  1942  		ret = written;
e8344e668915a7 majianpeng         2013-09-12  1943  		iocb->ki_pos = pos;
124e68e7409909 Sage Weil          2009-10-06  1944  	}
33a5f1709a44ef Jeff Layton        2022-08-25  1945  	dout("sync_write returning %d\n", ret);
124e68e7409909 Sage Weil          2009-10-06  1946  	return ret;
124e68e7409909 Sage Weil          2009-10-06  1947  }
124e68e7409909 Sage Weil          2009-10-06  1948  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
