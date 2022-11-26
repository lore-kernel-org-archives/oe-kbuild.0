Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9A729AB;
	Sat, 26 Nov 2022 19:00:29 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id q7so10164956wrr.8;
        Sat, 26 Nov 2022 11:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QvUEHR8aJAHHIaKESZq8YSv1fXFzj63dOSREENiyMtk=;
        b=c0jBfyi1BLEgtobZfx/QhIU2OOkRu1deR3fo4mSIKtH5hEVQtXnogV8PBZP11DDiaJ
         9tmPdNBBiQ1eDzbPQb8oErSd4AJye5gjkGMxTqMzag9NVxzip6ciE6aiBwP7oX0etWZ0
         7SEvsoTgbuXFRrHyiFdHMKxZFu44jvQqqsC50MXp9v2v8j1mYaOOBJa07oVsoAKfCSJH
         +iyH+q9BK0oTBCH5ef8pHQD3ojzp4nyQRenMND6oFY9JS9/UKkCl+izNb1G7hWI19hKd
         iqsFnXk0BrWFXW9N+Lrtn5n3UgW93kZvY4SLmg+VYdlZ7+vChdIW+0xcbVr/x2QrdvId
         Q2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QvUEHR8aJAHHIaKESZq8YSv1fXFzj63dOSREENiyMtk=;
        b=J6JTX53aOlf+ZJjMyIzTgrsNGF9WVm09mgHaejKPMvhwCgc6jrkZdxGmQTRSXiSMC6
         v7sRDPtFGUgN6iAOR1V29USvQ547KkfixnlbjZ1aEn4bGNzMkiJ6mBlh72Oh1CFlHxd4
         CBlhbEwDJBkTuprGx/ZkDJR6HeHd1UX5BCn+qBvs7pjxntTXJMAAr3xxaREf3h+PUVNm
         4XICc9zl6DjK3PThCclRX+abBIHhiGkVWKNLu0qM2/h6IA/mCUfBC+8+0qiWb4Q7vBGM
         5k8qlHLyiAlb+MSQ8fY0ENdWMDJGHFtvvlfsC8Eafgro4+G8zDouZAfgq0JQUPbRMn/k
         rkkg==
X-Gm-Message-State: ANoB5pk8bAMoQseR/aAf6bH1+Lk+g2mhBTroCfD76Q5xwLTMV0V3a6n4
	gFInJCJwgUbGrEO3HtB/eLd6p5CaeNOHQ164
X-Google-Smtp-Source: AA0mqf5Qmjy+kEYKwBF3VPWqHd/09oBeZQc0PSpUgzBHZA3UoaTEcTUe2HThZ4EYfw03ZosFaCLhBw==
X-Received: by 2002:adf:d0c4:0:b0:242:cc3:d5ac with SMTP id z4-20020adfd0c4000000b002420cc3d5acmr2324472wrh.218.1669489227285;
        Sat, 26 Nov 2022 11:00:27 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id hg27-20020a05600c539b00b003a3170a7af9sm9932584wmb.4.2022.11.26.11.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 11:00:26 -0800 (PST)
Date: Sat, 26 Nov 2022 22:00:23 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Amir Goldstein <amir73il@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [amir73il:sb_write_barrier 21/28] io_uring/rw.c:975 io_write()
 error: uninitialized symbol 'idx'.
Message-ID: <202211270145.Md3rBsof-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221126190023.qPMBWxveEczYW1L9gaTPbSbRoF_ZzGIg4N575n3Nm-k@z>

tree:   https://github.com/amir73il/linux sb_write_barrier
head:   8d20f02c9b77b14aa0a4221c38a9d9e1ee282612
commit: 4e3fa2e567acf8f672bc009cb106a529073a0903 [21/28] vfs: prepare for pre-modify permission events on aio write
config: x86_64-randconfig-m001
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
io_uring/rw.c:975 io_write() error: uninitialized symbol 'idx'.

