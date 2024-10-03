Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1057019B59F
	for <oe-kbuild@lists.linux.dev>; Thu,  3 Oct 2024 15:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727970642; cv=none; b=D1tonzzWxUhbhsxhvsaeDfV5/mAxQ7SCsXcIL4dpX0yuovQe52zNZioD4e7HppXhHptkOn1twVNpuNQQDJvCL8g7bbqoT1lKYqO8GcjIZ6aJgSY1MU2cd9fAuqWZpNAuEGgjAO7xwTD62kfyeg5uzDqFJIgiLZXGY0aMS58gdtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727970642; c=relaxed/simple;
	bh=s2GdYazihk0gPyXmh+LXiRUd/05gl+9W87Yg4cGywEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D9HjkpDIWTvXqpu3DcNd9h+kLJIV1F8fygoI5M2i4hC0uyP+vVWe7zei+6QZ2do7I18UuvD5dSqAjrlXj88O7RLMIGLHcHKuJOsYFp6lIj4DnD4iIy4w0DLd9es3Acy8nTLWhwiUT/4KeaaYupV9CiLT8MJHHdEKaK3UXAGMZsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kXQAF+8W; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kXQAF+8W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727970640; x=1759506640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s2GdYazihk0gPyXmh+LXiRUd/05gl+9W87Yg4cGywEI=;
  b=kXQAF+8WyRfU9OwvEdAMUSoIQYDE2S7WsDZnSwHuL/iSPWHv6d2ZlcYn
   JM4A6bR0DhqO/lUuJENbW6nfstXYKavlLPHURE7ggOlJ68b0h09Q2b8ll
   qPrOu/xDRCDesl6n4lMM65aozyoAW0mZUCGILCR/AkXOkqEjrxD3K8bVH
   p1XJO+PcpvO3Tjm8iULRmUMNCtfJR3xoBWE2HudTKfqsWdFvJbeVIGgB2
   5P3PDhDAiywi7xL6QRpQZHD/L9drOfNK+lOHwBwZ/0wKak/RrQQGokHAf
   0W45Y5l2OZD9dF+PlznICJ8i5d+iN9FqTueZa+/9mAHK3LegMS2PuqjWl
   w==;
X-CSE-ConnectionGUID: ewNUpQsYQr2LchKWrvmP0Q==
X-CSE-MsgGUID: nZBPgyDNQKWAGFaIT8+XOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="31052781"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="31052781"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 08:50:39 -0700
X-CSE-ConnectionGUID: henLYD5GRoaY5ygdykp81g==
X-CSE-MsgGUID: OUUAxMMnR+yZsQg+fpyOpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="97722467"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Oct 2024 08:50:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swO67-0000au-2y;
	Thu, 03 Oct 2024 15:50:35 +0000
Date: Thu, 3 Oct 2024 23:49:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dhowells-fs:netfs-fixes 11/11] fs/netfs/read_retry.c:235
 netfs_retry_read_subrequests() error: uninitialized symbol 'subreq'.
