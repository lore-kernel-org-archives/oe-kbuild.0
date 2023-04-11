Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D0333D5;
	Tue, 11 Apr 2023 08:30:57 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id w21so6565316wra.4;
        Tue, 11 Apr 2023 01:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681201855; x=1683793855;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hQH4HNkXp40XRpw8t+5ZsZc7uONrjh1ogDpDzkk/7Qg=;
        b=Iztq1DQcjwdrh2IOjDut4XzI3WqjoWPc+gWjBCYNxSoM9G/XEwI5aWGREH8MauZIu/
         mvOTM000gIT3MrU87qC5ozeH17FVuN34c4cDfh5AE4DELVOXJIcxa1LF4CUn/qR4LFYl
         hI5vgw6kbGOnhxztoM5hb65SVEpES/kibooMScykB1NPHfMhlad/9pJHyVk1CSoHsxmK
         dTvCjM3RhRLudiQnzhWL7e3a/OtZkRwHWcoLRNsYL2+bMxDHeEqDQsdhjYgQjXQs3e2U
         TXPQ6EJbZWxv32gOxmsWqhmrYGZP6Ujg4C7RXYB1OB/ezpvpEMA21SoYtqGI3jstxQkh
         loog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681201855; x=1683793855;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQH4HNkXp40XRpw8t+5ZsZc7uONrjh1ogDpDzkk/7Qg=;
        b=OVT92ytNftC56OGtbV3THITfS/sIkZZ5seMkQZ5Mw4z4d5QzPpJ1HyngBsvXYN6J6i
         Z9fh6X93Ddx3Di6CZECavlzqtXjqDOD8jVuf3Rq0dUh6j34Yq5rpZBxjOkbRJMh4nzr7
         3FshsZ9uVZeT9iDMUlSue3N2wWXy8+KEC5a3xaDhy2+bNLtuxTrNr+r1weAVURfIqOwG
         rgyQRFeXb8qqAk8Bnhai+rvczHIJDiGM7ZKAEimeH3W7qcqnuz5W4n11vQnEzZ21bvHK
         UdRt815STHuXZsqISZWW2X4H40cGfUYVbFsrSLvbwu9swLpw+6KhWtzS1pUfRUKcdQoU
         2PhQ==
X-Gm-Message-State: AAQBX9fH5GFfWNcE+6nwiXCI432F2viOjL0W1aSjMotQfYghLyImJigF
	KRwMWF+QwcXrprwY093t/+oD6CNjuGQ=
X-Google-Smtp-Source: AKy350Z2mOImdRwCLX0kFYS6t4+tO3zUdddGHmTTBsUDQ28PC9I0cAm4w9UsYmI/W9lbZ7yv7fZofQ==
X-Received: by 2002:a5d:457b:0:b0:2ef:bada:2f04 with SMTP id a27-20020a5d457b000000b002efbada2f04mr6574012wrc.59.1681201855147;
        Tue, 11 Apr 2023 01:30:55 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a16-20020adffad0000000b002efb2d861dasm10614801wrs.77.2023.04.11.01.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 01:30:54 -0700 (PDT)
Date: Tue, 11 Apr 2023 11:30:51 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] mm: introduce defer free for cma
Message-ID: <d85c0c9e-50f4-4916-8011-db605678f81e@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1680864131-4675-1-git-send-email-zhaoyang.huang@unisoc.com>

Hi zhaoyang.huang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/zhaoyang-huang/mm-introduce-defer-free-for-cma/20230407-184459
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/1680864131-4675-1-git-send-email-zhaoyang.huang%40unisoc.com
patch subject: [RFC PATCH] mm: introduce defer free for cma
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230410/202304100654.yAZ2Wukx-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304100654.yAZ2Wukx-lkp@intel.com/

smatch warnings:
mm/cma.c:730 cma_defer_free_scan() warn: inconsistent returns '&cma->lock'.

vim +730 mm/cma.c

