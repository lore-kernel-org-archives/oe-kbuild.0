Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B55C199920
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Mar 2026 01:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773020300; cv=none; b=aupKKIhXL1ybK9SAt1iDC3Mz7jUOBKpbPoJD93fhNKVx3QtCy/mix4vuLnUfZ3CSiVVcRrNfP0Hn/b1PuVfkZu1I3JOdgJacjL2FKDW5Zhr6xkWRRW95EsqxqcNfNCBhzHiIh/9RrDdFetXtmAvGC7Dz3sCN+a7uXuEJ/VXfpOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773020300; c=relaxed/simple;
	bh=cgQOaBfBTlk3RsnVdda4A1n5rjUfDSdx8AXY3NYnZjk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ebm0WySWDSs/7xulanxEN0gjN/fwdx7zkivx03WBb/YM47LcozQ/3vtjvPrlKQanCcL944EmNDMsjGEICaCsPW03CyVBj8Q1NYJ3ZFOx/VoPZAC3hyZP/xHicPGUSa/8Lm2wUS9Vr42P03VARPSD2Aj8eC+YKcI/HNVM4P5GM+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=geyc5/HN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="geyc5/HN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773020298; x=1804556298;
  h=date:from:to:cc:subject:message-id;
  bh=cgQOaBfBTlk3RsnVdda4A1n5rjUfDSdx8AXY3NYnZjk=;
  b=geyc5/HNhfdJLGjQ+vUEHEh4jFonknFcwKeDX8jo1ZTE8cb/g/vlVu72
   EJ1IH7FQT2t+GSuQvkXOxpkTXxamuRJGHSFUoRrE8eYYnql/f5iU8+wnk
   tZxKJxwI4zBuLbmT7VOxs03v743KydIvbJQPSGiwIn2572oM3qo6JUdh5
   4uDiALlvK0swi6pZWmQYcS7YnEoV6fG9s0kurNsa+XrXkB7TlxR1oSqtP
   VDl53nTyDxry1zaqW45FgbCI/7Firm1PDMoSLbzeeP5ruYlGCDYJWd6YV
   6rZwTzYrcK4iqD5kakJAIht1ahBkyAZXCupKSghK9e61RSKzx/ZyTPHEI
   Q==;
X-CSE-ConnectionGUID: Hxi/qkf1S1qrjQXmjxe3cw==
X-CSE-MsgGUID: t9t8kqvtSvC+vKoZZlC/ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="76640770"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="76640770"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 18:38:18 -0700
X-CSE-ConnectionGUID: m1uppxLIQRqSBHmd0sxM4w==
X-CSE-MsgGUID: 5OAE+13SQDiEQUA2ukVgGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="224541051"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Mar 2026 18:38:16 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzPZV-000000003Xg-0onx;
	Mon, 09 Mar 2026 01:38:13 +0000
Date: Mon, 09 Mar 2026 09:37:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 155/471] drivers/usb/chipidea/debug.c:89
 ci_port_test_write() warn: potential spectre issue 'buf' [w]
Message-ID: <202603090959.FnlhKmlH-lkp@intel.com>
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
commit: c08703a0ede98e3db453b782579c22892e8909ab [155/471] usb: chipidea: convert to read/write iterators
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: openrisc-randconfig-r071-20260307 (https://download.01.org/0day-ci/archive/20260309/202603090959.FnlhKmlH-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603090959.FnlhKmlH-lkp@intel.com/

smatch warnings:
drivers/usb/chipidea/debug.c:89 ci_port_test_write() warn: potential spectre issue 'buf' [w]

vim +/buf +89 drivers/usb/chipidea/debug.c

e443b333629f82c Alexander Shishkin  2012-05-11   70  
5722a8efc6c8979 Lee Jones           2020-07-03   71  /*
2d6512892c10655 Alexander Shishkin  2013-03-30   72   * ci_port_test_write: writes port test mode
e443b333629f82c Alexander Shishkin  2012-05-11   73   */
c08703a0ede98e3 Jens Axboe          2024-04-11   74  static ssize_t ci_port_test_write(struct kiocb *iocb, struct iov_iter *from)
e443b333629f82c Alexander Shishkin  2012-05-11   75  {
c08703a0ede98e3 Jens Axboe          2024-04-11   76  	struct seq_file *s = iocb->ki_filp->private_data;
c08703a0ede98e3 Jens Axboe          2024-04-11   77  	size_t count = iov_iter_count(from);
8e22978c57087aa Alexander Shishkin  2013-06-24   78  	struct ci_hdrc *ci = s->private;
e443b333629f82c Alexander Shishkin  2012-05-11   79  	unsigned long flags;
e443b333629f82c Alexander Shishkin  2012-05-11   80  	unsigned mode;
2d6512892c10655 Alexander Shishkin  2013-03-30   81  	char buf[32];
2d6512892c10655 Alexander Shishkin  2013-03-30   82  	int ret;
e443b333629f82c Alexander Shishkin  2012-05-11   83  
bd5fb0aec3dd7cd Heinrich Schuchardt 2015-04-28   84  	count = min_t(size_t, sizeof(buf) - 1, count);
c08703a0ede98e3 Jens Axboe          2024-04-11   85  	if (!copy_from_iter_full(buf, count, from))
2d6512892c10655 Alexander Shishkin  2013-03-30   86  		return -EFAULT;
e443b333629f82c Alexander Shishkin  2012-05-11   87  
bd5fb0aec3dd7cd Heinrich Schuchardt 2015-04-28   88  	/* sscanf requires a zero terminated string */
bd5fb0aec3dd7cd Heinrich Schuchardt 2015-04-28  @89  	buf[count] = '\0';
bd5fb0aec3dd7cd Heinrich Schuchardt 2015-04-28   90  
2d6512892c10655 Alexander Shishkin  2013-03-30   91  	if (sscanf(buf, "%u", &mode) != 1)
2d6512892c10655 Alexander Shishkin  2013-03-30   92  		return -EINVAL;
e443b333629f82c Alexander Shishkin  2012-05-11   93  
3c724888d2b1e08 Alan                2016-02-15   94  	if (mode > 255)
3c724888d2b1e08 Alan                2016-02-15   95  		return -EBADRQC;
3c724888d2b1e08 Alan                2016-02-15   96  
bc24937943d9f71 Li Jun              2015-07-29   97  	pm_runtime_get_sync(ci->dev);
26c696c678c4ce1 Richard Zhao        2012-07-07   98  	spin_lock_irqsave(&ci->lock, flags);
2d6512892c10655 Alexander Shishkin  2013-03-30   99  	ret = hw_port_test_set(ci, mode);
26c696c678c4ce1 Richard Zhao        2012-07-07  100  	spin_unlock_irqrestore(&ci->lock, flags);
bc24937943d9f71 Li Jun              2015-07-29  101  	pm_runtime_put_sync(ci->dev);
e443b333629f82c Alexander Shishkin  2012-05-11  102  
2d6512892c10655 Alexander Shishkin  2013-03-30  103  	return ret ? ret : count;
e443b333629f82c Alexander Shishkin  2012-05-11  104  }
2d6512892c10655 Alexander Shishkin  2013-03-30  105  

:::::: The code at line 89 was first introduced by commit
:::::: bd5fb0aec3dd7cde7ec4c397b10e55d4c9626d8d usb: chipidea: debug: avoid out of bound read

:::::: TO: Heinrich Schuchardt <xypron.glpk@gmx.de>
:::::: CC: Peter Chen <peter.chen@freescale.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
