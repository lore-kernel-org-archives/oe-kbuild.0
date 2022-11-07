Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E733915B0;
	Mon,  7 Nov 2022 12:39:28 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id z14so16010428wrn.7;
        Mon, 07 Nov 2022 04:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tF3AVDlvfgwFbRPAbroPXg4c2lRQTcLkG8VSQHRXx54=;
        b=pQizRBL+xXM0sLYTqNl+V+hDG+9nSDnn/SqtSyk06JN1Ca4bo/51Mnde0MbCp3iDgV
         5D453+OLnLjSWBz9F/bgCU3ioFdeeah9EkAa7uamZEG2elQV/mbxFoEai3uIWuAguDSK
         Rn2UgG7dlH8JdOXihG/7/9nNZ3Z6ZGybTEyLTangRHOc5WgrcV4RKb/qnZYMOeY6VThk
         23WIvTLeeXT3ikUVRJJlM8oBHTNK2U4syg6/fEvDwGHv+jGECu6+enoNAduCusQ4qle3
         U3rnMWRhY9lPopYNFAfp7H7+wTcz1RF7ub3jopPYU0Qg4blvvdOzShfB2mSbzs1q2gE5
         lT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tF3AVDlvfgwFbRPAbroPXg4c2lRQTcLkG8VSQHRXx54=;
        b=DG9ewA5U+eKv+OMPp+ivrVrn0XlZvNmDSiIi9UkkcAh30lv4cJZC51vite3Yjl31Yc
         2+9SQ0Sib3RMnMzQHCUwnSHidAbFuXSXdFaxo2cNyxB4CsINcUP9cSfF+lSIzCYjNXtO
         sgM3rMEFUqjl8McignTUhdWpNJKpmliSa+HKHPLRLchvkctKRI3isXMrMti6pI2pxylN
         T2xkiGUrSTc7m1Yv9t6eiGvZlWVIIQbIynd0/VGnfBDanET6Fh/DG1g8yMyV5q48pmPT
         dwyilH2ZeKKXmFW81bvnRS1j8JoMfSpKfNZN87jzG/oXbUERR0suasuQN01/E1LRBiod
         4aGA==
X-Gm-Message-State: ANoB5pnergbNDN8c3f8G0X9VhrBACo3F0lK4LMl0MShhwsaeVPyqUGhe
	eTMQtiC6djK9SR5eOKAyD/kUcOpzPxw=
X-Google-Smtp-Source: AA0mqf7nXuOPjnpMaFiuRGqHP7OKbe1G+nuIZBxEC2rASluOrnG4IJOUIcgBO6IddMO9bAoa3j3zgw==
X-Received: by 2002:a5d:6392:0:b0:23b:4b0d:4591 with SMTP id p18-20020a5d6392000000b0023b4b0d4591mr10444642wru.635.1667824766518;
        Mon, 07 Nov 2022 04:39:26 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y15-20020a1c4b0f000000b003b31c560a0csm7957230wma.12.2022.11.07.04.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 04:39:26 -0800 (PST)
Date: Mon, 7 Nov 2022 15:39:23 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [ammarfaizi2-block:tglx/devel/devmsi 46/86] kernel/irq/msi.c:399
 msi_domain_get_virq() warn: inconsistent returns '&dev->msi.data->mutex'.
Message-ID: <202211070346.0vaondmd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221107123923.zzAPHAtpeuxYI2cVP7jn-RNjlavWkyLPBvA0_5j8h9E@z>

tree:   https://github.com/ammarfaizi2/linux-block tglx/devel/devmsi
head:   ba77f809fa66b636222f6677ec7cf8faa1562fe7
commit: 022573e1aaf0745ab002f898c5d4aa0f0ae5ec09 [46/86] genirq/msi: Make msi_get_virq() device domain aware
config: openrisc-randconfig-m031-20221106
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
kernel/irq/msi.c:399 msi_domain_get_virq() warn: inconsistent returns '&dev->msi.data->mutex'.

vim +399 kernel/irq/msi.c

