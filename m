Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF2B33F0;
	Thu, 29 Dec 2022 13:53:42 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id bg10so13163564wmb.1;
        Thu, 29 Dec 2022 05:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LJwf80EtLvb2UBH2ZbyBI17EFsPIf4lOqD8gl4LKhZ4=;
        b=FAQoOzlDpeLo72ZAMKMhu/gWJ/TOowgO42psGVEXAECWu0thXQ8zW7/ro67wufADaB
         CMRz6D2798qdSuF2hfYStRrOfzlGaQSgK6UHhbqmE4EwnUXmPmhQMYxfSubtZcKC8qWH
         0xm3j8dd9+pxu7pU74T+sl4FQjMRzt8GsQVYtlHXDfXAqaTYpaKhetj+DPgOomD1Qjl3
         idm/Eg7GCJlV7D4AQ+rexbkfxZ542bh+yHMS4gx355iUNPHnPxfJsnT7IdOUCI6FQEtE
         PFXxzndFsFHNXGr5Tj3ytXeBzR8vE1hr2wd0Q0S4KRo4uUCV1rliHAehvQB56ZnHFEKt
         FJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJwf80EtLvb2UBH2ZbyBI17EFsPIf4lOqD8gl4LKhZ4=;
        b=VDZ+rXm5L4z0pIrSsN/OmnGfdI8MER8hLyu0JRrA9KIBjLTAPCYLfgQNzgrkuwZ3BM
         ythoJ218IIcj5Ako4IguX4pH5tEJYob2Tqmh3CstPBkY8OtHGqFt/NYWF0dLwXfRxfxT
         2wMQwgQN9pkaaejHyV/5dyIzbsga43/z6SAnnoRPJOsoK8BanxdURpoOENC3VdyOQ80J
         o+LYm2M1q9WagvvhCChd0DtNTcp+Gej36zsUwFB1TlW7oixlHmZE1/aAilx1cC38y3oY
         P0z8Qc0SyLxSVsTqMfr8ejuFQJFo4Ig0V9Dh2QzYcL08PeVpVcsd9RHx5d+F4aSOU9KP
         16Fg==
X-Gm-Message-State: AFqh2kqi7+Nxl1aMllvaFd14I/XX7R4gvME9v/YNUPeP0QNUVwGVSug6
	dUecwnjzn/5YP268igQL91OWINK3c2fM270x
X-Google-Smtp-Source: AMrXdXvXXSL9Llf5GsFViQn7QP2VpfEFeUnppQNVMgE75yUbgFtJK6ImFMvp4JGI/YnX7lduojdcVw==
X-Received: by 2002:a05:600c:2112:b0:3d3:396e:5e36 with SMTP id u18-20020a05600c211200b003d3396e5e36mr19927055wml.0.1672322020730;
        Thu, 29 Dec 2022 05:53:40 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m185-20020a1c26c2000000b003c6f1732f65sm28855687wmm.38.2022.12.29.05.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 05:53:40 -0800 (PST)
Date: Thu, 29 Dec 2022 16:53:37 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Daniil Tatianin <d-tatianin@yandex-team.ru>,
	"David S. Miller" <davem@davemloft.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Daniil Tatianin <d-tatianin@yandex-team.ru>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Varun Prakash <varun@chelsio.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Mike Christie <michael.christie@oracle.com>,
	Lee Duncan <lduncan@suse.com>, Wu Bo <wubo40@huawei.com>,
	Nilesh Javali <njavali@marvell.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org
Subject: Re: [RESEND PATCH v2] cxgbi: move cxgbi_ddp_set_one_ppod to cxgb_ppm
 and remove its duplicate
Message-ID: <202212291705.id5qvdk7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221226090609.1917788-1-d-tatianin@yandex-team.ru>
Message-ID: <20221229135337.iIgMYT4AtrFTNd33QgKzEAiilhLQlnuRW4HQxkkEOi0@z>

Hi Daniil,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniil-Tatianin/cxgbi-move-cxgbi_ddp_set_one_ppod-to-cxgb_ppm-and-remove-its-duplicate/20221226-171028
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20221226090609.1917788-1-d-tatianin%40yandex-team.ru
patch subject: [RESEND PATCH v2] cxgbi: move cxgbi_ddp_set_one_ppod to cxgb_ppm and remove its duplicate
config: powerpc-randconfig-m031-20221226
compiler: powerpc-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c:571 cxgbi_ppm_set_one_ppod() error: we previously assumed 'sg_off' could be null (see line 536)

vim +/sg_off +571 drivers/net/ethernet/chelsio/libcxgb/libcxgb_ppm.c

