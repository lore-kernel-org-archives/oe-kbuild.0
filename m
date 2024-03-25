Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CE923A750
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Mar 2024 03:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711336040; cv=none; b=HEKjRABme6d8De2tmbk49lTRZVskZilYdrik770Eg/h/WBN0AjUzWqknVLydFIGFtj6uk65dAy9Kf5hwzgGSvAVietnsNHGTiJzJM+aAXQ/ZuQ7gThbQOfHEwK0UxQFYx7cMEUXTFgehPpgArqVQt93nHDJFC+TaT1Fd4qBqx74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711336040; c=relaxed/simple;
	bh=slkDMEAVR7EIgDJ51GBvXojdFno6EQNpJEfwbOVwF10=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FINKZrmLQXvVniGLgEihrizcskBbPuAytN190ZAF7eOE+Omum3rYsK3xTEgxITqdTXggVX8ueJF5hNpDejwn8+brGYZ3hxMhwLSv+Ir93gd6CHDxsly22W2YCPFo+R0l6+NKuAris9kXZE7vCFbIO/T46TbW0p25IOF+NTl4yxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L5GjJuZ5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L5GjJuZ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711336038; x=1742872038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=slkDMEAVR7EIgDJ51GBvXojdFno6EQNpJEfwbOVwF10=;
  b=L5GjJuZ57vTDKTMKvCM099Wv6d4zHpkLWPHHsC9BTOTdnmTp4bUmN7qy
   1Ec+xiWDuQ5f+l6Iwdaw3PrI0iuA02hD07ytkcGOff/LnRUw8JNxQ71V5
   3DzLl28ZxCyMlw/qQC3ZDa4frCl7FqY9PJGf5UriAQqEJczqzy3HSIEaZ
   U8AtzeTtFDomiEPJ5i6JchYIhS24r6E5LR2/1HUFXncYCo/T4ZCLjMpUX
   rXiYZLuQS/pwZSt7lfX4A5X9PvyPzdvnvVSW/6P70dn0XKRdlPXQ92E0y
   pcM0CammtV1sMN9ThXmtNKnHLLejYPJ598DhDYryLWzUHZYo1QAH8HiGS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6426082"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="6426082"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 20:07:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="46603071"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Mar 2024 20:07:15 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roag5-000MBg-1M;
	Mon, 25 Mar 2024 03:07:13 +0000
Date: Mon, 25 Mar 2024 11:06:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: net/sunrpc/xdr.c:1248:12-14: WARNING opportunity for min()
Message-ID: <202403251147.waqPmwFw-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Trond Myklebust <trond.myklebust@hammerspace.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4cece764965020c22cff7665b18a012006359095
commit: 1d97316692f708de755655ac1cfd704d7a55843f SUNRPC: Fix up xdr_read_pages() to take arbitrary object lengths
date:   3 years, 4 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 3 years, 4 months ago
config: x86_64-randconfig-102-20240324 (https://download.01.org/0day-ci/archive/20240325/202403251147.waqPmwFw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202403251147.waqPmwFw-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/sunrpc/xdr.c:1248:12-14: WARNING opportunity for min()

vim +1248 net/sunrpc/xdr.c

3994ee6fbf5185 Trond Myklebust 2012-06-26  1220  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1221  /**
1d97316692f708 Trond Myklebust 2020-11-20  1222   * xdr_read_pages - align page-based XDR data to current pointer position
^1da177e4c3f41 Linus Torvalds  2005-04-16  1223   * @xdr: pointer to xdr_stream struct
^1da177e4c3f41 Linus Torvalds  2005-04-16  1224   * @len: number of bytes of page data
^1da177e4c3f41 Linus Torvalds  2005-04-16  1225   *
^1da177e4c3f41 Linus Torvalds  2005-04-16  1226   * Moves data beyond the current pointer position from the XDR head[] buffer
1d97316692f708 Trond Myklebust 2020-11-20  1227   * into the page list. Any data that lies beyond current position + @len
1d97316692f708 Trond Myklebust 2020-11-20  1228   * bytes is moved into the XDR tail[]. The xdr_stream current position is
1d97316692f708 Trond Myklebust 2020-11-20  1229   * then advanced past that data to align to the next XDR object in the tail.
3994ee6fbf5185 Trond Myklebust 2012-06-26  1230   *
3994ee6fbf5185 Trond Myklebust 2012-06-26  1231   * Returns the number of XDR encoded bytes now contained in the pages
^1da177e4c3f41 Linus Torvalds  2005-04-16  1232   */
3994ee6fbf5185 Trond Myklebust 2012-06-26  1233  unsigned int xdr_read_pages(struct xdr_stream *xdr, unsigned int len)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1234  {
1d97316692f708 Trond Myklebust 2020-11-20  1235  	unsigned int nwords = XDR_QUADLEN(len);
1d97316692f708 Trond Myklebust 2020-11-20  1236  	unsigned int base, end, pglen;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1237  
1d97316692f708 Trond Myklebust 2020-11-20  1238  	pglen = xdr_align_pages(xdr, nwords << 2);
1d97316692f708 Trond Myklebust 2020-11-20  1239  	if (pglen == 0)
3994ee6fbf5185 Trond Myklebust 2012-06-26  1240  		return 0;
bd00f84bc57f42 Trond Myklebust 2012-06-26  1241  
1d97316692f708 Trond Myklebust 2020-11-20  1242  	xdr->nwords -= nwords;
1d97316692f708 Trond Myklebust 2020-11-20  1243  	base = (nwords << 2) - pglen;
1d97316692f708 Trond Myklebust 2020-11-20  1244  	end = xdr_stream_remaining(xdr) - pglen;
1d97316692f708 Trond Myklebust 2020-11-20  1245  
1d97316692f708 Trond Myklebust 2020-11-20  1246  	if (xdr_set_iov(xdr, xdr->buf->tail, base, end) == 0)
1d97316692f708 Trond Myklebust 2020-11-20  1247  		xdr->nwords = 0;
1d97316692f708 Trond Myklebust 2020-11-20 @1248  	return len <= pglen ? len : pglen;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1249  }
468039ee469c57 Trond Myklebust 2008-12-23  1250  EXPORT_SYMBOL_GPL(xdr_read_pages);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1251  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
