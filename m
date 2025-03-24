Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9D520551B
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Mar 2025 06:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742799218; cv=none; b=EduQmxW1jyDqgl1ztuewqaPyQgeMG7+q/PkaT+ctEE9/M24DzKLmWQFxBDrD+JoisfkHGc9A1XQwMx4c50omgl0q6e1bAPetuc3pWbqYuGi98Juh7QanKt9j9Zjjir/+0MFRxppVjKb44jljucI7XA8nD5rup5cCL18dUQN7fUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742799218; c=relaxed/simple;
	bh=pdCIEwKzCvz8Cx3HFhEz4UpCe7dOO9/t/xUC1YiMhhs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fLhE9HGyuzuMLitr+Qp0NMS9b7SdyRuhjKbT+f5dWdNcdiTRw86TMyM/RksaQ2vVUDIAkagvusvSxtcsreCRI+yuNEszP8HshHscUnpWUjujiDPZcKMhVSrIGkRI8jE5wnCGQCnTXWRRTzbpvZJ14zYAXy/Lk9BWOh0Uew1XwNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IqKFG7/R; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IqKFG7/R"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso36044155e9.1
        for <oe-kbuild@lists.linux.dev>; Sun, 23 Mar 2025 23:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742799214; x=1743404014; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z51FtsQACYQGUb2PuJE7oGEJnLnqgT4gRrFnNuzwH8k=;
        b=IqKFG7/R75e1zz0G7v7JUf/hEyBn+Tz9TeczxUdkqVHlfeGiPPFezVIX8sWDFO91Yy
         TYPiu9mOCzoE2Z56oR25YWCT3HHpeX0nCNqIqJHvMHR0CCVqljAWZQf/Dlc++9KzcAd9
         NQnk/51itKk6sHHvao4kCrprforWpIjZbl1hgRzGdl/7MjWrq+qqqdNZc4SKOR7JjXcp
         zcQx/b0jQ92fy+ms0dcUil//gmVAFxcZc/eUM1Y5MO87MWYkIddCKGCjUIlfKezI2n7C
         MXtak3+arfhX3dNxYKouASCdAkSKc26BxlmzkdX3BfcLxzPJ9qwno4BghZdW16DN2Kf2
         eOqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742799214; x=1743404014;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z51FtsQACYQGUb2PuJE7oGEJnLnqgT4gRrFnNuzwH8k=;
        b=jOCw7BujYSZJZn3wLUYf1Mol9tLcUkOhZyFyq0qOltskWXsa23yLQWz9ozLJguPfi1
         FIXzLz5/GSYxbrvYQ6R5Y408M0tQrD41l9vHjYoD4a1kb4CuDyxM0Hn4ieZP/EHol1Pb
         RPuKOMLyL9ujgh6rW/uJV1fjGaASweJg2t2aFpLlYka1SjNXWlY9X8UjcHfN7onQc+1I
         z0e5FGxWcQCXsp6nENFG1XUWWw/82+OPbGxYMmQGWG+sjLuDQmIWoicme1v043Pw4hrP
         6ye1fPdBz/gGVWDhSLELHVc9kzGQRoneHdbYDIixQKNwVf4w6LTB9i2tDn359c3aOKtX
         amOg==
X-Gm-Message-State: AOJu0Yw4+69P6k7XAPHg8GMUXovhH4Q/dtf5mAu935sgjyP0Q5oh6Zdk
	KEvJvtG0w7xVmlBl7ln4r+4YAp3jccvNy317Pi9NR+KR6iofjZVq4sYtqmqlg8H7DRPgG9Kg6xB
	LUD0=
X-Gm-Gg: ASbGnctZ4FwVMDgtezy5wT+jtBc01Fo55MDls7BwU4DTcQLNobsJWd30QSNcy4GEDje
	jUhjdiDzRKzUAAwfO2tHG0x9WU8l49eOm7uP7gHvqJK4STvt6jpXFmS3HTg1p02VBtZiiQvhW+J
	4PA+3hZCK37YwEq7MGrbYlYRTrN2WDxbUmRK5yy0/qj3vNeeX9txDLZexTLXHsR9kOgG6QneRow
	4HrKZGQEi4CvMQGODoysjQ6OfTXTDRizYyi4+F+NJoIohM49TgS6xUcUqDvVtF2d0KjwOcVaMPH
	fCJU1k7wsK4DQNRE12b/1QYfmA+cJ1Lc8CIGeFkBNJjWSNWJsg==
X-Google-Smtp-Source: AGHT+IFNkHuVnxHGLYjWFkoxDb+tykP6apxEmadVwkU7XCeI/Stw2caONaEXz5WR4zzAARXEJMMoiQ==
X-Received: by 2002:a05:600c:154a:b0:43c:fa52:7d2d with SMTP id 5b1f17b1804b1-43d50a37825mr107991545e9.20.1742799214106;
        Sun, 23 Mar 2025 23:53:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f995766sm9869400f8f.1.2025.03.23.23.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 23:53:33 -0700 (PDT)
Date: Mon, 24 Mar 2025 09:53:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Corey Minyard <corey@minyard.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [cminyard-ipmi:remove-srcu 8/15]
 drivers/char/ipmi/ipmi_msghandler.c:768 ipmi_smi_watcher_register() warn:
 iterator used outside loop: 'intf'
