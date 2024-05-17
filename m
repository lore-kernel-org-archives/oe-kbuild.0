Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172A7BA20
	for <oe-kbuild@lists.linux.dev>; Fri, 17 May 2024 03:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715918303; cv=none; b=UxgQVw5KoFD0aO/gKSyuii4H9cv3+ob5pJwpB7XNYivpEAh6p2ou5eXZrxbHo9YH7li8POSp7g+ufwArmc++RJ9PkgtBd5INbIg6WDFAKdLQUrNt8AId5Z5SpOW/g7RCXIGuybTZka7OYtFUi14lgVzkPjD+amPxEaCZHgzf5x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715918303; c=relaxed/simple;
	bh=5NjnYZC7y6JFzsRBeWdQxqZL91wLmgOpymClpL0HcuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MNXjuied9cQmzQGIVAgYkTpO8EcYgGnC1nK1I+lskvG5nisH8K9nJuWl2tTl6dy2m7Oo/dEH4SNTv+kNEOfdLvfckIZ5iKmHKTzrOdxcrW4fWV6Em6DDVAgI0C1XQ2fBRI+9wDMqBzee38RbgSuAdzQRkMfjrLlJQG/vjqh4Cqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h/dyvP3q; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h/dyvP3q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715918301; x=1747454301;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5NjnYZC7y6JFzsRBeWdQxqZL91wLmgOpymClpL0HcuU=;
  b=h/dyvP3q9H8PeXE2sgpY+MR3x7ZMKlCzMSd6VAiVVEuRXdOEyvDoLBWi
   oWpOhB8yfWQ37XAfWm0C3MzU9M+OelyU40O2UQmBRYImcz/oOBMlenyE1
   01n3za8++qn0f74IHETNj+pJ3xWj1vuiRnEaGAggtYOMQIeEAMtpbf+91
   pZ4xIliTvht/q+/FWaiURJvdnPdfyAn1HyY3vZYNctvnGtVccs5uv1zRZ
   GEwgk2y1LIJjiRgpUHQiXj8XifPoQHaq/QDRWVb/mkaFtcmQSUZ/TQs0M
   bDyJbitNO5Rs2G2VGp0W4jAnSvZFK3uAmo1hK6oIGLJyHFU+j+rGjUc/i
   A==;
X-CSE-ConnectionGUID: B15cwKq2QnqjQqcRrlPkiQ==
X-CSE-MsgGUID: ALigu+wLSP6XHziOGCsKqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="15860677"
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; 
   d="scan'208";a="15860677"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 20:58:18 -0700
X-CSE-ConnectionGUID: JyWZs+c7T7mLK7Y3lvfriw==
X-CSE-MsgGUID: n4r+gj5aQhWXvaMq+/9FZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; 
   d="scan'208";a="54880364"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 16 May 2024 20:58:17 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7ojX-0000BB-00;
	Fri, 17 May 2024 03:58:15 +0000
Date: Fri, 17 May 2024 11:54:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] hostfs: convert hostfs to use the new mount api
Message-ID: <202405171154.21q42SWy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240513124141.3788846-1-lihongbo22@huawei.com>
References: <20240513124141.3788846-1-lihongbo22@huawei.com>
TO: Hongbo Li <lihongbo22@huawei.com>
TO: richard@nod.at
TO: anton.ivanov@cambridgegreys.com
TO: johannes@sipsolutions.net
CC: linux-um@lists.infradead.org
CC: linux-fsdevel@vger.kernel.org
CC: lihongbo22@huawei.com

