Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9641106
	for <oe-kbuild@lists.linux.dev>; Tue,  2 May 2023 11:46:51 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f315712406so165059625e9.0
        for <oe-kbuild@lists.linux.dev>; Tue, 02 May 2023 04:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683028008; x=1685620008;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yTFNSvlNK9OLSuNfUZudfwb4eJQZN05dqmNmwC73cTc=;
        b=WDt4HwZKuTxhtTFvJzdvkyKlqlRuoWlMnrUZ7gi/kwR0y5kWfoD4CBneeatP/SmgiU
         At4yXcBE9n+u6xCrOk1V7OFqkEfkHZ1LGpyjvnaP/vMCNk6fyNh/21JKEuQBlow73Fb1
         hu7GhIr8AxoJ0DUgf0KyvjgnlnMyVV1Syf80qiN+hrcbPJKvZ0SiCAquvrzY4WquuR4/
         hzA8uVhPQHSYYBYG6iz8sFM0rsS86bOpAUuryjsYU5/ZNF0PlRTBFBnMjqI93f4YrX1p
         SmHo6jSiub/2+rnF9ZvpdI6Asfn94Thf6s78TDHLsRA3QmH52m/wy+95uLKnsJPO5v4M
         VhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683028008; x=1685620008;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yTFNSvlNK9OLSuNfUZudfwb4eJQZN05dqmNmwC73cTc=;
        b=hjR34TE4FGc/1trYm1wvXlClZfjDHEQ/epXtSns4IOWXB5uaoWJH+GrbNCSubFvx6W
         E8LKA3osu83ps7IlXoWQyWQ3Vt3pqAtqRPiD5vXDy4wxz08vHoRucYvYTTF8TanfpMfE
         bx7/Iw0wxwnglyOPZMxgNIL/bXo5OKDswjHQXkMWbz4Yu2fs56EN0bk9VmaFPnRiDTI0
         mZVfQmn2WyaaBqzWfwxNrOKn0u3Zef7qKfaUvaUHLPROG6ez/fuhVaFWqA1orLirceak
         cE38jswxFdmv44nX4lOemREu1nAcPhageVeh/o+6WNh/FyxnhbWQEMXkobVauJ2Y6Dq4
         NEiw==
X-Gm-Message-State: AC+VfDwBaTf/KrBf9elZ20p62+kUOxZrCjRJYpzapkKZhLsHXIfe9ywZ
	uy7myzY+za47KflgKzdUaa9De9HSYF3+X7lnACk=
X-Google-Smtp-Source: ACHHUZ5rR7wCjfAAKk7jnBh8uBGAfKGBbPcT4RpfbFNkbLYg30cHXAdl/ws1cFihoZd3fLf1/QWhIA==
X-Received: by 2002:a05:6000:128e:b0:2fb:b869:bc08 with SMTP id f14-20020a056000128e00b002fbb869bc08mr13523307wrx.23.1683028008490;
        Tue, 02 May 2023 04:46:48 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o2-20020a05600c4fc200b003f1738e64c0sm38899117wmq.20.2023.05.02.04.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 04:46:46 -0700 (PDT)
Date: Tue, 2 May 2023 14:46:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Zheng Wang <zyytlz.wz@163.com>,
	matt.hsiao@hpe.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, arnd@arndb.de,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	hackerzheng666@gmail.com, 1395428693sheep@gmail.com,
	alex000young@gmail.com, Zheng Wang <zyytlz.wz@163.com>
Subject: Re: [PATCH] misc: hpilo: Fix use after free bug in ilo_remove due to
 race condition with ilo_open
Message-ID: <cabf202f-a58e-4637-9d55-b0382360c27e@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417165246.467723-1-zyytlz.wz@163.com>

Hi Zheng,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zheng-Wang/misc-hpilo-Fix-use-after-free-bug-in-ilo_remove-due-to-race-condition-with-ilo_open/20230418-005502
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20230417165246.467723-1-zyytlz.wz%40163.com
patch subject: [PATCH] misc: hpilo: Fix use after free bug in ilo_remove due  to race condition with ilo_open
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230430/202304300909.ALHN6Vry-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304300909.ALHN6Vry-lkp@intel.com/

