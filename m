Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5113B1A267
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Mar 2026 02:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773369769; cv=none; b=O4XqOxUBQGnAubWJBZoTxYMD0rmN+2qAO1RdQZ2aUgpzMpEw2A0di3twSvIxw372Mgf+Rwd2aCsEkDyW+ECVVmzPkw3Z6d93APEIc5CL1X6SSIrQnxQbqj3h7o0vzjGtcORcDGg+yF5+1qq6GUApuKUbQUyyTfBJzTnALRjksPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773369769; c=relaxed/simple;
	bh=93ZZnXPZxH05QC+VAi/+oMYiKA1uIHvxBDSy5h96+2w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K3pUdIuV+8uhMb2WsUPbHqTFoAMJPc+TWufYQPg05NktD0NlpJ1E6U5xzYL14PyH9/xrpHhZn3m+8v3B9dyMow1/kYL1zCSHirdIkEH1LbcXS2t5ABYZ7+Mm86Qt3C2N59hP7kF8lXJcfXO/TBlxAJxG6jiyB4klVHbFYnlA1uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KBCteObg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KBCteObg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773369766; x=1804905766;
  h=date:from:to:cc:subject:message-id;
  bh=93ZZnXPZxH05QC+VAi/+oMYiKA1uIHvxBDSy5h96+2w=;
  b=KBCteObgBAhHSt8i8oyXfZbITAsQN/+G06z2FmUqYiEPXALhe7Qa6bE5
   NbMQvY7e+UMrJKuY35kvLNXuqIdXQQ6e7SrflId+WZ+EDcxQpooAX5rNc
   t9Q0VSFH8lLDdZCaGj7FqdyU67XnJi13okNxW5xQG1JI6QXLiCNcaoNad
   W2n0+hgHUalWl0OURwzpyOM8etpEOZsjEa/83MrPa5cfSWySp7r/XLRQW
   tQi5Be2/VbavbHyotbEAanxlMg8eL+hrGXPkjvVA/st55Q32yMpUuORD8
   D6y8wL3QF+aV2RfqMEOx57eLoIdRkRS5ob2y9sB+7RxZkDaENWL7Obd6L
   Q==;
X-CSE-ConnectionGUID: YMSEHUNmSiC9LANJaj3deQ==
X-CSE-MsgGUID: TYS4dhnfSBG/h+btJbCzAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74370342"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="74370342"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:42:45 -0700
X-CSE-ConnectionGUID: 1Kyd8rb3T8SGr1iO6gyjRg==
X-CSE-MsgGUID: KEBrRacZSaqrQ5WLSM6IEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="217070657"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Mar 2026 19:42:44 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0sU6-000000003LX-195Z;
	Fri, 13 Mar 2026 02:42:42 +0000
Date: Fri, 13 Mar 2026 10:42:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 282/471] kernel/user_namespace.c:1258
 proc_setgroups_write() warn: potential spectre issue 'kbuf' [w]
