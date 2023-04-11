Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FC23D75;
	Tue, 11 Apr 2023 08:30:07 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id d9so6748745wrb.11;
        Tue, 11 Apr 2023 01:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681201805; x=1683793805;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tvIDHs1BDBIaCYNw0AWNxbR/KttxAyH9HpS3lWDcgDM=;
        b=UUa+XbRnhAQkZQgJXsOvuPyTM9Mbc4rUyF7qUWE85YLbHs4Utt3VdVDiJ5hia/jX4Y
         VW1erJlArltl0xnbw2gWqjwxtTc7BxKXudNPoSO4wbaUp9ZfuP3RIvm6v6ns6SQkHf3Y
         Mu1XvaJfLlnNOm5W1VXh6WQai6YOmuOs7aBCWOlh4HwXzbYbZPV/kqkkZrlwYouEAxcs
         PQBEdKkpGx9qWBL+PXKV/u55SQUD5E0v/G7mWuyvUgjoC6itUVHRHH3r72vg0pJuaWn9
         c1qLPrOExcA9bRfEQWxzW84wpNT4mE7DH2O56T6lbNQhZm5Bg/p+LqIoqNUlBcIXHe9n
         IFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681201805; x=1683793805;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tvIDHs1BDBIaCYNw0AWNxbR/KttxAyH9HpS3lWDcgDM=;
        b=cD7vmZ9azUVY17NJ1FhS4KS5lc3l7gUnoLXXERWNBocTzWMyZ5alwqSfq8ZgBQ7/58
         i9N6YuN5458kKhLilL+Q9yD4XAN69G8QmXMMfimrBrz3sDCsDigVb5ZryXM5+cpw6kCy
         +Gx+Y4vQuopdjZmecJ5m8E3KXKQ3lo6AcZZRCmWxalMPdiWzyBiHhhSkSCHpZozE5c6W
         8fyH5mrL6ZxL9AGd0SJH9b3PMSS9EWeH+J9VgR3gF+tsz3xGSm3upccuLEgGjLmYQ75G
         R7t5cG3TZ43x8Bk9d1BdziSAaSy24N7pMeAgZ6gKT9OVeBHIDI4i/6gYaUPGEtazXLev
         ZSKw==
X-Gm-Message-State: AAQBX9c+XCkghAO7xaqnOuV761fiBKokI5eQ2bL/277kYa+Vwqx2nIun
	ciBXiQdP+nhfQ8xzIQYANPapB3wTpFI=
X-Google-Smtp-Source: AKy350ZCxBUthhUcJoR29XGcbeEfnFb8t0US6tBlKLvYzeEwYJIfo16YVpL8KHyMKhLhidF4ADow+g==
X-Received: by 2002:a5d:60cb:0:b0:2ef:eb58:4697 with SMTP id x11-20020a5d60cb000000b002efeb584697mr5548030wrt.25.1681201805203;
        Tue, 11 Apr 2023 01:30:05 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a17-20020a056000101100b002f21a96c161sm4257226wrx.70.2023.04.11.01.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 01:30:04 -0700 (PDT)
Date: Tue, 11 Apr 2023 11:30:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] mm: introduce defer free for cma
Message-ID: <9df78cbd-3d4a-411e-b59f-97afdcbb6d72@kili.mountain>
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
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230409/202304091523.IZcRaGI1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304091523.IZcRaGI1-lkp@intel.com/

smatch warnings:
mm/cma.c:449 cma_defer_area_fetch() error: dereferencing freed memory 'area'
mm/cma.c:691 cma_defer_free_scan() error: dereferencing freed memory 'area'

vim +/area +449 mm/cma.c