022573e1aaf074 Ahmed S. Darwish 2022-11-03  361  unsigned int msi_domain_get_virq(struct device *dev, unsigned int domid, unsigned int index)
cf15f43acaad31 Thomas Gleixner  2021-12-10  362  {
cf15f43acaad31 Thomas Gleixner  2021-12-10  363  	struct msi_desc *desc;
495c66aca3da70 Thomas Gleixner  2021-12-06  364  	unsigned int ret = 0;
022573e1aaf074 Ahmed S. Darwish 2022-11-03  365  	bool pcimsi = false;
022573e1aaf074 Ahmed S. Darwish 2022-11-03  366  	int base;
cf15f43acaad31 Thomas Gleixner  2021-12-10  367  
cf15f43acaad31 Thomas Gleixner  2021-12-10  368  	if (!dev->msi.data)
cf15f43acaad31 Thomas Gleixner  2021-12-10  369  		return 0;
cf15f43acaad31 Thomas Gleixner  2021-12-10  370  
022573e1aaf074 Ahmed S. Darwish 2022-11-03  371  	if (WARN_ON_ONCE(index >= MSI_MAX_INDEX))
022573e1aaf074 Ahmed S. Darwish 2022-11-03  372  		return 0;
022573e1aaf074 Ahmed S. Darwish 2022-11-03  373  
022573e1aaf074 Ahmed S. Darwish 2022-11-03  374  	/* This check is only valid for the PCI default MSI domain */
022573e1aaf074 Ahmed S. Darwish 2022-11-03  375  	if (dev_is_pci(dev) && domid == MSI_DEFAULT_DOMAIN)
022573e1aaf074 Ahmed S. Darwish 2022-11-03  376  		pcimsi = to_pci_dev(dev)->msi_enabled;
cf15f43acaad31 Thomas Gleixner  2021-12-10  377  
495c66aca3da70 Thomas Gleixner  2021-12-06  378  	msi_lock_descs(dev);
022573e1aaf074 Ahmed S. Darwish 2022-11-03  379  
022573e1aaf074 Ahmed S. Darwish 2022-11-03  380  	base = msi_get_domain_base_index(dev, domid);
022573e1aaf074 Ahmed S. Darwish 2022-11-03  381  	if (base < 0)
022573e1aaf074 Ahmed S. Darwish 2022-11-03  382  		return 0;

msi_unlock_descs();?

022573e1aaf074 Ahmed S. Darwish 2022-11-03  383  
022573e1aaf074 Ahmed S. Darwish 2022-11-03  384  	desc = xa_load(&dev->msi.data->__store, base + pcimsi ? 0 : index);
cd6cf06590b979 Thomas Gleixner  2021-12-06  385  	if (desc && desc->irq) {
cf15f43acaad31 Thomas Gleixner  2021-12-10  386  		/*
cd6cf06590b979 Thomas Gleixner  2021-12-06  387  		 * PCI-MSI has only one descriptor for multiple interrupts.
cf15f43acaad31 Thomas Gleixner  2021-12-10  388  		 * PCI-MSIX and platform MSI use a descriptor per
cf15f43acaad31 Thomas Gleixner  2021-12-10  389  		 * interrupt.
cf15f43acaad31 Thomas Gleixner  2021-12-10  390  		 */
cd6cf06590b979 Thomas Gleixner  2021-12-06  391  		if (pcimsi) {
cd6cf06590b979 Thomas Gleixner  2021-12-06  392  			if (index < desc->nvec_used)
cd6cf06590b979 Thomas Gleixner  2021-12-06  393  				ret = desc->irq + index;
cd6cf06590b979 Thomas Gleixner  2021-12-06  394  		} else {
495c66aca3da70 Thomas Gleixner  2021-12-06  395  			ret = desc->irq;
cf15f43acaad31 Thomas Gleixner  2021-12-10  396  		}
495c66aca3da70 Thomas Gleixner  2021-12-06  397  	}
495c66aca3da70 Thomas Gleixner  2021-12-06  398  	msi_unlock_descs(dev);
495c66aca3da70 Thomas Gleixner  2021-12-06 @399  	return ret;
cf15f43acaad31 Thomas Gleixner  2021-12-10  400  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

