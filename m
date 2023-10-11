Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B66E1A714
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Oct 2023 17:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DAR5aYwg"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40684f53d11so1841395e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 11 Oct 2023 10:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697045203; x=1697650003; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YUXMjptMxqquRHS9MTgrETZRVkLs5a0l4ILdlb0TDQ=;
        b=DAR5aYwgvoSLb/Atgz7PEwuaVxVkQcLbQHvvcxKL2P80nA9O3NE3qahXYESYMWCh4+
         4cUq1RGS2y21yRdbD5vKVcU8m58cWbo0EDMdU8L9myArxPWbCPGiF5lIIzUat2BN9Wqa
         DIDwN7PNXT0I1mBX4M7sPUq3JOePTIgQ7lltNTPPMZbCehToes+YCDboFKvNKMle5cjv
         ejxarewA39EqvT4LDOr2zRKsHyHwPNUCGmuuCnOE7mxZdzieiWBHaNBrmXJDG2UPeWku
         aZYc3wW7Kbd/FDIedFNjJXH1I1hsDHaAjkbDs6EJqWJU/p+nj53yCq6abGSeDQXAH2n8
         8Ofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697045203; x=1697650003;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4YUXMjptMxqquRHS9MTgrETZRVkLs5a0l4ILdlb0TDQ=;
        b=Yt2g99xlzNC6pguUXwA8yDHnuaUlL7q1SbYRvDghn98lT/xXviQyo6Q3P/PqUbRhxc
         rtuaDuT/MSjnn8RSmokWyxnllQDbukaitkJcjL4r/ob/uu9fL6ENEhE35zf+cU18Y8Uj
         04/CNaOUO190WVy6mhbG0U/mVg6QsdTOlQNvS9YU3nPecD5rwCh5lyatKpFQ5XQ9b8su
         QwfA8FD2YoBcm3fUV+njOUWyHIHD670Pga50vgG5iGkD3QW4GnHW2f1pbvMBaCDOPkNe
         //ZA6juPBHaogkr4D+uYzOZ+vcH6iSSNgvMimOe+po657Y8T6iYT1fFPJXexpkECjF29
         8KDQ==
X-Gm-Message-State: AOJu0Yx8HrkOFmcyipWM/Kfas4PTzaEDYSQ0CeEtuq9t1j67t+3YTDtZ
	YrTDy89+Tmx65afJLRY+VNqmQ0xwSDBomrj8lC0=
X-Google-Smtp-Source: AGHT+IEW+I3tetIW54AUPeMeWYw8s2uXbVgQ84gKeWkNp5+Qarh4v1jZOH5IhnRwwSndHgb1i5DO0A==
X-Received: by 2002:adf:9dcb:0:b0:32d:87df:6ded with SMTP id q11-20020adf9dcb000000b0032d87df6dedmr1892009wre.27.1697045203216;
        Wed, 11 Oct 2023 10:26:43 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r18-20020adfe692000000b0031912c0ffebsm16045713wrm.23.2023.10.11.10.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 10:26:42 -0700 (PDT)
Date: Wed, 11 Oct 2023 20:26:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Kees Cook <keescook@chromium.org>
Subject: [linux-next:master 10943/11428] net/bluetooth/hci_event.c:3276
 hci_conn_request_evt() warn: variable dereferenced before check 'hdev' (see
 line 3266)
Message-ID: <c5ac77c2-0cea-4262-a5b5-223d2edb17a9@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2933a1156742d8c47550493a77af8e2d81cf3c84
commit: b8ba8e65e84b99d58e278900b4261ef17a20eb27 [10943/11428] Bluetooth: avoid memcmp() out of bounds warning
config: i386-randconfig-141-20231011 (https://download.01.org/0day-ci/archive/20231012/202310120031.J3PSRP8D-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310120031.J3PSRP8D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202310120031.J3PSRP8D-lkp@intel.com/

smatch warnings:
net/bluetooth/hci_event.c:3276 hci_conn_request_evt() warn: variable dereferenced before check 'hdev' (see line 3266)

vim +/hdev +3276 net/bluetooth/hci_event.c

3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  3262  static void hci_conn_request_evt(struct hci_dev *hdev, void *data,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  3263  				 struct sk_buff *skb)
^1da177e4c3f41 Linus Torvalds         2005-04-16  3264  {
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  3265  	struct hci_ev_conn_request *ev = data;
a9de9248064bfc Marcel Holtmann        2007-10-20 @3266  	int mask = hdev->link_mode;
                                                                           ^^^^^^^^^^^^^^^
Dereference

70c464256310e1 Johan Hedberg          2014-07-09  3267  	struct inquiry_entry *ie;
70c464256310e1 Johan Hedberg          2014-07-09  3268  	struct hci_conn *conn;
20714bfef84d3e Frédéric Dalleau       2012-11-21  3269  	__u8 flags = 0;
^1da177e4c3f41 Linus Torvalds         2005-04-16  3270  
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  3271  	bt_dev_dbg(hdev, "bdaddr %pMR type 0x%x", &ev->bdaddr, ev->link_type);
^1da177e4c3f41 Linus Torvalds         2005-04-16  3272  
d70e44fef8621a Lee, Chun-Yi           2023-10-01  3273  	/* Reject incoming connection from device with same BD ADDR against
d70e44fef8621a Lee, Chun-Yi           2023-10-01  3274  	 * CVE-2020-26555
d70e44fef8621a Lee, Chun-Yi           2023-10-01  3275  	 */
b8ba8e65e84b99 Arnd Bergmann          2023-10-09 @3276  	if (hdev && !bacmp(&hdev->bdaddr, &ev->bdaddr)) {
                                                                    ^^^^
Checked too late

d70e44fef8621a Lee, Chun-Yi           2023-10-01  3277  		bt_dev_dbg(hdev, "Reject connection with same BD_ADDR %pMR\n",
d70e44fef8621a Lee, Chun-Yi           2023-10-01  3278  			   &ev->bdaddr);
d70e44fef8621a Lee, Chun-Yi           2023-10-01  3279  		hci_reject_conn(hdev, &ev->bdaddr);
d70e44fef8621a Lee, Chun-Yi           2023-10-01  3280  		return;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

