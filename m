Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7377913ADC
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Mar 2024 07:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711265253; cv=none; b=P21UxJCoqrD5rRR4a04goq/KC1eXGhKFp1L80RLzhNFNMuLj/ejlikFkySWlTbW/tauCZsTwEx919hPYe/A1+c2t1KFfmqRkqOscUVZstI2RcbF1JlZg2aUlQrVNLXiQz9pirtOlpYByJKlbA+qCs1H8lEy1ni7+LzhePfLi2dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711265253; c=relaxed/simple;
	bh=aOpC9lzYQg4JxXhMIy3V93Uv2kFZLWftSr3IbNiS5mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KRXFATpHjOqkpP110K+DV1VRVRC1nmRH9W3r0glJZKLXdJqpFVIqO/Ff5ubFmApOMsvF3c31Z+jGFwTp+1xjnd97aea7KergG9++JGmo3j9/RBNzGnV1AaEIhzokYqDg+kilElzY0AdaTh+zOFpKOGJB40fks+rm7TsyYYcm78A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uo6yQdtM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uo6yQdtM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711265252; x=1742801252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aOpC9lzYQg4JxXhMIy3V93Uv2kFZLWftSr3IbNiS5mQ=;
  b=Uo6yQdtMwlWn25pOc9jzK5ZOPz+fKAtGkiGW8UVroDeNBRjDPdmDztoW
   kwLyTUJ/eX4ZV/eJwY2QjZdipFaG9x3MjUikrpj02kSdzf6EGRk/uiEkw
   8OcLvvNoOZ7K1jOn7IT103nmrvEGmGIivYYOxFE/qhqHSgv+xmeZV1OiY
   KnRc4KkSHDasYVFn3tNtJhshPDSge/vI00z8KKcamnJ9OzmbOFmbbkKd8
   ZNtv10GbIhSyNfb5UrfbtRiHv4PetOEZX5uU3SmKrw7VBpBxemJRlf8QM
   RxxyLqeMF/+2MlltWlApxuQeEjeYbfTr5+KDPAFzzFwQbOk4agDkRjAhS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="6464820"
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="6464820"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 00:27:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,150,1708416000"; 
   d="scan'208";a="15286369"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Mar 2024 00:27:29 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1roIGM-000Lhz-1y;
	Sun, 24 Mar 2024 07:27:26 +0000
Date: Sun, 24 Mar 2024 15:27:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [dhowells-fs:netfs-writeback 15/22]
 fs/netfs/write_collect.c:254:7-13: ERROR: invalid reference to the index
 variable of the iterator on line 225
