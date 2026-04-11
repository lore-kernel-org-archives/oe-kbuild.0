Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581501C5D7D
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Apr 2026 08:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775894436; cv=none; b=bco0euw7NFhG3E4elXYzERtyvU10okPpUS+4+YztgUcIzk5jS5odH2YdK9WnKNJWLUL5XcWvtKKeC6lEh6riaai9/cICbBQTGeVETNFw0m3/rmc18ezXQR5l7GsZXcnC/8iLFlSaM2rwtrPLJTYoF3A1W2xBBxeszBK7rF4Mfe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775894436; c=relaxed/simple;
	bh=18rof0FAOg8SSH7UeT/G6ZJ2QtS1VJqgI+A1f2HZscg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R+R9jjXxElLgpV1Stv9bvC7kLjvRXzbN+s5zgBfvMJdF1NCqj5eax/vh3rw8WJFtQltQ73knxMOQW1sVQl72+XAUkCIgXir9625JsrUbAJu0uvLSjoKum9sfUcScfuu5WfpDNSUj4UFKafmw1bQYEAv5v0yfO1jEBSzZGbWM9GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SAwqQLQ2; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAwqQLQ2"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b150559bso21364995e9.1
        for <oe-kbuild@lists.linux.dev>; Sat, 11 Apr 2026 01:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775894432; x=1776499232; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HvDTNEGFLs6IzigTifHNQ2dGKAT9ic7dygGRAnZnhxA=;
        b=SAwqQLQ23hqeT9rMPEIq5BjGsSdW6PUn2bk+EpFSAAheXC/v3sHT8twVDGHupPo08c
         LJUtQIWZI17WWLCvP3O53gXhrFm74JQC0r3nrjV1h/Uhlkq93ABScpoLTQPI0UN24slr
         Kbh8MfjlpobgtI2z3EefHibNmVNZPCQDjoU9BjPC5rm8mzkHe8NVVXID8tGOvirRhr/4
         hq3X03vaxUIpUivl9Y2BU4CN1wZfTtATuk7DvqH0nwet/ZaJE7iEjpwJqse7zCGf5VuZ
         ebsR9i4OW3yQGhXOhNaYal8IXeXTXHTwvqaJJERemkT+e64q+PGcHoU/HeCzI0oPLRJl
         2JHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775894432; x=1776499232;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HvDTNEGFLs6IzigTifHNQ2dGKAT9ic7dygGRAnZnhxA=;
        b=dO8whJ46M9y5rUqcQkn9B04YteLyYtyYiWuV2/X/0+0hmKxrTZtTXKEkldsf84K3nQ
         +ezPtUTcBr18ekrBaW3Gm84scz5urH5nY9vNUGwJsNS8b0e5df3N/z+iqoTqSWXqWnVK
         5k6dIfHuv5a80VTPBfmvV6ih0/IRCzYMA9TU/EA2OoQxxpG6vSHiZZDnp67fqNpej+xS
         Z0PBtcQ0ch2gJM3sJFjQGW8jxCDqFWMuzYsi+pyJ9XBvDWlqhy06ayywp0EWLqqRPMPo
         uQm+9sjnJg99PkfQ5VFZSlMyDDUpv23AW8n2ac1rnMWTbXpiRTJ+q2UnUWDmg7/6FIad
         O+Bw==
X-Gm-Message-State: AOJu0YxsbjKFrzAtuzEr2ZRg2iCPNQnzA4b25uX1k5Z2U5jOOZmUNtwp
	zEKAFaA5dTGGci5gUUthRzyzT57c9PaO8+R943w6n7eB9uRPNLMIFu6sGJuxups6