Hi Hongbo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on uml/next]
[also build test WARNING on wireless-next/main wireless/main linus/master v6.9 next-20240516]
[cannot apply to uml/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hongbo-Li/hostfs-convert-hostfs-to-use-the-new-mount-api/20240513-204233
base:   git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux next
patch link:    https://lore.kernel.org/r/20240513124141.3788846-1-lihongbo22%40huawei.com
patch subject: [PATCH] hostfs: convert hostfs to use the new mount api
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: um-randconfig-r081-20240517 (https://download.01.org/0day-ci/archive/20240517/202405171154.21q42SWy-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d3455f4ddd16811401fa153298fadd2f59f6914e)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405171154.21q42SWy-lkp@intel.com/

smatch warnings:
fs/hostfs/hostfs_kern.c:960 hostfs_fill_super() error: uninitialized symbol 'host_root'.

vim +/host_root +960 fs/hostfs/hostfs_kern.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  937  
2c2593890079e8 Hongbo Li         2024-05-13  938  static int hostfs_fill_super(struct super_block *sb, struct fs_context *fc)
^1da177e4c3f41 Linus Torvalds    2005-04-16  939  {
2c2593890079e8 Hongbo Li         2024-05-13  940  	struct hostfs_fs_info *fsi = sb->s_fs_info;
^1da177e4c3f41 Linus Torvalds    2005-04-16  941  	struct inode *root_inode;
2c2593890079e8 Hongbo Li         2024-05-13  942  	char *host_root;
^1da177e4c3f41 Linus Torvalds    2005-04-16  943  	int err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  944  
^1da177e4c3f41 Linus Torvalds    2005-04-16  945  	sb->s_blocksize = 1024;
^1da177e4c3f41 Linus Torvalds    2005-04-16  946  	sb->s_blocksize_bits = 10;
^1da177e4c3f41 Linus Torvalds    2005-04-16  947  	sb->s_magic = HOSTFS_SUPER_MAGIC;
^1da177e4c3f41 Linus Torvalds    2005-04-16  948  	sb->s_op = &hostfs_sbops;
b26d4cd385fc51 Al Viro           2013-10-25  949  	sb->s_d_op = &simple_dentry_operations;
752fa51e4c5182 Wolfgang Illmeyer 2009-06-30  950  	sb->s_maxbytes = MAX_LFS_FILESIZE;
ce72750f04d68a Sjoerd Simons     2021-11-05  951  	err = super_setup_bdi(sb);
ce72750f04d68a Sjoerd Simons     2021-11-05  952  	if (err)
74ce793bcbde5c Mickaël Salaün    2023-06-12  953  		return err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  954  
b58c4e96192ee7 Andy Shevchenko   2020-03-20  955  	/* NULL is printed as '(null)' by printf(): avoid that. */
2c2593890079e8 Hongbo Li         2024-05-13  956  	if (fc->source == NULL)
2c2593890079e8 Hongbo Li         2024-05-13  957  		host_root = "";
^1da177e4c3f41 Linus Torvalds    2005-04-16  958  
2c2593890079e8 Hongbo Li         2024-05-13  959  	fsi->host_root_path =
2c2593890079e8 Hongbo Li         2024-05-13 @960  		kasprintf(GFP_KERNEL, "%s/%s", root_ino, host_root);
2c2593890079e8 Hongbo Li         2024-05-13  961  	if (fsi->host_root_path == NULL)
74ce793bcbde5c Mickaël Salaün    2023-06-12  962  		return -ENOMEM;
^1da177e4c3f41 Linus Torvalds    2005-04-16  963  
2c2593890079e8 Hongbo Li         2024-05-13  964  	root_inode = hostfs_iget(sb, fsi->host_root_path);
74ce793bcbde5c Mickaël Salaün    2023-06-12  965  	if (IS_ERR(root_inode))
74ce793bcbde5c Mickaël Salaün    2023-06-12  966  		return PTR_ERR(root_inode);
52b209f7b848a2 Al Viro           2010-06-06  967  
4754b825571a6f Al Viro           2010-06-06  968  	if (S_ISLNK(root_inode->i_mode)) {
74ce793bcbde5c Mickaël Salaün    2023-06-12  969  		char *name;
74ce793bcbde5c Mickaël Salaün    2023-06-12  970  
74ce793bcbde5c Mickaël Salaün    2023-06-12  971  		iput(root_inode);
2c2593890079e8 Hongbo Li         2024-05-13  972  		name = follow_link(fsi->host_root_path);
74ce793bcbde5c Mickaël Salaün    2023-06-12  973  		if (IS_ERR(name))
74ce793bcbde5c Mickaël Salaün    2023-06-12  974  			return PTR_ERR(name);
74ce793bcbde5c Mickaël Salaün    2023-06-12  975  
74ce793bcbde5c Mickaël Salaün    2023-06-12  976  		root_inode = hostfs_iget(sb, name);
52b209f7b848a2 Al Viro           2010-06-06  977  		kfree(name);
74ce793bcbde5c Mickaël Salaün    2023-06-12  978  		if (IS_ERR(root_inode))
74ce793bcbde5c Mickaël Salaün    2023-06-12  979  			return PTR_ERR(root_inode);
4754b825571a6f Al Viro           2010-06-06  980  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  981  
48fde701aff662 Al Viro           2012-01-08  982  	sb->s_root = d_make_root(root_inode);
^1da177e4c3f41 Linus Torvalds    2005-04-16  983  	if (sb->s_root == NULL)
74ce793bcbde5c Mickaël Salaün    2023-06-12  984  		return -ENOMEM;
^1da177e4c3f41 Linus Torvalds    2005-04-16  985  
f1adc05e773830 Jeff Dike         2007-05-08  986  	return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  987  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  988  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
