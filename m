Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5FD14E2F6;
	Mon,  8 Jul 2024 22:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720479118; cv=none; b=EJ02YVrKlOcJkJ7gqzQ1rdOsd17Go7rNvE+EnLfetYMMG7CfwIKzGNBZ9Y8tFVimAYKlFoDRzPw9OgPKE36fPW7ryusb0GPFzxacN/mdhm57fMlAykGUUvwIIdKR+i6Hb78YXe7O3isVn9FtOSDUhfhfelxzfiw4ykcXkywihVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720479118; c=relaxed/simple;
	bh=BaeSK8VL0osIikIB9i5thgSjcGWi7CWbmFZlyc7yXoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qyWNQeRnABKDDVHQEw7l0FozOQJnjjWSzNkYCb638DQHOG14WFg1KdN6zCNLv8YbAn5GZRL6QGs4T0hGDKQ5JckrbWfFmxiwL1diFWciT8Xgn5P4dW8MUZxtQ4a2oj7pBuODSgZnO6eMo/dJHb609jm2tY/yZWMDkYvNFz97I5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVWmoHMJ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVWmoHMJ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fb4a807708so35471755ad.2;
        Mon, 08 Jul 2024 15:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720479116; x=1721083916; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8srVywQNWWPgpGI5XryznETXjclcLlACCGDSu9pPwTw=;
        b=eVWmoHMJ/uFjCD1HPAzSCqWzojxfQs1la0UA4rq1E/1lt20cWIf88P7hQYuP/u+gEC
         QDMb32v8EJGXWaqPMxT/UT4EsDhAlS2IZO4Fw+nBdqYNsPGLPc1RNTOxqnxOAfihifDB
         A9v7EnuvVNm/atrYPvTxRkGLo2eEUtguy5BbmwotE7fwphycXy0N+qvF2ab2J8G3+b2+
         tOyi+3rWIoc+joRqYAC/fcnQJYIioM+3pchmyY6d7/cF3d3T+iMkzUAUHx9OfDQ7p2QA
         AfkMI+jFOBjD/ZDuI1OsJCaNWMzaOPLMWIyfqmZyINvwaPxhKGWckC16IpDSmTTLeN2a
         dvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720479116; x=1721083916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8srVywQNWWPgpGI5XryznETXjclcLlACCGDSu9pPwTw=;
        b=PVtMycmdM4E/0vLJnzNo8kKwW7z0Zr6l4fw5zWVHxhIaEV+cxyfYjlYZPFbOElhWZp
         mtMbYJs+IJpch4o0jUQ53xgkM3TV9a6uzK2t/qyJT+oq+y8xDpZFXLeQnhh6LLvvqB9O
         MrauSC/pDGeMhlipNqgcHFFje3H3/b5FrfaPomhs4YbEXKUja0pXhKxcAL+FxrdTEo5Q
         cLDwTumKmxDj2OY/XaJKp2xXGsAKQMGFpM4g1ZSdx6jlsWLt2Sgfv3f+Cb81LZ7EbFk0
         +mKTeL8ONGBxnHKxRU5QGanketmH2R9zdewz6grF5a6Z+8eUf8hPOAgCFT6x9QQj1oSn
         V5TA==
X-Forwarded-Encrypted: i=1; AJvYcCXXcVe5wR78pZN/vDBOQMM9kFef22z2i+FmPBTgdNEzqDlf4wdUbD7mkf5GwKmluAWFnjsl/HhM07rktCxZaQPfLPVRM5KERsI4KYdhhymK4xvZPuX2+u13Eea16sg8bvKvfH4zYw/SEg==
X-Gm-Message-State: AOJu0Yy1oEBUSwDXmlRO0671EhN2tR3+PPBCrcAdP+9QxeNRqFE4aesA
	KB4sskVWKR2/JdETvgvptEAlthk1UrC7m3L7q5LpexDFar069mY+
X-Google-Smtp-Source: AGHT+IE4gALPYWza3/xf9ND9sKmPMlgPWyMMwEpsRiHkm4yhjH+VkTr6mvBRquiS6avJMGz+Qs4CRw==
X-Received: by 2002:a17:902:c40e:b0:1fb:80cb:f577 with SMTP id d9443c01a7336-1fbb6d23bdamr5769945ad.5.1720479116408;
        Mon, 08 Jul 2024 15:51:56 -0700 (PDT)
