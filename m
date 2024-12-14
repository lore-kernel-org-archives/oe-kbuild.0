Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209FE19FA7C
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Dec 2024 19:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734205751; cv=none; b=PwPp/NOwv6BCDIEJSmn9dZcCd/XGzyApGTPqqXc9lR+k1y2PRKi9iR88YydRDR8WShlWHOf479XdYy59WIFnpSRfcNjXyb5qINNd/NTnZ+840bWT53pCJHawYqvyDm8YhyYylqJNoe5IecyNfN/3w2WdfL+4pDSQg2n0r7b6hps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734205751; c=relaxed/simple;
	bh=o/6ko2oysUVJI8No6cwC9kPnw6hEFr1LOtP+41bqfiE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IqG+Z5WOiU6Ht/GFM1jF3tuz5LbKhFo+OwmlgWAMBabFi8etWZFCJ1GoW5H4SqWydW0pB4cT1wPSPpW+La9Qy5hW6TIrXzdOnSQFBuX8yAxEtqnuAR0VD/b4/PYlLCjsLGaw2RA1y/GWIkIE63XLhrkBnvTBERr7izRWH7WrWkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bcWyC2Un; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bcWyC2Un"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734205749; x=1765741749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o/6ko2oysUVJI8No6cwC9kPnw6hEFr1LOtP+41bqfiE=;
  b=bcWyC2UnqWFYUesxhmd4gsaUqStYLQ9/c3UNqo9nnFL8volkzm62UJNV
   Z9w1Jkkv6FkWTA47a6jvZrf1WIvCl0BMRP92G/9EtM4nVO10We8bEreq4
   6kJ9DNdtDniRP54red7GLmRGsbsJ9NJkmOYNHyQuxzLDz4nZaQFDGW/bR
   LJkhV7LD9/+gxEDILS50BB7y155c+iA39E5bpi5bblAz445Ef7JLBUC6K
   pSl6Bo+2sf5zaI8M0e9d/FSh6906mQCy2ENXJyfPWWNgt3WlSb7yXGRuK
   GtnWv7Bvuyj8L1YOsL7TajoDgK6otTj7BzGjAGktbexYUIO7vCK4kGOOf
   A==;
X-CSE-ConnectionGUID: X92zYISzR1SMKliQaSEsQg==
X-CSE-MsgGUID: a/9hnnGzQFuZl44dWtORCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="33965419"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="33965419"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 11:49:08 -0800
X-CSE-ConnectionGUID: Y8QbUQ9MR7SvLX46540b6w==
X-CSE-MsgGUID: hD8ppABjRpu7YojVEVkBKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="96582200"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Dec 2024 11:49:07 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMY8P-000DBU-2H;
	Sat, 14 Dec 2024 19:49:05 +0000
Date: Sun, 15 Dec 2024 03:48:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2579/2579] fs/udf/file.c:175
 udf_file_write_iter() warn: inconsistent returns '&iinfo->i_data_sem'.
Message-ID: <202412150352.4zRZ3ksW-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: sanglipeng <sanglipeng1@jd.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   6c3413fbf8c430b89f5d23f465e10e99ea145199
commit: a0756b79ccafa25037fa57d5afd50dc12ad230b6 [2579/2579] udf: Do not update file length for failed writes to inline files
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 2 months ago
config: x86_64-randconfig-161-20241213 (https://download.01.org/0day-ci/archive/20241215/202412150352.4zRZ3ksW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412150352.4zRZ3ksW-lkp@intel.com/

smatch warnings:
fs/udf/file.c:175 udf_file_write_iter() warn: inconsistent returns '&iinfo->i_data_sem'.

vim +175 fs/udf/file.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  134  
d4637bc18f3bf8 Al Viro           2014-04-03  135  static ssize_t udf_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
^1da177e4c3f41 Linus Torvalds    2005-04-16  136  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  137  	ssize_t retval;
543ade1fc901db Badari Pulavarty  2006-09-30  138  	struct file *file = iocb->ki_filp;
496ad9aa8ef448 Al Viro           2013-01-23  139  	struct inode *inode = file_inode(file);
48d6d8ff7dca80 Marcin Slusarz    2008-02-08  140  	struct udf_inode_info *iinfo = UDF_I(inode);
165f1a6e300d5a Al Viro           2015-04-07  141  	int err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  142  
5955102c9984fa Al Viro           2016-01-22  143  	inode_lock(inode);
165f1a6e300d5a Al Viro           2015-04-07  144  
3309dd04cbcd2c Al Viro           2015-04-09  145  	retval = generic_write_checks(iocb, from);
3309dd04cbcd2c Al Viro           2015-04-09  146  	if (retval <= 0)
165f1a6e300d5a Al Viro           2015-04-07  147  		goto out;
165f1a6e300d5a Al Viro           2015-04-07  148  
8754a3f718f08d Jan Kara          2010-11-16  149  	down_write(&iinfo->i_data_sem);
a0756b79ccafa2 Jan Kara          2023-01-02  150  	if (iinfo->i_alloc_type == ICBTAG_FLAG_AD_IN_ICB &&
a0756b79ccafa2 Jan Kara          2023-01-02  151  	    inode->i_sb->s_blocksize < (udf_file_entry_alloc_offset(inode) +
a0756b79ccafa2 Jan Kara          2023-01-02  152  				 iocb->ki_pos + iov_iter_count(from))) {
7e49b6f2480cb9 Jan Kara          2010-10-22  153  		err = udf_expand_file_adinicb(inode);
7e49b6f2480cb9 Jan Kara          2010-10-22  154  		if (err) {
5955102c9984fa Al Viro           2016-01-22  155  			inode_unlock(inode);
^1da177e4c3f41 Linus Torvalds    2005-04-16  156  			udf_debug("udf_expand_adinicb: err=%d\n", err);
^1da177e4c3f41 Linus Torvalds    2005-04-16  157  			return err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  158  		}
d2eb8c359309ec Jan Kara          2011-12-10  159  	} else
8754a3f718f08d Jan Kara          2010-11-16  160  		up_write(&iinfo->i_data_sem);
^1da177e4c3f41 Linus Torvalds    2005-04-16  161  
d4637bc18f3bf8 Al Viro           2014-04-03  162  	retval = __generic_file_write_iter(iocb, from);
5f380c7fa7e01f Al Viro           2015-04-07  163  out:
a0756b79ccafa2 Jan Kara          2023-01-02  164  	down_write(&iinfo->i_data_sem);
a0756b79ccafa2 Jan Kara          2023-01-02  165  	if (iinfo->i_alloc_type == ICBTAG_FLAG_AD_IN_ICB && retval > 0)
a0756b79ccafa2 Jan Kara          2023-01-02  166  		iinfo->i_lenAlloc = inode->i_size;
a0756b79ccafa2 Jan Kara          2023-01-02  167  	up_write(&iinfo->i_data_sem);
5955102c9984fa Al Viro           2016-01-22  168  	inode_unlock(inode);
09ebb17ab476b6 Jan Kara          2014-02-18  169  
09ebb17ab476b6 Jan Kara          2014-02-18  170  	if (retval > 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  171  		mark_inode_dirty(inode);
e259221763a404 Christoph Hellwig 2016-04-07  172  		retval = generic_write_sync(iocb, retval);
09ebb17ab476b6 Jan Kara          2014-02-18  173  	}
28de7948a89676 Cyrill Gorcunov   2007-07-21  174  
^1da177e4c3f41 Linus Torvalds    2005-04-16 @175  	return retval;
^1da177e4c3f41 Linus Torvalds    2005-04-16  176  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  177  

:::::: The code at line 175 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