smatch warnings:
drivers/misc/hpilo.c:755 ilo_delete() warn: can 'ilo_hw' even be NULL?

vim +/ilo_hw +755 drivers/misc/hpilo.c

13a22f45e6cb1e Zheng Wang      2023-04-18  749  static void ilo_delete(struct kref *kref)
13a22f45e6cb1e Zheng Wang      2023-04-18  750  {
13a22f45e6cb1e Zheng Wang      2023-04-18  751  	int i, minor;
13a22f45e6cb1e Zheng Wang      2023-04-18  752  	struct ilo_hwinfo *ilo_hw = container_of(kref, struct ilo_hwinfo, refcnt);
13a22f45e6cb1e Zheng Wang      2023-04-18  753  	struct pci_dev *pdev = ilo_hw->ilo_dev;
89bcb05d9bbf8b David Altobelli 2008-07-02  754  
ebf1b764aa5cb3 Mark Rusk       2012-11-06 @755  	if (!ilo_hw)
                                                            ^^^^^^^

->refcnt member isn't the first struct member so this NULL check
doesn't make sense.  Generally checking container_of() is ugly.  Some
people do it and add BUILD_BUG_ON() to ensure that they're checking the
first struct member but really it's best to avoid that if possible.

ebf1b764aa5cb3 Mark Rusk       2012-11-06  756  		return;
ebf1b764aa5cb3 Mark Rusk       2012-11-06  757  
89bcb05d9bbf8b David Altobelli 2008-07-02  758  	clear_device(ilo_hw);
89bcb05d9bbf8b David Altobelli 2008-07-02  759  
89bcb05d9bbf8b David Altobelli 2008-07-02  760  	minor = MINOR(ilo_hw->cdev.dev);
98dcd59dd063dd Camuso, Tony    2012-06-10  761  	for (i = minor; i < minor + max_ccb; i++)
89bcb05d9bbf8b David Altobelli 2008-07-02  762  		device_destroy(ilo_class, MKDEV(ilo_major, i));
89bcb05d9bbf8b David Altobelli 2008-07-02  763  
89bcb05d9bbf8b David Altobelli 2008-07-02  764  	cdev_del(&ilo_hw->cdev);
9f7048412163d8 David Altobelli 2009-08-17  765  	ilo_disable_interrupts(ilo_hw);
9f7048412163d8 David Altobelli 2009-08-17  766  	free_irq(pdev->irq, ilo_hw);
89bcb05d9bbf8b David Altobelli 2008-07-02  767  	ilo_unmap_device(pdev, ilo_hw);
89bcb05d9bbf8b David Altobelli 2008-07-02  768  	pci_release_regions(pdev);
bcdee04ea7ae04 Jiri Slaby      2012-09-13  769  	/*
bcdee04ea7ae04 Jiri Slaby      2012-09-13  770  	 * pci_disable_device(pdev) used to be here. But this PCI device has
bcdee04ea7ae04 Jiri Slaby      2012-09-13  771  	 * two functions with interrupt lines connected to a single pin. The
bcdee04ea7ae04 Jiri Slaby      2012-09-13  772  	 * other one is a USB host controller. So when we disable the PIN here
bcdee04ea7ae04 Jiri Slaby      2012-09-13  773  	 * e.g. by rmmod hpilo, the controller stops working. It is because
bcdee04ea7ae04 Jiri Slaby      2012-09-13  774  	 * the interrupt link is disabled in ACPI since it is not refcounted
bcdee04ea7ae04 Jiri Slaby      2012-09-13  775  	 * yet. See acpi_pci_link_free_irq called from acpi_pci_irq_disable.
bcdee04ea7ae04 Jiri Slaby      2012-09-13  776  	 */
89bcb05d9bbf8b David Altobelli 2008-07-02  777  	kfree(ilo_hw);
98dcd59dd063dd Camuso, Tony    2012-06-10  778  	ilo_hwdev[(minor / max_ccb)] = 0;
89bcb05d9bbf8b David Altobelli 2008-07-02  779  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

