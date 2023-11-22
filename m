Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2284E219F6
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Nov 2023 09:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V0CE7dzR"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40b2a8c7ca9so12072915e9.2
        for <oe-kbuild@lists.linux.dev>; Wed, 22 Nov 2023 01:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700645213; x=1701250013; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=paJwhrzgCtHLF7VWR5s+BnlvcG1QpR4UqMj0/lcDJrY=;
        b=V0CE7dzRdIXSwe6VTahEOPOiXXRcvPvAFoc2jTNEsb15ukzGhVJ4pKHQYWXcrzuWmc
         bd3fmXCf4BaTzhTeAESfDujHFHKhJhWk2/eXEa9yxiLJ0k75ld64/40pcjOhZLJNhd0x
         WJJsEKOlpiuv2skwtliep7Ay2ySfBLk1sLE0E7fzq5AY7nHhIUVNZdbkEJY365gH9i0+
         vhK7033/rm8yLidUmdY35DWgUbn8JBwjhMurRYrLpD758KCk29mtFo0zzGNzbaIa1F4l
         Qw5f+l7CvN+ybEtbuDi0tvc3DEWhqXaSFpu+NER9I8DAJI5siQSLkT+5Nlh9WwAq98ok
         +ZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700645213; x=1701250013;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=paJwhrzgCtHLF7VWR5s+BnlvcG1QpR4UqMj0/lcDJrY=;
        b=pKDFwxq58sHU9QLAcaARtg0VbZUAAPVL/QddG8EFwhI/Y4V97zYcoU9YgF0fcbkoaT
         4TDSVSu5VeSmduoVkKdDLsSdITs8vNzifvyiFMP9PDj/t1M1TWK+trJILK97a3hK7TjL
         6rSAHNrmkjml7LpT12GDbklOc7Xx8QWAqaKDKA8eehwN9yUhdXRH7AAHrbTtTY/8nmrr
         S7sV0qihUOMa9J/dDZ3SfBE0fXFBLi+RqhJmd/Xxmssj2AJwXI7JT1Maf9DKqaU88LrI
         ooHbRLP0jSW0z5JA6rfLy/I9EqdBc/Tummr0CKPHZQD2SO/7Ltrhk71jWC9W5huQVCz7
         vVAg==
X-Gm-Message-State: AOJu0YxhRp23GzyUd5er6JbUcgwS0BhYTif7bpga04ZOSVcFokT9yo4/
	Ys4zpBKqzhOIde5/Fzrx7SQGprP5fhTgBWrL3gE=
X-Google-Smtp-Source: AGHT+IHMdaD1e0cpSwgjQVC7MyYFeQ5WSzzkRLeBWuMk9K+DDnbNfsctPHKNOD99fsDXA1J5dw6w0w==
X-Received: by 2002:adf:ef42:0:b0:332:ca1e:3d95 with SMTP id c2-20020adfef42000000b00332ca1e3d95mr1242092wrp.9.1700645212186;
        Wed, 22 Nov 2023 01:26:52 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z16-20020adfe550000000b0032db4e660d9sm16609540wrm.56.2023.11.22.01.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 01:26:51 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Nov 2023 04:26:49 -0500
To: oe-kbuild@lists.linux.dev, Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 2/5] udmabuf: Add back support for mapping hugetlb
 pages (v3)
Message-ID: <380cff80-c83e-473f-9e85-ab459f9af888@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231118063233.733523-3-vivek.kasireddy@intel.com>

