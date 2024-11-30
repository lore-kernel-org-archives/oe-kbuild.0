Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A09478289
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 21:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733003570; cv=none; b=WQTQTyKBv1KFVYNesTDnVWA0e/LxbeUrY2Ms8Yy7jnOx1yKCIISRy5aog32UXX6o8HDPxvvEYNsiZU49dbjs476lgh59TVVi7cPVq/kUkT7JJmyWOKv0EdLWyMILg4h6lMF1Gx8B8g6odfv5QE5dqWodAPWb5kF9Wrh8c9lHEuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733003570; c=relaxed/simple;
	bh=Ui0Rozz/3sISh9MUKdnR8TJP9FMZOYpoQ2vmPC/Ka+A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ocM5EOOhTBOLq9Xu/eTS4P5+Z6joCnxj2Mf27jrkhk/8WNGx0iQKfNUXZym2sdAqTjcU2jM3X+tIoyp+pDyRlbP1mpGbIysJ7nGTRvLYtBsP8UruIsv/nCgTsHwUQzDJLuT5AAd5PFrKnRyTq+h9hNg4LlN4Cnzh6ZebbxcFqmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cobQLevD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cobQLevD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733003568; x=1764539568;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ui0Rozz/3sISh9MUKdnR8TJP9FMZOYpoQ2vmPC/Ka+A=;
  b=cobQLevDKYTFZOifoKFpxhPsCvMgjb+deNvwM40Jil2p21RJ7zissoup
   UDuP1JE54aZX9XjflK+T6DWaxLT1wmfMB1864gYCF2X5/63VVsX9gerJh
   kQVbvT6DjSAtTPSjyXuuFMKMeuKnzEvfk3xSUgQtEv6HzEU5ooRA9pNNC
   s26PkmFrGxl+wlptI6pySpz965y9+fsiJyMciX7bLbpTto1Rrzq22RoMj
   dHAozxM5HRBj2JwlfK2ZkzE7UB1eXiUOrnCVJ0OXluBtXDF0+/vYSTjYl
   ZJ5clWo1k8szHVKvp3fygu5xbSF7GgNE3JdFwmgcpx3UbsPq60Bnzq2Zy
   w==;
X-CSE-ConnectionGUID: 1tuiqIxDRpmFKop/jhkAJQ==
X-CSE-MsgGUID: SiFuWthaSjOPw8xETor3/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="33128800"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="33128800"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 13:52:48 -0800
X-CSE-ConnectionGUID: 8zcORFK0SJO1S+fB4/93wA==
X-CSE-MsgGUID: BlRgj1rwS5yHHpm0DKXynw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="123699060"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 30 Nov 2024 13:52:46 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHVO8-0000zt-2D;
	Sat, 30 Nov 2024 21:52:32 +0000
Date: Sun, 1 Dec 2024 05:52:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [dhowells-fs:netfs-writeback 30/36] fs/netfs/read_retry.c:161:7-13:
 ERROR: invalid reference to the index variable of the iterator on line 117
