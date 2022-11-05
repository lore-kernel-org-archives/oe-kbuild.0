Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6C41FBE;
	Sat,  5 Nov 2022 11:14:03 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id j15so10159153wrq.3;
        Sat, 05 Nov 2022 04:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l0XrShTP+ef8R4TRyiSZwG5YyUegw3755ETi+DMpfDg=;
        b=jg6rQM96gMl2LQfCQnvwBiWrAflWnkgdT0Ml8HmsxpLQpdmSR9R6v0bMME5BLST5k1
         E5Y8A1yaILxbFmR9Nc4/nFJ/cI0Z96luLIJEYZaVmclMV2Pi3QlnSXLaUdNe5m+3jkmS
         GMYAYXtgPmkbW/VNilKjrVMv+6n2JUDgyVx3uhsUHQy+SIU4UzKlNaotByi1cOozYxui
         1384QHigVDyFrgHKumR/mrIpN0x8pNqgztb+ngPcTH3TwZ1lyKiM3QD0MmBETvcUqJ8U
         1FdGsQ84X2Jx2e/ouJMGN1pwTWe/ZYVHwAi7jf1kaZRRyhG6K97a2HVUY2aw959k+1D5
         67+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l0XrShTP+ef8R4TRyiSZwG5YyUegw3755ETi+DMpfDg=;
        b=wv03FCbzH+yACVNSXpy0T4os8nA8FooYdO7TuOsi4Cdbq2JdJW15Kw0FW7WsWIzFpt
         mQyWlCI3KFdrXbNJeVYSRRgXZOAvSYFiPfzEQfSgNFKXLCnxqUOZlp5RMGY0/MceHJaq
         rMGgIC+oWkGQ1UZh9Cx/ROlBVYEpZkpaYQTf+OD5H5+lHdk2i0+KL3VodR5QZQ7aa22i
         XuQrQGXlVCPAA3C7NSPaqVjdFPH4IJjt+FB26rmOWvBu5eOvQwLW+kZ+TVvYIsZVnbdE
         NbnUNIm+LFYyBUE3ZY1NVOut9fsMg4L77i1YrKNAWMh313foeqs0sCpfap6TGvrpKUSS
         cR7A==
X-Gm-Message-State: ACrzQf0OZCifcqYHbGoyQkGlfihV3lGiYUoPrzdQhln9o6535yWPp0qX
	ncD1pmgRJSmwHByjKmphlwnqH6Y/vrg=
X-Google-Smtp-Source: AMsMyM7z7V+r3XSYb8rYxaLFjpzXaVIlYRbuOtnBxe8UsQjzhfNVsnTRj3cfygjd1Fd/81T6AGKU4A==
X-Received: by 2002:a5d:51c2:0:b0:236:7000:8e82 with SMTP id n2-20020a5d51c2000000b0023670008e82mr25207874wrv.191.1667646841106;
        Sat, 05 Nov 2022 04:14:01 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 5-20020a05600c26c500b003b50428cf66sm2078901wmv.33.2022.11.05.04.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 04:14:00 -0700 (PDT)
Date: Sat, 5 Nov 2022 14:13:57 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, John Ogness <john.ogness@linutronix.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [rt-devel:for-kbuild-bot/prepare-release 21/51]
 kernel/printk/printk.c:2468 __alloc_atomic_data() warn: returning -1 instead
 of -ENOMEM is sloppy
Message-ID: <202211050258.pYZcB6zf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221105111357.ji4vCxXChMT3MdJvDsYV2PjYjsCK8NmUkJXUQhos4Mc@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git for-kbuild-bot/prepare-release
head:   b40fb286ddee513fc0f105bf5b403ca3c25c6389
commit: cf8dd889ea20ae7091d3b27029b07bef13298291 [21/51] serial: 8250: implement write_atomic
config: x86_64-randconfig-m001
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
kernel/printk/printk.c:2468 __alloc_atomic_data() warn: returning -1 instead of -ENOMEM is sloppy

vim +2468 kernel/printk/printk.c

09cbc4e64a7546 John Ogness 2022-02-04  2464  static int __alloc_atomic_data(struct console_atomic_data *d, short flags)
09cbc4e64a7546 John Ogness 2022-02-04  2465  {
09cbc4e64a7546 John Ogness 2022-02-04  2466  	d->text = kmalloc(CONSOLE_LOG_MAX, GFP_KERNEL);
09cbc4e64a7546 John Ogness 2022-02-04  2467  	if (!d->text)
09cbc4e64a7546 John Ogness 2022-02-04 @2468  		return -1;

Passive aggressive me from eight years ago makes a fair point.  Better
to return a correct error code.

09cbc4e64a7546 John Ogness 2022-02-04  2469  
09cbc4e64a7546 John Ogness 2022-02-04  2470  	if (flags & CON_EXTENDED) {
09cbc4e64a7546 John Ogness 2022-02-04  2471  		d->ext_text = kmalloc(CONSOLE_EXT_LOG_MAX, GFP_KERNEL);
09cbc4e64a7546 John Ogness 2022-02-04  2472  		if (!d->ext_text)
09cbc4e64a7546 John Ogness 2022-02-04  2473  			return -1;
09cbc4e64a7546 John Ogness 2022-02-04  2474  	} else {
09cbc4e64a7546 John Ogness 2022-02-04  2475  		d->dropped_text = kmalloc(DROPPED_TEXT_MAX, GFP_KERNEL);
09cbc4e64a7546 John Ogness 2022-02-04  2476  		if (!d->dropped_text)
09cbc4e64a7546 John Ogness 2022-02-04  2477  			return -1;
09cbc4e64a7546 John Ogness 2022-02-04  2478  	}
09cbc4e64a7546 John Ogness 2022-02-04  2479  
09cbc4e64a7546 John Ogness 2022-02-04  2480  	return 0;
09cbc4e64a7546 John Ogness 2022-02-04  2481  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

