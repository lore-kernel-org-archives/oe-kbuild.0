Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7A62B9B7
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 20:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766176458; cv=none; b=memwx+qsTugLOAlOqRgmeZFTv1NQQo8huO24CfnohUhBYSuIfyX+TwquOhfO+5rrywVg2YooL5xJ1y1FjmkhP+DnfkPX+nGFlbw83IMuIhoryChAusNiXWkSsgaCf96o+hXGmz2fk2g1kQOljtGiomztYHVXpKHRoJ7yh1/+sr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766176458; c=relaxed/simple;
	bh=etsH/QKSBelSauLf5vmaJ5zoRaTWyzWxFDi3yC70nYU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YXyA/O3i+xLq5Vo+HzHI6oBikKfxWXI8+vIXWV/R7QwrIlR1thYBb4hyKUIiVo9JHYrRAMFhH+SMylPl3XGYXiMZsyBYBtY+tu00oG+EW1t/cINdZkiV7jPohcwnPKUFEkZxofW40SmeKUX8LFCVbY49u6gmatPNI97f+WUyIrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lF+grjR0; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lF+grjR0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766176456; x=1797712456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=etsH/QKSBelSauLf5vmaJ5zoRaTWyzWxFDi3yC70nYU=;
  b=lF+grjR0KOo39DRa0RA9JCeBXn/5TffdxQARUZ0ARndNujQktaFvkgjc
   XzQqjmqr+GfnlDhr9W2+DISo0uAi7WXoA4evVKZX7BaT+Bqf2HSk+VsFk
   V4Lcx5OYPQwJFJIh+yoOAO4r32gHUAQidCOGp49Jyj2alYCyzeVQpOYTF
   w7b3IhAP+9klnCTtxkDzyoUZSm+r3+pGhuqc8TC2fP8ohDwsqmc7b6FeI
   aopoM1LplnoQaSdS8mEZIHFYIN0DI1u+AQCB8edg6Lpg8fTuof0uheMoq
   XOP4wDr5MYylez555zMlqI13IkaS+qzoDWL37dCdOEJRA8c0Vly6f+lda
   g==;
X-CSE-ConnectionGUID: XaseHJQSSMGQ9LpBoh9qxw==
X-CSE-MsgGUID: 5xOv/0obQ6GBu+8J7YksfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="55713299"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="55713299"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 12:34:15 -0800
X-CSE-ConnectionGUID: BuJ4SvBFR3GdfwAzeskOjA==
X-CSE-MsgGUID: nnz7eQGqQyGZ+cAyFF+A+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; 
   d="scan'208";a="204026207"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Dec 2025 12:34:15 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWhAx-000000003yf-32Ng;
	Fri, 19 Dec 2025 20:34:11 +0000
Date: Sat, 20 Dec 2025 04:33:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: security/apparmor/apparmorfs.c:1846 ns_mkdir_op() warn: passing zero
 to 'ERR_PTR'
Message-ID: <202512200444.xg5qDpnB-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: NeilBrown <neilb@suse.de>
CC: Christian Brauner <brauner@kernel.org>
CC: Jeff Layton <jlayton@kernel.org>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dd9b004b7ff3289fb7bae35130c0a5c0537266af
commit: 88d5baf69082e5b410296435008329676b687549 Change inode_operations.mkdir to return struct dentry *
date:   10 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20251213 (https://download.01.org/0day-ci/archive/20251220/202512200444.xg5qDpnB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512200444.xg5qDpnB-lkp@intel.com/

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
