Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09687F8;
	Sat, 18 Mar 2023 07:39:11 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id v1so96646wrv.1;
        Sat, 18 Mar 2023 00:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679125150;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WGRUJKIQoHXkQjwwVjpDxkiO2kTUlbFAUX9F4IQp8wc=;
        b=U5r8Da9v/kmeiC5DkFc/WbYGFkamnIlb+3lI4bKcnlqCtddsJmluBOY/uM+etn1PRN
         WW/6IhiLo8hX3o8Guv/Ymqo+50NsmQZ/ENkkZFu6bmK3tYyj2jwfaGEi+SwC6tTidmkk
         RyfGGcbpmW4RsqBmj5ZWB89+Keaj6/IzUysS6MOoFUON2fI99PPKFeTiqJvW6+iafy9b
         1tZ+UA4V8c3whXe2dvtHSpcA6XrIAiFsbdUlAqH0I8JyKLKlUQH9y3qSV41ONXPQLM3U
         7eKEXHXtsI8Mt9ymSyGQSU0vf3ZCDDhdQFK+rtPS0iKcjMuaTqbO1w3qFGQdNcwGt16w
         J+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679125150;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WGRUJKIQoHXkQjwwVjpDxkiO2kTUlbFAUX9F4IQp8wc=;
        b=rMFjFwx9FzgLdEA60W7aUC3h3YRvtkACYSzRDwTUaeZsObucIlXZ1krUF5hsbGP+MM
         NQn1P+66B7+ZBBZI4DqTGsPbxMIVMIIruIKCT9pxTME4U9IcbutK2A2OaxoPGn0xTyh9
         enSUhm9doRkS/rrpRcVkcCkoY2gBXz64NFtZmEjsPd7RSpmGt4KpVDSnias4F2/+pzBR
         oXRr731FtM6uHhq6HUlOdgznegMHI5LvnwRKCXH2/xl8FH6NRf8Y2z3f/8SBo6Uf0WB9
         RXNatw7Wgt5p7l3Q6tiV06y93P473bjdn+jVegwVEvg4EncCEs931U8RMDPxK8UR6ejp
         WJFA==
X-Gm-Message-State: AO0yUKVy155BerfFzk9ro1F7WIGKlaShEbxTocqk0aRK+XstAxZdgX77
	9WiW8NaH8ji0SUvr3PKOBeGYtF/gipI=
X-Google-Smtp-Source: AK7set+1z5YUW0paK8ARmaDE+tXL2FQKsLmZfk3kcP4Nhqhigz+Xs38VSbe0zhCSYL0tNA6RMGPBnA==
X-Received: by 2002:a5d:470f:0:b0:2d4:53d7:ea7f with SMTP id y15-20020a5d470f000000b002d453d7ea7fmr1941898wrq.3.1679125149625;
        Sat, 18 Mar 2023 00:39:09 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f9-20020adff989000000b002cea392f000sm3666303wrr.69.2023.03.18.00.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 00:39:09 -0700 (PDT)
Date: Sat, 18 Mar 2023 10:39:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 3570/3780] io_uring/kbuf.c:221
 __io_remove_buffers() warn: variable dereferenced before check
 'bl->buf_ring' (see line 219)
Message-ID: <76b6e52e-884c-4292-8c32-e4baa84d1508@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6f72958a49f68553f2b6ff713e8c8e51a34c1e1e
commit: 5d04a480457850f58b9d3ff87b7e766674eac4c4 [3570/3780] io_uring: add support for user mapped provided buffer ring
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230316/202303161837.uG7iAfji-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303161837.uG7iAfji-lkp@intel.com/

smatch warnings:
io_uring/kbuf.c:221 __io_remove_buffers() warn: variable dereferenced before check 'bl->buf_ring' (see line 219)

vim +221 io_uring/kbuf.c

