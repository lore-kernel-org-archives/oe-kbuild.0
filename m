Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3DD40DFCC
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Apr 2026 01:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776477392; cv=none; b=rlT7IHWv0m2PCrfdP/RBb3FzPQfmv6Y9Ub9Fzp5GtKE1v3Q5juLO7nvNtjNMbTJl8ftsDQrjbMqDqNx0R8lCkdMKVQ7UWfJvXVOfo4reNyN3K3iaVZJ664J2zLJRTE4Bl7YflGhCN5NmENQBRMMXHwNJThUOrCZCul5St7wf8f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776477392; c=relaxed/simple;
	bh=08OnE7tSrCq1pZBpCMuE/EI/6LkhcLiqIUswjzxybs8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rdtn8JdF1df8YFVNOsGSSfXzSwLgOSiRYltSVYIE1/lrqGNOiBt9LO0kcjUNiMcRlm522MYMqEEZEwR1YQnnRaoZCgrCreHAXtsNyu/1d0Nm4URjoDk655r/+fhZoJaDg5ph0cD6bJpO7sH9Nj1CEa50jYm5dd03c0uDSsWi0yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cx8xlcNj; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cx8xlcNj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776477391; x=1808013391;
  h=date:from:to:cc:subject:message-id;
  bh=08OnE7tSrCq1pZBpCMuE/EI/6LkhcLiqIUswjzxybs8=;
  b=Cx8xlcNjfvCv0rBd6knSzfnndVnpsyCQhQmhnc3qwkikYz4oW0IfI5ns
   yIO4gTfoS9x6oa0dk+ezwWjkVT1GCO77eimLCx0mBeA2KyBZlfhLFoeBQ
   +yO7bpq1HzHaM1szK7M1TQ6HD7v6By6PT6z1cAN7m0Xb9C2TppFfG8NVR
   VeSUcIGXm9nKVDYo1Hzw0dg8vnt4CtGX3BrPz+1iifyHwVqaH8BDKR6mI
   Y1BzZsAlmokVUclX0upyzuca1LYdykc/u8uoZWL22kNNiR37g9sUy0Efn
   ORrTs7lmSh2Ck2Jd7slMtkbDaW6WOwY4K7uiLiV4Fw5laUDremc3dbxU2
   A==;
X-CSE-ConnectionGUID: +YnabdfpQUOHWOCV2QL2ig==
X-CSE-MsgGUID: h7Or3EclTfKrY0jXj912aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77611085"
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; 
   d="scan'208";a="77611085"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 18:56:30 -0700
X-CSE-ConnectionGUID: HGBImf/VRx+cOTXx1NR7PA==
X-CSE-MsgGUID: 01L2EpnNTs+hoIKsdKif3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; 
   d="scan'208";a="224672454"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Apr 2026 18:56:30 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDuv4-000000000vw-3WjX;
	Sat, 18 Apr 2026 01:56:26 +0000
Date: Sat, 18 Apr 2026 09:56:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [asahilinux:bits/250-aop 40/69] drivers/parisc/lasi.c:216
 lasi_init_chip() warn: 'lasi->gsc_irq.irq' from request_irq() not released on
 lines: 207.