Message-ID: <202603131053.qSe7yNwQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   0a49759be1c3b29207758e467fdc1a90d0716d06
commit: 0610de1f48da4e70c6636c5590651eb8ece56ff9 [282/471] fs/proc: convert to read/write iterators
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: openrisc-randconfig-r071-20260307 (https://download.01.org/0day-ci/archive/20260313/202603131053.qSe7yNwQ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603131053.qSe7yNwQ-lkp@intel.com/

smatch warnings:
kernel/user_namespace.c:1258 proc_setgroups_write() warn: potential spectre issue 'kbuf' [w]

vim +/kbuf +1258 kernel/user_namespace.c

9cc46516ddf497 Eric W. Biederman 2014-12-02  1239  
0610de1f48da4e Jens Axboe        2024-04-05  1240  ssize_t proc_setgroups_write(struct kiocb *iocb, struct iov_iter *from)
9cc46516ddf497 Eric W. Biederman 2014-12-02  1241  {
0610de1f48da4e Jens Axboe        2024-04-05  1242  	struct seq_file *seq = iocb->ki_filp->private_data;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1243  	struct user_namespace *ns = seq->private;
0610de1f48da4e Jens Axboe        2024-04-05  1244  	size_t count = iov_iter_count(from);
9cc46516ddf497 Eric W. Biederman 2014-12-02  1245  	char kbuf[8], *pos;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1246  	bool setgroups_allowed;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1247  	ssize_t ret;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1248  
9cc46516ddf497 Eric W. Biederman 2014-12-02  1249  	/* Only allow a very narrow range of strings to be written */
9cc46516ddf497 Eric W. Biederman 2014-12-02  1250  	ret = -EINVAL;
0610de1f48da4e Jens Axboe        2024-04-05  1251  	if ((iocb->ki_pos != 0) || (count >= sizeof(kbuf)))
9cc46516ddf497 Eric W. Biederman 2014-12-02  1252  		goto out;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1253  
9cc46516ddf497 Eric W. Biederman 2014-12-02  1254  	/* What was written? */
9cc46516ddf497 Eric W. Biederman 2014-12-02  1255  	ret = -EFAULT;
0610de1f48da4e Jens Axboe        2024-04-05  1256  	if (!copy_from_iter_full(kbuf, count, from))
9cc46516ddf497 Eric W. Biederman 2014-12-02  1257  		goto out;
9cc46516ddf497 Eric W. Biederman 2014-12-02 @1258  	kbuf[count] = '\0';
9cc46516ddf497 Eric W. Biederman 2014-12-02  1259  	pos = kbuf;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1260  
9cc46516ddf497 Eric W. Biederman 2014-12-02  1261  	/* What is being requested? */
9cc46516ddf497 Eric W. Biederman 2014-12-02  1262  	ret = -EINVAL;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1263  	if (strncmp(pos, "allow", 5) == 0) {
9cc46516ddf497 Eric W. Biederman 2014-12-02  1264  		pos += 5;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1265  		setgroups_allowed = true;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1266  	}
9cc46516ddf497 Eric W. Biederman 2014-12-02  1267  	else if (strncmp(pos, "deny", 4) == 0) {
9cc46516ddf497 Eric W. Biederman 2014-12-02  1268  		pos += 4;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1269  		setgroups_allowed = false;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1270  	}
9cc46516ddf497 Eric W. Biederman 2014-12-02  1271  	else
9cc46516ddf497 Eric W. Biederman 2014-12-02  1272  		goto out;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1273  
9cc46516ddf497 Eric W. Biederman 2014-12-02  1274  	/* Verify there is not trailing junk on the line */
9cc46516ddf497 Eric W. Biederman 2014-12-02  1275  	pos = skip_spaces(pos);
9cc46516ddf497 Eric W. Biederman 2014-12-02  1276  	if (*pos != '\0')
9cc46516ddf497 Eric W. Biederman 2014-12-02  1277  		goto out;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1278  
9cc46516ddf497 Eric W. Biederman 2014-12-02  1279  	ret = -EPERM;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1280  	mutex_lock(&userns_state_mutex);
9cc46516ddf497 Eric W. Biederman 2014-12-02  1281  	if (setgroups_allowed) {
9cc46516ddf497 Eric W. Biederman 2014-12-02  1282  		/* Enabling setgroups after setgroups has been disabled
9cc46516ddf497 Eric W. Biederman 2014-12-02  1283  		 * is not allowed.
9cc46516ddf497 Eric W. Biederman 2014-12-02  1284  		 */
9cc46516ddf497 Eric W. Biederman 2014-12-02  1285  		if (!(ns->flags & USERNS_SETGROUPS_ALLOWED))
9cc46516ddf497 Eric W. Biederman 2014-12-02  1286  			goto out_unlock;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1287  	} else {
9cc46516ddf497 Eric W. Biederman 2014-12-02  1288  		/* Permanently disabling setgroups after setgroups has
9cc46516ddf497 Eric W. Biederman 2014-12-02  1289  		 * been enabled by writing the gid_map is not allowed.
9cc46516ddf497 Eric W. Biederman 2014-12-02  1290  		 */
9cc46516ddf497 Eric W. Biederman 2014-12-02  1291  		if (ns->gid_map.nr_extents != 0)
9cc46516ddf497 Eric W. Biederman 2014-12-02  1292  			goto out_unlock;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1293  		ns->flags &= ~USERNS_SETGROUPS_ALLOWED;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1294  	}
9cc46516ddf497 Eric W. Biederman 2014-12-02  1295  	mutex_unlock(&userns_state_mutex);
9cc46516ddf497 Eric W. Biederman 2014-12-02  1296  
9cc46516ddf497 Eric W. Biederman 2014-12-02  1297  	/* Report a successful write */
0610de1f48da4e Jens Axboe        2024-04-05  1298  	iocb->ki_pos = count;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1299  	ret = count;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1300  out:
9cc46516ddf497 Eric W. Biederman 2014-12-02  1301  	return ret;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1302  out_unlock:
9cc46516ddf497 Eric W. Biederman 2014-12-02  1303  	mutex_unlock(&userns_state_mutex);
9cc46516ddf497 Eric W. Biederman 2014-12-02  1304  	goto out;
9cc46516ddf497 Eric W. Biederman 2014-12-02  1305  }
9cc46516ddf497 Eric W. Biederman 2014-12-02  1306  

:::::: The code at line 1258 was first introduced by commit
:::::: 9cc46516ddf497ea16e8d7cb986ae03a0f6b92f8 userns: Add a knob to disable setgroups on a per user namespace basis

:::::: TO: Eric W. Biederman <ebiederm@xmission.com>
:::::: CC: Eric W. Biederman <ebiederm@xmission.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
