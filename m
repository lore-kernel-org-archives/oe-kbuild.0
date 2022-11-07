Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115E22565;
	Mon,  7 Nov 2022 07:50:47 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso9047782wme.5;
        Sun, 06 Nov 2022 23:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xn1piaXxc21W8WIXCvaPByn+C5mJyUz3dv2gAqZymug=;
        b=Jdd40BIHbir1vpkDqGuu45WPRNXRhjkMSSndFd7uA/NemHVnSYCy7FMm8SgVWagKGo
         zOGDtO61jet2Hzhh4gG/4mmZkcT1R7IW+mscOjRVaiztllIa+eZn5B0F6vzWKmdygOg8
         ZZ10l365Tyla9Vs+TejOOdmScVsHQlgodivyPnLq3A9hTIADHVnLefI300zKpAIVKhvv
         InOMuMQGk+0IZtvTHW45u7fGsL9mjinyaSiS8BoSG+p9tH5zLAoMYuHGlT0I87WY+rAS
         ia/ErsT770AQ7ABjbLQr+AXqE1FUk6mf8xBpYYgoWntLMpXajjwpNIdo4BXN3ruWJGbr
         BV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xn1piaXxc21W8WIXCvaPByn+C5mJyUz3dv2gAqZymug=;
        b=l4tKTbN6QtosYvd/5WuhCiLtW9JcCUtRvHKZtNOi2wJYunK+PVV/2AE1/iE8dURN2u
         W5wDyupBwB1Iz/3Ol6rSCZdIsK9y7cjqOFUAdyR2PAR6YjqQ6V48FkWA7Pmy+SWgBa42
         CXOdX6JeaoTCvDSx3FTVyfSGCIezP3jYbpQfHDTiUF25hakIQqZfHlDoCdOht30ZZ72J
         3/fcyLiU4ieynfrAAFndHdyhbLfIDd09Ek2Ymzt6wohz66x7IFl1BtKdu0x0MOKreeBm
         Bzvx2KqByIMSqFxmb8i79nEYqp8ElH9dSduUfOsJ8lLxScQIB+C1fSSX1k8rKxrXD7DS
         4sFw==
X-Gm-Message-State: ACrzQf2JYizpRtX7eotrxVDU85coG3IGTsXV7xQhXRVJaRlPHZSsvWuR
	2nG4QsezRt6cVNeE5FgDHnOsY5Jh+mI=
X-Google-Smtp-Source: AMsMyM5Y0xS9zKpwtO3S/J2nFpEkEf4LKkL2xR9sTBwwc4rJmFzmVbCISYRZ3sj48GXkSOTGubkEDg==
X-Received: by 2002:a1c:a107:0:b0:3cf:a25f:eef2 with SMTP id k7-20020a1ca107000000b003cfa25feef2mr6468699wme.195.1667807445967;
        Sun, 06 Nov 2022 23:50:45 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m21-20020a7bca55000000b003c6c182bef9sm12584534wml.36.2022.11.06.23.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 23:50:45 -0800 (PST)
Date: Mon, 7 Nov 2022 10:50:37 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, 'Guanjun' <guanjun@linux.alibaba.com>,
	herbert@gondor.apana.org.au, elliott@hpe.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	zelin.deng@linux.alibaba.com, artie.ding@linux.alibaba.com,
	guanjun@linux.alibaba.com, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, xuchun.shang@linux.alibaba.com
Subject: Re: [PATCH v3 RESEND 3/9] crypto/ycc: Add irq support for ycc kernel
 rings
Message-ID: <202211060128.TZF4P1Ko-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1667461243-48652-4-git-send-email-guanjun@linux.alibaba.com>
Message-ID: <20221107075037.rV8Hly1GY9RJAOFV_Ph6MJ6LJHp1d70VtkZ9HApESv4@z>

Hi 'Guanjun',

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guanjun/Drivers-for-Alibaba-YCC-Yitian-Cryptography-Complex-cryptographic-accelerator/20221103-154448
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/1667461243-48652-4-git-send-email-guanjun%40linux.alibaba.com
patch subject: [PATCH v3 RESEND 3/9] crypto/ycc: Add irq support for ycc kernel rings
config: ia64-randconfig-m031-20221104
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/crypto/ycc/ycc_isr.c:124 ycc_alloc_irqs() warn: missing error code 'ret'

vim +/ret +124 drivers/crypto/ycc/ycc_isr.c

