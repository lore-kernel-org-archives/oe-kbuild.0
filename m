Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F49319ABB4
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Oct 2024 14:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728485245; cv=none; b=sRVnydeOnVQ1IxaT4oVnlEo/TLDYMcOSppunw2DKb4tqlOt9uE7r2Vb7hLewlTjr6Z2tYD9gtbg4EUo3mvx9JcX/vQQx/CArazu3BG25s72G+SldlWQwPKSWSCr15YRUMqfSr07Y4pqAHvgLst+gQwUoT7B99vS8iHcWSRmyCUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728485245; c=relaxed/simple;
	bh=VJTC2DOZnhmJ68sp/tmxqdeKde2Mhxf3GCsNUffgoW0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=rFB8F75Ihk7mF/H3d0QxmtPJIXTO6sXxTUyOhLhlmSz59nR6zi7vCGc9yYpBwlminX6AKuRdlpVfvx1xOw3d6C0CBwApoMjdrBgdcEMlboQAVIEiNarlXYT1CLlrJhJbu+9zbhY9fGnJ71oPjD8WspuTQ4to3e+OsjC9rBFHQGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aVFy5Nzd; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aVFy5Nzd"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43058268d91so11610415e9.0
        for <oe-kbuild@lists.linux.dev>; Wed, 09 Oct 2024 07:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728485241; x=1729090041; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d9rcGsQ0+uAasDNvLrvHwFyI9WspFhavO2dzQQO4dB0=;
        b=aVFy5NzdeqtjRJXz8XB6I4aa0V9mXcGkARzfQ8F9ugGEt5hEDfKufhmn1ULPwVIkHq
         hhITpQbg7fV6jxHntpkqSu+KE0rOKCUoceb+kv9+kaIWExK09XwMUabHKUb1dAetvKN8
         2I+Qp7kEBK8na5buoQsmyalXp/R9EH0dLL++4yw2zv2Nyakj1XkHF0Jsb8OmNxEVa9wR
         HiMq4P94yKu8sSSUqgdVwfjnKDtlPOFQkhg7lmycY75l3o21Mqp9tJnFV72a8Su186nI
         JB6dw/RQWWBT5108vlrTGELRKBSNrMFXNudEb/Bg3S57SpkRf2bcY7AEpokiZfwE6+Lk
         fdcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728485242; x=1729090042;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9rcGsQ0+uAasDNvLrvHwFyI9WspFhavO2dzQQO4dB0=;
        b=lQfVnww+IMwAIBFIvUb+hmC9t/2VgYFZtJeTwz2/OI+rVinrYh7c+oiqtMOJ/iaOns
         mSou83fQBk/bAL43JLuMgbNk0f6WT7AoPYRQHumxyHp1TMQKgverZoAU+mUwrfsV6CO0
         dl7l9tFC8HEtcrSV1YQEOR4L9+4JI3YhFs4oBXnvCeoCe40HbV+AwlEEyIZFuYw0faLs
         BemcCaJ6/W0yHbvCZtcZ0v7q5O+BIAmD54aYtxmofySaWqil05lPHVXNSad9bOkwZJQD
         Pwp9W1nDYcZIVOwXSUhXkVRxd+8YQVeTblhCBhVppjnYv3lre91CneI+mPE4MkHY2O9F
         UBAw==
X-Gm-Message-State: AOJu0YwYAwhYN4W8pCWsiu+Hqi5sFuREjwvRSXWnaw7V475EL63juWWS
	mpEUNucYKe45LKTGmbRqMNcXAR+uZsqgAOjGo07Wv52psomlT2JdwbMfverarxinu191Agm1Pzn
	O
X-Google-Smtp-Source: AGHT+IGZ5bNiOSMx5Q1Ih7x+axzAHoaTvA3GlxDEdqAHZC/EUOPneC6RziV3TtFWCRrpAlfq8o5CGg==
X-Received: by 2002:a05:600c:1c1f:b0:42c:b74c:d8c3 with SMTP id 5b1f17b1804b1-430d7488700mr23141805e9.32.1728485241387;
        Wed, 09 Oct 2024 07:47:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf31a7esm23151485e9.9.2024.10.09.07.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 07:47:20 -0700 (PDT)
Date: Wed, 9 Oct 2024 17:47:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Xu Yang <xu.yang_2@nxp.com>,
	peter.chen@kernel.org, gregkh@linuxfoundation.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 2/2] usb: chipidea: udc: create bounce buffer for problem
 sglist entries if possible
Message-ID: <e8601166-8da4-4698-8855-4f58b36272b6@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912045150.915573-2-xu.yang_2@nxp.com>

