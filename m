Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CF31AA783
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 20:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732999841; cv=none; b=k2YT4JrABdgUrAMmMaHbvUweLsv0w5D9b4l2PUqAhimZ1Gtgz67UmufO/d1kzX88FSkepUEduws1BdJ/S9bdHr5jHjqKGkp8p4XxEKRiei+H0H3/QDtVmTh1DZ2hovSkmtGudU7SXxRtrNwL1pofOJbRusLektjxZxtFnDmqsbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732999841; c=relaxed/simple;
	bh=FbvllDMhfCtIixRmC+dmi8n7MBCW59nZ837Go/4Fpjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kGsFPpJ+Oq/wb90aJKE5MTBDoYtzEJT7QJDJCHd3oD7yLd1EKngsgjF6UA5ikCj/Degf2LeIOoWWlkPAXFl7P5Y2Dk66qhDmI5eTYHVpb0HA/BAYUMo7TEFoOvzmmzg80anf79Zxdvg99Ty+B7w9SEYS8myI2AkVKXCShDDpJkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V5R5/V/C; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V5R5/V/C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732999839; x=1764535839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FbvllDMhfCtIixRmC+dmi8n7MBCW59nZ837Go/4Fpjc=;
  b=V5R5/V/CIUbv7qi++Ur5eFK2VEKJMobRI5jFrRAv8kPl0ksi8WhduxyD
   nZDKqsaGmvfG0GJn/+q5fGeXlEYnQjlA03mUl/hQIkI2uHptKXVLf/XUt
   XmiHrpBzyG1XuW2t5IsM0CZlqcJZ6RY1eAkUeWXvsq8LXjheyZVm9mmiy
   WImnxqU6Mi/HGfYYFmJdU8u0/GoNTMRF8uTpUN95+O+D2I0vp7yTmXt7V
   l9h20IAxG9wuavLfFi79WqzE9J05smTFlQgUd70gzZAWukgSeGc3W3tK3
   //eHAFsy3BoihorDm7JuBZVj8V1r8xZXw5HJvNmW0Ywd05H2byKT1+euo
   g==;
X-CSE-ConnectionGUID: DCJhw5VbTqSJEodm6gxv0Q==
X-CSE-MsgGUID: ZxK3okUuQ2OE1T2NvsAqvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="44566290"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="44566290"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 12:50:38 -0800
X-CSE-ConnectionGUID: kH8IvGpoRTmHVDKaoPgZUA==
X-CSE-MsgGUID: c7+hrin/Tz2z7ZLI4Cr04g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="97160813"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 30 Nov 2024 12:50:35 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHUPu-0000yB-0J;
	Sat, 30 Nov 2024 20:50:19 +0000
Date: Sun, 1 Dec 2024 04:49:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [dhowells-fs:netfs-writeback 11/36] fs/netfs/write_retry.c:123:7-13:
 ERROR: invalid reference to the index variable of the iterator on line 94
