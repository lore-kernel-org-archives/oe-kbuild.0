Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF29212D69
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Mar 2025 13:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741008745; cv=none; b=VFa1JsFpAAinsbYvzrsqNT027Yva5VkzXG2n6i4AWQ0uRuFnHKLFD3Wai8bufLSqm2A2KWaBKyzYbbrI02WiVdBwBUFRLO2/f/F+Pgbhwns3a2jPykcS2LDsbYPdPDaHbOC1/RVVtfP7wrExZpkV1zWvca2yrGc6CKIMeu2WF24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741008745; c=relaxed/simple;
	bh=BF/qe3+mj6x+zb5NwfNp9JxmgEUm4uVTQb9ZCxEbLL8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YmgSaY4z9HtnGLf914wcZGbXezvUJKHBgZdxCdP8n1UmSTdYzWTeYLtgxtzOOgwALzb0hg8ezc7coCuQpJ+1eGkEQf5h5Tyh2dHWj6J2IjSyc3+J7sqQDUaaM4PfkKGHqsfAvuUUUAtyz/6qgCsKDT2zNePTwr/OskYJDwQA4Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJlTG+OW; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJlTG+OW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741008743; x=1772544743;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BF/qe3+mj6x+zb5NwfNp9JxmgEUm4uVTQb9ZCxEbLL8=;
  b=jJlTG+OWiYHt41nhYAxctXq4k6Nm74QfG9PofCHUzBbT78sA1kRMUpnM
   zccpB12CLzlQAwGtCLEVtoVDOKPaS/jbd4qgXm6Xtea02weqejGqEKrms
   7U1OD0E9CMgMjw6NXxWNvAkhhGAPs2CkigMWN0lClo10mvEyqQyYPyI2L
   MeWmnY5yjDH88fQ3w3zB64PblwWh1j73fnYctJz51wZcFcAt78G0O/T/l
   ICBiSe1l1kyztZvOp9UA+ztOonMZG8IXTv+fuoLB84p2nlb74oeg7jGBt
   cyMfaZUjAcDjXOVR3vRBjjBznf0Dt97xmGF1dacuyYnG8c07f1SpysWJK
   A==;
X-CSE-ConnectionGUID: jxrjoVwhQXC7vYHl5SQqTQ==
X-CSE-MsgGUID: MF3n+JfhT02qtYZMErwXxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="52521121"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="52521121"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 05:32:22 -0800
X-CSE-ConnectionGUID: 40omd939TliF9skaKYgBig==
X-CSE-MsgGUID: tpS5fzOcQ4SITbF7itxC1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="123003410"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 03 Mar 2025 05:32:21 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tp5u6-000IXe-3A;
	Mon, 03 Mar 2025 13:32:18 +0000
Date: Mon, 3 Mar 2025 21:29:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6276/7719] security/apparmor/apparmorfs.c:1846
 ns_mkdir_op() warn: passing zero to 'ERR_PTR'
