Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F28E7E6
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Jun 2023 01:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686273598; x=1717809598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zuXVIjz692qVC34eSSIwLDXv0NEE5NfIJ68UraT3Wms=;
  b=m5NdDMv8kn67/ikCHt7rWvtD39mRkPbjnDlAQJ0NAbQcMpm+1nLiQs48
   +EWhbfP1BZQF8jXBsx8TL/HiKBLBOEcnLCaJkmDWh842E2FdpXj1VMo4S
   Fn5Lkwb78M9Vy7B7+vRqd4tCSm5mW5LhMdvJJ2u/cTorvIA9Kz6P1RUfK
   mwHeh03PB+66Nm9AxD4UiBv4ZfwjNxwJOsknwBwchepEYTeTx8l5gJmBy
   nBgLLl1fkM0dZuJT3gwjfktfITvfqoIkuFevsQgE2vs1RbSZw9fjNpbPJ
   sOQ0aaHzzvjLr8Ok/WzpO/E3EfMvIUUTJGofWUAoCCYJEpC0icMCAZmDJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="354975319"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="354975319"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 18:19:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="1040319347"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="1040319347"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 08 Jun 2023 18:19:55 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7QnC-0008QS-2L;
	Fri, 09 Jun 2023 01:19:54 +0000
Date: Fri, 9 Jun 2023 09:19:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [amir73il:sb_write_barrier 19/19] io_uring/rw.c:969 io_write()
 error: uninitialized symbol 'idx'.
Message-ID: <202306090959.UhfG3zCN-lkp@intel.com>
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
TO: Amir Goldstein <amir73il@gmail.com>