Message-ID: <202412010848.w9d5z8Q7-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   1daca71a815b0d8cfe3db81a31b6dd3fc0da4b50
commit: 94033e839a4165af3f03f3f694c8bf798bf7e688 [30/36] netfs: Change the read result collector to only use one work item
:::::: branch date: 32 hours ago
:::::: commit date: 12 days ago
config: openrisc-randconfig-r061-20241130 (https://download.01.org/0day-ci/archive/20241201/202412010848.w9d5z8Q7-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412010848.w9d5z8Q7-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/netfs/read_retry.c:161:7-13: ERROR: invalid reference to the index variable of the iterator on line 117

vim +161 fs/netfs/read_retry.c

ee4cdf7ba857a8 David Howells 2024-07-02   21  
ee4cdf7ba857a8 David Howells 2024-07-02   22  /*
ee4cdf7ba857a8 David Howells 2024-07-02   23   * Go through the list of failed/short reads, retrying all retryable ones.  We
ee4cdf7ba857a8 David Howells 2024-07-02   24   * need to switch failed cache reads to network downloads.
ee4cdf7ba857a8 David Howells 2024-07-02   25   */
ee4cdf7ba857a8 David Howells 2024-07-02   26  static void netfs_retry_read_subrequests(struct netfs_io_request *rreq)
ee4cdf7ba857a8 David Howells 2024-07-02   27  {
ee4cdf7ba857a8 David Howells 2024-07-02   28  	struct netfs_io_subrequest *subreq;
94033e839a4165 David Howells 2024-09-25   29  	struct netfs_io_stream *stream = &rreq->io_streams[0];
94033e839a4165 David Howells 2024-09-25   30  	struct list_head *next;
ee4cdf7ba857a8 David Howells 2024-07-02   31  
ee4cdf7ba857a8 David Howells 2024-07-02   32  	_enter("R=%x", rreq->debug_id);
ee4cdf7ba857a8 David Howells 2024-07-02   33  
94033e839a4165 David Howells 2024-09-25   34  	if (list_empty(&stream->subrequests))
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
94033e839a4165 David Howells 2024-09-25   45  		list_for_each_entry(subreq, &stream->subrequests, rreq_link) {
ee4cdf7ba857a8 David Howells 2024-07-02   46  			if (test_bit(NETFS_SREQ_FAILED, &subreq->flags))
ee4cdf7ba857a8 David Howells 2024-07-02   47  				break;
ee4cdf7ba857a8 David Howells 2024-07-02   48  			if (__test_and_clear_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags)) {
ee4cdf7ba857a8 David Howells 2024-07-02   49  				netfs_reset_iter(subreq);
ee4cdf7ba857a8 David Howells 2024-07-02   50  				netfs_reissue_read(rreq, subreq);
ee4cdf7ba857a8 David Howells 2024-07-02   51  			}
ee4cdf7ba857a8 David Howells 2024-07-02   52  		}
ee4cdf7ba857a8 David Howells 2024-07-02   53  		return;
ee4cdf7ba857a8 David Howells 2024-07-02   54  	}
ee4cdf7ba857a8 David Howells 2024-07-02   55  
ee4cdf7ba857a8 David Howells 2024-07-02   56  	/* Okay, we need to renegotiate all the download requests and flip any
ee4cdf7ba857a8 David Howells 2024-07-02   57  	 * failed cache reads over to being download requests and negotiate
ee4cdf7ba857a8 David Howells 2024-07-02   58  	 * those also.  All fully successful subreqs have been removed from the
ee4cdf7ba857a8 David Howells 2024-07-02   59  	 * list and any spare data from those has been donated.
ee4cdf7ba857a8 David Howells 2024-07-02   60  	 *
ee4cdf7ba857a8 David Howells 2024-07-02   61  	 * What we do is decant the list and rebuild it one subreq at a time so
ee4cdf7ba857a8 David Howells 2024-07-02   62  	 * that we don't end up with donations jumping over a gap we're busy
ee4cdf7ba857a8 David Howells 2024-07-02   63  	 * populating with smaller subrequests.  In the event that the subreq
ee4cdf7ba857a8 David Howells 2024-07-02   64  	 * we just launched finishes before we insert the next subreq, it'll
ee4cdf7ba857a8 David Howells 2024-07-02   65  	 * fill in rreq->prev_donated instead.
94033e839a4165 David Howells 2024-09-25   66  	 *
ee4cdf7ba857a8 David Howells 2024-07-02   67  	 * Note: Alternatively, we could split the tail subrequest right before
ee4cdf7ba857a8 David Howells 2024-07-02   68  	 * we reissue it and fix up the donations under lock.
ee4cdf7ba857a8 David Howells 2024-07-02   69  	 */
94033e839a4165 David Howells 2024-09-25   70  	next = stream->subrequests.next;
ee4cdf7ba857a8 David Howells 2024-07-02   71  
ee4cdf7ba857a8 David Howells 2024-07-02   72  	do {
94033e839a4165 David Howells 2024-09-25   73  		struct netfs_io_subrequest *from, *to, *tmp;
ee4cdf7ba857a8 David Howells 2024-07-02   74  		struct iov_iter source;
ee4cdf7ba857a8 David Howells 2024-07-02   75  		unsigned long long start, len;
94033e839a4165 David Howells 2024-09-25   76  		size_t part;
ee4cdf7ba857a8 David Howells 2024-07-02   77  		bool boundary = false;
ee4cdf7ba857a8 David Howells 2024-07-02   78  
ee4cdf7ba857a8 David Howells 2024-07-02   79  		/* Go through the subreqs and find the next span of contiguous
ee4cdf7ba857a8 David Howells 2024-07-02   80  		 * buffer that we then rejig (cifs, for example, needs the
ee4cdf7ba857a8 David Howells 2024-07-02   81  		 * rsize renegotiating) and reissue.
ee4cdf7ba857a8 David Howells 2024-07-02   82  		 */
94033e839a4165 David Howells 2024-09-25   83  		from = list_entry(next, struct netfs_io_subrequest, rreq_link);
94033e839a4165 David Howells 2024-09-25   84  		to = from;
ee4cdf7ba857a8 David Howells 2024-07-02   85  		start = from->start + from->transferred;
ee4cdf7ba857a8 David Howells 2024-07-02   86  		len   = from->len   - from->transferred;
ee4cdf7ba857a8 David Howells 2024-07-02   87  
94033e839a4165 David Howells 2024-09-25   88  		_debug("from R=%08x[%x] s=%llx ctl=%zx/%zx",
ee4cdf7ba857a8 David Howells 2024-07-02   89  		       rreq->debug_id, from->debug_index,
94033e839a4165 David Howells 2024-09-25   90  		       from->start, from->transferred, from->len);
ee4cdf7ba857a8 David Howells 2024-07-02   91  
ee4cdf7ba857a8 David Howells 2024-07-02   92  		if (test_bit(NETFS_SREQ_FAILED, &from->flags) ||
ee4cdf7ba857a8 David Howells 2024-07-02   93  		    !test_bit(NETFS_SREQ_NEED_RETRY, &from->flags))
ee4cdf7ba857a8 David Howells 2024-07-02   94  			goto abandon;
ee4cdf7ba857a8 David Howells 2024-07-02   95  
94033e839a4165 David Howells 2024-09-25   96  		list_for_each_continue(next, &stream->subrequests) {
94033e839a4165 David Howells 2024-09-25   97  			subreq = list_entry(next, struct netfs_io_subrequest, rreq_link);
94033e839a4165 David Howells 2024-09-25   98  			if (subreq->start + subreq->transferred != start + len ||
94033e839a4165 David Howells 2024-09-25   99  			    test_bit(NETFS_SREQ_BOUNDARY, &subreq->flags) ||
ee4cdf7ba857a8 David Howells 2024-07-02  100  			    !test_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags))
ee4cdf7ba857a8 David Howells 2024-07-02  101  				break;
94033e839a4165 David Howells 2024-09-25  102  			to = subreq;
94033e839a4165 David Howells 2024-09-25  103  			len += to->len;
ee4cdf7ba857a8 David Howells 2024-07-02  104  		}
ee4cdf7ba857a8 David Howells 2024-07-02  105  
ee4cdf7ba857a8 David Howells 2024-07-02  106  		_debug(" - range: %llx-%llx %llx", start, start + len - 1, len);
ee4cdf7ba857a8 David Howells 2024-07-02  107  
ee4cdf7ba857a8 David Howells 2024-07-02  108  		/* Determine the set of buffers we're going to use.  Each
ee4cdf7ba857a8 David Howells 2024-07-02  109  		 * subreq gets a subset of a single overall contiguous buffer.
ee4cdf7ba857a8 David Howells 2024-07-02  110  		 */
ee4cdf7ba857a8 David Howells 2024-07-02  111  		netfs_reset_iter(from);
ee4cdf7ba857a8 David Howells 2024-07-02  112  		source = from->io_iter;
ee4cdf7ba857a8 David Howells 2024-07-02  113  		source.count = len;
ee4cdf7ba857a8 David Howells 2024-07-02  114  
ee4cdf7ba857a8 David Howells 2024-07-02  115  		/* Work through the sublist. */
94033e839a4165 David Howells 2024-09-25  116  		subreq = from;
94033e839a4165 David Howells 2024-09-25 @117  		list_for_each_entry_from(subreq, &stream->subrequests, rreq_link) {
94033e839a4165 David Howells 2024-09-25  118  			if (!len)
94033e839a4165 David Howells 2024-09-25  119  				break;
ee4cdf7ba857a8 David Howells 2024-07-02  120  			subreq->source	= NETFS_DOWNLOAD_FROM_SERVER;
ee4cdf7ba857a8 David Howells 2024-07-02  121  			subreq->start	= start - subreq->transferred;
ee4cdf7ba857a8 David Howells 2024-07-02  122  			subreq->len	= len   + subreq->transferred;
ee4cdf7ba857a8 David Howells 2024-07-02  123  			__clear_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags);
ee4cdf7ba857a8 David Howells 2024-07-02  124  			__set_bit(NETFS_SREQ_RETRYING, &subreq->flags);
ee4cdf7ba857a8 David Howells 2024-07-02  125  			trace_netfs_sreq(subreq, netfs_sreq_trace_retry);
ee4cdf7ba857a8 David Howells 2024-07-02  126  
ee4cdf7ba857a8 David Howells 2024-07-02  127  			/* Renegotiate max_len (rsize) */
94033e839a4165 David Howells 2024-09-25  128  			stream->sreq_max_len = subreq->len;
ee4cdf7ba857a8 David Howells 2024-07-02  129  			if (rreq->netfs_ops->prepare_read(subreq) < 0) {
ee4cdf7ba857a8 David Howells 2024-07-02  130  				trace_netfs_sreq(subreq, netfs_sreq_trace_reprep_failed);
ee4cdf7ba857a8 David Howells 2024-07-02  131  				__set_bit(NETFS_SREQ_FAILED, &subreq->flags);
94033e839a4165 David Howells 2024-09-25  132  				goto abandon;
ee4cdf7ba857a8 David Howells 2024-07-02  133  			}
ee4cdf7ba857a8 David Howells 2024-07-02  134  
94033e839a4165 David Howells 2024-09-25  135  			part = umin(len, stream->sreq_max_len);
94033e839a4165 David Howells 2024-09-25  136  			if (unlikely(stream->sreq_max_segs))
94033e839a4165 David Howells 2024-09-25  137  				part = netfs_limit_iter(&source, 0, part, stream->sreq_max_segs);
ee4cdf7ba857a8 David Howells 2024-07-02  138  			subreq->len = subreq->transferred + part;
ee4cdf7ba857a8 David Howells 2024-07-02  139  			subreq->io_iter = source;
ee4cdf7ba857a8 David Howells 2024-07-02  140  			iov_iter_truncate(&subreq->io_iter, part);
ee4cdf7ba857a8 David Howells 2024-07-02  141  			iov_iter_advance(&source, part);
ee4cdf7ba857a8 David Howells 2024-07-02  142  			len -= part;
ee4cdf7ba857a8 David Howells 2024-07-02  143  			start += part;
ee4cdf7ba857a8 David Howells 2024-07-02  144  			if (!len) {
ee4cdf7ba857a8 David Howells 2024-07-02  145  				if (boundary)
ee4cdf7ba857a8 David Howells 2024-07-02  146  					__set_bit(NETFS_SREQ_BOUNDARY, &subreq->flags);
ee4cdf7ba857a8 David Howells 2024-07-02  147  			} else {
ee4cdf7ba857a8 David Howells 2024-07-02  148  				__clear_bit(NETFS_SREQ_BOUNDARY, &subreq->flags);
ee4cdf7ba857a8 David Howells 2024-07-02  149  			}
ee4cdf7ba857a8 David Howells 2024-07-02  150  
94033e839a4165 David Howells 2024-09-25  151  			netfs_get_subrequest(subreq, netfs_sreq_trace_get_resubmit);
ee4cdf7ba857a8 David Howells 2024-07-02  152  			netfs_reissue_read(rreq, subreq);
94033e839a4165 David Howells 2024-09-25  153  			if (subreq == to)
ee4cdf7ba857a8 David Howells 2024-07-02  154  				break;
ee4cdf7ba857a8 David Howells 2024-07-02  155  		}
ee4cdf7ba857a8 David Howells 2024-07-02  156  
ee4cdf7ba857a8 David Howells 2024-07-02  157  		/* If we managed to use fewer subreqs, we can discard the
94033e839a4165 David Howells 2024-09-25  158  		 * excess; if we used the same number, then we're done.
ee4cdf7ba857a8 David Howells 2024-07-02  159  		 */
94033e839a4165 David Howells 2024-09-25  160  		if (!len) {
94033e839a4165 David Howells 2024-09-25 @161  			if (subreq == to)
94033e839a4165 David Howells 2024-09-25  162  				continue;
94033e839a4165 David Howells 2024-09-25  163  			list_for_each_entry_safe_from(subreq, tmp,
94033e839a4165 David Howells 2024-09-25  164  						      &stream->subrequests, rreq_link) {
ee4cdf7ba857a8 David Howells 2024-07-02  165  				trace_netfs_sreq(subreq, netfs_sreq_trace_discard);
ee4cdf7ba857a8 David Howells 2024-07-02  166  				list_del(&subreq->rreq_link);
ee4cdf7ba857a8 David Howells 2024-07-02  167  				netfs_put_subrequest(subreq, false, netfs_sreq_trace_put_done);
94033e839a4165 David Howells 2024-09-25  168  				if (subreq == to)
94033e839a4165 David Howells 2024-09-25  169  					break;
94033e839a4165 David Howells 2024-09-25  170  			}
94033e839a4165 David Howells 2024-09-25  171  			continue;
94033e839a4165 David Howells 2024-09-25  172  		}
94033e839a4165 David Howells 2024-09-25  173  
94033e839a4165 David Howells 2024-09-25  174  		/* We ran out of subrequests, so we need to allocate some more
94033e839a4165 David Howells 2024-09-25  175  		 * and insert them after.
94033e839a4165 David Howells 2024-09-25  176  		 */
94033e839a4165 David Howells 2024-09-25  177  		do {
94033e839a4165 David Howells 2024-09-25  178  			subreq = netfs_alloc_subrequest(rreq);
94033e839a4165 David Howells 2024-09-25  179  			if (!subreq) {
94033e839a4165 David Howells 2024-09-25  180  				subreq = to;
94033e839a4165 David Howells 2024-09-25  181  				goto abandon_after;
ee4cdf7ba857a8 David Howells 2024-07-02  182  			}
94033e839a4165 David Howells 2024-09-25  183  			subreq->source		= NETFS_DOWNLOAD_FROM_SERVER;
94033e839a4165 David Howells 2024-09-25  184  			subreq->start		= start;
94033e839a4165 David Howells 2024-09-25  185  			subreq->len		= len;
94033e839a4165 David Howells 2024-09-25  186  			subreq->debug_index	= atomic_inc_return(&rreq->subreq_counter);
94033e839a4165 David Howells 2024-09-25  187  			subreq->stream_nr	= stream->stream_nr;
94033e839a4165 David Howells 2024-09-25  188  			__set_bit(NETFS_SREQ_RETRYING, &subreq->flags);
94033e839a4165 David Howells 2024-09-25  189  
94033e839a4165 David Howells 2024-09-25  190  			trace_netfs_sreq_ref(rreq->debug_id, subreq->debug_index,
94033e839a4165 David Howells 2024-09-25  191  					     refcount_read(&subreq->ref),
94033e839a4165 David Howells 2024-09-25  192  					     netfs_sreq_trace_new);
94033e839a4165 David Howells 2024-09-25  193  			netfs_get_subrequest(subreq, netfs_sreq_trace_get_resubmit);
94033e839a4165 David Howells 2024-09-25  194  
94033e839a4165 David Howells 2024-09-25  195  			list_add(&subreq->rreq_link, &to->rreq_link);
94033e839a4165 David Howells 2024-09-25  196  			to = list_next_entry(to, rreq_link);
94033e839a4165 David Howells 2024-09-25  197  			trace_netfs_sreq(subreq, netfs_sreq_trace_retry);
94033e839a4165 David Howells 2024-09-25  198  
94033e839a4165 David Howells 2024-09-25  199  			stream->sreq_max_len	= umin(len, rreq->rsize);
94033e839a4165 David Howells 2024-09-25  200  			stream->sreq_max_segs	= 0;
94033e839a4165 David Howells 2024-09-25  201  			if (unlikely(stream->sreq_max_segs))
94033e839a4165 David Howells 2024-09-25  202  				part = netfs_limit_iter(&source, 0, part, stream->sreq_max_segs);
94033e839a4165 David Howells 2024-09-25  203  
94033e839a4165 David Howells 2024-09-25  204  			netfs_stat(&netfs_n_rh_download);
94033e839a4165 David Howells 2024-09-25  205  			if (rreq->netfs_ops->prepare_read(subreq) < 0) {
94033e839a4165 David Howells 2024-09-25  206  				trace_netfs_sreq(subreq, netfs_sreq_trace_reprep_failed);
94033e839a4165 David Howells 2024-09-25  207  				__set_bit(NETFS_SREQ_FAILED, &subreq->flags);
94033e839a4165 David Howells 2024-09-25  208  				goto abandon;
94033e839a4165 David Howells 2024-09-25  209  			}
94033e839a4165 David Howells 2024-09-25  210  
94033e839a4165 David Howells 2024-09-25  211  			part = umin(len, stream->sreq_max_len);
94033e839a4165 David Howells 2024-09-25  212  			subreq->len = subreq->transferred + part;
94033e839a4165 David Howells 2024-09-25  213  			subreq->io_iter = source;
94033e839a4165 David Howells 2024-09-25  214  			iov_iter_truncate(&subreq->io_iter, part);
94033e839a4165 David Howells 2024-09-25  215  			iov_iter_advance(&source, part);
ee4cdf7ba857a8 David Howells 2024-07-02  216  
94033e839a4165 David Howells 2024-09-25  217  			len -= part;
94033e839a4165 David Howells 2024-09-25  218  			start += part;
94033e839a4165 David Howells 2024-09-25  219  			if (!len && boundary) {
94033e839a4165 David Howells 2024-09-25  220  				__set_bit(NETFS_SREQ_BOUNDARY, &to->flags);
94033e839a4165 David Howells 2024-09-25  221  				boundary = false;
94033e839a4165 David Howells 2024-09-25  222  			}
94033e839a4165 David Howells 2024-09-25  223  
94033e839a4165 David Howells 2024-09-25  224  			netfs_reissue_read(rreq, subreq);
94033e839a4165 David Howells 2024-09-25  225  		} while (len);
94033e839a4165 David Howells 2024-09-25  226  
94033e839a4165 David Howells 2024-09-25  227  	} while (!list_is_head(next, &stream->subrequests));
ee4cdf7ba857a8 David Howells 2024-07-02  228  
ee4cdf7ba857a8 David Howells 2024-07-02  229  	return;
ee4cdf7ba857a8 David Howells 2024-07-02  230  
94033e839a4165 David Howells 2024-09-25  231  	/* If we hit an error, fail all remaining incomplete subrequests */
94033e839a4165 David Howells 2024-09-25  232  abandon_after:
94033e839a4165 David Howells 2024-09-25  233  	if (list_is_last(&subreq->rreq_link, &stream->subrequests))
94033e839a4165 David Howells 2024-09-25  234  		return;
94033e839a4165 David Howells 2024-09-25  235  	subreq = list_next_entry(subreq, rreq_link);
ee4cdf7ba857a8 David Howells 2024-07-02  236  abandon:
94033e839a4165 David Howells 2024-09-25  237  	list_for_each_entry_from(subreq, &stream->subrequests, rreq_link) {
94033e839a4165 David Howells 2024-09-25  238  		if (!subreq->error &&
94033e839a4165 David Howells 2024-09-25  239  		    !test_bit(NETFS_SREQ_FAILED, &subreq->flags) &&
94033e839a4165 David Howells 2024-09-25  240  		    !test_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags))
94033e839a4165 David Howells 2024-09-25  241  			continue;
ee4cdf7ba857a8 David Howells 2024-07-02  242  		subreq->error = -ENOMEM;
94033e839a4165 David Howells 2024-09-25  243  		__set_bit(NETFS_SREQ_FAILED, &subreq->flags);
ee4cdf7ba857a8 David Howells 2024-07-02  244  		__clear_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags);
ee4cdf7ba857a8 David Howells 2024-07-02  245  		__clear_bit(NETFS_SREQ_RETRYING, &subreq->flags);
ee4cdf7ba857a8 David Howells 2024-07-02  246  	}
ee4cdf7ba857a8 David Howells 2024-07-02  247  }
ee4cdf7ba857a8 David Howells 2024-07-02  248  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
