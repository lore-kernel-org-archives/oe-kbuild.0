Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A8B17BB21
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 20:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768248774; cv=none; b=HqQjOdXn9FAzHAUbgt4Xe42fDBbJRdT4CA5iJAAhLvTmhBEangmn0YoiNjhv0y/qI0capRU7k3YkVtKfelNZyPT5W5KSUDiLAl1Iv4BoknI8sN7v5BBCKtS9s0F8wSVORuOLjEtB3fryM68ns9vsAxCpapstHD7ND13aYIMZrUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768248774; c=relaxed/simple;
	bh=wEAFsW5PCYoRiLhhe/v4OWyhkWR23ZW8xnTK9lDLQAk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cD8DTygzPlDx+Odhp4sLmHz35B1+oYHwYdwmO99qX4ehRvV0xmyOB5/Qn9DYRW+LoClfVPyCSPgfM8dozvz1YgE5ifteDy/9Zzhuzcbwu9xXtbhMNwC/WsJQ/KjupTQGls1jFoY7tvcXwFDdg9WFb7HGekx2Oxa0Y5XrIH8iZmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KK9mz/nY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KK9mz/nY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768248773; x=1799784773;
  h=date:from:to:cc:subject:message-id;
  bh=wEAFsW5PCYoRiLhhe/v4OWyhkWR23ZW8xnTK9lDLQAk=;
  b=KK9mz/nYMKqVOe96zHaCD2/mDE0Rcv+zw1whAJI4G/WAOkKCj9JNUH7t
   AtY7FgVp1bPfwkgtRC//RP6gSqr2oT7deDmwvafaItBGv9W2ZgmpvRFlU
   oQh+0+OXTvU+RpbbNSmSSciNfBCicoeS/qyC7vrzoHKKcMNr7XMfXuul+
   S8YRVWkHivqpWPEpzfScH4wvsz2EYknxpaWmFFHTg4VvyRqBOkYjouYOe
   R6dkHi9mFjAmf6n/e5L26eYA4hzRdSAVF9swHMeR2kyOm83lOUm183req
   G4pnmaPzXqLcTzJLMDCTbS/VING2HqxWgnf4qLffaSZrWu8vLkraZzIL0
   Q==;
X-CSE-ConnectionGUID: Pp/QyzLdRSS7+HjTXVTxwQ==
X-CSE-MsgGUID: h8i3x0LoT7OYozJO+JYa2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="68536709"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="68536709"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 12:12:53 -0800
X-CSE-ConnectionGUID: FCB4GxiRTbuvuu5uawiJqg==
X-CSE-MsgGUID: UgtP9JneQpqAAp1UpTzX9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="234889633"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Jan 2026 12:12:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfOHR-00000000DpU-0uHK;
	Mon, 12 Jan 2026 20:12:49 +0000
Date: Tue, 13 Jan 2026 04:12:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dhowells-fs:netfs-next 5/17] fs/netfs/buffer.c:242
 netfs_shorten_bvecq_buffer() error: we previously assumed 'bq' could be null
 (see line 232)
Message-ID: <202601130400.OWBAz9we-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   8dc07632381d372883f12b9ca6da7438ce683a33
commit: 8b13f6a293683108192e200dcdd795f5f4289612 [5/17] netfs: Provide facility to alloc buffer in a bvecq
:::::: branch date: 5 hours ago
:::::: commit date: 5 days ago
config: powerpc-randconfig-r073-20260113 (https://download.01.org/0day-ci/archive/20260113/202601130400.OWBAz9we-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601130400.OWBAz9we-lkp@intel.com/

smatch warnings:
fs/netfs/buffer.c:242 netfs_shorten_bvecq_buffer() error: we previously assumed 'bq' could be null (see line 232)

vim +/bq +242 fs/netfs/buffer.c

8b13f6a2936831 David Howells 2025-07-31  216  
8b13f6a2936831 David Howells 2025-07-31  217  /**
8b13f6a2936831 David Howells 2025-07-31  218   * netfs_shorten_bvecq_buffer - Shorten a bvec queue buffer
8b13f6a2936831 David Howells 2025-07-31  219   * @bq: The start of the buffer to shorten
8b13f6a2936831 David Howells 2025-07-31  220   * @seg: The slot to start from
8b13f6a2936831 David Howells 2025-07-31  221   * @size: The size to retain
8b13f6a2936831 David Howells 2025-07-31  222   *
8b13f6a2936831 David Howells 2025-07-31  223   * Shorten the content of a bvec queue down to the minimum number of segments,
8b13f6a2936831 David Howells 2025-07-31  224   * starting at the specified segment, to retain the specified size.  An error
8b13f6a2936831 David Howells 2025-07-31  225   * will be reported if the bvec queue is undersized.
8b13f6a2936831 David Howells 2025-07-31  226   */
8b13f6a2936831 David Howells 2025-07-31  227  int netfs_shorten_bvecq_buffer(struct bvecq *bq, unsigned int seg, size_t size)
8b13f6a2936831 David Howells 2025-07-31  228  {
8b13f6a2936831 David Howells 2025-07-31  229  	ssize_t retain = size;
8b13f6a2936831 David Howells 2025-07-31  230  
8b13f6a2936831 David Howells 2025-07-31  231  	/* Skip through the segments we want to keep. */
8b13f6a2936831 David Howells 2025-07-31 @232  	for (; bq; bq = bq->next) {
8b13f6a2936831 David Howells 2025-07-31  233  		for (; seg < bq->nr_segs; seg++) {
8b13f6a2936831 David Howells 2025-07-31  234  			retain -= bq->bv[seg].bv_len;
8b13f6a2936831 David Howells 2025-07-31  235  			if (retain < 0)
8b13f6a2936831 David Howells 2025-07-31  236  				goto found;
8b13f6a2936831 David Howells 2025-07-31  237  		}
8b13f6a2936831 David Howells 2025-07-31  238  		seg = 0;
8b13f6a2936831 David Howells 2025-07-31  239  	}
8b13f6a2936831 David Howells 2025-07-31  240  	if (WARN_ON_ONCE(retain > 0))
8b13f6a2936831 David Howells 2025-07-31  241  		return -EMSGSIZE;
8b13f6a2936831 David Howells 2025-07-31 @242  	bq->bv[seg].bv_len += retain;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
