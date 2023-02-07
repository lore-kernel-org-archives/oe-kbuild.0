Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE1D20E8;
	Tue,  7 Feb 2023 08:03:13 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso12532657wms.0;
        Tue, 07 Feb 2023 00:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h8Fo/rCSoO5B3dO/TraHF/Ewq1zEZS6ueUNW5PL1NVo=;
        b=nvJYeCCwwXa/iPihaau1177ZExjMysWH1KDEGe6XaL8oRtXrVsqhAukMZWZrerwG7G
         rpSNBQkFR3vfcays7jEmShxOYJefIj5fIjfKVtMb9N8qtB9z0fibudCN4DTNMbS5FADS
         aqeWBu+uWmzBcVpucTAsgQoI3DXywkJ57av1tRzQ0ikoaFgVqmH2pG91dS6GNGv+hEMF
         3CiTruVkJlX2ITJ3XwD92Vc4E9t3R5bdsRSc3QDoWedEKKwMtnqUFLMLACjAaVXDtqRu
         GlGCAG6RtRPaU1BbhZ0z2FEKMnotmsijGmCNmQ3Fqs7XWVlMp7vXpLxLFrgGqDRx7jSr
         mGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8Fo/rCSoO5B3dO/TraHF/Ewq1zEZS6ueUNW5PL1NVo=;
        b=pNIRVZfAUwInkpKniXRedSjdq5WBGjQC03C7FEjpZ1UEchPhd/p5JcVqq3NVeHpdf2
         EQeP7egXu/7yl+C4QKiW751z3o83yuYhiUHU+M6b83yPdY54WqhbxI6alFPu47NFxPD4
         AxsLPJhjxWO9R9pa5O7tuV4250Q6UaCaE68fFE/oE1aWwbn6ahbcjIQl6Tkvk9r2fl7j
         MN64zjYxxMgx9w6QdD+32cZXedtlEJLhyJChAe78edmsrSiDZiEqxW89Qq0OPqpt8z97
         nlFBLiWqxnCnHKoq3nX4IMikbgFjBiZ88B3w1HGyQ1D/09J1QJ341J4MSFqfv2mKxdvG
         qASw==
X-Gm-Message-State: AO0yUKWq0d0g/MVr/wrcMn/RV08MONlkZ7TntSa8h7QXLGUmk9s/Xb+2
	GSafmlElo/GgfZtx+MhPl3q6CsijQlUhvcyF
X-Google-Smtp-Source: AK7set8IRQ93d6Encc0Zv1jH2b6tzYJsgZlGP02itsR5AgLShBbs40ZOJ5VEF94FKV+nQOPF3v2afA==
X-Received: by 2002:a05:600c:1613:b0:3df:b5ae:5289 with SMTP id m19-20020a05600c161300b003dfb5ae5289mr2195856wmn.8.1675756991262;
        Tue, 07 Feb 2023 00:03:11 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k10-20020a5d6e8a000000b002bdda9856b5sm10626509wrz.50.2023.02.07.00.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 00:03:10 -0800 (PST)
Date: Tue, 7 Feb 2023 11:03:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Bob Pearson <rpearsonhpe@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH for-next v7 6/6] RDMA/rxe: Replace rxe_map and
 rxe_phys_buf by xarray
Message-ID: <202302071553.dxgzoPxM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119235936.19728-7-rpearsonhpe@gmail.com>
Message-ID: <20230207080307.Ae1qpYDgwBS_VmtHrqf6VQFESileimb0RywPfSULYy8@z>

Hi Bob,

url:    https://github.com/intel-lab-lkp/linux/commits/Bob-Pearson/RDMA-rxe-Cleanup-mr_check_range/20230120-080520
base:   1ec82317a1daac78c04b0c15af89018ccf9fa2b7
patch link:    https://lore.kernel.org/r/20230119235936.19728-7-rpearsonhpe%40gmail.com
patch subject: [PATCH for-next v7 6/6] RDMA/rxe: Replace rxe_map and rxe_phys_buf by xarray
config: s390-randconfig-m041-20230206 (https://download.01.org/0day-ci/archive/20230207/202302071553.dxgzoPxM-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/infiniband/sw/rxe/rxe_mr.c:130 rxe_mr_fill_pages_from_sgt() warn: inconsistent returns '&((&xas)->xa)->xa_lock'.

vim +130 drivers/infiniband/sw/rxe/rxe_mr.c

3222da9099ca42 Bob Pearson 2023-01-19   99  static int rxe_mr_fill_pages_from_sgt(struct rxe_mr *mr, struct sg_table *sgt)
3222da9099ca42 Bob Pearson 2023-01-19  100  {
3222da9099ca42 Bob Pearson 2023-01-19  101  	XA_STATE(xas, &mr->page_list, 0);
3222da9099ca42 Bob Pearson 2023-01-19  102  	struct sg_page_iter sg_iter;
3222da9099ca42 Bob Pearson 2023-01-19  103  	struct page *page;
3222da9099ca42 Bob Pearson 2023-01-19  104  	bool persistent = !!(mr->access & IB_ACCESS_FLUSH_PERSISTENT);
3222da9099ca42 Bob Pearson 2023-01-19  105  
3222da9099ca42 Bob Pearson 2023-01-19  106  	__sg_page_iter_start(&sg_iter, sgt->sgl, sgt->orig_nents, 0);
3222da9099ca42 Bob Pearson 2023-01-19  107  	if (!__sg_page_iter_next(&sg_iter))
3222da9099ca42 Bob Pearson 2023-01-19  108  		return 0;
3222da9099ca42 Bob Pearson 2023-01-19  109  
3222da9099ca42 Bob Pearson 2023-01-19  110  	do {
3222da9099ca42 Bob Pearson 2023-01-19  111  		xas_lock(&xas);
3222da9099ca42 Bob Pearson 2023-01-19  112  		while (true) {
3222da9099ca42 Bob Pearson 2023-01-19  113  			page = sg_page_iter_page(&sg_iter);
3222da9099ca42 Bob Pearson 2023-01-19  114  
3222da9099ca42 Bob Pearson 2023-01-19  115  			if (persistent && !is_pmem_page(page)) {
3222da9099ca42 Bob Pearson 2023-01-19  116  				rxe_dbg_mr(mr, "Page can't be persistent\n");
3222da9099ca42 Bob Pearson 2023-01-19  117  				return -EINVAL;

xas_unlock(&xas);

3222da9099ca42 Bob Pearson 2023-01-19  118  			}
3222da9099ca42 Bob Pearson 2023-01-19  119  
3222da9099ca42 Bob Pearson 2023-01-19  120  			xas_store(&xas, page);
3222da9099ca42 Bob Pearson 2023-01-19  121  			if (xas_error(&xas))
3222da9099ca42 Bob Pearson 2023-01-19  122  				break;
3222da9099ca42 Bob Pearson 2023-01-19  123  			xas_next(&xas);
3222da9099ca42 Bob Pearson 2023-01-19  124  			if (!__sg_page_iter_next(&sg_iter))
3222da9099ca42 Bob Pearson 2023-01-19  125  				break;
3222da9099ca42 Bob Pearson 2023-01-19  126  		}
3222da9099ca42 Bob Pearson 2023-01-19  127  		xas_unlock(&xas);
3222da9099ca42 Bob Pearson 2023-01-19  128  	} while (xas_nomem(&xas, GFP_KERNEL));
3222da9099ca42 Bob Pearson 2023-01-19  129  
3222da9099ca42 Bob Pearson 2023-01-19 @130  	return xas_error(&xas);
3222da9099ca42 Bob Pearson 2023-01-19  131  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

