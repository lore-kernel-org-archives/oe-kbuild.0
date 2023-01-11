Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336A717EF;
	Wed, 11 Jan 2023 08:54:42 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id o15so10572697wmr.4;
        Wed, 11 Jan 2023 00:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ekHNNp9HmIrz4k3qDc1bNsdu5HAaLGTUTIcVXo5cpcw=;
        b=TPfvbUN4n1N/aSNjJaEiI6mCaXrr6bKtEl/PJ6oU3t5mJsntaeosbmarafJJTRUyhc
         JQT4kPVihAOImDBPqWC0AfB4lZRFoB6Q8xgrMfEdMv2UPrCKPzQVwjpA2ShqAeLYlVaQ
         +Na/zVA5LTlUvtQA5hpHkeDnGsKJGkG0XhRSgYs+yMknaV0jE9Ch1NNXvpPOpu/Q5nj8
         wFcxJyrXYwfzsQExvb1deKUIE1FuNE6ue1d4TX/JGtv5unVELPoPRt073LxPIa5L/wxG
         YfZxEcgjllhdcRsd/Z7YQWix2ywY6Dy630vsln/MocasCFFdm8lXX8WIj9vvFdhcLwSH
         TF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ekHNNp9HmIrz4k3qDc1bNsdu5HAaLGTUTIcVXo5cpcw=;
        b=midyQOvJq9wpr2awkvL6jRi2XWf9Oq+tQCvJBvfZnGa9XlDMjvaE+lUwp8qAeg0q/m
         9qUozZjnM0weH0Gt0BCHYVabJJKRfOrIdVDOuFFpcdgYwJNZwjC51OIkK0OAZPEJ4Tcd
         benNVwWyt+WldRirkq8mkWMiCDZeNnFqA1IMgaS8FVI1uaeClJ2OllMymiyKnntuv7nf
         wSt/KqtBL+vzygQsnlRpRBwpQ+YqEGqaTKtdpWDIMZu9QCidZu/l9Q/SraGXTc08rEjP
         AXOe4v0cL51WqcbC80OcR4OQ6WeYNWPEPAJGhZsN7b0M9L/H4d0kyvyzgc9uqBhq1iyg
         eCrg==
X-Gm-Message-State: AFqh2koQ1oDu0gbaPtKFNe8//SufCPjL1xD91V6nRwBFsOFNT70bEj7/
	hz8qfz0XS2rJ9B6fu4pOVtOcTRNPoa8=
X-Google-Smtp-Source: AMrXdXv7LnELWQ2kfeWeLmNncBIp8eDkcF6aPZkTOPvUktEkbMRrbdRb7f13TSSycdZGMkJQ7EYkEQ==
X-Received: by 2002:a05:600c:3509:b0:3cf:93de:14e8 with SMTP id h9-20020a05600c350900b003cf93de14e8mr50870959wmq.39.1673427279935;
        Wed, 11 Jan 2023 00:54:39 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bg23-20020a05600c3c9700b003d1de805de5sm20166812wmb.16.2023.01.11.00.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 00:54:39 -0800 (PST)
Date: Wed, 11 Jan 2023 11:54:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [trondmy-nfs-2.6:testing 8/17] fs/nfs/read.c:358 nfs_read_folio()
 warn: variable dereferenced before check 'file' (see line 335)
Message-ID: <202301111617.RHJxuFNF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230111085433.Ea6s7qYFo3IMkj_nQoD6ZWlwQmQK0ogQblaWRuSD1c0@z>

tree:   git://git.linux-nfs.org/projects/trondmy/nfs-2.6.git testing
head:   653d2b50cb73b541465920a748c6b1a1edf240d0
commit: c87e83b9f933cc75e6c5ce2f99d333713e87cb6f [8/17] NFS: Convert buffered reads to use folios
config: i386-randconfig-m021
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
fs/nfs/read.c:358 nfs_read_folio() warn: variable dereferenced before check 'file' (see line 335)

vim +/file +358 fs/nfs/read.c