Message-ID: <202503032124.M0cVdxdW-lkp@intel.com>
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
TO: NeilBrown <neilb@suse.de>
CC: Christian Brauner <brauner@kernel.org>
CC: Jeff Layton <jlayton@kernel.org>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cd3215bbcb9d4321def93fea6cfad4d5b42b9d1d
commit: 88d5baf69082e5b410296435008329676b687549 [6276/7719] Change inode_operations.mkdir to return struct dentry *
:::::: branch date: 5 hours ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20250303 (https://download.01.org/0day-ci/archive/20250303/202503032124.M0cVdxdW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503032124.M0cVdxdW-lkp@intel.com/

New smatch warnings:
security/apparmor/apparmorfs.c:1846 ns_mkdir_op() warn: passing zero to 'ERR_PTR'
fs/exfat/namei.c:880 exfat_mkdir() warn: passing zero to 'ERR_PTR'
fs/jfs/namei.c:311 jfs_mkdir() warn: passing zero to 'ERR_PTR'
fs/ceph/dir.c:1176 ceph_mkdir() warn: passing zero to 'ERR_PTR'
fs/ocfs2/namei.c:660 ocfs2_mkdir() warn: passing zero to 'ERR_PTR'
fs/ocfs2/dlmfs/dlmfs.c:451 dlmfs_mkdir() warn: passing zero to 'ERR_PTR'

Old smatch warnings:
fs/exfat/namei.c:374 exfat_find_empty_entry() error: uninitialized symbol 'last_clu'.
fs/ceph/dir.c:908 ceph_handle_notrace_create() warn: passing zero to 'PTR_ERR'

vim +/ERR_PTR +1846 security/apparmor/apparmorfs.c

0d259f043f5f60 John Johansen     2013-07-10  1797  
88d5baf69082e5 NeilBrown         2025-02-27  1798  static struct dentry *ns_mkdir_op(struct mnt_idmap *idmap, struct inode *dir,
549c7297717c32 Christian Brauner 2021-01-21  1799  				  struct dentry *dentry, umode_t mode)
4ae47f33354a96 John Johansen     2017-05-26  1800  {
4ae47f33354a96 John Johansen     2017-05-26  1801  	struct aa_ns *ns, *parent;
4ae47f33354a96 John Johansen     2017-05-26  1802  	/* TODO: improve permission check */
637f688dc3dc30 John Johansen     2017-06-09  1803  	struct aa_label *label;
637f688dc3dc30 John Johansen     2017-06-09  1804  	int error;
637f688dc3dc30 John Johansen     2017-06-09  1805  
637f688dc3dc30 John Johansen     2017-06-09  1806  	label = begin_current_label_crit_section();
90c436a64a6e20 John Johansen     2022-09-19  1807  	error = aa_may_manage_policy(current_cred(), label, NULL,
90c436a64a6e20 John Johansen     2022-09-19  1808  				     AA_MAY_LOAD_POLICY);
637f688dc3dc30 John Johansen     2017-06-09  1809  	end_current_label_crit_section(label);
4ae47f33354a96 John Johansen     2017-05-26  1810  	if (error)
88d5baf69082e5 NeilBrown         2025-02-27  1811  		return ERR_PTR(error);
4ae47f33354a96 John Johansen     2017-05-26  1812  
4ae47f33354a96 John Johansen     2017-05-26  1813  	parent = aa_get_ns(dir->i_private);
4ae47f33354a96 John Johansen     2017-05-26  1814  	AA_BUG(d_inode(ns_subns_dir(parent)) != dir);
4ae47f33354a96 John Johansen     2017-05-26  1815  
4ae47f33354a96 John Johansen     2017-05-26  1816  	/* we have to unlock and then relock to get locking order right
4ae47f33354a96 John Johansen     2017-05-26  1817  	 * for pin_fs
4ae47f33354a96 John Johansen     2017-05-26  1818  	 */
4ae47f33354a96 John Johansen     2017-05-26  1819  	inode_unlock(dir);
4ae47f33354a96 John Johansen     2017-05-26  1820  	error = simple_pin_fs(&aafs_ops, &aafs_mnt, &aafs_count);
feb3c766a3ab32 John Johansen     2017-11-20  1821  	mutex_lock_nested(&parent->lock, parent->level);
4ae47f33354a96 John Johansen     2017-05-26  1822  	inode_lock_nested(dir, I_MUTEX_PARENT);
4ae47f33354a96 John Johansen     2017-05-26  1823  	if (error)
4ae47f33354a96 John Johansen     2017-05-26  1824  		goto out;
4ae47f33354a96 John Johansen     2017-05-26  1825  
4ae47f33354a96 John Johansen     2017-05-26  1826  	error = __aafs_setup_d_inode(dir, dentry, mode | S_IFDIR,  NULL,
4ae47f33354a96 John Johansen     2017-05-26  1827  				     NULL, NULL, NULL);
4ae47f33354a96 John Johansen     2017-05-26  1828  	if (error)
4ae47f33354a96 John Johansen     2017-05-26  1829  		goto out_pin;
4ae47f33354a96 John Johansen     2017-05-26  1830  
4ae47f33354a96 John Johansen     2017-05-26  1831  	ns = __aa_find_or_create_ns(parent, READ_ONCE(dentry->d_name.name),
4ae47f33354a96 John Johansen     2017-05-26  1832  				    dentry);
4ae47f33354a96 John Johansen     2017-05-26  1833  	if (IS_ERR(ns)) {
4ae47f33354a96 John Johansen     2017-05-26  1834  		error = PTR_ERR(ns);
4ae47f33354a96 John Johansen     2017-05-26  1835  		ns = NULL;
4ae47f33354a96 John Johansen     2017-05-26  1836  	}
4ae47f33354a96 John Johansen     2017-05-26  1837  
4ae47f33354a96 John Johansen     2017-05-26  1838  	aa_put_ns(ns);		/* list ref remains */
4ae47f33354a96 John Johansen     2017-05-26  1839  out_pin:
4ae47f33354a96 John Johansen     2017-05-26  1840  	if (error)
4ae47f33354a96 John Johansen     2017-05-26  1841  		simple_release_fs(&aafs_mnt, &aafs_count);
4ae47f33354a96 John Johansen     2017-05-26  1842  out:
4ae47f33354a96 John Johansen     2017-05-26  1843  	mutex_unlock(&parent->lock);
4ae47f33354a96 John Johansen     2017-05-26  1844  	aa_put_ns(parent);
4ae47f33354a96 John Johansen     2017-05-26  1845  
88d5baf69082e5 NeilBrown         2025-02-27 @1846  	return ERR_PTR(error);
4ae47f33354a96 John Johansen     2017-05-26  1847  }
4ae47f33354a96 John Johansen     2017-05-26  1848  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
