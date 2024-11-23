Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3A117084F
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Nov 2024 10:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732357382; cv=none; b=bywRpuh+mIRAKtQ5In90cP6dSJLVHRUW3Fb3+wDUfMn1KKdlPW1w5BAltrYQOSsytUtlr+/GWwO4iixXWawQFP1EYMw1l7K4cXu4NZe4WrcwUqOmPiraUOHKT28G5gD2dXlyHpBPcW3MCFkUqLQLErrCI/HTkMBqZ3tWCpkCUXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732357382; c=relaxed/simple;
	bh=fjDb4Q89lIVf4B13p8PqqbaNV57uxDzKx4kMqhP/i2o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t2dUo3RaR0WiUfUxHRc8/UGJUWHeKWgKatDncAFba70354r6sBuerRERY/jH3cFR1hZ0du/XWDAS5zHSqFKnDJPZFFQmph4U1X3Hg9ztB0JSfV/s8R4gctNVsL8xmunlBo9v6PscLuMQVOcdp/bU1EprRF9qmuEswAo0qos333w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zzjGWMiL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zzjGWMiL"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43167ff0f91so25986935e9.1
        for <oe-kbuild@lists.linux.dev>; Sat, 23 Nov 2024 02:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732357378; x=1732962178; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NqUmdrrnzUuAaTAqeudZWfVzj5B2psh9iL4Q1pore8o=;
        b=zzjGWMiL2wFOxVPADwjPTc4Zg+9WzjrBzh7HUlCLEEn6fehp4eHVBHnZo+gknCsNrx
         d/5n8YM9c7SgrC1R6wJyO3Xz5NkgeYbhgYks3vWd98Y0MnrPYOjwKiG73y4KywRWq4YZ
         OJomQ3NUtnDv2efaiImas8NeffqoyBeVz+CTSBOJcZJw7SxoB8zVjdpNx80WHv9rDeOI
         35aWWC2GnmNEMMvoLvpEyUM1GU6uvW+7+P9OLqVyqZEuik+0T9sIHKaK9W9mmVrnugZd
         hI9AEKlz9ELD/Q2Epx3pWZvho+RNSVYsISDsH6xl7uPK7PW00cTHGTjKqjMO73G2hqtc
         OAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732357378; x=1732962178;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NqUmdrrnzUuAaTAqeudZWfVzj5B2psh9iL4Q1pore8o=;
        b=G72rOMamb+AnH65Qt3xSVlimN8NjfpoNKvL6bD7u7zeD2sMBibApW5uzAuiRqW0IJV
         rn2rGnL4wAANP3giWCHHJTt8FQBoUNKXG60sgkT5YuYS3/QLD4NK5e9rH5/Mv2n3j3du
         Q+/WnnwCawUXulg3V7PzX6rR9jHP4JNuEAw0bKXHH2op00guytrq6OtISwSB9iYo6f6q
         jWilH5ACGCILHwBsMLj/1Akko+PAYo6VaNQ3faXB/KeDniORYe5RJjOpeygUMmb7Xom3
         ygHOFJbA8E88UcqK8geMO2njgpu1/VchsU3xaNnyc9/47d5ps/QNXviRdvmdhhOSWc30
         Z27g==
X-Gm-Message-State: AOJu0YxHzuP4aSF0KBvUw0aKmXg3rhQvUdLZFWgIgTPuTb0CaGIn/++t
	BhToW5FO2Ffj1wbRClKJkimkR79E26XPg72ysuk+te9QGNd4PmwWTTtVm1nk/p7zd88KUOznGhn
	o
X-Gm-Gg: ASbGnct6egqbQyzUu1j/xmbpg995GujdwtDrmw4hlQeLfAmpTsKTe1YZse2caQir3Sv
	wUp++U5S6NXUmwjDUYI/R16xudTFqxvCgJzSdYpMJYxBB/sOHT5Kl2DXccZXs+UjJq/zr7Q/I1T
	eMJMJF7/EYs+75/hx3PclHYE5VvKr2NH7YkjMkvYTWaf2r0gpwcDdNxB89qNEAKBsu2pIo2xvY8
	eE56xmN1APHq32uutQHiqwTU8OGrUW/WH4vJBp9+4AVyZnnK/VvAaY=
