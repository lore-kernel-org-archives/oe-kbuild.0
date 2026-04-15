Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E901B23ABA7
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Apr 2026 01:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776217472; cv=none; b=YZH23ZOwxLTFRvpv40YoSFWmtconhCwdVBm0b0tUDDoKiBJb+jYbgEShdzhZB3F6hs1ke6SgNvi3ul79eHJdLN3ixyDkrVClfRse/wRigeIvI4n4HwCyA9YDVZWTksx/JhvGAgc7cK+lDVHe0nWNAqDnk3xL4RbBGShhfOLO600=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776217472; c=relaxed/simple;
	bh=Xc2UJRaFddaxCNCVYEBP7aOnXg7/caLg6DW9A/bT/VI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mUwaccMHOakyunLBM2xoqcLqw842n2QDP+4YEu5EfxM+H/9wZxryKlxM7/M38Xcrdxm6/jJ5WFWmvMCs4nrWqTF9EyoaCz5qoXKBpz8d4BUWzpTKZIsgwBtFX+Z19dbZGCmDEC5tA+oT0tEQx/Qjm0aqEMZvc2UIbjkyBvMbPpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gfgGgQEp; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gfgGgQEp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776217470; x=1807753470;
  h=date:from:to:cc:subject:message-id;
  bh=Xc2UJRaFddaxCNCVYEBP7aOnXg7/caLg6DW9A/bT/VI=;
  b=gfgGgQEpT4AHdy1x8mChhgPPprYsIc/U84tKglN4GOtL/6SNlmFgozIX
   hWXTXiIU9HmnSjZ5zCu2wqbb9Hc+ND+cmIlThJGnz6FX3zmAIIxRPQ9xT
   09OtxHveLw7/BGAklXBrjzoXvvo90NWaoXMJ05UJi44K6dlUf97OfgfR2
   lBkGeftQ/JDZ+mlfcVPNmP+Qvy5dK0ZIr3LV8Z4bTeiP/1g/DuAGCJmh+
   ooZnmrO3TUyMSoMPPj9qZ5QEw/191Amr0mE9CTiODTp+pZwsLm3teIAH5
   G90jRrW7KjgjXbkqZQSdDjbC6A+h4JM1g31RpKzEjU9ldJ8FLbctSgnVh
   Q==;
X-CSE-ConnectionGUID: UweuzIqFQiGqpIs8YiXD3g==
X-CSE-MsgGUID: 8vy0DR4TQFusgDukG2XBxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="88265972"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="88265972"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 18:44:29 -0700
X-CSE-ConnectionGUID: taefVmFLQLW9RCnhFCF+/Q==
X-CSE-MsgGUID: Sp5jBR73QcKmWDFXEXd6Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="268246004"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Apr 2026 18:44:27 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCpIn-0000000023R-1PgX;
	Wed, 15 Apr 2026 01:44:25 +0000
Date: Wed, 15 Apr 2026 09:43:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/ceph/inode.c:1796 ceph_fill_trace() warn: variable
 dereferenced before check 'in' (see line 1700)
