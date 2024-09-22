Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9789D3B7AC
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Sep 2024 11:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727004353; cv=none; b=cnsZcCkrvV32hSag5sn+zFPkIuFuCAt4MTGgbz0YRquWhphg9ZJsKNn/E8s0c2lL4F2icvZJotbyz+KmnIdbAJdIGp25FbLOjqPTzhc7KJk3NfvLOAXmNLBMzhmuMO+aTIGgEJepK4aiHBLSgoEwESE8o/4PC4xYIbunpqJz4UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727004353; c=relaxed/simple;
	bh=vlol5H2hOvrMK98M1WwIlURpttsOXek6f04h4/vkN7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aTV11Le5jZ6v1r9SGUUhViZOcQTZ/SMTra7F1FIzdK4NSKXoSA0sePjgY8OBhyyHblrD0iDXJ/0uvf51lMHX7bd71TzCdwdnZxfQZNmlXAbutwNlxfOz76vmARsjqcPJukCSv450rNlabND3RFyloIIIgHJFtz+MzFxfYUvruWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e255/8uk; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e255/8uk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727004352; x=1758540352;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vlol5H2hOvrMK98M1WwIlURpttsOXek6f04h4/vkN7g=;
  b=e255/8ukXFtx+c1wOptTgscprgW/XafIIf5KSDE4FI50RrOJXRZiuKj9
   wNOZI1JB9qwUuaUAHMakEIYjWfciviEDrWxbeApSDv/R1dtx+ICNFDjhd
   logjWGwMCcoL9eWxoqsJCyVkppKn9ATeAu6HU/Am1fgW0LE9ELcTHH283
   hm8yThrVbd8J7fh20eWejHWCLebEQyJKAQzUbG6h1L9c1cj4+76ZDgo+a
   HTfk2ZbPKCIoISAKJLFrXapaY7tGXyC31y79SUYeRSoMpnqxqSALJP9oV
   Beb2PQX3SK+Gr5u4OLGPqIJ7Q1xj+/iFW85imhxcgzgVImIvbeXJPYaqs
   w==;
X-CSE-ConnectionGUID: QVuO27GvTTCPHPSOzm0n5A==
X-CSE-MsgGUID: CrkH1OPQQviEYcmL+l0vTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26055158"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="26055158"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 04:25:51 -0700
X-CSE-ConnectionGUID: wpMW8SvBSTKoe9ZnYyuwpA==
X-CSE-MsgGUID: YNBmTMVFQZaWi0IFlveRDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="94120301"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Sep 2024 04:25:49 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssKip-000GFT-1b;
	Sun, 22 Sep 2024 11:25:47 +0000
Date: Sun, 22 Sep 2024 19:25:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 117/448] drivers/hid/hid-picolcd_debugfs.c:49
 picolcd_debug_reset_write() warn: potential spectre issue 'buf' [w] (local
 cap)
Message-ID: <202409221959.E1wtvRJl-lkp@intel.com>
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
head:   7ef9d29ff0268d9fb68e3b1bf7548981d7a61307
commit: 720019716a06435f8973924b5aea199e0121866e [117/448] drivers/hid: convert to read/write iterators
:::::: branch date: 5 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240922 (https://download.01.org/0day-ci/archive/20240922/202409221959.E1wtvRJl-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409221959.E1wtvRJl-lkp@intel.com/

smatch warnings:
drivers/hid/hid-picolcd_debugfs.c:49 picolcd_debug_reset_write() warn: potential spectre issue 'buf' [w] (local cap)

vim +/buf +49 drivers/hid/hid-picolcd_debugfs.c

fabdbf2fd22fa1 Bruno Prémont 2012-07-30  36  
720019716a0643 Jens Axboe    2024-04-05  37  static ssize_t picolcd_debug_reset_write(struct kiocb *iocb,
720019716a0643 Jens Axboe    2024-04-05  38  					 struct iov_iter *from)
fabdbf2fd22fa1 Bruno Prémont 2012-07-30  39  {
720019716a0643 Jens Axboe    2024-04-05  40  	struct picolcd_data *data = ((struct seq_file *)iocb->ki_filp->private_data)->private;
720019716a0643 Jens Axboe    2024-04-05  41  	size_t count = iov_iter_count(from);
fabdbf2fd22fa1 Bruno Prémont 2012-07-30  42  	char buf[32];
fabdbf2fd22fa1 Bruno Prémont 2012-07-30  43  	size_t cnt = min(count, sizeof(buf)-1);
720019716a0643 Jens Axboe    2024-04-05  44  	if (!copy_from_iter_full(buf, cnt, from))
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
