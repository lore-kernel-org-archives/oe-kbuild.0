Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41422241F9
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Sep 2023 12:43:55 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-404314388ceso7291065e9.2
        for <oe-kbuild@lists.linux.dev>; Thu, 14 Sep 2023 05:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694695434; x=1695300234; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RVMnfKNHlwV6ahUqneKXp7GuP6scvwxex/BQBdlMFRA=;
        b=VMuEnXtEOelePnl6zdQ85eKlsXNeHICkvg+GBAovxFgoIx+kvJnbm30qQbtq43NkAr
         aRi+YzKFhAVylz6554VC+MfyNeQSQSg40KrOaU1QpXhMij2bHs1ss2J1dUWM6WW2v3Tj
         2arl88Tn+ioOAtmRdXG2LxxK2xgESfBSa41k10nlAydTs1BSlw6Gvuq1UXypSbRv2zsu
         Sre9ZfRcedfno8u8im1pVhnqXpCmfTUwVa3XpunfqibOHPVk0etASir4OQHk5ZTYgS/T
         kj/RX0FdL0V7WIKe6/Tsu/PSsdB9RsU7Jsm8SA9uKLXNUCWtsx+MqVpahbEHAoqNQBEc
         sUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694695434; x=1695300234;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RVMnfKNHlwV6ahUqneKXp7GuP6scvwxex/BQBdlMFRA=;
        b=ofexp3uW9KfF52bW0vqRbC8QYFZHI3PF8uXpICTdX81P6TqhslDCXXavhheZRw/+Fp
         8AIqNyBUZGs8HwgG1fMxRMKu09g3VKVDFoGu0OGsbNX4EHQKUDA0UU6tlEafLpygvPWU
         mM9LJbSK+Sy57T4crtNQbhTk2anBDy+vgFdhmgj4+fFAf16aSp1EEWL5hWZb+QW64J0k
         NwUM4NrujGHmoeFWayYtAaYD8rtn2CucuJ3W/ClnQ8Ep7L7YHnd+uWftkruRaPedaxzc
         cx9UwKwdT6mS1o7o3bm8RqH5gbPh/5x5xiV/fvOKgEZBc7SRUU/T3YuEjkhf8FV5gH3u
         /aPg==
X-Gm-Message-State: AOJu0Yw2T5st34/E4/ISy0CMKRPA3PN9KfKKyrin0d6eiqnt55d//6wH
	Zqi8rrGhPSzscbI/r4qgpxKjSLOirJH3uOUlVR4=
X-Google-Smtp-Source: AGHT+IHizEGuq+cT4++mpZfrpEE6exeXMp3yxFmX2ySqhur0dQwpWf3YFrbEFdNIUnwIadb+kIymEw==
X-Received: by 2002:a05:600c:3787:b0:402:ee72:2314 with SMTP id o7-20020a05600c378700b00402ee722314mr4705085wmr.3.1694695434062;
        Thu, 14 Sep 2023 05:43:54 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 26-20020a05600c231a00b003fe1a96845bsm4795661wmo.2.2023.09.14.05.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 05:43:53 -0700 (PDT)
Date: Thu, 14 Sep 2023 15:43:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] Bluetooth: L2CAP: Fix leaking l2cap_conn objects
Message-ID: <70e80b39-c974-4069-acce-d8ea7559555b@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913193839.3029428-1-luiz.dentz@gmail.com>

Hi Luiz,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Augusto-von-Dentz/Bluetooth-L2CAP-Fix-leaking-l2cap_conn-objects/20230914-034053
base:   linus/master
patch link:    https://lore.kernel.org/r/20230913193839.3029428-1-luiz.dentz%40gmail.com
patch subject: [PATCH] Bluetooth: L2CAP: Fix leaking l2cap_conn objects
config: x86_64-randconfig-161-20230914 (https://download.01.org/0day-ci/archive/20230914/202309141910.lGRlJL61-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230914/202309141910.lGRlJL61-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202309141910.lGRlJL61-lkp@intel.com/

smatch warnings:
net/bluetooth/hci_conn.c:2725 hci_chan_del() warn: variable dereferenced before check 'conn' (see line 2723)

vim +/conn +2725 net/bluetooth/hci_conn.c

9472007c62ecc8 Andrei Emeltchenko     2012-09-06  2720  void hci_chan_del(struct hci_chan *chan)
73d80deb7bdf01 Luiz Augusto von Dentz 2011-11-02  2721  {
73d80deb7bdf01 Luiz Augusto von Dentz 2011-11-02  2722  	struct hci_conn *conn = chan->conn;
73d80deb7bdf01 Luiz Augusto von Dentz 2011-11-02 @2723  	struct hci_dev *hdev = conn->hdev;
                                                                                       ^^^^^^^^^^
Dereference

73d80deb7bdf01 Luiz Augusto von Dentz 2011-11-02  2724  
6fc2f406e4158e Luiz Augusto von Dentz 2023-09-13 @2725  	if (!conn)
                                                                    ^^^^^
Too late

6fc2f406e4158e Luiz Augusto von Dentz 2023-09-13  2726  		return;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