X-Google-Smtp-Source: AGHT+IFfMir9uVqZOn78Y9wGGlBVANftpSYauFsKG8R5shDLlSNYqxNerAp1YVWGkDWxKy4Q6LKvVg==
X-Received: by 2002:a05:600c:5254:b0:431:4f5e:1f61 with SMTP id 5b1f17b1804b1-433ce42133dmr52544565e9.14.1732357378269;
        Sat, 23 Nov 2024 02:22:58 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad5fa2sm4970372f8f.1.2024.11.23.02.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 02:22:57 -0800 (PST)
Date: Sat, 23 Nov 2024 13:22:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 38/6108]
 net/netfilter/xt_IDLETIMER.c:206 idletimer_tg_show() error: we previously
 assumed 'timer' could be null (see line 197)
Message-ID: <2bb04a6a-f480-42a9-9e42-5a573f2f7cb7@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   84abfa8faedf827ec60f5b6a2d913bf80d14fab6
commit: f0c2df2b1228a4407c72e92e07d9f3fe695fa558 [38/6108] ANDROID: netfilter: xt_IDLETIMER: Add new netlink msg type
config: i386-randconfig-141-20241122 (https://download.01.org/0day-ci/archive/20241122/202411222344.akGJ6WjR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411222344.akGJ6WjR-lkp@intel.com/

smatch warnings:
net/netfilter/xt_IDLETIMER.c:206 idletimer_tg_show() error: we previously assumed 'timer' could be null (see line 197)

vim +/timer +206 net/netfilter/xt_IDLETIMER.c

0902b469bd2506 Luciano Coelho 2010-06-15  187  static ssize_t idletimer_tg_show(struct kobject *kobj, struct attribute *attr,
0902b469bd2506 Luciano Coelho 2010-06-15  188  				 char *buf)
0902b469bd2506 Luciano Coelho 2010-06-15  189  {
0902b469bd2506 Luciano Coelho 2010-06-15  190  	struct idletimer_tg *timer;
0902b469bd2506 Luciano Coelho 2010-06-15  191  	unsigned long expires = 0;
f0c2df2b1228a4 JP Abgrall     2012-04-26  192  	unsigned long now = jiffies;
0902b469bd2506 Luciano Coelho 2010-06-15  193  
0902b469bd2506 Luciano Coelho 2010-06-15  194  	mutex_lock(&list_mutex);
0902b469bd2506 Luciano Coelho 2010-06-15  195  
0902b469bd2506 Luciano Coelho 2010-06-15  196  	timer =	__idletimer_tg_find_by_label(attr->name);
0902b469bd2506 Luciano Coelho 2010-06-15 @197  	if (timer)
                                                    ^^^^^
Check for NULL

0902b469bd2506 Luciano Coelho 2010-06-15  198  		expires = timer->timer.expires;
0902b469bd2506 Luciano Coelho 2010-06-15  199  
0902b469bd2506 Luciano Coelho 2010-06-15  200  	mutex_unlock(&list_mutex);
0902b469bd2506 Luciano Coelho 2010-06-15  201  
f0c2df2b1228a4 JP Abgrall     2012-04-26  202  	if (time_after(expires, now))

If expires is zero then time_after() is false.

0902b469bd2506 Luciano Coelho 2010-06-15  203  		return sprintf(buf, "%u\n",
f0c2df2b1228a4 JP Abgrall     2012-04-26  204  			       jiffies_to_msecs(expires - now) / 1000);
0902b469bd2506 Luciano Coelho 2010-06-15  205  
f0c2df2b1228a4 JP Abgrall     2012-04-26 @206  	if (timer->send_nl_msg)
                                                    ^^^^^^^^^^^^^^^^^^
Unchecked dereference.  This is really old out of tree code from Android.

f0c2df2b1228a4 JP Abgrall     2012-04-26  207  		return sprintf(buf, "0 %d\n",
f0c2df2b1228a4 JP Abgrall     2012-04-26  208  			jiffies_to_msecs(now - expires) / 1000);
f0c2df2b1228a4 JP Abgrall     2012-04-26  209  	else
0902b469bd2506 Luciano Coelho 2010-06-15  210  		return sprintf(buf, "0\n");
0902b469bd2506 Luciano Coelho 2010-06-15  211  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

