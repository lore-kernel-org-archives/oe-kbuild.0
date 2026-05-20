Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DD53D8138
	for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 17:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779296441; cv=none; b=Fq7XcPqVwjvaL7+7Zu68FnNkhxR9NPEgIIbwH0vNXSlPAXVAG+1DSa1jRCBf9y1D+7cJ90cJkuYUvsN/S90GvNpItylY6SPkkNR6BUktjiAMKdhkBGjDPmSVUpA+MTSjdS/DHXGw0wYqD50Uqof83WQOmHMuuOaODYyv68ut1Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779296441; c=relaxed/simple;
	bh=kaH+4fxZ/u3pq8lIbF8GNMdpAH1KA87Lx+NUNS2r/ig=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mh/77DoIEBkvzZn35fIqIAd2+tvcwdIJPobv/QyxyIdRka1BO8tCYleFuxK4QPYbxoTglcl5JOiiXTP289VvaFdXMMZNFxrtjatFyQlGCNsK61E6/FneYwrkVzQNLDxSUjRjjR0ZbwvMJ+poVb400ecxStSPlWsiOiRh32zv0Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h1klmlBl; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h1klmlBl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779296441; x=1810832441;
  h=date:from:to:cc:subject:message-id;
  bh=kaH+4fxZ/u3pq8lIbF8GNMdpAH1KA87Lx+NUNS2r/ig=;
  b=h1klmlBliYksMDKVXOJUZFkoidnHroUTZUn/dgcvEo9rJ05vhmoNjGcI
   D2IErR9dcaN8kfNA6BVVhfw9jKy4ggTPazPo5hA2LrLAcequq3cJvn2tK
   Z4MvzkcSSvtRbRvcS5yA/CW7ugzIi53YYNQqxVFXJelFZ91XL+lxFuEab
   tURGyMPB7P4VOJM8YPVN6fVzJnO8Xrf1NNg1fok6ebs8Pqurt8w8QNclz
   S49PPVwevvolPh2y/OkT5yFqNds5kr5LDjnBNRu0DWsJPj9ZYqZfqa20v
   lIBnHywubi6frqvLgEjR00EFpQ9VWCUFLv+Ib9x1oWdyYlLEd90n3vDkV
   w==;
X-CSE-ConnectionGUID: ApEq3nv4RUyv1XRrVRuIog==
X-CSE-MsgGUID: ge1XUegRSCCJoHwAlNDeLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="83820152"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="83820152"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 10:00:41 -0700
X-CSE-ConnectionGUID: PRLpXxvwTDyHyQlqA4rfAQ==
X-CSE-MsgGUID: zuw8xLonSiKPoXwIAjc6MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="270589598"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 May 2026 10:00:36 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPkH0-000000003ab-296N;
	Wed, 20 May 2026 17:00:09 +0000
Date: Thu, 21 May 2026 00:59:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dhowells-fs:netfs-crypt 25/34]
 fs/netfs/write_retry.c:34:27: sparse: sparse: unsigned value that used to be
 signed checked against zero?
