Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9BA2D9499
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Mar 2026 21:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772918537; cv=none; b=bJM0CythVMBY67WgL5XnitfcwnrCEOE7SCP54t3x3OAt69eDQH0dfHfQhCR5GQjEDZp1ivcWzl8IjLtZRe+MOFYDNOfjtoxyuZ1CylJx2pzO8oClOdH2l0b0YP3Es9sRYRUDFLdfCZOr1uZzLysr9EHaMKEfIsyw2fnB6temg3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772918537; c=relaxed/simple;
	bh=aS5sbRzbzKOCiF4c4+AZTLDc6bSWQlpvU0vDoi82cK4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NFF3iqLQKbgTiQKln730dLX+2+vZ0aVwGdahMmtOGNucws+FjsbKVchbEt8HKHpFHIAz/PVlmQBJ4oR9tTi1zpH4eWJ3q7a+DdmMdmN1GlRi1xGJtTt2p2rnR5olYVhu077ErnrCXyynCCFKV6B5GFmAUykGKkml1m2iGf1M18Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FU6VHGv5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FU6VHGv5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772918533; x=1804454533;
  h=date:from:to:cc:subject:message-id;
  bh=aS5sbRzbzKOCiF4c4+AZTLDc6bSWQlpvU0vDoi82cK4=;
  b=FU6VHGv5SIxSqz444gXKihnktAUg8W1GMowU0/7QSz/JYQgO51padbgt
   fDcKuV4tYjB2d2OlAC54mRQ/cQpiuEnWj+UmM/rfi6xO7KhP7fuIa8cYL
   Luxx4ORpn6Q/GTPANuVwAssDElZHMsTTTS6dJGMcclgYECcev113AaPso
   /l59J5N5QTkpsZKTJOUf2ax0cAZ5EbzPJyhgMK/ByWjqb4j5u4NBh58pV
   qiirwLOC0hvf10IlvekSw5F3IY6KovHuEBSeP/R95EYUwevsBYo+teuSC
   8GNtUDu0FNaMsu2ORaYrlw3e7uM/SZ7HJ6irDqtBi2BCO/D3+IYqIW1N5
   Q==;
X-CSE-ConnectionGUID: BTZ7Z3lzSluZkU5j2Xpaiw==
X-CSE-MsgGUID: 56y3WA0lShCZkpqz+3nl7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="77596247"
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="77596247"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 13:22:13 -0800
X-CSE-ConnectionGUID: 0ssdUYSkQOaVAk3ud40b8g==
X-CSE-MsgGUID: YHoHYR4STxqvGPbIQCzPtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="224295996"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Mar 2026 13:22:11 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyz68-000000002dp-2uhB;
	Sat, 07 Mar 2026 21:22:08 +0000
Date: Sun, 08 Mar 2026 05:21:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 209/471] drivers/misc/lkdtm/core.c:243
 lkdtm_debugfs_entry() warn: potential spectre issue 'buf' [w]