Message-ID: <202604180957.4QdAIxP6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sasha Finkelstein <fnkl.kernel@gmail.com>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   234b16b06a9869c5885af57b2853412e854c1216
commit: 1cfd636530209970d11b214bded5011c824dbe50 [40/69] rust: device: WIP(?): Make as_raw() public for AOP series
:::::: branch date: 2 days ago
:::::: commit date: 7 weeks ago
config: parisc-randconfig-r071-20260418 (https://download.01.org/0day-ci/archive/20260418/202604180957.4QdAIxP6-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604180957.4QdAIxP6-lkp@intel.com/

smatch warnings:
drivers/parisc/lasi.c:216 lasi_init_chip() warn: 'lasi->gsc_irq.irq' from request_irq() not released on lines: 207.

vim +216 drivers/parisc/lasi.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  159  
df8e5bc6b7b61c Adrian Bunk     2008-12-02  160  static int __init lasi_init_chip(struct parisc_device *dev)
^1da177e4c3f41 Linus Torvalds  2005-04-16  161  {
^1da177e4c3f41 Linus Torvalds  2005-04-16  162  	struct gsc_asic *lasi;
^1da177e4c3f41 Linus Torvalds  2005-04-16  163  	int ret;
^1da177e4c3f41 Linus Torvalds  2005-04-16  164  
cb6fc18e9ca615 Helge Deller    2006-01-17  165  	lasi = kzalloc(sizeof(*lasi), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds  2005-04-16  166  	if (!lasi)
^1da177e4c3f41 Linus Torvalds  2005-04-16  167  		return -ENOMEM;
^1da177e4c3f41 Linus Torvalds  2005-04-16  168  
^1da177e4c3f41 Linus Torvalds  2005-04-16  169  	lasi->name = "Lasi";
53f01bba49938f Matthew Wilcox  2005-10-21  170  	lasi->hpa = dev->hpa.start;
^1da177e4c3f41 Linus Torvalds  2005-04-16  171  
^1da177e4c3f41 Linus Torvalds  2005-04-16  172  	/* Check the 4-bit (yes, only 4) version register */
^1da177e4c3f41 Linus Torvalds  2005-04-16  173  	lasi->version = gsc_readl(lasi->hpa + LASI_VER) & 0xf;
^1da177e4c3f41 Linus Torvalds  2005-04-16  174  	printk(KERN_INFO "%s version %d at 0x%lx found.\n",
^1da177e4c3f41 Linus Torvalds  2005-04-16  175  		lasi->name, lasi->version, lasi->hpa);
^1da177e4c3f41 Linus Torvalds  2005-04-16  176  
^1da177e4c3f41 Linus Torvalds  2005-04-16  177  	/* initialize the chassis LEDs really early */ 
^1da177e4c3f41 Linus Torvalds  2005-04-16  178  	lasi_led_init(lasi->hpa);
^1da177e4c3f41 Linus Torvalds  2005-04-16  179  
^1da177e4c3f41 Linus Torvalds  2005-04-16  180  	/* Stop LASI barking for a bit */
^1da177e4c3f41 Linus Torvalds  2005-04-16  181  	lasi_init_irq(lasi);
^1da177e4c3f41 Linus Torvalds  2005-04-16  182  
^1da177e4c3f41 Linus Torvalds  2005-04-16  183  	/* the IRQ lasi should use */
939fc856676c26 Helge Deller    2022-03-27  184  	dev->irq = gsc_alloc_irq(&lasi->gsc_irq);
^1da177e4c3f41 Linus Torvalds  2005-04-16  185  	if (dev->irq < 0) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  186  		printk(KERN_ERR "%s(): cannot get GSC irq\n",
a8043ecb17bd2e Harvey Harrison 2008-05-14  187  				__func__);
^1da177e4c3f41 Linus Torvalds  2005-04-16  188  		kfree(lasi);
^1da177e4c3f41 Linus Torvalds  2005-04-16  189  		return -EBUSY;
^1da177e4c3f41 Linus Torvalds  2005-04-16  190  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  191  
939fc856676c26 Helge Deller    2022-03-27  192  	lasi->eim = ((u32) lasi->gsc_irq.txn_addr) | lasi->gsc_irq.txn_data;
^1da177e4c3f41 Linus Torvalds  2005-04-16  193  
939fc856676c26 Helge Deller    2022-03-27  194  	ret = request_irq(lasi->gsc_irq.irq, gsc_asic_intr, 0, "lasi", lasi);
^1da177e4c3f41 Linus Torvalds  2005-04-16  195  	if (ret < 0) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  196  		kfree(lasi);
^1da177e4c3f41 Linus Torvalds  2005-04-16  197  		return ret;
^1da177e4c3f41 Linus Torvalds  2005-04-16  198  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  199  
^1da177e4c3f41 Linus Torvalds  2005-04-16  200  	/* enable IRQ's for devices below LASI */
^1da177e4c3f41 Linus Torvalds  2005-04-16  201  	gsc_writel(lasi->eim, lasi->hpa + OFFSET_IAR);
^1da177e4c3f41 Linus Torvalds  2005-04-16  202  
^1da177e4c3f41 Linus Torvalds  2005-04-16  203  	/* Done init'ing, register this driver */
^1da177e4c3f41 Linus Torvalds  2005-04-16  204  	ret = gsc_common_setup(dev, lasi);
^1da177e4c3f41 Linus Torvalds  2005-04-16  205  	if (ret) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  206  		kfree(lasi);
^1da177e4c3f41 Linus Torvalds  2005-04-16  207  		return ret;
^1da177e4c3f41 Linus Torvalds  2005-04-16  208  	}    
^1da177e4c3f41 Linus Torvalds  2005-04-16  209  
^1da177e4c3f41 Linus Torvalds  2005-04-16  210  	gsc_fixup_irqs(dev, lasi, lasi_choose_irq);
^1da177e4c3f41 Linus Torvalds  2005-04-16  211  
e71d47dc2a6c9a Helge Deller    2023-08-12  212  	/* register the LASI power off function */
e71d47dc2a6c9a Helge Deller    2023-08-12  213  	register_sys_off_handler(SYS_OFF_MODE_POWER_OFF,
e71d47dc2a6c9a Helge Deller    2023-08-12  214  		SYS_OFF_PRIO_DEFAULT, lasi_power_off, lasi);
^1da177e4c3f41 Linus Torvalds  2005-04-16  215  
^1da177e4c3f41 Linus Torvalds  2005-04-16 @216  	return ret;
^1da177e4c3f41 Linus Torvalds  2005-04-16  217  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  218  

:::::: The code at line 216 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
