Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E2712EBD6
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Jun 2024 05:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718258242; cv=none; b=qzSXI6i/lVQ3jC+VrelN3ByVhURvEOwEW/Gp3fMvKjVaN9m4eBPwjgymkmVHgk1abBEqaFr7P3Zqtuig9oOJktcsPYVsWI7rBU0ohsdybyH6t3qvAmX/VZKr6KRl+B7Qbms1VY8pVZgupaGG888ToaL+geWnf6xD5FB9pr+W7Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718258242; c=relaxed/simple;
	bh=MJdN135TenqEQBQ3xiF28af4NFZx/CbbTZNQzcjENIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PXMjsIBtmWG+J2bRxg8Jx6ufv87IBl32kJ/JlyFGb7ySR1bnyeVG0jFm8Psg4QUcCHji5w0EEvKx3ffdDIayqsQdGWvGswr8U1Tyc2In6n6G7/h7V0P6u6BKaF2/dwdrPiF+sBaroNY5kFy/9SkVfuYHzrNyKzGzvM36DQ3E8PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PM+I6EdK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PM+I6EdK"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4217d451f69so6356135e9.0
        for <oe-kbuild@lists.linux.dev>; Wed, 12 Jun 2024 22:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718258238; x=1718863038; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=caHeE9ePEp+sugnxiiOHn0DpPrQ59FW7YgAtSlyt8BU=;
        b=PM+I6EdKaWxnE9hWJzWrMfVN+4dBuXRa1oF57k+p6Moc80rO+spwqjhXxzv8pl//Fa
         jcgrxodpKr2dfSHY7EFHxFG0aBNel5WUkivlsXpA8MGI9duSsyP4Z5Ng4IDgEoYJFcLZ
         +ityxo1IYJ4GGTXImia4uwrvJLIFa3P1//+78ahHHBlyq1SVHDuKQ5TGVP9MMU1V1m8N
         K5uCZrOWehE4WQ/K6C1ZfB6yP0GapKsVZHtrDZiw+GUg6WkbrgMB9z9f4GRpupakvk3v
         TzlG6Ha3HXafi7e+VoQzPIgMTPh1g9VYsnx3o3Flcb/JqVWGvbr/OF8WUgrLbroc7Jsk
         SyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718258238; x=1718863038;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=caHeE9ePEp+sugnxiiOHn0DpPrQ59FW7YgAtSlyt8BU=;
        b=jA9jIeOrf69NkAhrpokN5AMcQimK3nktFKxoA2UoYPxsY6drGv2jJbZ1nkyNGR3DM6
         /R5jH1qcNqMYwnC4vDtIrfqRZQX0o2DpTQPv3ahF26JB6IroJzbCKlkUf8LTVSj4JjiE
         Lol+QEVEvfX6VemwGE7R2OS5teou0BvecSRW02TQtKQYzi/2GcYuSxt5QinWbY268IDl
         q2g+IBTgJxamKIicq/xWTYVloHe/1LVnEw7uLrY/9IsCNHGaTv6B4fGk8GN+DxFktcEo
         pgXTkpjewu1h1rCPUCogsJdL/9Hdnsg9HaGsy4M+28XwW0iQy96jNi6vksxHN7zevByG
         lA3A==
X-Gm-Message-State: AOJu0YwGfXHSTxzXEaoo2Vsddo0ugV7Q9RW+TGUuGfPKmBOAUUW+kd8q
	m7euXVudrk7aF/TaW1oZj3Kw65cEZI3IJgAuURlQ6qXt9YcXh2nxbSKMgfMT2Q8yGvIT/QfSFFN
	/
X-Google-Smtp-Source: AGHT+IEWIwa40VxP/Xvwp2V15etuHLo7iOeH/OGA9JOZTJuuibeav9Qq+XmMcfisXacjqD2Pgx3PYg==
X-Received: by 2002:a05:600c:3486:b0:421:7983:f1d3 with SMTP id 5b1f17b1804b1-422862aca3cmr28337595e9.9.1718258237609;
        Wed, 12 Jun 2024 22:57:17 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f641a666sm10364115e9.45.2024.06.12.22.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 22:57:17 -0700 (PDT)
Date: Thu, 13 Jun 2024 08:57:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org
Subject: [driver-core:const_driver 12/12] drivers/usb/core/driver.c:80
 store_id() error: uninitialized symbol 'usb_dynid'.
Message-ID: <5cd22783-8150-4101-9dc5-c556d94fce22@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git const_driver
head:   be520b87ec28aa3b5c908a859501fb601bd8b322
commit: be520b87ec28aa3b5c908a859501fb601bd8b322 [12/12] USB: move dynamic ids out of usb driver structures
config: i386-randconfig-141-20240613 (https://download.01.org/0day-ci/archive/20240613/202406130740.HIr25kIC-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406130740.HIr25kIC-lkp@intel.com/

smatch warnings:
drivers/usb/core/driver.c:80 store_id() error: uninitialized symbol 'usb_dynid'.

vim +/usb_dynid +80 drivers/usb/core/driver.c

be520b87ec28aa Greg Kroah-Hartman 2024-06-11  70  static int store_id(const struct device_driver *driver, const struct usb_device_id *id)
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  71  {
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  72  	struct usb_dynids *u;
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  73  	struct usb_dynid *usb_dynid;
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  74  
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  75  	u = usb_find_dynids(driver);
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  76  	if (!u) {
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  77  		/* This driver has not stored any ids yet, so make a new entry for it */
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  78  		u = kmalloc(sizeof(*u), GFP_KERNEL);
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  79  		if (!u) {
be520b87ec28aa Greg Kroah-Hartman 2024-06-11 @80  			kfree(usb_dynid);

Delete the kfree()

be520b87ec28aa Greg Kroah-Hartman 2024-06-11  81  			return -ENOMEM;
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  82  		}
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  83  		u->driver = driver;
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  84  		INIT_LIST_HEAD(&u->list);
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  85  		guard(spinlock)(&usb_dynids_lock);
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  86  		list_add_tail(&u->node, &usb_dynids);
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  87  	}
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  88  
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  89  	/* Allocate a new entry and add it to the list of driver ids for this driver */
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  90  	usb_dynid = kmalloc(sizeof(*usb_dynid), GFP_KERNEL);
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  91  	if (!usb_dynid)
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  92  		return -ENOMEM;
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  93  
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  94  	INIT_LIST_HEAD(&usb_dynid->node);
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  95  	memcpy(&usb_dynid->id, id, sizeof(*id));
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  96  	list_add_tail(&usb_dynid->node, &u->list);
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  97  	return 0;
be520b87ec28aa Greg Kroah-Hartman 2024-06-11  98  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

