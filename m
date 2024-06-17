Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F229139CFC
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Jun 2024 14:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718633220; cv=none; b=HYzx9anARRbezOQ3YSvmUUFI/upa2Ov7kp9yg2Z1CwEJ9TPcQbN8NSR1tuDqZfGRiANSgYxojlf8QldfA9FxGYe/kZIVaxoDX59rIHMxPpGcxeVX2M5MpoZ6AYCzE/4YAb7Cuha3kcb4Npu3pJIBuigfFwKDjt798L0TaUu6GNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718633220; c=relaxed/simple;
	bh=pMyfw1dfiGA1QZu8PBrMPuuOqPTctUixdoLBvWN885M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=WAqKZZrHnKt5FnchauXxJnzfpGMoqmJHpPZ1rIQN7qu9/70eEIiWFyWgjDPoDJOLrCLnWDg6/BdWEiLIhOLRwjJbEi2FLB6jIEGl3vrxQKHUwDso/1QXaz+SHzc4qWpRyN9UssV8ev7FSX7Pj+v+JjriAwDSvDJpNF4gh6ZU2IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=csNSLk+C; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="csNSLk+C"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-35f2c9e23d3so3607431f8f.0
        for <oe-kbuild@lists.linux.dev>; Mon, 17 Jun 2024 07:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718633217; x=1719238017; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xfzEPFl0/Y3VgT03Y8o10XG4X345RRemIWVH9KFw+jI=;
        b=csNSLk+CqO0Q4hqBO/BM0qCNW7hggaQE3Y+HX1b2pFQ4DfVD9N2Z/05fgqf0kJoMlZ
         c3GXTLGESGqHkn4IMED9NohU90mXhvBFbXvfY6068K+fH/Gwsqou7Kf9/YbJ8EP7XnGR
         OiIrR/MjiJKTZSG6nNTi3RYmle+ma2I9HYUsSFTcjTBruUhykUMcQaDCOQXjnOcnzszu
         bwzPtRt/3PlS6/EAv8tKFSRLp1B1iGO0MWYmfWn9BY3kVi5BcWzhIXlERHE6E00Y3sRB
         vekabAcYPI/axO3+zjtGQQNP2GE244fRiKIPVEUOGWL9K7NXDOVbv068SKoghcjA1kFL
         gP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718633217; x=1719238017;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xfzEPFl0/Y3VgT03Y8o10XG4X345RRemIWVH9KFw+jI=;
        b=Kpj1Om0tRwcJH1sGvwzplmZH6DObFRf1GwEWWHuvJZIua5fOfxL2HuJFKR+PVQFCpp
         YUSUGiK0YK49wm/s7u/UEYhosbArU77u2mLZWKFUJYN3C5oIDq4f9meYuiz5g4sMz4NL
         JlbqKYomvcJK6JpeYXs7KXkSjTnLKGhmaPh5aTV2Vj0kN4EY6vfz7TixAENVgP2+KsBx
         PaSJnLp3OsyaFWE94crA6rj/UFTQGqwNs1T3OjAZjdWx17OkgStZLlgefGp8rsA4jrGZ
         fF+/beUaiQJ0BoJCkR0QSonzfu1d+wYIOpnkXCl+XCNJcZbt+RX1gIoaMn5wYBTxG6Yq
         qzxQ==
X-Gm-Message-State: AOJu0YwaDhMWHDoOheNZWCB9Tafb9WUhQmTRaw1bG2346R1Zxa5pOKx4
	ssgXOo5w6FisFPB3Mqf/f2gjLJWwnMpwANzs9uP9w0lBDMghOLa2GC+St+oQMiSh0UMFnfyThUN
	f
X-Google-Smtp-Source: AGHT+IHDZbXCFBXwbnXcDrWZn2ocDbHY0hBSBHWSG0CtmvrPKMVAjIMtcKtYZ5slFz12ytWdZUf88g==
X-Received: by 2002:adf:f705:0:b0:35f:32af:d79 with SMTP id ffacd0b85a97d-36071901363mr11440363f8f.27.1718633216594;
        Mon, 17 Jun 2024 07:06:56 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607509c8fbsm11886296f8f.43.2024.06.17.07.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 07:06:56 -0700 (PDT)
Date: Mon, 17 Jun 2024 17:06:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Christoph Hellwig <hch@lst.de>,
	trondmy@kernel.org, anna@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-nfs@vger.kernel.org
Subject: Re: [PATCH] nfs: remove dead code for the old swap over NFS
 implementation
Message-ID: <975db363-b830-499b-89f8-9d843da47427@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240615080827.1239935-1-hch@lst.de>

Hi Christoph,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-Hellwig/nfs-remove-dead-code-for-the-old-swap-over-NFS-implementation/20240615-161031
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20240615080827.1239935-1-hch%40lst.de
patch subject: [PATCH] nfs: remove dead code for the old swap over NFS implementation
config: x86_64-randconfig-161-20240616 (https://download.01.org/0day-ci/archive/20240616/202406162226.EHq7u0eB-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406162226.EHq7u0eB-lkp@intel.com/

smatch warnings:
fs/nfs/write.c:737 nfs_inode_remove_request() warn: variable dereferenced before check 'folio' (see line 734)

vim +/folio +737 fs/nfs/write.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  728  static void nfs_inode_remove_request(struct nfs_page *req)
^1da177e4c3f41 Linus Torvalds          2005-04-16  729  {
6a6d4644ce935d Scott Mayhew            2023-10-11  730  	struct nfs_inode *nfsi = NFS_I(nfs_page_to_inode(req));
6a6d4644ce935d Scott Mayhew            2023-10-11  731  
20633f042fd090 Weston Andros Adamson   2014-05-15  732  	if (nfs_page_group_sync_on_bit(req, PG_REMOVE)) {
0c493b5cf16e28 Trond Myklebust         2023-01-19  733  		struct folio *folio = nfs_page_to_folio(req->wb_head);
a43a94f57a0e00 Christoph Hellwig       2024-06-15 @734  		struct address_space *mapping = folio->mapping;
                                                                                                        ^^^^^^^^^^^^^^
Dereference

^1da177e4c3f41 Linus Torvalds          2005-04-16  735  
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17  736) 		spin_lock(&mapping->i_private_lock);
a43a94f57a0e00 Christoph Hellwig       2024-06-15 @737  		if (likely(folio)) {
                                                                                   ^^^^^
Checked too late

0c493b5cf16e28 Trond Myklebust         2023-01-19  738  			folio->private = NULL;
0c493b5cf16e28 Trond Myklebust         2023-01-19  739  			folio_clear_private(folio);
0c493b5cf16e28 Trond Myklebust         2023-01-19  740  			clear_bit(PG_MAPPED, &req->wb_head->wb_flags);
29418aa4bd487c Mel Gorman              2012-07-31  741  		}
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17  742) 		spin_unlock(&mapping->i_private_lock);
20633f042fd090 Weston Andros Adamson   2014-05-15  743  	}
17089a29a25a3b Weston Andros Adamson   2014-07-11  744  
33ea5aaa87cdae ZhangXiaoxu             2019-09-26  745  	if (test_and_clear_bit(PG_INODE_REF, &req->wb_flags)) {
6a6d4644ce935d Scott Mayhew            2023-10-11  746  		atomic_long_dec(&nfsi->nrequests);
dd1b2026323a2d Jeff Layton             2023-09-19  747  		nfs_release_request(req);
33ea5aaa87cdae ZhangXiaoxu             2019-09-26  748  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  749  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