X-Gm-Gg: AeBDievoZ/zZsV0lFF6S8G4rR+T1BzGMh0tygdWbdzureQS/ey+YGP6CmxGKhwpHTkH
	33DSGECj/pH7kcyyehY8ajvuFCI2ZBPINfk/KMx0LRgeAG2un/FYzHeqqwRsAab/qUrr/lHLzpZ
	dGCBJiIpjQfqVIbtxx3PUS8uFad2hmH1+OUA0F0wYKS5SaOpExcPAR18dDemo4e+EPMCjvKn5GF
	LiV7q2EwsuN4BUbNr8bTMggR+/k+EJX20MvFyt0HGj24OrhTv626W9dZOChwdUx5cGm/KwZIdcP
	grupeIOzWnBO0UHbLfDvxYMWsvxe+Lu1SeM8UvUHEeQM12rgQOmSjbXRmtMGQyzA3qt+5MfhOYP
	JQE2+wCMd+u069rqGhQ09v7FmJCOQWeuer/EdpcycW9MfioUiAACLYzNv8hatTQvZ6cqDCII+7R
	Fum3AgfHNE98ZUlEy5Cjg=
X-Received: by 2002:a05:6000:615:b0:43d:1bf6:927 with SMTP id ffacd0b85a97d-43d64292737mr8730734f8f.14.1775894432095;
        Sat, 11 Apr 2026 01:00:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63deb904sm14993252f8f.9.2026.04.11.01.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 01:00:31 -0700 (PDT)
Date: Sat, 11 Apr 2026 11:00:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: drivers/gpio/gpiolib.c:4732 gpiod_find_and_request() warn: 'desc'
 can also be NULL
