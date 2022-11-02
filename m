Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB41A801;
	Wed,  2 Nov 2022 12:07:40 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id v1so24194710wrt.11;
        Wed, 02 Nov 2022 05:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NZpIsjeRmfD55ASVm+xB+CPv6och53PdTFzo3cxhJc8=;
        b=D+ndrzYAYNin7iIUAe+j8B3uiSTiusdQyOwKBgswdIMqpzdr/rJfvRZoEromgGTw1W
         HKBrVzvlsDjgmggMFdjzjMIfJELepZRSualNW2Z5XGCtngS6P6oDbuVOaF60UtJD9YvP
         uj3MDgduN/mnTX3GUFEGyAQWLuQb9V3Gy2Ek7yTqk/23NHYcibAJFz8cNLClNOuFleg7
         kTr1Gh73z0PLTY8pH5Jk9pNjECLHj+6H3h0cbvLwGDzTBqSxwrq+7ql0EbIa8gfgGhNi
         d6ae6VqIVz0ozSvV7cK42OZuZ9HXzbF97tDL7FRpVBSNw9/m//TM19WrIG2aivZxF0ys
         5qcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NZpIsjeRmfD55ASVm+xB+CPv6och53PdTFzo3cxhJc8=;
        b=4Fl7ljUKoupXboh1g8DntvSZpGtD1N8dAFlbP/1w+PwnvYYTcsl/p5QebodCg4F6A2
         sUUlSvng1E4UWiVMTN5W5p7PnncOYeSPgA4riX/8OZcXJ1ld3RjFTr3mpwGWVM3bAXMz
         uOdhlRjdHmmCs4YpWlAor8vqWDabapzO214fFVuyTuvVBbnCXlWLpzAzHEl6Xk9XmXBA
         d9v2cZSMhsHpRLpSzyJmsK4NpUqSOnqeWbdoqXLDvSyNgQv19S94Sys+Lh3BppxQsvfJ
         HYuMTj0HlLx0n+/3E7v6WgXY29pGFN3CPdtygUZdCUjPUZLr871GSvSTf8dO9mZwzkWm
         G8Wg==
X-Gm-Message-State: ACrzQf2wi3Fk9FnixdCnNOHHGrOle7zDUtrExFLk0IsFAhbdrxbqSZW3
	xxRwB3bFHlGOey6O+A70viar1tmTu38=
X-Google-Smtp-Source: AMsMyM5MudUEYeYRNFTg7vVgFBMycU9oXtNfZrc2QVvmmyAj6YMko4EcjUV9cN9VAHf2y+88WWZYyQ==
X-Received: by 2002:a5d:5551:0:b0:236:c715:59bf with SMTP id g17-20020a5d5551000000b00236c71559bfmr10900537wrw.124.1667390858875;
        Wed, 02 Nov 2022 05:07:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j19-20020a05600c1c1300b003a8434530bbsm2073252wms.13.2022.11.02.05.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 05:07:38 -0700 (PDT)
Date: Wed, 2 Nov 2022 15:07:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-gfx] [PATCH v3] drm/ttm: rework on ttm_resource to use
 size_t type
Message-ID: <202210290451.fwhJxONB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221027091237.983582-1-Amaranath.Somalapuram@amd.com>
Message-ID: <20221102120735.ml87xA4q6CEYJyniP3_WMAGbS6U8-_vUidwkFdcQntM@z>

Hi Somalapuram,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Somalapuram-Amaranath/drm-ttm-rework-on-ttm_resource-to-use-size_t-type/20221027-171605
patch link:    https://lore.kernel.org/r/20221027091237.983582-1-Amaranath.Somalapuram%40amd.com
patch subject: [Intel-gfx] [PATCH v3] drm/ttm: rework on ttm_resource to use size_t type
config: i386-randconfig-m021
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/gpu/drm/ttm/ttm_bo_util.c:176 ttm_bo_move_memcpy() error: we previously assumed 'ttm' could be null (see line 153)

vim +/ttm +176 drivers/gpu/drm/ttm/ttm_bo_util.c