Message-ID: <202410032352.BxEbajrr-lkp@intel.com>
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
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-fixes
head:   138e9fb0a2ea3886803ba42efac5eb869d944f31
commit: 138e9fb0a2ea3886803ba42efac5eb869d944f31 [11/11] netfs: Change the read result collector to only use one work item
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: x86_64-randconfig-161-20241003 (https://download.01.org/0day-ci/archive/20241003/202410032352.BxEbajrr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410032352.BxEbajrr-lkp@intel.com/

New smatch warnings:
fs/netfs/read_retry.c:235 netfs_retry_read_subrequests() error: uninitialized symbol 'subreq'.

Old smatch warnings:
fs/netfs/read_retry.c:131 netfs_retry_read_subrequests() error: we previously assumed 'rreq->netfs_ops->prepare_read' could be null (see line 43)
fs/netfs/read_retry.c:239 netfs_retry_read_subrequests() error: uninitialized symbol 'subreq'.

vim +/subreq +235 fs/netfs/read_retry.c

ee4cdf7ba857a8 David Howells 2024-07-02   21  
ee4cdf7ba857a8 David Howells 2024-07-02   22  /*
ee4cdf7ba857a8 David Howells 2024-07-02   23   * Go through the list of failed/short reads, retrying all retryable ones.  We
ee4cdf7ba857a8 David Howells 2024-07-02   24   * need to switch failed cache reads to network downloads.
ee4cdf7ba857a8 David Howells 2024-07-02   25   */
ee4cdf7ba857a8 David Howells 2024-07-02   26  static void netfs_retry_read_subrequests(struct netfs_io_request *rreq)
ee4cdf7ba857a8 David Howells 2024-07-02   27  {
ee4cdf7ba857a8 David Howells 2024-07-02   28  	struct netfs_io_subrequest *subreq;
138e9fb0a2ea38 David Howells 2024-09-25   29  	struct netfs_io_stream *stream = &rreq->io_streams[0];
138e9fb0a2ea38 David Howells 2024-09-25   30  	struct list_head *next;
ee4cdf7ba857a8 David Howells 2024-07-02   31  
ee4cdf7ba857a8 David Howells 2024-07-02   32  	_enter("R=%x", rreq->debug_id);
ee4cdf7ba857a8 David Howells 2024-07-02   33  
138e9fb0a2ea38 David Howells 2024-09-25   34  	if (list_empty(&stream->subrequests))
ee4cdf7ba857a8 David Howells 2024-07-02   35  		return;
ee4cdf7ba857a8 David Howells 2024-07-02   36  
ee4cdf7ba857a8 David Howells 2024-07-02   37  	if (rreq->netfs_ops->retry_request)
ee4cdf7ba857a8 David Howells 2024-07-02   38  		rreq->netfs_ops->retry_request(rreq, NULL);
ee4cdf7ba857a8 David Howells 2024-07-02   39  
ee4cdf7ba857a8 David Howells 2024-07-02   40  	/* If there's no renegotiation to do, just resend each retryable subreq
ee4cdf7ba857a8 David Howells 2024-07-02   41  	 * up to the first permanently failed one.
ee4cdf7ba857a8 David Howells 2024-07-02   42  	 */
ee4cdf7ba857a8 David Howells 2024-07-02   43  	if (!rreq->netfs_ops->prepare_read &&
ee4cdf7ba857a8 David Howells 2024-07-02   44  	    !test_bit(NETFS_RREQ_COPY_TO_CACHE, &rreq->flags)) {
ee4cdf7ba857a8 David Howells 2024-07-02   45  		struct netfs_io_subrequest *subreq;
ee4cdf7ba857a8 David Howells 2024-07-02   46  
138e9fb0a2ea38 David Howells 2024-09-25   47  		list_for_each_entry(subreq, &stream->subrequests, rreq_link) {
ee4cdf7ba857a8 David Howells 2024-07-02   48  			if (test_bit(NETFS_SREQ_FAILED, &subreq->flags))
ee4cdf7ba857a8 David Howells 2024-07-02   49  				break;
ee4cdf7ba857a8 David Howells 2024-07-02   50  			if (__test_and_clear_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags)) {
ee4cdf7ba857a8 David Howells 2024-07-02   51  				netfs_reset_iter(subreq);
ee4cdf7ba857a8 David Howells 2024-07-02   52  				netfs_reissue_read(rreq, subreq);
ee4cdf7ba857a8 David Howells 2024-07-02   53  			}
ee4cdf7ba857a8 David Howells 2024-07-02   54  		}
ee4cdf7ba857a8 David Howells 2024-07-02   55  		return;
ee4cdf7ba857a8 David Howells 2024-07-02   56  	}
ee4cdf7ba857a8 David Howells 2024-07-02   57  
ee4cdf7ba857a8 David Howells 2024-07-02   58  	/* Okay, we need to renegotiate all the download requests and flip any
ee4cdf7ba857a8 David Howells 2024-07-02   59  	 * failed cache reads over to being download requests and negotiate
ee4cdf7ba857a8 David Howells 2024-07-02   60  	 * those also.  All fully successful subreqs have been removed from the
ee4cdf7ba857a8 David Howells 2024-07-02   61  	 * list and any spare data from those has been donated.
ee4cdf7ba857a8 David Howells 2024-07-02   62  	 *
ee4cdf7ba857a8 David Howells 2024-07-02   63  	 * What we do is decant the list and rebuild it one subreq at a time so
ee4cdf7ba857a8 David Howells 2024-07-02   64  	 * that we don't end up with donations jumping over a gap we're busy
ee4cdf7ba857a8 David Howells 2024-07-02   65  	 * populating with smaller subrequests.  In the event that the subreq
ee4cdf7ba857a8 David Howells 2024-07-02   66  	 * we just launched finishes before we insert the next subreq, it'll
ee4cdf7ba857a8 David Howells 2024-07-02   67  	 * fill in rreq->prev_donated instead.
138e9fb0a2ea38 David Howells 2024-09-25   68  	 *
ee4cdf7ba857a8 David Howells 2024-07-02   69  	 * Note: Alternatively, we could split the tail subrequest right before
ee4cdf7ba857a8 David Howells 2024-07-02   70  	 * we reissue it and fix up the donations under lock.
ee4cdf7ba857a8 David Howells 2024-07-02   71  	 */
138e9fb0a2ea38 David Howells 2024-09-25   72  	next = stream->subrequests.next;
ee4cdf7ba857a8 David Howells 2024-07-02   73  
ee4cdf7ba857a8 David Howells 2024-07-02   74  	do {
138e9fb0a2ea38 David Howells 2024-09-25   75  		struct netfs_io_subrequest *subreq = NULL, *from, *to, *tmp;
ee4cdf7ba857a8 David Howells 2024-07-02   76  		struct iov_iter source;
ee4cdf7ba857a8 David Howells 2024-07-02   77  		unsigned long long start, len;
138e9fb0a2ea38 David Howells 2024-09-25   78  		size_t part;
ee4cdf7ba857a8 David Howells 2024-07-02   79  		bool boundary = false;
ee4cdf7ba857a8 David Howells 2024-07-02   80  
ee4cdf7ba857a8 David Howells 2024-07-02   81  		/* Go through the subreqs and find the next span of contiguous
ee4cdf7ba857a8 David Howells 2024-07-02   82  		 * buffer that we then rejig (cifs, for example, needs the
ee4cdf7ba857a8 David Howells 2024-07-02   83  		 * rsize renegotiating) and reissue.
ee4cdf7ba857a8 David Howells 2024-07-02   84  		 */
138e9fb0a2ea38 David Howells 2024-09-25   85  		from = list_entry(next, struct netfs_io_subrequest, rreq_link);
138e9fb0a2ea38 David Howells 2024-09-25   86  		to = from;
ee4cdf7ba857a8 David Howells 2024-07-02   87  		start = from->start + from->transferred;
ee4cdf7ba857a8 David Howells 2024-07-02   88  		len   = from->len   - from->transferred;
ee4cdf7ba857a8 David Howells 2024-07-02   89  
138e9fb0a2ea38 David Howells 2024-09-25   90  		_debug("from R=%08x[%x] s=%llx ctl=%zx/%zx",
ee4cdf7ba857a8 David Howells 2024-07-02   91  		       rreq->debug_id, from->debug_index,
138e9fb0a2ea38 David Howells 2024-09-25   92  		       from->start, from->transferred, from->len);
ee4cdf7ba857a8 David Howells 2024-07-02   93  
ee4cdf7ba857a8 David Howells 2024-07-02   94  		if (test_bit(NETFS_SREQ_FAILED, &from->flags) ||
ee4cdf7ba857a8 David Howells 2024-07-02   95  		    !test_bit(NETFS_SREQ_NEED_RETRY, &from->flags))
ee4cdf7ba857a8 David Howells 2024-07-02   96  			goto abandon;
ee4cdf7ba857a8 David Howells 2024-07-02   97  
138e9fb0a2ea38 David Howells 2024-09-25   98  		list_for_each_continue(next, &stream->subrequests) {
138e9fb0a2ea38 David Howells 2024-09-25   99  			subreq = list_entry(next, struct netfs_io_subrequest, rreq_link);
138e9fb0a2ea38 David Howells 2024-09-25  100  			if (subreq->start + subreq->transferred != start + len ||
138e9fb0a2ea38 David Howells 2024-09-25  101  			    test_bit(NETFS_SREQ_BOUNDARY, &subreq->flags) ||
ee4cdf7ba857a8 David Howells 2024-07-02  102  			    !test_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags))
ee4cdf7ba857a8 David Howells 2024-07-02  103  				break;
138e9fb0a2ea38 David Howells 2024-09-25  104  			to = subreq;
138e9fb0a2ea38 David Howells 2024-09-25  105  			len += to->len;
ee4cdf7ba857a8 David Howells 2024-07-02  106  		}
ee4cdf7ba857a8 David Howells 2024-07-02  107  
ee4cdf7ba857a8 David Howells 2024-07-02  108  		_debug(" - range: %llx-%llx %llx", start, start + len - 1, len);
ee4cdf7ba857a8 David Howells 2024-07-02  109  
ee4cdf7ba857a8 David Howells 2024-07-02  110  		/* Determine the set of buffers we're going to use.  Each
ee4cdf7ba857a8 David Howells 2024-07-02  111  		 * subreq gets a subset of a single overall contiguous buffer.
ee4cdf7ba857a8 David Howells 2024-07-02  112  		 */
ee4cdf7ba857a8 David Howells 2024-07-02  113  		netfs_reset_iter(from);
ee4cdf7ba857a8 David Howells 2024-07-02  114  		source = from->io_iter;
ee4cdf7ba857a8 David Howells 2024-07-02  115  		source.count = len;
ee4cdf7ba857a8 David Howells 2024-07-02  116  
ee4cdf7ba857a8 David Howells 2024-07-02  117  		/* Work through the sublist. */
138e9fb0a2ea38 David Howells 2024-09-25  118  		subreq = from;
138e9fb0a2ea38 David Howells 2024-09-25  119  		list_for_each_entry_from(subreq, &stream->subrequests, rreq_link) {
138e9fb0a2ea38 David Howells 2024-09-25  120  			if (!len)
138e9fb0a2ea38 David Howells 2024-09-25  121  				break;
ee4cdf7ba857a8 David Howells 2024-07-02  122  			subreq->source	= NETFS_DOWNLOAD_FROM_SERVER;
ee4cdf7ba857a8 David Howells 2024-07-02  123  			subreq->start	= start - subreq->transferred;
ee4cdf7ba857a8 David Howells 2024-07-02  124  			subreq->len	= len   + subreq->transferred;
ee4cdf7ba857a8 David Howells 2024-07-02  125  			__clear_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags);
ee4cdf7ba857a8 David Howells 2024-07-02  126  			__set_bit(NETFS_SREQ_RETRYING, &subreq->flags);
ee4cdf7ba857a8 David Howells 2024-07-02  127  			trace_netfs_sreq(subreq, netfs_sreq_trace_retry);
ee4cdf7ba857a8 David Howells 2024-07-02  128  
ee4cdf7ba857a8 David Howells 2024-07-02  129  			/* Renegotiate max_len (rsize) */
138e9fb0a2ea38 David Howells 2024-09-25  130  			stream->sreq_max_len = subreq->len;
ee4cdf7ba857a8 David Howells 2024-07-02  131  			if (rreq->netfs_ops->prepare_read(subreq) < 0) {
ee4cdf7ba857a8 David Howells 2024-07-02  132  				trace_netfs_sreq(subreq, netfs_sreq_trace_reprep_failed);
ee4cdf7ba857a8 David Howells 2024-07-02  133  				__set_bit(NETFS_SREQ_FAILED, &subreq->flags);
138e9fb0a2ea38 David Howells 2024-09-25  134  				goto abandon;
ee4cdf7ba857a8 David Howells 2024-07-02  135  			}
ee4cdf7ba857a8 David Howells 2024-07-02  136  
138e9fb0a2ea38 David Howells 2024-09-25  137  			part = umin(len, stream->sreq_max_len);
138e9fb0a2ea38 David Howells 2024-09-25  138  			if (unlikely(stream->sreq_max_segs))
138e9fb0a2ea38 David Howells 2024-09-25  139  				part = netfs_limit_iter(&source, 0, part, stream->sreq_max_segs);
ee4cdf7ba857a8 David Howells 2024-07-02  140  			subreq->len = subreq->transferred + part;
ee4cdf7ba857a8 David Howells 2024-07-02  141  			subreq->io_iter = source;
ee4cdf7ba857a8 David Howells 2024-07-02  142  			iov_iter_truncate(&subreq->io_iter, part);
ee4cdf7ba857a8 David Howells 2024-07-02  143  			iov_iter_advance(&source, part);
ee4cdf7ba857a8 David Howells 2024-07-02  144  			len -= part;
ee4cdf7ba857a8 David Howells 2024-07-02  145  			start += part;
ee4cdf7ba857a8 David Howells 2024-07-02  146  			if (!len) {
ee4cdf7ba857a8 David Howells 2024-07-02  147  				if (boundary)
ee4cdf7ba857a8 David Howells 2024-07-02  148  					__set_bit(NETFS_SREQ_BOUNDARY, &subreq->flags);
ee4cdf7ba857a8 David Howells 2024-07-02  149  			} else {
ee4cdf7ba857a8 David Howells 2024-07-02  150  				__clear_bit(NETFS_SREQ_BOUNDARY, &subreq->flags);
ee4cdf7ba857a8 David Howells 2024-07-02  151  			}
ee4cdf7ba857a8 David Howells 2024-07-02  152  
138e9fb0a2ea38 David Howells 2024-09-25  153  			netfs_get_subrequest(subreq, netfs_sreq_trace_get_resubmit);
ee4cdf7ba857a8 David Howells 2024-07-02  154  			netfs_reissue_read(rreq, subreq);
138e9fb0a2ea38 David Howells 2024-09-25  155  			if (subreq == to)
ee4cdf7ba857a8 David Howells 2024-07-02  156  				break;
ee4cdf7ba857a8 David Howells 2024-07-02  157  		}
ee4cdf7ba857a8 David Howells 2024-07-02  158  
ee4cdf7ba857a8 David Howells 2024-07-02  159  		/* If we managed to use fewer subreqs, we can discard the
138e9fb0a2ea38 David Howells 2024-09-25  160  		 * excess; if we used the same number, then we're done.
ee4cdf7ba857a8 David Howells 2024-07-02  161  		 */
138e9fb0a2ea38 David Howells 2024-09-25  162  		if (!len) {
138e9fb0a2ea38 David Howells 2024-09-25  163  			if (subreq == to)
138e9fb0a2ea38 David Howells 2024-09-25  164  				continue;
138e9fb0a2ea38 David Howells 2024-09-25  165  			list_for_each_entry_safe_from(subreq, tmp,
138e9fb0a2ea38 David Howells 2024-09-25  166  						      &stream->subrequests, rreq_link) {
ee4cdf7ba857a8 David Howells 2024-07-02  167  				trace_netfs_sreq(subreq, netfs_sreq_trace_discard);
ee4cdf7ba857a8 David Howells 2024-07-02  168  				list_del(&subreq->rreq_link);
ee4cdf7ba857a8 David Howells 2024-07-02  169  				netfs_put_subrequest(subreq, false, netfs_sreq_trace_put_done);
138e9fb0a2ea38 David Howells 2024-09-25  170  				if (subreq == to)
138e9fb0a2ea38 David Howells 2024-09-25  171  					break;
138e9fb0a2ea38 David Howells 2024-09-25  172  			}
138e9fb0a2ea38 David Howells 2024-09-25  173  			continue;
138e9fb0a2ea38 David Howells 2024-09-25  174  		}
138e9fb0a2ea38 David Howells 2024-09-25  175  
138e9fb0a2ea38 David Howells 2024-09-25  176  		/* We ran out of subrequests, so we need to allocate some more
138e9fb0a2ea38 David Howells 2024-09-25  177  		 * and insert them after.
138e9fb0a2ea38 David Howells 2024-09-25  178  		 */
138e9fb0a2ea38 David Howells 2024-09-25  179  		do {
138e9fb0a2ea38 David Howells 2024-09-25  180  			subreq = netfs_alloc_subrequest(rreq);
138e9fb0a2ea38 David Howells 2024-09-25  181  			if (!subreq) {
138e9fb0a2ea38 David Howells 2024-09-25  182  				subreq = to;
138e9fb0a2ea38 David Howells 2024-09-25  183  				goto abandon_after;
138e9fb0a2ea38 David Howells 2024-09-25  184  			}
138e9fb0a2ea38 David Howells 2024-09-25  185  			subreq->source		= NETFS_DOWNLOAD_FROM_SERVER;
138e9fb0a2ea38 David Howells 2024-09-25  186  			subreq->start		= start;
138e9fb0a2ea38 David Howells 2024-09-25  187  			subreq->len		= len;
138e9fb0a2ea38 David Howells 2024-09-25  188  			subreq->debug_index	= atomic_inc_return(&rreq->subreq_counter);
138e9fb0a2ea38 David Howells 2024-09-25  189  			subreq->stream_nr	= stream->stream_nr;
138e9fb0a2ea38 David Howells 2024-09-25  190  			__set_bit(NETFS_SREQ_RETRYING, &subreq->flags);
138e9fb0a2ea38 David Howells 2024-09-25  191  
138e9fb0a2ea38 David Howells 2024-09-25  192  			trace_netfs_sreq_ref(rreq->debug_id, subreq->debug_index,
138e9fb0a2ea38 David Howells 2024-09-25  193  					     refcount_read(&subreq->ref),
138e9fb0a2ea38 David Howells 2024-09-25  194  					     netfs_sreq_trace_new);
138e9fb0a2ea38 David Howells 2024-09-25  195  			netfs_get_subrequest(subreq, netfs_sreq_trace_get_resubmit);
138e9fb0a2ea38 David Howells 2024-09-25  196  
138e9fb0a2ea38 David Howells 2024-09-25  197  			list_add(&subreq->rreq_link, &to->rreq_link);
138e9fb0a2ea38 David Howells 2024-09-25  198  			to = list_next_entry(to, rreq_link);
138e9fb0a2ea38 David Howells 2024-09-25  199  			trace_netfs_sreq(subreq, netfs_sreq_trace_retry);
138e9fb0a2ea38 David Howells 2024-09-25  200  
138e9fb0a2ea38 David Howells 2024-09-25  201  			stream->sreq_max_len	= umin(len, rreq->rsize);
138e9fb0a2ea38 David Howells 2024-09-25  202  			stream->sreq_max_segs	= 0;
138e9fb0a2ea38 David Howells 2024-09-25  203  			if (unlikely(stream->sreq_max_segs))
138e9fb0a2ea38 David Howells 2024-09-25  204  				part = netfs_limit_iter(&source, 0, part, stream->sreq_max_segs);
138e9fb0a2ea38 David Howells 2024-09-25  205  
138e9fb0a2ea38 David Howells 2024-09-25  206  			netfs_stat(&netfs_n_rh_download);
138e9fb0a2ea38 David Howells 2024-09-25  207  			if (rreq->netfs_ops->prepare_read(subreq) < 0) {
138e9fb0a2ea38 David Howells 2024-09-25  208  				trace_netfs_sreq(subreq, netfs_sreq_trace_reprep_failed);
138e9fb0a2ea38 David Howells 2024-09-25  209  				__set_bit(NETFS_SREQ_FAILED, &subreq->flags);
138e9fb0a2ea38 David Howells 2024-09-25  210  				goto abandon;
ee4cdf7ba857a8 David Howells 2024-07-02  211  			}
ee4cdf7ba857a8 David Howells 2024-07-02  212  
138e9fb0a2ea38 David Howells 2024-09-25  213  			part = umin(len, stream->sreq_max_len);
138e9fb0a2ea38 David Howells 2024-09-25  214  			subreq->len = subreq->transferred + part;
138e9fb0a2ea38 David Howells 2024-09-25  215  			subreq->io_iter = source;
138e9fb0a2ea38 David Howells 2024-09-25  216  			iov_iter_truncate(&subreq->io_iter, part);
138e9fb0a2ea38 David Howells 2024-09-25  217  			iov_iter_advance(&source, part);
138e9fb0a2ea38 David Howells 2024-09-25  218  
138e9fb0a2ea38 David Howells 2024-09-25  219  			len -= part;
138e9fb0a2ea38 David Howells 2024-09-25  220  			start += part;
138e9fb0a2ea38 David Howells 2024-09-25  221  			if (!len && boundary) {
138e9fb0a2ea38 David Howells 2024-09-25  222  				__set_bit(NETFS_SREQ_BOUNDARY, &to->flags);
138e9fb0a2ea38 David Howells 2024-09-25  223  				boundary = false;
138e9fb0a2ea38 David Howells 2024-09-25  224  			}
138e9fb0a2ea38 David Howells 2024-09-25  225  
138e9fb0a2ea38 David Howells 2024-09-25  226  			netfs_reissue_read(rreq, subreq);
138e9fb0a2ea38 David Howells 2024-09-25  227  		} while (len);
138e9fb0a2ea38 David Howells 2024-09-25  228  
138e9fb0a2ea38 David Howells 2024-09-25  229  	} while (!list_is_head(next, &stream->subrequests));
ee4cdf7ba857a8 David Howells 2024-07-02  230  
ee4cdf7ba857a8 David Howells 2024-07-02  231  	return;
ee4cdf7ba857a8 David Howells 2024-07-02  232  
138e9fb0a2ea38 David Howells 2024-09-25  233  	/* If we hit an error, fail all remaining incomplete subrequests */
138e9fb0a2ea38 David Howells 2024-09-25  234  abandon_after:
138e9fb0a2ea38 David Howells 2024-09-25 @235  	if (list_is_last(&subreq->rreq_link, &stream->subrequests))
138e9fb0a2ea38 David Howells 2024-09-25  236  		return;
138e9fb0a2ea38 David Howells 2024-09-25  237  	subreq = list_next_entry(subreq, rreq_link);
ee4cdf7ba857a8 David Howells 2024-07-02  238  abandon:
138e9fb0a2ea38 David Howells 2024-09-25  239  	list_for_each_entry_from(subreq, &stream->subrequests, rreq_link) {
138e9fb0a2ea38 David Howells 2024-09-25  240  		if (!subreq->error &&
138e9fb0a2ea38 David Howells 2024-09-25  241  		    !test_bit(NETFS_SREQ_FAILED, &subreq->flags) &&
138e9fb0a2ea38 David Howells 2024-09-25  242  		    !test_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags))
138e9fb0a2ea38 David Howells 2024-09-25  243  			continue;
ee4cdf7ba857a8 David Howells 2024-07-02  244  		subreq->error = -ENOMEM;
138e9fb0a2ea38 David Howells 2024-09-25  245  		__set_bit(NETFS_SREQ_FAILED, &subreq->flags);
ee4cdf7ba857a8 David Howells 2024-07-02  246  		__clear_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags);
ee4cdf7ba857a8 David Howells 2024-07-02  247  		__clear_bit(NETFS_SREQ_RETRYING, &subreq->flags);
ee4cdf7ba857a8 David Howells 2024-07-02  248  	}
ee4cdf7ba857a8 David Howells 2024-07-02  249  }
ee4cdf7ba857a8 David Howells 2024-07-02  250  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
