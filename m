Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5B721CFE0
	for <oe-kbuild@lists.linux.dev>; Sat,  9 May 2026 13:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778332801; cv=none; b=hHCeMnhsopSWQDtCGXGeszqOrFyR+pxkxdRqPAhjZR/ZNfayrLiVmkYlPZZD14OgzRZ3puy29KZ7L70m9+FguFXeCvq4xIhXFovehHG4nq8BHZXEbYbAoK6zZ+3y1V2k0KN0rrBALfyaJv0fzhpXbX5euMiZV545QOaL2Vd/qaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778332801; c=relaxed/simple;
	bh=Hwd9/JbWo35YVv0rnefnN1Ln7x3m3oxwRZBSR9Cl0EE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fsEsLBaELojwZH2LmjsQLtCxaKVuwTGREeA3JiwUjAbNOL2PHRAzwcU4pgdpVL3C5nzCmDVsTFly/JBEemVZBeZ9YMZ4zZz0x0qkYbwzEAAf4qRbWzwmJhoMSoTmlIW4p+69rvOTO2ujyl8aj1IrNPuCPk2EP3vMRVfCz1FLvag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ttx6j/1i; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ttx6j/1i"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5102582e23eso21356721cf.1
        for <oe-kbuild@lists.linux.dev>; Sat, 09 May 2026 06:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778332799; x=1778937599; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nDTlvIGLYEZsUvtYyVX7iyHmk7JEJi5X4f32lxxtw4s=;
        b=Ttx6j/1iqnpoEC85MVAPBqoXsQfwUK53WlFHxxQSZimuRAy5iXQn8dclTP/BdPKI9V
         RvAdIjarehFjb5NhlyCIseztaNsNi4olBrXVY1pBxO25ol/rHqN9K0DZLKAAGmLHebJY
         /JapVU0yS4QsHLPcg4GViDLcTy5kYglQKLweUVHuu71OncAJw2eoADVuNWe6b9Eqo2Au
         RLxPvaXYvMDZu7q9T7BPo0T9ephYXHdQjonch5acgHlxcZSgXxutNLzQJEUZT9gCLuzk
         qbr7gkAsk+/9NwP6zy50D5mSDr5rtGwQcX/1VqgykxxohuXPketfmQwAzbKxSpadfwCN
         dmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778332799; x=1778937599;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nDTlvIGLYEZsUvtYyVX7iyHmk7JEJi5X4f32lxxtw4s=;
        b=fxWmvvMAdAtM3+eXuSr9kVgDTp3aQ5oJRosGs0OwMLa60M3cdahBkjXL7B5moJZ9xc
         03tzqE1HX2uTwRIbmw07CNmzeK3oaO0Zkhhd0ulj6N2x3SsQzWIraYtMfVKDVxXE/kwb
         YsjRu9n0NSkfVLT1iVvxhTU068AaalIN8iSP+eGeApP/Nr2fQkC+ENZIVLnNgqj4T6Cc
         Vn73wu3Jx6DREE+io8K1kScGfiCzI9drUKoMCaCWiZWtYnY2Wuir0P3RMCg4n8j8Swpf
         KyovHzoMCP4JnY29Uf4AFLni4qERBf/3z8t9rDtf2r51azrFeS68Tyy/31l7AHCiZ4XT
         28XA==
X-Gm-Message-State: AOJu0YxRz4y/zMduHXtN6wbtvNu4ZJs8nxepNPyOzq12v3uD1yhXsOMn
	hPBqJMZNJ9nFrxOLr1GBlLXnF/QkeOs/TcJIl+iLD9Zz3CuzR0ofdbFHC6kI7/DX