3b77495a97239f Jens Axboe 2022-06-13  209  static int __io_remove_buffers(struct io_ring_ctx *ctx,
3b77495a97239f Jens Axboe 2022-06-13  210  			       struct io_buffer_list *bl, unsigned nbufs)
3b77495a97239f Jens Axboe 2022-06-13  211  {
3b77495a97239f Jens Axboe 2022-06-13  212  	unsigned i = 0;
3b77495a97239f Jens Axboe 2022-06-13  213  
3b77495a97239f Jens Axboe 2022-06-13  214  	/* shouldn't happen */
3b77495a97239f Jens Axboe 2022-06-13  215  	if (!nbufs)
3b77495a97239f Jens Axboe 2022-06-13  216  		return 0;
3b77495a97239f Jens Axboe 2022-06-13  217  
5d04a480457850 Jens Axboe 2023-03-14  218  	if (bl->is_mapped) {
5d04a480457850 Jens Axboe 2023-03-14 @219  		i = bl->buf_ring->tail - bl->head;
                                                            ^^^^^^^^^^^^^^
Dereference.

5d04a480457850 Jens Axboe 2023-03-14  220  		if (bl->is_mmap) {
5d04a480457850 Jens Axboe 2023-03-14 @221  			if (bl->buf_ring) {
                                                                    ^^^^^^^^^^^^
Checked too late.

5d04a480457850 Jens Axboe 2023-03-14  222  				struct page *page;
5d04a480457850 Jens Axboe 2023-03-14  223  
5d04a480457850 Jens Axboe 2023-03-14  224  				page = virt_to_head_page(bl->buf_ring);
5d04a480457850 Jens Axboe 2023-03-14  225  				if (put_page_testzero(page))
5d04a480457850 Jens Axboe 2023-03-14  226  					free_compound_page(page);
5d04a480457850 Jens Axboe 2023-03-14  227  				bl->buf_ring = NULL;
5d04a480457850 Jens Axboe 2023-03-14  228  			}
5d04a480457850 Jens Axboe 2023-03-14  229  			bl->is_mmap = 0;
5d04a480457850 Jens Axboe 2023-03-14  230  		} else if (bl->buf_nr_pages) {
3b77495a97239f Jens Axboe 2022-06-13  231  			int j;
3b77495a97239f Jens Axboe 2022-06-13  232  
3b77495a97239f Jens Axboe 2022-06-13  233  			for (j = 0; j < bl->buf_nr_pages; j++)
3b77495a97239f Jens Axboe 2022-06-13  234  				unpin_user_page(bl->buf_pages[j]);
3b77495a97239f Jens Axboe 2022-06-13  235  			kvfree(bl->buf_pages);
3b77495a97239f Jens Axboe 2022-06-13  236  			bl->buf_pages = NULL;
3b77495a97239f Jens Axboe 2022-06-13  237  			bl->buf_nr_pages = 0;
5d04a480457850 Jens Axboe 2023-03-14  238  		}
3b77495a97239f Jens Axboe 2022-06-13  239  		/* make sure it's seen as empty */
3b77495a97239f Jens Axboe 2022-06-13  240  		INIT_LIST_HEAD(&bl->buf_list);
fe19437061eda5 Jens Axboe 2023-03-14  241  		bl->is_mapped = 0;
3b77495a97239f Jens Axboe 2022-06-13  242  		return i;
3b77495a97239f Jens Axboe 2022-06-13  243  	}
3b77495a97239f Jens Axboe 2022-06-13  244  
3b77495a97239f Jens Axboe 2022-06-13  245  	/* the head kbuf is the list itself */
3b77495a97239f Jens Axboe 2022-06-13  246  	while (!list_empty(&bl->buf_list)) {
3b77495a97239f Jens Axboe 2022-06-13  247  		struct io_buffer *nxt;
3b77495a97239f Jens Axboe 2022-06-13  248  
3b77495a97239f Jens Axboe 2022-06-13  249  		nxt = list_first_entry(&bl->buf_list, struct io_buffer, list);
3b77495a97239f Jens Axboe 2022-06-13  250  		list_del(&nxt->list);
3b77495a97239f Jens Axboe 2022-06-13  251  		if (++i == nbufs)
3b77495a97239f Jens Axboe 2022-06-13  252  			return i;
3b77495a97239f Jens Axboe 2022-06-13  253  		cond_resched();
3b77495a97239f Jens Axboe 2022-06-13  254  	}
3b77495a97239f Jens Axboe 2022-06-13  255  	i++;
3b77495a97239f Jens Axboe 2022-06-13  256  
3b77495a97239f Jens Axboe 2022-06-13  257  	return i;
3b77495a97239f Jens Axboe 2022-06-13  258  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

