Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7B238DD3
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Jun 2024 18:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718736386; cv=none; b=NJiIZcgn12befbz7UObX67E21yrk80N0rPoQrabEYBaoP3NYlVQaakHGAT8ENCwsHSjacLuEnXFyqz53DODJ2H7SvAAogy3NL5v79EB75T58U8xDh/wAEjPVBwPrSHfKGNSrMiABuEdBHyBqS8h2X6ywps/xZWG4wsbxdTsvyaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718736386; c=relaxed/simple;
	bh=4KUosT8FHpsSBEBSDP661Op3DgOv/1F+86N5kqZqP98=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GmodZav48TuQdDLXfuxxCdcv5u5u4Dv7o7LBJ7XlVuQP6ZbYzI+E5fmVVFO4/fgATnXKw6KbeMIqkyDZblGLQkCKUnYP+hWpiVp9f05FaXVzXZY1+2X1KMN9tCZAwwM6oOtgD5SB25JAHx61Ra6G7QkzAfgibLad6IjkvYTe7mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cKt6SeUH; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cKt6SeUH"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-35f236a563cso4488873f8f.2
        for <oe-kbuild@lists.linux.dev>; Tue, 18 Jun 2024 11:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718736383; x=1719341183; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ls7/SB0JX9BuhqtReW7zJ3OlsmhJIpdPXXBdLDpYTr4=;
        b=cKt6SeUHf8e5li8bA2q5iQBOGzCvlQKAhWMpq255Liz8nKr3AmDgYPoXeyN82RmKgR
         CrrSG/r6XaK8FJjAHkob0y+7qflojWDQZDHBIAxRjrAxIizBskMV9RAJ81q7tKFDOG6g
         uUvi65iEQuImz3uETcMBEAFxiHO9g9NvfUW92MoY153U6fYFqD9qvpO+f457ZTYTMMOb
         yAPZLP/DTSB2t5e6F0JQVze2XDZl5++KJqUBSe8SnV7cz3rrFAOPruW2lWUhdj54bRIs
         LIvXI5GZfW+pdtg7WHEkNWvfoGH3ahJy0DSi+6VyIdssrWXM78UqpPUEhxfavp4R8rDP
         0C1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718736383; x=1719341183;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ls7/SB0JX9BuhqtReW7zJ3OlsmhJIpdPXXBdLDpYTr4=;
        b=H9jzazYFxqx0BVaF2/J1DZVoVyvgd2+xJoyepUiQ/KEam3aAtXLmWU+ELuBEgogPai
         QDyY11QKfopw53WgMUo8jxLkvQGChHwP4jDXFXrGs82zzETruKoDOc6mftJAxxa0UdGV
         pewB+YbrlgHsNVzJ0CSAAfsKhtFlMgK34Oz2ww1au/MQ8lUaerjNkY8vbrQ5xtd7dB8q
         bTBDNnKmrOT7I/h8+TM3NGi8Xt0c+PrcdIopf6LoU+xfEdkeuCvAcQyc/BTLoWhmWTwH
         FvVJ17Y7662IhBYJQKGHmHEQZeonxXmjBq6q1V5mTzLC9VOWhChUdm3mf3rhHwasOebl
         CYMw==
X-Gm-Message-State: AOJu0YzVeGMwCY3sc96DbmV897uBu5vVgXX31ea5k4hszOzcuJkZ1tXd
	H2FXpa4QeXf+HOM628TeMyIdnRSh7m4vToRFRs3RQIXnCjpyPumBqcQAOavMbjX6bd2tk5kw0Pj
	C
X-Google-Smtp-Source: AGHT+IELO++/aiXHXuy8U1++adT+kJodLvIH3Zal6efe7UqAK/9LQxLhxHwwdtBDKJANNKD1CT0oBA==
X-Received: by 2002:adf:f98c:0:b0:35f:20da:e1a2 with SMTP id ffacd0b85a97d-36317b7d57dmr276692f8f.30.1718736383291;
        Tue, 18 Jun 2024 11:46:23 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360750acd7csm14826877f8f.52.2024.06.18.11.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 11:46:23 -0700 (PDT)
Date: Tue, 18 Jun 2024 21:46:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Christoph Hellwig <hch@lst.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:nfs-buffered-write-cleanups 8/8] fs/nfs/write.c:569
 nfs_lock_and_join_requests() error: uninitialized symbol 'subreq'.
