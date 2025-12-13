Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C32303A02
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 11:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765624837; cv=none; b=WYVkECZy7sA3FPDUoS+kCr2sL3YSwE8vzNzNu61FTsykLVqqffJMcBuALtHT1ea5gMRP6Wdlm6Y4DTZaGyAgVOqryhal9uw6IAqGJ8fn87aekOD2GbTRUfS+WHk1vkueQDcFfC6fNFj9wlFduS3vEw3RGAjSg0lyihaI8bMGpIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765624837; c=relaxed/simple;
	bh=aOomWsYXr/WBFDrM0eQlZgOy/sGErXdygsy+fD26mxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h9JuBF4T5+S3Qlotuka5n8iXljpU8Bdc9SEAtbOTpLXagJVmEtljhgqerP/d1sTCtDYwTQVKBZQbHybiYQhTt3Evg50aU5zJy7nNnVNNdMz6fziwshRK9eV4Tug0qD6TGASQSHDFwNbadxymI5pejUgAiwidHxhv6ibGv3tGGcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XjfvrDla; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XjfvrDla"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765624835; x=1797160835;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=aOomWsYXr/WBFDrM0eQlZgOy/sGErXdygsy+fD26mxg=;
  b=XjfvrDlaN0i/apT57JFTtN9nbUzWWFVwAqhVLuJQJQxyxJGHFluwQOz6
   AlzoYY7RMA1RNV5yzWdvxGqhhy0MY9lND6S/W45hFE+VKDJK/o87HakCn
   KnpjQqPoqVMDzlpcciPfmJGpRsJ17PMfBd3C3jrJWBIPEzBNPRD19LEpq
   vRkFPQnd691UyYo5xvbG8AOL0JGpwIV2avvFOVpAr2wLik12/Wwk3pjs8
   NcEdNj+77/gO2lxlO8+f8fZ7VNwzWNQppYDnzQpfBWbYiW6gbP6Q/YtHt
   OIuS4f1MACS9dOVBnNC4+xCt/HtgpvyOhRM5CM+HpRj/myBkqnAzoSAcz
   A==;
X-CSE-ConnectionGUID: ztTsSORURouxadHMn3uRAA==
X-CSE-MsgGUID: rmCpFOt8QTSER0oCCFiQvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78979784"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="78979784"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 03:20:34 -0800
X-CSE-ConnectionGUID: MgUqnJxkTH6tPME9ibelug==
X-CSE-MsgGUID: ZOVLV8zSSqGWrIL8EkwrTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="201478730"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Dec 2025 03:20:34 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUNfq-000000007Xi-3sVx;
	Sat, 13 Dec 2025 11:20:30 +0000
Date: Sat, 13 Dec 2025 19:19:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/auxdisplay/line-display.c:89 delete_attachment() warn:
 iterator used outside loop: 'attachment'
Message-ID: <202512131917.9L9pfhSQ-lkp@intel.com>
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
TO: "Jean-François Lessard" <jefflessard3@gmail.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a859eca0e4cc96f63ff125dbe5388d961558b0e9
commit: 3ba5c78fe7c5d60edae0c47361f191d40c5c1cf0 auxdisplay: linedisp: support attribute attachment to auxdisplay devices
date:   8 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 8 weeks ago
config: i386-randconfig-141-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131917.9L9pfhSQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512131917.9L9pfhSQ-lkp@intel.com/

New smatch warnings:
drivers/auxdisplay/line-display.c:89 delete_attachment() warn: iterator used outside loop: 'attachment'

Old smatch warnings:
drivers/auxdisplay/line-display.c:110 to_linedisp() warn: iterator used outside loop: 'attachment'

vim +/attachment +89 drivers/auxdisplay/line-display.c

3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  72  
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  73  static struct linedisp *delete_attachment(struct device *dev, bool direct)
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  74  {
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  75  	struct linedisp_attachment *attachment;
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  76  	struct linedisp *linedisp;
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  77  
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  78  	guard(spinlock)(&linedisp_attachments_lock);
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  79  
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  80  	list_for_each_entry(attachment, &linedisp_attachments, list) {
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  81  		if (attachment->device == dev &&
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  82  		    attachment->direct == direct)
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  83  			break;
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  84  	}
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  85  
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  86  	if (list_entry_is_head(attachment, &linedisp_attachments, list))
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  87  		return NULL;
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  88  
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18 @89  	linedisp = attachment->linedisp;
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  90  	list_del(&attachment->list);
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  91  	kfree(attachment);
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  92  
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  93  	return linedisp;
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  94  }
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  95  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