Message-ID: <202403241507.oq4guPPM-lkp@intel.com>
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
head:   6d4dafd8301ee8645d4814a7e75a9135acf67613
commit: 9a3702e1d161f5b03a7b42122f9f693af1144fc8 [15/22] netfs: New writeback implementation
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-102-20240324 (https://download.01.org/0day-ci/archive/20240324/202403241507.oq4guPPM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202403241507.oq4guPPM-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/netfs/write_collect.c:254:7-13: ERROR: invalid reference to the index variable of the iterator on line 225

vim +254 fs/netfs/write_collect.c

9a3702e1d161f5 David Howells 2024-03-18  160  
9a3702e1d161f5 David Howells 2024-03-18  161  /*
9a3702e1d161f5 David Howells 2024-03-18  162   * Perform retries on the streams that need it.
9a3702e1d161f5 David Howells 2024-03-18  163   */
9a3702e1d161f5 David Howells 2024-03-18  164  static void netfs_retry_write_stream(struct netfs_io_request *wreq,
9a3702e1d161f5 David Howells 2024-03-18  165  				     struct netfs_io_stream *stream)
9a3702e1d161f5 David Howells 2024-03-18  166  {
9a3702e1d161f5 David Howells 2024-03-18  167  	struct list_head *next;
9a3702e1d161f5 David Howells 2024-03-18  168  
9a3702e1d161f5 David Howells 2024-03-18  169  	_enter("R=%x[%x:]", wreq->debug_id, stream->stream_nr);
9a3702e1d161f5 David Howells 2024-03-18  170  
9a3702e1d161f5 David Howells 2024-03-18  171  	if (unlikely(stream->failed))
9a3702e1d161f5 David Howells 2024-03-18  172  		return;
9a3702e1d161f5 David Howells 2024-03-18  173  
9a3702e1d161f5 David Howells 2024-03-18  174  	/* If there's no renegotiation to do, just resend each failed subreq. */
9a3702e1d161f5 David Howells 2024-03-18  175  	if (!stream->prepare_write) {
9a3702e1d161f5 David Howells 2024-03-18  176  		struct netfs_io_subrequest *subreq;
9a3702e1d161f5 David Howells 2024-03-18  177  
9a3702e1d161f5 David Howells 2024-03-18  178  		list_for_each_entry(subreq, &stream->subrequests, rreq_link) {
9a3702e1d161f5 David Howells 2024-03-18  179  			if (test_bit(NETFS_SREQ_FAILED, &subreq->flags))
9a3702e1d161f5 David Howells 2024-03-18  180  				break;
9a3702e1d161f5 David Howells 2024-03-18  181  			if (__test_and_clear_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags)) {
9a3702e1d161f5 David Howells 2024-03-18  182  				__set_bit(NETFS_SREQ_RETRYING, &subreq->flags);
9a3702e1d161f5 David Howells 2024-03-18  183  				netfs_get_subrequest(subreq, netfs_sreq_trace_get_resubmit);
9a3702e1d161f5 David Howells 2024-03-18  184  				netfs_reissue_write(stream, subreq);
9a3702e1d161f5 David Howells 2024-03-18  185  			}
9a3702e1d161f5 David Howells 2024-03-18  186  		}
9a3702e1d161f5 David Howells 2024-03-18  187  		return;
9a3702e1d161f5 David Howells 2024-03-18  188  	}
9a3702e1d161f5 David Howells 2024-03-18  189  
9a3702e1d161f5 David Howells 2024-03-18  190  	if (list_empty(&stream->subrequests))
9a3702e1d161f5 David Howells 2024-03-18  191  		return;
9a3702e1d161f5 David Howells 2024-03-18  192  	next = stream->subrequests.next;
9a3702e1d161f5 David Howells 2024-03-18  193  
9a3702e1d161f5 David Howells 2024-03-18  194  	do {
9a3702e1d161f5 David Howells 2024-03-18  195  		struct netfs_io_subrequest *subreq = NULL, *from, *to, *tmp;
9a3702e1d161f5 David Howells 2024-03-18  196  		unsigned long long start, len;
9a3702e1d161f5 David Howells 2024-03-18  197  		size_t part;
9a3702e1d161f5 David Howells 2024-03-18  198  		bool boundary = false;
9a3702e1d161f5 David Howells 2024-03-18  199  
9a3702e1d161f5 David Howells 2024-03-18  200  		/* Go through the stream and find the next span of contiguous
9a3702e1d161f5 David Howells 2024-03-18  201  		 * data that we then rejig (cifs, for example, needs the wsize
9a3702e1d161f5 David Howells 2024-03-18  202  		 * renegotiating) and reissue.
9a3702e1d161f5 David Howells 2024-03-18  203  		 */
9a3702e1d161f5 David Howells 2024-03-18  204  		from = list_entry(next, struct netfs_io_subrequest, rreq_link);
9a3702e1d161f5 David Howells 2024-03-18  205  		to = from;
9a3702e1d161f5 David Howells 2024-03-18  206  		start = from->start + from->transferred;
9a3702e1d161f5 David Howells 2024-03-18  207  		len   = from->len   - from->transferred;
9a3702e1d161f5 David Howells 2024-03-18  208  
9a3702e1d161f5 David Howells 2024-03-18  209  		if (test_bit(NETFS_SREQ_FAILED, &from->flags) ||
9a3702e1d161f5 David Howells 2024-03-18  210  		    !test_bit(NETFS_SREQ_NEED_RETRY, &from->flags))
9a3702e1d161f5 David Howells 2024-03-18  211  			return;
9a3702e1d161f5 David Howells 2024-03-18  212  
9a3702e1d161f5 David Howells 2024-03-18  213  		list_for_each_continue(next, &stream->subrequests) {
9a3702e1d161f5 David Howells 2024-03-18  214  			subreq = list_entry(next, struct netfs_io_subrequest, rreq_link);
9a3702e1d161f5 David Howells 2024-03-18  215  			if (subreq->start + subreq->transferred != start + len ||
9a3702e1d161f5 David Howells 2024-03-18  216  			    test_bit(NETFS_SREQ_BOUNDARY, &subreq->flags) ||
9a3702e1d161f5 David Howells 2024-03-18  217  			    !test_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags))
9a3702e1d161f5 David Howells 2024-03-18  218  				break;
9a3702e1d161f5 David Howells 2024-03-18  219  			to = subreq;
9a3702e1d161f5 David Howells 2024-03-18  220  			len += to->len;
9a3702e1d161f5 David Howells 2024-03-18  221  		}
9a3702e1d161f5 David Howells 2024-03-18  222  
9a3702e1d161f5 David Howells 2024-03-18  223  		/* Work through the sublist. */
9a3702e1d161f5 David Howells 2024-03-18  224  		subreq = from;
9a3702e1d161f5 David Howells 2024-03-18 @225  		list_for_each_entry_from(subreq, &stream->subrequests, rreq_link) {
9a3702e1d161f5 David Howells 2024-03-18  226  			if (!len)
9a3702e1d161f5 David Howells 2024-03-18  227  				break;
9a3702e1d161f5 David Howells 2024-03-18  228  			/* Renegotiate max_len (wsize) */
9a3702e1d161f5 David Howells 2024-03-18  229  			trace_netfs_sreq(subreq, netfs_sreq_trace_retry);
9a3702e1d161f5 David Howells 2024-03-18  230  			__clear_bit(NETFS_SREQ_NEED_RETRY, &subreq->flags);
9a3702e1d161f5 David Howells 2024-03-18  231  			__set_bit(NETFS_SREQ_RETRYING, &subreq->flags);
9a3702e1d161f5 David Howells 2024-03-18  232  			stream->prepare_write(subreq);
9a3702e1d161f5 David Howells 2024-03-18  233  
9a3702e1d161f5 David Howells 2024-03-18  234  			part = min(len, subreq->max_len);
9a3702e1d161f5 David Howells 2024-03-18  235  			subreq->len = part;
9a3702e1d161f5 David Howells 2024-03-18  236  			subreq->start = start;
9a3702e1d161f5 David Howells 2024-03-18  237  			subreq->transferred = 0;
9a3702e1d161f5 David Howells 2024-03-18  238  			len -= part;
9a3702e1d161f5 David Howells 2024-03-18  239  			start += part;
9a3702e1d161f5 David Howells 2024-03-18  240  			if (len && subreq == to &&
9a3702e1d161f5 David Howells 2024-03-18  241  			    __test_and_clear_bit(NETFS_SREQ_BOUNDARY, &to->flags))
9a3702e1d161f5 David Howells 2024-03-18  242  				boundary = true;
9a3702e1d161f5 David Howells 2024-03-18  243  
9a3702e1d161f5 David Howells 2024-03-18  244  			netfs_get_subrequest(subreq, netfs_sreq_trace_get_resubmit);
9a3702e1d161f5 David Howells 2024-03-18  245  			netfs_reissue_write(stream, subreq);
9a3702e1d161f5 David Howells 2024-03-18  246  			if (subreq == to)
9a3702e1d161f5 David Howells 2024-03-18  247  				break;
9a3702e1d161f5 David Howells 2024-03-18  248  		}
9a3702e1d161f5 David Howells 2024-03-18  249  
9a3702e1d161f5 David Howells 2024-03-18  250  		/* If we managed to use fewer subreqs, we can discard the
9a3702e1d161f5 David Howells 2024-03-18  251  		 * excess; if we used the same number, then we're done.
9a3702e1d161f5 David Howells 2024-03-18  252  		 */
9a3702e1d161f5 David Howells 2024-03-18  253  		if (!len) {
9a3702e1d161f5 David Howells 2024-03-18 @254  			if (subreq == to)
9a3702e1d161f5 David Howells 2024-03-18  255  				continue;
9a3702e1d161f5 David Howells 2024-03-18  256  			list_for_each_entry_safe_from(subreq, tmp,
9a3702e1d161f5 David Howells 2024-03-18  257  						      &stream->subrequests, rreq_link) {
9a3702e1d161f5 David Howells 2024-03-18  258  				trace_netfs_sreq(subreq, netfs_sreq_trace_discard);
9a3702e1d161f5 David Howells 2024-03-18  259  				list_del(&subreq->rreq_link);
9a3702e1d161f5 David Howells 2024-03-18  260  				netfs_put_subrequest(subreq, false, netfs_sreq_trace_put_done);
9a3702e1d161f5 David Howells 2024-03-18  261  				if (subreq == to)
9a3702e1d161f5 David Howells 2024-03-18  262  					break;
9a3702e1d161f5 David Howells 2024-03-18  263  			}
9a3702e1d161f5 David Howells 2024-03-18  264  			continue;
9a3702e1d161f5 David Howells 2024-03-18  265  		}
9a3702e1d161f5 David Howells 2024-03-18  266  
9a3702e1d161f5 David Howells 2024-03-18  267  		/* We ran out of subrequests, so we need to allocate some more
9a3702e1d161f5 David Howells 2024-03-18  268  		 * and insert them after.
9a3702e1d161f5 David Howells 2024-03-18  269  		 */
9a3702e1d161f5 David Howells 2024-03-18  270  		do {
9a3702e1d161f5 David Howells 2024-03-18  271  			subreq = netfs_alloc_subrequest(wreq);
9a3702e1d161f5 David Howells 2024-03-18  272  			subreq->source		= to->source;
9a3702e1d161f5 David Howells 2024-03-18  273  			subreq->start		= start;
9a3702e1d161f5 David Howells 2024-03-18  274  			subreq->max_len		= len;
9a3702e1d161f5 David Howells 2024-03-18  275  			subreq->max_nr_segs	= INT_MAX;
9a3702e1d161f5 David Howells 2024-03-18  276  			subreq->debug_index	= atomic_inc_return(&wreq->subreq_counter);
9a3702e1d161f5 David Howells 2024-03-18  277  			subreq->stream_nr	= to->stream_nr;
9a3702e1d161f5 David Howells 2024-03-18  278  			__set_bit(NETFS_SREQ_RETRYING, &subreq->flags);
9a3702e1d161f5 David Howells 2024-03-18  279  
9a3702e1d161f5 David Howells 2024-03-18  280  			trace_netfs_sreq_ref(wreq->debug_id, subreq->debug_index,
9a3702e1d161f5 David Howells 2024-03-18  281  					     refcount_read(&subreq->ref),
9a3702e1d161f5 David Howells 2024-03-18  282  					     netfs_sreq_trace_new);
9a3702e1d161f5 David Howells 2024-03-18  283  			netfs_get_subrequest(subreq, netfs_sreq_trace_get_resubmit);
9a3702e1d161f5 David Howells 2024-03-18  284  
9a3702e1d161f5 David Howells 2024-03-18  285  			list_add(&subreq->rreq_link, &to->rreq_link);
9a3702e1d161f5 David Howells 2024-03-18  286  			to = list_next_entry(to, rreq_link);
9a3702e1d161f5 David Howells 2024-03-18  287  			trace_netfs_sreq(subreq, netfs_sreq_trace_retry);
9a3702e1d161f5 David Howells 2024-03-18  288  
9a3702e1d161f5 David Howells 2024-03-18  289  			switch (stream->source) {
9a3702e1d161f5 David Howells 2024-03-18  290  			case NETFS_UPLOAD_TO_SERVER:
9a3702e1d161f5 David Howells 2024-03-18  291  				netfs_stat(&netfs_n_wh_upload);
9a3702e1d161f5 David Howells 2024-03-18  292  				subreq->max_len = min(len, wreq->wsize);
9a3702e1d161f5 David Howells 2024-03-18  293  				break;
9a3702e1d161f5 David Howells 2024-03-18  294  			case NETFS_WRITE_TO_CACHE:
9a3702e1d161f5 David Howells 2024-03-18  295  				netfs_stat(&netfs_n_wh_write);
9a3702e1d161f5 David Howells 2024-03-18  296  				break;
9a3702e1d161f5 David Howells 2024-03-18  297  			default:
9a3702e1d161f5 David Howells 2024-03-18  298  				WARN_ON_ONCE(1);
9a3702e1d161f5 David Howells 2024-03-18  299  			}
9a3702e1d161f5 David Howells 2024-03-18  300  
9a3702e1d161f5 David Howells 2024-03-18  301  			stream->prepare_write(subreq);
9a3702e1d161f5 David Howells 2024-03-18  302  
9a3702e1d161f5 David Howells 2024-03-18  303  			part = min(len, subreq->max_len);
9a3702e1d161f5 David Howells 2024-03-18  304  			subreq->len = subreq->transferred + part;
9a3702e1d161f5 David Howells 2024-03-18  305  			len -= part;
9a3702e1d161f5 David Howells 2024-03-18  306  			start += part;
9a3702e1d161f5 David Howells 2024-03-18  307  			if (!len && boundary) {
9a3702e1d161f5 David Howells 2024-03-18  308  				__set_bit(NETFS_SREQ_BOUNDARY, &to->flags);
9a3702e1d161f5 David Howells 2024-03-18  309  				boundary = false;
9a3702e1d161f5 David Howells 2024-03-18  310  			}
9a3702e1d161f5 David Howells 2024-03-18  311  
9a3702e1d161f5 David Howells 2024-03-18  312  			netfs_reissue_write(stream, subreq);
9a3702e1d161f5 David Howells 2024-03-18  313  			if (!len)
9a3702e1d161f5 David Howells 2024-03-18  314  				break;
9a3702e1d161f5 David Howells 2024-03-18  315  
9a3702e1d161f5 David Howells 2024-03-18  316  		} while (len);
9a3702e1d161f5 David Howells 2024-03-18  317  
9a3702e1d161f5 David Howells 2024-03-18  318  	} while (!list_is_head(next, &stream->subrequests));
9a3702e1d161f5 David Howells 2024-03-18  319  }
9a3702e1d161f5 David Howells 2024-03-18  320  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
