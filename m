Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2884E23AD
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Nov 2023 06:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YXwg286o"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40b40423d06so1051175e9.2
        for <oe-kbuild@lists.linux.dev>; Fri, 24 Nov 2023 22:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700895509; x=1701500309; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/uo5CibKeOkFUqJh16VzRlz/76V7/U2PLO3u/fe3CMk=;
        b=YXwg286oJ0wuvg+FGNMKsaCX9K0/IiVOan8tk3nuzzdEHZUuKUPLsEMOvls8AuPxNN
         4bh5Aqluq8gkVPj9Z1b91DIhXae5+YZmGYvn7JMtVv1Ovfh3NExO8BszpwjKHCqzTdj0
         /VxoaFY5yGUr9fPgn5FrsfcmtdY8OI4n7Ir0tBOVVPGDrqu4LPb8ZcLwPgBQAPZFD0iB
         yzrDYukWWtjjopgi8s+cRPdy34rGnsHiT6wWHDL/bI7wq5ex4UBRVGgxILAuWI5F2eeA
         LCrusHgPm3S25awcv4MEk4gQmy5htx1NfxttU0f0sxYZmgaGEbGs+Ei3gXD0VXAObwf7
         4rsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700895509; x=1701500309;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/uo5CibKeOkFUqJh16VzRlz/76V7/U2PLO3u/fe3CMk=;
        b=Z/qBn4CTo9zfo4BU3AWQ5Yb7z4H4JakUmCYU0kP51kBNDl2+E3501It//N5GJM5k17
         B/W78HM2X4avyOlVa0GqdwbBSOEL+2duj/oCdpBe3d2Srhdm9qq/1e33M1XzCYnRiqYG
         tEOSVVpIR6/68bPjMXwI6mF9ZA4Z4Ekr0brekYi0iwg/atUbpJzIe+Fi91CoXMyFqcVS
         /aEd6gxmdMDmoi7AMnThv4rzA5/9ZSrwKkZdVjy8sda6Xlz5OxjcPXEBaiawkls/9bfY
         FHujPIeAbbGxn6AtKQAJqwgVm6uAjopZqWfBzTKJo8fxYbwXjc8rvdwbeeImmNfH7cOo
         mBiQ==
X-Gm-Message-State: AOJu0Yw6RTzhUbbWpRlJ19rCxK2F/bA2DZ0sQyN10kyCcXYQvcXCwzUU
	o23XjYMLBkV7UVjheN2iBsLL/wqjhYcAXDXeJEM=
X-Google-Smtp-Source: AGHT+IHcl8uetpwlT1aQhBBy4T12VrQRvbvvD5MFmKhqnNwulmFELZnYn0ZzSJS+0YkIgBIw8ZLlag==
X-Received: by 2002:a05:600c:31a9:b0:405:770b:e90a with SMTP id s41-20020a05600c31a900b00405770be90amr3938389wmp.34.1700895508601;
        Fri, 24 Nov 2023 22:58:28 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n44-20020a05600c502c00b004083a105f27sm7737838wmr.26.2023.11.24.22.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 22:58:28 -0800 (PST)
From: kernel test robot <dan.carpenter@linaro.org>
X-Google-Original-From: kernel test robot <lkp@intel.com>
Date: Sat, 25 Nov 2023 09:58:24 +0300
To: oe-kbuild@lists.linux.dev, Arnd Bergmann <arnd@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
	Iulia Tanasescu <iulia.tanasescu@nxp.com>,
	Pauli Virtanen <pav@iki.fi>, Jakub Kicinski <kuba@kernel.org>,
	"Lee, Chun-Yi" <jlee@suse.com>,
	Claudia Draghicescu <claudia.rosu@nxp.com>,
	Ziyang Xuan <william.xuanziyang@huawei.com>,
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: hci_event: shut up a false-positive warning
Message-ID: <ZWGbEMgAuyPVtUZS@suswa>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231122221805.3139482-1-arnd@kernel.org>

Hi Arnd,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/Bluetooth-hci_event-shut-up-a-false-positive-warning/20231123-112143
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20231122221805.3139482-1-arnd%40kernel.org
patch subject: [PATCH] Bluetooth: hci_event: shut up a false-positive warning
config: i386-randconfig-141-20231123 (https://download.01.org/0day-ci/archive/20231124/202311241707.qytKwxbE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231124/202311241707.qytKwxbE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311241707.qytKwxbE-lkp@intel.com/

New smatch warnings:
net/bluetooth/hci_event.c:520 hci_cc_read_class_of_dev() warn: signedness bug returning '(-6)'

Old smatch warnings:
net/bluetooth/hci_event.c:3278 hci_conn_request_evt() warn: variable dereferenced before check 'hdev' (see line 3268)

vim +520 net/bluetooth/hci_event.c

c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  514  static u8 hci_cc_read_class_of_dev(struct hci_dev *hdev, void *data,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  515  				   struct sk_buff *skb)
a9de9248064bfc Marcel Holtmann        2007-10-20  516  {
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  517  	struct hci_rp_read_class_of_dev *rp = data;
e3f3a1aea8719a Luiz Augusto von Dentz 2021-12-01  518  
5f3aa66f201253 Arnd Bergmann          2023-11-22  519  	if (WARN_ON(!hdev))
5f3aa66f201253 Arnd Bergmann          2023-11-22 @520  		return -ENXIO;

This function returns u8.

5f3aa66f201253 Arnd Bergmann          2023-11-22  521  
e3f3a1aea8719a Luiz Augusto von Dentz 2021-12-01  522  	bt_dev_dbg(hdev, "status 0x%2.2x", rp->status);
a9de9248064bfc Marcel Holtmann        2007-10-20  523  
a9de9248064bfc Marcel Holtmann        2007-10-20  524  	if (rp->status)
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  525  		return rp->status;
a9de9248064bfc Marcel Holtmann        2007-10-20  526  
a9de9248064bfc Marcel Holtmann        2007-10-20  527  	memcpy(hdev->dev_class, rp->dev_class, 3);
a9de9248064bfc Marcel Holtmann        2007-10-20  528  
e3f3a1aea8719a Luiz Augusto von Dentz 2021-12-01  529  	bt_dev_dbg(hdev, "class 0x%.2x%.2x%.2x", hdev->dev_class[2],
e3f3a1aea8719a Luiz Augusto von Dentz 2021-12-01  530  		   hdev->dev_class[1], hdev->dev_class[0]);
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  531  
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  532  	return rp->status;
a9de9248064bfc Marcel Holtmann        2007-10-20  533  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