e775e542c914b4 Daniil Tatianin 2022-12-26  530  void
e775e542c914b4 Daniil Tatianin 2022-12-26  531  cxgbi_ppm_set_one_ppod(struct cxgbi_pagepod *ppod,
e775e542c914b4 Daniil Tatianin 2022-12-26  532  		       struct cxgbi_task_tag_info *ttinfo,
e775e542c914b4 Daniil Tatianin 2022-12-26  533  		       struct scatterlist **sg_pp, unsigned int *sg_off)
e775e542c914b4 Daniil Tatianin 2022-12-26  534  {
e775e542c914b4 Daniil Tatianin 2022-12-26  535  	struct scatterlist *sg = sg_pp ? *sg_pp : NULL;
e775e542c914b4 Daniil Tatianin 2022-12-26 @536  	unsigned int offset = sg_off ? *sg_off : 0;
                                                                              ^^^^^^
Check for NULL

e775e542c914b4 Daniil Tatianin 2022-12-26  537  	dma_addr_t addr = 0UL;
e775e542c914b4 Daniil Tatianin 2022-12-26  538  	unsigned int len = 0;
e775e542c914b4 Daniil Tatianin 2022-12-26  539  	int i;
e775e542c914b4 Daniil Tatianin 2022-12-26  540  
e775e542c914b4 Daniil Tatianin 2022-12-26  541  	memcpy(ppod, &ttinfo->hdr, sizeof(struct cxgbi_pagepod_hdr));
e775e542c914b4 Daniil Tatianin 2022-12-26  542  
e775e542c914b4 Daniil Tatianin 2022-12-26  543  	if (sg) {
e775e542c914b4 Daniil Tatianin 2022-12-26  544  		addr = sg_dma_address(sg);
e775e542c914b4 Daniil Tatianin 2022-12-26  545  		len = sg_dma_len(sg);
e775e542c914b4 Daniil Tatianin 2022-12-26  546  	}
e775e542c914b4 Daniil Tatianin 2022-12-26  547  
e775e542c914b4 Daniil Tatianin 2022-12-26  548  	for (i = 0; i < PPOD_PAGES_MAX; i++) {
e775e542c914b4 Daniil Tatianin 2022-12-26  549  		if (sg) {
e775e542c914b4 Daniil Tatianin 2022-12-26  550  			ppod->addr[i] = cpu_to_be64(addr + offset);
e775e542c914b4 Daniil Tatianin 2022-12-26  551  			offset += PAGE_SIZE;
e775e542c914b4 Daniil Tatianin 2022-12-26  552  			if (offset == (len + sg->offset)) {
e775e542c914b4 Daniil Tatianin 2022-12-26  553  				offset = 0;
e775e542c914b4 Daniil Tatianin 2022-12-26  554  				sg = sg_next(sg);
e775e542c914b4 Daniil Tatianin 2022-12-26  555  				if (sg) {
e775e542c914b4 Daniil Tatianin 2022-12-26  556  					addr = sg_dma_address(sg);
e775e542c914b4 Daniil Tatianin 2022-12-26  557  					len = sg_dma_len(sg);
e775e542c914b4 Daniil Tatianin 2022-12-26  558  				}
e775e542c914b4 Daniil Tatianin 2022-12-26  559  			}
e775e542c914b4 Daniil Tatianin 2022-12-26  560  		} else {
e775e542c914b4 Daniil Tatianin 2022-12-26  561  			ppod->addr[i] = 0ULL;
e775e542c914b4 Daniil Tatianin 2022-12-26  562  		}
e775e542c914b4 Daniil Tatianin 2022-12-26  563  	}
e775e542c914b4 Daniil Tatianin 2022-12-26  564  
e775e542c914b4 Daniil Tatianin 2022-12-26  565  	/*
e775e542c914b4 Daniil Tatianin 2022-12-26  566  	 * the fifth address needs to be repeated in the next ppod, so do
e775e542c914b4 Daniil Tatianin 2022-12-26  567  	 * not move sg
e775e542c914b4 Daniil Tatianin 2022-12-26  568  	 */
e775e542c914b4 Daniil Tatianin 2022-12-26  569  	if (sg_pp) {
e775e542c914b4 Daniil Tatianin 2022-12-26  570  		*sg_pp = sg;
e775e542c914b4 Daniil Tatianin 2022-12-26 @571  		*sg_off = offset;
                                                                ^^^^^^^
Unchecked dereference.

e775e542c914b4 Daniil Tatianin 2022-12-26  572  	}
e775e542c914b4 Daniil Tatianin 2022-12-26  573  
e775e542c914b4 Daniil Tatianin 2022-12-26  574  	if (offset == len) {
e775e542c914b4 Daniil Tatianin 2022-12-26  575  		offset = 0;
e775e542c914b4 Daniil Tatianin 2022-12-26  576  		if (sg) {
e775e542c914b4 Daniil Tatianin 2022-12-26  577  			sg = sg_next(sg);
e775e542c914b4 Daniil Tatianin 2022-12-26  578  			if (sg)
e775e542c914b4 Daniil Tatianin 2022-12-26  579  				addr = sg_dma_address(sg);
e775e542c914b4 Daniil Tatianin 2022-12-26  580  		}
e775e542c914b4 Daniil Tatianin 2022-12-26  581  	}
e775e542c914b4 Daniil Tatianin 2022-12-26  582  	ppod->addr[i] = sg ? cpu_to_be64(addr + offset) : 0ULL;
e775e542c914b4 Daniil Tatianin 2022-12-26  583  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

