Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C899E6FCA
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Mar 2024 08:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709455245; cv=none; b=VGn5GOeh6Dxj8aDz5PVtpG29nEdBltC9aGONKknmdqj/MW9zDSxSR84+4mR3H7MOqiQAr4EAyztBtuZRc+4oPMaRQsPQnDrVj3Y36oTpwaTRa0yEzLLQpnOcnj2rNlsV4l9Ynz9ciixQIMea3XfmlfnhcBLKbjpbPmR2nTKxihk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709455245; c=relaxed/simple;
	bh=m+ED8bz148pnDLwSLnmJxjBxQxOb1MbK1NfrKELjXo4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MkmuimNn9bYEFEJEjPr1b9KtXCZiBbcASdc1il16Z+TSrtY8RG40YQx3qiPCxh2Xe/IkicSXnafCJqKRx6LaP3hxsdwYTqqnQMBGp/A99Oy0AjpyQtCJc5l/acr8n2hvy3hwku5YRh8HM8q0VVdh7nM/jCJwARWwrjh1/NyTeSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FlXBFyng; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FlXBFyng"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709455244; x=1740991244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m+ED8bz148pnDLwSLnmJxjBxQxOb1MbK1NfrKELjXo4=;
  b=FlXBFyngG72ryoP1GBfyQgio3AsheQAZXlGeq9li7twTftiqj5YDDQsU
   pHkkDNhSOPt4oDr4fY2R5U6h+YJ8y8B/N1Mk/stD0AIHq6HeVlb+s+jex
   U/oB7WtPpq8EP1xn+GS7dWtPCo04F3ontmjXIe/CSB/S2IbEaBv4xAUwW
   4kZQ6D+3tiS0DJSMjVUHGm6KFfe9RM9y3IRCyC4Mang7pCmUm1HLQHeK4
   RrQO29iIxe2kdEeFsdPofbyjum6E+wzA/FV2v2CEAzoDkZZv7XX1Z9A+i
   AbFL/r4sb1jZblTp2svtkfviYjiX2MvRrsILfraZRm+UD87Q4v8MV2wK1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="21496132"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="21496132"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 00:40:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="13231281"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Mar 2024 00:40:40 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rghOg-0001XU-0D;
	Sun, 03 Mar 2024 08:40:38 +0000
Date: Sun, 3 Mar 2024 16:39:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [legion:patchset/cons-font-info/v1.0 1/5]
 drivers/tty/vt/vt_ioctl.c:483 vt_k_ioctl() warn: statement has no effect 3
