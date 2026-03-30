Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15723B19B5
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Mar 2026 09:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774861690; cv=none; b=OpdJnIHtB7fEgY3z2xIiQHeaF/9M59rO2WEmEKsKaIh/M44SVRLpQfRiSRvm6BDNq4piOuc9534Ol+j9ccWZnWv4iJU2x5o4Yv2FV1wR2N5mGwZ/tqlRZF65xTQhRnJnwveSqzVLT3lAlOuc4I1WJF8rH98S28LoCh6agnzjK/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774861690; c=relaxed/simple;
	bh=bExh+j/7OOFsIqXIZ/IwEUCWAxRT1eFUUm3h9eTHIIo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I1cM6JnvyfXYkJOYxJ1KAS0//CLopunVUDIAtcupRxMCkyQGgmT+JOYOjNnidZTq0nY2v+8gwI1Z6gWdqkX33IAmB7YLq5+eMJnsc0Crzi0Rd/hsbDSDV1Z+pbRxCIDoy+yzgzohKW/noRTzS6TXJlMDMBt5VJD5kIr5AT8UbFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hj/Oqzod; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hj/Oqzod"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774861688; x=1806397688;
  h=date:from:to:cc:subject:message-id;
  bh=bExh+j/7OOFsIqXIZ/IwEUCWAxRT1eFUUm3h9eTHIIo=;
  b=hj/OqzodnHFUpyg+wBtOKzi7AI1c72vgFixMK9h97H7kztpWksH96nyh
   KER/zZ9+UmkLDYIOBF+ZBasq23MwXlO6DvnTPZeSXOniAHX6KwrERan4O
   ZNNjpSdk2H11k9OihqphLKpAI6sGhPATYyK6TedVBno14eTdik/gJb+1o
   rBilgG6XbhqzXtGHG9gLOwN7K+XvIAESb3lTed9oDkSqoke49KsemjpsS
   TJGoKbFows89LLnyhTNa6qpX7rK7WKFDI1PmsyBGN8lk9XEYjDZ6I/8eh
   /UhnoZo+hCbFcc3dDyjyyi2k2FetImPKc66rak2znZLM/1111dtfq04nB
   A==;
X-CSE-ConnectionGUID: rc8kmrDXR0aj8xvtV7At9A==
X-CSE-MsgGUID: p7pnPDe+SgiE/qyKTsz9Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="63403257"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="63403257"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 02:05:43 -0700
X-CSE-ConnectionGUID: Xzk1rdxqTNCE8spFePPsbA==
X-CSE-MsgGUID: l4g8dIHDSxm06M2IYcvZ3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="230911851"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Mar 2026 02:05:40 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w78Z0-000000000t1-26K4;
	Mon, 30 Mar 2026 09:05:38 +0000
Date: Mon, 30 Mar 2026 17:04:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [xiang-erofs:dev-test 2/2] fs/erofs/data.c:45 erofs_bread()
 warn: passing positive error code '(-4095)-(-1),1-4096' to 'ERR_PTR'
