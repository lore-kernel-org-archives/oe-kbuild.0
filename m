Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8070254792
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Apr 2024 05:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713419522; cv=none; b=LK6POHt4Ak/KWHrW7P/TAgLpUh7y9fW5btvmVv3bPeh9o8t9QxvOXLk0gf5SATU/+KJTZtnHnrlwKhF6IZSRi/m3vHseFKJZsPdgUD/h7KCyfPf41keKhOtswU3zk+mF8oP8sHVsV0N9BvH+CDYNxN0fDew1ivFWhuP3BdqAvAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713419522; c=relaxed/simple;
	bh=H2qQ0Sy44aU60+geYnVDX3ZGuR5lgnN9+MPsPd+Bm/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l6Edi3wMky66FBd/VRZaiw9sdLL04YWmqAdsy7XoElD9JtMGvWoyvwiB0urgCIQySrefN8Gnc/n3OFw6I7Zsd152DO4mR0+D4IvYG3v/0WifdrZNm7J9P2ZYPsZ89xg6vE+lev4T5ezutVdKzlo1MZf+laIrlwQGmZLrmTG0nek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c92HZxn/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c92HZxn/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713419520; x=1744955520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H2qQ0Sy44aU60+geYnVDX3ZGuR5lgnN9+MPsPd+Bm/A=;
  b=c92HZxn/XCuzuD2thTZHiEFu425uxrdb30An/SxHWC7yfiGZr302yh6Q
   FX0rK2IwVKqvo5UKQEKJWVSEQDLyxipQfSEY3e8/RjFN0QbEFfMP+soTb
   U3DIjRGHSmq3deIwN8U0XzgI9ehrD9ULm65SLEbSyN2Pf9EzoIXzX1eiq
   WAeppzoC+hygKjgiW/E1sZHpD1XqcuRr8AZiB1NnNGAjo5TyIk/wbE63d
   aA2+/qbdiFOZg+eRNpE0vn99MMnh8RQ4yGFfyNroNQeBKa/FN0kderO2I
   HRG9fIMKC1x5CwXLo7idS1ydq38qO4gx1mVLSjAExUUxxjL1Hi7SzAysZ
   A==;
X-CSE-ConnectionGUID: 7I9Qh+hUQDGmxE8UAYFopw==
X-CSE-MsgGUID: 8rTlMs2uRauv6TRC0Mwg7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="11884981"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="11884981"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 22:51:59 -0700
X-CSE-ConnectionGUID: lI2TpTC9Qj6FDfjBy6u+Og==
X-CSE-MsgGUID: kedy2BZNRZ66KDe1qwKpUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; 
   d="scan'208";a="22925838"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 17 Apr 2024 22:52:00 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxKge-0007MC-1I;
	Thu, 18 Apr 2024 05:51:56 +0000
Date: Thu, 18 Apr 2024 13:51:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dhowells-fs:cifs-netfs 7/40] fs/netfs/direct_write.c:165
 netfs_unbuffered_write_iter() error: uninitialized symbol 'end'.
