Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040BF3FE55
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Sep 2024 23:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727049382; cv=none; b=fE6j68SmOPZpRgooAjst35EbMXrlPxH7r3VnFlecnQ0RqjXxC4gs1vZC02j0b7MFXuxdIoYQhWnGjjY8wJDSf9ObCnXdbm0jMSY+OApOhAOYaoplkPcBBnXcZrot3of7BP+axnluEo/+bt3WME2ferLhYCW98KtBrJtDMp8u0/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727049382; c=relaxed/simple;
	bh=MZ9aVaR35CfBA46iXN4GNBIKrXEaf4tBt6b7p4+oPmo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GpvvVdjTgcN5a7iwT3mw+VQEFXt244PHF/c09H+CIyLRHffDaBEplIRxjxBkTI4vIzIfc4dBsbzBG+kb4ddhu2LKI54gnwLsY4etgNwWqq+QjlLLK8HdMwjJ3b6KkKOHH3e6y+OPjTPrh/sEE2rh0uvdKbeAIHUHtypJ9hfG8n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kr4YSu8Z; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kr4YSu8Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727049380; x=1758585380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MZ9aVaR35CfBA46iXN4GNBIKrXEaf4tBt6b7p4+oPmo=;
  b=kr4YSu8ZdXgS+BZDCsTjwkzDAV8hNw3a9tUeEewMo8jUFx/8LOdyJZAx
   9q5pybLzU14TCujGtEbSYBJeICvNdWKbafP6JpkVfMgGwSOix5pfYitTn
   isrmQWU4z+dL54rhkaPiDEVcEKa0rJHhF6UaNVib8hfx0ESBuXoRwmRTC
   zPCYI6AbMvkKHqWs/iQyU3WD9BS8voUMCqxCANaSvOLySb6oFifuxBJaH
   taPVHFO1Nd7wzniwwIHmwewXx8MNU6/Khd1T0NiZi3qxu7B2GBwv3rT6l
   fT2MJjmj9Sc+R9WefKeOewYoWQ7W1acTy8lXLCT8CdEyxpo97g2Ypgu9R
   A==;
X-CSE-ConnectionGUID: 72sWLClRQ+Ock87v8ipprA==
X-CSE-MsgGUID: iX0VEtL+TyesH7q0d91rzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25860677"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="25860677"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 16:56:19 -0700
X-CSE-ConnectionGUID: 4NZq2K0wQdaUlTBSgpLeZA==
X-CSE-MsgGUID: sLryEhX/Ss+XUGG2AJxL0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="75275931"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Sep 2024 16:56:17 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssWR4-000Gkk-2c;
	Sun, 22 Sep 2024 23:56:14 +0000
Date: Mon, 23 Sep 2024 07:55:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 295/448] kernel/user_namespace.c:1249
 proc_setgroups_write() warn: potential spectre issue 'kbuf' [w]