99da43fc5ee114 Zelin Deng 2022-11-03   98  
99da43fc5ee114 Zelin Deng 2022-11-03   99  int ycc_alloc_irqs(struct ycc_dev *ydev)
99da43fc5ee114 Zelin Deng 2022-11-03  100  {
99da43fc5ee114 Zelin Deng 2022-11-03  101  	struct pci_dev *rcec_pdev = ydev->assoc_dev->pdev;
99da43fc5ee114 Zelin Deng 2022-11-03  102  	int num = ydev->is_vf ? 1 : YCC_RINGPAIR_NUM;
3c2d80e20cfe81 Zelin Deng 2022-11-03  103  	int cpu, cpus = num_online_cpus();
3c2d80e20cfe81 Zelin Deng 2022-11-03  104  	int ret, i, j;
99da43fc5ee114 Zelin Deng 2022-11-03  105  
3c2d80e20cfe81 Zelin Deng 2022-11-03  106  	/* The 0 - (YCC_RINGPAIR_NUM-1) are rings irqs, the last one is dev error irq */
99da43fc5ee114 Zelin Deng 2022-11-03  107  	sprintf(ydev->err_irq_name, "ycc_dev_%d_global_err", ydev->id);
99da43fc5ee114 Zelin Deng 2022-11-03  108  	ret = request_irq(pci_irq_vector(rcec_pdev, num),
99da43fc5ee114 Zelin Deng 2022-11-03  109  			  ycc_g_err_isr, 0, ydev->err_irq_name, ydev);
3c2d80e20cfe81 Zelin Deng 2022-11-03  110  	if (ret) {
99da43fc5ee114 Zelin Deng 2022-11-03  111  		pr_err("Failed to alloc global irq interrupt for dev: %d\n", ydev->id);
3c2d80e20cfe81 Zelin Deng 2022-11-03  112  		goto out;
3c2d80e20cfe81 Zelin Deng 2022-11-03  113  	}
3c2d80e20cfe81 Zelin Deng 2022-11-03  114  
3c2d80e20cfe81 Zelin Deng 2022-11-03  115  	if (ydev->is_polling)
3c2d80e20cfe81 Zelin Deng 2022-11-03  116  		goto out;
3c2d80e20cfe81 Zelin Deng 2022-11-03  117  
3c2d80e20cfe81 Zelin Deng 2022-11-03  118  	for (i = 0; i < num; i++) {
3c2d80e20cfe81 Zelin Deng 2022-11-03  119  		if (ydev->rings[i].type != KERN_RING)
3c2d80e20cfe81 Zelin Deng 2022-11-03  120  			continue;
3c2d80e20cfe81 Zelin Deng 2022-11-03  121  
3c2d80e20cfe81 Zelin Deng 2022-11-03  122  		ydev->msi_name[i] = kzalloc(16, GFP_KERNEL);
3c2d80e20cfe81 Zelin Deng 2022-11-03  123  		if (!ydev->msi_name[i])
3c2d80e20cfe81 Zelin Deng 2022-11-03 @124  			goto free_irq;

ret = -ENOMEM;

3c2d80e20cfe81 Zelin Deng 2022-11-03  125  		snprintf(ydev->msi_name[i], 16, "ycc_ring_%d", i);
3c2d80e20cfe81 Zelin Deng 2022-11-03  126  		ret = request_irq(pci_irq_vector(rcec_pdev, i), ycc_resp_isr,
3c2d80e20cfe81 Zelin Deng 2022-11-03  127  				  0, ydev->msi_name[i], &ydev->rings[i]);
3c2d80e20cfe81 Zelin Deng 2022-11-03  128  		if (ret) {
3c2d80e20cfe81 Zelin Deng 2022-11-03  129  			kfree(ydev->msi_name[i]);
3c2d80e20cfe81 Zelin Deng 2022-11-03  130  			goto free_irq;
3c2d80e20cfe81 Zelin Deng 2022-11-03  131  		}
3c2d80e20cfe81 Zelin Deng 2022-11-03  132  		if (!ydev->is_vf)
3c2d80e20cfe81 Zelin Deng 2022-11-03  133  			cpu = (i % YCC_RINGPAIR_NUM) % cpus;
3c2d80e20cfe81 Zelin Deng 2022-11-03  134  		else
3c2d80e20cfe81 Zelin Deng 2022-11-03  135  			cpu = smp_processor_id() % cpus;
3c2d80e20cfe81 Zelin Deng 2022-11-03  136  
3c2d80e20cfe81 Zelin Deng 2022-11-03  137  		ret = irq_set_affinity_hint(pci_irq_vector(rcec_pdev, i),
3c2d80e20cfe81 Zelin Deng 2022-11-03  138  					    get_cpu_mask(cpu));
3c2d80e20cfe81 Zelin Deng 2022-11-03  139  		if (ret) {
3c2d80e20cfe81 Zelin Deng 2022-11-03  140  			free_irq(pci_irq_vector(rcec_pdev, i), &ydev->rings[i]);
3c2d80e20cfe81 Zelin Deng 2022-11-03  141  			kfree(ydev->msi_name[i]);
3c2d80e20cfe81 Zelin Deng 2022-11-03  142  			goto free_irq;
3c2d80e20cfe81 Zelin Deng 2022-11-03  143  		}
3c2d80e20cfe81 Zelin Deng 2022-11-03  144  	}
3c2d80e20cfe81 Zelin Deng 2022-11-03  145  
3c2d80e20cfe81 Zelin Deng 2022-11-03  146  	return 0;
3c2d80e20cfe81 Zelin Deng 2022-11-03  147  
3c2d80e20cfe81 Zelin Deng 2022-11-03  148  free_irq:
3c2d80e20cfe81 Zelin Deng 2022-11-03  149  	for (j = 0; j < i; j++) {
3c2d80e20cfe81 Zelin Deng 2022-11-03  150  		if (ydev->rings[i].type != KERN_RING)
3c2d80e20cfe81 Zelin Deng 2022-11-03  151  			continue;
3c2d80e20cfe81 Zelin Deng 2022-11-03  152  
3c2d80e20cfe81 Zelin Deng 2022-11-03  153  		free_irq(pci_irq_vector(rcec_pdev, j), &ydev->rings[j]);
3c2d80e20cfe81 Zelin Deng 2022-11-03  154  		kfree(ydev->msi_name[j]);
3c2d80e20cfe81 Zelin Deng 2022-11-03  155  	}
3c2d80e20cfe81 Zelin Deng 2022-11-03  156  	free_irq(pci_irq_vector(rcec_pdev, num), ydev);
3c2d80e20cfe81 Zelin Deng 2022-11-03  157  out:
99da43fc5ee114 Zelin Deng 2022-11-03  158  
99da43fc5ee114 Zelin Deng 2022-11-03  159  	return ret;
99da43fc5ee114 Zelin Deng 2022-11-03  160  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

