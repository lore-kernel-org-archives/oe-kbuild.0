Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D2E7C;
	Fri, 24 Feb 2023 07:11:49 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id bo30so12345841wrb.0;
        Thu, 23 Feb 2023 23:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h3LRZ8mvAO6quO+JJpd60L6H+aiSKf01chUtzcmVmaA=;
        b=C8jI72GdyTZ62v5gmRgKDUqc0irV/9Oxs2vXimY4iI6OSenIMYg4k2vch+om9IFSjb
         nMFX7yT91kn7gV2dyqFAnISPFMPbVX53FyinAAoUKMOnvZFjEdhsmh4NXlEEgqed+zuW
         dd9ph3/wbpROYsaf9SbP/oQNnJByWoxlN1XmNxax/fAYqshiTsP3qiDSqf9eRKQ/b85P
         pLhifXd/QoIlQtCD4Z2yWnhd+SGFPimKSgNkH29uLiTWcyvIk+yOLH+eb5aXyVK0UxwQ
         44o5AUJJHimraW+ZPwmdnqdS4PbJeS44U+RQLS2VFeml73pplPmcvRtDb9xkuXK/gr7W
         QBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h3LRZ8mvAO6quO+JJpd60L6H+aiSKf01chUtzcmVmaA=;
        b=YTetuJsJtVnXOIlRHqlXnyDTaV+zz4nO/s/wKNhVqxcxaP/CXNU3SE7E7bPCXNGGfN
         AZJLnC0223j/Q/SWJSpzAKYY/GbrSfQ0HON8WuOjE4WU6dK/Gvz449y+QDy5uuG9SCmi
         HW+2Wv9wDd7RkQRjvLSEkqIwaowblQIPTP9EiUPScpXSMYhdqLN+vx4z5jhNpRTpXgQj
         mhlDlLMWazUDxS8g8NBC5TsPlDIPFcwSjbLzYxvvfdzh01xrpINY0RD3ahwDsMW8W8AD
         4UBPkfw5PWShAcIHB+MfA23kwxGLd2B/v1Ma7489WpmmHlHIOK5Ox+IYvVYXFVKSrk5X
         I3KQ==
X-Gm-Message-State: AO0yUKUTQ9eg/hQ0MextoMySq0ruuyfZ9g0v3hK77F3hL3IxODjSBaLu
	Fw1nUNhi6wi8AZ2/r+q1H+1gAnbEdH8=
X-Google-Smtp-Source: AK7set9n0NDG4ZKwIhYLJ3nQMyGaNk6tcwQ0oORSvb7bKAJUC4Go/ZArnVn9OE7HwhRipK3sXYW8DA==
X-Received: by 2002:adf:f344:0:b0:2c7:1740:629b with SMTP id e4-20020adff344000000b002c71740629bmr2674969wrp.13.1677222707669;
        Thu, 23 Feb 2023 23:11:47 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l7-20020a5d5267000000b002c71a32394dsm1571657wrc.64.2023.02.23.23.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 23:11:47 -0800 (PST)
Date: Fri, 24 Feb 2023 10:11:43 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>
Subject: [linux-next:master 13574/13939] io_uring/rsrc.c:1262
 io_sqe_buffer_register() error: uninitialized symbol 'folio'.
Message-ID: <202302241432.YML1CD5C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230224071143.lI3bRPWkBysFQcjm9uSbiWnYyLloi2fVl8BLBzqzNHI@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4d6d7ce9baaf9e67a85a53afc69a36af716f7670
commit: 57bebf807e2abcf87d96b9de1266104ee2d8fc2f [13574/13939] io_uring/rsrc: optimise registered huge pages
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230224/202302241432.YML1CD5C-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302241432.YML1CD5C-lkp@intel.com/

smatch warnings:
io_uring/rsrc.c:1262 io_sqe_buffer_register() error: uninitialized symbol 'folio'.

vim +/folio +1262 io_uring/rsrc.c

