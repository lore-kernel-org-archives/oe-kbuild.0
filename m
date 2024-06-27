Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300C922F1C
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Jun 2024 19:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719518375; cv=none; b=neiCKGP356TP5PFFuh0iLVYlU1RZSTgsBMFzNSYwT5nBT/Q+zAfz9V82VSBS/zvaZRlHAw1rkt1DVihWgBnRLFxOuJAJPQyAqJ5vc/ZLB9AwyUwfxfYDa+El2OpEJlD6KinCup0dehlPwSO+SlH2RxqVpODig/2DsKSOZ2Zs54k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719518375; c=relaxed/simple;
	bh=n95GyirTPSve7hlU03MFbmZpk/KXZK7jEVQfzwtdWKk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JWXQu+gD0affZ2eeRWyp4tIkiOkAo4rUxXeFtIZb1gOW39fjQS9YskSCPGD7JpFKIiIviqj1p7uzJthktUyJgkAnvEs+OQuxNMMhsUajVlm+hNDtcWIn19s2f4fyYCf/6GZOkj3G/ZwOdbHiuni2s8HpfVUXN6jM242wQpQFSsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P1JYlOGA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P1JYlOGA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719518373; x=1751054373;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=n95GyirTPSve7hlU03MFbmZpk/KXZK7jEVQfzwtdWKk=;
  b=P1JYlOGAZ5KwjiHR/3rYLiW7NJZl7foDSfNUUT86UvDCkJ938mrU1gqm
   zcnKLHj4gFyV7EyW+gW+yIc2tB2mHYju0XTqkfAI6EzSKjnw6CWFkFsbb
   xODcdvnW9JtjF3DrS8+pNvRdSgfnHQwcOb5jH+1T/6rMEQdGkFMPp+AbE
   PGjgzUIIhObsAXEU+JF1S11a4nBsTmB6/J3Y6i3CJgWzYRo/hUerU28oy
   pXhIArS7R05tOXVH2GFTy/qdrhAafJDUq4ZkABNjklFcJmKaDEgsH2L/F
   2tlI66GGob0sEjxKVHjgivKvIWOl528C0HOZbTMLY3o+5lZAJKGJxuOkC
   g==;
X-CSE-ConnectionGUID: 1FF139FZRv6HA9rdOUEM1A==
X-CSE-MsgGUID: VQX/sAWCQhedYKTDTuFwcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16498157"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="16498157"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 12:59:33 -0700
X-CSE-ConnectionGUID: Tl9Vd9SBTjSP7FTKBXYG0Q==
X-CSE-MsgGUID: hxGd2g5kQG+dZHE34JPHrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="75699634"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jun 2024 12:59:31 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMvHE-000GUo-2v;
	Thu, 27 Jun 2024 19:59:28 +0000
Date: Fri, 28 Jun 2024 03:58:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/input/keyboard/applespi.c:1833 applespi_drain_writes() warn:
 mixing irqsave and irq
Message-ID: <202406280337.1Av9qm8V-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Ronald Tschalär" <ronald@innovation.ch>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6d6444ba82053c716fb5ac83346202659023044e
commit: 038b1a05eae6666b731920e46f47d8e2332e07ff Input: add Apple SPI keyboard and trackpad driver
date:   4 years, 11 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 4 years, 11 months ago
config: x86_64-randconfig-161-20240628 (https://download.01.org/0day-ci/archive/20240628/202406280337.1Av9qm8V-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406280337.1Av9qm8V-lkp@intel.com/

smatch warnings:
drivers/input/keyboard/applespi.c:1833 applespi_drain_writes() warn: mixing irqsave and irq
drivers/input/keyboard/applespi.c:1845 applespi_drain_reads() warn: mixing irqsave and irq

vim +1833 drivers/input/keyboard/applespi.c

038b1a05eae666 Ronald Tschalär 2019-07-15  1825  
038b1a05eae666 Ronald Tschalär 2019-07-15  1826  static void applespi_drain_writes(struct applespi_data *applespi)
038b1a05eae666 Ronald Tschalär 2019-07-15  1827  {
038b1a05eae666 Ronald Tschalär 2019-07-15  1828  	unsigned long flags;
038b1a05eae666 Ronald Tschalär 2019-07-15  1829  
038b1a05eae666 Ronald Tschalär 2019-07-15  1830  	spin_lock_irqsave(&applespi->cmd_msg_lock, flags);
038b1a05eae666 Ronald Tschalär 2019-07-15  1831  
038b1a05eae666 Ronald Tschalär 2019-07-15  1832  	applespi->drain = true;
038b1a05eae666 Ronald Tschalär 2019-07-15 @1833  	wait_event_lock_irq(applespi->drain_complete, !applespi->write_active,
038b1a05eae666 Ronald Tschalär 2019-07-15  1834  			    applespi->cmd_msg_lock);
038b1a05eae666 Ronald Tschalär 2019-07-15  1835  
038b1a05eae666 Ronald Tschalär 2019-07-15  1836  	spin_unlock_irqrestore(&applespi->cmd_msg_lock, flags);
038b1a05eae666 Ronald Tschalär 2019-07-15  1837  }
038b1a05eae666 Ronald Tschalär 2019-07-15  1838  
038b1a05eae666 Ronald Tschalär 2019-07-15  1839  static void applespi_drain_reads(struct applespi_data *applespi)
038b1a05eae666 Ronald Tschalär 2019-07-15  1840  {
038b1a05eae666 Ronald Tschalär 2019-07-15  1841  	unsigned long flags;
038b1a05eae666 Ronald Tschalär 2019-07-15  1842  
038b1a05eae666 Ronald Tschalär 2019-07-15  1843  	spin_lock_irqsave(&applespi->cmd_msg_lock, flags);
038b1a05eae666 Ronald Tschalär 2019-07-15  1844  
038b1a05eae666 Ronald Tschalär 2019-07-15 @1845  	wait_event_lock_irq(applespi->drain_complete, !applespi->read_active,
038b1a05eae666 Ronald Tschalär 2019-07-15  1846  			    applespi->cmd_msg_lock);
038b1a05eae666 Ronald Tschalär 2019-07-15  1847  
038b1a05eae666 Ronald Tschalär 2019-07-15  1848  	applespi->suspended = true;
038b1a05eae666 Ronald Tschalär 2019-07-15  1849  
038b1a05eae666 Ronald Tschalär 2019-07-15  1850  	spin_unlock_irqrestore(&applespi->cmd_msg_lock, flags);
038b1a05eae666 Ronald Tschalär 2019-07-15  1851  }
038b1a05eae666 Ronald Tschalär 2019-07-15  1852  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
