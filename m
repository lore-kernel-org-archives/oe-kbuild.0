Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7993224
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Sep 2024 13:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725800476; cv=none; b=h3K/reErVBR633SODI9rn1kYRDhcUEtQtDlEvdCw7V8txVuX3ETmelyaDyADRpDji3S9Rpt82YB4cyFrxWMcaM41Qg5F/Tnz293tpGPV3DPj8UDku5wPFJfzGsJbOM4/fx+XteribyBq20MAd36kt37NYe3d05tOlhf9Dh2PwTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725800476; c=relaxed/simple;
	bh=DHh39SB4P4zVOXkAggLg5mBy8Ak0WXNt3E98gb0wN7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XIN8xJxtgjyF9sbUOvZzUlk8CRqrHSx41HrK3gzYzWjIV0aGCSRv3bhSfkXEXExyKDSV7yQ8HsXSc7wLUDuvAdZTyheBzTJA5p08O7F1e41O82ND7NCxxZnzuwmTGuFvICGOYgYu8tMAMFJt1yLVn/ObcxBf6FMz08YtlSlw42s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M7QyofFG; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M7QyofFG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725800474; x=1757336474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DHh39SB4P4zVOXkAggLg5mBy8Ak0WXNt3E98gb0wN7U=;
  b=M7QyofFGYHOHS/Z1aRMweJWzeIaJ9Dzd4WKl7RM3JNlKOJacvi7TgTb2
   jwGmGzq7cwF+GedhBh0NqC83jFYk+Txq66pbmtsjhlQ06Z0f8DdlMVdU4
   Al2rNQGDI6SBcLYwDgoJuJPhcN6xQDexs2/4d+il/n8blLprt2D39PF9d
   6mFrptM882zUtXYZvb0/+46Wk5lalUefytKXWk6GQYILcdTsZmoL1UErB
   iYFJqyA7SLZ4dfZwT5WwCMdRt00opN/4N4TG1Bf5WIoffBGn7G5jmRR+R
   iqXVLCthbSX6SfK+gY6r69pEq0hnl8SL6GOnyTl0emKpAwS4aGvqtZtqC
   g==;
X-CSE-ConnectionGUID: dR7JQ6/hQhWnllvInFuaWQ==
X-CSE-MsgGUID: S4oRWD0TRP+TFz6+RyD4uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24608762"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="24608762"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 06:01:14 -0700
X-CSE-ConnectionGUID: ZNQ6YTTtQ1qzrtji5oiYAg==
X-CSE-MsgGUID: LDY2whZhS8ezr5flew7qwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="70811991"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Sep 2024 06:01:11 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snHXR-000DXr-1L;
	Sun, 08 Sep 2024 13:01:09 +0000
Date: Sun, 8 Sep 2024 21:00:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [dhowells-fs:netfs-crypt 2/18] fs/netfs/write_retry.c:123:7-13:
 ERROR: invalid reference to the index variable of the iterator on line 94