tree:   https://github.com/amir73il/linux sb_write_barrier
head:   9f8881289a4f015e94460eb2e516b172c5b953e1
commit: 9f8881289a4f015e94460eb2e516b172c5b953e1 [19/19] vfs: prepare for pre-modify permission events on aio write
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: x86_64-randconfig-m001-20230607 (https://download.01.org/0day-ci/archive/20230609/202306090959.UhfG3zCN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306090959.UhfG3zCN-lkp@intel.com/

smatch warnings:
io_uring/rw.c:969 io_write() error: uninitialized symbol 'idx'.

vim +/idx +969 io_uring/rw.c

f3b44f92e59a80 Jens Axboe        2022-06-13  847  
f3b44f92e59a80 Jens Axboe        2022-06-13  848  int io_write(struct io_kiocb *req, unsigned int issue_flags)
f3b44f92e59a80 Jens Axboe        2022-06-13  849  {
f2ccb5aed7bce1 Stefan Metzmacher 2022-08-11  850  	struct io_rw *rw = io_kiocb_to_cmd(req, struct io_rw);
f3b44f92e59a80 Jens Axboe        2022-06-13  851  	struct io_rw_state __s, *s = &__s;
f3b44f92e59a80 Jens Axboe        2022-06-13  852  	struct iovec *iovec;
f3b44f92e59a80 Jens Axboe        2022-06-13  853  	struct kiocb *kiocb = &rw->kiocb;
f3b44f92e59a80 Jens Axboe        2022-06-13  854  	bool force_nonblock = issue_flags & IO_URING_F_NONBLOCK;
f3b44f92e59a80 Jens Axboe        2022-06-13  855  	ssize_t ret, ret2;
f3b44f92e59a80 Jens Axboe        2022-06-13  856  	loff_t *ppos;
9f8881289a4f01 Amir Goldstein    2023-06-07  857  	int idx;
f3b44f92e59a80 Jens Axboe        2022-06-13  858  
f3b44f92e59a80 Jens Axboe        2022-06-13  859  	if (!req_has_async_data(req)) {
de4eda9de2d957 Al Viro           2022-09-15  860  		ret = io_import_iovec(ITER_SOURCE, req, &iovec, s, issue_flags);
f3b44f92e59a80 Jens Axboe        2022-06-13  861  		if (unlikely(ret < 0))
f3b44f92e59a80 Jens Axboe        2022-06-13  862  			return ret;
f3b44f92e59a80 Jens Axboe        2022-06-13  863  	} else {
f3b44f92e59a80 Jens Axboe        2022-06-13  864  		struct io_async_rw *io = req->async_data;
f3b44f92e59a80 Jens Axboe        2022-06-13  865  
f3b44f92e59a80 Jens Axboe        2022-06-13  866  		s = &io->s;
f3b44f92e59a80 Jens Axboe        2022-06-13  867  		iov_iter_restore(&s->iter, &s->iter_state);
f3b44f92e59a80 Jens Axboe        2022-06-13  868  		iovec = NULL;
f3b44f92e59a80 Jens Axboe        2022-06-13  869  	}
f3b44f92e59a80 Jens Axboe        2022-06-13  870  	ret = io_rw_init_file(req, FMODE_WRITE);
f3b44f92e59a80 Jens Axboe        2022-06-13  871  	if (unlikely(ret)) {
f3b44f92e59a80 Jens Axboe        2022-06-13  872  		kfree(iovec);
f3b44f92e59a80 Jens Axboe        2022-06-13  873  		return ret;
f3b44f92e59a80 Jens Axboe        2022-06-13  874  	}
f3b44f92e59a80 Jens Axboe        2022-06-13  875  	req->cqe.res = iov_iter_count(&s->iter);
f3b44f92e59a80 Jens Axboe        2022-06-13  876  
f3b44f92e59a80 Jens Axboe        2022-06-13  877  	if (force_nonblock) {
f3b44f92e59a80 Jens Axboe        2022-06-13  878  		/* If the file doesn't support async, just async punt */
f3b44f92e59a80 Jens Axboe        2022-06-13  879  		if (unlikely(!io_file_supports_nowait(req)))
f3b44f92e59a80 Jens Axboe        2022-06-13  880  			goto copy_iov;
f3b44f92e59a80 Jens Axboe        2022-06-13  881  
4e17aaab54359f Stefan Roesch     2022-06-16  882  		/* File path supports NOWAIT for non-direct_IO only for block devices. */
4e17aaab54359f Stefan Roesch     2022-06-16  883  		if (!(kiocb->ki_flags & IOCB_DIRECT) &&
4e17aaab54359f Stefan Roesch     2022-06-16  884  			!(kiocb->ki_filp->f_mode & FMODE_BUF_WASYNC) &&
f3b44f92e59a80 Jens Axboe        2022-06-13  885  			(req->flags & REQ_F_ISREG))
f3b44f92e59a80 Jens Axboe        2022-06-13  886  			goto copy_iov;
f3b44f92e59a80 Jens Axboe        2022-06-13  887  
f3b44f92e59a80 Jens Axboe        2022-06-13  888  		kiocb->ki_flags |= IOCB_NOWAIT;
f3b44f92e59a80 Jens Axboe        2022-06-13  889  	} else {
f3b44f92e59a80 Jens Axboe        2022-06-13  890  		/* Ensure we clear previously set non-block flag */
f3b44f92e59a80 Jens Axboe        2022-06-13  891  		kiocb->ki_flags &= ~IOCB_NOWAIT;
f3b44f92e59a80 Jens Axboe        2022-06-13  892  	}
f3b44f92e59a80 Jens Axboe        2022-06-13  893  
f3b44f92e59a80 Jens Axboe        2022-06-13  894  	ppos = io_kiocb_update_pos(req);
f3b44f92e59a80 Jens Axboe        2022-06-13  895  
f3b44f92e59a80 Jens Axboe        2022-06-13  896  	ret = rw_verify_area(WRITE, req->file, ppos, req->cqe.res);
9f8881289a4f01 Amir Goldstein    2023-06-07  897  	if (unlikely(ret))
9f8881289a4f01 Amir Goldstein    2023-06-07  898  		goto free_iov;
9f8881289a4f01 Amir Goldstein    2023-06-07  899  
9f8881289a4f01 Amir Goldstein    2023-06-07  900  	ret = file_start_write_area(req->file, ppos, req->cqe.res, &idx);
9f8881289a4f01 Amir Goldstein    2023-06-07  901  	if (unlikely(ret))
9f8881289a4f01 Amir Goldstein    2023-06-07  902  		goto free_iov;
f3b44f92e59a80 Jens Axboe        2022-06-13  903  
f3b44f92e59a80 Jens Axboe        2022-06-13  904  	/*
9f8881289a4f01 Amir Goldstein    2023-06-07  905  	 * Fool lockdep by telling it the lock got released so that it doesn't
9f8881289a4f01 Amir Goldstein    2023-06-07  906  	 * complain about the held lock when we return to userspace.
f3b44f92e59a80 Jens Axboe        2022-06-13  907  	 */
9f8881289a4f01 Amir Goldstein    2023-06-07  908  	__file_write_srcu_release(req->file, idx);
9f8881289a4f01 Amir Goldstein    2023-06-07  909  
f3b44f92e59a80 Jens Axboe        2022-06-13  910  	kiocb->ki_flags |= IOCB_WRITE;
9f8881289a4f01 Amir Goldstein    2023-06-07  911  	kiocb->ki_idx = idx;
f3b44f92e59a80 Jens Axboe        2022-06-13  912  
f3b44f92e59a80 Jens Axboe        2022-06-13  913  	if (likely(req->file->f_op->write_iter))
f3b44f92e59a80 Jens Axboe        2022-06-13  914  		ret2 = call_write_iter(req->file, kiocb, &s->iter);
f3b44f92e59a80 Jens Axboe        2022-06-13  915  	else if (req->file->f_op->write)
f3b44f92e59a80 Jens Axboe        2022-06-13  916  		ret2 = loop_rw_iter(WRITE, rw, &s->iter);
f3b44f92e59a80 Jens Axboe        2022-06-13  917  	else
f3b44f92e59a80 Jens Axboe        2022-06-13  918  		ret2 = -EINVAL;
f3b44f92e59a80 Jens Axboe        2022-06-13  919  
f3b44f92e59a80 Jens Axboe        2022-06-13  920  	if (req->flags & REQ_F_REISSUE) {
f3b44f92e59a80 Jens Axboe        2022-06-13  921  		req->flags &= ~REQ_F_REISSUE;
f3b44f92e59a80 Jens Axboe        2022-06-13  922  		ret2 = -EAGAIN;
f3b44f92e59a80 Jens Axboe        2022-06-13  923  	}
f3b44f92e59a80 Jens Axboe        2022-06-13  924  
f3b44f92e59a80 Jens Axboe        2022-06-13  925  	/*
f3b44f92e59a80 Jens Axboe        2022-06-13  926  	 * Raw bdev writes will return -EOPNOTSUPP for IOCB_NOWAIT. Just
f3b44f92e59a80 Jens Axboe        2022-06-13  927  	 * retry them without IOCB_NOWAIT.
f3b44f92e59a80 Jens Axboe        2022-06-13  928  	 */
f3b44f92e59a80 Jens Axboe        2022-06-13  929  	if (ret2 == -EOPNOTSUPP && (kiocb->ki_flags & IOCB_NOWAIT))
f3b44f92e59a80 Jens Axboe        2022-06-13  930  		ret2 = -EAGAIN;
f3b44f92e59a80 Jens Axboe        2022-06-13  931  	/* no retry on NONBLOCK nor RWF_NOWAIT */
f3b44f92e59a80 Jens Axboe        2022-06-13  932  	if (ret2 == -EAGAIN && (req->flags & REQ_F_NOWAIT))
f3b44f92e59a80 Jens Axboe        2022-06-13  933  		goto done;
f3b44f92e59a80 Jens Axboe        2022-06-13  934  	if (!force_nonblock || ret2 != -EAGAIN) {
f3b44f92e59a80 Jens Axboe        2022-06-13  935  		/* IOPOLL retry should happen for io-wq threads */
f3b44f92e59a80 Jens Axboe        2022-06-13  936  		if (ret2 == -EAGAIN && (req->ctx->flags & IORING_SETUP_IOPOLL))
f3b44f92e59a80 Jens Axboe        2022-06-13  937  			goto copy_iov;
4e17aaab54359f Stefan Roesch     2022-06-16  938  
4e17aaab54359f Stefan Roesch     2022-06-16  939  		if (ret2 != req->cqe.res && ret2 >= 0 && need_complete_io(req)) {
c86416c6ff5ba7 Stefan Roesch     2022-10-10  940  			struct io_async_rw *io;
4e17aaab54359f Stefan Roesch     2022-06-16  941  
1c849b481b3e4f Stefan Roesch     2022-06-16  942  			trace_io_uring_short_write(req->ctx, kiocb->ki_pos - ret2,
1c849b481b3e4f Stefan Roesch     2022-06-16  943  						req->cqe.res, ret2);
1c849b481b3e4f Stefan Roesch     2022-06-16  944  
4e17aaab54359f Stefan Roesch     2022-06-16  945  			/* This is a partial write. The file pos has already been
4e17aaab54359f Stefan Roesch     2022-06-16  946  			 * updated, setup the async struct to complete the request
4e17aaab54359f Stefan Roesch     2022-06-16  947  			 * in the worker. Also update bytes_done to account for
4e17aaab54359f Stefan Roesch     2022-06-16  948  			 * the bytes already written.
4e17aaab54359f Stefan Roesch     2022-06-16  949  			 */
4e17aaab54359f Stefan Roesch     2022-06-16  950  			iov_iter_save_state(&s->iter, &s->iter_state);
4e17aaab54359f Stefan Roesch     2022-06-16  951  			ret = io_setup_async_rw(req, iovec, s, true);
4e17aaab54359f Stefan Roesch     2022-06-16  952  
c86416c6ff5ba7 Stefan Roesch     2022-10-10  953  			io = req->async_data;
c86416c6ff5ba7 Stefan Roesch     2022-10-10  954  			if (io)
c86416c6ff5ba7 Stefan Roesch     2022-10-10  955  				io->bytes_done += ret2;
4e17aaab54359f Stefan Roesch     2022-06-16  956  
e053aaf4da56cb Jens Axboe        2022-06-24  957  			if (kiocb->ki_flags & IOCB_WRITE)
9f8881289a4f01 Amir Goldstein    2023-06-07  958  				kiocb_end_write(req, idx);
4e17aaab54359f Stefan Roesch     2022-06-16  959  			return ret ? ret : -EAGAIN;
4e17aaab54359f Stefan Roesch     2022-06-16  960  		}
f3b44f92e59a80 Jens Axboe        2022-06-13  961  done:
df9830d883b914 Pavel Begunkov    2022-06-16  962  		ret = kiocb_done(req, ret2, issue_flags);
f3b44f92e59a80 Jens Axboe        2022-06-13  963  	} else {
f3b44f92e59a80 Jens Axboe        2022-06-13  964  copy_iov:
f3b44f92e59a80 Jens Axboe        2022-06-13  965  		iov_iter_restore(&s->iter, &s->iter_state);
f3b44f92e59a80 Jens Axboe        2022-06-13  966  		ret = io_setup_async_rw(req, iovec, s, false);
e053aaf4da56cb Jens Axboe        2022-06-24  967  		if (!ret) {
e053aaf4da56cb Jens Axboe        2022-06-24  968  			if (kiocb->ki_flags & IOCB_WRITE)
9f8881289a4f01 Amir Goldstein    2023-06-07 @969  				kiocb_end_write(req, idx);
e053aaf4da56cb Jens Axboe        2022-06-24  970  			return -EAGAIN;
e053aaf4da56cb Jens Axboe        2022-06-24  971  		}
e053aaf4da56cb Jens Axboe        2022-06-24  972  		return ret;
f3b44f92e59a80 Jens Axboe        2022-06-13  973  	}
9f8881289a4f01 Amir Goldstein    2023-06-07  974  free_iov:
f3b44f92e59a80 Jens Axboe        2022-06-13  975  	/* it's reportedly faster than delegating the null check to kfree() */
f3b44f92e59a80 Jens Axboe        2022-06-13  976  	if (iovec)
f3b44f92e59a80 Jens Axboe        2022-06-13  977  		kfree(iovec);
f3b44f92e59a80 Jens Axboe        2022-06-13  978  	return ret;
f3b44f92e59a80 Jens Axboe        2022-06-13  979  }
f3b44f92e59a80 Jens Axboe        2022-06-13  980  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