7abee7e8d17803 Zhaoyang Huang 2023-04-07  673  static unsigned long cma_defer_free_scan(struct shrinker *shrinker,
7abee7e8d17803 Zhaoyang Huang 2023-04-07  674  					struct shrink_control *sc)
7abee7e8d17803 Zhaoyang Huang 2023-04-07  675  {
7abee7e8d17803 Zhaoyang Huang 2023-04-07  676  	struct cma *cma = container_of(shrinker, struct cma, shrinker);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  677  	unsigned long to_scan;
7abee7e8d17803 Zhaoyang Huang 2023-04-07  678  	struct cma_defer_free_area *area;
7abee7e8d17803 Zhaoyang Huang 2023-04-07  679  	unsigned long new_pfn;
7abee7e8d17803 Zhaoyang Huang 2023-04-07  680  	unsigned long defer_count;
7abee7e8d17803 Zhaoyang Huang 2023-04-07  681  
7abee7e8d17803 Zhaoyang Huang 2023-04-07  682  	if (sc->nr_to_scan < cma->batch)
7abee7e8d17803 Zhaoyang Huang 2023-04-07  683  		return 0;
7abee7e8d17803 Zhaoyang Huang 2023-04-07  684  
7abee7e8d17803 Zhaoyang Huang 2023-04-07  685  	to_scan = cma->batch - sc->nr_to_scan;
7abee7e8d17803 Zhaoyang Huang 2023-04-07  686  	defer_count = atomic64_read(&cma->defer_count);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  687  	spin_lock_irq(&cma->lock);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  688  
7abee7e8d17803 Zhaoyang Huang 2023-04-07  689  	/*free all node*/
7abee7e8d17803 Zhaoyang Huang 2023-04-07  690  	if (to_scan >= defer_count) {
7abee7e8d17803 Zhaoyang Huang 2023-04-07  691  		list_for_each_entry(area, &cma->defer_free, list) {
7abee7e8d17803 Zhaoyang Huang 2023-04-07  692  			list_del(&area->list);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  693  			free_contig_range(area->pfn, area->count);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  694  			cma_clear_bitmap(cma, area->pfn, area->count);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  695  			kfree(area);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  696  		}
7abee7e8d17803 Zhaoyang Huang 2023-04-07  697  		atomic64_set(&cma->defer_count, 0);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  698  		return defer_count;

spin_unlock_irq

7abee7e8d17803 Zhaoyang Huang 2023-04-07  699  	}
7abee7e8d17803 Zhaoyang Huang 2023-04-07  700  
7abee7e8d17803 Zhaoyang Huang 2023-04-07  701  	list_for_each_entry(area, &cma->defer_free, list) {
7abee7e8d17803 Zhaoyang Huang 2023-04-07  702  		if (to_scan <= area->count) {
7abee7e8d17803 Zhaoyang Huang 2023-04-07  703  			list_del(&area->list);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  704  			free_contig_range(area->pfn, area->count);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  705  			cma_clear_bitmap(cma, area->pfn, area->count);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  706  			kfree(area);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  707  			atomic64_sub(to_scan, &cma->defer_count);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  708  			/*release the rest pfn to cma*/
7abee7e8d17803 Zhaoyang Huang 2023-04-07  709  			if (!list_empty(&cma->defer_free)) {
7abee7e8d17803 Zhaoyang Huang 2023-04-07  710  				new_pfn = area->pfn + to_scan;
7abee7e8d17803 Zhaoyang Huang 2023-04-07  711  				cma_release(cma, pfn_to_page(new_pfn), area->count - to_scan);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  712  			}
7abee7e8d17803 Zhaoyang Huang 2023-04-07  713  			break;
7abee7e8d17803 Zhaoyang Huang 2023-04-07  714  		}
7abee7e8d17803 Zhaoyang Huang 2023-04-07  715  		else {
7abee7e8d17803 Zhaoyang Huang 2023-04-07  716  			list_del(&area->list);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  717  			free_contig_range(area->pfn, area->count);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  718  			cma_clear_bitmap(cma, area->pfn, area->count);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  719  			kfree(area);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  720  			to_scan = to_scan - atomic64_read(&cma->defer_count);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  721  			/*release the rest pfn to cma*/
7abee7e8d17803 Zhaoyang Huang 2023-04-07  722  			if (!list_empty(&cma->defer_free)) {
7abee7e8d17803 Zhaoyang Huang 2023-04-07  723  				new_pfn = area->pfn + to_scan;
7abee7e8d17803 Zhaoyang Huang 2023-04-07  724  				cma_release(cma, pfn_to_page(new_pfn), area->count - to_scan);
7abee7e8d17803 Zhaoyang Huang 2023-04-07  725  			}
7abee7e8d17803 Zhaoyang Huang 2023-04-07  726  			continue;
7abee7e8d17803 Zhaoyang Huang 2023-04-07  727  		}
7abee7e8d17803 Zhaoyang Huang 2023-04-07  728  	}
7abee7e8d17803 Zhaoyang Huang 2023-04-07  729  	spin_unlock_irq(&cma->lock);
7abee7e8d17803 Zhaoyang Huang 2023-04-07 @730  	return 0;
7abee7e8d17803 Zhaoyang Huang 2023-04-07  731  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

