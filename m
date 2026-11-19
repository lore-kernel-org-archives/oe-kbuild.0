Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795065537;
	b=hKIIJyEL2eXdIAvUIRzG4aT5H3a9Noq98XkWRjHffgZBbbRjWUcFiFJ2KPw2doEAdifO
	 f9mPbX6x//9Mqatp1aUOJrIAg/cYjZubqvIz9mlHrULRW7YO5n74B9NbagzPp6LqD9KHh
	 EHJPTDfGTwEoO+Rn0XKCQCKpZSL1ecb5JOOY/UewqEqp5znzwn9XgcPu0D+1hP6lDcODm
	 f2IsPCX4nNu/y6AZ9Z1r0umO1XTBuccf7chYjxjzbJDX2visboKjfHKv9QWhiO1CPcfII
	 ORLwqEc2uVaNd8Bd1Z6DYJqQ0c853bdKmECq/IZ60NVzXrP9EzQP3rRVkz5p0rSfhqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795065537;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=gHt9E1piNfBPbs0nXUZM3drllkp+3KsSkhgVGNv3mWo=;
	b=XpdHKjgtIexywc6hyh49026P9UtXVDwMOPMVsSRh0Yf8vAxWvu6BgCAY9M9vCWFi5cZy
	 I8jwHEPxcxn8ae+81WFxZnJCw4Uio4HeGny8qVwNxI/QmquZ5+8YCDazvaDR/U27TcubZ
	 1o7AYkrbb1k1f2tu0t06YISso8mdaJbxSLUSpqpMPbsyCsic28gKV8Zo9hgkc4Ls/MDlC
	 XQP+MiYTbT/3jnC+M7RSBbNIoVGPa9tbeVLZXTQ7lDP1i8ASAOUFZK/sXI7b81KD69adw
	 PXC6N8gZiZaIPd57IeSZQvptP2RRFrxTqbm0N199UAjgLid+cqWvsT3ny58RBTa8E2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NPtGZCRg;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1ABC606A320
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 05:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1ABC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NPtGZCRg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795065535; x=1826601535;
  h=date:from:to:cc:subject:message-id;
  bh=qTCws6urRjg/9CY64sPeq13AgglBILeT3F1BvnDQhsE=;
  b=NPtGZCRgKWwFYO995qnAPxuHPpWoFlJ2L7eZhQs5zvz8UBtLtnYPf65t
   Oh+OYe94B20rNSvxNH+Rv2b6GqLLN4kKMkWX4vyjZajTsqdwM69lnI6Fc
   S0DMUiK78cXnwjYGlYqsiHP5qCcdwpb/3A4BitJef0FjYU6SswnxvUZoq
   BK1Zso4yEb+PdKWps/62J9u76mQYeO+HbCUR/3/bRX8a5FMDSEeSH4jnj
   p26yGb8buRgAZYsDZYxPS7bcUE1YSSvvLm5uP3rA6RAKEM2kjZqk4jzFF
   sV54KL5PawdCNDIs69s2jNY4N5+ZgGvxxIF2u+krhvOnQNyNX3WWDLb1Y
   w==;
X-CSE-ConnectionGUID: YxhzLF4qSZ6A6mYdX41KrA==
X-CSE-MsgGUID: t3A0ynfUTLy4DENs7tn42g==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3895370"
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="3895370"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 21:18:30 -0800
X-CSE-ConnectionGUID: ieTMKukHTj+cLzYouuid8g==
X-CSE-MsgGUID: ghYOiZCWTl2z7G5C/4UpZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,220,1787036400"; 
   d="scan'208";a="12080773"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 18 Nov 2026 21:18:29 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTuXT-000000003fx-0i2j;
	Thu, 19 Nov 2026 05:18:27 +0000
Date: Thu, 19 Nov 2026 06:17:27 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7173/9180] fs/smb/server/vfs.c:1633
 ksmbd_vfs_make_xattr_posix_acl() warn: passing zero to 'ERR_CAST'