Message-ID: <202604110938.6uIVnQtT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260411080027.XbgVQ09tKw22uPM14JEqEZI0n1Mb81_2QUpnAGV4Zx4@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7c6c4ed80b874f721bc7c2c937e098c56e37d2f0
commit: 1e4f6db614a310cc34d07ffbf031c76ea9581bcf gpiolib: support shared GPIOs in core subsystem code
config: x86_64-randconfig-161-20260410 (https://download.01.org/0day-ci/archive/20260411/202604110938.6uIVnQtT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1e4f6db614a3 ("gpiolib: support shared GPIOs in core subsystem code")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604110938.6uIVnQtT-lkp@intel.com/

smatch warnings:
drivers/gpio/gpiolib.c:4732 gpiod_find_and_request() warn: 'desc' can also be NULL

vim +/desc +4732 drivers/gpio/gpiolib.c

c6ccc4dde17676 Hans de Goede       2025-09-20  4643  
0d776cfd5e5b55 Stephen Boyd        2024-02-22  4644  struct gpio_desc *gpiod_find_and_request(struct device *consumer,
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4645  					 struct fwnode_handle *fwnode,
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4646  					 const char *con_id,
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4647  					 unsigned int idx,
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4648  					 enum gpiod_flags flags,
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4649  					 const char *label,
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4650  					 bool platform_lookup_allowed)
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4651  {
ba2dc1cb549171 Hans de Goede       2022-12-29  4652  	unsigned long lookupflags = GPIO_LOOKUP_FLAGS_DEFAULT;
5c887b65bbd1a3 Andy Shevchenko     2024-03-25  4653  	const char *name = function_name_or_default(con_id);
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4654  	/*
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4655  	 * scoped_guard() is implemented as a for loop, meaning static
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4656  	 * analyzers will complain about these two not being initialized.
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4657  	 */
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4658  	struct gpio_desc *desc = NULL;
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4659  	int ret = 0;
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4660  
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4661  	scoped_guard(srcu, &gpio_devices_srcu) {
c6ccc4dde17676 Hans de Goede       2025-09-20  4662  		desc = gpiod_fwnode_lookup(fwnode, consumer, con_id, idx,
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4663  					   &flags, &lookupflags);
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4664  		if (!IS_ERR_OR_NULL(desc) &&

Imagine desc is NULL

1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4665  		    test_bit(GPIOD_FLAG_SHARED, &desc->flags)) {
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4666  			/*
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4667  			 * We're dealing with a GPIO shared by multiple
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4668  			 * consumers. This is the moment to add the machine
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4669  			 * lookup table for the proxy device as previously
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4670  			 * we only knew the consumer's fwnode.
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4671  			 */
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4672  			ret = gpio_shared_add_proxy_lookup(consumer, lookupflags);
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4673  			if (ret)
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4674  				return ERR_PTR(ret);
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4675  
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4676  			/* Trigger platform lookup for shared GPIO proxy. */
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4677  			desc = ERR_PTR(-ENOENT);
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4678  			/* Trigger it even for fwnode-only gpiod_get(). */
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4679  			platform_lookup_allowed = true;
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4680  		}
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4681  
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4682  		if (gpiod_not_found(desc) && platform_lookup_allowed) {
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4683  			/*
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4684  			 * Either we are not using DT or ACPI, or their lookup
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4685  			 * did not return a result or this is a shared GPIO. In
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4686  			 * that case, use platform lookup as a fallback.
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4687  			 */
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4688  			dev_dbg(consumer,
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4689  				"using lookup tables for GPIO lookup\n");
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4690  			desc = gpiod_find(consumer, con_id, idx, &lookupflags);
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4691  		}
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4692  
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4693  		if (IS_ERR(desc)) {
5c887b65bbd1a3 Andy Shevchenko     2024-03-25  4694  			dev_dbg(consumer, "No GPIO consumer %s found\n", name);
0eadd36d912374 Dmitry Torokhov     2022-09-03  4695  			return desc;
0eadd36d912374 Dmitry Torokhov     2022-09-03  4696  		}
0eadd36d912374 Dmitry Torokhov     2022-09-03  4697  
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4698  		/*
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4699  		 * If a connection label was passed use that, else attempt to use
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4700  		 * the device name as label
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4701  		 */
0eadd36d912374 Dmitry Torokhov     2022-09-03  4702  		ret = gpiod_request(desc, label);
                                                                                    ^^^^
This would crash.  The zero day bot doesn't do cross function
analysis so it can't detect it.

e348544f7994d2 Bartosz Golaszewski 2024-01-19  4703  	}
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4704  	if (ret) {
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4705  		if (!(ret == -EBUSY && flags & GPIOD_FLAGS_BIT_NONEXCLUSIVE))
0eadd36d912374 Dmitry Torokhov     2022-09-03  4706  			return ERR_PTR(ret);
0eadd36d912374 Dmitry Torokhov     2022-09-03  4707  
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4708  		/*
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4709  		 * This happens when there are several consumers for the same
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4710  		 * GPIO line: we just return here without further
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4711  		 * initialization. It's a hack introduced long ago to support
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4712  		 * fixed regulators. We now have a better solution with
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4713  		 * automated scanning where affected platforms just need to
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4714  		 * select the provided Kconfig option.
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4715  		 *
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4716  		 * FIXME: Remove the GPIOD_FLAGS_BIT_NONEXCLUSIVE flag after
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4717  		 * making sure all platforms use the new mechanism.
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4718  		 */
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4719  		dev_info(consumer,
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4720  			 "nonexclusive access to GPIO for %s, consider updating your code to using gpio-shared-proxy\n",
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4721  			 name);
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4722  		return desc;
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4723  	}
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4724  
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4725  	ret = gpiod_configure_flags(desc, con_id, lookupflags, flags);
0eadd36d912374 Dmitry Torokhov     2022-09-03  4726  	if (ret < 0) {
0eadd36d912374 Dmitry Torokhov     2022-09-03  4727  		gpiod_put(desc);
39c9049770f8b5 Peng Fan            2024-03-25  4728  		dev_err(consumer, "setup of GPIO %s failed: %d\n", name, ret);
0eadd36d912374 Dmitry Torokhov     2022-09-03  4729  		return ERR_PTR(ret);
0eadd36d912374 Dmitry Torokhov     2022-09-03  4730  	}
0eadd36d912374 Dmitry Torokhov     2022-09-03  4731  
ee194b12bf9a2f Bartosz Golaszewski 2024-10-04 @4732  	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_REQUESTED);
0eadd36d912374 Dmitry Torokhov     2022-09-03  4733  
0eadd36d912374 Dmitry Torokhov     2022-09-03  4734  	return desc;
0eadd36d912374 Dmitry Torokhov     2022-09-03  4735  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