Hi Xu,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xu-Yang/usb-chipidea-udc-create-bounce-buffer-for-problem-sglist-entries-if-possible/20240912-125251
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20240912045150.915573-2-xu.yang_2%40nxp.com
patch subject: [PATCH 2/2] usb: chipidea: udc: create bounce buffer for problem sglist entries if possible
config: i386-randconfig-141-20240914 (https://download.01.org/0day-ci/archive/20240914/202409141707.TOsGfePE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409141707.TOsGfePE-lkp@intel.com/

New smatch warnings:
drivers/usb/chipidea/udc.c:704 _hardware_enqueue() error: uninitialized symbol 'bounced_size'.

vim +/bounced_size +704 drivers/usb/chipidea/udc.c

8e22978c57087a drivers/usb/chipidea/udc.c       Alexander Shishkin 2013-06-24  671  static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
aa69a8093ff985 drivers/usb/gadget/ci13xxx_udc.c David Lopo         2008-11-17  672  {
8e22978c57087a drivers/usb/chipidea/udc.c       Alexander Shishkin 2013-06-24  673  	struct ci_hdrc *ci = hwep->ci;
0e6ca1998e4c80 drivers/usb/gadget/ci13xxx_udc.c Pavankumar Kondeti 2011-02-18  674  	int ret = 0;
cc9e6c495b0a37 drivers/usb/chipidea/udc.c       Michael Grzeschik  2013-06-13  675  	struct td_node *firstnode, *lastnode;
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  676  	unsigned int bounced_size;
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  677  	struct scatterlist *sg;
aa69a8093ff985 drivers/usb/gadget/ci13xxx_udc.c David Lopo         2008-11-17  678  
aa69a8093ff985 drivers/usb/gadget/ci13xxx_udc.c David Lopo         2008-11-17  679  	/* don't queue twice */
2dbc5c4c831418 drivers/usb/chipidea/udc.c       Alexander Shishkin 2013-06-13  680  	if (hwreq->req.status == -EALREADY)
aa69a8093ff985 drivers/usb/gadget/ci13xxx_udc.c David Lopo         2008-11-17  681  		return -EALREADY;
aa69a8093ff985 drivers/usb/gadget/ci13xxx_udc.c David Lopo         2008-11-17  682  
2dbc5c4c831418 drivers/usb/chipidea/udc.c       Alexander Shishkin 2013-06-13  683  	hwreq->req.status = -EALREADY;
aa69a8093ff985 drivers/usb/gadget/ci13xxx_udc.c David Lopo         2008-11-17  684  
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  685  	if (hwreq->req.num_sgs && hwreq->req.length) {
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  686  		ret = sglist_get_invalid_entry(ci->dev->parent, hwep->dir,
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  687  					&hwreq->req);
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  688  		if (ret < hwreq->req.num_sgs) {
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  689  			ret = sglist_do_bounce(hwreq, ret, hwep->dir == TX,
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  690  					&bounced_size);
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  691  			if (ret)
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  692  				return ret;
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  693  		}
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  694  	}

bounced_size not initialized on else path

91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  695  
aeb78cda51005f drivers/usb/chipidea/udc.c       Arnd Bergmann      2017-03-13  696  	ret = usb_gadget_map_request_by_dev(ci->dev->parent,
aeb78cda51005f drivers/usb/chipidea/udc.c       Arnd Bergmann      2017-03-13  697  					    &hwreq->req, hwep->dir);
5e0aa49ec61e88 drivers/usb/chipidea/udc.c       Alexander Shishkin 2012-05-11  698  	if (ret)
5e0aa49ec61e88 drivers/usb/chipidea/udc.c       Alexander Shishkin 2012-05-11  699  		return ret;
5e0aa49ec61e88 drivers/usb/chipidea/udc.c       Alexander Shishkin 2012-05-11  700  
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  701  	if (hwreq->sgt.sgl) {
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  702  		/* We've mapped a bigger buffer, now recover the actual size */
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  703  		sg = sg_last(hwreq->req.sg, hwreq->req.num_sgs);
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12 @704  		sg_dma_len(sg) = min(sg_dma_len(sg), bounced_size);
                                                                                                                                     ^^^^^^^^^^^^

91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  705  	}
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  706  
e48aa1eb443f80 drivers/usb/chipidea/udc.c       Peter Chen         2020-02-21  707  	if (hwreq->req.num_mapped_sgs)
e48aa1eb443f80 drivers/usb/chipidea/udc.c       Peter Chen         2020-02-21  708  		ret = prepare_td_for_sg(hwep, hwreq);
e48aa1eb443f80 drivers/usb/chipidea/udc.c       Peter Chen         2020-02-21  709  	else

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