Message-ID: <202412010618.9EHsdOmP-lkp@intel.com>
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
commit: e0845a13ed327c18dab77f614ace6b453c99767f [11/36] netfs: Split retry code out of fs/netfs/write_collect.c
:::::: branch date: 31 hours ago
:::::: commit date: 12 days ago
config: openrisc-randconfig-r061-20241130 (https://download.01.org/0day-ci/archive/20241201/202412010618.9EHsdOmP-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412010618.9EHsdOmP-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/netfs/write_retry.c:123:7-13: ERROR: invalid reference to the index variable of the iterator on line 94

vim +123 fs/netfs/write_retry.c

e0845a13ed327c David Howells 2024-07-31   13  
e0845a13ed327c David Howells 2024-07-31   14  /*
e0845a13ed327c David Howells 2024-07-31   15   * Perform retries on the streams that need it.
e0845a13ed327c David Howells 2024-07-31   16   */
e0845a13ed327c David Howells 2024-07-31   17  static void netfs_retry_write_stream(struct netfs_io_request *wreq,
e0845a13ed327c David Howells 2024-07-31   18  				     struct netfs_io_stream *stream)
e0845a13ed327c David Howells 2024-07-31   19  {
e0845a13ed327c David Howells 2024-07-31   20  	struct list_head *next;
e0845a13ed327c David Howells 2024-07-31   21  
e0845a13ed327c David Howells 2024-07-31   22  	_enter("R=%x[%x:]", wreq->debug_id, stream->stream_nr);
e0845a13ed327c David Howells 2024-07-31   23  
e0845a13ed327c David Howells 2024-07-31   24  	if (list_empty(&stream->subrequests))
e0845a13ed327c David Howells 2024-07-31   25  		return;
e0845a13ed327c David Howells 2024-07-31   26  
e0845a13ed327c David Howells 2024-07-31   27  	if (stream->source == NETFS_UPLOAD_TO_SERVER &&
e0845a13ed327c David Howells 2024-07-31   28  	    wreq->netfs_ops->retry_request)
e0845a13ed327c David Howells 2024-07-31   29  		wreq->netfs_ops->retry_request(wreq, stream);
e0845a13ed327c David Howells 2024-07-31   30  
e0845a13ed327c David Howells 2024-07-31   31  	if (unlikely(stream->failed))
e0845a13ed327c David Howells 2024-07-31   32  		return;
e0845a13ed327c David Howells 2024-07-31   33  
e0845a13ed327c David Howells 2024-07-31   34  	/* If there's no renegotiation to do, just resend each failed subreq. */
e0845a13ed327c David Howells 2024-07-31   35  	if (!stream->prepare_write) {
e0845a13ed327c David Howells 2024-07-31   36  		struct netfs_io_subrequest *subreq;
e0845a13ed327c David Howells 2024-07-31   37  
e0845a13ed327c David Howells 2024-07-31   38  		list_for_each_entry(subreq, &stream->subrequests, rreq_link) {
e0845a13ed327c David Howells 2024-07-31   39  			if (test_bit(NETFS_SREQ_FAILED, &subreq->flags))
e0845a13ed327c David Howells 2024-07-31   40  				break;
e0845a13ed327c David Howells 2024-07-31   41  			if (__test_and_clear_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags)) {
e0845a13ed327c David Howells 2024-07-31   42  				struct iov_iter source = subreq->io_iter;
e0845a13ed327c David Howells 2024-07-31   43  
e0845a13ed327c David Howells 2024-07-31   44  				iov_iter_revert(&source, subreq->len - source.count);
e0845a13ed327c David Howells 2024-07-31   45  				__set_bit(NETFS_SREQ_RETRYING, &subreq->flags);
e0845a13ed327c David Howells 2024-07-31   46  				netfs_get_subrequest(subreq, netfs_sreq_trace_get_resubmit);
e0845a13ed327c David Howells 2024-07-31   47  				netfs_reissue_write(stream, subreq, &source);
e0845a13ed327c David Howells 2024-07-31   48  			}
e0845a13ed327c David Howells 2024-07-31   49  		}
e0845a13ed327c David Howells 2024-07-31   50  		return;
e0845a13ed327c David Howells 2024-07-31   51  	}
e0845a13ed327c David Howells 2024-07-31   52  
e0845a13ed327c David Howells 2024-07-31   53  	next = stream->subrequests.next;
e0845a13ed327c David Howells 2024-07-31   54  
e0845a13ed327c David Howells 2024-07-31   55  	do {
e0845a13ed327c David Howells 2024-07-31   56  		struct netfs_io_subrequest *subreq = NULL, *from, *to, *tmp;
e0845a13ed327c David Howells 2024-07-31   57  		struct iov_iter source;
e0845a13ed327c David Howells 2024-07-31   58  		unsigned long long start, len;
e0845a13ed327c David Howells 2024-07-31   59  		size_t part;
e0845a13ed327c David Howells 2024-07-31   60  		bool boundary = false;
e0845a13ed327c David Howells 2024-07-31   61  
e0845a13ed327c David Howells 2024-07-31   62  		/* Go through the stream and find the next span of contiguous
e0845a13ed327c David Howells 2024-07-31   63  		 * data that we then rejig (cifs, for example, needs the wsize
e0845a13ed327c David Howells 2024-07-31   64  		 * renegotiating) and reissue.
e0845a13ed327c David Howells 2024-07-31   65  		 */
e0845a13ed327c David Howells 2024-07-31   66  		from = list_entry(next, struct netfs_io_subrequest, rreq_link);
e0845a13ed327c David Howells 2024-07-31   67  		to = from;
e0845a13ed327c David Howells 2024-07-31   68  		start = from->start + from->transferred;
e0845a13ed327c David Howells 2024-07-31   69  		len   = from->len   - from->transferred;
e0845a13ed327c David Howells 2024-07-31   70  
e0845a13ed327c David Howells 2024-07-31   71  		if (test_bit(NETFS_SREQ_FAILED, &from->flags) ||
e0845a13ed327c David Howells 2024-07-31   72  		    !test_bit(NETFS_SREQ_NEED_RETRY, &from->flags))
e0845a13ed327c David Howells 2024-07-31   73  			return;
e0845a13ed327c David Howells 2024-07-31   74  
e0845a13ed327c David Howells 2024-07-31   75  		list_for_each_continue(next, &stream->subrequests) {
e0845a13ed327c David Howells 2024-07-31   76  			subreq = list_entry(next, struct netfs_io_subrequest, rreq_link);
e0845a13ed327c David Howells 2024-07-31   77  			if (subreq->start + subreq->transferred != start + len ||
e0845a13ed327c David Howells 2024-07-31   78  			    test_bit(NETFS_SREQ_BOUNDARY, &subreq->flags) ||
e0845a13ed327c David Howells 2024-07-31   79  			    !test_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags))
e0845a13ed327c David Howells 2024-07-31   80  				break;
e0845a13ed327c David Howells 2024-07-31   81  			to = subreq;
e0845a13ed327c David Howells 2024-07-31   82  			len += to->len;
e0845a13ed327c David Howells 2024-07-31   83  		}
e0845a13ed327c David Howells 2024-07-31   84  
e0845a13ed327c David Howells 2024-07-31   85  		/* Determine the set of buffers we're going to use.  Each
e0845a13ed327c David Howells 2024-07-31   86  		 * subreq gets a subset of a single overall contiguous buffer.
e0845a13ed327c David Howells 2024-07-31   87  		 */
e0845a13ed327c David Howells 2024-07-31   88  		netfs_reset_iter(from);
e0845a13ed327c David Howells 2024-07-31   89  		source = from->io_iter;
e0845a13ed327c David Howells 2024-07-31   90  		source.count = len;
e0845a13ed327c David Howells 2024-07-31   91  
e0845a13ed327c David Howells 2024-07-31   92  		/* Work through the sublist. */
e0845a13ed327c David Howells 2024-07-31   93  		subreq = from;
e0845a13ed327c David Howells 2024-07-31  @94  		list_for_each_entry_from(subreq, &stream->subrequests, rreq_link) {
e0845a13ed327c David Howells 2024-07-31   95  			if (!len)
e0845a13ed327c David Howells 2024-07-31   96  				break;
e0845a13ed327c David Howells 2024-07-31   97  			/* Renegotiate max_len (wsize) */
e0845a13ed327c David Howells 2024-07-31   98  			trace_netfs_sreq(subreq, netfs_sreq_trace_retry);
e0845a13ed327c David Howells 2024-07-31   99  			__clear_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags);
e0845a13ed327c David Howells 2024-07-31  100  			__set_bit(NETFS_SREQ_RETRYING, &subreq->flags);
e0845a13ed327c David Howells 2024-07-31  101  			stream->prepare_write(subreq);
e0845a13ed327c David Howells 2024-07-31  102  
e0845a13ed327c David Howells 2024-07-31  103  			part = min(len, stream->sreq_max_len);
e0845a13ed327c David Howells 2024-07-31  104  			subreq->len = part;
e0845a13ed327c David Howells 2024-07-31  105  			subreq->start = start;
e0845a13ed327c David Howells 2024-07-31  106  			subreq->transferred = 0;
e0845a13ed327c David Howells 2024-07-31  107  			len -= part;
e0845a13ed327c David Howells 2024-07-31  108  			start += part;
e0845a13ed327c David Howells 2024-07-31  109  			if (len && subreq == to &&
e0845a13ed327c David Howells 2024-07-31  110  			    __test_and_clear_bit(NETFS_SREQ_BOUNDARY, &to->flags))
e0845a13ed327c David Howells 2024-07-31  111  				boundary = true;
e0845a13ed327c David Howells 2024-07-31  112  
e0845a13ed327c David Howells 2024-07-31  113  			netfs_get_subrequest(subreq, netfs_sreq_trace_get_resubmit);
e0845a13ed327c David Howells 2024-07-31  114  			netfs_reissue_write(stream, subreq, &source);
e0845a13ed327c David Howells 2024-07-31  115  			if (subreq == to)
e0845a13ed327c David Howells 2024-07-31  116  				break;
e0845a13ed327c David Howells 2024-07-31  117  		}
e0845a13ed327c David Howells 2024-07-31  118  
e0845a13ed327c David Howells 2024-07-31  119  		/* If we managed to use fewer subreqs, we can discard the
e0845a13ed327c David Howells 2024-07-31  120  		 * excess; if we used the same number, then we're done.
e0845a13ed327c David Howells 2024-07-31  121  		 */
e0845a13ed327c David Howells 2024-07-31  122  		if (!len) {
e0845a13ed327c David Howells 2024-07-31 @123  			if (subreq == to)
e0845a13ed327c David Howells 2024-07-31  124  				continue;
e0845a13ed327c David Howells 2024-07-31  125  			list_for_each_entry_safe_from(subreq, tmp,
e0845a13ed327c David Howells 2024-07-31  126  						      &stream->subrequests, rreq_link) {
e0845a13ed327c David Howells 2024-07-31  127  				trace_netfs_sreq(subreq, netfs_sreq_trace_discard);
e0845a13ed327c David Howells 2024-07-31  128  				list_del(&subreq->rreq_link);
e0845a13ed327c David Howells 2024-07-31  129  				netfs_put_subrequest(subreq, false, netfs_sreq_trace_put_done);
e0845a13ed327c David Howells 2024-07-31  130  				if (subreq == to)
e0845a13ed327c David Howells 2024-07-31  131  					break;
e0845a13ed327c David Howells 2024-07-31  132  			}
e0845a13ed327c David Howells 2024-07-31  133  			continue;
e0845a13ed327c David Howells 2024-07-31  134  		}
e0845a13ed327c David Howells 2024-07-31  135  
e0845a13ed327c David Howells 2024-07-31  136  		/* We ran out of subrequests, so we need to allocate some more
e0845a13ed327c David Howells 2024-07-31  137  		 * and insert them after.
e0845a13ed327c David Howells 2024-07-31  138  		 */
e0845a13ed327c David Howells 2024-07-31  139  		do {
e0845a13ed327c David Howells 2024-07-31  140  			subreq = netfs_alloc_subrequest(wreq);
e0845a13ed327c David Howells 2024-07-31  141  			subreq->source		= to->source;
e0845a13ed327c David Howells 2024-07-31  142  			subreq->start		= start;
e0845a13ed327c David Howells 2024-07-31  143  			subreq->debug_index	= atomic_inc_return(&wreq->subreq_counter);
e0845a13ed327c David Howells 2024-07-31  144  			subreq->stream_nr	= to->stream_nr;
e0845a13ed327c David Howells 2024-07-31  145  			__set_bit(NETFS_SREQ_RETRYING, &subreq->flags);
e0845a13ed327c David Howells 2024-07-31  146  
e0845a13ed327c David Howells 2024-07-31  147  			trace_netfs_sreq_ref(wreq->debug_id, subreq->debug_index,
e0845a13ed327c David Howells 2024-07-31  148  					     refcount_read(&subreq->ref),
e0845a13ed327c David Howells 2024-07-31  149  					     netfs_sreq_trace_new);
e0845a13ed327c David Howells 2024-07-31  150  			netfs_get_subrequest(subreq, netfs_sreq_trace_get_resubmit);
e0845a13ed327c David Howells 2024-07-31  151  
e0845a13ed327c David Howells 2024-07-31  152  			list_add(&subreq->rreq_link, &to->rreq_link);
e0845a13ed327c David Howells 2024-07-31  153  			to = list_next_entry(to, rreq_link);
e0845a13ed327c David Howells 2024-07-31  154  			trace_netfs_sreq(subreq, netfs_sreq_trace_retry);
e0845a13ed327c David Howells 2024-07-31  155  
e0845a13ed327c David Howells 2024-07-31  156  			stream->sreq_max_len	= len;
e0845a13ed327c David Howells 2024-07-31  157  			stream->sreq_max_segs	= INT_MAX;
e0845a13ed327c David Howells 2024-07-31  158  			switch (stream->source) {
e0845a13ed327c David Howells 2024-07-31  159  			case NETFS_UPLOAD_TO_SERVER:
e0845a13ed327c David Howells 2024-07-31  160  				netfs_stat(&netfs_n_wh_upload);
e0845a13ed327c David Howells 2024-07-31  161  				stream->sreq_max_len = umin(len, wreq->wsize);
e0845a13ed327c David Howells 2024-07-31  162  				break;
e0845a13ed327c David Howells 2024-07-31  163  			case NETFS_WRITE_TO_CACHE:
e0845a13ed327c David Howells 2024-07-31  164  				netfs_stat(&netfs_n_wh_write);
e0845a13ed327c David Howells 2024-07-31  165  				break;
e0845a13ed327c David Howells 2024-07-31  166  			default:
e0845a13ed327c David Howells 2024-07-31  167  				WARN_ON_ONCE(1);
e0845a13ed327c David Howells 2024-07-31  168  			}
e0845a13ed327c David Howells 2024-07-31  169  
e0845a13ed327c David Howells 2024-07-31  170  			stream->prepare_write(subreq);
e0845a13ed327c David Howells 2024-07-31  171  
e0845a13ed327c David Howells 2024-07-31  172  			part = umin(len, stream->sreq_max_len);
e0845a13ed327c David Howells 2024-07-31  173  			subreq->len = subreq->transferred + part;
e0845a13ed327c David Howells 2024-07-31  174  			len -= part;
e0845a13ed327c David Howells 2024-07-31  175  			start += part;
e0845a13ed327c David Howells 2024-07-31  176  			if (!len && boundary) {
e0845a13ed327c David Howells 2024-07-31  177  				__set_bit(NETFS_SREQ_BOUNDARY, &to->flags);
e0845a13ed327c David Howells 2024-07-31  178  				boundary = false;
e0845a13ed327c David Howells 2024-07-31  179  			}
e0845a13ed327c David Howells 2024-07-31  180  
e0845a13ed327c David Howells 2024-07-31  181  			netfs_reissue_write(stream, subreq, &source);
e0845a13ed327c David Howells 2024-07-31  182  			if (!len)
e0845a13ed327c David Howells 2024-07-31  183  				break;
e0845a13ed327c David Howells 2024-07-31  184  
e0845a13ed327c David Howells 2024-07-31  185  		} while (len);
e0845a13ed327c David Howells 2024-07-31  186  
e0845a13ed327c David Howells 2024-07-31  187  	} while (!list_is_head(next, &stream->subrequests));
e0845a13ed327c David Howells 2024-07-31  188  }
e0845a13ed327c David Howells 2024-07-31  189  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
