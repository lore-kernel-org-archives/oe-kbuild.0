Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF35C628;
	Mon, 27 Feb 2023 04:21:21 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id bw19so4768839wrb.13;
        Sun, 26 Feb 2023 20:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pk6+u313nGwdPwnCL2uYhmnmzSSeJhMPAfJ0uAFQ4y8=;
        b=gDuXfFBYAV4HQsMWPaDvHyTpCnTbRFig6BKCXAfL3KqZk2rZf1zTN9t56oFNDO8HHF
         bZugq4WKDkIBWxGyB+R34m84YJMW0s8g++vJQaEjhz8m3pF1xbNy1b74XxR1IWh/6KQI
         kEIiaaBoe+FLParapzMorpD8hxq7zAJdcE0QNaAxNDPmnz/WUKT8hGiGVEzWSNdhNLOe
         Xtx6wVOQ2kM1GAPyQdt9WZqbx1hkzdRyGZeOoja6wty8xevL2QO+eI4QCtDyjFuRntXA
         tiWO4xZcAHWq9tdC32HK6pq0laXk9ooXpJWVyX8iwMxp+CmZD6at9EXH+NutEbfmjdy6
         o7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pk6+u313nGwdPwnCL2uYhmnmzSSeJhMPAfJ0uAFQ4y8=;
        b=Hc0198vWwhZ09Z6pOr+fVIsUg+PgEIh6iaokgE5g715Y4TBq+JbvWIi2ndZH7c3Smz
         ogFTp5JF86d8emlSX1VM+Dk+3wTDs6lWH+eqlGmC9nBE0UTMWXIDLrrK9PMH/qNwsbWN
         +QJtwCgL8+d0RY9swCDoHVvyfTX2c1rFkN7J7SCi4OCvw4KsXWcSu9gDGQoQ6rc3xmye
         8tsCdMv4zWBJ5/16NgPG/R4Yq3sTBWekHWYOmGrd815N+2HXIWyPQLafOsVQvc6dqCqM
         VnU1IgEwls9YT1w+JFV3Z337h2JjD41YmHZOLDVvNl0RObEGIXNDupMHG89fyUduO2/p
         V3fg==
X-Gm-Message-State: AO0yUKVtRzLRlPcmd58PsbI4cMGc9fCo3wUZKCca/Bc+mTS8F5KuHi5M
	9I7/sn9IxB9MnP5o8rnHI40GIKGJSFA=
X-Google-Smtp-Source: AK7set9diZFf3gJAvY9uaw3LdW2aBumDfybS6OUHLVDGLjyRGj/PdRuEBTqvo73Wtkwhe4sDXHzWMw==
X-Received: by 2002:a5d:42c3:0:b0:2c7:3c96:18d7 with SMTP id t3-20020a5d42c3000000b002c73c9618d7mr9119389wrr.20.1677471679805;
        Sun, 26 Feb 2023 20:21:19 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d24-20020a1c7318000000b003dc522dd25esm7502352wmb.30.2023.02.26.20.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 20:21:19 -0800 (PST)
Date: Mon, 27 Feb 2023 07:21:15 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Zhengping Jiang <jiangzp@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: [linux-next:master 13863/14003] net/bluetooth/hci_sync.c:2403
 hci_pause_addr_resolution() warn: missing error code? 'err'