X-Gm-Gg: Acq92OFnrmwGO2MQg/8tM512vrMMn3I21zP4faf+1SKxQwiCjv/dnhdoNCJgU2Ujqjx
	EufxjHCwKtI4kZFsCg40DeDi77jsDCwrk/NK9BpFeTM2RZRp8ZwQOOPCLu+NXo4jiCDphWTCOsa
	iTH5qvStdjkv1AOh75Whnr+kWQGAv36wQ06SJAA5fLMa+/ByDIbppWgoiP5EuDovvXBFDI9qPo4
	2ZZoW3A07gfmKc1c/lhj/Jeb6eFpt5YLUg2zs41a1Ph/T7+fQOELVnQRJtRRCLhjLUkuqBr1mG3
	YXzIolxf4Jugpx1f7snifX3J3cpJljpuTsyJsd45753UtV8py7ho0NmS8XNgu9PB9tBqMrNpS8X
	K1SFMCNE+xxr/1AkdnQ8AAJ1oMrajwFet6yCFn7c/SvZDI+MQeiG30uSNMgbIq2Y6utXpb0UJwj
	/waS2mizjagY31fXYUem5yRBdXEYKq
X-Received: by 2002:a05:622a:38a:b0:50f:c8f9:d5d9 with SMTP id d75a77b69052e-514a0b3debbmr35724951cf.39.1778332798464;
        Sat, 09 May 2026 06:19:58 -0700 (PDT)
Received: from localhost ([185.141.119.51])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148e630729sm46039621cf.4.2026.05.09.06.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 06:19:57 -0700 (PDT)
Date: Sat, 9 May 2026 16:19:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 4172/4394] drivers/block/loop.c:413 lo_rw_aio()
 error: we previously assumed 'file' could be null (see line 400)
