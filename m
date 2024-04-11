Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBDB4653A
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Apr 2024 22:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712875319; cv=none; b=UhmildmWAeKTG1GNgLKxCX7Tebr6ZAnqjbjihM97OCFZH115yh3Je8qEp6WfUXR4dspUZ+9gxOf1vy1KOgBCd/JdP2atvN+vqsd7Yn2SeZy+270W/Ncbouu3UZQrOHxu/BG3qIm43CPtbw1BeBWjTaPxz36ENj0dmZ7P00OD0i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712875319; c=relaxed/simple;
	bh=iA6JVX/UmzB9xuDVa2AHAVgpw0J2IF5nBISJPjg9ZYc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q127MS8CEQnmzkinriN6BAF9SBxtRmuuUJvklRSj4MwSutPgksukaAVpwJBJ+yYGLB0UNFYjAUpsGRijQKBGo5i17tKoxE4kfd29DE2kBOm+qDg8p90kjTor63/ELzpxR2mu9WvoZaCOItxdc0I/7suiuTZoSlPmeNejI5Dhedo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yv57l+h2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yv57l+h2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712875315; x=1744411315;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iA6JVX/UmzB9xuDVa2AHAVgpw0J2IF5nBISJPjg9ZYc=;
  b=Yv57l+h2PItTocmtFarCio8dJiR9oyCVZY6Ksx3SRjiysWJDuNnebIVp
   c0N8u/JAyxvgU7ElJ2yoQJm90NBzBi5QCihHl8XJ3r/I4AC4FjQkHc3fE
   QNxH+ZTPuRRpXc8RiLEOkmi99TPE5qJrAoEkvv3SykOE0w/DaOS1VrkZp
   pGSZ4YbFVCyDLJD9koPhqajbO498oghDjbA2p379KOwHqUqKFFwRwjNd6
   BRx1FvYyjgPhdLQFl2czyxktoVYTj7HV+kuaGG7God2BgLNOmhDw0Y1mo
   7E7tmoL13hHgt2kDqlwkAUkCaNwf0TrBjbyqsQjSByVLztH3KDzeIGSRP
   Q==;
X-CSE-ConnectionGUID: AH9CovnZSEiEhzXxUyQwIA==
X-CSE-MsgGUID: kv/57A7bS8GPsZGgENxybQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8539434"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="8539434"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 15:41:54 -0700
X-CSE-ConnectionGUID: B477KekBSx+pck6bcd65og==
X-CSE-MsgGUID: xjq5SuSURLmqpdPTWrld4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="25513388"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 11 Apr 2024 15:41:53 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rv379-000937-0i;
	Thu, 11 Apr 2024 22:41:51 +0000
Date: Fri, 12 Apr 2024 06:41:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 118/415] drivers/hid/hid-picolcd_debugfs.c:49
 picolcd_debug_reset_write() warn: potential spectre issue 'buf' [w] (local
 cap)
Message-ID: <202404120631.XwkeGYur-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   8e79f6c3d0a118031e843758491803e38794f6e8
commit: 63f49fb8afefcadfed5b557296f8f7345a772633 [118/415] drivers/hid: convert to read/write iterators
:::::: branch date: 4 hours ago
:::::: commit date: 22 hours ago
config: x86_64-randconfig-161-20240411 (https://download.01.org/0day-ci/archive/20240412/202404120631.XwkeGYur-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404120631.XwkeGYur-lkp@intel.com/

smatch warnings:
drivers/hid/hid-picolcd_debugfs.c:49 picolcd_debug_reset_write() warn: potential spectre issue 'buf' [w] (local cap)

vim +/buf +49 drivers/hid/hid-picolcd_debugfs.c

fabdbf2fd22fa1 Bruno Prémont 2012-07-30  36  
63f49fb8afefca Jens Axboe    2024-04-05  37  static ssize_t picolcd_debug_reset_write(struct kiocb *iocb,
63f49fb8afefca Jens Axboe    2024-04-05  38  					 struct iov_iter *from)
fabdbf2fd22fa1 Bruno Prémont 2012-07-30  39  {
63f49fb8afefca Jens Axboe    2024-04-05  40  	struct picolcd_data *data = ((struct seq_file *)iocb->ki_filp->private_data)->private;
63f49fb8afefca Jens Axboe    2024-04-05  41  	size_t count = iov_iter_count(from);
fabdbf2fd22fa1 Bruno Prémont 2012-07-30  42  	char buf[32];
fabdbf2fd22fa1 Bruno Prémont 2012-07-30  43  	size_t cnt = min(count, sizeof(buf)-1);
63f49fb8afefca Jens Axboe    2024-04-05  44  	if (!copy_from_iter_full(buf, cnt, from))
fabdbf2fd22fa1 Bruno Prémont 2012-07-30  45  		return -EFAULT;
fabdbf2fd22fa1 Bruno Prémont 2012-07-30  46  
fabdbf2fd22fa1 Bruno Prémont 2012-07-30  47  	while (cnt > 0 && (buf[cnt-1] == ' ' || buf[cnt-1] == '\n'))
fabdbf2fd22fa1 Bruno Prémont 2012-07-30  48  		cnt--;
fabdbf2fd22fa1 Bruno Prémont 2012-07-30 @49  	buf[cnt] = '\0';
fabdbf2fd22fa1 Bruno Prémont 2012-07-30  50  	if (strcmp(buf, "all") == 0) {
fabdbf2fd22fa1 Bruno Prémont 2012-07-30  51  		picolcd_reset(data->hdev);
fabdbf2fd22fa1 Bruno Prémont 2012-07-30  52  		picolcd_fb_reset(data, 1);
fabdbf2fd22fa1 Bruno Prémont 2012-07-30  53  	} else if (strcmp(buf, "fb") == 0) {
fabdbf2fd22fa1 Bruno Prémont 2012-07-30  54  		picolcd_fb_reset(data, 1);
fabdbf2fd22fa1 Bruno Prémont 2012-07-30  55  	} else {
fabdbf2fd22fa1 Bruno Prémont 2012-07-30  56  		return -EINVAL;
fabdbf2fd22fa1 Bruno Prémont 2012-07-30  57  	}
fabdbf2fd22fa1 Bruno Prémont 2012-07-30  58  	return count;
fabdbf2fd22fa1 Bruno Prémont 2012-07-30  59  }
fabdbf2fd22fa1 Bruno Prémont 2012-07-30  60  

:::::: The code at line 49 was first introduced by commit
:::::: fabdbf2fd22fa170b4c5340dbdda5c8cd88fb205 HID: picoLCD: split driver code

:::::: TO: Bruno Prémont <bonbons@linux-vserver.org>
:::::: CC: Jiri Kosina <jkosina@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