vim +/idx +975 io_uring/rw.c

f3b44f92e59a80 Jens Axboe        2022-06-13  844  int io_write(struct io_kiocb *req, unsigned int issue_flags)
f3b44f92e59a80 Jens Axboe        2022-06-13  845  {
f2ccb5aed7bce1 Stefan Metzmacher 2022-08-11  846  	struct io_rw *rw = io_kiocb_to_cmd(req, struct io_rw);
f3b44f92e59a80 Jens Axboe        2022-06-13  847  	struct io_rw_state __s, *s = &__s;
f3b44f92e59a80 Jens Axboe        2022-06-13  848  	struct iovec *iovec;
f3b44f92e59a80 Jens Axboe        2022-06-13  849  	struct kiocb *kiocb = &rw->kiocb;
f3b44f92e59a80 Jens Axboe        2022-06-13  850  	bool force_nonblock = issue_flags & IO_URING_F_NONBLOCK;
f3b44f92e59a80 Jens Axboe        2022-06-13  851  	ssize_t ret, ret2;
f3b44f92e59a80 Jens Axboe        2022-06-13  852  	loff_t *ppos;
4e3fa2e567acf8 Amir Goldstein    2022-11-22  853  	int idx;
f3b44f92e59a80 Jens Axboe        2022-06-13  854  
f3b44f92e59a80 Jens Axboe        2022-06-13  855  	if (!req_has_async_data(req)) {
f3b44f92e59a80 Jens Axboe        2022-06-13  856  		ret = io_import_iovec(WRITE, req, &iovec, s, issue_flags);
f3b44f92e59a80 Jens Axboe        2022-06-13  857  		if (unlikely(ret < 0))
f3b44f92e59a80 Jens Axboe        2022-06-13  858  			return ret;
f3b44f92e59a80 Jens Axboe        2022-06-13  859  	} else {
f3b44f92e59a80 Jens Axboe        2022-06-13  860  		struct io_async_rw *io = req->async_data;
f3b44f92e59a80 Jens Axboe        2022-06-13  861  
f3b44f92e59a80 Jens Axboe        2022-06-13  862  		s = &io->s;
f3b44f92e59a80 Jens Axboe        2022-06-13  863  		iov_iter_restore(&s->iter, &s->iter_state);
f3b44f92e59a80 Jens Axboe        2022-06-13  864  		iovec = NULL;
f3b44f92e59a80 Jens Axboe        2022-06-13  865  	}
f3b44f92e59a80 Jens Axboe        2022-06-13  866  	ret = io_rw_init_file(req, FMODE_WRITE);
f3b44f92e59a80 Jens Axboe        2022-06-13  867  	if (unlikely(ret)) {
f3b44f92e59a80 Jens Axboe        2022-06-13  868  		kfree(iovec);
f3b44f92e59a80 Jens Axboe        2022-06-13  869  		return ret;
f3b44f92e59a80 Jens Axboe        2022-06-13  870  	}
f3b44f92e59a80 Jens Axboe        2022-06-13  871  	req->cqe.res = iov_iter_count(&s->iter);
f3b44f92e59a80 Jens Axboe        2022-06-13  872  
f3b44f92e59a80 Jens Axboe        2022-06-13  873  	if (force_nonblock) {
f3b44f92e59a80 Jens Axboe        2022-06-13  874  		/* If the file doesn't support async, just async punt */
f3b44f92e59a80 Jens Axboe        2022-06-13  875  		if (unlikely(!io_file_supports_nowait(req)))
f3b44f92e59a80 Jens Axboe        2022-06-13  876  			goto copy_iov;
                                                                        ^^^^^^^^^^^^^

f3b44f92e59a80 Jens Axboe        2022-06-13  877  
4e17aaab54359f Stefan Roesch     2022-06-16  878  		/* File path supports NOWAIT for non-direct_IO only for block devices. */
4e17aaab54359f Stefan Roesch     2022-06-16  879  		if (!(kiocb->ki_flags & IOCB_DIRECT) &&
4e17aaab54359f Stefan Roesch     2022-06-16  880  			!(kiocb->ki_filp->f_mode & FMODE_BUF_WASYNC) &&
f3b44f92e59a80 Jens Axboe        2022-06-13  881  			(req->flags & REQ_F_ISREG))
f3b44f92e59a80 Jens Axboe        2022-06-13  882  			goto copy_iov;

"idx" not initialized on these gotos.

f3b44f92e59a80 Jens Axboe        2022-06-13  883  
f3b44f92e59a80 Jens Axboe        2022-06-13  884  		kiocb->ki_flags |= IOCB_NOWAIT;
f3b44f92e59a80 Jens Axboe        2022-06-13  885  	} else {
f3b44f92e59a80 Jens Axboe        2022-06-13  886  		/* Ensure we clear previously set non-block flag */
f3b44f92e59a80 Jens Axboe        2022-06-13  887  		kiocb->ki_flags &= ~IOCB_NOWAIT;
f3b44f92e59a80 Jens Axboe        2022-06-13  888  	}
f3b44f92e59a80 Jens Axboe        2022-06-13  889  
f3b44f92e59a80 Jens Axboe        2022-06-13  890  	ppos = io_kiocb_update_pos(req);
f3b44f92e59a80 Jens Axboe        2022-06-13  891  
f3b44f92e59a80 Jens Axboe        2022-06-13  892  	ret = rw_verify_area(WRITE, req->file, ppos, req->cqe.res);
df9830d883b914 Pavel Begunkov    2022-06-16  893  	if (unlikely(ret)) {
df9830d883b914 Pavel Begunkov    2022-06-16  894  		kfree(iovec);
df9830d883b914 Pavel Begunkov    2022-06-16  895  		return ret;
df9830d883b914 Pavel Begunkov    2022-06-16  896  	}
f3b44f92e59a80 Jens Axboe        2022-06-13  897  
f3b44f92e59a80 Jens Axboe        2022-06-13  898  	/*
4e3fa2e567acf8 Amir Goldstein    2022-11-22  899  	 * Open-code file_start_write_area() to grab freeze protection,
f3b44f92e59a80 Jens Axboe        2022-06-13  900  	 * which will be released by another thread in
f3b44f92e59a80 Jens Axboe        2022-06-13  901  	 * io_complete_rw().  Fool lockdep by telling it the lock got
f3b44f92e59a80 Jens Axboe        2022-06-13  902  	 * released so that it doesn't complain about the held lock when
f3b44f92e59a80 Jens Axboe        2022-06-13  903  	 * we return to userspace.
f3b44f92e59a80 Jens Axboe        2022-06-13  904  	 */
4e3fa2e567acf8 Amir Goldstein    2022-11-22  905  	idx = __file_start_aio_write_srcu(req->file);
4e3fa2e567acf8 Amir Goldstein    2022-11-22  906  	ret = fsnotify_file_perm(req->file, MAY_WRITE, ppos, req->cqe.res);
4e3fa2e567acf8 Amir Goldstein    2022-11-22  907  	if (ret) {
4e3fa2e567acf8 Amir Goldstein    2022-11-22  908  		__file_end_aio_write_srcu(req->file, idx);
4e3fa2e567acf8 Amir Goldstein    2022-11-22  909  		return ret;
4e3fa2e567acf8 Amir Goldstein    2022-11-22  910  	}
f3b44f92e59a80 Jens Axboe        2022-06-13  911  	if (req->flags & REQ_F_ISREG) {
f3b44f92e59a80 Jens Axboe        2022-06-13  912  		sb_start_write(file_inode(req->file)->i_sb);
f3b44f92e59a80 Jens Axboe        2022-06-13  913  		__sb_writers_release(file_inode(req->file)->i_sb,
f3b44f92e59a80 Jens Axboe        2022-06-13  914  					SB_FREEZE_WRITE);
f3b44f92e59a80 Jens Axboe        2022-06-13  915  	}
f3b44f92e59a80 Jens Axboe        2022-06-13  916  	kiocb->ki_flags |= IOCB_WRITE;
4e3fa2e567acf8 Amir Goldstein    2022-11-22  917  	kiocb->ki_idx = idx;
f3b44f92e59a80 Jens Axboe        2022-06-13  918  
f3b44f92e59a80 Jens Axboe        2022-06-13  919  	if (likely(req->file->f_op->write_iter))
f3b44f92e59a80 Jens Axboe        2022-06-13  920  		ret2 = call_write_iter(req->file, kiocb, &s->iter);
f3b44f92e59a80 Jens Axboe        2022-06-13  921  	else if (req->file->f_op->write)
f3b44f92e59a80 Jens Axboe        2022-06-13  922  		ret2 = loop_rw_iter(WRITE, rw, &s->iter);
f3b44f92e59a80 Jens Axboe        2022-06-13  923  	else
f3b44f92e59a80 Jens Axboe        2022-06-13  924  		ret2 = -EINVAL;
f3b44f92e59a80 Jens Axboe        2022-06-13  925  
f3b44f92e59a80 Jens Axboe        2022-06-13  926  	if (req->flags & REQ_F_REISSUE) {
f3b44f92e59a80 Jens Axboe        2022-06-13  927  		req->flags &= ~REQ_F_REISSUE;
f3b44f92e59a80 Jens Axboe        2022-06-13  928  		ret2 = -EAGAIN;
f3b44f92e59a80 Jens Axboe        2022-06-13  929  	}
f3b44f92e59a80 Jens Axboe        2022-06-13  930  
f3b44f92e59a80 Jens Axboe        2022-06-13  931  	/*
f3b44f92e59a80 Jens Axboe        2022-06-13  932  	 * Raw bdev writes will return -EOPNOTSUPP for IOCB_NOWAIT. Just
f3b44f92e59a80 Jens Axboe        2022-06-13  933  	 * retry them without IOCB_NOWAIT.
f3b44f92e59a80 Jens Axboe        2022-06-13  934  	 */
f3b44f92e59a80 Jens Axboe        2022-06-13  935  	if (ret2 == -EOPNOTSUPP && (kiocb->ki_flags & IOCB_NOWAIT))
f3b44f92e59a80 Jens Axboe        2022-06-13  936  		ret2 = -EAGAIN;
f3b44f92e59a80 Jens Axboe        2022-06-13  937  	/* no retry on NONBLOCK nor RWF_NOWAIT */
f3b44f92e59a80 Jens Axboe        2022-06-13  938  	if (ret2 == -EAGAIN && (req->flags & REQ_F_NOWAIT))
f3b44f92e59a80 Jens Axboe        2022-06-13  939  		goto done;
f3b44f92e59a80 Jens Axboe        2022-06-13  940  	if (!force_nonblock || ret2 != -EAGAIN) {
f3b44f92e59a80 Jens Axboe        2022-06-13  941  		/* IOPOLL retry should happen for io-wq threads */
f3b44f92e59a80 Jens Axboe        2022-06-13  942  		if (ret2 == -EAGAIN && (req->ctx->flags & IORING_SETUP_IOPOLL))
f3b44f92e59a80 Jens Axboe        2022-06-13  943  			goto copy_iov;
4e17aaab54359f Stefan Roesch     2022-06-16  944  
4e17aaab54359f Stefan Roesch     2022-06-16  945  		if (ret2 != req->cqe.res && ret2 >= 0 && need_complete_io(req)) {
c86416c6ff5ba7 Stefan Roesch     2022-10-10  946  			struct io_async_rw *io;
4e17aaab54359f Stefan Roesch     2022-06-16  947  
1c849b481b3e4f Stefan Roesch     2022-06-16  948  			trace_io_uring_short_write(req->ctx, kiocb->ki_pos - ret2,
1c849b481b3e4f Stefan Roesch     2022-06-16  949  						req->cqe.res, ret2);
1c849b481b3e4f Stefan Roesch     2022-06-16  950  
4e17aaab54359f Stefan Roesch     2022-06-16  951  			/* This is a partial write. The file pos has already been
4e17aaab54359f Stefan Roesch     2022-06-16  952  			 * updated, setup the async struct to complete the request
4e17aaab54359f Stefan Roesch     2022-06-16  953  			 * in the worker. Also update bytes_done to account for
4e17aaab54359f Stefan Roesch     2022-06-16  954  			 * the bytes already written.
4e17aaab54359f Stefan Roesch     2022-06-16  955  			 */
4e17aaab54359f Stefan Roesch     2022-06-16  956  			iov_iter_save_state(&s->iter, &s->iter_state);
4e17aaab54359f Stefan Roesch     2022-06-16  957  			ret = io_setup_async_rw(req, iovec, s, true);
4e17aaab54359f Stefan Roesch     2022-06-16  958  
c86416c6ff5ba7 Stefan Roesch     2022-10-10  959  			io = req->async_data;
c86416c6ff5ba7 Stefan Roesch     2022-10-10  960  			if (io)
c86416c6ff5ba7 Stefan Roesch     2022-10-10  961  				io->bytes_done += ret2;
4e17aaab54359f Stefan Roesch     2022-06-16  962  
e053aaf4da56cb Jens Axboe        2022-06-24  963  			if (kiocb->ki_flags & IOCB_WRITE)
4e3fa2e567acf8 Amir Goldstein    2022-11-22  964  				kiocb_end_write(req, idx);
4e17aaab54359f Stefan Roesch     2022-06-16  965  			return ret ? ret : -EAGAIN;
4e17aaab54359f Stefan Roesch     2022-06-16  966  		}
f3b44f92e59a80 Jens Axboe        2022-06-13  967  done:
df9830d883b914 Pavel Begunkov    2022-06-16  968  		ret = kiocb_done(req, ret2, issue_flags);
f3b44f92e59a80 Jens Axboe        2022-06-13  969  	} else {
f3b44f92e59a80 Jens Axboe        2022-06-13  970  copy_iov:
f3b44f92e59a80 Jens Axboe        2022-06-13  971  		iov_iter_restore(&s->iter, &s->iter_state);
f3b44f92e59a80 Jens Axboe        2022-06-13  972  		ret = io_setup_async_rw(req, iovec, s, false);
e053aaf4da56cb Jens Axboe        2022-06-24  973  		if (!ret) {
e053aaf4da56cb Jens Axboe        2022-06-24  974  			if (kiocb->ki_flags & IOCB_WRITE)
4e3fa2e567acf8 Amir Goldstein    2022-11-22 @975  				kiocb_end_write(req, idx);
                                                                                                     ^^^

e053aaf4da56cb Jens Axboe        2022-06-24  976  			return -EAGAIN;
e053aaf4da56cb Jens Axboe        2022-06-24  977  		}
e053aaf4da56cb Jens Axboe        2022-06-24  978  		return ret;
f3b44f92e59a80 Jens Axboe        2022-06-13  979  	}
f3b44f92e59a80 Jens Axboe        2022-06-13  980  	/* it's reportedly faster than delegating the null check to kfree() */
f3b44f92e59a80 Jens Axboe        2022-06-13  981  	if (iovec)
f3b44f92e59a80 Jens Axboe        2022-06-13  982  		kfree(iovec);
f3b44f92e59a80 Jens Axboe        2022-06-13  983  	return ret;
f3b44f92e59a80 Jens Axboe        2022-06-13  984  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