Message-ID: <202409230731.4t5PeSof-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   7ef9d29ff0268d9fb68e3b1bf7548981d7a61307
commit: 5975792743586010d3b4c6e7c06a857494e61557 [295/448] fs/proc: convert to read/write iterators
:::::: branch date: 17 hours ago
:::::: commit date: 3 days ago
config: mips-randconfig-r073-20240922 (https://download.01.org/0day-ci/archive/20240923/202409230731.4t5PeSof-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 8663a75fa2f31299ab8d1d90288d9df92aadee88)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409230731.4t5PeSof-lkp@intel.com/

smatch warnings:
kernel/user_namespace.c:1249 proc_setgroups_write() warn: potential spectre issue 'kbuf' [w]

vim +/kbuf +1249 kernel/user_namespace.c

9cc46516ddf497 Eric W. Biederman 2014-12-02  1230  
59757927435860 Jens Axboe        2024-04-05  1231  ssize_t proc_setgroups_write(struct kiocb *iocb, struct iov_iter *from)
9cc46516ddf497 Eric W. Biederman 2014-12-02  1232  {
59757927435860 Jens Axboe        2024-04-05  1233  	struct seq_file *seq = iocb->ki_filp->private_data;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1234  	struct user_namespace *ns = seq->private;
59757927435860 Jens Axboe        2024-04-05  1235  	size_t count = iov_iter_count(from);
9cc46516ddf497 Eric W. Biederman 2014-12-02  1236  	char kbuf[8], *pos;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1237  	bool setgroups_allowed;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1238  	ssize_t ret;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1239  
9cc46516ddf497 Eric W. Biederman 2014-12-02  1240  	/* Only allow a very narrow range of strings to be written */
9cc46516ddf497 Eric W. Biederman 2014-12-02  1241  	ret = -EINVAL;
59757927435860 Jens Axboe        2024-04-05  1242  	if ((iocb->ki_pos != 0) || (count >= sizeof(kbuf)))
9cc46516ddf497 Eric W. Biederman 2014-12-02  1243  		goto out;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1244  
9cc46516ddf497 Eric W. Biederman 2014-12-02  1245  	/* What was written? */
9cc46516ddf497 Eric W. Biederman 2014-12-02  1246  	ret = -EFAULT;
59757927435860 Jens Axboe        2024-04-05  1247  	if (!copy_from_iter_full(kbuf, count, from))
9cc46516ddf497 Eric W. Biederman 2014-12-02  1248  		goto out;
9cc46516ddf497 Eric W. Biederman 2014-12-02 @1249  	kbuf[count] = '\0';
9cc46516ddf497 Eric W. Biederman 2014-12-02  1250  	pos = kbuf;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1251  
9cc46516ddf497 Eric W. Biederman 2014-12-02  1252  	/* What is being requested? */
9cc46516ddf497 Eric W. Biederman 2014-12-02  1253  	ret = -EINVAL;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1254  	if (strncmp(pos, "allow", 5) == 0) {
9cc46516ddf497 Eric W. Biederman 2014-12-02  1255  		pos += 5;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1256  		setgroups_allowed = true;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1257  	}
9cc46516ddf497 Eric W. Biederman 2014-12-02  1258  	else if (strncmp(pos, "deny", 4) == 0) {
9cc46516ddf497 Eric W. Biederman 2014-12-02  1259  		pos += 4;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1260  		setgroups_allowed = false;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1261  	}
9cc46516ddf497 Eric W. Biederman 2014-12-02  1262  	else
9cc46516ddf497 Eric W. Biederman 2014-12-02  1263  		goto out;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1264  
9cc46516ddf497 Eric W. Biederman 2014-12-02  1265  	/* Verify there is not trailing junk on the line */
9cc46516ddf497 Eric W. Biederman 2014-12-02  1266  	pos = skip_spaces(pos);
9cc46516ddf497 Eric W. Biederman 2014-12-02  1267  	if (*pos != '\0')
9cc46516ddf497 Eric W. Biederman 2014-12-02  1268  		goto out;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1269  
9cc46516ddf497 Eric W. Biederman 2014-12-02  1270  	ret = -EPERM;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1271  	mutex_lock(&userns_state_mutex);
9cc46516ddf497 Eric W. Biederman 2014-12-02  1272  	if (setgroups_allowed) {
9cc46516ddf497 Eric W. Biederman 2014-12-02  1273  		/* Enabling setgroups after setgroups has been disabled
9cc46516ddf497 Eric W. Biederman 2014-12-02  1274  		 * is not allowed.
9cc46516ddf497 Eric W. Biederman 2014-12-02  1275  		 */
9cc46516ddf497 Eric W. Biederman 2014-12-02  1276  		if (!(ns->flags & USERNS_SETGROUPS_ALLOWED))
9cc46516ddf497 Eric W. Biederman 2014-12-02  1277  			goto out_unlock;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1278  	} else {
9cc46516ddf497 Eric W. Biederman 2014-12-02  1279  		/* Permanently disabling setgroups after setgroups has
9cc46516ddf497 Eric W. Biederman 2014-12-02  1280  		 * been enabled by writing the gid_map is not allowed.
9cc46516ddf497 Eric W. Biederman 2014-12-02  1281  		 */
9cc46516ddf497 Eric W. Biederman 2014-12-02  1282  		if (ns->gid_map.nr_extents != 0)
9cc46516ddf497 Eric W. Biederman 2014-12-02  1283  			goto out_unlock;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1284  		ns->flags &= ~USERNS_SETGROUPS_ALLOWED;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1285  	}
9cc46516ddf497 Eric W. Biederman 2014-12-02  1286  	mutex_unlock(&userns_state_mutex);
9cc46516ddf497 Eric W. Biederman 2014-12-02  1287  
9cc46516ddf497 Eric W. Biederman 2014-12-02  1288  	/* Report a successful write */
59757927435860 Jens Axboe        2024-04-05  1289  	iocb->ki_pos = count;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1290  	ret = count;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1291  out:
9cc46516ddf497 Eric W. Biederman 2014-12-02  1292  	return ret;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1293  out_unlock:
9cc46516ddf497 Eric W. Biederman 2014-12-02  1294  	mutex_unlock(&userns_state_mutex);
9cc46516ddf497 Eric W. Biederman 2014-12-02  1295  	goto out;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1296  }
9cc46516ddf497 Eric W. Biederman 2014-12-02  1297  

:::::: The code at line 1249 was first introduced by commit
:::::: 9cc46516ddf497ea16e8d7cb986ae03a0f6b92f8 userns: Add a knob to disable setgroups on a per user namespace basis

:::::: TO: Eric W. Biederman <ebiederm@xmission.com>
:::::: CC: Eric W. Biederman <ebiederm@xmission.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
