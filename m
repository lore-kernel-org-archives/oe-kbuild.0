Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD281078E
	for <oe-kbuild@lists.linux.dev>; Wed,  3 May 2023 14:22:37 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-2f3fe12de15so3276492f8f.3
        for <oe-kbuild@lists.linux.dev>; Wed, 03 May 2023 07:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683123755; x=1685715755;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=51ayICpRd20JNlJZIywxRj0ta6wR3zgjWIVPQ6dF1cE=;
        b=DxgAfOOCV1APe2aSk9YxonAvippgclo5KMGMe7GuzoCBBsxPBHWFWNLfiO3i1lu2bw
         T4/rh/nuO1/bFAQA+3q5Ng/uwm3abqM5/dI62QhIv7+OSiaXxCmvbGCduhqjameaNz5G
         Z1BLy3AIl9AYoUuBWfNoAH44XEuqqIcuw3ylxkcmHmY6NYD6xHRoSUcCzoAu7r0IQOOn
         /khLaNwGhXWpSjqj9869jmsR00p8JJCFbPvoEMrOxU+famHxn+HrF6MqWlD8A7LGqicC
         l3oAlI2OBwzozoNhNIjlxm007Xdlh/i6a/2UM2jxxsz24iaSi0oznyLZuE4vCZW4Zy9Z
         yR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683123755; x=1685715755;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51ayICpRd20JNlJZIywxRj0ta6wR3zgjWIVPQ6dF1cE=;
        b=UnVSEG5KEsHeCMtnzhGc0nULvaDzz92uQXNZcgMPEQ0i9MXjx/vq30Zr16fTkv6vYl
         Nn2L1qQYzo4NhAB5D7+rSJ1uWBhYZ+92gLLiHc1CFsmKkukfMX1C8P9Lv3SPBY2ZB8Eq
         VK46YQx1TcJlL365YvcwZCtN+CS6sWfRu+1n29c/xDftaANjZcpbrg4wuwT2Pui5b++D
         Pv4as19pjAnmc0zy84Ezf9jVwX98wByvsV+9ynZLZ6d4xbTbJmtCtRH+RWIFFOb+Dnam
         Q/p8asKyKo/2VuBl/7//j1I5GWdOhHTdaiEUkJpzCFx5B3jZt+np02jZL+18Fozgkhod
         iOgw==
X-Gm-Message-State: AC+VfDy15gdTL2AuOVUzJ/XCjWFntMyoTz8So77qhjtzEpur0w9QLPnY
	GDl9r2mAQvpJAJW2i496fDhvSxIZgoxfVLu43oE=
X-Google-Smtp-Source: ACHHUZ6ms+73G3BKQB20/osF4Lpy7TgvPjZjFvA4s1Gnt9sOEKZ3QR9iEAXefTlVnEpkOd4Y6tW1Ug==
X-Received: by 2002:adf:e9ce:0:b0:306:37d9:201c with SMTP id l14-20020adfe9ce000000b0030637d9201cmr237779wrn.17.1683123754807;
        Wed, 03 May 2023 07:22:34 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z10-20020a5d654a000000b002f22c44e974sm33970073wrv.102.2023.05.03.07.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 07:22:32 -0700 (PDT)
Date: Wed, 3 May 2023 17:22:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Davidlohr Bueso <dave@stgolabs.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/3] cxl/mbox: Add background cmd handling machinery
Message-ID: <f58ab106-2d86-4f61-9fe6-a465e57b209f@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230502171841.21317-4-dave@stgolabs.net>

Hi Davidlohr,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Davidlohr-Bueso/rcuwait-Support-timeouts/20230503-015128
base:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git next
patch link:    https://lore.kernel.org/r/20230502171841.21317-4-dave%40stgolabs.net
patch subject: [PATCH 3/3] cxl/mbox: Add background cmd handling machinery
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230503/202305032140.JWW3VebM-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305032140.JWW3VebM-lkp@intel.com/

smatch warnings:
drivers/cxl/pci.c:230 __cxl_pci_mbox_send_cmd() warn: maybe use && instead of &

vim +230 drivers/cxl/pci.c

914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  221  	if (mbox_cmd->return_code == CXL_MBOX_CMD_RC_BACKGROUND) {
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  222  		int i, ret;
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  223  		u64 bg_status_reg;
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  224  		int timeout = mbox_cmd->poll_interval;
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  225  
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  226  		dev_dbg(dev, "Mailbox background operation (0x%04x) started\n",
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  227  			mbox_cmd->opcode);
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  228  
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  229  		for (i = 0; i < mbox_cmd->poll_count; i++) {
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02 @230  			ret = rcuwait_wait_event_timeout(&cxlds->mbox_wait,
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  231  					TASK_INTERRUPTIBLE,
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  232  					cxl_mbox_background_complete(cxlds),
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  233  					msecs_to_jiffies(timeout));

These TASK_INTERRUPTIBLE and cxl_mbox_background_complete() arguments
are swapped.  The condition is supposed the second argument.

914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  234  			if (ret > 0)
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  235  				break;
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  236  			if (ret < 0) /* interrupted by a signal */
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  237  				return ret;
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  238  		}
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  239  
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  240  		if (!cxl_mbox_background_complete(cxlds)) {
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  241  			u64 md_status =
914e64b06cee69 drivers/cxl/pci.c Davidlohr Bueso 2023-05-02  242  				readq(cxlds->regs.memdev + CXLMDEV_STATUS_OFFSET);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