Message-ID: <202605210057.U1F932Nx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/netfs/write_retry.c:34:27: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   13cee75c8b683f7c4382573f8c27adfbd49ffc47
commit: 0bc90a453f6e9deeddbf0a9f923637e0fc614ee7 [25/34] netfs: Allow the fs to ask for the bvecq to be copied when prepping
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: sparc-randconfig-r122-20260520 (https://download.01.org/0day-ci/archive/20260521/202605210057.U1F932Nx-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605210057.U1F932Nx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605210057.U1F932Nx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/netfs/write_retry.c:34:27: sparse: sparse: unsigned value that used to be signed checked against zero?
   fs/netfs/write_retry.c:32:36: sparse: signed value source

vim +34 fs/netfs/write_retry.c

751e213f9f8a24 David Howells 2024-12-16  13  
751e213f9f8a24 David Howells 2024-12-16  14  /*
a036d07724fd9e David Howells 2026-04-09  15   * Prepare the write buffer for a retry.  We can't necessarily reuse the write
a036d07724fd9e David Howells 2026-04-09  16   * buffer from the previous run of a subrequest because the filesystem is
a036d07724fd9e David Howells 2026-04-09  17   * permitted to modify it (add headers/trailers, encrypt it).  Further, the
a036d07724fd9e David Howells 2026-04-09  18   * subrequest may now be a different size (e.g. cifs has to negotiate for
a036d07724fd9e David Howells 2026-04-09  19   * maximum transfer size).  Also, we can't look at *stream as that may still
a036d07724fd9e David Howells 2026-04-09  20   * refer to the source material being broken up into original subrequests.
a036d07724fd9e David Howells 2026-04-09  21   */
a036d07724fd9e David Howells 2026-04-09  22  int netfs_prepare_write_retry_buffer(struct netfs_io_subrequest *subreq,
0bc90a453f6e9d David Howells 2026-05-15  23  				     unsigned int max_segs, bool copy)
a036d07724fd9e David Howells 2026-04-09  24  {
a036d07724fd9e David Howells 2026-04-09  25  	struct netfs_io_request *wreq = subreq->rreq;
a036d07724fd9e David Howells 2026-04-09  26  	struct netfs_io_stream *stream = &wreq->io_streams[subreq->stream_nr];
a036d07724fd9e David Howells 2026-04-09  27  	size_t len;
a036d07724fd9e David Howells 2026-04-09  28  
a036d07724fd9e David Howells 2026-04-09  29  	bvecq_pos_set(&subreq->dispatch_pos, &wreq->retry_cursor);
0bc90a453f6e9d David Howells 2026-05-15  30  
0bc90a453f6e9d David Howells 2026-05-15  31  	if (copy) {
0bc90a453f6e9d David Howells 2026-05-15  32  		len = bvecq_extract(&wreq->retry_cursor, subreq->len, max_segs,
0bc90a453f6e9d David Howells 2026-05-15  33  				    &subreq->content.bvecq);
0bc90a453f6e9d David Howells 2026-05-15 @34  		if (len < 0)
0bc90a453f6e9d David Howells 2026-05-15  35  			return -ENOMEM;
0bc90a453f6e9d David Howells 2026-05-15  36  	} else {
a036d07724fd9e David Howells 2026-04-09  37  		bvecq_pos_set(&subreq->content, &wreq->retry_cursor);
0bc90a453f6e9d David Howells 2026-05-15  38  		len = bvecq_slice(&wreq->retry_cursor, subreq->len, max_segs,
0bc90a453f6e9d David Howells 2026-05-15  39  				  &subreq->nr_segs);
0bc90a453f6e9d David Howells 2026-05-15  40  	}
a036d07724fd9e David Howells 2026-04-09  41  
a036d07724fd9e David Howells 2026-04-09  42  	if (len < subreq->len) {
a036d07724fd9e David Howells 2026-04-09  43  		subreq->len = len;
a036d07724fd9e David Howells 2026-04-09  44  		trace_netfs_sreq(subreq, netfs_sreq_trace_limited);
a036d07724fd9e David Howells 2026-04-09  45  	}
a036d07724fd9e David Howells 2026-04-09  46  
a036d07724fd9e David Howells 2026-04-09  47  	stream->issue_from += len;
a036d07724fd9e David Howells 2026-04-09  48  	stream->buffered   -= len;
a036d07724fd9e David Howells 2026-04-09  49  	if (stream->buffered == 0)
a036d07724fd9e David Howells 2026-04-09  50  		bvecq_pos_unset(&wreq->retry_cursor);
a036d07724fd9e David Howells 2026-04-09  51  	return 0;
a036d07724fd9e David Howells 2026-04-09  52  }
a036d07724fd9e David Howells 2026-04-09  53  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