Message-ID: <202603080518.9I0YClKw-lkp@intel.com>
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
commit: 49454d0810eb960fba61e80f64d9b5f0f877fa17 [209/471] misc: lkdtm: convert to read/write iterators
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: i386-randconfig-141-20260307 (https://download.01.org/0day-ci/archive/20260308/202603080518.9I0YClKw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603080518.9I0YClKw-lkp@intel.com/

smatch warnings:
drivers/misc/lkdtm/core.c:243 lkdtm_debugfs_entry() warn: potential spectre issue 'buf' [w]
drivers/misc/lkdtm/core.c:318 direct_entry() warn: potential spectre issue 'buf' [w]

vim +/buf +243 drivers/misc/lkdtm/core.c

2b271cb7203dd4 drivers/misc/lkdtm_core.c Arnd Bergmann    2016-07-15  223  
49454d0810eb96 drivers/misc/lkdtm/core.c Jens Axboe       2024-04-05  224  static ssize_t lkdtm_debugfs_entry(struct kiocb *iocb, struct iov_iter *from)
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  225  {
49454d0810eb96 drivers/misc/lkdtm/core.c Jens Axboe       2024-04-05  226  	struct crashpoint *crashpoint = file_inode(iocb->ki_filp)->i_private;
75f98b7ab748a6 drivers/misc/lkdtm_core.c Kees Cook        2017-10-20  227  	const struct crashtype *crashtype = NULL;
49454d0810eb96 drivers/misc/lkdtm/core.c Jens Axboe       2024-04-05  228  	size_t count = iov_iter_count(from);
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  229  	char *buf;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  230  	int err;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  231  
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  232  	if (count >= PAGE_SIZE)
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  233  		return -EINVAL;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  234  
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  235  	buf = (char *)__get_free_page(GFP_KERNEL);
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  236  	if (!buf)
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  237  		return -ENOMEM;
49454d0810eb96 drivers/misc/lkdtm/core.c Jens Axboe       2024-04-05  238  	if (!copy_from_iter_full(buf, count, from)) {
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  239  		free_page((unsigned long) buf);
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  240  		return -EFAULT;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  241  	}
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  242  	/* NULL-terminate and remove enter */
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05 @243  	buf[count] = '\0';
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  244  	strim(buf);
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  245  
c479e3fd88703c drivers/misc/lkdtm_core.c Kees Cook        2016-06-29  246  	crashtype = find_crashtype(buf);
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  247  	free_page((unsigned long)buf);
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  248  
c479e3fd88703c drivers/misc/lkdtm_core.c Kees Cook        2016-06-29  249  	if (!crashtype)
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  250  		return -EINVAL;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  251  
c479e3fd88703c drivers/misc/lkdtm_core.c Kees Cook        2016-06-29  252  	err = lkdtm_register_cpoint(crashpoint, crashtype);
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  253  	if (err < 0)
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  254  		return err;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  255  
49454d0810eb96 drivers/misc/lkdtm/core.c Jens Axboe       2024-04-05  256  	iocb->ki_pos += count;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  257  
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  258  	return count;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  259  }
2b271cb7203dd4 drivers/misc/lkdtm_core.c Arnd Bergmann    2016-07-15  260  #endif
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  261  
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  262  /* Generic read callback that just prints out the available crash types */
49454d0810eb96 drivers/misc/lkdtm/core.c Jens Axboe       2024-04-05  263  static ssize_t lkdtm_debugfs_read(struct kiocb *iocb, struct iov_iter *to)
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  264  {
73f62e60d80c2d drivers/misc/lkdtm/core.c Kees Cook        2022-03-03  265  	int n, cat, idx;
73f62e60d80c2d drivers/misc/lkdtm/core.c Kees Cook        2022-03-03  266  	ssize_t out;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  267  	char *buf;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  268  
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  269  	buf = (char *)__get_free_page(GFP_KERNEL);
086ff4b3a7fb9c drivers/misc/lkdtm.c      Alan Cox         2012-07-30  270  	if (buf == NULL)
086ff4b3a7fb9c drivers/misc/lkdtm.c      Alan Cox         2012-07-30  271  		return -ENOMEM;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  272  
87bf65bc108e5d drivers/misc/lkdtm/core.c Silvio Cesare    2019-01-12  273  	n = scnprintf(buf, PAGE_SIZE, "Available crash types:\n");
73f62e60d80c2d drivers/misc/lkdtm/core.c Kees Cook        2022-03-03  274  
73f62e60d80c2d drivers/misc/lkdtm/core.c Kees Cook        2022-03-03  275  	for (cat = 0; cat < ARRAY_SIZE(crashtype_categories); cat++) {
73f62e60d80c2d drivers/misc/lkdtm/core.c Kees Cook        2022-03-03  276  		for (idx = 0; idx < crashtype_categories[cat]->len; idx++) {
73f62e60d80c2d drivers/misc/lkdtm/core.c Kees Cook        2022-03-03  277  			struct crashtype *crashtype;
73f62e60d80c2d drivers/misc/lkdtm/core.c Kees Cook        2022-03-03  278  
73f62e60d80c2d drivers/misc/lkdtm/core.c Kees Cook        2022-03-03  279  			crashtype = &crashtype_categories[cat]->crashtypes[idx];
87bf65bc108e5d drivers/misc/lkdtm/core.c Silvio Cesare    2019-01-12  280  			n += scnprintf(buf + n, PAGE_SIZE - n, "%s\n",
73f62e60d80c2d drivers/misc/lkdtm/core.c Kees Cook        2022-03-03  281  				      crashtype->name);
73f62e60d80c2d drivers/misc/lkdtm/core.c Kees Cook        2022-03-03  282  		}
c479e3fd88703c drivers/misc/lkdtm_core.c Kees Cook        2016-06-29  283  	}
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  284  	buf[n] = '\0';
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  285  
49454d0810eb96 drivers/misc/lkdtm/core.c Jens Axboe       2024-04-05  286  	out = simple_copy_to_iter(buf, &iocb->ki_pos, n, to);
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  287  	free_page((unsigned long) buf);
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  288  
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  289  	return out;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  290  }
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  291  
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  292  static int lkdtm_debugfs_open(struct inode *inode, struct file *file)
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  293  {
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  294  	return 0;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  295  }
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  296  
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  297  /* Special entry to just crash directly. Available without KPROBEs */
49454d0810eb96 drivers/misc/lkdtm/core.c Jens Axboe       2024-04-05  298  static ssize_t direct_entry(struct kiocb *iocb, struct iov_iter *from)
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  299  {
75f98b7ab748a6 drivers/misc/lkdtm_core.c Kees Cook        2017-10-20  300  	const struct crashtype *crashtype;
49454d0810eb96 drivers/misc/lkdtm/core.c Jens Axboe       2024-04-05  301  	size_t count = iov_iter_count(from);
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  302  	char *buf;
84022cff50511e drivers/misc/lkdtm/core.c Douglas Anderson 2024-01-22  303  	int err;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  304  
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  305  	if (count >= PAGE_SIZE)
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  306  		return -EINVAL;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  307  	if (count < 1)
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  308  		return -EINVAL;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  309  
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  310  	buf = (char *)__get_free_page(GFP_KERNEL);
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  311  	if (!buf)
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  312  		return -ENOMEM;
49454d0810eb96 drivers/misc/lkdtm/core.c Jens Axboe       2024-04-05  313  	if (!copy_from_iter_full(buf, count, from)) {
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  314  		free_page((unsigned long) buf);
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  315  		return -EFAULT;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  316  	}
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  317  	/* NULL-terminate and remove enter */
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05 @318  	buf[count] = '\0';
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  319  	strim(buf);
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  320  
c479e3fd88703c drivers/misc/lkdtm_core.c Kees Cook        2016-06-29  321  	crashtype = find_crashtype(buf);
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  322  	free_page((unsigned long) buf);
c479e3fd88703c drivers/misc/lkdtm_core.c Kees Cook        2016-06-29  323  	if (!crashtype)
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  324  		return -EINVAL;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  325  
c479e3fd88703c drivers/misc/lkdtm_core.c Kees Cook        2016-06-29  326  	pr_info("Performing direct entry %s\n", crashtype->name);
84022cff50511e drivers/misc/lkdtm/core.c Douglas Anderson 2024-01-22  327  	err = lkdtm_do_action(crashtype);
49454d0810eb96 drivers/misc/lkdtm/core.c Jens Axboe       2024-04-05  328  	iocb->ki_pos += count;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  329  
84022cff50511e drivers/misc/lkdtm/core.c Douglas Anderson 2024-01-22  330  	if (err)
84022cff50511e drivers/misc/lkdtm/core.c Douglas Anderson 2024-01-22  331  		return err;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  332  	return count;
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  333  }
0347af4ee39222 drivers/misc/lkdtm.c      Simon Kagstrom   2010-03-05  334  

:::::: The code at line 243 was first introduced by commit
:::::: 0347af4ee3922220f6bfe74b87b526aa709a0365 lkdtm: add debugfs access and loosen KPROBE ties

:::::: TO: Simon Kagstrom <simon.kagstrom@netinsight.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