Message-ID: <bff880a9-6293-4753-b422-d1d76e097149@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cminyard/linux-ipmi remove-srcu
head:   952a7280d75bee86fb667526304477074b678a68
commit: ed7043aba7c5cb3017e4d2d7dd6e9c5f2dbb1df7 [8/15] ipmi:msghandler: Remove srcu for the ipmi_interfaces list
config: openrisc-randconfig-r073-20250321 (https://download.01.org/0day-ci/archive/20250324/202503240244.LR7pOwyr-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503240244.LR7pOwyr-lkp@intel.com/

smatch warnings:
drivers/char/ipmi/ipmi_msghandler.c:768 ipmi_smi_watcher_register() warn: iterator used outside loop: 'intf'

vim +/intf +768 drivers/char/ipmi/ipmi_msghandler.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  721  int ipmi_smi_watcher_register(struct ipmi_smi_watcher *watcher)
^1da177e4c3f41 Linus Torvalds 2005-04-16  722  {
a567b6230066e3 Corey Minyard  2018-04-05  723  	struct ipmi_smi *intf;
ed7043aba7c5cb Corey Minyard  2025-03-18  724  	unsigned int count = 0, i;
ed7043aba7c5cb Corey Minyard  2025-03-18  725  	int *interfaces = NULL;
ed7043aba7c5cb Corey Minyard  2025-03-18  726  	int rv = 0;
913a89f009d98c Corey Minyard  2018-12-20  727  
913a89f009d98c Corey Minyard  2018-12-20  728  	/*
913a89f009d98c Corey Minyard  2018-12-20  729  	 * Make sure the driver is actually initialized, this handles
913a89f009d98c Corey Minyard  2018-12-20  730  	 * problems with initialization order.
913a89f009d98c Corey Minyard  2018-12-20  731  	 */
913a89f009d98c Corey Minyard  2018-12-20  732  	rv = ipmi_init_msghandler();
913a89f009d98c Corey Minyard  2018-12-20  733  	if (rv)
913a89f009d98c Corey Minyard  2018-12-20  734  		return rv;
bca0324d09e413 Corey Minyard  2006-12-06  735  
b2c03941b50944 Corey Minyard  2006-12-06  736  	mutex_lock(&smi_watchers_mutex);
b2c03941b50944 Corey Minyard  2006-12-06  737  
b2c03941b50944 Corey Minyard  2006-12-06  738  	list_add(&watcher->link, &smi_watchers);
bca0324d09e413 Corey Minyard  2006-12-06  739  
ed7043aba7c5cb Corey Minyard  2025-03-18  740  	/*
ed7043aba7c5cb Corey Minyard  2025-03-18  741  	 * Build an array of ipmi interfaces and fill it in.  We can't
ed7043aba7c5cb Corey Minyard  2025-03-18  742  	 * call the callback with ipmi_interfaces_mutex held.
ed7043aba7c5cb Corey Minyard  2025-03-18  743  	 * smi_watchers_mutex will keep things in order for the user.
ed7043aba7c5cb Corey Minyard  2025-03-18  744  	 */
ed7043aba7c5cb Corey Minyard  2025-03-18  745  	mutex_lock(&ipmi_interfaces_mutex);
ed7043aba7c5cb Corey Minyard  2025-03-18  746  	list_for_each_entry(intf, &ipmi_interfaces, link)
ed7043aba7c5cb Corey Minyard  2025-03-18  747  		count++;

intf comes from here

ed7043aba7c5cb Corey Minyard  2025-03-18  748  	if (count > 0) {
ed7043aba7c5cb Corey Minyard  2025-03-18  749  		interfaces = kmalloc_array(count, sizeof(*interfaces),
ed7043aba7c5cb Corey Minyard  2025-03-18  750  					   GFP_KERNEL);
ed7043aba7c5cb Corey Minyard  2025-03-18  751  		if (!interfaces)
ed7043aba7c5cb Corey Minyard  2025-03-18  752  			rv = -ENOMEM;
ed7043aba7c5cb Corey Minyard  2025-03-18  753  		count = 0;
ed7043aba7c5cb Corey Minyard  2025-03-18  754  	}
ed7043aba7c5cb Corey Minyard  2025-03-18  755  	if (interfaces) {
ed7043aba7c5cb Corey Minyard  2025-03-18  756  		list_for_each_entry(intf, &ipmi_interfaces, link) {
e86ee2d44b4405 Corey Minyard  2018-04-05  757  			int intf_num = READ_ONCE(intf->intf_num);
bca0324d09e413 Corey Minyard  2006-12-06  758  
e86ee2d44b4405 Corey Minyard  2018-04-05  759  			if (intf_num == -1)
e86ee2d44b4405 Corey Minyard  2018-04-05  760  				continue;
ed7043aba7c5cb Corey Minyard  2025-03-18  761  			interfaces[count++] = intf_num;
ed7043aba7c5cb Corey Minyard  2025-03-18  762  		}

or here.

ed7043aba7c5cb Corey Minyard  2025-03-18  763  	}
ed7043aba7c5cb Corey Minyard  2025-03-18  764  	mutex_unlock(&ipmi_interfaces_mutex);
ed7043aba7c5cb Corey Minyard  2025-03-18  765  
ed7043aba7c5cb Corey Minyard  2025-03-18  766  	if (interfaces) {
ed7043aba7c5cb Corey Minyard  2025-03-18  767  		for (i = 0; i < count; i++)
ed7043aba7c5cb Corey Minyard  2025-03-18 @768  			watcher->new_smi(interfaces[i], intf->si_dev);

It's an invalid pointer at this point.

ed7043aba7c5cb Corey Minyard  2025-03-18  769  		kfree(interfaces);
^1da177e4c3f41 Linus Torvalds 2005-04-16  770  	}
bca0324d09e413 Corey Minyard  2006-12-06  771  
b2c03941b50944 Corey Minyard  2006-12-06  772  	mutex_unlock(&smi_watchers_mutex);
bca0324d09e413 Corey Minyard  2006-12-06  773  
ed7043aba7c5cb Corey Minyard  2025-03-18  774  	return rv;
^1da177e4c3f41 Linus Torvalds 2005-04-16  775  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