Received: from [192.168.50.95] ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a11890sm3823825ad.7.2024.07.08.15.51.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 15:51:56 -0700 (PDT)
Message-ID: <56d2ff54-3c3a-4fb3-8006-72e183faa8bc@gmail.com>
Date: Tue, 9 Jul 2024 07:51:51 +0900
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] s390/zcrypt: optimize memory allocation in online_show()
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 Harald Freudenberger <freude@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, shjy180909@gmail.com,
 linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org
References: <ebe44c83-19bd-43e9-8999-99e3ccc7b417@suswa.mountain>
Content-Language: en-US
From: Yunseong Kim <yskelg@gmail.com>
In-Reply-To: <ebe44c83-19bd-43e9-8999-99e3ccc7b417@suswa.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Dan,

On 7/9/24 12:55 오전, Dan Carpenter wrote:
> Hi,
> 
> kernel test robot noticed the following build warnings:
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/yskelg-gmail-com/s390-zcrypt-optimize-memory-allocation-in-online_show/20240626-071004
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git features
> patch link:    https://lore.kernel.org/r/20240623120147.35554-3-yskelg%40gmail.com
> patch subject: [PATCH] s390/zcrypt: optimize memory allocation in online_show()
> config: s390-randconfig-r081-20240707 (https://download.01.org/0day-ci/archive/20240707/202407071714.4AUEoeUD-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 13.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202407071714.4AUEoeUD-lkp@intel.com/
> 
> smatch warnings:
> drivers/s390/crypto/zcrypt_card.c:103 online_store() warn: iterator used outside loop: 'zq'
> 
> vim +/zq +103 drivers/s390/crypto/zcrypt_card.c

Thank you for the review. I decided not to work on my patch anymore
after the review because my patch was problematic and not useful.

> df6f508c68dbc6 Harald Freudenberger 2021-04-13   90  	list_for_each_entry(zq, &zc->zqueues, list)
> 2ff6be56a27c2d Yunseong Kim         2024-06-23   91  		if (!!zq->online != !!online)
> df6f508c68dbc6 Harald Freudenberger 2021-04-13   92  			maxzqs++;
> df6f508c68dbc6 Harald Freudenberger 2021-04-13   93  	if (maxzqs > 0)
> 2ff6be56a27c2d Yunseong Kim         2024-06-23   94  		zq_uelist = kcalloc(maxzqs, sizeof(*zq_uelist), GFP_ATOMIC);
> e28d2af43614eb Ingo Tuchscherer     2016-08-25   95  	list_for_each_entry(zq, &zc->zqueues, list)
> df6f508c68dbc6 Harald Freudenberger 2021-04-13   96  		if (zcrypt_queue_force_online(zq, online))
> df6f508c68dbc6 Harald Freudenberger 2021-04-13   97  			if (zq_uelist) {
> df6f508c68dbc6 Harald Freudenberger 2021-04-13   98  				zcrypt_queue_get(zq);
> df6f508c68dbc6 Harald Freudenberger 2021-04-13   99  				zq_uelist[i++] = zq;
> df6f508c68dbc6 Harald Freudenberger 2021-04-13  100  			}
> e28d2af43614eb Ingo Tuchscherer     2016-08-25  101  	spin_unlock(&zcrypt_list_lock);
> 2ff6be56a27c2d Yunseong Kim         2024-06-23  102  	while (i--) {
> df6f508c68dbc6 Harald Freudenberger 2021-04-13 @103  		ap_send_online_uevent(&zq->queue->ap_dev, online);
>                                                                                        ^^
> zq is an invalid pointer here.  It's an offset off the list head.
> There used to be a "zq = zq_uelist[i];" before this function call but
> the patch deleted it.

My patch doesn't mean much to me at this point, but if it needed to be
fixed, I think it should have been.

> 2ff6be56a27c2d Yunseong Kim         2024-06-23  104  		zcrypt_queue_put(zq_uelist[i]);
> df6f508c68dbc6 Harald Freudenberger 2021-04-13  105  	}
> df6f508c68dbc6 Harald Freudenberger 2021-04-13  106  	kfree(zq_uelist);
> df6f508c68dbc6 Harald Freudenberger 2021-04-13  107  
> e28d2af43614eb Ingo Tuchscherer     2016-08-25  108  	return count;
> e28d2af43614eb Ingo Tuchscherer     2016-08-25  109  }


I've been doing some Linux kernel research on the IBM Cloud s390x VPC
and running syzkaller and Linux kernel tests tools to send out useful
patches. :)


Warm regards,

Yunseong kim