Message-ID: <202404181313.r7xPKXaJ-lkp@intel.com>
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
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git cifs-netfs
head:   8dc73cdbbce16b41d4de537600385262aa8b7613
commit: 3a3871ab79037b2330014b3cbe16676c74e10c00 [7/40] mm: Provide a means of invalidation without using launder_folio
:::::: branch date: 15 hours ago
:::::: commit date: 17 hours ago
config: i386-randconfig-141-20240418 (https://download.01.org/0day-ci/archive/20240418/202404181313.r7xPKXaJ-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404181313.r7xPKXaJ-lkp@intel.com/

New smatch warnings:
fs/netfs/direct_write.c:165 netfs_unbuffered_write_iter() error: uninitialized symbol 'end'.

Old smatch warnings:
fs/netfs/direct_write.c:169 netfs_unbuffered_write_iter() error: uninitialized symbol 'end'.

vim +/end +165 fs/netfs/direct_write.c

153a9961b55110 David Howells 2022-02-21  118  
153a9961b55110 David Howells 2022-02-21  119  /**
153a9961b55110 David Howells 2022-02-21  120   * netfs_unbuffered_write_iter - Unbuffered write to a file
153a9961b55110 David Howells 2022-02-21  121   * @iocb: IO state structure
153a9961b55110 David Howells 2022-02-21  122   * @from: iov_iter with data to write
153a9961b55110 David Howells 2022-02-21  123   *
153a9961b55110 David Howells 2022-02-21  124   * Do an unbuffered write to a file, writing the data directly to the server
153a9961b55110 David Howells 2022-02-21  125   * and not lodging the data in the pagecache.
153a9961b55110 David Howells 2022-02-21  126   *
153a9961b55110 David Howells 2022-02-21  127   * Return:
153a9961b55110 David Howells 2022-02-21  128   * * Negative error code if no data has been written at all of
153a9961b55110 David Howells 2022-02-21  129   *   vfs_fsync_range() failed for a synchronous write
153a9961b55110 David Howells 2022-02-21  130   * * Number of bytes written, even for truncated writes
153a9961b55110 David Howells 2022-02-21  131   */
153a9961b55110 David Howells 2022-02-21  132  ssize_t netfs_unbuffered_write_iter(struct kiocb *iocb, struct iov_iter *from)
153a9961b55110 David Howells 2022-02-21  133  {
153a9961b55110 David Howells 2022-02-21  134  	struct file *file = iocb->ki_filp;
3a3871ab79037b David Howells 2024-03-27  135  	struct address_space *mapping = file->f_mapping;
3a3871ab79037b David Howells 2024-03-27  136  	struct inode *inode = mapping->host;
153a9961b55110 David Howells 2022-02-21  137  	struct netfs_inode *ictx = netfs_inode(inode);
100ccd18bb41ea David Howells 2023-11-24  138  	unsigned long long end;
153a9961b55110 David Howells 2022-02-21  139  	ssize_t ret;
3a3871ab79037b David Howells 2024-03-27  140  	loff_t pos = iocb->ki_pos;
153a9961b55110 David Howells 2022-02-21  141  
3a3871ab79037b David Howells 2024-03-27  142  	_enter("%llx,%zx,%llx", pos, iov_iter_count(from), i_size_read(inode));
153a9961b55110 David Howells 2022-02-21  143  
ca9ca1a5d5a980 David Howells 2024-01-29  144  	if (!iov_iter_count(from))
ca9ca1a5d5a980 David Howells 2024-01-29  145  		return 0;
ca9ca1a5d5a980 David Howells 2024-01-29  146  
153a9961b55110 David Howells 2022-02-21  147  	trace_netfs_write_iter(iocb, from);
4088e389476e3b David Howells 2024-01-05  148  	netfs_stat(&netfs_n_rh_dio_write);
153a9961b55110 David Howells 2022-02-21  149  
153a9961b55110 David Howells 2022-02-21  150  	ret = netfs_start_io_direct(inode);
153a9961b55110 David Howells 2022-02-21  151  	if (ret < 0)
153a9961b55110 David Howells 2022-02-21  152  		return ret;
153a9961b55110 David Howells 2022-02-21  153  	ret = generic_write_checks(iocb, from);
ca9ca1a5d5a980 David Howells 2024-01-29  154  	if (ret <= 0)
153a9961b55110 David Howells 2022-02-21  155  		goto out;
153a9961b55110 David Howells 2022-02-21  156  	ret = file_remove_privs(file);
153a9961b55110 David Howells 2022-02-21  157  	if (ret < 0)
153a9961b55110 David Howells 2022-02-21  158  		goto out;
153a9961b55110 David Howells 2022-02-21  159  	ret = file_update_time(file);
153a9961b55110 David Howells 2022-02-21  160  	if (ret < 0)
153a9961b55110 David Howells 2022-02-21  161  		goto out;
3a3871ab79037b David Howells 2024-03-27  162  	if (iocb->ki_flags & IOCB_NOWAIT) {
3a3871ab79037b David Howells 2024-03-27  163  		/* We could block if there are any pages in the range. */
3a3871ab79037b David Howells 2024-03-27  164  		ret = -EAGAIN;
3a3871ab79037b David Howells 2024-03-27 @165  		if (filemap_range_has_page(mapping, pos, end))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