ba4e7d973dd09b Thomas Hellstrom      2009-06-10  131  int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
3e98d829ad0a59 Roger He              2017-12-08  132  		       struct ttm_operation_ctx *ctx,
3bf3710e3718a5 Thomas Hellström      2021-06-02  133  		       struct ttm_resource *dst_mem)
ba4e7d973dd09b Thomas Hellstrom      2009-06-10  134  {
8af8a109b34fa8 Christian König       2020-10-01  135  	struct ttm_device *bdev = bo->bdev;
3bf3710e3718a5 Thomas Hellström      2021-06-02  136  	struct ttm_resource_manager *dst_man =
3bf3710e3718a5 Thomas Hellström      2021-06-02  137  		ttm_manager_type(bo->bdev, dst_mem->mem_type);
ba4e7d973dd09b Thomas Hellstrom      2009-06-10  138  	struct ttm_tt *ttm = bo->ttm;
3bf3710e3718a5 Thomas Hellström      2021-06-02  139  	struct ttm_resource *src_mem = bo->resource;
4d8f68548e982e Christian König       2022-02-17  140  	struct ttm_resource_manager *src_man;
3bf3710e3718a5 Thomas Hellström      2021-06-02  141  	union {
3bf3710e3718a5 Thomas Hellström      2021-06-02  142  		struct ttm_kmap_iter_tt tt;
3bf3710e3718a5 Thomas Hellström      2021-06-02  143  		struct ttm_kmap_iter_linear_io io;
3bf3710e3718a5 Thomas Hellström      2021-06-02  144  	} _dst_iter, _src_iter;
3bf3710e3718a5 Thomas Hellström      2021-06-02  145  	struct ttm_kmap_iter *dst_iter, *src_iter;
669076334bfa79 Thomas Hellström      2021-08-13  146  	bool clear;
3bf3710e3718a5 Thomas Hellström      2021-06-02  147  	int ret = 0;
3bf3710e3718a5 Thomas Hellström      2021-06-02  148  
4d8f68548e982e Christian König       2022-02-17  149  	if (!src_mem)
4d8f68548e982e Christian König       2022-02-17  150  		return 0;
4d8f68548e982e Christian König       2022-02-17  151  
4d8f68548e982e Christian König       2022-02-17  152  	src_man = ttm_manager_type(bdev, src_mem->mem_type);
43d46f0b78bba5 Matthew Auld          2021-09-29 @153  	if (ttm && ((ttm->page_flags & TTM_TT_FLAG_SWAPPED) ||
3bf3710e3718a5 Thomas Hellström      2021-06-02  154  		    dst_man->use_tt)) {
0a667b500703db Dave Airlie           2020-08-25  155  		ret = ttm_tt_populate(bdev, ttm, ctx);
da95c788ef0c64 Thomas Hellstrom      2013-10-30  156  		if (ret)
3bf3710e3718a5 Thomas Hellström      2021-06-02  157  			return ret;
b1e5f172325547 Jerome Glisse         2011-11-02  158  	}
b1e5f172325547 Jerome Glisse         2011-11-02  159  
3bf3710e3718a5 Thomas Hellström      2021-06-02  160  	dst_iter = ttm_kmap_iter_linear_io_init(&_dst_iter.io, bdev, dst_mem);
3bf3710e3718a5 Thomas Hellström      2021-06-02  161  	if (PTR_ERR(dst_iter) == -EINVAL && dst_man->use_tt)
3bf3710e3718a5 Thomas Hellström      2021-06-02  162  		dst_iter = ttm_kmap_iter_tt_init(&_dst_iter.tt, bo->ttm);
3bf3710e3718a5 Thomas Hellström      2021-06-02  163  	if (IS_ERR(dst_iter))
3bf3710e3718a5 Thomas Hellström      2021-06-02  164  		return PTR_ERR(dst_iter);
3bf3710e3718a5 Thomas Hellström      2021-06-02  165  
3bf3710e3718a5 Thomas Hellström      2021-06-02  166  	src_iter = ttm_kmap_iter_linear_io_init(&_src_iter.io, bdev, src_mem);
3bf3710e3718a5 Thomas Hellström      2021-06-02  167  	if (PTR_ERR(src_iter) == -EINVAL && src_man->use_tt)
3bf3710e3718a5 Thomas Hellström      2021-06-02  168  		src_iter = ttm_kmap_iter_tt_init(&_src_iter.tt, bo->ttm);
3bf3710e3718a5 Thomas Hellström      2021-06-02  169  	if (IS_ERR(src_iter)) {
3bf3710e3718a5 Thomas Hellström      2021-06-02  170  		ret = PTR_ERR(src_iter);
3bf3710e3718a5 Thomas Hellström      2021-06-02  171  		goto out_src_iter;
bfa3357ef9abc9 Christian König       2021-04-15  172  	}
bfa3357ef9abc9 Christian König       2021-04-15  173  
669076334bfa79 Thomas Hellström      2021-08-13  174  	clear = src_iter->ops->maps_tt && (!ttm || !ttm_tt_is_populated(ttm));
1176d15f0f6e55 Dave Airlie           2021-10-11  175  	if (!(clear && ttm && !(ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC)))
                                                                       ^^^
The ! makes the code hard to read, for a human (but easy for a bot).
Assume "ttm" is NULL.  That means the condition is true.

43cf1f344f0840 Somalapuram Amaranath 2022-10-27 @176  		ttm_move_memcpy(clear, ttm->num_pages, dst_iter, src_iter);
                                                                                       ^^^^^^^^^^^^^^^
NULL dereference.

ba4e7d973dd09b Thomas Hellstrom      2009-06-10  177  
3bf3710e3718a5 Thomas Hellström      2021-06-02  178  	if (!src_iter->ops->maps_tt)
efcefc7127290e Thomas Hellström      2021-08-31  179  		ttm_kmap_iter_linear_io_fini(&_src_iter.io, bdev, src_mem);
efcefc7127290e Thomas Hellström      2021-08-31  180  	ttm_bo_move_sync_cleanup(bo, dst_mem);
efcefc7127290e Thomas Hellström      2021-08-31  181  
3bf3710e3718a5 Thomas Hellström      2021-06-02  182  out_src_iter:
3bf3710e3718a5 Thomas Hellström      2021-06-02  183  	if (!dst_iter->ops->maps_tt)
3bf3710e3718a5 Thomas Hellström      2021-06-02  184  		ttm_kmap_iter_linear_io_fini(&_dst_iter.io, bdev, dst_mem);
ba4e7d973dd09b Thomas Hellstrom      2009-06-10  185  
ba4e7d973dd09b Thomas Hellstrom      2009-06-10  186  	return ret;
ba4e7d973dd09b Thomas Hellstrom      2009-06-10  187  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

