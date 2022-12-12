Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD5E7B;
	Mon, 12 Dec 2022 07:18:09 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id v7so4508380wmn.0;
        Sun, 11 Dec 2022 23:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LGxqg8TZMm49g0BWiI/JXtvuwzx1eHJNjb217uwEws0=;
        b=MG7fTijioGJwLqIRHKuW4dg+pgoJ+nnHKoIkqAHK6NPXqcyRbgHrImwu7B5+6p55G1
         UUuQ6AYO/4mjh8OdtYl336Qd4xQb1yfrIvZetGDzjhfB/MEIatjlzdupITduC8EdlYNK
         EPhH0y/6rvBA1VMbK+9Wqn0X5ZsELOhK7LqLxd6WldzmzQEG54KT7H/hgPOXH5tHpUmE
         a3X6lq97n55FD0CqdrmvH210yvUV62ReHSaBCbx3Y0ojdYDoCMAayP6OXQgZvXcENUBV
         h9lEfuYqx9+nDJyvwxbdEnbRSZsMG++EfNy8fkR/xWthxTUWzn6f2HEAldCVyCbEnN5E
         rbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LGxqg8TZMm49g0BWiI/JXtvuwzx1eHJNjb217uwEws0=;
        b=hVKLqfhHZiYeu4m7NJy8+PFnJXOM6facFElx30Ojb4y7C2bJl3Xb9cApV0eWfUqKDw
         q4MKW80kvSr7nnXFPROPx+ZVTU2oyDGTRJSBxVIlF4fLxbTOETXO2/OM5HNlAvVom7yV
         e7JiwvSDHgj054INcGO3ftMz1W/4VWoCiLvfOoYGQt13hMRA15RFRXTMQbhvm1QlKaWT
         TGciQRoCqMGHEfVyDPeeyB6/ye5mew82RDJgHuB7xYRQYsVtEF96j9XT9AcrmjdS6Nl2
         zZffHA5FF8KJxmnQcanqMxwut3ZfXcYBgfGAMDaFlLQFwZ/rLcUkOhWZa9/3re6bXWPO
         grOQ==
X-Gm-Message-State: ANoB5pmeD1XHHEiZR7VaLxAibhLXi5ryfSbR3EOall79MZ8+ZRVGwLNj
	k3lt9IFoEsTUQQMuBsEJb/VnmfykYRG2iw==
X-Google-Smtp-Source: AA0mqf4qq7F1ik15fn539LwTAU5HkbgFDOb7ZdOnJBk6uNs/JbSjxrsJ1g1G2HHN6ej2JQcZeVKo/A==
X-Received: by 2002:a05:600c:35d3:b0:3c6:e63e:22e with SMTP id r19-20020a05600c35d300b003c6e63e022emr11630271wmq.5.1670829487954;
        Sun, 11 Dec 2022 23:18:07 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p17-20020a05600c359100b003c6b7f5567csm24600951wmq.0.2022.12.11.23.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 23:18:07 -0800 (PST)
Date: Mon, 12 Dec 2022 10:18:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Felix Fietkau <nbd@nbd.name>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/mediatek/mtk_wed_debugfs.c:73 dump_wed_regs()
 error: uninitialized symbol 'val'.
Message-ID: <202212110120.ZqvaZrGs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221212071801.iFWigTO4l3-bog3YmPFFz2xzKcwU33nHXvoYb-7SeIQ@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3ecc37918c80ffdbfa8f08d3e75a0a9fca1c1979
commit: 804775dfc2885e93a0a4b35db1914c2cc25172b5 net: ethernet: mtk_eth_soc: add support for Wireless Ethernet Dispatch (WED)
config: openrisc-randconfig-m031-20221210
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/net/ethernet/mediatek/mtk_wed_debugfs.c:73 dump_wed_regs() error: uninitialized symbol 'val'.

vim +/val +73 drivers/net/ethernet/mediatek/mtk_wed_debugfs.c

804775dfc2885e Felix Fietkau 2022-04-05  46  static void
804775dfc2885e Felix Fietkau 2022-04-05  47  dump_wed_regs(struct seq_file *s, struct mtk_wed_device *dev,
804775dfc2885e Felix Fietkau 2022-04-05  48  	      const struct reg_dump *regs, int n_regs)
804775dfc2885e Felix Fietkau 2022-04-05  49  {
804775dfc2885e Felix Fietkau 2022-04-05  50  	const struct reg_dump *cur;
804775dfc2885e Felix Fietkau 2022-04-05  51  	u32 val;
804775dfc2885e Felix Fietkau 2022-04-05  52  
804775dfc2885e Felix Fietkau 2022-04-05  53  	for (cur = regs; cur < &regs[n_regs]; cur++) {
804775dfc2885e Felix Fietkau 2022-04-05  54  		switch (cur->type) {
804775dfc2885e Felix Fietkau 2022-04-05  55  		case DUMP_TYPE_STRING:
804775dfc2885e Felix Fietkau 2022-04-05  56  			seq_printf(s, "%s======== %s:\n",
804775dfc2885e Felix Fietkau 2022-04-05  57  				   cur > regs ? "\n" : "",
804775dfc2885e Felix Fietkau 2022-04-05  58  				   cur->name);
804775dfc2885e Felix Fietkau 2022-04-05  59  			continue;
804775dfc2885e Felix Fietkau 2022-04-05  60  		case DUMP_TYPE_WED:
804775dfc2885e Felix Fietkau 2022-04-05  61  			val = wed_r32(dev, cur->offset);
804775dfc2885e Felix Fietkau 2022-04-05  62  			break;
804775dfc2885e Felix Fietkau 2022-04-05  63  		case DUMP_TYPE_WDMA:
804775dfc2885e Felix Fietkau 2022-04-05  64  			val = wdma_r32(dev, cur->offset);
804775dfc2885e Felix Fietkau 2022-04-05  65  			break;
804775dfc2885e Felix Fietkau 2022-04-05  66  		case DUMP_TYPE_WPDMA_TX:
804775dfc2885e Felix Fietkau 2022-04-05  67  			val = wpdma_tx_r32(dev, cur->base, cur->offset);
804775dfc2885e Felix Fietkau 2022-04-05  68  			break;
804775dfc2885e Felix Fietkau 2022-04-05  69  		case DUMP_TYPE_WPDMA_TXFREE:
804775dfc2885e Felix Fietkau 2022-04-05  70  			val = wpdma_txfree_r32(dev, cur->offset);
804775dfc2885e Felix Fietkau 2022-04-05  71  			break;

There are no DUMP_TYPE_WPDMA_RX and DUMP_TYPE_WED_RRO cases or a default
case.

804775dfc2885e Felix Fietkau 2022-04-05  72  		}
804775dfc2885e Felix Fietkau 2022-04-05 @73  		print_reg_val(s, cur->name, val);
804775dfc2885e Felix Fietkau 2022-04-05  74  	}
804775dfc2885e Felix Fietkau 2022-04-05  75  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