Message-ID: <20b78a17-38c4-4d59-9e36-314795302af9@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git nfs-buffered-write-cleanups
head:   724a9166a85d96c9fa6377fe9c042b72da816c90
commit: 724a9166a85d96c9fa6377fe9c042b72da816c90 [8/8] nfs: don't reuse partially completed requests in nfs_lock_and_join_requests
config: x86_64-randconfig-161-20240618 (https://download.01.org/0day-ci/archive/20240619/202406190139.SC6Lhg4h-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406190139.SC6Lhg4h-lkp@intel.com/

New smatch warnings:
fs/nfs/write.c:569 nfs_lock_and_join_requests() error: uninitialized symbol 'subreq'.

vim +/subreq +569 fs/nfs/write.c

0c493b5cf16e28 Trond Myklebust       2023-01-19  535  static struct nfs_page *nfs_lock_and_join_requests(struct folio *folio)
e00ed89d7bd59c Trond Myklebust       2020-03-30  536  {
15b8fdc56a662f Christoph Hellwig     2024-06-14  537  	struct inode *inode = folio->mapping->host;
7e6c7e2a4d2386 Christoph Hellwig     2024-06-16  538  	struct nfs_page *head, *subreq;
b193a78ddb5ee7 Trond Myklebust       2023-09-04  539  	struct nfs_commit_info cinfo;
724a9166a85d96 Christoph Hellwig     2024-06-16  540  	bool removed;
e00ed89d7bd59c Trond Myklebust       2020-03-30  541  	int ret;
d458138353726e Weston Andros Adamson 2014-07-11  542  
e00ed89d7bd59c Trond Myklebust       2020-03-30  543  	/*
e00ed89d7bd59c Trond Myklebust       2020-03-30  544  	 * A reference is taken only on the head request which acts as a
e00ed89d7bd59c Trond Myklebust       2020-03-30  545  	 * reference to the whole page group - the group will not be destroyed
e00ed89d7bd59c Trond Myklebust       2020-03-30  546  	 * until the head reference is released.
e00ed89d7bd59c Trond Myklebust       2020-03-30  547  	 */
fe5ab688ce8408 Christoph Hellwig     2024-06-16  548  retry:
fe5ab688ce8408 Christoph Hellwig     2024-06-16  549  	head = nfs_folio_find_head_request(folio);
fe5ab688ce8408 Christoph Hellwig     2024-06-16  550  	if (!head)
fe5ab688ce8408 Christoph Hellwig     2024-06-16  551  		return NULL;
d458138353726e Weston Andros Adamson 2014-07-11  552  
fe5ab688ce8408 Christoph Hellwig     2024-06-16  553  	while (!nfs_lock_request(head)) {
fe5ab688ce8408 Christoph Hellwig     2024-06-16  554  		ret = nfs_wait_on_request(head);
fe5ab688ce8408 Christoph Hellwig     2024-06-16  555  		if (ret < 0)
e00ed89d7bd59c Trond Myklebust       2020-03-30  556  			return ERR_PTR(ret);
b5bab9bf91324a Trond Myklebust       2017-07-17  557  	}
b5bab9bf91324a Trond Myklebust       2017-07-17  558  
fe5ab688ce8408 Christoph Hellwig     2024-06-16  559  	/* Ensure that nobody removed the request before we locked it */
fe5ab688ce8408 Christoph Hellwig     2024-06-16  560  	if (head != folio->private) {
fe5ab688ce8408 Christoph Hellwig     2024-06-16  561  		nfs_unlock_and_release_request(head);
fe5ab688ce8408 Christoph Hellwig     2024-06-16  562  		goto retry;
fe5ab688ce8408 Christoph Hellwig     2024-06-16  563  	}
fe5ab688ce8408 Christoph Hellwig     2024-06-16  564  
7e6c7e2a4d2386 Christoph Hellwig     2024-06-16  565  	ret = nfs_page_group_lock(head);
7e6c7e2a4d2386 Christoph Hellwig     2024-06-16  566  	if (ret < 0)
7e6c7e2a4d2386 Christoph Hellwig     2024-06-16  567  		goto out_unlock;
7e6c7e2a4d2386 Christoph Hellwig     2024-06-16  568  
724a9166a85d96 Christoph Hellwig     2024-06-16 @569  	removed = test_bit(PG_REMOVE, &subreq->wb_flags);
                                                                                       ^^^^^^
Uninitialized until next line.

724a9166a85d96 Christoph Hellwig     2024-06-16  570  
fe5ab688ce8408 Christoph Hellwig     2024-06-16  571  	/* lock each request in the page group */
7e6c7e2a4d2386 Christoph Hellwig     2024-06-16  572  	for (subreq = head->wb_this_page;
7e6c7e2a4d2386 Christoph Hellwig     2024-06-16  573  	     subreq != head;
7e6c7e2a4d2386 Christoph Hellwig     2024-06-16  574  	     subreq = subreq->wb_this_page) {
724a9166a85d96 Christoph Hellwig     2024-06-16  575  		if (test_bit(PG_REMOVE, &subreq->wb_flags))
724a9166a85d96 Christoph Hellwig     2024-06-16  576  			removed = true;
7e6c7e2a4d2386 Christoph Hellwig     2024-06-16  577  		ret = nfs_page_group_lock_subreq(head, subreq);
fe5ab688ce8408 Christoph Hellwig     2024-06-16  578  		if (ret < 0)
fe5ab688ce8408 Christoph Hellwig     2024-06-16  579  			goto out_unlock;
7e6c7e2a4d2386 Christoph Hellwig     2024-06-16  580  	}
7e6c7e2a4d2386 Christoph Hellwig     2024-06-16  581  
7e6c7e2a4d2386 Christoph Hellwig     2024-06-16  582  	nfs_page_group_unlock(head);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

