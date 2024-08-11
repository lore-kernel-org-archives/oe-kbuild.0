Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FF65336B
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Aug 2024 13:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723383307; cv=none; b=TUoljZxDEoUNVfg8N9NFJi1vWyKkAbd+b3vU0Xflsy4wVh9wsv54T8XLzlXpLDxy+OkuA5f6I3laAVLYlFwplYj1l8wBu2F8x1knve5Ni3wBOqAHjpS8jzCgyp9S4jITDu3v9fFEjF8oVyWFZB49MRIpKxxSq416yNyU46JdWAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723383307; c=relaxed/simple;
	bh=VGM568D87wHUovADz9WFHUI7AEwoT2PfWyxmvtOp1P8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b4rCyM8D8mNrRqBRrdHkJslWLEX8SYTBEwSHGX0YiLXOQbPQrZxRrXgCMWYvGTuEaG8s/fxOzP89sH30MZISNUUb7XuMzSPI//HPXIJX2YXei9P50kmtL345tNkVZu/ypdkemKJg83MWl+0GuPlZv0korffiBIGoMYMamcDXzI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=COf4q3xl; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="COf4q3xl"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52f04b3cb33so7110273e87.0
        for <oe-kbuild@lists.linux.dev>; Sun, 11 Aug 2024 06:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723383303; x=1723988103; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Txou7tBheJ/iWucLdwnnx8un90DmQGpFp4G8nnsqJ4E=;
        b=COf4q3xlc47IKbJQQd2uOv/sUt2ypfamDN/K7Xd2B9xxcRN3QFSXzFAp99ObxJghe8
         zfHD9DyPe7c0l0+A1zv5D8QB/Ud3W8k2Tzzx2iGSW2dq+1pANE/wXu7PHLLnICdUHWWl
         AhFnEUl/9p+6ZGbjxnWhs9aO6cE/XLdjjrTlI2+mrMSjQ7ReDGWtF3PkrH3U+6c1oRnH
         RxxNpa13pECBUxwnXazGPUbDMJKTncgQsaT5PwZGPotHimOWwe0NAXq6KakKi7ng/xfo
         2JfcoqxgWUNtPeki6jcHhfh1kfslV6JLSYTp2cGRjSGM0b98raYra1jt3d5GLhfxrceY
         c2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723383303; x=1723988103;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Txou7tBheJ/iWucLdwnnx8un90DmQGpFp4G8nnsqJ4E=;
        b=gseDpySajj9IrUqN5ukaaGynRrotiU+/nl8myrGuuf3DwkpWj0UctxD+z3VJw1qv/9
         NjFpaKAj/m+RCC4JXJq4dX7KAj3TfQlBdjTuKUy8dtnZSP5yRGLJL+SiWXi32MLk6SwS
         MHtlaM2PgQSb/gv4JuBX9ZGfWPPmcxMKRT0VGYBu0Np0lPuJfSWml4Y+yojdXKdcV5Yj
         GSnRo1IFp98O5Hra+3YDI//rY91um0S1xhEeehup0pKhh/GPBLC7cNEAqOlfak4bhS/S
         ya7nMqjco81lh6iYrQayOOYfNR+/MKpXqXw4hYtc5tZkfejio8IyUfrtVWCHDDBqThBg
         T00g==
X-Gm-Message-State: AOJu0Yw+54LJPsxqLQjmC5FhJJV1hqB95Y1I1eKe4lKAAkexFNE6Hi9Z
	sfkffIN1XJsZ4AslIo3MNIkbnrkSkPgPBsvhVI5JtFdJbNGC5lbChMh9kTXBTf6rdzCju5K5FW0
	V
X-Google-Smtp-Source: AGHT+IE/m0AyJiPG39rL+rPXwSGPTYDkmHzRVEgeVbUFqygplCiPDhNOWE2tDI98kM5r0c3yG6oPvg==
X-Received: by 2002:a05:6512:6c4:b0:52c:83c7:936a with SMTP id 2adb3069b0e04-530ee9f3555mr5816945e87.42.1723383303025;
        Sun, 11 Aug 2024 06:35:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb1cce2csm149054066b.98.2024.08.11.06.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 06:35:02 -0700 (PDT)
Date: Sun, 11 Aug 2024 16:34:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Alexander Aring <aahringo@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Teigland <teigland@redhat.com>
Subject: [linux-next:master 3779/3984] fs/dlm/main.c:57 init_dlm() warn:
 missing error code 'error'
