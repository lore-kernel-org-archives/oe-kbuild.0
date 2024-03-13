Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C82D18F36D
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Mar 2024 16:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710348658; cv=none; b=qWAvQdUcvbl/XhQFrXr9D9zHHvES7zTCTWJJ9v0GyN16GvCI5uXYKvfLP6FPKd3ra5NQmqx2gWo8RvMULnMTdMhtWiS27jpRbilgQKoMGMO7tuMvlxaeS+fQyrBLD4nT3gUnH5SFVlcwm3q5Dm6F9+cg8l78nx13HNB7Mv8ikKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710348658; c=relaxed/simple;
	bh=9OEMPF+hpwq+lIdO66kZo0d/YcVpwaPEXNkDE73INhk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HCUxcJmrjQLs8hOn0VV9UdIRq8IC8KWiLSOkqIOdhUgtkoKofog17tRMUIuEkTwIjcO8qArErWr8eukh3B+h8VzXO4eLU3NPR9ni49c+D+ttuUZi/bx0TCN4oUA7sNDWDWZl/Un0Pa4EiK7shpfx01ctTIsLa1HPc0geG5tYmEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aDyQvrFK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aDyQvrFK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710348655; x=1741884655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9OEMPF+hpwq+lIdO66kZo0d/YcVpwaPEXNkDE73INhk=;
  b=aDyQvrFKfcy8yR4RUIrmTmAgs1DNbDDJvNB0KUqGI7uKl9qHFng9IC+a
   dUK0xEDSkzpz6gnLB8CUtQgCN4N8guKhrD9aFajFtkb1hFBpTnxjRmhz6
   yyE53I6VniL3b1t5YERJcTlJjVcsqi33n5c2SBNJAkImc8ntjNMgDZ4T3
   f9hsSXnBYluuMRAGTPSbh3Q42VOgSpH1pdL/PspR5BEpURzBhvVv+Lj3C
   I9A1/F2XcytQgdARtL3gA9Ih1UFsVeJnqmCLbbG+RTc6qD0y7i88AEstb
   qO1B7qIWqH7pUXznhaoBVZh1z1PklQrRAKt4pu7IHM9W3PVW0T//wBm8T
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="8903939"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="8903939"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 09:49:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="35117391"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Mar 2024 09:49:55 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkRnd-000CZX-1p;
	Wed, 13 Mar 2024 16:49:53 +0000
Date: Thu, 14 Mar 2024 00:48:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [amir73il:fsnotify-perf 6/13]
 fs/notify/fanotify/fanotify_user.c:1922 do_fanotify_mark() error: we
 previously assumed 'inode' could be null (see line 1917)
Message-ID: <202403140017.KgX2XSDr-lkp@intel.com>
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
TO: Amir Goldstein <amir73il@gmail.com>

