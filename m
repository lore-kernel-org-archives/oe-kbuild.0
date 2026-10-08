Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4D938655E
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Oct 2026 21:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791494971; cv=none; b=SgQPkwyM5PbY98op8FzvBNTbBQKrIwu4W+FBMtwiWfwgQMvZL2ljsjmc0w/QGDVmgtV6Qzn+bzDAVCqysy9c2SfObCfxf+naoUWMhxvbtHVqHki6oDeTqrOC7cuJYFuUuuJ4RQVMYQgjxJyOR1dhTzWEzbEXTzHoVao5K0A1c0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791494971; c=relaxed/simple;
	bh=nKWdRh0K/I05eq5ze1DonkDhqr6z99ZQyvyoQKQXwBI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tSr1MTs0W5nJHu0lrJmR+ZPykWrvlx49+PK91U6Q7fjzoo22t6meFYmiZ8Tnr60hUgDdVyMKdqoAEqZK8qYCqq3oPZDpjHBBLmZPAAsWrOKPkKbM/DzLf0WF1MF84/tUyfZM9veCYSwRzXfWP1EPqo5djqNu5szXk/WsLvPpaRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQ28H1MS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQ28H1MS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791494971; x=1823030971;
  h=date:from:to:cc:subject:message-id;
  bh=nKWdRh0K/I05eq5ze1DonkDhqr6z99ZQyvyoQKQXwBI=;
  b=IQ28H1MSDzyISasz3kACEjBLUQ7LQrrDnQBYX9Dw1rSktZd5JdtvAozl
   +b1wq0Uj2dVCW0c3wxoo4bWQ8nvZPy5Tays6102RVMr4wQLDgDyIr3Tc7
   sHGhGSsvwjjxwjLeko8XdJ5hBeuw1ppShwT4D5hn72XvUGZI3HFv3VcMB
   5g6+qqrj+w6kzVt0v9l0XUJbEPec1Ta3Kr8xK1RB+BEi2/7o4MaGvtGxu
   l8HpO+XrUwMa5fOZrPHPuM8heBgoSP3q3Zmtp7oZwMMpXcBtwOPMlyVmt
   4uVaOROGaR8ILXBY7H6LqCeUpv2FF6i/DHPfBdsRteEUc/XGkmqNuFMP4
   g==;
X-CSE-ConnectionGUID: cgTjnK9MTviIhI0Y68c+og==
X-CSE-MsgGUID: YbdQ75eySouopz0iVgNUAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="316803"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="316803"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 14:29:30 -0700
X-CSE-ConnectionGUID: mRWN7nGlSr+Uh127RIaMXw==
X-CSE-MsgGUID: H+LwQP8WQTKZb6Wg0g0poA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="237684"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 08 Oct 2026 14:29:29 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEvg5-0000000066Z-423D;
	Thu, 08 Oct 2026 21:29:25 +0000
Date: Thu, 08 Oct 2026 23:29:16 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dhowells-fs:netfs-crypt 30/30] fs/netfs/direct_write.c:54
 netfs_rmw_read_one() warn: signedness bug returning '(-12)'