Message-ID: <e57a6935-bb99-4136-b181-1c98ba32e172@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   61c01d2e181adfba02fe09764f9fca1de2be0dbe
commit: 94e180d6255f5a765bb723e6e8b67f1438ce574b [3779/3984] dlm: async freeing of lockspace resources
config: x86_64-randconfig-161-20240810 (https://download.01.org/0day-ci/archive/20240811/202408110800.OsoP8TB9-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408110800.OsoP8TB9-lkp@intel.com/

smatch warnings:
fs/dlm/main.c:57 init_dlm() warn: missing error code 'error'

vim +/error +57 fs/dlm/main.c

e7fd41792fc0ee David Teigland     2006-01-18  27  static int __init init_dlm(void)
e7fd41792fc0ee David Teigland     2006-01-18  28  {
e7fd41792fc0ee David Teigland     2006-01-18  29  	int error;
e7fd41792fc0ee David Teigland     2006-01-18  30  
e7fd41792fc0ee David Teigland     2006-01-18  31  	error = dlm_memory_init();
e7fd41792fc0ee David Teigland     2006-01-18  32  	if (error)
e7fd41792fc0ee David Teigland     2006-01-18  33  		goto out;
e7fd41792fc0ee David Teigland     2006-01-18  34  
8b0188b0d60b6f Alexander Aring    2022-11-17  35  	dlm_midcomms_init();
8b0188b0d60b6f Alexander Aring    2022-11-17  36  
e7fd41792fc0ee David Teigland     2006-01-18  37  	error = dlm_lockspace_init();
e7fd41792fc0ee David Teigland     2006-01-18  38  	if (error)
e7fd41792fc0ee David Teigland     2006-01-18  39  		goto out_mem;
e7fd41792fc0ee David Teigland     2006-01-18  40  
e7fd41792fc0ee David Teigland     2006-01-18  41  	error = dlm_config_init();
e7fd41792fc0ee David Teigland     2006-01-18  42  	if (error)
e7fd41792fc0ee David Teigland     2006-01-18  43  		goto out_lockspace;
e7fd41792fc0ee David Teigland     2006-01-18  44  
a48f9721e6db74 Greg Kroah-Hartman 2019-06-12  45  	dlm_register_debugfs();
e7fd41792fc0ee David Teigland     2006-01-18  46  
597d0cae0f99f6 David Teigland     2006-07-12  47  	error = dlm_user_init();
597d0cae0f99f6 David Teigland     2006-07-12  48  	if (error)
ac33d071059557 Patrick Caulfield  2006-12-06  49  		goto out_debug;
597d0cae0f99f6 David Teigland     2006-07-12  50  
2402211a838928 David Teigland     2008-03-14  51  	error = dlm_plock_init();
2402211a838928 David Teigland     2008-03-14  52  	if (error)
01c7a597899320 Alexander Aring    2023-03-06  53  		goto out_user;
2402211a838928 David Teigland     2008-03-14  54  
94e180d6255f5a Alexander Aring    2024-08-02  55  	dlm_wq = alloc_workqueue("dlm_wq", 0, 0);
94e180d6255f5a Alexander Aring    2024-08-02  56  	if (!dlm_wq)
94e180d6255f5a Alexander Aring    2024-08-02 @57  		goto out_plock;

error = -ENOMEM;

94e180d6255f5a Alexander Aring    2024-08-02  58  
75ce481e15911b Michal Marek       2011-04-01  59  	printk("DLM installed\n");
e7fd41792fc0ee David Teigland     2006-01-18  60  
e7fd41792fc0ee David Teigland     2006-01-18  61  	return 0;
e7fd41792fc0ee David Teigland     2006-01-18  62  
94e180d6255f5a Alexander Aring    2024-08-02  63   out_plock:
94e180d6255f5a Alexander Aring    2024-08-02  64  	dlm_plock_exit();
3ae1acf93a2151 David Teigland     2007-05-18  65   out_user:
3ae1acf93a2151 David Teigland     2007-05-18  66  	dlm_user_exit();
e7fd41792fc0ee David Teigland     2006-01-18  67   out_debug:
e7fd41792fc0ee David Teigland     2006-01-18  68  	dlm_unregister_debugfs();
e7fd41792fc0ee David Teigland     2006-01-18  69  	dlm_config_exit();
e7fd41792fc0ee David Teigland     2006-01-18  70   out_lockspace:
e7fd41792fc0ee David Teigland     2006-01-18  71  	dlm_lockspace_exit();
e7fd41792fc0ee David Teigland     2006-01-18  72   out_mem:
8b0188b0d60b6f Alexander Aring    2022-11-17  73  	dlm_midcomms_exit();
e7fd41792fc0ee David Teigland     2006-01-18  74  	dlm_memory_exit();
e7fd41792fc0ee David Teigland     2006-01-18  75   out:
e7fd41792fc0ee David Teigland     2006-01-18  76  	return error;
e7fd41792fc0ee David Teigland     2006-01-18  77  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

