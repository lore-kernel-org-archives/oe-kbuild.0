Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEBBF507
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Aug 2024 06:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723877346; cv=none; b=d3zv+HkZC9qarxcuehtIdo/BNGin/I27Ymzu+WvoQ+Etk+ODQkI+3zuZ+hMNHM/1cV7ti0slHqyzOf0fgzm0IEkWcvZBOLo3pVZU3p8tBvl84e31MlHctERO5ReX0kjNuA5YEOuhkrneSZ79HCJBz07GSix4UJf/Fnl18wUQ+z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723877346; c=relaxed/simple;
	bh=hWSGpJAv/skPgGCMYqqiRP+FpocSYVUDsqrHFTlkYPw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=VCnm1l9/7M85W8lvxKdyLZu7+OieJYTycE3N2L5u3/GIb+GwsfkCE6bsqWZPzGYB++UISMbCrykxcD+JtL2DiOecODF93/IshynLm+LWXEFOELuHZ5sr4+sTlcYcvG+hW6/9C7dhlkBT4ioZbFstmI2rpqj8gCTEgtdcNa2dL0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ugzkNjvP; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ugzkNjvP"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-368440b073bso1419568f8f.0
        for <oe-kbuild@lists.linux.dev>; Fri, 16 Aug 2024 23:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723877341; x=1724482141; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LezB4JO96rACQj2bn6ciLEu/+Vy/sz/OKWd1BnMwKEw=;
        b=ugzkNjvPlyLzaU9aWQQzgOOi7W3P3hKT0Tq6AAZCWoXYEwEvWtiAGlgjTCVEFKVoPM
         T9ideNbORW7TUL6vsdGC5QZ8xzEtp+XgZYv+1v54kOXzTb/b0W5gMOj2Z5FEpKxS7s/h
         PhFUZz4nCJOvr6+dikdltdtp/+T1rKzZxH0hpa4TImFgrOAJCP4nA+T1A+z6XuWQmnOH
         88s+DVWcBRBHcjhk3XYinVhI9jp5a4Ut29qEhvlAlMXiU00V0IXmtnFKP2i3JVKS5occ
         qvx0KJ1iTS9vYzr69HERPnWTWm948dFvaaWJWiP75+hXi5bGy8etwWQEn/s/JbKpO2yv
         N8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723877341; x=1724482141;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LezB4JO96rACQj2bn6ciLEu/+Vy/sz/OKWd1BnMwKEw=;
        b=gx38h7+3I3e3edBk080B9XBuEaG9DvPC+NsSx8CaXcDJGa9s6mFJesbCpgawjgzX1k
         565qufDl17AU0dT7+W1/CKRVv+SgWNiC9aCsZQU+bWb0a2q8npS8By4dyf7P0RMpy0FR
         tvyLszc/Py7lt2hSbvC1iHtM7TQSowaC6hr1LCrTy5h96mTRVHdUQD3hTIueJUqiyCRm
         KCqEYIcmnIMC3+FEJu2UMpYpYi5F52K3F+jRgnpXkNptKLfjPtrhNBOaAm3MYlaIRFRH
         ZWVrwyqcu7XJwFj9ZQA10HqR6cC5YF8NAStDeFDOtW9yY4wIYqzRGCuhxQ6aqRSXkozW
         HP5g==
X-Gm-Message-State: AOJu0YwYjrqDjqdF1CiY5iMEY+xu0Yf93kOrLEHjzet3WaQKv/0VgBgY
	6H+dqx1vPiVkuLZuNQPAy+s6pAefOnU45NWHTp0Eztw6xD522txpOWAE0r/uypm4BAfkts8Z5vs
	d
X-Google-Smtp-Source: AGHT+IHSUk0zf93SllYpmmKYZmbbR4SLRBYWgZthWH0FI2AYrZ1JEVkIfQTVqijMGw8lMIl5HUkGDg==
X-Received: by 2002:adf:e6c3:0:b0:365:aec0:e191 with SMTP id ffacd0b85a97d-37186d740a7mr6107286f8f.21.1723877340971;
        Fri, 16 Aug 2024 23:49:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed79da99sm40748795e9.46.2024.08.16.23.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 23:49:00 -0700 (PDT)
Date: Sat, 17 Aug 2024 09:48:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, crwulff@gmail.com, linux-usb@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Konstantin Aladyshev <aladyshev22@gmail.com>,
	David Sands <david.sands@biamp.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-kernel@vger.kernel.org, Chris Wulff <Chris.Wulff@biamp.com>