73572984481907 Jens Axboe        2022-06-13  1204  static int io_sqe_buffer_register(struct io_ring_ctx *ctx, struct iovec *iov,
73572984481907 Jens Axboe        2022-06-13  1205  				  struct io_mapped_ubuf **pimu,
73572984481907 Jens Axboe        2022-06-13  1206  				  struct page **last_hpage)
73572984481907 Jens Axboe        2022-06-13  1207  {
73572984481907 Jens Axboe        2022-06-13  1208  	struct io_mapped_ubuf *imu = NULL;
73572984481907 Jens Axboe        2022-06-13  1209  	struct page **pages = NULL;
73572984481907 Jens Axboe        2022-06-13  1210  	unsigned long off;
73572984481907 Jens Axboe        2022-06-13  1211  	size_t size;
73572984481907 Jens Axboe        2022-06-13  1212  	int ret, nr_pages, i;
57bebf807e2abc Pavel Begunkov    2023-02-22  1213  	struct folio *folio;
73572984481907 Jens Axboe        2022-06-13  1214  
73572984481907 Jens Axboe        2022-06-13  1215  	*pimu = ctx->dummy_ubuf;
5ff4fdffad483d Pavel Begunkov    2022-06-15  1216  	if (!iov->iov_base)
73572984481907 Jens Axboe        2022-06-13  1217  		return 0;
73572984481907 Jens Axboe        2022-06-13  1218  
73572984481907 Jens Axboe        2022-06-13  1219  	ret = -ENOMEM;
73572984481907 Jens Axboe        2022-06-13  1220  	pages = io_pin_pages((unsigned long) iov->iov_base, iov->iov_len,
73572984481907 Jens Axboe        2022-06-13  1221  				&nr_pages);
73572984481907 Jens Axboe        2022-06-13  1222  	if (IS_ERR(pages)) {
73572984481907 Jens Axboe        2022-06-13  1223  		ret = PTR_ERR(pages);
73572984481907 Jens Axboe        2022-06-13  1224  		pages = NULL;
73572984481907 Jens Axboe        2022-06-13  1225  		goto done;
73572984481907 Jens Axboe        2022-06-13  1226  	}
73572984481907 Jens Axboe        2022-06-13  1227  
57bebf807e2abc Pavel Begunkov    2023-02-22  1228  	/* If it's a huge page, try to coalesce them into a single bvec entry */
57bebf807e2abc Pavel Begunkov    2023-02-22  1229  	if (nr_pages > 1) {
57bebf807e2abc Pavel Begunkov    2023-02-22  1230  		folio = page_folio(pages[0]);
57bebf807e2abc Pavel Begunkov    2023-02-22  1231  		for (i = 1; i < nr_pages; i++) {
57bebf807e2abc Pavel Begunkov    2023-02-22  1232  			if (page_folio(pages[i]) != folio) {
57bebf807e2abc Pavel Begunkov    2023-02-22  1233  				folio = NULL;
57bebf807e2abc Pavel Begunkov    2023-02-22  1234  				break;
57bebf807e2abc Pavel Begunkov    2023-02-22  1235  			}
57bebf807e2abc Pavel Begunkov    2023-02-22  1236  		}
57bebf807e2abc Pavel Begunkov    2023-02-22  1237  		if (folio) {
57bebf807e2abc Pavel Begunkov    2023-02-22  1238  			folio_put_refs(folio, nr_pages - 1);
57bebf807e2abc Pavel Begunkov    2023-02-22  1239  			nr_pages = 1;
57bebf807e2abc Pavel Begunkov    2023-02-22  1240  		}
57bebf807e2abc Pavel Begunkov    2023-02-22  1241  	}

folio not initialized on else path.

57bebf807e2abc Pavel Begunkov    2023-02-22  1242  
73572984481907 Jens Axboe        2022-06-13  1243  	imu = kvmalloc(struct_size(imu, bvec, nr_pages), GFP_KERNEL);
73572984481907 Jens Axboe        2022-06-13  1244  	if (!imu)
73572984481907 Jens Axboe        2022-06-13  1245  		goto done;
73572984481907 Jens Axboe        2022-06-13  1246  
73572984481907 Jens Axboe        2022-06-13  1247  	ret = io_buffer_account_pin(ctx, pages, nr_pages, imu, last_hpage);
73572984481907 Jens Axboe        2022-06-13  1248  	if (ret) {
73572984481907 Jens Axboe        2022-06-13  1249  		unpin_user_pages(pages, nr_pages);
73572984481907 Jens Axboe        2022-06-13  1250  		goto done;
73572984481907 Jens Axboe        2022-06-13  1251  	}
73572984481907 Jens Axboe        2022-06-13  1252  
73572984481907 Jens Axboe        2022-06-13  1253  	off = (unsigned long) iov->iov_base & ~PAGE_MASK;
73572984481907 Jens Axboe        2022-06-13  1254  	size = iov->iov_len;
57bebf807e2abc Pavel Begunkov    2023-02-22  1255  	/* store original address for later verification */
57bebf807e2abc Pavel Begunkov    2023-02-22  1256  	imu->ubuf = (unsigned long) iov->iov_base;
57bebf807e2abc Pavel Begunkov    2023-02-22  1257  	imu->ubuf_end = imu->ubuf + iov->iov_len;
57bebf807e2abc Pavel Begunkov    2023-02-22  1258  	imu->nr_bvecs = nr_pages;
57bebf807e2abc Pavel Begunkov    2023-02-22  1259  	*pimu = imu;
57bebf807e2abc Pavel Begunkov    2023-02-22  1260  	ret = 0;
57bebf807e2abc Pavel Begunkov    2023-02-22  1261  
57bebf807e2abc Pavel Begunkov    2023-02-22 @1262  	if (folio) {
57bebf807e2abc Pavel Begunkov    2023-02-22  1263  		bvec_set_page(&imu->bvec[0], pages[0], size, off);
57bebf807e2abc Pavel Begunkov    2023-02-22  1264  		goto done;
57bebf807e2abc Pavel Begunkov    2023-02-22  1265  	}
73572984481907 Jens Axboe        2022-06-13  1266  	for (i = 0; i < nr_pages; i++) {
73572984481907 Jens Axboe        2022-06-13  1267  		size_t vec_len;
73572984481907 Jens Axboe        2022-06-13  1268  
73572984481907 Jens Axboe        2022-06-13  1269  		vec_len = min_t(size_t, size, PAGE_SIZE - off);
cc342a21930f0e Christoph Hellwig 2023-02-03  1270  		bvec_set_page(&imu->bvec[i], pages[i], vec_len, off);
73572984481907 Jens Axboe        2022-06-13  1271  		off = 0;
73572984481907 Jens Axboe        2022-06-13  1272  		size -= vec_len;
73572984481907 Jens Axboe        2022-06-13  1273  	}
73572984481907 Jens Axboe        2022-06-13  1274  done:
73572984481907 Jens Axboe        2022-06-13  1275  	if (ret)
73572984481907 Jens Axboe        2022-06-13  1276  		kvfree(imu);
73572984481907 Jens Axboe        2022-06-13  1277  	kvfree(pages);
73572984481907 Jens Axboe        2022-06-13  1278  	return ret;
73572984481907 Jens Axboe        2022-06-13  1279  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