tree:   https://github.com/amir73il/linux fsnotify-perf
head:   832f0a8faac8a7e80f703b67ad35d213b8397f5b
commit: e24a533738bdfe4e00f6803baf639a22cd548249 [6/13] fanotify: merge two checks regarding add of ignore mark
:::::: branch date: 2 days ago
:::::: commit date: 7 days ago
config: i386-randconfig-141-20240308 (https://download.01.org/0day-ci/archive/20240314/202403140017.KgX2XSDr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403140017.KgX2XSDr-lkp@intel.com/

New smatch warnings:
fs/notify/fanotify/fanotify_user.c:1922 do_fanotify_mark() error: we previously assumed 'inode' could be null (see line 1917)

Old smatch warnings:
fs/notify/fanotify/fanotify_user.c:461 copy_fid_info_to_user() error: we previously assumed 'fh' could be null (see line 420)
fs/notify/fanotify/fanotify_user.c:1941 do_fanotify_mark() error: we previously assumed 'mnt' could be null (see line 1922)

vim +/inode +1922 fs/notify/fanotify/fanotify_user.c

0b3b094ac9a7bb Jan Kara                2019-05-15  1726  
183caa3c8668e9 Dominik Brodowski       2018-03-17  1727  static int do_fanotify_mark(int fanotify_fd, unsigned int flags, __u64 mask,
183caa3c8668e9 Dominik Brodowski       2018-03-17  1728  			    int dfd, const char  __user *pathname)
bbaa4168b2d2d8 Eric Paris              2009-12-17  1729  {
0ff21db9fcc390 Eric Paris              2009-12-17  1730  	struct inode *inode = NULL;
0ff21db9fcc390 Eric Paris              2009-12-17  1731  	struct vfsmount *mnt = NULL;
2a3edf86040a7e Eric Paris              2009-12-17  1732  	struct fsnotify_group *group;
2903ff019b346a Al Viro                 2012-08-28  1733  	struct fd f;
2a3edf86040a7e Eric Paris              2009-12-17  1734  	struct path path;
30ad1938326bf9 Amir Goldstein          2023-11-30  1735  	struct fan_fsid __fsid, *fsid = NULL;
bdd5a46fe30653 Amir Goldstein          2018-10-04  1736  	u32 valid_mask = FANOTIFY_EVENTS | FANOTIFY_EVENT_FLAGS;
23c9deeb3285d3 Amir Goldstein          2018-10-04  1737  	unsigned int mark_type = flags & FANOTIFY_MARK_TYPE_BITS;
8afd7215aa97f8 Amir Goldstein          2022-06-29  1738  	unsigned int mark_cmd = flags & FANOTIFY_MARK_CMD_BITS;
e252f2ed1c8c6c Amir Goldstein          2022-06-29  1739  	unsigned int ignore = flags & FANOTIFY_MARK_IGNORE_BITS;
d809daf1b6add5 Amir Goldstein          2020-07-16  1740  	unsigned int obj_type, fid_mode;
85af5d9258cc58 Amir Goldstein          2020-07-16  1741  	u32 umask = 0;
2903ff019b346a Al Viro                 2012-08-28  1742  	int ret;
2a3edf86040a7e Eric Paris              2009-12-17  1743  
2a3edf86040a7e Eric Paris              2009-12-17  1744  	pr_debug("%s: fanotify_fd=%d flags=%x dfd=%d pathname=%p mask=%llx\n",
2a3edf86040a7e Eric Paris              2009-12-17  1745  		 __func__, fanotify_fd, flags, dfd, pathname, mask);
2a3edf86040a7e Eric Paris              2009-12-17  1746  
2a3edf86040a7e Eric Paris              2009-12-17  1747  	/* we only use the lower 32 bits as of right now. */
22d483b9986320 Christian Brauner       2021-03-25  1748  	if (upper_32_bits(mask))
2a3edf86040a7e Eric Paris              2009-12-17  1749  		return -EINVAL;
2a3edf86040a7e Eric Paris              2009-12-17  1750  
23c9deeb3285d3 Amir Goldstein          2018-10-04  1751  	if (flags & ~FANOTIFY_MARK_FLAGS)
88380fe66e0ac2 Andreas Gruenbacher     2009-12-17  1752  		return -EINVAL;
d54f4fba889b20 Amir Goldstein          2018-09-01  1753  
d54f4fba889b20 Amir Goldstein          2018-09-01  1754  	switch (mark_type) {
d54f4fba889b20 Amir Goldstein          2018-09-01  1755  	case FAN_MARK_INODE:
ac5656d8a4cdd9 Aaron Goidel            2019-08-12  1756  		obj_type = FSNOTIFY_OBJ_TYPE_INODE;
ac5656d8a4cdd9 Aaron Goidel            2019-08-12  1757  		break;
d54f4fba889b20 Amir Goldstein          2018-09-01  1758  	case FAN_MARK_MOUNT:
ac5656d8a4cdd9 Aaron Goidel            2019-08-12  1759  		obj_type = FSNOTIFY_OBJ_TYPE_VFSMOUNT;
ac5656d8a4cdd9 Aaron Goidel            2019-08-12  1760  		break;
d54f4fba889b20 Amir Goldstein          2018-09-01  1761  	case FAN_MARK_FILESYSTEM:
ac5656d8a4cdd9 Aaron Goidel            2019-08-12  1762  		obj_type = FSNOTIFY_OBJ_TYPE_SB;
d54f4fba889b20 Amir Goldstein          2018-09-01  1763  		break;
d54f4fba889b20 Amir Goldstein          2018-09-01  1764  	default:
d54f4fba889b20 Amir Goldstein          2018-09-01  1765  		return -EINVAL;
d54f4fba889b20 Amir Goldstein          2018-09-01  1766  	}
d54f4fba889b20 Amir Goldstein          2018-09-01  1767  
8afd7215aa97f8 Amir Goldstein          2022-06-29  1768  	switch (mark_cmd) {
df561f6688fef7 Gustavo A. R. Silva     2020-08-23  1769  	case FAN_MARK_ADD:
88380fe66e0ac2 Andreas Gruenbacher     2009-12-17  1770  	case FAN_MARK_REMOVE:
1734dee4e3a296 Lino Sanfilippo         2010-11-22  1771  		if (!mask)
1734dee4e3a296 Lino Sanfilippo         2010-11-22  1772  			return -EINVAL;
cc299a98eb13a9 Heinrich Schuchardt     2014-06-04  1773  		break;
4d92604cc90aa1 Eric Paris              2009-12-17  1774  	case FAN_MARK_FLUSH:
23c9deeb3285d3 Amir Goldstein          2018-10-04  1775  		if (flags & ~(FANOTIFY_MARK_TYPE_BITS | FAN_MARK_FLUSH))
cc299a98eb13a9 Heinrich Schuchardt     2014-06-04  1776  			return -EINVAL;
88380fe66e0ac2 Andreas Gruenbacher     2009-12-17  1777  		break;
88380fe66e0ac2 Andreas Gruenbacher     2009-12-17  1778  	default:
88380fe66e0ac2 Andreas Gruenbacher     2009-12-17  1779  		return -EINVAL;
88380fe66e0ac2 Andreas Gruenbacher     2009-12-17  1780  	}
8fcd65280abc46 Eric Paris              2010-10-28  1781  
6685df31255493 Miklos Szeredi          2017-10-30  1782  	if (IS_ENABLED(CONFIG_FANOTIFY_ACCESS_PERMISSIONS))
23c9deeb3285d3 Amir Goldstein          2018-10-04  1783  		valid_mask |= FANOTIFY_PERM_EVENTS;
6685df31255493 Miklos Szeredi          2017-10-30  1784  
6685df31255493 Miklos Szeredi          2017-10-30  1785  	if (mask & ~valid_mask)
2a3edf86040a7e Eric Paris              2009-12-17  1786  		return -EINVAL;
2a3edf86040a7e Eric Paris              2009-12-17  1787  
e252f2ed1c8c6c Amir Goldstein          2022-06-29  1788  
e252f2ed1c8c6c Amir Goldstein          2022-06-29  1789  	/* We don't allow FAN_MARK_IGNORE & FAN_MARK_IGNORED_MASK together */
e252f2ed1c8c6c Amir Goldstein          2022-06-29  1790  	if (ignore == (FAN_MARK_IGNORE | FAN_MARK_IGNORED_MASK))
e252f2ed1c8c6c Amir Goldstein          2022-06-29  1791  		return -EINVAL;
e252f2ed1c8c6c Amir Goldstein          2022-06-29  1792  
31a371e419c885 Amir Goldstein          2022-06-29  1793  	/*
31a371e419c885 Amir Goldstein          2022-06-29  1794  	 * Event flags (FAN_ONDIR, FAN_EVENT_ON_CHILD) have no effect with
31a371e419c885 Amir Goldstein          2022-06-29  1795  	 * FAN_MARK_IGNORED_MASK.
31a371e419c885 Amir Goldstein          2022-06-29  1796  	 */
e252f2ed1c8c6c Amir Goldstein          2022-06-29  1797  	if (ignore == FAN_MARK_IGNORED_MASK) {
3ef866536645ce Amir Goldstein          2020-07-16  1798  		mask &= ~FANOTIFY_EVENT_FLAGS;
e252f2ed1c8c6c Amir Goldstein          2022-06-29  1799  		umask = FANOTIFY_EVENT_FLAGS;
e252f2ed1c8c6c Amir Goldstein          2022-06-29  1800  	}
3ef866536645ce Amir Goldstein          2020-07-16  1801  
2903ff019b346a Al Viro                 2012-08-28  1802  	f = fdget(fanotify_fd);
2903ff019b346a Al Viro                 2012-08-28  1803  	if (unlikely(!f.file))
2a3edf86040a7e Eric Paris              2009-12-17  1804  		return -EBADF;
2a3edf86040a7e Eric Paris              2009-12-17  1805  
2a3edf86040a7e Eric Paris              2009-12-17  1806  	/* verify that this is indeed an fanotify instance */
2a3edf86040a7e Eric Paris              2009-12-17  1807  	ret = -EINVAL;
2903ff019b346a Al Viro                 2012-08-28  1808  	if (unlikely(f.file->f_op != &fanotify_fops))
2a3edf86040a7e Eric Paris              2009-12-17  1809  		goto fput_and_out;
2903ff019b346a Al Viro                 2012-08-28  1810  	group = f.file->private_data;
4231a23530a30e Eric Paris              2010-10-28  1811  
7cea2a3c505e87 Amir Goldstein          2021-03-04  1812  	/*
a8b98c808eab3e Amir Goldstein          2021-05-24  1813  	 * An unprivileged user is not allowed to setup mount nor filesystem
a8b98c808eab3e Amir Goldstein          2021-05-24  1814  	 * marks.  This also includes setting up such marks by a group that
a8b98c808eab3e Amir Goldstein          2021-05-24  1815  	 * was initialized by an unprivileged user.
7cea2a3c505e87 Amir Goldstein          2021-03-04  1816  	 */
7cea2a3c505e87 Amir Goldstein          2021-03-04  1817  	ret = -EPERM;
a8b98c808eab3e Amir Goldstein          2021-05-24  1818  	if ((!capable(CAP_SYS_ADMIN) ||
a8b98c808eab3e Amir Goldstein          2021-05-24  1819  	     FAN_GROUP_FLAG(group, FANOTIFY_UNPRIV)) &&
7cea2a3c505e87 Amir Goldstein          2021-03-04  1820  	    mark_type != FAN_MARK_INODE)
7cea2a3c505e87 Amir Goldstein          2021-03-04  1821  		goto fput_and_out;
7cea2a3c505e87 Amir Goldstein          2021-03-04  1822  
4231a23530a30e Eric Paris              2010-10-28  1823  	/*
4231a23530a30e Eric Paris              2010-10-28  1824  	 * group->priority == FS_PRIO_0 == FAN_CLASS_NOTIF.  These are not
4231a23530a30e Eric Paris              2010-10-28  1825  	 * allowed to set permissions events.
4231a23530a30e Eric Paris              2010-10-28  1826  	 */
4231a23530a30e Eric Paris              2010-10-28  1827  	ret = -EINVAL;
23c9deeb3285d3 Amir Goldstein          2018-10-04  1828  	if (mask & FANOTIFY_PERM_EVENTS &&
4231a23530a30e Eric Paris              2010-10-28  1829  	    group->priority == FS_PRIO_0)
4231a23530a30e Eric Paris              2010-10-28  1830  		goto fput_and_out;
2a3edf86040a7e Eric Paris              2009-12-17  1831  
9709bd548f11a0 Gabriel Krisman Bertazi 2021-10-25  1832  	if (mask & FAN_FS_ERROR &&
9709bd548f11a0 Gabriel Krisman Bertazi 2021-10-25  1833  	    mark_type != FAN_MARK_FILESYSTEM)
9709bd548f11a0 Gabriel Krisman Bertazi 2021-10-25  1834  		goto fput_and_out;
9709bd548f11a0 Gabriel Krisman Bertazi 2021-10-25  1835  
7d5e005d982527 Amir Goldstein          2022-04-22  1836  	/*
7d5e005d982527 Amir Goldstein          2022-04-22  1837  	 * Evictable is only relevant for inode marks, because only inode object
7d5e005d982527 Amir Goldstein          2022-04-22  1838  	 * can be evicted on memory pressure.
7d5e005d982527 Amir Goldstein          2022-04-22  1839  	 */
7d5e005d982527 Amir Goldstein          2022-04-22  1840  	if (flags & FAN_MARK_EVICTABLE &&
7d5e005d982527 Amir Goldstein          2022-04-22  1841  	     mark_type != FAN_MARK_INODE)
7d5e005d982527 Amir Goldstein          2022-04-22  1842  		goto fput_and_out;
7d5e005d982527 Amir Goldstein          2022-04-22  1843  
235328d1fa4251 Amir Goldstein          2019-01-10  1844  	/*
4fe595cf1c80e7 Gabriel Krisman Bertazi 2021-10-25  1845  	 * Events that do not carry enough information to report
4fe595cf1c80e7 Gabriel Krisman Bertazi 2021-10-25  1846  	 * event->fd require a group that supports reporting fid.  Those
4fe595cf1c80e7 Gabriel Krisman Bertazi 2021-10-25  1847  	 * events are not supported on a mount mark, because they do not
4fe595cf1c80e7 Gabriel Krisman Bertazi 2021-10-25  1848  	 * carry enough information (i.e. path) to be filtered by mount
4fe595cf1c80e7 Gabriel Krisman Bertazi 2021-10-25  1849  	 * point.
235328d1fa4251 Amir Goldstein          2019-01-10  1850  	 */
d809daf1b6add5 Amir Goldstein          2020-07-16  1851  	fid_mode = FAN_GROUP_FLAG(group, FANOTIFY_FID_BITS);
4fe595cf1c80e7 Gabriel Krisman Bertazi 2021-10-25  1852  	if (mask & ~(FANOTIFY_FD_EVENTS|FANOTIFY_EVENT_FLAGS) &&
d809daf1b6add5 Amir Goldstein          2020-07-16  1853  	    (!fid_mode || mark_type == FAN_MARK_MOUNT))
235328d1fa4251 Amir Goldstein          2019-01-10  1854  		goto fput_and_out;
235328d1fa4251 Amir Goldstein          2019-01-10  1855  
8cc3b1ccd930fe Amir Goldstein          2021-11-29  1856  	/*
8cc3b1ccd930fe Amir Goldstein          2021-11-29  1857  	 * FAN_RENAME uses special info type records to report the old and
8cc3b1ccd930fe Amir Goldstein          2021-11-29  1858  	 * new parent+name.  Reporting only old and new parent id is less
8cc3b1ccd930fe Amir Goldstein          2021-11-29  1859  	 * useful and was not implemented.
8cc3b1ccd930fe Amir Goldstein          2021-11-29  1860  	 */
8cc3b1ccd930fe Amir Goldstein          2021-11-29  1861  	if (mask & FAN_RENAME && !(fid_mode & FAN_REPORT_NAME))
8cc3b1ccd930fe Amir Goldstein          2021-11-29  1862  		goto fput_and_out;
8cc3b1ccd930fe Amir Goldstein          2021-11-29  1863  
8afd7215aa97f8 Amir Goldstein          2022-06-29  1864  	if (mark_cmd == FAN_MARK_FLUSH) {
0a8dd2db579f7a Heinrich Schuchardt     2014-06-04  1865  		ret = 0;
d54f4fba889b20 Amir Goldstein          2018-09-01  1866  		if (mark_type == FAN_MARK_MOUNT)
0a8dd2db579f7a Heinrich Schuchardt     2014-06-04  1867  			fsnotify_clear_vfsmount_marks_by_group(group);
d54f4fba889b20 Amir Goldstein          2018-09-01  1868  		else if (mark_type == FAN_MARK_FILESYSTEM)
d54f4fba889b20 Amir Goldstein          2018-09-01  1869  			fsnotify_clear_sb_marks_by_group(group);
0a8dd2db579f7a Heinrich Schuchardt     2014-06-04  1870  		else
0a8dd2db579f7a Heinrich Schuchardt     2014-06-04  1871  			fsnotify_clear_inode_marks_by_group(group);
0a8dd2db579f7a Heinrich Schuchardt     2014-06-04  1872  		goto fput_and_out;
0a8dd2db579f7a Heinrich Schuchardt     2014-06-04  1873  	}
0a8dd2db579f7a Heinrich Schuchardt     2014-06-04  1874  
ac5656d8a4cdd9 Aaron Goidel            2019-08-12  1875  	ret = fanotify_find_path(dfd, pathname, &path, flags,
ac5656d8a4cdd9 Aaron Goidel            2019-08-12  1876  			(mask & ALL_FSNOTIFY_EVENTS), obj_type);
2a3edf86040a7e Eric Paris              2009-12-17  1877  	if (ret)
2a3edf86040a7e Eric Paris              2009-12-17  1878  		goto fput_and_out;
2a3edf86040a7e Eric Paris              2009-12-17  1879  
8afd7215aa97f8 Amir Goldstein          2022-06-29  1880  	if (mark_cmd == FAN_MARK_ADD) {
8698e3bab4dd79 Amir Goldstein          2022-06-27  1881  		ret = fanotify_events_supported(group, &path, mask, flags);
0b3b094ac9a7bb Jan Kara                2019-05-15  1882  		if (ret)
0b3b094ac9a7bb Jan Kara                2019-05-15  1883  			goto path_put_and_out;
0b3b094ac9a7bb Jan Kara                2019-05-15  1884  	}
0b3b094ac9a7bb Jan Kara                2019-05-15  1885  
d809daf1b6add5 Amir Goldstein          2020-07-16  1886  	if (fid_mode) {
30ad1938326bf9 Amir Goldstein          2023-11-30  1887  		ret = fanotify_test_fsid(path.dentry, flags, &__fsid);
8299212cbdb01a Gabriel Krisman Bertazi 2021-10-25  1888  		if (ret)
8299212cbdb01a Gabriel Krisman Bertazi 2021-10-25  1889  			goto path_put_and_out;
8299212cbdb01a Gabriel Krisman Bertazi 2021-10-25  1890  
97ac489775f26a Amir Goldstein          2023-10-18  1891  		ret = fanotify_test_fid(path.dentry, flags);
a8b13aa20afb69 Amir Goldstein          2019-01-10  1892  		if (ret)
a8b13aa20afb69 Amir Goldstein          2019-01-10  1893  			goto path_put_and_out;
77115225acc67d Amir Goldstein          2019-01-10  1894  
73072283a249c7 Amir Goldstein          2019-01-10  1895  		fsid = &__fsid;
a8b13aa20afb69 Amir Goldstein          2019-01-10  1896  	}
a8b13aa20afb69 Amir Goldstein          2019-01-10  1897  
2a3edf86040a7e Eric Paris              2009-12-17  1898  	/* inode held in place by reference to path; group by fget on fd */
d54f4fba889b20 Amir Goldstein          2018-09-01  1899  	if (mark_type == FAN_MARK_INODE)
2a3edf86040a7e Eric Paris              2009-12-17  1900  		inode = path.dentry->d_inode;
0ff21db9fcc390 Eric Paris              2009-12-17  1901  	else
0ff21db9fcc390 Eric Paris              2009-12-17  1902  		mnt = path.mnt;
2a3edf86040a7e Eric Paris              2009-12-17  1903  
e24a533738bdfe Amir Goldstein          2024-03-06  1904  	/*
e24a533738bdfe Amir Goldstein          2024-03-06  1905  	 * If some other task has this inode open for write we should not add
e24a533738bdfe Amir Goldstein          2024-03-06  1906  	 * an ignore mask, unless that ignore mask is supposed to survive
e24a533738bdfe Amir Goldstein          2024-03-06  1907  	 * modification changes anyway.
e24a533738bdfe Amir Goldstein          2024-03-06  1908  	 */
e24a533738bdfe Amir Goldstein          2024-03-06  1909  	if (mark_cmd == FAN_MARK_ADD && (flags & FANOTIFY_MARK_IGNORE_BITS) &&
e24a533738bdfe Amir Goldstein          2024-03-06  1910  	    !(flags & FAN_MARK_IGNORED_SURV_MODIFY)) {
e252f2ed1c8c6c Amir Goldstein          2022-06-29  1911  		ret = mnt ? -EINVAL : -EISDIR;
e252f2ed1c8c6c Amir Goldstein          2022-06-29  1912  		/* FAN_MARK_IGNORE requires SURV_MODIFY for sb/mount/dir marks */
e24a533738bdfe Amir Goldstein          2024-03-06  1913  		if (ignore == FAN_MARK_IGNORE &&
e24a533738bdfe Amir Goldstein          2024-03-06  1914  		    (mnt || S_ISDIR(inode->i_mode)))
e252f2ed1c8c6c Amir Goldstein          2022-06-29  1915  			goto path_put_and_out;
e252f2ed1c8c6c Amir Goldstein          2022-06-29  1916  
e24a533738bdfe Amir Goldstein          2024-03-06 @1917  		if (inode && inode_is_open_for_write(inode))
e24a533738bdfe Amir Goldstein          2024-03-06  1918  			return 0;
e24a533738bdfe Amir Goldstein          2024-03-06  1919  	}
e24a533738bdfe Amir Goldstein          2024-03-06  1920  
85af5d9258cc58 Amir Goldstein          2020-07-16  1921  	/* Mask out FAN_EVENT_ON_CHILD flag for sb/mount/non-dir marks */
85af5d9258cc58 Amir Goldstein          2020-07-16 @1922  	if (mnt || !S_ISDIR(inode->i_mode)) {
85af5d9258cc58 Amir Goldstein          2020-07-16  1923  		mask &= ~FAN_EVENT_ON_CHILD;
85af5d9258cc58 Amir Goldstein          2020-07-16  1924  		umask = FAN_EVENT_ON_CHILD;
5128063739d293 Amir Goldstein          2020-07-16  1925  		/*
5128063739d293 Amir Goldstein          2020-07-16  1926  		 * If group needs to report parent fid, register for getting
5128063739d293 Amir Goldstein          2020-07-16  1927  		 * events with parent/name info for non-directory.
5128063739d293 Amir Goldstein          2020-07-16  1928  		 */
5128063739d293 Amir Goldstein          2020-07-16  1929  		if ((fid_mode & FAN_REPORT_DIR_FID) &&
31a371e419c885 Amir Goldstein          2022-06-29  1930  		    (flags & FAN_MARK_ADD) && !ignore)
5128063739d293 Amir Goldstein          2020-07-16  1931  			mask |= FAN_EVENT_ON_CHILD;
85af5d9258cc58 Amir Goldstein          2020-07-16  1932  	}
85af5d9258cc58 Amir Goldstein          2020-07-16  1933  
2a3edf86040a7e Eric Paris              2009-12-17  1934  	/* create/update an inode mark */
8afd7215aa97f8 Amir Goldstein          2022-06-29  1935  	switch (mark_cmd) {
c6223f464927ca Andreas Gruenbacher     2009-12-17  1936  	case FAN_MARK_ADD:
d54f4fba889b20 Amir Goldstein          2018-09-01  1937  		if (mark_type == FAN_MARK_MOUNT)
77115225acc67d Amir Goldstein          2019-01-10  1938  			ret = fanotify_add_vfsmount_mark(group, mnt, mask,
77115225acc67d Amir Goldstein          2019-01-10  1939  							 flags, fsid);
d54f4fba889b20 Amir Goldstein          2018-09-01  1940  		else if (mark_type == FAN_MARK_FILESYSTEM)
77115225acc67d Amir Goldstein          2019-01-10  1941  			ret = fanotify_add_sb_mark(group, mnt->mnt_sb, mask,
77115225acc67d Amir Goldstein          2019-01-10  1942  						   flags, fsid);
0ff21db9fcc390 Eric Paris              2009-12-17  1943  		else
77115225acc67d Amir Goldstein          2019-01-10  1944  			ret = fanotify_add_inode_mark(group, inode, mask,
77115225acc67d Amir Goldstein          2019-01-10  1945  						      flags, fsid);
c6223f464927ca Andreas Gruenbacher     2009-12-17  1946  		break;
c6223f464927ca Andreas Gruenbacher     2009-12-17  1947  	case FAN_MARK_REMOVE:
d54f4fba889b20 Amir Goldstein          2018-09-01  1948  		if (mark_type == FAN_MARK_MOUNT)
77115225acc67d Amir Goldstein          2019-01-10  1949  			ret = fanotify_remove_vfsmount_mark(group, mnt, mask,
85af5d9258cc58 Amir Goldstein          2020-07-16  1950  							    flags, umask);
d54f4fba889b20 Amir Goldstein          2018-09-01  1951  		else if (mark_type == FAN_MARK_FILESYSTEM)
77115225acc67d Amir Goldstein          2019-01-10  1952  			ret = fanotify_remove_sb_mark(group, mnt->mnt_sb, mask,
85af5d9258cc58 Amir Goldstein          2020-07-16  1953  						      flags, umask);
f3640192c0a177 Andreas Gruenbacher     2009-12-17  1954  		else
77115225acc67d Amir Goldstein          2019-01-10  1955  			ret = fanotify_remove_inode_mark(group, inode, mask,
85af5d9258cc58 Amir Goldstein          2020-07-16  1956  							 flags, umask);
c6223f464927ca Andreas Gruenbacher     2009-12-17  1957  		break;
c6223f464927ca Andreas Gruenbacher     2009-12-17  1958  	default:
c6223f464927ca Andreas Gruenbacher     2009-12-17  1959  		ret = -EINVAL;
c6223f464927ca Andreas Gruenbacher     2009-12-17  1960  	}
2a3edf86040a7e Eric Paris              2009-12-17  1961  
a8b13aa20afb69 Amir Goldstein          2019-01-10  1962  path_put_and_out:
2a3edf86040a7e Eric Paris              2009-12-17  1963  	path_put(&path);
2a3edf86040a7e Eric Paris              2009-12-17  1964  fput_and_out:
2903ff019b346a Al Viro                 2012-08-28  1965  	fdput(f);
2a3edf86040a7e Eric Paris              2009-12-17  1966  	return ret;
2a3edf86040a7e Eric Paris              2009-12-17  1967  }
2a3edf86040a7e Eric Paris              2009-12-17  1968  

:::::: The code at line 1922 was first introduced by commit
:::::: 85af5d9258cc5862167c578c63c65ac700a3fa19 fanotify: use FAN_EVENT_ON_CHILD as implicit flag on sb/mount/non-dir marks

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Jan Kara <jack@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