Subject: Re: [PATCH v4] USB: gadget: f_hid: Add GET_REPORT via userspace IOCTL
Message-ID: <294f091e-aa0c-4f1d-b827-db3339a0a8af@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814125525.3917130-2-crwulff@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/crwulff-gmail-com/USB-gadget-f_hid-Add-GET_REPORT-via-userspace-IOCTL/20240814-225520
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20240814125525.3917130-2-crwulff%40gmail.com
patch subject: [PATCH v4] USB: gadget: f_hid: Add GET_REPORT via userspace IOCTL
config: x86_64-randconfig-161-20240817 (https://download.01.org/0day-ci/archive/20240817/202408171146.0RjWnTq8-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408171146.0RjWnTq8-lkp@intel.com/

smatch warnings:
drivers/usb/gadget/function/f_hid.c:705 f_hidg_get_report() warn: inconsistent returns '&hidg->get_report_spinlock'.
drivers/usb/gadget/function/f_hid.c:705 f_hidg_get_report() warn: inconsistent returns 'flags'.

vim +705 drivers/usb/gadget/function/f_hid.c

fce51fb916013b Chris Wulff 2024-08-14  653  static int f_hidg_get_report(struct file *file, struct usb_hidg_report __user *buffer)
fce51fb916013b Chris Wulff 2024-08-14  654  {
fce51fb916013b Chris Wulff 2024-08-14  655  	struct f_hidg			*hidg = file->private_data;
fce51fb916013b Chris Wulff 2024-08-14  656  	struct usb_composite_dev	*cdev = hidg->func.config->cdev;
fce51fb916013b Chris Wulff 2024-08-14  657  	unsigned long	flags;
fce51fb916013b Chris Wulff 2024-08-14  658  	struct report_entry *entry;
fce51fb916013b Chris Wulff 2024-08-14  659  	struct report_entry *ptr;
fce51fb916013b Chris Wulff 2024-08-14  660  	__u8 report_id;
fce51fb916013b Chris Wulff 2024-08-14  661  
fce51fb916013b Chris Wulff 2024-08-14  662  	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
fce51fb916013b Chris Wulff 2024-08-14  663  	if (!entry)
fce51fb916013b Chris Wulff 2024-08-14  664  		return -ENOMEM;
fce51fb916013b Chris Wulff 2024-08-14  665  
fce51fb916013b Chris Wulff 2024-08-14  666  	if (copy_from_user(&entry->report_data, buffer,
fce51fb916013b Chris Wulff 2024-08-14  667  				sizeof(struct usb_hidg_report))) {
fce51fb916013b Chris Wulff 2024-08-14  668  		ERROR(cdev, "copy_from_user error\n");
fce51fb916013b Chris Wulff 2024-08-14  669  		kfree(entry);
fce51fb916013b Chris Wulff 2024-08-14  670  		return -EINVAL;
fce51fb916013b Chris Wulff 2024-08-14  671  	}
fce51fb916013b Chris Wulff 2024-08-14  672  
fce51fb916013b Chris Wulff 2024-08-14  673  	report_id = entry->report_data.report_id;
fce51fb916013b Chris Wulff 2024-08-14  674  
fce51fb916013b Chris Wulff 2024-08-14  675  	spin_lock_irqsave(&hidg->get_report_spinlock, flags);
fce51fb916013b Chris Wulff 2024-08-14  676  	ptr = f_hidg_search_for_report(hidg, report_id);
fce51fb916013b Chris Wulff 2024-08-14  677  
fce51fb916013b Chris Wulff 2024-08-14  678  	if (ptr) {
fce51fb916013b Chris Wulff 2024-08-14  679  		/* Report already exists in list - update it */
fce51fb916013b Chris Wulff 2024-08-14  680  		if (copy_from_user(&ptr->report_data, buffer,
fce51fb916013b Chris Wulff 2024-08-14  681  				sizeof(struct usb_hidg_report))) {
fce51fb916013b Chris Wulff 2024-08-14  682  			ERROR(cdev, "copy_from_user error\n");
fce51fb916013b Chris Wulff 2024-08-14  683  			kfree(entry);
fce51fb916013b Chris Wulff 2024-08-14  684  			return -EINVAL;

spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);

fce51fb916013b Chris Wulff 2024-08-14  685  		}
fce51fb916013b Chris Wulff 2024-08-14  686  		kfree(entry);
fce51fb916013b Chris Wulff 2024-08-14  687  	} else {
fce51fb916013b Chris Wulff 2024-08-14  688  		/* Report does not exist in list - add it */
fce51fb916013b Chris Wulff 2024-08-14  689  		list_add_tail(&entry->node, &hidg->report_list);
fce51fb916013b Chris Wulff 2024-08-14  690  	}
fce51fb916013b Chris Wulff 2024-08-14  691  
fce51fb916013b Chris Wulff 2024-08-14  692  	/* If there is no response pending then do nothing further */
fce51fb916013b Chris Wulff 2024-08-14  693  	if (hidg->get_report_returned) {
fce51fb916013b Chris Wulff 2024-08-14  694  		spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
fce51fb916013b Chris Wulff 2024-08-14  695  		return 0;
fce51fb916013b Chris Wulff 2024-08-14  696  	}
fce51fb916013b Chris Wulff 2024-08-14  697  
fce51fb916013b Chris Wulff 2024-08-14  698  	/* If this userspace response serves the current pending report */
fce51fb916013b Chris Wulff 2024-08-14  699  	if (hidg->get_report_req_report_id == report_id) {
fce51fb916013b Chris Wulff 2024-08-14  700  		hidg->get_report_returned = true;
fce51fb916013b Chris Wulff 2024-08-14  701  		wake_up(&hidg->get_queue);
fce51fb916013b Chris Wulff 2024-08-14  702  	}
fce51fb916013b Chris Wulff 2024-08-14  703  
fce51fb916013b Chris Wulff 2024-08-14  704  	spin_unlock_irqrestore(&hidg->get_report_spinlock, flags);
fce51fb916013b Chris Wulff 2024-08-14 @705  	return 0;
fce51fb916013b Chris Wulff 2024-08-14  706  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