Message-ID: <202302251952.xryXOegd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230227042115.Rh4vG-fX9-VMZYf68YnoePgmZgw1XduowqL-YzddwTM@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8232539f864ca60474e38eb42d451f5c26415856
commit: 2b291083eb0c49cd1633cddf95cc0e6e7303e43b [13863/14003] Bluetooth: hci_sync: Resume adv with no RPA when active scan
config: parisc-randconfig-m031-20230223 (https://download.01.org/0day-ci/archive/20230225/202302251952.xryXOegd-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302251952.xryXOegd-lkp@intel.com/

New smatch warnings:
net/bluetooth/hci_sync.c:2403 hci_pause_addr_resolution() warn: missing error code? 'err'

vim +/err +2403 net/bluetooth/hci_sync.c

2b291083eb0c49 Zhengping Jiang        2023-02-21  2370  static int hci_pause_addr_resolution(struct hci_dev *hdev)
2b291083eb0c49 Zhengping Jiang        2023-02-21  2371  {
2b291083eb0c49 Zhengping Jiang        2023-02-21  2372  	int err;
2b291083eb0c49 Zhengping Jiang        2023-02-21  2373  
2b291083eb0c49 Zhengping Jiang        2023-02-21  2374  	if (!use_ll_privacy(hdev))
2b291083eb0c49 Zhengping Jiang        2023-02-21  2375  		return 0;
2b291083eb0c49 Zhengping Jiang        2023-02-21  2376  
2b291083eb0c49 Zhengping Jiang        2023-02-21  2377  	if (!hci_dev_test_flag(hdev, HCI_LL_RPA_RESOLUTION))
2b291083eb0c49 Zhengping Jiang        2023-02-21  2378  		return 0;
2b291083eb0c49 Zhengping Jiang        2023-02-21  2379  
2b291083eb0c49 Zhengping Jiang        2023-02-21  2380  	/* Cannot disable addr resolution if scanning is enabled or
2b291083eb0c49 Zhengping Jiang        2023-02-21  2381  	 * when initiating an LE connection.
2b291083eb0c49 Zhengping Jiang        2023-02-21  2382  	 */
2b291083eb0c49 Zhengping Jiang        2023-02-21  2383  	if (hci_dev_test_flag(hdev, HCI_LE_SCAN) ||
2b291083eb0c49 Zhengping Jiang        2023-02-21  2384  	    hci_lookup_le_connect(hdev)) {
2b291083eb0c49 Zhengping Jiang        2023-02-21  2385  		bt_dev_err(hdev, "Command not allowed when scan/LE connect");
2b291083eb0c49 Zhengping Jiang        2023-02-21  2386  		return -EPERM;
2b291083eb0c49 Zhengping Jiang        2023-02-21  2387  	}
2b291083eb0c49 Zhengping Jiang        2023-02-21  2388  
2b291083eb0c49 Zhengping Jiang        2023-02-21  2389  	/* Cannot disable addr resolution if advertising is enabled. */
2b291083eb0c49 Zhengping Jiang        2023-02-21  2390  	err = hci_pause_advertising_sync(hdev);
2b291083eb0c49 Zhengping Jiang        2023-02-21  2391  	if (err) {
2b291083eb0c49 Zhengping Jiang        2023-02-21  2392  		bt_dev_err(hdev, "Pause advertising failed: %d", err);
2b291083eb0c49 Zhengping Jiang        2023-02-21  2393  		return err;
2b291083eb0c49 Zhengping Jiang        2023-02-21  2394  	}
2b291083eb0c49 Zhengping Jiang        2023-02-21  2395  
2b291083eb0c49 Zhengping Jiang        2023-02-21  2396  	err = hci_le_set_addr_resolution_enable_sync(hdev, 0x00);
2b291083eb0c49 Zhengping Jiang        2023-02-21  2397  	if (err)
2b291083eb0c49 Zhengping Jiang        2023-02-21  2398  		bt_dev_err(hdev, "Unable to disable Address Resolution: %d",
2b291083eb0c49 Zhengping Jiang        2023-02-21  2399  			   err);
2b291083eb0c49 Zhengping Jiang        2023-02-21  2400  
2b291083eb0c49 Zhengping Jiang        2023-02-21  2401  	/* Return if address resolution is disabled and RPA is not used. */
2b291083eb0c49 Zhengping Jiang        2023-02-21  2402  	if (!err && scan_use_rpa(hdev))
2b291083eb0c49 Zhengping Jiang        2023-02-21 @2403  		return err;

This is correct, but change it to "return 0;" for readability.

2b291083eb0c49 Zhengping Jiang        2023-02-21  2404  
2b291083eb0c49 Zhengping Jiang        2023-02-21  2405  	hci_resume_advertising_sync(hdev);
2b291083eb0c49 Zhengping Jiang        2023-02-21  2406  	return err;
2b291083eb0c49 Zhengping Jiang        2023-02-21  2407  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