Hi Vivek,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Vivek-Kasireddy/udmabuf-Use-vmf_insert_pfn-and-VM_PFNMAP-for-handling-mmap/20231118-145704
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231118063233.733523-3-vivek.kasireddy%40intel.com
patch subject: [PATCH v4 2/5] udmabuf: Add back support for mapping hugetlb pages (v3)
config: x86_64-randconfig-161-20231122 (https://download.01.org/0day-ci/archive/20231122/202311220940.c47i1TUH-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231122/202311220940.c47i1TUH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311220940.c47i1TUH-lkp@intel.com/

New smatch warnings:
drivers/dma-buf/udmabuf.c:301 udmabuf_create() error: uninitialized symbol 'chunkoff'.
drivers/dma-buf/udmabuf.c:302 udmabuf_create() error: uninitialized symbol 'maxchunks'.

Old smatch warnings:
(probably false positives)
drivers/dma-buf/udmabuf.c:292 udmabuf_create() error: uninitialized symbol 'mapidx'.

vim +/chunkoff +301 drivers/dma-buf/udmabuf.c

c1bbed668997268 Gurchetan Singh     2019-12-02  214  static long udmabuf_create(struct miscdevice *device,
c1bbed668997268 Gurchetan Singh     2019-12-02  215  			   struct udmabuf_create_list *head,
c1bbed668997268 Gurchetan Singh     2019-12-02  216  			   struct udmabuf_create_item *list)
fbb0de795078190 Gerd Hoffmann       2018-08-27  217  {
fbb0de795078190 Gerd Hoffmann       2018-08-27  218  	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
fbb0de795078190 Gerd Hoffmann       2018-08-27  219  	struct file *memfd = NULL;
16c243e99d335e1 Vivek Kasireddy     2021-06-09  220  	struct address_space *mapping = NULL;
fbb0de795078190 Gerd Hoffmann       2018-08-27  221  	struct udmabuf *ubuf;
fbb0de795078190 Gerd Hoffmann       2018-08-27  222  	struct dma_buf *buf;
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  223  	pgoff_t pgoff, pgcnt, pgidx, pgbuf = 0, pglimit;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  224  	struct page *page, *hpage = NULL;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  225  	pgoff_t mapidx, chunkoff, maxchunks;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  226  	struct hstate *hpstate;
fbb0de795078190 Gerd Hoffmann       2018-08-27  227  	int seals, ret = -EINVAL;
fbb0de795078190 Gerd Hoffmann       2018-08-27  228  	u32 i, flags;
fbb0de795078190 Gerd Hoffmann       2018-08-27  229  
33f35429fc49c09 Gerd Hoffmann       2018-09-11  230  	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
fbb0de795078190 Gerd Hoffmann       2018-08-27  231  	if (!ubuf)
fbb0de795078190 Gerd Hoffmann       2018-08-27  232  		return -ENOMEM;
fbb0de795078190 Gerd Hoffmann       2018-08-27  233  
dc4716d75154b36 Gerd Hoffmann       2018-09-11  234  	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
fbb0de795078190 Gerd Hoffmann       2018-08-27  235  	for (i = 0; i < head->count; i++) {
fbb0de795078190 Gerd Hoffmann       2018-08-27  236  		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  237  			goto err;
fbb0de795078190 Gerd Hoffmann       2018-08-27  238  		if (!IS_ALIGNED(list[i].size, PAGE_SIZE))
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  239  			goto err;
fbb0de795078190 Gerd Hoffmann       2018-08-27  240  		ubuf->pagecount += list[i].size >> PAGE_SHIFT;
dc4716d75154b36 Gerd Hoffmann       2018-09-11  241  		if (ubuf->pagecount > pglimit)
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  242  			goto err;
fbb0de795078190 Gerd Hoffmann       2018-08-27  243  	}
2b6dd600dd72573 Pavel Skripkin      2021-12-30  244  
2b6dd600dd72573 Pavel Skripkin      2021-12-30  245  	if (!ubuf->pagecount)
2b6dd600dd72573 Pavel Skripkin      2021-12-30  246  		goto err;
2b6dd600dd72573 Pavel Skripkin      2021-12-30  247  
33f35429fc49c09 Gerd Hoffmann       2018-09-11  248  	ubuf->pages = kmalloc_array(ubuf->pagecount, sizeof(*ubuf->pages),
fbb0de795078190 Gerd Hoffmann       2018-08-27  249  				    GFP_KERNEL);
fbb0de795078190 Gerd Hoffmann       2018-08-27  250  	if (!ubuf->pages) {
fbb0de795078190 Gerd Hoffmann       2018-08-27  251  		ret = -ENOMEM;
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  252  		goto err;
fbb0de795078190 Gerd Hoffmann       2018-08-27  253  	}
fbb0de795078190 Gerd Hoffmann       2018-08-27  254  
fbb0de795078190 Gerd Hoffmann       2018-08-27  255  	pgbuf = 0;
fbb0de795078190 Gerd Hoffmann       2018-08-27  256  	for (i = 0; i < head->count; i++) {
7a1c67d78094236 Gerd Hoffmann       2018-09-11  257  		ret = -EBADFD;
fbb0de795078190 Gerd Hoffmann       2018-08-27  258  		memfd = fget(list[i].memfd);
fbb0de795078190 Gerd Hoffmann       2018-08-27  259  		if (!memfd)
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  260  			goto err;
ff58105a47ede2e Al Viro             2022-08-20  261  		mapping = memfd->f_mapping;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  262  		if (!shmem_mapping(mapping) && !is_file_hugepages(memfd))
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  263  			goto err;
fbb0de795078190 Gerd Hoffmann       2018-08-27  264  		seals = memfd_fcntl(memfd, F_GET_SEALS, 0);
7a1c67d78094236 Gerd Hoffmann       2018-09-11  265  		if (seals == -EINVAL)
7a1c67d78094236 Gerd Hoffmann       2018-09-11  266  			goto err;
7a1c67d78094236 Gerd Hoffmann       2018-09-11  267  		ret = -EINVAL;
7a1c67d78094236 Gerd Hoffmann       2018-09-11  268  		if ((seals & SEALS_WANTED) != SEALS_WANTED ||
fbb0de795078190 Gerd Hoffmann       2018-08-27  269  		    (seals & SEALS_DENIED) != 0)
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  270  			goto err;
fbb0de795078190 Gerd Hoffmann       2018-08-27  271  		pgoff = list[i].offset >> PAGE_SHIFT;
fbb0de795078190 Gerd Hoffmann       2018-08-27  272  		pgcnt = list[i].size   >> PAGE_SHIFT;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  273  		if (is_file_hugepages(memfd)) {
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  274  			if (!ubuf->subpgoff) {
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  275  				ubuf->subpgoff = kmalloc_array(ubuf->pagecount,
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  276  							       sizeof(*ubuf->subpgoff),
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  277  							       GFP_KERNEL);
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  278  				if (!ubuf->subpgoff) {
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  279  					ret = -ENOMEM;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  280  					goto err;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  281  				}
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  282  			}
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  283  			hpstate = hstate_file(memfd);
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  284  			mapidx = list[i].offset >> huge_page_shift(hpstate);
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  285  			chunkoff = (list[i].offset &
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  286  				    ~huge_page_mask(hpstate)) >> PAGE_SHIFT;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  287  			maxchunks = huge_page_size(hpstate) >> PAGE_SHIFT;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  288  		}

chunkoff and maxchunks not set on else path.

fbb0de795078190 Gerd Hoffmann       2018-08-27  289  		for (pgidx = 0; pgidx < pgcnt; pgidx++) {
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  290  			if (is_file_hugepages(memfd)) {
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  291  				if (!hpage) {
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  292  					hpage = find_get_page_flags(mapping, mapidx,
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  293  								    FGP_ACCESSED);
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  294  					if (!hpage) {
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  295  						ret = -EINVAL;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  296  						goto err;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  297  					}
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  298  				}
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  299  				get_page(hpage);
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  300  				ubuf->pages[pgbuf] = hpage;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17 @301  				ubuf->subpgoff[pgbuf++] = chunkoff << PAGE_SHIFT;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17 @302  				if (++chunkoff == maxchunks) {
                                                                                    ^^^^^^^^^^^^^^^^^^^^^^^

8129f43f2b3f79f Vivek Kasireddy     2023-11-17  303  					put_page(hpage);
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  304  					hpage = NULL;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  305  					chunkoff = 0;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  306  					mapidx++;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  307  				}
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  308  			} else {
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  309  				mapidx = pgoff + pgidx;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  310  				page = shmem_read_mapping_page(mapping, mapidx);
fbb0de795078190 Gerd Hoffmann       2018-08-27  311  				if (IS_ERR(page)) {
fbb0de795078190 Gerd Hoffmann       2018-08-27  312  					ret = PTR_ERR(page);
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  313  					goto err;
fbb0de795078190 Gerd Hoffmann       2018-08-27  314  				}
fbb0de795078190 Gerd Hoffmann       2018-08-27  315  				ubuf->pages[pgbuf++] = page;
fbb0de795078190 Gerd Hoffmann       2018-08-27  316  			}
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  317  		}
fbb0de795078190 Gerd Hoffmann       2018-08-27  318  		fput(memfd);
fbb0de795078190 Gerd Hoffmann       2018-08-27  319  		memfd = NULL;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  320  		if (hpage) {
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  321  			put_page(hpage);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