Message-ID: <20261119060855.mn1TjZpt-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ian Bridges <icb@fastmail.org>
CC: Namjae Jeon <linkinjeon@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e8017d29067fd1310a65c3494ce1a1b492adbac6
commit: c710c654b8a3c92b34e38740dc17c29daf5b222e [7173/9180] ksmbd: do not treat an unreadable security descriptor as none
:::::: branch date: 11 hours ago
:::::: commit date: 3 days ago
config: s390-randconfig-2200-20261119 (https://download.01.org/0day-ci/archive/20261119/20261119060855.mn1TjZpt-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8db60b003f961f25c5cafe91ee44176f61374279)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261119060855.mn1TjZpt-lkp@intel.com/

smatch warnings:
fs/smb/server/vfs.c:1633 ksmbd_vfs_make_xattr_posix_acl() warn: passing zero to 'ERR_CAST'

vim +/ERR_CAST +1633 fs/smb/server/vfs.c

f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1617  
1923c1065fe94c fs/smb/server/vfs.c Christian Brauner 2026-09-01  1618  static struct xattr_smb_acl *ksmbd_vfs_make_xattr_posix_acl(const struct mnt_idmap *idmap,
af34983e831587 fs/ksmbd/vfs.c      Hyunchul Lee      2021-06-30  1619  							    struct inode *inode,
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1620  							    int acl_type)
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1621  {
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1622  	struct xattr_smb_acl *smb_acl = NULL;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1623  	struct posix_acl *posix_acls;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1624  	struct posix_acl_entry *pa_entry;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1625  	struct xattr_acl_entry *xa_entry;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1626  	int i;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1627  
777cad1604d68e fs/ksmbd/vfs.c      Namjae Jeon       2021-08-13  1628  	if (!IS_ENABLED(CONFIG_FS_POSIX_ACL))
777cad1604d68e fs/ksmbd/vfs.c      Namjae Jeon       2021-08-13  1629  		return NULL;
777cad1604d68e fs/ksmbd/vfs.c      Namjae Jeon       2021-08-13  1630  
cac2f8b8d8b50e fs/ksmbd/vfs.c      Christian Brauner 2022-09-22  1631  	posix_acls = get_inode_acl(inode, acl_type);
25933573ef48f3 fs/smb/server/vfs.c Namjae Jeon       2023-05-30  1632  	if (IS_ERR_OR_NULL(posix_acls))
c710c654b8a3c9 fs/smb/server/vfs.c Ian Bridges       2026-11-16 @1633  		return ERR_CAST(posix_acls);
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1634  
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1635  	smb_acl = kzalloc(sizeof(struct xattr_smb_acl) +
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1636  			  sizeof(struct xattr_acl_entry) * posix_acls->a_count,
0066f623bce8f9 fs/smb/server/vfs.c Namjae Jeon       2024-11-22  1637  			  KSMBD_DEFAULT_GFP);
c710c654b8a3c9 fs/smb/server/vfs.c Ian Bridges       2026-11-16  1638  	if (!smb_acl) {
c710c654b8a3c9 fs/smb/server/vfs.c Ian Bridges       2026-11-16  1639  		smb_acl = ERR_PTR(-ENOMEM);
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1640  		goto out;
c710c654b8a3c9 fs/smb/server/vfs.c Ian Bridges       2026-11-16  1641  	}
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1642  
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1643  	smb_acl->count = posix_acls->a_count;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1644  	pa_entry = posix_acls->a_entries;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1645  	xa_entry = smb_acl->entries;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1646  	for (i = 0; i < posix_acls->a_count; i++, pa_entry++, xa_entry++) {
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1647  		switch (pa_entry->e_tag) {
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1648  		case ACL_USER:
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1649  			xa_entry->type = SMB_ACL_USER;
4d7ca4090184c1 fs/ksmbd/vfs.c      Christian Brauner 2023-01-13  1650  			xa_entry->uid = posix_acl_uid_translate(idmap, pa_entry);
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1651  			break;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1652  		case ACL_USER_OBJ:
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1653  			xa_entry->type = SMB_ACL_USER_OBJ;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1654  			break;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1655  		case ACL_GROUP:
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1656  			xa_entry->type = SMB_ACL_GROUP;
4d7ca4090184c1 fs/ksmbd/vfs.c      Christian Brauner 2023-01-13  1657  			xa_entry->gid = posix_acl_gid_translate(idmap, pa_entry);
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1658  			break;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1659  		case ACL_GROUP_OBJ:
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1660  			xa_entry->type = SMB_ACL_GROUP_OBJ;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1661  			break;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1662  		case ACL_OTHER:
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1663  			xa_entry->type = SMB_ACL_OTHER;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1664  			break;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1665  		case ACL_MASK:
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1666  			xa_entry->type = SMB_ACL_MASK;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1667  			break;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1668  		default:
bde1694aecdb53 fs/cifsd/vfs.c      Namjae Jeon       2021-06-28  1669  			pr_err("unknown type : 0x%x\n", pa_entry->e_tag);
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1670  			goto out;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1671  		}
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1672  
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1673  		if (pa_entry->e_perm & ACL_READ)
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1674  			xa_entry->perm |= SMB_ACL_READ;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1675  		if (pa_entry->e_perm & ACL_WRITE)
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1676  			xa_entry->perm |= SMB_ACL_WRITE;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1677  		if (pa_entry->e_perm & ACL_EXECUTE)
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1678  			xa_entry->perm |= SMB_ACL_EXECUTE;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1679  	}
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1680  out:
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1681  	posix_acl_release(posix_acls);
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1682  	return smb_acl;
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1683  }
f44158485826c0 fs/cifsd/vfs.c      Namjae Jeon       2021-03-16  1684  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