Message-ID: <202403031617.Y34RDH5R-lkp@intel.com>
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
TO: Alexey Gladkov <legion@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git patchset/cons-font-info/v1.0
head:   06733914c1d2d19ebb61cdf6cd96d0a45d4da6ba
commit: 784438040507c68171fd2c47597f8ab85c8e6ab8 [1/5] VT: Add KDFONTINFO ioctl
:::::: branch date: 17 hours ago
:::::: commit date: 18 hours ago
config: i386-randconfig-141-20240303 (https://download.01.org/0day-ci/archive/20240303/202403031617.Y34RDH5R-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403031617.Y34RDH5R-lkp@intel.com/

smatch warnings:
drivers/tty/vt/vt_ioctl.c:483 vt_k_ioctl() warn: statement has no effect 3

vim +483 drivers/tty/vt/vt_ioctl.c

^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  355  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  356  	/* Linux m68k/i386 interface for setting the keyboard delay/repeat rate */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  357  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  358  	case KDKBDREP:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  359  	{
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  360  		struct kbd_repeat kbrep;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  361  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  362  		if (!capable(CAP_SYS_TTY_CONFIG))
4001d7b7fc2710 drivers/tty/vt/vt_ioctl.c Alan Cox          2012-03-02  363  			return -EPERM;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  364  
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  365  		if (copy_from_user(&kbrep, up, sizeof(struct kbd_repeat)))
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  366  			return -EFAULT;
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  367  
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox          2008-04-30  368  		ret = kbd_rate(&kbrep);
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox          2008-04-30  369  		if (ret)
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  370  			return ret;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  371  		if (copy_to_user(up, &kbrep, sizeof(struct kbd_repeat)))
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  372  			return -EFAULT;
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox          2008-04-30  373  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  374  	}
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  375  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  376  	case KDSETMODE:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  377  		if (!perm)
4001d7b7fc2710 drivers/tty/vt/vt_ioctl.c Alan Cox          2012-03-02  378  			return -EPERM;
a4c53c830b2722 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  379  
2287a51ba82238 drivers/tty/vt/vt_ioctl.c Linus Torvalds    2021-08-30  380  		console_lock();
2287a51ba82238 drivers/tty/vt/vt_ioctl.c Linus Torvalds    2021-08-30  381  		ret = vt_kdsetmode(vc, arg);
2287a51ba82238 drivers/tty/vt/vt_ioctl.c Linus Torvalds    2021-08-30  382  		console_unlock();
2287a51ba82238 drivers/tty/vt/vt_ioctl.c Linus Torvalds    2021-08-30  383  		return ret;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  384  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  385  	case KDGETMODE:
eca734d8f0043e drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  386  		return put_user(vc->vc_mode, (int __user *)arg);
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  387  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  388  	case KDMAPDISP:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  389  	case KDUNMAPDISP:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  390  		/*
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  391  		 * these work like a combination of mmap and KDENABIO.
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  392  		 * this could be easily finished.
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  393  		 */
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  394  		return -EINVAL;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  395  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  396  	case KDSKBMODE:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  397  		if (!perm)
4001d7b7fc2710 drivers/tty/vt/vt_ioctl.c Alan Cox          2012-03-02  398  			return -EPERM;
079c9534a96da9 drivers/tty/vt/vt_ioctl.c Alan Cox          2012-02-28  399  		ret = vt_do_kdskbmode(console, arg);
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  400  		if (ret)
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  401  			return ret;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  402  		tty_ldisc_flush(tty);
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox          2008-04-30  403  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  404  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  405  	case KDGKBMODE:
eca734d8f0043e drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  406  		return put_user(vt_do_kdgkbmode(console), (int __user *)arg);
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  407  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  408  	/* this could be folded into KDSKBMODE, but for compatibility
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  409  	   reasons it is not so easy to fold KDGKBMETA into KDGKBMODE */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  410  	case KDSKBMETA:
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  411  		return vt_do_kdskbmeta(console, arg);
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  412  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  413  	case KDGKBMETA:
079c9534a96da9 drivers/tty/vt/vt_ioctl.c Alan Cox          2012-02-28  414  		/* FIXME: should review whether this is worth locking */
eca734d8f0043e drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  415  		return put_user(vt_do_kdgkbmeta(console), (int __user *)arg);
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  416  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  417  	case KDGETKEYCODE:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  418  	case KDSETKEYCODE:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  419  		if(!capable(CAP_SYS_TTY_CONFIG))
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  420  			perm = 0;
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  421  		return vt_do_kbkeycode_ioctl(cmd, up, perm);
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  422  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  423  	case KDGKBENT:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  424  	case KDSKBENT:
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  425  		return vt_do_kdsk_ioctl(cmd, up, perm, console);
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  426  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  427  	case KDGKBSENT:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  428  	case KDSKBSENT:
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  429  		return vt_do_kdgkb_ioctl(cmd, up, perm);
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  430  
247ff8e610cb63 drivers/tty/vt/vt_ioctl.c Alan Cox          2012-02-24  431  	/* Diacritical processing. Handled in keyboard.c as it has
247ff8e610cb63 drivers/tty/vt/vt_ioctl.c Alan Cox          2012-02-24  432  	   to operate on the keyboard locks and structures */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  433  	case KDGKBDIACR:
04c71976500352 drivers/char/vt_ioctl.c   Samuel Thibault   2007-10-16  434  	case KDGKBDIACRUC:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  435  	case KDSKBDIACR:
04c71976500352 drivers/char/vt_ioctl.c   Samuel Thibault   2007-10-16  436  	case KDSKBDIACRUC:
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  437  		return vt_do_diacrit(cmd, up, perm);
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  438  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  439  	/* the ioctls below read/set the flags usually shown in the leds */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  440  	/* don't use them - they will go away without warning */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  441  	case KDGKBLED:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  442  	case KDSKBLED:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  443  	case KDGETLED:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  444  	case KDSETLED:
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  445  		return vt_do_kdskled(console, cmd, arg, perm);
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  446  
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  447  	/*
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  448  	 * A process can indicate its willingness to accept signals
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  449  	 * generated by pressing an appropriate key combination.
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  450  	 * Thus, one can have a daemon that e.g. spawns a new console
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  451  	 * upon a keypress and then changes to it.
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  452  	 * See also the kbrequest field of inittab(5).
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  453  	 */
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  454  	case KDSIGACCEPT:
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  455  		if (!perm || !capable(CAP_KILL))
4001d7b7fc2710 drivers/tty/vt/vt_ioctl.c Alan Cox          2012-03-02  456  			return -EPERM;
7ed20e1ad521b5 drivers/char/vt_ioctl.c   Jesper Juhl       2005-05-01  457  		if (!valid_signal(arg) || arg < 1 || arg == SIGKILL)
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  458  			return -EINVAL;
0ce8179e248023 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  459  
81af8d67d4fc35 drivers/char/vt_ioctl.c   Eric W. Biederman 2006-10-02  460  		spin_lock_irq(&vt_spawn_con.lock);
81af8d67d4fc35 drivers/char/vt_ioctl.c   Eric W. Biederman 2006-10-02  461  		put_pid(vt_spawn_con.pid);
81af8d67d4fc35 drivers/char/vt_ioctl.c   Eric W. Biederman 2006-10-02  462  		vt_spawn_con.pid = get_pid(task_pid(current));
81af8d67d4fc35 drivers/char/vt_ioctl.c   Eric W. Biederman 2006-10-02  463  		vt_spawn_con.sig = arg;
81af8d67d4fc35 drivers/char/vt_ioctl.c   Eric W. Biederman 2006-10-02  464  		spin_unlock_irq(&vt_spawn_con.lock);
9cc3c22bf017f3 drivers/char/vt_ioctl.c   Alan Cox          2008-04-30  465  		break;
^1da177e4c3f41 drivers/char/vt_ioctl.c   Linus Torvalds    2005-04-16  466  
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  467  	case KDFONTOP: {
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  468  		struct console_font_op op;
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  469  
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  470  		if (copy_from_user(&op, up, sizeof(op)))
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  471  			return -EFAULT;
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  472  		if (!perm && op.op != KD_FONT_OP_GET)
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  473  			return -EPERM;
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  474  		ret = con_font_op(vc, &op);
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  475  		if (ret)
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  476  			return ret;
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  477  		if (copy_to_user(up, &op, sizeof(op)))
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  478  			return -EFAULT;
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  479  		break;
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  480  	}
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  481  
784438040507c6 drivers/tty/vt/vt_ioctl.c Alexey Gladkov    2024-02-15  482  	case KDFONTINFO:
784438040507c6 drivers/tty/vt/vt_ioctl.c Alexey Gladkov    2024-02-15 @483  		struct console_font_info fnt_info;
784438040507c6 drivers/tty/vt/vt_ioctl.c Alexey Gladkov    2024-02-15  484  
784438040507c6 drivers/tty/vt/vt_ioctl.c Alexey Gladkov    2024-02-15  485  		if (copy_from_user(&fnt_info, up, sizeof(fnt_info)))
784438040507c6 drivers/tty/vt/vt_ioctl.c Alexey Gladkov    2024-02-15  486  			return -EFAULT;
784438040507c6 drivers/tty/vt/vt_ioctl.c Alexey Gladkov    2024-02-15  487  		ret = con_font_info(vc, &fnt_info);
784438040507c6 drivers/tty/vt/vt_ioctl.c Alexey Gladkov    2024-02-15  488  		if (ret)
784438040507c6 drivers/tty/vt/vt_ioctl.c Alexey Gladkov    2024-02-15  489  			return ret;
784438040507c6 drivers/tty/vt/vt_ioctl.c Alexey Gladkov    2024-02-15  490  		if (copy_to_user(up, &fnt_info, sizeof(fnt_info)))
784438040507c6 drivers/tty/vt/vt_ioctl.c Alexey Gladkov    2024-02-15  491  			return -EFAULT;
784438040507c6 drivers/tty/vt/vt_ioctl.c Alexey Gladkov    2024-02-15  492  		break;
784438040507c6 drivers/tty/vt/vt_ioctl.c Alexey Gladkov    2024-02-15  493  
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  494  	default:
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  495  		return -ENOIOCTLCMD;
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  496  	}
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  497  
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  498  	return 0;
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  499  }
832a62ab6b7d32 drivers/tty/vt/vt_ioctl.c Jiri Slaby        2020-06-15  500  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