7abee7e8d17803 Zhaoyang Huang   2023-04-07  429  static int cma_defer_area_fetch(struct cma *cma, unsigned long pfn,
7abee7e8d17803 Zhaoyang Huang   2023-04-07  430  		unsigned long count)
7abee7e8d17803 Zhaoyang Huang   2023-04-07  431  {
7abee7e8d17803 Zhaoyang Huang   2023-04-07  432  	struct cma_defer_free_area *area;
7abee7e8d17803 Zhaoyang Huang   2023-04-07  433  	unsigned long new_pfn;
7abee7e8d17803 Zhaoyang Huang   2023-04-07  434  	int ret = -1;
7abee7e8d17803 Zhaoyang Huang   2023-04-07  435  
7abee7e8d17803 Zhaoyang Huang   2023-04-07  436  	if (!atomic64_read(&cma->defer_count))
7abee7e8d17803 Zhaoyang Huang   2023-04-07  437  		return ret;
7abee7e8d17803 Zhaoyang Huang   2023-04-07  438  	if (count <= atomic64_read(&cma->defer_count)) {
7abee7e8d17803 Zhaoyang Huang   2023-04-07  439  		spin_lock_irq(&cma->lock);
7abee7e8d17803 Zhaoyang Huang   2023-04-07  440  		list_for_each_entry(area, &cma->defer_free, list) {
7abee7e8d17803 Zhaoyang Huang   2023-04-07  441  			/*area found for given pfn and count*/
7abee7e8d17803 Zhaoyang Huang   2023-04-07  442  			if (pfn >= area->pfn && count <= area->count) {
7abee7e8d17803 Zhaoyang Huang   2023-04-07  443  				list_del(&area->list);
7abee7e8d17803 Zhaoyang Huang   2023-04-07  444  				/*set bits for allocated pfn*/
7abee7e8d17803 Zhaoyang Huang   2023-04-07  445  				bitmap_set(cma->bitmap, pfn - cma->base_pfn, count);
7abee7e8d17803 Zhaoyang Huang   2023-04-07  446  				kfree(area);
                                                                                ^^^^^^^^^^^
kfree

7abee7e8d17803 Zhaoyang Huang   2023-04-07  447  				atomic64_sub(count, &cma->defer_count);
7abee7e8d17803 Zhaoyang Huang   2023-04-07  448  				/*release the rest pfn to cma*/
7abee7e8d17803 Zhaoyang Huang   2023-04-07 @449  				if (!list_empty(&cma->defer_free) && (pfn == area->pfn)) {
                                                                                                                             ^^^^^^^^^
use after free

7abee7e8d17803 Zhaoyang Huang   2023-04-07  450  					new_pfn = pfn + count;
7abee7e8d17803 Zhaoyang Huang   2023-04-07  451  					cma_release(cma, pfn_to_page(new_pfn), area->count - count);
                                                                                                                               ^^^^^^^^^^^

7abee7e8d17803 Zhaoyang Huang   2023-04-07  452  				}
7abee7e8d17803 Zhaoyang Huang   2023-04-07  453  				ret = 0;
7abee7e8d17803 Zhaoyang Huang   2023-04-07  454  				spin_unlock_irq(&cma->lock);
7abee7e8d17803 Zhaoyang Huang   2023-04-07  455  				return ret;
7abee7e8d17803 Zhaoyang Huang   2023-04-07  456  			}
7abee7e8d17803 Zhaoyang Huang   2023-04-07  457  		}
7abee7e8d17803 Zhaoyang Huang   2023-04-07  458  	}
7abee7e8d17803 Zhaoyang Huang   2023-04-07  459  	/*no area found, release all to buddy*/
7abee7e8d17803 Zhaoyang Huang   2023-04-07  460  	list_for_each_entry(area, &cma->defer_free, list) {
7abee7e8d17803 Zhaoyang Huang   2023-04-07  461  		list_del(&area->list);
                                                                          ^^^^^^^^^^
You need to use list_for_each_entry_safe() here to prevent a forever
loop

7abee7e8d17803 Zhaoyang Huang   2023-04-07  462  		free_contig_range(area->pfn, area->count);
7abee7e8d17803 Zhaoyang Huang   2023-04-07  463  		cma_clear_bitmap(cma, area->pfn, area->count);
7abee7e8d17803 Zhaoyang Huang   2023-04-07  464  		kfree(area);
                                                                ^^^^^^^^^^^
also list_for_each_entry_safe() prevents a use after free


7abee7e8d17803 Zhaoyang Huang   2023-04-07  465  	}
7abee7e8d17803 Zhaoyang Huang   2023-04-07  466  	spin_unlock_irq(&cma->lock);
7abee7e8d17803 Zhaoyang Huang   2023-04-07  467  	return ret;
7abee7e8d17803 Zhaoyang Huang   2023-04-07  468  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

