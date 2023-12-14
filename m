Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4960A15482
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Dec 2023 08:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kx8Q7gux"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40c3fe6c08fso54376235e9.1
        for <oe-kbuild@lists.linux.dev>; Thu, 14 Dec 2023 00:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702541200; x=1703146000; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/DVc0i5xaYcGlsKsAXC/r/2nWTS8b7DosM+HW5zQ64o=;
        b=Kx8Q7guxcspkj0oVvQfesSGiX4Cw/EQ4hVTL2xvezcZfPsQkwSBU8RpIIBfa+61eSg
         Y0yH+0gUjTa/TI1eqY3gg2dTfjzaYSx9dOcVCysBHxrl/j6ViuGqoEjVS1x9pJeEUje6
         xEhx1jPkcCPoxosS+NIASQ7B0AYM1GR/As7aojUTaXqiw+BdtSBSvIIuEzcK7lOTaAGJ
         RO6V864l99iysurksHx/AJbJ4tTxO1aVnDXuxuN+0fYLT/2U44aMlw5rUKU0IF/ZJb5x
         T0KjQnoak951XMeNhIdgmhIfjQc3j8eDW4DawbOshd30rfYrY88nryXiKnXDeRJy+js9
         6rKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702541200; x=1703146000;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/DVc0i5xaYcGlsKsAXC/r/2nWTS8b7DosM+HW5zQ64o=;
        b=hSHB6FhEtx+yXWNGHUxyuxA4GXYTItG30hrZCbE6I/B7nInxCDZF47UY8LeNbemu0i
         jFNUaNrPI7VZutK5CTfNux5qGsCLHbeT9ZDRPEmGO/FfvWJDqanXNlzvXhF3qmC50gZc
         3LgAR7OqeKA4wbG4pX0ZP4QybN1PrROVUO0ByIgnqb51RA26qhXIVIAN8ZgTJ1ptXDqG
         Ta8GLbuVyX3Hmuu7m3bvKWL4KJUa3aLr/A8d1cq82Sfu8xJRH1GTFGAIHb9inK42ttkz
         0vymJQmIjgMw6QHnqbck8eaKJBH8tTAoGAROp/3V7UJNpZl1XhkQMaG79KigIdf8yUx2
         SK/w==
X-Gm-Message-State: AOJu0YxaICutW7JigpD7umTGoFvN0Ty61VOlCj03H21PYVyLCrUto4v1
	YhkX2LWJUX9yplM+h8wo58DefPv2OuILxVlmsdY=
X-Google-Smtp-Source: AGHT+IFb9lRopOI5WykfoFV67ILXIS4/FLSds00XuReihsCrIlLKwe5su3/IvNfxhHW2EfonqiR31Q==
X-Received: by 2002:a05:600c:4449:b0:40c:4aa6:2c9f with SMTP id v9-20020a05600c444900b0040c4aa62c9fmr2068076wmn.243.1702541200257;
        Thu, 14 Dec 2023 00:06:40 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id s5-20020a05600c384500b0040b632f31d2sm23902179wmr.5.2023.12.14.00.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 00:06:40 -0800 (PST)
Date: Thu, 14 Dec 2023 11:06:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, David Howells <dhowells@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 69/80] fs/netfs/direct_read.c:189
 netfs_unbuffered_read_iter_locked() error: uninitialized symbol 'min_bsize'.
