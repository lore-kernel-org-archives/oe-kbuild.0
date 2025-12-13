Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AEE245031
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 19:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765654219; cv=none; b=XED8/NhZZgfvJqCAi/Wr44sfiib1yWuLIz5+3mWa4XgK5p4QesKxzMrofz+5kn923nTMecbjQhDjYMSOdu0rH3Ad09nf6DeGgU9ervrECG2Tgt4Co/CvwQGN+HIuYhLnddKLH41rpRs60F2/HgoKLyR7rEVXBXRvyac2/dD7pYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765654219; c=relaxed/simple;
	bh=GJLFYV7l+HsKBHkdy2bjNroWFZTh4Kk0dI+urnQzSkY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VxxxQz0bvkgI0YM6dCg+MRddj/GN8gCQzYCaQ1VZcjp9UyFOKkS9dGlTDAuDTjsIhy7V5eRN37x8hobDbw35Q6bPIWXq3f4eE3u1nUiMX139f13RKM17jBhfwrC9iXW+swzTmMWjCvJFVFUroyZhDa/OhweDUSCQEEAlFZUivLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JenOwShR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JenOwShR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765654217; x=1797190217;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=GJLFYV7l+HsKBHkdy2bjNroWFZTh4Kk0dI+urnQzSkY=;
  b=JenOwShRoutY2fa420ZHh88zXy7fTIxke3+Vl9piMKuyoRXPBRuHDmXD
   XVyb090bBTZu/yDDyl0zfmXP7bYh8SW98JR/F/DwvmImw1F5WJfCnqmHq
   NNVbkmcfDkyBDg5AMMpT5DMfxMkgggX7vY39BzbS41Mw5P4nS1/HXQdwO
   m0B1tRxFptx0qADNEaWKJ50L1AW8zmKZiaaSyOc0hE42Uk5OW6WY7vKgW
   zDMPxlEHSVVZ+FTeF+UygwEdiwZDCaIULzSJr72mWOi7bxLs6i5JM+Ed7
   oRcz8rgN6s9qn2NAZ/OAFOi5vTTvZZSxapA+uD+Izecma0cnXVFLiy9cT
   g==;
X-CSE-ConnectionGUID: RHKq8MWwScavHBB4ZvcFBw==
X-CSE-MsgGUID: iZRJvYXYSwS83BV0QZr7Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67561127"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67561127"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 11:30:16 -0800
X-CSE-ConnectionGUID: u9qH5tYGQIOBtwUb9dCYhQ==
X-CSE-MsgGUID: N+PkrxuOTgaDzbkzaur4Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="220740485"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Dec 2025 11:30:14 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUVJk-0000000086f-00q3;
	Sat, 13 Dec 2025 19:30:12 +0000
Date: Sun, 14 Dec 2025 03:29:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/auxdisplay/line-display.c:110 to_linedisp() warn: iterator
 used outside loop: 'attachment'
Message-ID: <202512140352.8PFj3ZVS-lkp@intel.com>
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
head:   9d9c1cfec01cdbf24bd9322ed555713a20422115
commit: 3ba5c78fe7c5d60edae0c47361f191d40c5c1cf0 auxdisplay: linedisp: support attribute attachment to auxdisplay devices
date:   8 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 8 weeks ago
config: i386-randconfig-141-20251212 (https://download.01.org/0day-ci/archive/20251214/202512140352.8PFj3ZVS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512140352.8PFj3ZVS-lkp@intel.com/

New smatch warnings:
drivers/auxdisplay/line-display.c:110 to_linedisp() warn: iterator used outside loop: 'attachment'

Old smatch warnings:
drivers/auxdisplay/line-display.c:89 delete_attachment() warn: iterator used outside loop: 'attachment'

vim +/attachment +110 drivers/auxdisplay/line-display.c

3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18   95  
66c93809487e62 Jean-François Lessard 2025-09-18   96  static struct linedisp *to_linedisp(struct device *dev)
66c93809487e62 Jean-François Lessard 2025-09-18   97  {
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18   98  	struct linedisp_attachment *attachment;
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18   99  
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  100  	guard(spinlock)(&linedisp_attachments_lock);
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  101  
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  102  	list_for_each_entry(attachment, &linedisp_attachments, list) {
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  103  		if (attachment->device == dev)
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  104  			break;
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  105  	}
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  106  
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  107  	if (list_entry_is_head(attachment, &linedisp_attachments, list))
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  108  		return NULL;
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18  109  
3ba5c78fe7c5d6 Jean-François Lessard 2025-09-18 @110  	return attachment->linedisp;
66c93809487e62 Jean-François Lessard 2025-09-18  111  }
66c93809487e62 Jean-François Lessard 2025-09-18  112  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
