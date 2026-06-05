Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF7235F161
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jun 2026 15:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780673572; cv=none; b=hp+5lv953FFTNTEPHOZdO97wIaRNIl8wcpii2tDgly8N6xWGkFE/aYrM31paC4OmjR1rMqbG8WDQvPbkRh9kIb3TE1vCIvZEhVdgQw/VyzYiDSXgTGa9cUawiXkhJsaKyecH0RGKaA2BOzW3lu3WDuHNllA5dzPzqDwLaiy70Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780673572; c=relaxed/simple;
	bh=d5U3Ta/0mcsjAa9qgY+A0QXz+2ycEQrdZeaD8IbuzQ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sPrOEv15cVDWbInr+fMo+Vu5yLlkHkNDDNRW+zU/4uvMtySnkHJa6tJSXeEtpX68yOPyXpIfRTPCWO/hggeAzVzgd37JvH7dGggfGfOnAkMrsS2H7U3Pc2k+RDY2fx6MlOv0H8T1faYwWekV0kFBdbR3RaAhGhKJ6RyS1Xl6ypk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gsAs8cz9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gsAs8cz9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780673571; x=1812209571;
  h=date:from:to:cc:subject:message-id;
  bh=d5U3Ta/0mcsjAa9qgY+A0QXz+2ycEQrdZeaD8IbuzQ4=;
  b=gsAs8cz9SlslbRAfDei8uMssT8F/TlzMXqXw4oTAbXtBU86nIx1LWCx/
   HVg5lEIU4UxnRmKZ5QPOmaS45kWCwuJbg8DdZ3oZXPmEpsoESqsjbYaH6
   02vti/gJBg3zkbfq+dnOMCAFsi4EzVXAVUBNiMBy3Rum8FjXVXaXu25PI
   HMOr1jhQFRSX//WdODSVHZlrsTaQ5vtGko/lvytTUyne2x3Ny20ay6r/O
   6Hm0bKFkPSFWm+nRv+vGOI7zjoefBcl2nXOu3Fyk+utkRyk41Jd+AIn4L
   qTv3CIXlO/qZ2O2kH7alMXsO9b/CMDWAogCIMcXwkQQYRtaQPELKf68OW
   Q==;
X-CSE-ConnectionGUID: Bo/PFLCUQzOHjYtM4/9CnA==
X-CSE-MsgGUID: NfGXqNYtTfOlIH/pX49Row==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="92995754"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="92995754"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 08:32:50 -0700
X-CSE-ConnectionGUID: ZVWGYX6iSSaDikmOxBPqJg==
X-CSE-MsgGUID: anpmDv2mTDmOPCCV9sPlGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="242399370"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Jun 2026 08:32:48 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVWXO-00000000GAs-2I6E;
	Fri, 05 Jun 2026 15:32:46 +0000
Date: Fri, 05 Jun 2026 23:32:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/hwtracing/stm/core.c:509:8-24: WARNING: stm_fops:
 .write() has stream semantic; safe to change nonseekable_open -> stream_open.
Message-ID: <202606052323.fEJIkoax-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Suren Baghdasaryan <surenb@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ddd664bbff63e09e7a7f9acae9c43605d4cf185f
commit: b0085cb94d2477787f4197a3000e33aabf3d48fc stm: replace deprecated mmap hook with mmap_prepare
date:   9 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 9 weeks ago
config: mips-randconfig-r063-20260604 (https://download.01.org/0day-ci/archive/20260605/202606052323.fEJIkoax-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e5ab4f8a1f766febdc65ce89c00dec85393cfd68)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b0085cb94d24 ("stm: replace deprecated mmap hook with mmap_prepare")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202606052323.fEJIkoax-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/hwtracing/stm/core.c:509:8-24: WARNING: stm_fops: .write() has stream semantic; safe to change nonseekable_open -> stream_open.

vim +509 drivers/hwtracing/stm/core.c

c7fd62bc69d022 Alexander Shishkin 2018-10-05  484  
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  485  static int stm_char_open(struct inode *inode, struct file *file)
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  486  {
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  487  	struct stm_file *stmf;
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  488  	struct device *dev;
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  489  	unsigned int major = imajor(inode);
a0ebf519b8a266 Johan Hovold       2016-11-18  490  	int err = -ENOMEM;
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  491  
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  492  	dev = class_find_device(&stm_class, NULL, &major, major_match);
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  493  	if (!dev)
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  494  		return -ENODEV;
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  495  
bf4afc53b77aea Linus Torvalds     2026-02-21  496  	stmf = kzalloc_obj(*stmf);
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  497  	if (!stmf)
a0ebf519b8a266 Johan Hovold       2016-11-18  498  		goto err_put_device;
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  499  
a0ebf519b8a266 Johan Hovold       2016-11-18  500  	err = -ENODEV;
cde4ad8368840e Alexander Shishkin 2016-02-15  501  	stm_output_init(&stmf->output);
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  502  	stmf->stm = to_stm_device(dev);
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  503  
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  504  	if (!try_module_get(stmf->stm->owner))
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  505  		goto err_free;
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  506  
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  507  	file->private_data = stmf;
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  508  
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22 @509  	return nonseekable_open(inode, file);
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  510  
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  511  err_free:
a0ebf519b8a266 Johan Hovold       2016-11-18  512  	kfree(stmf);
a0ebf519b8a266 Johan Hovold       2016-11-18  513  err_put_device:
f7c81c7176c72c Alexander Shishkin 2016-02-15  514  	/* matches class_find_device() above */
f7c81c7176c72c Alexander Shishkin 2016-02-15  515  	put_device(dev);
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  516  
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  517  	return err;
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  518  }
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  519  

:::::: The code at line 509 was first introduced by commit
:::::: 7bd1d4093c2fa37d1ecab05da3c9d48ea2af2264 stm class: Introduce an abstraction for System Trace Module devices

:::::: TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