Message-ID: <2515428b-8f7a-40f0-b76d-b2acf264be0a@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   0e2ac5291cc1c3c45e5ee784357b3f51b611195f
commit: 9afdab285a8996a3f87b696670fe80fb531c8ad5 [69/80] netfs: Implement support for unbuffered/DIO read
config: x86_64-randconfig-161-20231213 (https://download.01.org/0day-ci/archive/20231214/202312140149.21EL6QeG-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231214/202312140149.21EL6QeG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312140149.21EL6QeG-lkp@intel.com/

smatch warnings:
fs/netfs/direct_read.c:189 netfs_unbuffered_read_iter_locked() error: uninitialized symbol 'min_bsize'.

vim +/min_bsize +189 fs/netfs/direct_read.c

9afdab285a8996 David Howells 2022-01-14  129  static ssize_t netfs_unbuffered_read_iter_locked(struct kiocb *iocb, struct iov_iter *iter)
9afdab285a8996 David Howells 2022-01-14  130  {
9afdab285a8996 David Howells 2022-01-14  131  	struct netfs_io_request *rreq;
9afdab285a8996 David Howells 2022-01-14  132  	struct netfs_inode *ctx;
9afdab285a8996 David Howells 2022-01-14  133  	unsigned long long start, end;
9afdab285a8996 David Howells 2022-01-14  134  	unsigned int min_bsize;
9afdab285a8996 David Howells 2022-01-14  135  	pgoff_t first, last;
9afdab285a8996 David Howells 2022-01-14  136  	ssize_t ret;
9afdab285a8996 David Howells 2022-01-14  137  	size_t orig_count = iov_iter_count(iter);
9afdab285a8996 David Howells 2022-01-14  138  	bool async = !is_sync_kiocb(iocb);
9afdab285a8996 David Howells 2022-01-14  139  
9afdab285a8996 David Howells 2022-01-14  140  	_enter("");
9afdab285a8996 David Howells 2022-01-14  141  
9afdab285a8996 David Howells 2022-01-14  142  	if (!orig_count)
9afdab285a8996 David Howells 2022-01-14  143  		return 0; /* Don't update atime */
9afdab285a8996 David Howells 2022-01-14  144  
9afdab285a8996 David Howells 2022-01-14  145  	ret = kiocb_write_and_wait(iocb, orig_count);
9afdab285a8996 David Howells 2022-01-14  146  	if (ret < 0)
9afdab285a8996 David Howells 2022-01-14  147  		return ret;
9afdab285a8996 David Howells 2022-01-14  148  	file_accessed(iocb->ki_filp);
9afdab285a8996 David Howells 2022-01-14  149  
9afdab285a8996 David Howells 2022-01-14  150  	rreq = netfs_alloc_request(iocb->ki_filp->f_mapping, iocb->ki_filp,
9afdab285a8996 David Howells 2022-01-14  151  				   iocb->ki_pos, orig_count,
9afdab285a8996 David Howells 2022-01-14  152  				   NETFS_DIO_READ);
9afdab285a8996 David Howells 2022-01-14  153  	if (IS_ERR(rreq))
9afdab285a8996 David Howells 2022-01-14  154  		return PTR_ERR(rreq);
9afdab285a8996 David Howells 2022-01-14  155  
9afdab285a8996 David Howells 2022-01-14  156  	ctx = netfs_inode(rreq->inode);
9afdab285a8996 David Howells 2022-01-14  157  	netfs_stat(&netfs_n_rh_dio_read);
9afdab285a8996 David Howells 2022-01-14  158  	trace_netfs_read(rreq, rreq->start, rreq->len, netfs_read_trace_dio_read);
9afdab285a8996 David Howells 2022-01-14  159  
9afdab285a8996 David Howells 2022-01-14  160  	/* If this is an async op, we have to keep track of the destination
9afdab285a8996 David Howells 2022-01-14  161  	 * buffer for ourselves as the caller's iterator will be trashed when
9afdab285a8996 David Howells 2022-01-14  162  	 * we return.
9afdab285a8996 David Howells 2022-01-14  163  	 *
9afdab285a8996 David Howells 2022-01-14  164  	 * In such a case, extract an iterator to represent as much of the the
9afdab285a8996 David Howells 2022-01-14  165  	 * output buffer as we can manage.  Note that the extraction might not
9afdab285a8996 David Howells 2022-01-14  166  	 * be able to allocate a sufficiently large bvec array and may shorten
9afdab285a8996 David Howells 2022-01-14  167  	 * the request.
9afdab285a8996 David Howells 2022-01-14  168  	 */
9afdab285a8996 David Howells 2022-01-14  169  	if (user_backed_iter(iter)) {
9afdab285a8996 David Howells 2022-01-14  170  		ret = netfs_extract_user_iter(iter, rreq->len, &rreq->iter, 0);
9afdab285a8996 David Howells 2022-01-14  171  		if (ret < 0)
9afdab285a8996 David Howells 2022-01-14  172  			goto out;
9afdab285a8996 David Howells 2022-01-14  173  		rreq->direct_bv = (struct bio_vec *)rreq->iter.bvec;
9afdab285a8996 David Howells 2022-01-14  174  		rreq->direct_bv_count = ret;
9afdab285a8996 David Howells 2022-01-14  175  		rreq->direct_bv_unpin = iov_iter_extract_will_pin(iter);
9afdab285a8996 David Howells 2022-01-14  176  		rreq->len = iov_iter_count(&rreq->iter);
9afdab285a8996 David Howells 2022-01-14  177  	} else {
9afdab285a8996 David Howells 2022-01-14  178  		rreq->iter = *iter;
9afdab285a8996 David Howells 2022-01-14  179  		rreq->len = orig_count;
9afdab285a8996 David Howells 2022-01-14  180  		rreq->direct_bv_unpin = false;
9afdab285a8996 David Howells 2022-01-14  181  		iov_iter_advance(iter, orig_count);
9afdab285a8996 David Howells 2022-01-14  182  	}
9afdab285a8996 David Howells 2022-01-14  183  
9afdab285a8996 David Howells 2022-01-14  184  	/* If we're going to use a bounce buffer, we need to set it up.  We
9afdab285a8996 David Howells 2022-01-14  185  	 * will then need to pad the request out to the minimum block size.
9afdab285a8996 David Howells 2022-01-14  186  	 */
9afdab285a8996 David Howells 2022-01-14  187  	if (test_bit(NETFS_RREQ_USE_BOUNCE_BUFFER, &rreq->flags)) {
9afdab285a8996 David Howells 2022-01-14  188  		start = rreq->start;
9afdab285a8996 David Howells 2022-01-14 @189  		end = min_t(unsigned long long,
9afdab285a8996 David Howells 2022-01-14  190  			    round_up(rreq->start + rreq->len, min_bsize),

min_bsize is never initialized.

9afdab285a8996 David Howells 2022-01-14  191  			    ctx->remote_i_size);
9afdab285a8996 David Howells 2022-01-14  192  
9afdab285a8996 David Howells 2022-01-14  193  		rreq->start = start;
9afdab285a8996 David Howells 2022-01-14  194  		rreq->len   = end - start;
9afdab285a8996 David Howells 2022-01-14  195  		first = start / PAGE_SIZE;
9afdab285a8996 David Howells 2022-01-14  196  		last  = (end - 1) / PAGE_SIZE;
9afdab285a8996 David Howells 2022-01-14  197  		_debug("bounce %llx-%llx %lx-%lx",
9afdab285a8996 David Howells 2022-01-14  198  		       rreq->start, end, first, last);
9afdab285a8996 David Howells 2022-01-14  199  
9afdab285a8996 David Howells 2022-01-14  200  		ret = netfs_add_folios_to_buffer(&rreq->bounce, rreq->mapping,
9afdab285a8996 David Howells 2022-01-14  201  						 first, last, GFP_KERNEL);
9afdab285a8996 David Howells 2022-01-14  202  		if (ret < 0)
9afdab285a8996 David Howells 2022-01-14  203  			goto out;
9afdab285a8996 David Howells 2022-01-14  204  	}
9afdab285a8996 David Howells 2022-01-14  205  
9afdab285a8996 David Howells 2022-01-14  206  	if (async)
9afdab285a8996 David Howells 2022-01-14  207  		rreq->iocb = iocb;
9afdab285a8996 David Howells 2022-01-14  208  
9afdab285a8996 David Howells 2022-01-14  209  	ret = netfs_begin_read(rreq, is_sync_kiocb(iocb));
9afdab285a8996 David Howells 2022-01-14  210  	if (ret < 0)
9afdab285a8996 David Howells 2022-01-14  211  		goto out; /* May be -EIOCBQUEUED */
9afdab285a8996 David Howells 2022-01-14  212  	if (!async) {
9afdab285a8996 David Howells 2022-01-14  213  		ret = netfs_dio_copy_bounce_to_dest(rreq);
9afdab285a8996 David Howells 2022-01-14  214  		if (ret == 0) {
9afdab285a8996 David Howells 2022-01-14  215  			iocb->ki_pos += rreq->transferred;
9afdab285a8996 David Howells 2022-01-14  216  			ret = rreq->transferred;
9afdab285a8996 David Howells 2022-01-14  217  		}
9afdab285a8996 David Howells 2022-01-14  218  	}
9afdab285a8996 David Howells 2022-01-14  219  
9afdab285a8996 David Howells 2022-01-14  220  out:
9afdab285a8996 David Howells 2022-01-14  221  	netfs_put_request(rreq, false, netfs_rreq_trace_put_return);
9afdab285a8996 David Howells 2022-01-14  222  	if (ret > 0)
9afdab285a8996 David Howells 2022-01-14  223  		orig_count -= ret;
9afdab285a8996 David Howells 2022-01-14  224  	if (ret != -EIOCBQUEUED)
9afdab285a8996 David Howells 2022-01-14  225  		iov_iter_revert(iter, orig_count - iov_iter_count(iter));
9afdab285a8996 David Howells 2022-01-14  226  	return ret;
9afdab285a8996 David Howells 2022-01-14  227  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