Message-ID: <202603301620.6HyDa5ME-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Xiang Gao <xiang@kernel.org>
CC: linux-erofs@lists.ozlabs.org
TO: Gao Xiang <hsiangkao@linux.alibaba.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
head:   eabeee4332ac9b5d87ab602f845dbf0e9f854978
commit: eabeee4332ac9b5d87ab602f845dbf0e9f854978 [2/2] erofs: verify metadata accesses for file-backed mounts
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: arm-randconfig-r073-20260330 (https://download.01.org/0day-ci/archive/20260330/202603301620.6HyDa5ME-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603301620.6HyDa5ME-lkp@intel.com/

smatch warnings:
fs/erofs/data.c:45 erofs_bread() warn: passing positive error code '(-4095)-(-1),1-4096' to 'ERR_PTR'

vim +45 fs/erofs/data.c

fdf80a4793021c2 Gao Xiang  2022-01-02  28  
706e50e46af810f Bo Liu     2025-02-17  29  void *erofs_bread(struct erofs_buf *buf, erofs_off_t offset, bool need_kmap)
fdf80a4793021c2 Gao Xiang  2022-01-02  30  {
c36ec00d7f67590 Sheng Yong 2025-05-17  31  	pgoff_t index = (buf->off + offset) >> PAGE_SHIFT;
5d3bb77e5fce1d2 Gao Xiang  2024-07-23  32  	struct folio *folio = NULL;
eabeee4332ac9b5 Gao Xiang  2026-03-30  33  	loff_t fpos;
eabeee4332ac9b5 Gao Xiang  2026-03-30  34  	int err;
eabeee4332ac9b5 Gao Xiang  2026-03-30  35  
eabeee4332ac9b5 Gao Xiang  2026-03-30  36  	/*
eabeee4332ac9b5 Gao Xiang  2026-03-30  37  	 * Metadata access for file-backed mounts reuses page cache of backing
eabeee4332ac9b5 Gao Xiang  2026-03-30  38  	 * fs inodes (only folio data will be needed) to prevent double caching.
eabeee4332ac9b5 Gao Xiang  2026-03-30  39  	 * However, the data access range must be verified here in advance.
eabeee4332ac9b5 Gao Xiang  2026-03-30  40  	 */
eabeee4332ac9b5 Gao Xiang  2026-03-30  41  	if (buf->file) {
eabeee4332ac9b5 Gao Xiang  2026-03-30  42  		fpos = index << PAGE_SHIFT;
eabeee4332ac9b5 Gao Xiang  2026-03-30  43  		err = rw_verify_area(READ, buf->file, &fpos, PAGE_SIZE);
eabeee4332ac9b5 Gao Xiang  2026-03-30  44  		if (err)
eabeee4332ac9b5 Gao Xiang  2026-03-30 @45  			return ERR_PTR(err);
eabeee4332ac9b5 Gao Xiang  2026-03-30  46  	}
fdf80a4793021c2 Gao Xiang  2022-01-02  47  
5d3bb77e5fce1d2 Gao Xiang  2024-07-23  48  	if (buf->page) {
5d3bb77e5fce1d2 Gao Xiang  2024-07-23  49  		folio = page_folio(buf->page);
5d3bb77e5fce1d2 Gao Xiang  2024-07-23  50  		if (folio_file_page(folio, index) != buf->page)
5d3bb77e5fce1d2 Gao Xiang  2024-07-23  51  			erofs_unmap_metabuf(buf);
5d3bb77e5fce1d2 Gao Xiang  2024-07-23  52  	}
5d3bb77e5fce1d2 Gao Xiang  2024-07-23  53  	if (!folio || !folio_contains(folio, index)) {
fdf80a4793021c2 Gao Xiang  2022-01-02  54  		erofs_put_metabuf(buf);
3a23787ca875692 Gao Xiang  2024-11-15  55  		folio = read_mapping_folio(buf->mapping, index, buf->file);
5375e7c8b0fef11 Jeffle Xu  2022-04-25  56  		if (IS_ERR(folio))
5375e7c8b0fef11 Jeffle Xu  2022-04-25  57  			return folio;
fdf80a4793021c2 Gao Xiang  2022-01-02  58  	}
5d3bb77e5fce1d2 Gao Xiang  2024-07-23  59  	buf->page = folio_file_page(folio, index);
706e50e46af810f Bo Liu     2025-02-17  60  	if (!need_kmap)
fdf80a4793021c2 Gao Xiang  2022-01-02  61  		return NULL;
706e50e46af810f Bo Liu     2025-02-17  62  	if (!buf->base)
706e50e46af810f Bo Liu     2025-02-17  63  		buf->base = kmap_local_page(buf->page);
fdf80a4793021c2 Gao Xiang  2022-01-02  64  	return buf->base + (offset & ~PAGE_MASK);
fdf80a4793021c2 Gao Xiang  2022-01-02  65  }
fdf80a4793021c2 Gao Xiang  2022-01-02  66  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
