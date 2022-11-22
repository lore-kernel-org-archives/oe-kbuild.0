Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E33EA4;
	Tue, 22 Nov 2022 14:55:07 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id e13so20969082edj.7;
        Tue, 22 Nov 2022 06:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2wFSWoFIJfsyyiI2M/5aDDolOMz28JVVqrVpNUDbq6Y=;
        b=I0nXhQ7WOfMJBv6y5tqaII0gpWbAAn2e1agEwR4ZUVLsjzyFAjcm8oHM2DKp1wTpgV
         UjZj/R+o5YQhc/IQ509Ds1vW1YZAdhsaT4DgfhsFCb4ddDb9rWBeHjuG4ETA7LkJlVUm
         n+mvUD3+sY/a/C/opEp9EMERGYEpPZ1tgmh8BptPOZmtSOwfmUSaIvYNrX9osiAS2MMw
         pFI8LLrF2ymRQlg8GgsNADS+Wsa+fAI6SVARXmRJQxNEmSEMqNQYC3aL7Pe4F0asW3RZ
         kqiqTuK+mhlbnwq+8uA9C1Gzb0GUh7a4b6OyHcnuKgeGUmkJ67iKyZJ1YX/Fqg9Es7Mk
         QH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2wFSWoFIJfsyyiI2M/5aDDolOMz28JVVqrVpNUDbq6Y=;
        b=6vfv3OCY9YF8Lc4dyxGY12/vXYaJpxJhragnKtaEzaZYzuLytWuyj3YG05g9ILPtRt
         7h75x9Xitow9LRdAQjx+Ge2flZYyj521XamVtx3R1JlHb6NCz4p70D8wRqNZAbGDg3Pd
         7J2sSKyU/0CwE1ZPlQBT69VHZEXh3lETNDtO9CfhQ1XEXogvpS9acgl9UAKgYI4G+NBg
         enifQkchsP0hZE3Nx27voP9d0xivKojVl+4vG12Uc8vY82HBFabwEeWBp3vrvYSuMdPO
         lyukzqHY+Nmo4k5/6HRNASVUXeYIyJr/deyDqjnsPgEbpecs6OzkkvNI+0/LpXUEItkS
         93Gw==
X-Gm-Message-State: ANoB5plktRym4OSjQexC4QX4T4K+DtxMMHLHB+kQwS5msh1AnAQy2Ukp
	PtWtbMHbLqpvZcJacecTATUaxMifI3M=
X-Google-Smtp-Source: AA0mqf47TdDZzPzKbjISZgR8bvQlBp/UAh6B3+Nn5Vsva1XJXlg6B6LcP4pR6nkz4CPhpTtpI4o4AA==
X-Received: by 2002:aa7:c9cd:0:b0:461:891a:8162 with SMTP id i13-20020aa7c9cd000000b00461891a8162mr21041340edt.398.1669128905549;
        Tue, 22 Nov 2022 06:55:05 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c18-20020a17090618b200b0073a20469f31sm6141978ejf.41.2022.11.22.06.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 06:55:04 -0800 (PST)
Date: Tue, 22 Nov 2022 17:55:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Abel Vesa <abel.vesa@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/3] usb: Add USB repeater generic framework
Message-ID: <202211222219.nT22Ba7b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116123019.2753230-2-abel.vesa@linaro.org>
Message-ID: <20221122145500.90iD7Ltjp99ouYsu1u3Nu-GbssY4IIzcsBLS7t4g8mQ@z>

Hi Abel,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Vesa/usb-Add-generic-repeater-framework-and-SM8550-driver/20221116-203345
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20221116123019.2753230-2-abel.vesa%40linaro.org
patch subject: [RFC PATCH 1/3] usb: Add USB repeater generic framework
config: arc-randconfig-m041-20221122
compiler: arc-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/usb/repeater/repeater.c:111 devm_usb_get_repeater_by_node() error: uninitialized symbol 'flags'.

vim +/flags +111 drivers/usb/repeater/repeater.c

19c3fed685e0e8 Abel Vesa 2022-11-16   79  struct  usb_repeater *devm_usb_get_repeater_by_node(struct device *dev,
19c3fed685e0e8 Abel Vesa 2022-11-16   80  					  struct device_node *node,
19c3fed685e0e8 Abel Vesa 2022-11-16   81  					  struct notifier_block *nb)
19c3fed685e0e8 Abel Vesa 2022-11-16   82  {
19c3fed685e0e8 Abel Vesa 2022-11-16   83  	struct usb_repeater *rptr = ERR_PTR(-ENOMEM);
19c3fed685e0e8 Abel Vesa 2022-11-16   84  	struct usb_repeater *rptr_devm;
19c3fed685e0e8 Abel Vesa 2022-11-16   85  	unsigned long flags;
19c3fed685e0e8 Abel Vesa 2022-11-16   86  
19c3fed685e0e8 Abel Vesa 2022-11-16   87  	rptr_devm = devres_alloc(devm_usb_repeater_release,
19c3fed685e0e8 Abel Vesa 2022-11-16   88  					sizeof(*rptr_devm), GFP_KERNEL);
19c3fed685e0e8 Abel Vesa 2022-11-16   89  	if (!rptr_devm) {
19c3fed685e0e8 Abel Vesa 2022-11-16   90  		dev_dbg(dev, "failed to allocate memory for devres\n");
19c3fed685e0e8 Abel Vesa 2022-11-16   91  		goto err0;

return ERR_PTR(-ENOMEM);

19c3fed685e0e8 Abel Vesa 2022-11-16   92  	}
19c3fed685e0e8 Abel Vesa 2022-11-16   93  
19c3fed685e0e8 Abel Vesa 2022-11-16   94  	spin_lock_irqsave(&usb_repeater_lock, flags);
19c3fed685e0e8 Abel Vesa 2022-11-16   95  
19c3fed685e0e8 Abel Vesa 2022-11-16   96  	rptr = of_usb_find_repeater(node);
19c3fed685e0e8 Abel Vesa 2022-11-16   97  	if (IS_ERR(rptr)) {
19c3fed685e0e8 Abel Vesa 2022-11-16   98  		devres_free(rptr_devm);
19c3fed685e0e8 Abel Vesa 2022-11-16   99  		goto err0;
19c3fed685e0e8 Abel Vesa 2022-11-16  100  	}
19c3fed685e0e8 Abel Vesa 2022-11-16  101  
19c3fed685e0e8 Abel Vesa 2022-11-16  102  	if (!try_module_get(rptr->dev->driver->owner)) {
19c3fed685e0e8 Abel Vesa 2022-11-16  103  		rptr = ERR_PTR(-ENODEV);
19c3fed685e0e8 Abel Vesa 2022-11-16  104  		devres_free(rptr_devm);
19c3fed685e0e8 Abel Vesa 2022-11-16  105  		goto err0;
19c3fed685e0e8 Abel Vesa 2022-11-16  106  	}
19c3fed685e0e8 Abel Vesa 2022-11-16  107  	devres_add(dev, rptr_devm);
19c3fed685e0e8 Abel Vesa 2022-11-16  108  
19c3fed685e0e8 Abel Vesa 2022-11-16  109  	get_device(rptr->dev);
19c3fed685e0e8 Abel Vesa 2022-11-16  110  err0:
19c3fed685e0e8 Abel Vesa 2022-11-16 @111  	spin_unlock_irqrestore(&usb_repeater_lock, flags);
19c3fed685e0e8 Abel Vesa 2022-11-16  112  
19c3fed685e0e8 Abel Vesa 2022-11-16  113  	return rptr;
19c3fed685e0e8 Abel Vesa 2022-11-16  114  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

