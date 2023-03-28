Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED10CE4D7;
	Tue, 28 Mar 2023 10:23:20 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id y14so11601107wrq.4;
        Tue, 28 Mar 2023 03:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679998999;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QxW+TJpjbXUrQvGW9LH42fLHdtZaS20MnFJP7Kr0zKU=;
        b=Ln+mpSpPsb1fk+fi+4p1JCMWBC315xiyWnd7AAKrEYHJnB+RdZ98n+TppdBbli+UOG
         ppJsYsnbJlqMEIURSmp3tPUio4F2pN8vXRz9oN2xkuMAaiuUnkoWD6BNeQrYuB03C12Q
         fZq9tFZA6AbDPfXBMX33MR9+j0A4HhStg7ZhnYOGLg3xSDyJE8/1Ecz2js6wSVqBkzde
         Jo18FQkACTY3cM0OxZjDMd5AF0OH3QgMnI8Qeu3DiIOTxsVyc/7vjBzyJF1XmDAkuDOh
         9FwoXwuPwmJst2+T2PC5lb3ktUrdeEpEhew+OFb6sa/TphMeUUnRkGuur1s3CByideD+
         DTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679998999;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QxW+TJpjbXUrQvGW9LH42fLHdtZaS20MnFJP7Kr0zKU=;
        b=GrmcdDQtG34ybczgzm+y4WE6DRx+4J2wAjS4oEXeVKDSXC+ivJc5mfnWue79HMeF8Y
         ++9q+Au2pmaGKa0cIZYPVdfXUCVyvv5SOXXONWn8yabzGjAtPecf+4m8kT3cTOTc1JUG
         Bf3Ek5tPileTpJesSUnt/rSRBpGzIX5nAIJIh/3uYUnS9UqGrK3ecw2DkfBHQ5ScPEhg
         ppj7uo8JhpENEhfi3GCdcsyWQI7ODWWWAF6n8w4+2XineAx9lD5kifdjcOvxbub0rVuP
         Vvm3m/4xQR33zGLj812NC9yhLWRxvGszC8/rdwHidXX3fSHQeu2nHrhJVrlci3klBlXT
         dgJQ==
X-Gm-Message-State: AAQBX9d+2hHhA3ZBr8g01jaP3tN8bu9RwWV7ySwmQnir2HE31QrsE9Vt
	PazlmTOxkVBWDkSmLAJTCuHKUseTwK3QzA==
X-Google-Smtp-Source: AKy350YF7JgD271VSAGSNM2YUiKgqLFuq1d1+WSAvuT/yGqv2GqXaYYfvPuomwvkPdlf4lQyE/HwEQ==
X-Received: by 2002:adf:dbc8:0:b0:2c7:a3c:5bd6 with SMTP id e8-20020adfdbc8000000b002c70a3c5bd6mr12727822wrj.52.1679998998810;
        Tue, 28 Mar 2023 03:23:18 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o11-20020adfeacb000000b002cfefad9c1dsm27244816wrn.66.2023.03.28.03.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 03:23:18 -0700 (PDT)
Date: Tue, 28 Mar 2023 13:23:14 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Helge Deller <deller@gmx.de>
Subject: [linux-next:master 646/7309] arch/parisc/kernel/firmware.c:1271
 pdc_soft_power_button_panic() error: uninitialized symbol 'flags'.
Message-ID: <acbcffb2-5913-45c2-98ef-fe2f06501807@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a6faf7ea9fcb7267d06116d4188947f26e00e57e
commit: cf559f6a9e3a7228f402dc43cff08d0a47ee8b7c [646/7309] parisc: Replace regular spinlock with spin_trylock on panic path
config: parisc-randconfig-m031-20230326 (https://download.01.org/0day-ci/archive/20230328/202303281743.gzT66f6u-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303281743.gzT66f6u-lkp@intel.com/

New smatch warnings:
arch/parisc/kernel/firmware.c:1271 pdc_soft_power_button_panic() error: uninitialized symbol 'flags'.

Old smatch warnings:
arch/parisc/kernel/firmware.c:779 pdc_stable_read() warn: inconsistent indenting
arch/parisc/kernel/firmware.c:805 pdc_stable_write() warn: inconsistent indenting
arch/parisc/kernel/firmware.c:830 pdc_stable_get_size() warn: inconsistent indenting
arch/parisc/kernel/firmware.c:850 pdc_stable_verify_contents() warn: inconsistent indenting
arch/parisc/kernel/firmware.c:869 pdc_stable_initialize() warn: inconsistent indenting

vim +/flags +1271 arch/parisc/kernel/firmware.c

cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1260  int pdc_soft_power_button_panic(int sw_control)
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1261  {
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1262  	int retval;
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1263  	unsigned long flags;
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1264  
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1265  	if (!spin_trylock_irqsave(&pdc_lock, flags)) {
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1266  		pr_emerg("Couldn't enable soft power button\n");
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1267  		return -EBUSY; /* ignored by the panic notifier */
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1268  	}
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1269  
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1270  	retval = mem_pdc_call(PDC_SOFT_POWER, PDC_SOFT_POWER_ENABLE, __pa(pdc_result), sw_control);
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20 @1271  	spin_unlock_irqrestore(&pdc_lock, flags);

This is a weird warning.  I wonder if it has to do with the BOOTLOADER
stuff at the start of the file:

arch/parisc/kernel/firmware.c
    67  
    68  #if defined(BOOTLOADER)
    69  # undef  spin_lock_irqsave
    70  # define spin_lock_irqsave(a, b) { b = 1; }
    71  # undef  spin_unlock_irqrestore
    72  # define spin_unlock_irqrestore(a, b)
    73  #else
    74  static DEFINE_SPINLOCK(pdc_lock);
    75  #endif

No idea about parisc stuff though so I might be very wrong.

cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1272  
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1273  	return retval;
cf559f6a9e3a72 Guilherme G. Piccoli 2023-02-20  1274  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