Message-ID: <202604150911.nq8wqPBa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>
CC: Ilya Dryomov <idryomov@gmail.com>
CC: Alex Markuze <amarkuze@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e997ac58ad0b47141c62c79cde8356fe5633287a
commit: 98a2850de49c10a1a09642e17978b925f95e6029 ceph: fix potential NULL dereference issue in ceph_fill_trace()
date:   6 months ago
:::::: branch date: 55 minutes ago
:::::: commit date: 6 months ago
config: powerpc64-randconfig-r073-20260415 (https://download.01.org/0day-ci/archive/20260415/202604150911.nq8wqPBa-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 98a2850de49c ("ceph: fix potential NULL dereference issue in ceph_fill_trace()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604150911.nq8wqPBa-lkp@intel.com/

smatch warnings:
fs/ceph/inode.c:1796 ceph_fill_trace() warn: variable dereferenced before check 'in' (see line 1700)

vim +/in +1796 fs/ceph/inode.c

355da1eb7a1f91 Sage Weil          2009-10-06  1552  
355da1eb7a1f91 Sage Weil          2009-10-06  1553  /*
355da1eb7a1f91 Sage Weil          2009-10-06  1554   * Incorporate results into the local cache.  This is either just
355da1eb7a1f91 Sage Weil          2009-10-06  1555   * one inode, or a directory, dentry, and possibly linked-to inode (e.g.,
355da1eb7a1f91 Sage Weil          2009-10-06  1556   * after a lookup).
355da1eb7a1f91 Sage Weil          2009-10-06  1557   *
355da1eb7a1f91 Sage Weil          2009-10-06  1558   * A reply may contain
355da1eb7a1f91 Sage Weil          2009-10-06  1559   *         a directory inode along with a dentry.
355da1eb7a1f91 Sage Weil          2009-10-06  1560   *  and/or a target inode
355da1eb7a1f91 Sage Weil          2009-10-06  1561   *
355da1eb7a1f91 Sage Weil          2009-10-06  1562   * Called with snap_rwsem (read).
355da1eb7a1f91 Sage Weil          2009-10-06  1563   */
f5a03b08045078 Jeff Layton        2017-01-31  1564  int ceph_fill_trace(struct super_block *sb, struct ceph_mds_request *req)
355da1eb7a1f91 Sage Weil          2009-10-06  1565  {
f5a03b08045078 Jeff Layton        2017-01-31  1566  	struct ceph_mds_session *session = req->r_session;
355da1eb7a1f91 Sage Weil          2009-10-06  1567  	struct ceph_mds_reply_info_parsed *rinfo = &req->r_reply_info;
355da1eb7a1f91 Sage Weil          2009-10-06  1568  	struct inode *in = NULL;
f5d55f03973f79 Jeff Layton        2017-01-27  1569  	struct ceph_vino tvino, dvino;
5995d90d2d19f3 Xiubo Li           2023-06-12  1570  	struct ceph_fs_client *fsc = ceph_sb_to_fs_client(sb);
38d46409c4639a Xiubo Li           2023-06-12  1571  	struct ceph_client *cl = fsc->client;
bec324f33d1ed3 Alex Markuze       2025-08-12  1572  	struct inode *parent_dir = NULL;
355da1eb7a1f91 Sage Weil          2009-10-06  1573  	int err = 0;
355da1eb7a1f91 Sage Weil          2009-10-06  1574  
38d46409c4639a Xiubo Li           2023-06-12  1575  	doutc(cl, "%p is_dentry %d is_target %d\n", req,
355da1eb7a1f91 Sage Weil          2009-10-06  1576  	      rinfo->head->is_dentry, rinfo->head->is_target);
355da1eb7a1f91 Sage Weil          2009-10-06  1577  
355da1eb7a1f91 Sage Weil          2009-10-06  1578  	if (!rinfo->head->is_target && !rinfo->head->is_dentry) {
38d46409c4639a Xiubo Li           2023-06-12  1579  		doutc(cl, "reply is empty!\n");
3dd69aabcef3d8 Jeff Layton        2017-01-31  1580  		if (rinfo->head->result == 0 && req->r_parent)
167c9e352deb7e Sage Weil          2010-05-14  1581  			ceph_invalidate_dir_request(req);
355da1eb7a1f91 Sage Weil          2009-10-06  1582  		return 0;
355da1eb7a1f91 Sage Weil          2009-10-06  1583  	}
355da1eb7a1f91 Sage Weil          2009-10-06  1584  
355da1eb7a1f91 Sage Weil          2009-10-06  1585  	if (rinfo->head->is_dentry) {
bec324f33d1ed3 Alex Markuze       2025-08-12  1586  		/*
bec324f33d1ed3 Alex Markuze       2025-08-12  1587  		 * r_parent may be stale, in cases when R_PARENT_LOCKED is not set,
bec324f33d1ed3 Alex Markuze       2025-08-12  1588  		 * so we need to get the correct inode
bec324f33d1ed3 Alex Markuze       2025-08-12  1589  		 */
bec324f33d1ed3 Alex Markuze       2025-08-12  1590  		parent_dir = ceph_get_reply_dir(sb, req->r_parent, rinfo);
bec324f33d1ed3 Alex Markuze       2025-08-12  1591  		if (unlikely(IS_ERR(parent_dir))) {
bec324f33d1ed3 Alex Markuze       2025-08-12  1592  			err = PTR_ERR(parent_dir);
bec324f33d1ed3 Alex Markuze       2025-08-12  1593  			goto done;
bec324f33d1ed3 Alex Markuze       2025-08-12  1594  		}
bec324f33d1ed3 Alex Markuze       2025-08-12  1595  		if (parent_dir) {
bec324f33d1ed3 Alex Markuze       2025-08-12  1596  			err = ceph_fill_inode(parent_dir, NULL, &rinfo->diri,
966c716018de1c Jeff Layton        2019-12-05  1597  					      rinfo->dirfrag, session, -1,
5b1daecd59f95e Sage Weil          2010-01-25  1598  					      &req->r_caps_reservation);
5b1daecd59f95e Sage Weil          2010-01-25  1599  			if (err < 0)
19913b4eac4a23 Yan, Zheng         2014-03-06  1600  				goto done;
6c5e50fa614fea Sage Weil          2012-08-21  1601  		} else {
6c5e50fa614fea Sage Weil          2012-08-21  1602  			WARN_ON_ONCE(1);
6c5e50fa614fea Sage Weil          2012-08-21  1603  		}
19913b4eac4a23 Yan, Zheng         2014-03-06  1604  
bec324f33d1ed3 Alex Markuze       2025-08-12  1605  		if (parent_dir && req->r_op == CEPH_MDS_OP_LOOKUPNAME &&
74c9e6bf4c888e Yan, Zheng         2018-09-28  1606  		    test_bit(CEPH_MDS_R_PARENT_LOCKED, &req->r_req_flags) &&
74c9e6bf4c888e Yan, Zheng         2018-09-28  1607  		    !test_bit(CEPH_MDS_R_ABORTED, &req->r_req_flags)) {
855290962c5581 Jeff Layton        2020-08-10  1608  			bool is_nokey = false;
19913b4eac4a23 Yan, Zheng         2014-03-06  1609  			struct qstr dname;
19913b4eac4a23 Yan, Zheng         2014-03-06  1610  			struct dentry *dn, *parent;
855290962c5581 Jeff Layton        2020-08-10  1611  			struct fscrypt_str oname = FSTR_INIT(NULL, 0);
bec324f33d1ed3 Alex Markuze       2025-08-12  1612  			struct ceph_fname fname = { .dir	= parent_dir,
855290962c5581 Jeff Layton        2020-08-10  1613  						    .name	= rinfo->dname,
855290962c5581 Jeff Layton        2020-08-10  1614  						    .ctext	= rinfo->altname,
855290962c5581 Jeff Layton        2020-08-10  1615  						    .name_len	= rinfo->dname_len,
855290962c5581 Jeff Layton        2020-08-10  1616  						    .ctext_len	= rinfo->altname_len };
19913b4eac4a23 Yan, Zheng         2014-03-06  1617  
19913b4eac4a23 Yan, Zheng         2014-03-06  1618  			BUG_ON(!rinfo->head->is_target);
19913b4eac4a23 Yan, Zheng         2014-03-06  1619  			BUG_ON(req->r_dentry);
19913b4eac4a23 Yan, Zheng         2014-03-06  1620  
bec324f33d1ed3 Alex Markuze       2025-08-12  1621  			parent = d_find_any_alias(parent_dir);
19913b4eac4a23 Yan, Zheng         2014-03-06  1622  			BUG_ON(!parent);
19913b4eac4a23 Yan, Zheng         2014-03-06  1623  
bec324f33d1ed3 Alex Markuze       2025-08-12  1624  			err = ceph_fname_alloc_buffer(parent_dir, &oname);
855290962c5581 Jeff Layton        2020-08-10  1625  			if (err < 0) {
855290962c5581 Jeff Layton        2020-08-10  1626  				dput(parent);
855290962c5581 Jeff Layton        2020-08-10  1627  				goto done;
855290962c5581 Jeff Layton        2020-08-10  1628  			}
855290962c5581 Jeff Layton        2020-08-10  1629  
855290962c5581 Jeff Layton        2020-08-10  1630  			err = ceph_fname_to_usr(&fname, NULL, &oname, &is_nokey);
855290962c5581 Jeff Layton        2020-08-10  1631  			if (err < 0) {
855290962c5581 Jeff Layton        2020-08-10  1632  				dput(parent);
bec324f33d1ed3 Alex Markuze       2025-08-12  1633  				ceph_fname_free_buffer(parent_dir, &oname);
855290962c5581 Jeff Layton        2020-08-10  1634  				goto done;
855290962c5581 Jeff Layton        2020-08-10  1635  			}
855290962c5581 Jeff Layton        2020-08-10  1636  			dname.name = oname.name;
855290962c5581 Jeff Layton        2020-08-10  1637  			dname.len = oname.len;
8387ff2577eb9e Linus Torvalds     2016-06-10  1638  			dname.hash = full_name_hash(parent, dname.name, dname.len);
f5d55f03973f79 Jeff Layton        2017-01-27  1639  			tvino.ino = le64_to_cpu(rinfo->targeti.in->ino);
f5d55f03973f79 Jeff Layton        2017-01-27  1640  			tvino.snap = le64_to_cpu(rinfo->targeti.in->snapid);
19913b4eac4a23 Yan, Zheng         2014-03-06  1641  retry_lookup:
19913b4eac4a23 Yan, Zheng         2014-03-06  1642  			dn = d_lookup(parent, &dname);
38d46409c4639a Xiubo Li           2023-06-12  1643  			doutc(cl, "d_lookup on parent=%p name=%.*s got %p\n",
19913b4eac4a23 Yan, Zheng         2014-03-06  1644  			      parent, dname.len, dname.name, dn);
19913b4eac4a23 Yan, Zheng         2014-03-06  1645  
19913b4eac4a23 Yan, Zheng         2014-03-06  1646  			if (!dn) {
19913b4eac4a23 Yan, Zheng         2014-03-06  1647  				dn = d_alloc(parent, &dname);
38d46409c4639a Xiubo Li           2023-06-12  1648  				doutc(cl, "d_alloc %p '%.*s' = %p\n", parent,
19913b4eac4a23 Yan, Zheng         2014-03-06  1649  				      dname.len, dname.name, dn);
d37b1d9943d513 Markus Elfring     2017-08-20  1650  				if (!dn) {
19913b4eac4a23 Yan, Zheng         2014-03-06  1651  					dput(parent);
bec324f33d1ed3 Alex Markuze       2025-08-12  1652  					ceph_fname_free_buffer(parent_dir, &oname);
19913b4eac4a23 Yan, Zheng         2014-03-06  1653  					err = -ENOMEM;
19913b4eac4a23 Yan, Zheng         2014-03-06  1654  					goto done;
19913b4eac4a23 Yan, Zheng         2014-03-06  1655  				}
855290962c5581 Jeff Layton        2020-08-10  1656  				if (is_nokey) {
855290962c5581 Jeff Layton        2020-08-10  1657  					spin_lock(&dn->d_lock);
855290962c5581 Jeff Layton        2020-08-10  1658  					dn->d_flags |= DCACHE_NOKEY_NAME;
855290962c5581 Jeff Layton        2020-08-10  1659  					spin_unlock(&dn->d_lock);
855290962c5581 Jeff Layton        2020-08-10  1660  				}
ad5cb123fd0e4d Al Viro            2016-10-28  1661  				err = 0;
2b0143b5c986be David Howells      2015-03-17  1662  			} else if (d_really_is_positive(dn) &&
f5d55f03973f79 Jeff Layton        2017-01-27  1663  				   (ceph_ino(d_inode(dn)) != tvino.ino ||
f5d55f03973f79 Jeff Layton        2017-01-27  1664  				    ceph_snap(d_inode(dn)) != tvino.snap)) {
38d46409c4639a Xiubo Li           2023-06-12  1665  				doutc(cl, " dn %p points to wrong inode %p\n",
2b0143b5c986be David Howells      2015-03-17  1666  				      dn, d_inode(dn));
bec324f33d1ed3 Alex Markuze       2025-08-12  1667  				ceph_dir_clear_ordered(parent_dir);
19913b4eac4a23 Yan, Zheng         2014-03-06  1668  				d_delete(dn);
19913b4eac4a23 Yan, Zheng         2014-03-06  1669  				dput(dn);
19913b4eac4a23 Yan, Zheng         2014-03-06  1670  				goto retry_lookup;
19913b4eac4a23 Yan, Zheng         2014-03-06  1671  			}
bec324f33d1ed3 Alex Markuze       2025-08-12  1672  			ceph_fname_free_buffer(parent_dir, &oname);
19913b4eac4a23 Yan, Zheng         2014-03-06  1673  
19913b4eac4a23 Yan, Zheng         2014-03-06  1674  			req->r_dentry = dn;
19913b4eac4a23 Yan, Zheng         2014-03-06  1675  			dput(parent);
19913b4eac4a23 Yan, Zheng         2014-03-06  1676  		}
5b1daecd59f95e Sage Weil          2010-01-25  1677  	}
5b1daecd59f95e Sage Weil          2010-01-25  1678  
86b58d13134ef1 Yan, Zheng         2013-12-05  1679  	if (rinfo->head->is_target) {
bca9fc14c70fcb Jeff Layton        2020-11-12  1680  		/* Should be filled in by handle_reply */
bca9fc14c70fcb Jeff Layton        2020-11-12  1681  		BUG_ON(!req->r_target_inode);
86b58d13134ef1 Yan, Zheng         2013-12-05  1682  
bca9fc14c70fcb Jeff Layton        2020-11-12  1683  		in = req->r_target_inode;
966c716018de1c Jeff Layton        2019-12-05  1684  		err = ceph_fill_inode(in, req->r_locked_page, &rinfo->targeti,
966c716018de1c Jeff Layton        2019-12-05  1685  				NULL, session,
bc2de10dc4da50 Jeff Layton        2017-02-01  1686  				(!test_bit(CEPH_MDS_R_ABORTED, &req->r_req_flags) &&
3bb48b4142bbf7 Jeff Layton        2019-12-02  1687  				 !test_bit(CEPH_MDS_R_ASYNC, &req->r_req_flags) &&
bc2de10dc4da50 Jeff Layton        2017-02-01  1688  				 rinfo->head->result == 0) ?  req->r_fmode : -1,
86b58d13134ef1 Yan, Zheng         2013-12-05  1689  				&req->r_caps_reservation);
86b58d13134ef1 Yan, Zheng         2013-12-05  1690  		if (err < 0) {
38d46409c4639a Xiubo Li           2023-06-12  1691  			pr_err_client(cl, "badness %p %llx.%llx\n", in,
38d46409c4639a Xiubo Li           2023-06-12  1692  				      ceph_vinop(in));
bca9fc14c70fcb Jeff Layton        2020-11-12  1693  			req->r_target_inode = NULL;
893e456b2c0bae Jeff Layton        2019-12-11  1694  			if (in->i_state & I_NEW)
893e456b2c0bae Jeff Layton        2019-12-11  1695  				discard_new_inode(in);
68cbb8056a4c24 Jeff Layton        2020-11-12  1696  			else
68cbb8056a4c24 Jeff Layton        2020-11-12  1697  				iput(in);
86b58d13134ef1 Yan, Zheng         2013-12-05  1698  			goto done;
86b58d13134ef1 Yan, Zheng         2013-12-05  1699  		}
893e456b2c0bae Jeff Layton        2019-12-11 @1700  		if (in->i_state & I_NEW)
893e456b2c0bae Jeff Layton        2019-12-11  1701  			unlock_new_inode(in);
86b58d13134ef1 Yan, Zheng         2013-12-05  1702  	}
86b58d13134ef1 Yan, Zheng         2013-12-05  1703  
9358c6d4c0264b Sage Weil          2010-03-30  1704  	/*
9358c6d4c0264b Sage Weil          2010-03-30  1705  	 * ignore null lease/binding on snapdir ENOENT, or else we
9358c6d4c0264b Sage Weil          2010-03-30  1706  	 * will have trouble splicing in the virtual snapdir later
9358c6d4c0264b Sage Weil          2010-03-30  1707  	 */
3dd69aabcef3d8 Jeff Layton        2017-01-31  1708  	if (rinfo->head->is_dentry &&
bc2de10dc4da50 Jeff Layton        2017-02-01  1709              !test_bit(CEPH_MDS_R_ABORTED, &req->r_req_flags) &&
3dd69aabcef3d8 Jeff Layton        2017-01-31  1710  	    test_bit(CEPH_MDS_R_PARENT_LOCKED, &req->r_req_flags) &&
9358c6d4c0264b Sage Weil          2010-03-30  1711  	    (rinfo->head->is_target || strncmp(req->r_dentry->d_name.name,
3d14c5d2b6e15c Yehuda Sadeh       2010-04-06  1712  					       fsc->mount_options->snapdir_name,
9358c6d4c0264b Sage Weil          2010-03-30  1713  					       req->r_dentry->d_name.len))) {
355da1eb7a1f91 Sage Weil          2009-10-06  1714  		/*
355da1eb7a1f91 Sage Weil          2009-10-06  1715  		 * lookup link rename   : null -> possibly existing inode
355da1eb7a1f91 Sage Weil          2009-10-06  1716  		 * mknod symlink mkdir  : null -> new inode
355da1eb7a1f91 Sage Weil          2009-10-06  1717  		 * unlink               : linked -> null
355da1eb7a1f91 Sage Weil          2009-10-06  1718  		 */
3dd69aabcef3d8 Jeff Layton        2017-01-31  1719  		struct inode *dir = req->r_parent;
355da1eb7a1f91 Sage Weil          2009-10-06  1720  		struct dentry *dn = req->r_dentry;
355da1eb7a1f91 Sage Weil          2009-10-06  1721  		bool have_dir_cap, have_lease;
355da1eb7a1f91 Sage Weil          2009-10-06  1722  
355da1eb7a1f91 Sage Weil          2009-10-06  1723  		BUG_ON(!dn);
355da1eb7a1f91 Sage Weil          2009-10-06  1724  		BUG_ON(!dir);
2b0143b5c986be David Howells      2015-03-17  1725  		BUG_ON(d_inode(dn->d_parent) != dir);
f5d55f03973f79 Jeff Layton        2017-01-27  1726  
f5d55f03973f79 Jeff Layton        2017-01-27  1727  		dvino.ino = le64_to_cpu(rinfo->diri.in->ino);
f5d55f03973f79 Jeff Layton        2017-01-27  1728  		dvino.snap = le64_to_cpu(rinfo->diri.in->snapid);
f5d55f03973f79 Jeff Layton        2017-01-27  1729  
f5d55f03973f79 Jeff Layton        2017-01-27  1730  		BUG_ON(ceph_ino(dir) != dvino.ino);
f5d55f03973f79 Jeff Layton        2017-01-27  1731  		BUG_ON(ceph_snap(dir) != dvino.snap);
355da1eb7a1f91 Sage Weil          2009-10-06  1732  
355da1eb7a1f91 Sage Weil          2009-10-06  1733  		/* do we have a lease on the whole dir? */
355da1eb7a1f91 Sage Weil          2009-10-06  1734  		have_dir_cap =
355da1eb7a1f91 Sage Weil          2009-10-06  1735  			(le32_to_cpu(rinfo->diri.in->cap.caps) &
355da1eb7a1f91 Sage Weil          2009-10-06  1736  			 CEPH_CAP_FILE_SHARED);
355da1eb7a1f91 Sage Weil          2009-10-06  1737  
355da1eb7a1f91 Sage Weil          2009-10-06  1738  		/* do we have a dn lease? */
355da1eb7a1f91 Sage Weil          2009-10-06  1739  		have_lease = have_dir_cap ||
2f90b852e3ae73 Sage Weil          2011-07-26  1740  			le32_to_cpu(rinfo->dlease->duration_ms);
355da1eb7a1f91 Sage Weil          2009-10-06  1741  		if (!have_lease)
38d46409c4639a Xiubo Li           2023-06-12  1742  			doutc(cl, "no dentry lease or dir cap\n");
355da1eb7a1f91 Sage Weil          2009-10-06  1743  
355da1eb7a1f91 Sage Weil          2009-10-06  1744  		/* rename? */
355da1eb7a1f91 Sage Weil          2009-10-06  1745  		if (req->r_old_dentry && req->r_op == CEPH_MDS_OP_RENAME) {
0a8a70f96fe1bd Yan, Zheng         2014-04-14  1746  			struct inode *olddir = req->r_old_dentry_dir;
0a8a70f96fe1bd Yan, Zheng         2014-04-14  1747  			BUG_ON(!olddir);
0a8a70f96fe1bd Yan, Zheng         2014-04-14  1748  
38d46409c4639a Xiubo Li           2023-06-12  1749  			doutc(cl, " src %p '%pd' dst %p '%pd'\n",
38d46409c4639a Xiubo Li           2023-06-12  1750  			      req->r_old_dentry, req->r_old_dentry, dn, dn);
38d46409c4639a Xiubo Li           2023-06-12  1751  			doutc(cl, "doing d_move %p -> %p\n", req->r_old_dentry, dn);
c10f5e12bafde7 Sage Weil          2010-04-16  1752  
fdd4e15838e59c Yan, Zheng         2015-06-16  1753  			/* d_move screws up sibling dentries' offsets */
fdd4e15838e59c Yan, Zheng         2015-06-16  1754  			ceph_dir_clear_ordered(dir);
fdd4e15838e59c Yan, Zheng         2015-06-16  1755  			ceph_dir_clear_ordered(olddir);
fdd4e15838e59c Yan, Zheng         2015-06-16  1756  
355da1eb7a1f91 Sage Weil          2009-10-06  1757  			d_move(req->r_old_dentry, dn);
38d46409c4639a Xiubo Li           2023-06-12  1758  			doutc(cl, " src %p '%pd' dst %p '%pd'\n",
38d46409c4639a Xiubo Li           2023-06-12  1759  			      req->r_old_dentry, req->r_old_dentry, dn, dn);
81a6cf2d30eac5 Sage Weil          2010-05-14  1760  
c4a29f26d50bea Sage Weil          2009-12-21  1761  			/* ensure target dentry is invalidated, despite
c4a29f26d50bea Sage Weil          2009-12-21  1762  			   rehashing bug in vfs_rename_dir */
81a6cf2d30eac5 Sage Weil          2010-05-14  1763  			ceph_invalidate_dentry_lease(dn);
81a6cf2d30eac5 Sage Weil          2010-05-14  1764  
38d46409c4639a Xiubo Li           2023-06-12  1765  			doutc(cl, "dn %p gets new offset %lld\n",
38d46409c4639a Xiubo Li           2023-06-12  1766  			      req->r_old_dentry,
1cd3935bedccf5 Sage Weil          2010-05-03  1767  			      ceph_dentry(req->r_old_dentry)->offset);
81a6cf2d30eac5 Sage Weil          2010-05-14  1768  
2bf996ac483266 Yan, Zheng         2018-10-25  1769  			/* swap r_dentry and r_old_dentry in case that
2bf996ac483266 Yan, Zheng         2018-10-25  1770  			 * splice_dentry() gets called later. This is safe
2bf996ac483266 Yan, Zheng         2018-10-25  1771  			 * because no other place will use them */
2bf996ac483266 Yan, Zheng         2018-10-25  1772  			req->r_dentry = req->r_old_dentry;
2bf996ac483266 Yan, Zheng         2018-10-25  1773  			req->r_old_dentry = dn;
2bf996ac483266 Yan, Zheng         2018-10-25  1774  			dn = req->r_dentry;
355da1eb7a1f91 Sage Weil          2009-10-06  1775  		}
355da1eb7a1f91 Sage Weil          2009-10-06  1776  
355da1eb7a1f91 Sage Weil          2009-10-06  1777  		/* null dentry? */
355da1eb7a1f91 Sage Weil          2009-10-06  1778  		if (!rinfo->head->is_target) {
38d46409c4639a Xiubo Li           2023-06-12  1779  			doutc(cl, "null dentry\n");
2b0143b5c986be David Howells      2015-03-17  1780  			if (d_really_is_positive(dn)) {
38d46409c4639a Xiubo Li           2023-06-12  1781  				doutc(cl, "d_delete %p\n", dn);
5495c2d04f85da Yan, Zheng         2017-11-27  1782  				ceph_dir_clear_ordered(dir);
355da1eb7a1f91 Sage Weil          2009-10-06  1783  				d_delete(dn);
80d025ffede889 Jeff Layton        2017-01-26  1784  			} else if (have_lease) {
80d025ffede889 Jeff Layton        2017-01-26  1785  				if (d_unhashed(dn))
f8b31710e46c85 Al Viro            2016-03-07  1786  					d_add(dn, NULL);
7ffe4fcea78955 Xiubo Li           2022-03-30  1787  			}
7ffe4fcea78955 Xiubo Li           2022-03-30  1788  
7ffe4fcea78955 Xiubo Li           2022-03-30  1789  			if (!d_unhashed(dn) && have_lease)
543212b3a4a4ab Yan, Zheng         2019-05-22  1790  				update_dentry_lease(dir, dn,
543212b3a4a4ab Yan, Zheng         2019-05-22  1791  						    rinfo->dlease, session,
543212b3a4a4ab Yan, Zheng         2019-05-22  1792  						    req->r_request_started);
355da1eb7a1f91 Sage Weil          2009-10-06  1793  			goto done;
355da1eb7a1f91 Sage Weil          2009-10-06  1794  		}
355da1eb7a1f91 Sage Weil          2009-10-06  1795  
98a2850de49c10 Viacheslav Dubeyko 2025-08-28 @1796  		if (unlikely(!in)) {
98a2850de49c10 Viacheslav Dubeyko 2025-08-28  1797  			err = -EINVAL;
98a2850de49c10 Viacheslav Dubeyko 2025-08-28  1798  			goto done;
98a2850de49c10 Viacheslav Dubeyko 2025-08-28  1799  		}
98a2850de49c10 Viacheslav Dubeyko 2025-08-28  1800  
355da1eb7a1f91 Sage Weil          2009-10-06  1801  		/* attach proper inode */
2b0143b5c986be David Howells      2015-03-17  1802  		if (d_really_is_negative(dn)) {
70db4f3629b347 Yan, Zheng         2014-10-21  1803  			ceph_dir_clear_ordered(dir);
86b58d13134ef1 Yan, Zheng         2013-12-05  1804  			ihold(in);
2bf996ac483266 Yan, Zheng         2018-10-25  1805  			err = splice_dentry(&req->r_dentry, in);
2bf996ac483266 Yan, Zheng         2018-10-25  1806  			if (err < 0)
355da1eb7a1f91 Sage Weil          2009-10-06  1807  				goto done;
2bf996ac483266 Yan, Zheng         2018-10-25  1808  			dn = req->r_dentry;  /* may have spliced */
2b0143b5c986be David Howells      2015-03-17  1809  		} else if (d_really_is_positive(dn) && d_inode(dn) != in) {
38d46409c4639a Xiubo Li           2023-06-12  1810  			doutc(cl, " %p links to %p %llx.%llx, not %llx.%llx\n",
2b0143b5c986be David Howells      2015-03-17  1811  			      dn, d_inode(dn), ceph_vinop(d_inode(dn)),
86b58d13134ef1 Yan, Zheng         2013-12-05  1812  			      ceph_vinop(in));
200fd27c8fa2ba Yan, Zheng         2016-03-17  1813  			d_invalidate(dn);
355da1eb7a1f91 Sage Weil          2009-10-06  1814  			have_lease = false;
355da1eb7a1f91 Sage Weil          2009-10-06  1815  		}
355da1eb7a1f91 Sage Weil          2009-10-06  1816  
f5d55f03973f79 Jeff Layton        2017-01-27  1817  		if (have_lease) {
543212b3a4a4ab Yan, Zheng         2019-05-22  1818  			update_dentry_lease(dir, dn,
543212b3a4a4ab Yan, Zheng         2019-05-22  1819  					    rinfo->dlease, session,
543212b3a4a4ab Yan, Zheng         2019-05-22  1820  					    req->r_request_started);
f5d55f03973f79 Jeff Layton        2017-01-27  1821  		}
38d46409c4639a Xiubo Li           2023-06-12  1822  		doutc(cl, " final dn %p\n", dn);
bc2de10dc4da50 Jeff Layton        2017-02-01  1823  	} else if ((req->r_op == CEPH_MDS_OP_LOOKUPSNAP ||
bc2de10dc4da50 Jeff Layton        2017-02-01  1824  		    req->r_op == CEPH_MDS_OP_MKSNAP) &&
1f08529c84cfec Al Viro            2019-10-29  1825  	           test_bit(CEPH_MDS_R_PARENT_LOCKED, &req->r_req_flags) &&
bc2de10dc4da50 Jeff Layton        2017-02-01  1826  		   !test_bit(CEPH_MDS_R_ABORTED, &req->r_req_flags)) {
3dd69aabcef3d8 Jeff Layton        2017-01-31  1827  		struct inode *dir = req->r_parent;
355da1eb7a1f91 Sage Weil          2009-10-06  1828  
355da1eb7a1f91 Sage Weil          2009-10-06  1829  		/* fill out a snapdir LOOKUPSNAP dentry */
0a8a70f96fe1bd Yan, Zheng         2014-04-14  1830  		BUG_ON(!dir);
0a8a70f96fe1bd Yan, Zheng         2014-04-14  1831  		BUG_ON(ceph_snap(dir) != CEPH_SNAPDIR);
2bf996ac483266 Yan, Zheng         2018-10-25  1832  		BUG_ON(!req->r_dentry);
38d46409c4639a Xiubo Li           2023-06-12  1833  		doutc(cl, " linking snapped dir %p to dn %p\n", in,
38d46409c4639a Xiubo Li           2023-06-12  1834  		      req->r_dentry);
70db4f3629b347 Yan, Zheng         2014-10-21  1835  		ceph_dir_clear_ordered(dir);
98a2850de49c10 Viacheslav Dubeyko 2025-08-28  1836  
98a2850de49c10 Viacheslav Dubeyko 2025-08-28  1837  		if (unlikely(!in)) {
98a2850de49c10 Viacheslav Dubeyko 2025-08-28  1838  			err = -EINVAL;
98a2850de49c10 Viacheslav Dubeyko 2025-08-28  1839  			goto done;
98a2850de49c10 Viacheslav Dubeyko 2025-08-28  1840  		}
98a2850de49c10 Viacheslav Dubeyko 2025-08-28  1841  
86b58d13134ef1 Yan, Zheng         2013-12-05  1842  		ihold(in);
2bf996ac483266 Yan, Zheng         2018-10-25  1843  		err = splice_dentry(&req->r_dentry, in);
2bf996ac483266 Yan, Zheng         2018-10-25  1844  		if (err < 0)
355da1eb7a1f91 Sage Weil          2009-10-06  1845  			goto done;
543212b3a4a4ab Yan, Zheng         2019-05-22  1846  	} else if (rinfo->head->is_dentry && req->r_dentry) {
0039aebfe87129 Yan Zhen           2024-09-05  1847  		/* parent inode is not locked, be careful */
cdde7c43513de7 Jeff Layton        2017-01-27  1848  		struct ceph_vino *ptvino = NULL;
cdde7c43513de7 Jeff Layton        2017-01-27  1849  		dvino.ino = le64_to_cpu(rinfo->diri.in->ino);
cdde7c43513de7 Jeff Layton        2017-01-27  1850  		dvino.snap = le64_to_cpu(rinfo->diri.in->snapid);
cdde7c43513de7 Jeff Layton        2017-01-27  1851  		if (rinfo->head->is_target) {
cdde7c43513de7 Jeff Layton        2017-01-27  1852  			tvino.ino = le64_to_cpu(rinfo->targeti.in->ino);
cdde7c43513de7 Jeff Layton        2017-01-27  1853  			tvino.snap = le64_to_cpu(rinfo->targeti.in->snapid);
cdde7c43513de7 Jeff Layton        2017-01-27  1854  			ptvino = &tvino;
cdde7c43513de7 Jeff Layton        2017-01-27  1855  		}
543212b3a4a4ab Yan, Zheng         2019-05-22  1856  		update_dentry_lease_careful(req->r_dentry, rinfo->dlease,
543212b3a4a4ab Yan, Zheng         2019-05-22  1857  					    session, req->r_request_started,
543212b3a4a4ab Yan, Zheng         2019-05-22  1858  					    rinfo->dname, rinfo->dname_len,
543212b3a4a4ab Yan, Zheng         2019-05-22  1859  					    &dvino, ptvino);
355da1eb7a1f91 Sage Weil          2009-10-06  1860  	}
355da1eb7a1f91 Sage Weil          2009-10-06  1861  done:
bec324f33d1ed3 Alex Markuze       2025-08-12  1862  	/* Drop extra ref from ceph_get_reply_dir() if it returned a new inode */
bec324f33d1ed3 Alex Markuze       2025-08-12  1863  	if (unlikely(!IS_ERR_OR_NULL(parent_dir) && parent_dir != req->r_parent))
bec324f33d1ed3 Alex Markuze       2025-08-12  1864  		iput(parent_dir);
38d46409c4639a Xiubo Li           2023-06-12  1865  	doutc(cl, "done err=%d\n", err);
355da1eb7a1f91 Sage Weil          2009-10-06  1866  	return err;
355da1eb7a1f91 Sage Weil          2009-10-06  1867  }
355da1eb7a1f91 Sage Weil          2009-10-06  1868  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
