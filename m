Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F439366;
	Thu, 12 Jan 2023 04:31:56 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id m8-20020a05600c3b0800b003d96f801c48so15720843wms.0;
        Wed, 11 Jan 2023 20:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uXlipuv/i7mniK7wHyDwLSqnab428zbxM+Vnpf1drcc=;
        b=g9Xkb/e1WfDQpQIOYM4M837MbCGrxNIUsbroJiYWxPZiTWAWmyaj7ec+/Xt+a0q6DI
         YrG/c8qNhipv9MJmmBshInTMVfGjIGZwTb8Pry7jkaIF/MqyY/WQQPAY7Est1gXsGXYk
         7Wy6eDAkur/LgfoL5CXUBzEZThjIafJy1QHTFsJQj2B5X7WVdEj5anMs4bT7c/Xz7nSB
         3Y9r3k8fqOHV4Vin6CMTXCbxdcL+kDgpO9OrdiM6VcLAstRU2ErI5G30rvXyd1yYHMP7
         R5EbQ5mmHLWdTuCMlcDkTZBHuRfS6+Tht/ogdhLJRU/KxsseXHkeuQIFizHTahmciDsc
         2uKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uXlipuv/i7mniK7wHyDwLSqnab428zbxM+Vnpf1drcc=;
        b=2BF0IoqNTwg59wWNFyWvSMg6H6aEz5oIL+pTmg3dSPa1QoLZ9Q1NFAgKjUUZBPGMOV
         7ZYMJS0L2HBY9p7f+3rrK+4lJyTLtA9QAyRczG90tlOBbi7B+6Vzl7jBaD/10rYdMiIV
         tzyj3FaUZ/8ukEHdwxD8RwZcyBmc0t6OwCMNnZHYJ8nqAwnOeA1505sIZhsNJbC5Xph5
         oFVISy+qHlAN9xpBIyHczJd76p2sUMyi9+eNz9JyN6XRn8H65ISu0Lxu8Sc2Kwq+9xRZ
         LieGARpx8zyGVGS3Ls94b4r3ZGwkj44qJhfc+grkirwUTwi5NRjagIwjBkWOHt8AEZo2
         Sd5g==
X-Gm-Message-State: AFqh2kowMSltzInpJ3pSrg3/z6B5NP4WZHNvx6cGBLefkh3Auh8bM2Oq
	wiyUn6zPe2mkz8DW4EgoP080ool+oL4=
X-Google-Smtp-Source: AMrXdXt/tIXNYANa9yun1MDNjmPvaBH7mBGmBfMN+1YWMJi6HfKRsHsK+IHpm27a8l3VzpZpo1ih5A==
X-Received: by 2002:a05:600c:3ac3:b0:3d1:cfcb:7d19 with SMTP id d3-20020a05600c3ac300b003d1cfcb7d19mr64314558wms.32.1673497913950;
        Wed, 11 Jan 2023 20:31:53 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p15-20020a1c544f000000b003b4fe03c881sm24389942wmi.48.2023.01.11.20.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 20:31:53 -0800 (PST)
Date: Thu, 12 Jan 2023 07:31:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [mnyman-xhci:feature_interrupters 4/4]
 drivers/usb/host/xhci-mem.c:1872 xhci_remove_secondary_interrupter() error:
 we previously assumed 'ir' could be null (see line 1866)
Message-ID: <202301120409.BgsBqbgf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230112043149.fSNan0vddJblyZuWdzNgbYrt0FGtYaMu_fKAfR0IAbQ@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git feature_interrupters
head:   8cbab306777ebb0805f5201b6add5ee53eb6659e
commit: 8cbab306777ebb0805f5201b6add5ee53eb6659e [4/4] xhci: add support to allocate several interrupters
config: nios2-randconfig-m031-20230111
compiler: nios2-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/usb/host/xhci-mem.c:1872 xhci_remove_secondary_interrupter() error: we previously assumed 'ir' could be null (see line 1866)

vim +/ir +1872 drivers/usb/host/xhci-mem.c

8cbab306777ebb Mathias Nyman 2023-01-09  1861  void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrupter *ir)
8cbab306777ebb Mathias Nyman 2023-01-09  1862  {
8cbab306777ebb Mathias Nyman 2023-01-09  1863  	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
8cbab306777ebb Mathias Nyman 2023-01-09  1864  	unsigned int intr_num;
8cbab306777ebb Mathias Nyman 2023-01-09  1865  
8cbab306777ebb Mathias Nyman 2023-01-09 @1866  	if (!ir || !ir->intr_num || ir->intr_num > xhci->max_interrupters)
                                                    ^^^    ^^^^^^^^^^^^^    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Why is zero invalid?  I would have expected this to be >= instead of
>.  Is this a base 1 array?  Ideally these checks are impossible and
could be removed.

8cbab306777ebb Mathias Nyman 2023-01-09  1867  		xhci_dbg(xhci, "Invalid secondary interrupter, can't remove\n");
8cbab306777ebb Mathias Nyman 2023-01-09  1868  
8cbab306777ebb Mathias Nyman 2023-01-09  1869  	/* fixme, shuld we check xhci->interrupter[intr_num] == ir */
8cbab306777ebb Mathias Nyman 2023-01-09  1870  	/* fixme locking */
8cbab306777ebb Mathias Nyman 2023-01-09  1871  
8cbab306777ebb Mathias Nyman 2023-01-09 @1872  	intr_num = ir->intr_num;
                                                           ^^^^^^^^^^^^

8cbab306777ebb Mathias Nyman 2023-01-09  1873  	xhci_free_interrupter(xhci, ir);
8cbab306777ebb Mathias Nyman 2023-01-09  1874  	xhci->interrupters[intr_num] = NULL;
8cbab306777ebb Mathias Nyman 2023-01-09  1875  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

