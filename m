Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2041F1C9EA9
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Aug 2024 15:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724341041; cv=none; b=XH9qQ4C3zP0rcIMmy147HdZ/RWSfldfSdRMEjNH295M3/XkAKA51w0f5P3RjgoyH9xmyJqEXmqvhHJmcRRk8coow6vj2+PaIwsEVUWeZfH/5eEiCBmzaTN4hTtFmhme9xsEkQ+I2XLYc+xUrfduGk9htaTjSzK+LQVwT5lC7wy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724341041; c=relaxed/simple;
	bh=lWqExYueLWJR8CKMAngHgX5H+pQg2RU8SYEmM8TzmOA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I3yQSv463zBwQl0geStw20YSflttf6YJ9DIuUKJoPV3kfvDjXuoXUCZhKd97Ruenz4mAzpD8MzjWczTUmHIZl+3P4/5lxijgBsWamFdUrVF8sLfAkM3pixPzLOKpSpjqKDGb5uS9PJ/jF/n1g2oVLbKjoT6tj8ERJTDVVMWIF0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gcNhEwC8; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gcNhEwC8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724341039; x=1755877039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lWqExYueLWJR8CKMAngHgX5H+pQg2RU8SYEmM8TzmOA=;
  b=gcNhEwC8e244uU223fF6KWx6pRIq8Poq4DIQu9e39HBJKYwqmLPkMD1R
   1ebCp2u9I42R/3u6qHeb05QcGbjTWf3vy4s6jcteMX5WDJE/HPPDRo/MY
   FxyCOy0GpKWsu5hvhTjRMZSCS52H3QMLpmI667cVYnBqClrLCOOeRwDKB
   bVl4orcpjDfOUtjbrPfJpLol1uCmlWVFzv9CL5cTsIyqwyhojgh+yXabY
   pQ5DiSaLz2VE6aWydBN6sFNgCMvCzNv5sLESWKB+w7PDWWSvL6TqquubE
   GExkzoEpEf9Ymi27ST8NPKc4WsEAlJHA+0nqPLerJ7BQQSLse8z7h0puz
   g==;
X-CSE-ConnectionGUID: Us2LLgTYRtCw9sPK95ixtw==
X-CSE-MsgGUID: F4LfgsONThuuC1GkjpShqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33924431"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="33924431"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 08:37:18 -0700
X-CSE-ConnectionGUID: LAFYXPYTQm2w1x+tgAXKdg==
X-CSE-MsgGUID: IeAy1YPeQrKIRM/dfxreig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="61627823"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Aug 2024 08:37:17 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh9sA-000CwC-2w;
	Thu, 22 Aug 2024 15:37:14 +0000
Date: Thu, 22 Aug 2024 23:37:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5650/6069] fs/squashfs/page_actor.h:41
 squashfs_page_actor_free() error: dereferencing freed memory 'actor'
Message-ID: <202408222328.AeiNlEPx-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Phillip Lougher <phillip@squashfs.org.uk>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6a7917c89f219f09b1d88d09f376000914a52763
commit: 5d85f9c952d85a26e1a8c7c985b67963b483cabc [5650/6069] Squashfs: Ensure all readahead pages have been used
:::::: branch date: 10 hours ago
:::::: commit date: 31 hours ago
config: i386-randconfig-141-20240822 (https://download.01.org/0day-ci/archive/20240822/202408222328.AeiNlEPx-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408222328.AeiNlEPx-lkp@intel.com/

smatch warnings:
fs/squashfs/page_actor.h:41 squashfs_page_actor_free() error: dereferencing freed memory 'actor'

vim +/actor +41 fs/squashfs/page_actor.h

0d455c12c64286 Phillip Lougher 2013-11-13  27  
f268eedddf3595 Phillip Lougher 2022-06-11  28  extern struct squashfs_page_actor *squashfs_page_actor_init(void **buffer,
f268eedddf3595 Phillip Lougher 2022-06-11  29  				int pages, int length);
f268eedddf3595 Phillip Lougher 2022-06-11  30  extern struct squashfs_page_actor *squashfs_page_actor_init_special(
f268eedddf3595 Phillip Lougher 2022-06-11  31  				struct squashfs_sb_info *msblk,
2258e22f05aff5 Phillip Lougher 2024-08-19  32  				struct page **page, int pages, int length,
2258e22f05aff5 Phillip Lougher 2024-08-19  33  				loff_t start_index);
9ef8eb6104527b Phillip Lougher 2022-10-20  34  static inline struct page *squashfs_page_actor_free(struct squashfs_page_actor *actor)
1f13dff09ffc8b Phillip Lougher 2022-08-22  35  {
9ef8eb6104527b Phillip Lougher 2022-10-20  36  	struct page *last_page = actor->last_page;
9ef8eb6104527b Phillip Lougher 2022-10-20  37  
1f13dff09ffc8b Phillip Lougher 2022-08-22  38  	kfree(actor->tmp_buffer);
1f13dff09ffc8b Phillip Lougher 2022-08-22  39  	kfree(actor);
5d85f9c952d85a Phillip Lougher 2024-08-21  40  
5d85f9c952d85a Phillip Lougher 2024-08-21 @41  	if (actor->next_page == actor->pages)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
