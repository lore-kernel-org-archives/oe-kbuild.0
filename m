Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472FA39185A
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 07:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774425091; cv=none; b=H6VpKLHK/tKjhPN14NuPHHihJgiF7UDwkL9h/cUJRUCONFNffqzgEh8L2q1qDwhNZ55eAm3Dc0X5/aV1fxrcs06daFLIs/nhQS6+UHjRnhDhUeHFvA3gbLzNbC13D2FsxysFDTPdOvGGc3I42+qRzvPRMMtXA71P7xth9trHOqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774425091; c=relaxed/simple;
	bh=9C2NYCRQql5RFeYMJFtTpJfjIaPKZqHlv+48QunHHHQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LRol5V0+ivb08HG4tUdV0wszHYWUJ6WaKB9+BjNFOTNV5hoZo1eMKXhLkvOj6+33WgILf6E4IVdZwmarqPsyQ+dayqf1a3oiqVFGcW4vrnmk/xVSrLadGSuNORFij6a5G29fKN86qKz+5p0JxJSqzsmVtL9GSYx/ZM6fQYzClps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMBlkCpv; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMBlkCpv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774425086; x=1805961086;
  h=date:from:to:cc:subject:message-id;
  bh=9C2NYCRQql5RFeYMJFtTpJfjIaPKZqHlv+48QunHHHQ=;
  b=UMBlkCpvgBhPYVim06vA8FQqDr3ELqA0g41gWsCO8/MidmRBak0Qmmer
   Vbe036qgqbueejFrnm5v36cjBeOHqUn5KdYaw8Qll2NAvPV8Mi9GH812l
   C2/axRmnBDILAi/g8BL+Ma3djNS/HfiucYpLt7Ofo1sMV1HESN8zj3Pnr
   hDupaOrOvCUyA3SvVm3YBeUCH+0SI+/lz3RUAHj2JNI7kAvVcTPisL0d5
   EKfHSl7/zXEd1cQHshVQFPIZWOdsm2A20DHFWfCurwJn2ED2VMtFx9nue
   9+caAuwdexRkZr9UOomU3ImdVBqF2mngk9D2Z/k4JeAtQYxbJgMJ5+eQB
   Q==;
X-CSE-ConnectionGUID: zaXGEzY/So2vr45Hvp0MjA==
X-CSE-MsgGUID: mNMObgASRKutuxqNBwR39Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="93031930"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="93031930"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 00:51:19 -0700
X-CSE-ConnectionGUID: TLUDOaMsScqn1nJxW3dzEw==
X-CSE-MsgGUID: Vp4uj+M2SIuMMMvTaEEzxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="221709733"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Mar 2026 00:51:18 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5J1H-000000006Qz-3dCC;
	Wed, 25 Mar 2026 07:51:15 +0000
Date: Wed, 25 Mar 2026 15:50:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: security/apparmor/apparmorfs.c:1846 ns_mkdir_op() warn:
 passing zero to 'ERR_PTR'
Message-ID: <202603251533.rkKUQcOQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: NeilBrown <neilb@suse.de>
CC: Christian Brauner <brauner@kernel.org>
CC: Jeff Layton <jlayton@kernel.org>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
commit: 88d5baf69082e5b410296435008329676b687549 Change inode_operations.mkdir to return struct dentry *
date:   1 year, 1 month ago
:::::: branch date: 8 hours ago
:::::: commit date: 1 year, 1 month ago
config: openrisc-randconfig-r073-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251533.rkKUQcOQ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603251533.rkKUQcOQ-lkp@intel.com/

smatch warnings:
security/apparmor/apparmorfs.c:1846 ns_mkdir_op() warn: passing zero to 'ERR_PTR'

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