65d023af7f29eb Matthew Wilcox (Oracle  2022-04-29  332) int nfs_read_folio(struct file *file, struct folio *folio)
^1da177e4c3f41 Linus Torvalds          2005-04-16  333  {
1af7e7f8c12f52 Dave Wysochanski        2021-01-28  334  	struct nfs_readdesc desc;
c87e83b9f933cc Trond Myklebust         2023-01-03 @335  	struct inode *inode = file_inode(file);
                                                                                                 ^^^^
file dereferenced here.

49dee70052b894 Dave Wysochanski        2021-01-28  336  	int ret;
^1da177e4c3f41 Linus Torvalds          2005-04-16  337  
c87e83b9f933cc Trond Myklebust         2023-01-03  338  	trace_nfs_aop_readpage(inode, folio);
91d5b47023b608 Chuck Lever             2006-03-20  339  	nfs_inc_stats(inode, NFSIOS_VFSREADPAGE);
91d5b47023b608 Chuck Lever             2006-03-20  340  
^1da177e4c3f41 Linus Torvalds          2005-04-16  341  	/*
^1da177e4c3f41 Linus Torvalds          2005-04-16  342  	 * Try to flush any pending writes to the file..
^1da177e4c3f41 Linus Torvalds          2005-04-16  343  	 *
c87e83b9f933cc Trond Myklebust         2023-01-03  344  	 * NOTE! Because we own the folio lock, there cannot
^1da177e4c3f41 Linus Torvalds          2005-04-16  345  	 * be any new pending writes generated at this point
c87e83b9f933cc Trond Myklebust         2023-01-03  346  	 * for this folio (other folios can be written to).
^1da177e4c3f41 Linus Torvalds          2005-04-16  347  	 */
c87e83b9f933cc Trond Myklebust         2023-01-03  348  	ret = nfs_wb_folio(inode, folio);
49dee70052b894 Dave Wysochanski        2021-01-28  349  	if (ret)
de05a0cc2a2ae1 Trond Myklebust         2007-05-20  350  		goto out_unlock;
c87e83b9f933cc Trond Myklebust         2023-01-03  351  	if (folio_test_uptodate(folio))
de05a0cc2a2ae1 Trond Myklebust         2007-05-20  352  		goto out_unlock;
^1da177e4c3f41 Linus Torvalds          2005-04-16  353  
49dee70052b894 Dave Wysochanski        2021-01-28  354  	ret = -ESTALE;
5f004cf2aa8494 Trond Myklebust         2006-09-14  355  	if (NFS_STALE(inode))
de05a0cc2a2ae1 Trond Myklebust         2007-05-20  356  		goto out_unlock;
5f004cf2aa8494 Trond Myklebust         2006-09-14  357  
^1da177e4c3f41 Linus Torvalds          2005-04-16 @358  	if (file == NULL) {
                                                                    ^^^^^^^^^^^^
But apparently it can be NULL.

49dee70052b894 Dave Wysochanski        2021-01-28  359  		ret = -EBADF;
1af7e7f8c12f52 Dave Wysochanski        2021-01-28  360  		desc.ctx = nfs_find_open_context(inode, NULL, FMODE_READ);
1af7e7f8c12f52 Dave Wysochanski        2021-01-28  361  		if (desc.ctx == NULL)
de05a0cc2a2ae1 Trond Myklebust         2007-05-20  362  			goto out_unlock;
^1da177e4c3f41 Linus Torvalds          2005-04-16  363  	} else
1af7e7f8c12f52 Dave Wysochanski        2021-01-28  364  		desc.ctx = get_nfs_open_context(nfs_file_open_context(file));
8e0969f0451eaf Trond Myklebust         2006-12-13  365  
ba512c1bc32321 Dave Wysochanski        2021-06-29  366  	xchg(&desc.ctx->error, 0);
1e83b173b2663b Dave Wysochanski        2021-01-28  367  	nfs_pageio_init_read(&desc.pgio, inode, false,
1e83b173b2663b Dave Wysochanski        2021-01-28  368  			     &nfs_async_read_completion_ops);
1e83b173b2663b Dave Wysochanski        2021-01-28  369  
c87e83b9f933cc Trond Myklebust         2023-01-03  370  	ret = readpage_async_filler(&desc, folio);
e0340f16a08d03 Dave Wysochanski        2021-06-29  371  	if (ret)
e0340f16a08d03 Dave Wysochanski        2021-06-29  372  		goto out;
1e83b173b2663b Dave Wysochanski        2021-01-28  373  
b42ad64f5f216d Dave Wysochanski        2021-06-24  374  	nfs_pageio_complete_read(&desc.pgio);
1e83b173b2663b Dave Wysochanski        2021-01-28  375  	ret = desc.pgio.pg_error < 0 ? desc.pgio.pg_error : 0;
49dee70052b894 Dave Wysochanski        2021-01-28  376  	if (!ret) {
c87e83b9f933cc Trond Myklebust         2023-01-03  377  		ret = folio_wait_locked_killable(folio);
c87e83b9f933cc Trond Myklebust         2023-01-03  378  		if (!folio_test_uptodate(folio) && !ret)
1af7e7f8c12f52 Dave Wysochanski        2021-01-28  379  			ret = xchg(&desc.ctx->error, 0);
8f54c7a4babf58 Trond Myklebust         2019-08-15  380  	}
9a9fc1c03315f1 David Howells           2009-04-03  381  out:
1af7e7f8c12f52 Dave Wysochanski        2021-01-28  382  	put_nfs_open_context(desc.ctx);
c87e83b9f933cc Trond Myklebust         2023-01-03  383  	trace_nfs_aop_readpage_done(inode, folio, ret);
49dee70052b894 Dave Wysochanski        2021-01-28  384  	return ret;
de05a0cc2a2ae1 Trond Myklebust         2007-05-20  385  out_unlock:
c87e83b9f933cc Trond Myklebust         2023-01-03  386  	folio_unlock(folio);
c87e83b9f933cc Trond Myklebust         2023-01-03  387  	trace_nfs_aop_readpage_done(inode, folio, ret);
49dee70052b894 Dave Wysochanski        2021-01-28  388  	return ret;
^1da177e4c3f41 Linus Torvalds          2005-04-16  389  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