Message-ID: <202610082353.hZ3FyTnt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   870d31c7b4cbee9e73019466181a2e0c2c1094f8
commit: 870d31c7b4cbee9e73019466181a2e0c2c1094f8 [30/30] netfs: Support encryption on unbuffered/DIO write
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: i386-randconfig-2200-20261008 (https://download.01.org/0day-ci/archive/20261008/202610082353.hZ3FyTnt-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610082353.hZ3FyTnt-lkp@intel.com/

smatch warnings:
fs/netfs/direct_write.c:54 netfs_rmw_read_one() warn: signedness bug returning '(-12)'

vim +54 fs/netfs/direct_write.c

153a9961b551101 David Howells 2022-02-21  11  
870d31c7b4cbee9 David Howells 2026-05-16  12  /*
870d31c7b4cbee9 David Howells 2026-05-16  13   * Perform a read to a buffer from the server, slicing up the region to be read
870d31c7b4cbee9 David Howells 2026-05-16  14   * according to the network rsize.
870d31c7b4cbee9 David Howells 2026-05-16  15   */
870d31c7b4cbee9 David Howells 2026-05-16  16  static bool netfs_rmw_read_one(struct netfs_io_request *rreq, struct bvecq *bq,
870d31c7b4cbee9 David Howells 2026-05-16  17  			       uoff_t fpos)
870d31c7b4cbee9 David Howells 2026-05-16  18  {
870d31c7b4cbee9 David Howells 2026-05-16  19  	struct netfs_io_stream *stream = &rreq->io_streams[0];
870d31c7b4cbee9 David Howells 2026-05-16  20  	size_t len = 0;
870d31c7b4cbee9 David Howells 2026-05-16  21  	int ret = 0;
870d31c7b4cbee9 David Howells 2026-05-16  22  
870d31c7b4cbee9 David Howells 2026-05-16  23  	for (int i = 0; i < bq->nr_slots; i++)
870d31c7b4cbee9 David Howells 2026-05-16  24  		len += bq->bv[i].bv_len;
870d31c7b4cbee9 David Howells 2026-05-16  25  
870d31c7b4cbee9 David Howells 2026-05-16  26  	rreq->start		= fpos;
870d31c7b4cbee9 David Howells 2026-05-16  27  	rreq->len		= len;
870d31c7b4cbee9 David Howells 2026-05-16  28  	stream->issue_from	= fpos;
870d31c7b4cbee9 David Howells 2026-05-16  29  	stream->buffered	= len;
870d31c7b4cbee9 David Howells 2026-05-16  30  
870d31c7b4cbee9 David Howells 2026-05-16  31  	do {
870d31c7b4cbee9 David Howells 2026-05-16  32  		struct netfs_io_subrequest *subreq;
870d31c7b4cbee9 David Howells 2026-05-16  33  
870d31c7b4cbee9 David Howells 2026-05-16  34  		subreq = netfs_alloc_subrequest(rreq, NETFS_DOWNLOAD_FROM_SERVER);
870d31c7b4cbee9 David Howells 2026-05-16  35  		if (!subreq) {
870d31c7b4cbee9 David Howells 2026-05-16  36  			ret = -ENOMEM;
870d31c7b4cbee9 David Howells 2026-05-16  37  			break;
870d31c7b4cbee9 David Howells 2026-05-16  38  		}
870d31c7b4cbee9 David Howells 2026-05-16  39  
870d31c7b4cbee9 David Howells 2026-05-16  40  		subreq->start	= stream->issue_from;
870d31c7b4cbee9 David Howells 2026-05-16  41  		subreq->len	= stream->buffered;
870d31c7b4cbee9 David Howells 2026-05-16  42  
870d31c7b4cbee9 David Howells 2026-05-16  43  		spin_lock(&rreq->lock);
870d31c7b4cbee9 David Howells 2026-05-16  44  		list_add_tail(&subreq->rreq_link, &stream->subrequests);
870d31c7b4cbee9 David Howells 2026-05-16  45  		trace_netfs_sreq(subreq, netfs_sreq_trace_added);
870d31c7b4cbee9 David Howells 2026-05-16  46  		spin_unlock(&rreq->lock);
870d31c7b4cbee9 David Howells 2026-05-16  47  
870d31c7b4cbee9 David Howells 2026-05-16  48  		netfs_stat(&netfs_n_rh_download);
870d31c7b4cbee9 David Howells 2026-05-16  49  		rreq->netfs_ops->issue_read(subreq);
870d31c7b4cbee9 David Howells 2026-05-16  50  
870d31c7b4cbee9 David Howells 2026-05-16  51  		cond_resched();
870d31c7b4cbee9 David Howells 2026-05-16  52  	} while (stream->buffered > 0);
870d31c7b4cbee9 David Howells 2026-05-16  53  
870d31c7b4cbee9 David Howells 2026-05-16 @54  	return ret;
870d31c7b4cbee9 David Howells 2026-05-16  55  }
870d31c7b4cbee9 David Howells 2026-05-16  56  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
