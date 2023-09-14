Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A821C13
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Sep 2023 06:41:34 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-401b393ddd2so6573215e9.0
        for <oe-kbuild@lists.linux.dev>; Wed, 13 Sep 2023 23:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694673692; x=1695278492; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mbPn8jG0aaiKDlxm4t2ttIZEEd6U3lKk9eO8XNX7zCA=;
        b=pLMUpDB7gFe5hQt7w5C4ljVlJzlgjGvpWaV1i7ekOS7UJQ+3EnKH1KT24CGPXNnwC9
         bkjMzpqlre6oh0sEDlrPEqQv8JYKzaYxaFV0EJyBhVUuOomUO8kgjc4r9YE2GygxbqQ+
         vlsPfVwycoHinjWEZktUMBPfUC5JLNiRshuMxIPmkuCM1hCTrSCdklSbcvv+JUhyhD2y
         n9qp/nCTqAa9Trda/0jmnOJJHb4eC/vyK6X15glYPg4oh7KVPu24P1id3dCjaOfYkkLO
         gEyVgowrQBOMp/U90IFnlFshLPC80Ut9/7WJR80joT6lrPxqo60LusGQbDkWX+PoS6hZ
         NMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694673692; x=1695278492;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mbPn8jG0aaiKDlxm4t2ttIZEEd6U3lKk9eO8XNX7zCA=;
        b=KM/jiHPxO2asNWbI9MGKR5VpDFRbWRjI68FbvTY22fiBBxU+pDgUwdnlamZ2JrIrED
         fcSUVIl46+7mya9v1zCYX3votqJFv1OuGnEXN/bPE2E5oplx2YXkuaTuV0xl+L0lkXCg
         zV35uMFxxJMyjfkITqyCyKQLFUB4fn3fp2bd2qEyBVdduDJhznVBUkdx+p4x0DtmFo5F
         x7d1r6KgaTh7d5inhHb6yibhFG17m5vPSQn9074UgZLcLu2xzOsWqv+OZ1+mxfIMUvbD
         YmhsrfG2UDU+S4IQaTSg4CgDlxiRtsnQuMYkQ2kgj0x5y+HLQj12amAuCUAuhBO4TSzK
         3A6A==
X-Gm-Message-State: AOJu0Yx5P5fG0X56Q+iSm3phk7/iOzLYKqwg3WZ65mk8TyAVjo3B4V5X
	SlFUKrgJzYCBdAtOoFbT/CwSQ60fhXtVVZG4eZY=
X-Google-Smtp-Source: AGHT+IFgeGqKGjC19iBPDtNMSzCBGblrqc4Ak12Todt8W8/zsACpjAIRkD+d9CMRsRDWUFDe6Nn7WA==
X-Received: by 2002:a1c:7204:0:b0:403:442:5421 with SMTP id n4-20020a1c7204000000b0040304425421mr3855814wmc.4.1694673692426;
        Wed, 13 Sep 2023 23:41:32 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m10-20020a7bce0a000000b003fee53feab5sm1061962wmc.10.2023.09.13.23.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 23:41:32 -0700 (PDT)
Date: Thu, 14 Sep 2023 09:41:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [staging:staging-testing 17/17] drivers/staging/vme_user/vme.c:296
 vme_slave_request() error: we previously assumed 'slave_image' could be null
 (see line 297)
Message-ID: <87c5de5b-ecb8-46ec-8489-605971214683@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jinjie,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-testing
head:   4c5ba1d7a93e098aececbf93afbdd7add98ec6f3
commit: 4c5ba1d7a93e098aececbf93afbdd7add98ec6f3 [17/17] staging: vme_user: Use list_for_each_entry() helper
config: x86_64-randconfig-161-20230913 (https://download.01.org/0day-ci/archive/20230914/202309140330.fgOxoRhE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230914/202309140330.fgOxoRhE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202309140330.fgOxoRhE-lkp@intel.com/

smatch warnings:
drivers/staging/vme_user/vme.c:296 vme_slave_request() error: we previously assumed 'slave_image' could be null (see line 297)
drivers/staging/vme_user/vme.c:492 vme_master_request() error: we previously assumed 'master_image' could be null (see line 493)
drivers/staging/vme_user/vme.c:866 vme_dma_request() error: we previously assumed 'dma_ctrlr' could be null (see line 867)
drivers/staging/vme_user/vme.c:1460 vme_lm_request() error: we previously assumed 'lm' could be null (see line 1461)

vim +/slave_image +296 drivers/staging/vme_user/vme.c

6af04b065b048e drivers/staging/vme/vme.c      Martyn Welch    2011-12-01  281  struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
6af04b065b048e drivers/staging/vme/vme.c      Martyn Welch    2011-12-01  282  				       u32 cycle)
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  283  {
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  284  	struct vme_bridge *bridge;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  285  	struct vme_slave_resource *allocated_image = NULL;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  286  	struct vme_slave_resource *slave_image = NULL;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  287  	struct vme_resource *resource = NULL;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  288  
8f966dc444b11a drivers/staging/vme/vme.c      Manohar Vanga   2011-09-26  289  	bridge = vdev->bridge;
61282c04984e40 drivers/vme/vme.c              Markus Elfring  2017-08-24  290  	if (!bridge) {
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  291  		printk(KERN_ERR "Can't find VME bus\n");
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  292  		goto err_bus;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  293  	}
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  294  
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  295  	/* Loop through slave resources */
4c5ba1d7a93e09 drivers/staging/vme_user/vme.c Jinjie Ruan     2023-08-23 @296  	list_for_each_entry(slave_image, &bridge->slave_resources, list) {
                                                                                                    ^^^^^^^^^^^
This is the iterator.

61282c04984e40 drivers/vme/vme.c              Markus Elfring  2017-08-24 @297  		if (!slave_image) {

And list iterators are never NULL.  Please remove this if statement.

ead1f3e301e2d8 drivers/staging/vme/vme.c      Martyn Welch    2009-12-15  298  			printk(KERN_ERR "Registered NULL Slave resource\n");
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  299  			continue;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  300  		}
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  301  
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  302  		/* Find an unlocked and compatible image */
886953e9b70bcb drivers/staging/vme/vme.c      Emilio G. Cota  2010-11-12  303  		mutex_lock(&slave_image->mtx);
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  304  		if (((slave_image->address_attr & address) == address) &&
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  305  		    ((slave_image->cycle_attr & cycle) == cycle) &&
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  306  		    (slave_image->locked == 0)) {
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  307  			slave_image->locked = 1;
886953e9b70bcb drivers/staging/vme/vme.c      Emilio G. Cota  2010-11-12  308  			mutex_unlock(&slave_image->mtx);
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  309  			allocated_image = slave_image;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  310  			break;
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  311  		}
886953e9b70bcb drivers/staging/vme/vme.c      Emilio G. Cota  2010-11-12  312  		mutex_unlock(&slave_image->mtx);
a17a75e2666f71 drivers/staging/vme/vme.c      Martyn Welch    2009-07-31  313  	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