Message-ID: <202409082016.ZTJ0WuuA-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   0aa4edddaeafa38a7c5ddbf495430d81a5693614
commit: bf8142f6d3824d9313888fc47faa28cc16944eae [2/18] netfs: Split retry code out of fs/netfs/write_collect.c
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-r063-20240908 (https://download.01.org/0day-ci/archive/20240908/202409082016.ZTJ0WuuA-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202409082016.ZTJ0WuuA-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/netfs/write_retry.c:123:7-13: ERROR: invalid reference to the index variable of the iterator on line 94

vim +123 fs/netfs/write_retry.c

bf8142f6d3824d David Howells 2024-07-31   13  
bf8142f6d3824d David Howells 2024-07-31   14  /*
bf8142f6d3824d David Howells 2024-07-31   15   * Perform retries on the streams that need it.
bf8142f6d3824d David Howells 2024-07-31   16   */
bf8142f6d3824d David Howells 2024-07-31   17  static void netfs_retry_write_stream(struct netfs_io_request *wreq,
bf8142f6d3824d David Howells 2024-07-31   18  				     struct netfs_io_stream *stream)
bf8142f6d3824d David Howells 2024-07-31   19  {
bf8142f6d3824d David Howells 2024-07-31   20  	struct list_head *next;
bf8142f6d3824d David Howells 2024-07-31   21  
bf8142f6d3824d David Howells 2024-07-31   22  	_enter("R=%x[%x:]", wreq->debug_id, stream->stream_nr);
bf8142f6d3824d David Howells 2024-07-31   23  
bf8142f6d3824d David Howells 2024-07-31   24  	if (list_empty(&stream->subrequests))
bf8142f6d3824d David Howells 2024-07-31   25  		return;
bf8142f6d3824d David Howells 2024-07-31   26  
bf8142f6d3824d David Howells 2024-07-31   27  	if (stream->source == NETFS_UPLOAD_TO_SERVER &&
bf8142f6d3824d David Howells 2024-07-31   28  	    wreq->netfs_ops->retry_request)
bf8142f6d3824d David Howells 2024-07-31   29  		wreq->netfs_ops->retry_request(wreq, stream);
bf8142f6d3824d David Howells 2024-07-31   30  
bf8142f6d3824d David Howells 2024-07-31   31  	if (unlikely(stream->failed))
bf8142f6d3824d David Howells 2024-07-31   32  		return;
bf8142f6d3824d David Howells 2024-07-31   33  
bf8142f6d3824d David Howells 2024-07-31   34  	/* If there's no renegotiation to do, just resend each failed subreq. */
bf8142f6d3824d David Howells 2024-07-31   35  	if (!stream->prepare_write) {
bf8142f6d3824d David Howells 2024-07-31   36  		struct netfs_io_subrequest *subreq;
bf8142f6d3824d David Howells 2024-07-31   37  
bf8142f6d3824d David Howells 2024-07-31   38  		list_for_each_entry(subreq, &stream->subrequests, rreq_link) {
bf8142f6d3824d David Howells 2024-07-31   39  			if (test_bit(NETFS_SREQ_FAILED, &subreq->flags))
bf8142f6d3824d David Howells 2024-07-31   40  				break;
bf8142f6d3824d David Howells 2024-07-31   41  			if (__test_and_clear_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags)) {
bf8142f6d3824d David Howells 2024-07-31   42  				struct iov_iter source = subreq->io_iter;
bf8142f6d3824d David Howells 2024-07-31   43  
bf8142f6d3824d David Howells 2024-07-31   44  				iov_iter_revert(&source, subreq->len - source.count);
bf8142f6d3824d David Howells 2024-07-31   45  				__set_bit(NETFS_SREQ_RETRYING, &subreq->flags);
bf8142f6d3824d David Howells 2024-07-31   46  				netfs_get_subrequest(subreq, netfs_sreq_trace_get_resubmit);
bf8142f6d3824d David Howells 2024-07-31   47  				netfs_reissue_write(stream, subreq, &source);
bf8142f6d3824d David Howells 2024-07-31   48  			}
bf8142f6d3824d David Howells 2024-07-31   49  		}
bf8142f6d3824d David Howells 2024-07-31   50  		return;
bf8142f6d3824d David Howells 2024-07-31   51  	}
bf8142f6d3824d David Howells 2024-07-31   52  
bf8142f6d3824d David Howells 2024-07-31   53  	next = stream->subrequests.next;
bf8142f6d3824d David Howells 2024-07-31   54  
bf8142f6d3824d David Howells 2024-07-31   55  	do {
bf8142f6d3824d David Howells 2024-07-31   56  		struct netfs_io_subrequest *subreq = NULL, *from, *to, *tmp;
bf8142f6d3824d David Howells 2024-07-31   57  		struct iov_iter source;
bf8142f6d3824d David Howells 2024-07-31   58  		unsigned long long start, len;
bf8142f6d3824d David Howells 2024-07-31   59  		size_t part;
bf8142f6d3824d David Howells 2024-07-31   60  		bool boundary = false;
bf8142f6d3824d David Howells 2024-07-31   61  
bf8142f6d3824d David Howells 2024-07-31   62  		/* Go through the stream and find the next span of contiguous
bf8142f6d3824d David Howells 2024-07-31   63  		 * data that we then rejig (cifs, for example, needs the wsize
bf8142f6d3824d David Howells 2024-07-31   64  		 * renegotiating) and reissue.
bf8142f6d3824d David Howells 2024-07-31   65  		 */
bf8142f6d3824d David Howells 2024-07-31   66  		from = list_entry(next, struct netfs_io_subrequest, rreq_link);
bf8142f6d3824d David Howells 2024-07-31   67  		to = from;
bf8142f6d3824d David Howells 2024-07-31   68  		start = from->start + from->transferred;
bf8142f6d3824d David Howells 2024-07-31   69  		len   = from->len   - from->transferred;
bf8142f6d3824d David Howells 2024-07-31   70  
bf8142f6d3824d David Howells 2024-07-31   71  		if (test_bit(NETFS_SREQ_FAILED, &from->flags) ||
bf8142f6d3824d David Howells 2024-07-31   72  		    !test_bit(NETFS_SREQ_NEED_RETRY, &from->flags))
bf8142f6d3824d David Howells 2024-07-31   73  			return;
bf8142f6d3824d David Howells 2024-07-31   74  
bf8142f6d3824d David Howells 2024-07-31   75  		list_for_each_continue(next, &stream->subrequests) {
bf8142f6d3824d David Howells 2024-07-31   76  			subreq = list_entry(next, struct netfs_io_subrequest, rreq_link);
bf8142f6d3824d David Howells 2024-07-31   77  			if (subreq->start + subreq->transferred != start + len ||
bf8142f6d3824d David Howells 2024-07-31   78  			    test_bit(NETFS_SREQ_BOUNDARY, &subreq->flags) ||
bf8142f6d3824d David Howells 2024-07-31   79  			    !test_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags))
bf8142f6d3824d David Howells 2024-07-31   80  				break;
bf8142f6d3824d David Howells 2024-07-31   81  			to = subreq;
bf8142f6d3824d David Howells 2024-07-31   82  			len += to->len;
bf8142f6d3824d David Howells 2024-07-31   83  		}
bf8142f6d3824d David Howells 2024-07-31   84  
bf8142f6d3824d David Howells 2024-07-31   85  		/* Determine the set of buffers we're going to use.  Each
bf8142f6d3824d David Howells 2024-07-31   86  		 * subreq gets a subset of a single overall contiguous buffer.
bf8142f6d3824d David Howells 2024-07-31   87  		 */
bf8142f6d3824d David Howells 2024-07-31   88  		netfs_reset_iter(from);
bf8142f6d3824d David Howells 2024-07-31   89  		source = from->io_iter;
bf8142f6d3824d David Howells 2024-07-31   90  		source.count = len;
bf8142f6d3824d David Howells 2024-07-31   91  
bf8142f6d3824d David Howells 2024-07-31   92  		/* Work through the sublist. */
bf8142f6d3824d David Howells 2024-07-31   93  		subreq = from;
bf8142f6d3824d David Howells 2024-07-31  @94  		list_for_each_entry_from(subreq, &stream->subrequests, rreq_link) {
bf8142f6d3824d David Howells 2024-07-31   95  			if (!len)
bf8142f6d3824d David Howells 2024-07-31   96  				break;
bf8142f6d3824d David Howells 2024-07-31   97  			/* Renegotiate max_len (wsize) */
bf8142f6d3824d David Howells 2024-07-31   98  			trace_netfs_sreq(subreq, netfs_sreq_trace_retry);
bf8142f6d3824d David Howells 2024-07-31   99  			__clear_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags);
bf8142f6d3824d David Howells 2024-07-31  100  			__set_bit(NETFS_SREQ_RETRYING, &subreq->flags);
bf8142f6d3824d David Howells 2024-07-31  101  			stream->prepare_write(subreq);
bf8142f6d3824d David Howells 2024-07-31  102  
bf8142f6d3824d David Howells 2024-07-31  103  			part = min(len, stream->sreq_max_len);
bf8142f6d3824d David Howells 2024-07-31  104  			subreq->len = part;
bf8142f6d3824d David Howells 2024-07-31  105  			subreq->start = start;
bf8142f6d3824d David Howells 2024-07-31  106  			subreq->transferred = 0;
bf8142f6d3824d David Howells 2024-07-31  107  			len -= part;
bf8142f6d3824d David Howells 2024-07-31  108  			start += part;
bf8142f6d3824d David Howells 2024-07-31  109  			if (len && subreq == to &&
bf8142f6d3824d David Howells 2024-07-31  110  			    __test_and_clear_bit(NETFS_SREQ_BOUNDARY, &to->flags))
bf8142f6d3824d David Howells 2024-07-31  111  				boundary = true;
bf8142f6d3824d David Howells 2024-07-31  112  
bf8142f6d3824d David Howells 2024-07-31  113  			netfs_get_subrequest(subreq, netfs_sreq_trace_get_resubmit);
bf8142f6d3824d David Howells 2024-07-31  114  			netfs_reissue_write(stream, subreq, &source);
bf8142f6d3824d David Howells 2024-07-31  115  			if (subreq == to)
bf8142f6d3824d David Howells 2024-07-31  116  				break;
bf8142f6d3824d David Howells 2024-07-31  117  		}
bf8142f6d3824d David Howells 2024-07-31  118  
bf8142f6d3824d David Howells 2024-07-31  119  		/* If we managed to use fewer subreqs, we can discard the
bf8142f6d3824d David Howells 2024-07-31  120  		 * excess; if we used the same number, then we're done.
bf8142f6d3824d David Howells 2024-07-31  121  		 */
bf8142f6d3824d David Howells 2024-07-31  122  		if (!len) {
bf8142f6d3824d David Howells 2024-07-31 @123  			if (subreq == to)
bf8142f6d3824d David Howells 2024-07-31  124  				continue;
bf8142f6d3824d David Howells 2024-07-31  125  			list_for_each_entry_safe_from(subreq, tmp,
bf8142f6d3824d David Howells 2024-07-31  126  						      &stream->subrequests, rreq_link) {
bf8142f6d3824d David Howells 2024-07-31  127  				trace_netfs_sreq(subreq, netfs_sreq_trace_discard);
bf8142f6d3824d David Howells 2024-07-31  128  				list_del(&subreq->rreq_link);
bf8142f6d3824d David Howells 2024-07-31  129  				netfs_put_subrequest(subreq, false, netfs_sreq_trace_put_done);
bf8142f6d3824d David Howells 2024-07-31  130  				if (subreq == to)
bf8142f6d3824d David Howells 2024-07-31  131  					break;
bf8142f6d3824d David Howells 2024-07-31  132  			}
bf8142f6d3824d David Howells 2024-07-31  133  			continue;
bf8142f6d3824d David Howells 2024-07-31  134  		}
bf8142f6d3824d David Howells 2024-07-31  135  
bf8142f6d3824d David Howells 2024-07-31  136  		/* We ran out of subrequests, so we need to allocate some more
bf8142f6d3824d David Howells 2024-07-31  137  		 * and insert them after.
bf8142f6d3824d David Howells 2024-07-31  138  		 */
bf8142f6d3824d David Howells 2024-07-31  139  		do {
bf8142f6d3824d David Howells 2024-07-31  140  			subreq = netfs_alloc_subrequest(wreq);
bf8142f6d3824d David Howells 2024-07-31  141  			subreq->source		= to->source;
bf8142f6d3824d David Howells 2024-07-31  142  			subreq->start		= start;
bf8142f6d3824d David Howells 2024-07-31  143  			subreq->debug_index	= atomic_inc_return(&wreq->subreq_counter);
bf8142f6d3824d David Howells 2024-07-31  144  			subreq->stream_nr	= to->stream_nr;
bf8142f6d3824d David Howells 2024-07-31  145  			__set_bit(NETFS_SREQ_RETRYING, &subreq->flags);
bf8142f6d3824d David Howells 2024-07-31  146  
bf8142f6d3824d David Howells 2024-07-31  147  			trace_netfs_sreq_ref(wreq->debug_id, subreq->debug_index,
bf8142f6d3824d David Howells 2024-07-31  148  					     refcount_read(&subreq->ref),
bf8142f6d3824d David Howells 2024-07-31  149  					     netfs_sreq_trace_new);
bf8142f6d3824d David Howells 2024-07-31  150  			netfs_get_subrequest(subreq, netfs_sreq_trace_get_resubmit);
bf8142f6d3824d David Howells 2024-07-31  151  
bf8142f6d3824d David Howells 2024-07-31  152  			list_add(&subreq->rreq_link, &to->rreq_link);
bf8142f6d3824d David Howells 2024-07-31  153  			to = list_next_entry(to, rreq_link);
bf8142f6d3824d David Howells 2024-07-31  154  			trace_netfs_sreq(subreq, netfs_sreq_trace_retry);
bf8142f6d3824d David Howells 2024-07-31  155  
bf8142f6d3824d David Howells 2024-07-31  156  			stream->sreq_max_len	= len;
bf8142f6d3824d David Howells 2024-07-31  157  			stream->sreq_max_segs	= INT_MAX;
bf8142f6d3824d David Howells 2024-07-31  158  			switch (stream->source) {
bf8142f6d3824d David Howells 2024-07-31  159  			case NETFS_UPLOAD_TO_SERVER:
bf8142f6d3824d David Howells 2024-07-31  160  				netfs_stat(&netfs_n_wh_upload);
bf8142f6d3824d David Howells 2024-07-31  161  				stream->sreq_max_len = umin(len, wreq->wsize);
bf8142f6d3824d David Howells 2024-07-31  162  				break;
bf8142f6d3824d David Howells 2024-07-31  163  			case NETFS_WRITE_TO_CACHE:
bf8142f6d3824d David Howells 2024-07-31  164  				netfs_stat(&netfs_n_wh_write);
bf8142f6d3824d David Howells 2024-07-31  165  				break;
bf8142f6d3824d David Howells 2024-07-31  166  			default:
bf8142f6d3824d David Howells 2024-07-31  167  				WARN_ON_ONCE(1);
bf8142f6d3824d David Howells 2024-07-31  168  			}
bf8142f6d3824d David Howells 2024-07-31  169  
bf8142f6d3824d David Howells 2024-07-31  170  			stream->prepare_write(subreq);
bf8142f6d3824d David Howells 2024-07-31  171  
bf8142f6d3824d David Howells 2024-07-31  172  			part = umin(len, stream->sreq_max_len);
bf8142f6d3824d David Howells 2024-07-31  173  			subreq->len = subreq->transferred + part;
bf8142f6d3824d David Howells 2024-07-31  174  			len -= part;
bf8142f6d3824d David Howells 2024-07-31  175  			start += part;
bf8142f6d3824d David Howells 2024-07-31  176  			if (!len && boundary) {
bf8142f6d3824d David Howells 2024-07-31  177  				__set_bit(NETFS_SREQ_BOUNDARY, &to->flags);
bf8142f6d3824d David Howells 2024-07-31  178  				boundary = false;
bf8142f6d3824d David Howells 2024-07-31  179  			}
bf8142f6d3824d David Howells 2024-07-31  180  
bf8142f6d3824d David Howells 2024-07-31  181  			netfs_reissue_write(stream, subreq, &source);
bf8142f6d3824d David Howells 2024-07-31  182  			if (!len)
bf8142f6d3824d David Howells 2024-07-31  183  				break;
bf8142f6d3824d David Howells 2024-07-31  184  
bf8142f6d3824d David Howells 2024-07-31  185  		} while (len);
bf8142f6d3824d David Howells 2024-07-31  186  
bf8142f6d3824d David Howells 2024-07-31  187  	} while (!list_is_head(next, &stream->subrequests));
bf8142f6d3824d David Howells 2024-07-31  188  }
bf8142f6d3824d David Howells 2024-07-31  189  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