Message-ID: <202605092030.FAH71Jou-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260509131952.8auzlX4IEsT3BP7uxLhYEVbZjp46iWiZJ0fPoXmTjU4@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e98d21c170b01ddef366f023bbfcf6b31509fa83
commit: 1a83d226268cfb9ea546febe6515f39584df8fd2 [4172/4394] loop: check refcount in __loop_clr_fd() and lo_rw_aio()
config: m68k-randconfig-r073-20260509 (https://download.01.org/0day-ci/archive/20260509/202605092030.FAH71Jou-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605092030.FAH71Jou-lkp@intel.com/

New smatch warnings:
drivers/block/loop.c:413 lo_rw_aio() error: we previously assumed 'file' could be null (see line 400)

vim +/file +413 drivers/block/loop.c

96f03c8cb29f2e Jens Axboe         2025-11-24  340  static int lo_rw_aio(struct loop_device *lo, struct loop_cmd *cmd,
96f03c8cb29f2e Jens Axboe         2025-11-24  341  		     loff_t pos, int rw)
c3e6c11147f6f0 Ming Lei           2025-10-15  342  {
96f03c8cb29f2e Jens Axboe         2025-11-24  343  	struct iov_iter iter;
c3e6c11147f6f0 Ming Lei           2025-10-15  344  	struct req_iterator rq_iter;
96f03c8cb29f2e Jens Axboe         2025-11-24  345  	struct bio_vec *bvec;
96f03c8cb29f2e Jens Axboe         2025-11-24  346  	struct request *rq = blk_mq_rq_from_pdu(cmd);
96f03c8cb29f2e Jens Axboe         2025-11-24  347  	struct bio *bio = rq->bio;
96f03c8cb29f2e Jens Axboe         2025-11-24  348  	struct file *file = lo->lo_backing_file;
c3e6c11147f6f0 Ming Lei           2025-10-15  349  	struct bio_vec tmp;
96f03c8cb29f2e Jens Axboe         2025-11-24  350  	unsigned int offset;
71075d25ca5cae Chaitanya Kulkarni 2025-12-02  351  	unsigned int nr_bvec;
96f03c8cb29f2e Jens Axboe         2025-11-24  352  	int ret;
c3e6c11147f6f0 Ming Lei           2025-10-15  353  
71075d25ca5cae Chaitanya Kulkarni 2025-12-02  354  	nr_bvec = blk_rq_nr_bvec(rq);
c3e6c11147f6f0 Ming Lei           2025-10-15  355  
40326d8a33d5b7 Shaohua Li         2017-08-31  356  	if (rq->bio != rq->biotail) {
bc07c10a3603a5 Ming Lei           2015-08-17  357  
69050f8d6d075d Kees Cook          2026-02-20  358  		bvec = kmalloc_objs(struct bio_vec, nr_bvec, GFP_NOIO);
40326d8a33d5b7 Shaohua Li         2017-08-31  359  		if (!bvec)
40326d8a33d5b7 Shaohua Li         2017-08-31  360  			return -EIO;
40326d8a33d5b7 Shaohua Li         2017-08-31  361  		cmd->bvec = bvec;
40326d8a33d5b7 Shaohua Li         2017-08-31  362  
40326d8a33d5b7 Shaohua Li         2017-08-31  363  		/*
40326d8a33d5b7 Shaohua Li         2017-08-31  364  		 * The bios of the request may be started from the middle of
40326d8a33d5b7 Shaohua Li         2017-08-31  365  		 * the 'bvec' because of bio splitting, so we can't directly
86af5952a8470f Ming Lei           2019-02-15  366  		 * copy bio->bi_iov_vec to new bvec. The rq_for_each_bvec
40326d8a33d5b7 Shaohua Li         2017-08-31  367  		 * API will take care of all details for us.
40326d8a33d5b7 Shaohua Li         2017-08-31  368  		 */
86af5952a8470f Ming Lei           2019-02-15  369  		rq_for_each_bvec(tmp, rq, rq_iter) {
40326d8a33d5b7 Shaohua Li         2017-08-31  370  			*bvec = tmp;
40326d8a33d5b7 Shaohua Li         2017-08-31  371  			bvec++;
40326d8a33d5b7 Shaohua Li         2017-08-31  372  		}
96f03c8cb29f2e Jens Axboe         2025-11-24  373  		bvec = cmd->bvec;
96f03c8cb29f2e Jens Axboe         2025-11-24  374  		offset = 0;
fd858d1ca9694c Ming Lei           2025-10-15  375  	} else {
96f03c8cb29f2e Jens Axboe         2025-11-24  376  		/*
96f03c8cb29f2e Jens Axboe         2025-11-24  377  		 * Same here, this bio may be started from the middle of the
96f03c8cb29f2e Jens Axboe         2025-11-24  378  		 * 'bvec' because of bio splitting, so offset from the bvec
96f03c8cb29f2e Jens Axboe         2025-11-24  379  		 * must be passed to iov iterator
96f03c8cb29f2e Jens Axboe         2025-11-24  380  		 */
96f03c8cb29f2e Jens Axboe         2025-11-24  381  		offset = bio->bi_iter.bi_bvec_done;
96f03c8cb29f2e Jens Axboe         2025-11-24  382  		bvec = __bvec_iter_bvec(bio->bi_io_vec, bio->bi_iter);
fd858d1ca9694c Ming Lei           2025-10-15  383  	}
96f03c8cb29f2e Jens Axboe         2025-11-24  384  	atomic_set(&cmd->ref, 2);
96f03c8cb29f2e Jens Axboe         2025-11-24  385  
96f03c8cb29f2e Jens Axboe         2025-11-24  386  	iov_iter_bvec(&iter, rw, bvec, nr_bvec, blk_rq_bytes(rq));
96f03c8cb29f2e Jens Axboe         2025-11-24  387  	iter.iov_offset = offset;
fd858d1ca9694c Ming Lei           2025-10-15  388  
fd858d1ca9694c Ming Lei           2025-10-15  389  	cmd->iocb.ki_pos = pos;
96f03c8cb29f2e Jens Axboe         2025-11-24  390  	cmd->iocb.ki_filp = file;
fd858d1ca9694c Ming Lei           2025-10-15  391  	cmd->iocb.ki_ioprio = req_get_ioprio(rq);
fd858d1ca9694c Ming Lei           2025-10-15  392  	if (cmd->use_aio) {
fd858d1ca9694c Ming Lei           2025-10-15  393  		cmd->iocb.ki_complete = lo_rw_aio_complete;
fd858d1ca9694c Ming Lei           2025-10-15  394  		cmd->iocb.ki_flags = IOCB_DIRECT;
fd858d1ca9694c Ming Lei           2025-10-15  395  	} else {
fd858d1ca9694c Ming Lei           2025-10-15  396  		cmd->iocb.ki_complete = NULL;
fd858d1ca9694c Ming Lei           2025-10-15  397  		cmd->iocb.ki_flags = 0;
fd858d1ca9694c Ming Lei           2025-10-15  398  	}
bc07c10a3603a5 Ming Lei           2015-08-17  399  
1a83d226268cfb Tetsuo Handa       2026-05-08 @400  	if (!file)
1a83d226268cfb Tetsuo Handa       2026-05-08  401  		pr_err("%s(loop%d) starting %s with NULL file (already cleared?)\n",
1a83d226268cfb Tetsuo Handa       2026-05-08  402  		       __func__, lo->lo_number, rw == ITER_SOURCE ? "write" : "read");

presumably this is debug code which isn't going to be merged but


1a83d226268cfb Tetsuo Handa       2026-05-08  403  	else if (!file_count(file))
1a83d226268cfb Tetsuo Handa       2026-05-08  404  		pr_err("%s(loop%d) starting %s with raw_refcnt=0x%lx (already released?)\n",
1a83d226268cfb Tetsuo Handa       2026-05-08  405  		       __func__, lo->lo_number, rw == ITER_SOURCE ? "write" : "read",
1a83d226268cfb Tetsuo Handa       2026-05-08  406  		       __file_ref_read_raw(&file->f_ref));
1a83d226268cfb Tetsuo Handa       2026-05-08  407  	else if (IS_ENABLED(CONFIG_DEBUG_AID_FOR_SYZBOT))
1a83d226268cfb Tetsuo Handa       2026-05-08  408  		pr_info("%s(loop%d) starting %s with raw_refcnt=0x%lx, refcnt=%lu\n",
1a83d226268cfb Tetsuo Handa       2026-05-08  409  			__func__, lo->lo_number, rw == ITER_SOURCE ? "write" : "read",
1a83d226268cfb Tetsuo Handa       2026-05-08  410  			__file_ref_read_raw(&file->f_ref), file_count(file));
39d86db34e41b9 Ming Lei           2025-05-27  411  	if (rw == ITER_SOURCE) {
c4706c5058a7bd Ming Lei           2025-07-16  412  		kiocb_start_write(&cmd->iocb);
7c98f7cb8fda96 Miklos Szeredi     2023-08-28 @413  		ret = file->f_op->write_iter(&cmd->iocb, &iter);
39d86db34e41b9 Ming Lei           2025-05-27  414  	} else
7c98f7cb8fda96 Miklos Szeredi     2023-08-28  415  		ret = file->f_op->read_iter(&cmd->iocb, &iter);

it file is NULL then it's going to crash here.

bc07c10a3603a5 Ming Lei           2015-08-17  416  
92d773324b7edb Shaohua Li         2017-09-01  417  	lo_rw_aio_do_completion(cmd);
92d773324b7edb Shaohua Li         2017-09-01  418  
bc07c10a3603a5 Ming Lei           2015-08-17  419  	if (ret != -EIOCBQUEUED)
6b19b766e8f077 Jens Axboe         2021-10-21  420  		lo_rw_aio_complete(&cmd->iocb, ret);
f2fed441c69b92 Christoph Hellwig  2025-04-09  421  	return -EIOCBQUEUED;
bc07c10a3603a5 Ming Lei           2015-08-17  422  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

