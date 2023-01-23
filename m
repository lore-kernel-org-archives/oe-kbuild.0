Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4E17C;
	Mon, 23 Jan 2023 12:03:18 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id t5so10590762wrq.1;
        Mon, 23 Jan 2023 04:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=naREYrGCnL2JKVgRkgwxtRoXQKOJ4lKotuFrXLo0TUM=;
        b=UZiSaqHTf354ob/9hvjPcG7pDDI7awL0mauVJnwj2wH9xPORjFpLAlny+UubWbSdhu
         hDMc/z1D+RTtL+P+UEqA7sHiED+K3oy7/1Ke1q7GjgBt7jxcy/0f3vhgpJyMHYOBaX4Q
         ixZKhtB7Qf0Vo2gZh98TbsbJrepFom/+7kiZkSuapS5lweiCVNDkeMyxT0KKIdRg96vY
         0YGbFr2oDEXX13BrEfY34mg1yw7nPgysmuCYBJQg+cGqmK3DG2XuGdkWr5SZW1uQ1Aat
         hAqtopfkavvhp4q3HT1EGThjuUQCuB/erdh4wgkErbT8qn/auBId5xmndbLgBmNs+3hT
         CJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=naREYrGCnL2JKVgRkgwxtRoXQKOJ4lKotuFrXLo0TUM=;
        b=BL8lkb7sbb4LAjLdgSOpvxzMvK2FbMxKTGANILJ5uMFWm9YFNDw8XF2c/LLc+js444
         AKQvwnUEmoeMMdi95KoQaXlYFH0lHrL5wSEDtB3ggjlTtvn6J7F7KXZmJeJSJZam8+2n
         XpVdl990oiURxj5+FyqogQOlm6pgTRjm8U66+i5ATYsSXvfdHzRo2a1gBrJ/xOGkWz9k
         YqLk62Ex+GzT0KPa4xMPZTVuXkDq4Ppe4ns0ihJSVeoWnIvqcrGCRd95wQDBpmxVzWB0
         44WDTvRxbBUGucZNj5pEMZSVb17V69gsbMCn6Vha2II2uFly8vEYQLJx4AFxnhBm5p2v
         QtLA==
X-Gm-Message-State: AFqh2kpErfuWdL4322rb/qyWcefNjVaar0K+jQ6Xaye8+IWigfbqjDcf
	DbNLq7Pvx5tLmKt8C1ueiVFdE4ohkUI=
X-Google-Smtp-Source: AMrXdXtdtwgntp8C5hZdOoDztezP0X5xbTmB59EHZ8mTaHAMnjL7B8BhWI4zuEMcsHrOJnHRb9JwAg==
X-Received: by 2002:adf:efc8:0:b0:29d:f817:42d4 with SMTP id i8-20020adfefc8000000b0029df81742d4mr31510112wrp.19.1674475396753;
        Mon, 23 Jan 2023 04:03:16 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r8-20020a056000014800b0027323b19ecesm4911457wrx.16.2023.01.23.04.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 04:03:16 -0800 (PST)
Date: Mon, 23 Jan 2023 15:03:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Lukas Wunner <lukas@wunner.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [l1k:pciehp_deadlock_v2_attempt_per_dev_rwsem 3/3]
 drivers/pci/doe.c:313 doe_statemachine_work() warn: inconsistent returns
 '&pdev->reset_lock'.
Message-ID: <Y853gQjq6cX3/gNp@kadam>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux pciehp_deadlock_v2_attempt_per_dev_rwsem
head:   1fd5c4fbe98942fb0a686f116616b8f3098e2680
commit: 1fd5c4fbe98942fb0a686f116616b8f3098e2680 [3/3] PCI/DOE: Protect DOE exchanges against concurrent reset.
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230122/202301220912.A7Z0o7dG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/pci/doe.c:313 doe_statemachine_work() warn: inconsistent returns '&pdev->reset_lock'.

vim +313 drivers/pci/doe.c

9d24322e887b6a Jonathan Cameron 2022-07-19  250  static void doe_statemachine_work(struct work_struct *work)
9d24322e887b6a Jonathan Cameron 2022-07-19  251  {
9d24322e887b6a Jonathan Cameron 2022-07-19  252  	struct pci_doe_task *task = container_of(work, struct pci_doe_task,
9d24322e887b6a Jonathan Cameron 2022-07-19  253  						 work);
9d24322e887b6a Jonathan Cameron 2022-07-19  254  	struct pci_doe_mb *doe_mb = task->doe_mb;
9d24322e887b6a Jonathan Cameron 2022-07-19  255  	struct pci_dev *pdev = doe_mb->pdev;
9d24322e887b6a Jonathan Cameron 2022-07-19  256  	int offset = doe_mb->cap_offset;
9d24322e887b6a Jonathan Cameron 2022-07-19  257  	unsigned long timeout_jiffies;
9d24322e887b6a Jonathan Cameron 2022-07-19  258  	u32 val;
9d24322e887b6a Jonathan Cameron 2022-07-19  259  	int rc;
9d24322e887b6a Jonathan Cameron 2022-07-19  260  
9d24322e887b6a Jonathan Cameron 2022-07-19  261  	if (test_bit(PCI_DOE_FLAG_DEAD, &doe_mb->flags)) {
9d24322e887b6a Jonathan Cameron 2022-07-19  262  		signal_task_complete(task, -EIO);
9d24322e887b6a Jonathan Cameron 2022-07-19  263  		return;
9d24322e887b6a Jonathan Cameron 2022-07-19  264  	}
9d24322e887b6a Jonathan Cameron 2022-07-19  265  
1fd5c4fbe98942 Lukas Wunner     2023-01-21  266  	down_read(&pdev->reset_lock);
1fd5c4fbe98942 Lukas Wunner     2023-01-21  267  
9d24322e887b6a Jonathan Cameron 2022-07-19  268  	/* Send request */
9d24322e887b6a Jonathan Cameron 2022-07-19  269  	rc = pci_doe_send_req(doe_mb, task);
9d24322e887b6a Jonathan Cameron 2022-07-19  270  	if (rc) {
9d24322e887b6a Jonathan Cameron 2022-07-19  271  		/*
9d24322e887b6a Jonathan Cameron 2022-07-19  272  		 * The specification does not provide any guidance on how to
9d24322e887b6a Jonathan Cameron 2022-07-19  273  		 * resolve conflicting requests from other entities.
9d24322e887b6a Jonathan Cameron 2022-07-19  274  		 * Furthermore, it is likely that busy will not be detected
9d24322e887b6a Jonathan Cameron 2022-07-19  275  		 * most of the time.  Flag any detection of status busy with an
9d24322e887b6a Jonathan Cameron 2022-07-19  276  		 * error.
9d24322e887b6a Jonathan Cameron 2022-07-19  277  		 */
9d24322e887b6a Jonathan Cameron 2022-07-19  278  		if (rc == -EBUSY)
9d24322e887b6a Jonathan Cameron 2022-07-19  279  			dev_err_ratelimited(&pdev->dev, "[%x] busy detected; another entity is sending conflicting requests\n",
9d24322e887b6a Jonathan Cameron 2022-07-19  280  					    offset);
9d24322e887b6a Jonathan Cameron 2022-07-19  281  		signal_task_abort(task, rc);
9d24322e887b6a Jonathan Cameron 2022-07-19  282  		return;

Needs to drop the lock before returning

9d24322e887b6a Jonathan Cameron 2022-07-19  283  	}
9d24322e887b6a Jonathan Cameron 2022-07-19  284  
9d24322e887b6a Jonathan Cameron 2022-07-19  285  	timeout_jiffies = jiffies + PCI_DOE_TIMEOUT;
9d24322e887b6a Jonathan Cameron 2022-07-19  286  	/* Poll for response */
9d24322e887b6a Jonathan Cameron 2022-07-19  287  retry_resp:
9d24322e887b6a Jonathan Cameron 2022-07-19  288  	pci_read_config_dword(pdev, offset + PCI_DOE_STATUS, &val);
9d24322e887b6a Jonathan Cameron 2022-07-19  289  	if (FIELD_GET(PCI_DOE_STATUS_ERROR, val)) {
9d24322e887b6a Jonathan Cameron 2022-07-19  290  		signal_task_abort(task, -EIO);
9d24322e887b6a Jonathan Cameron 2022-07-19  291  		return;

Same

9d24322e887b6a Jonathan Cameron 2022-07-19  292  	}
9d24322e887b6a Jonathan Cameron 2022-07-19  293  
9d24322e887b6a Jonathan Cameron 2022-07-19  294  	if (!FIELD_GET(PCI_DOE_STATUS_DATA_OBJECT_READY, val)) {
9d24322e887b6a Jonathan Cameron 2022-07-19  295  		if (time_after(jiffies, timeout_jiffies)) {
9d24322e887b6a Jonathan Cameron 2022-07-19  296  			signal_task_abort(task, -EIO);
9d24322e887b6a Jonathan Cameron 2022-07-19  297  			return;

Same

9d24322e887b6a Jonathan Cameron 2022-07-19  298  		}
9d24322e887b6a Jonathan Cameron 2022-07-19  299  		rc = pci_doe_wait(doe_mb, PCI_DOE_POLL_INTERVAL);
9d24322e887b6a Jonathan Cameron 2022-07-19  300  		if (rc) {
9d24322e887b6a Jonathan Cameron 2022-07-19  301  			signal_task_abort(task, rc);
9d24322e887b6a Jonathan Cameron 2022-07-19  302  			return;

Same

9d24322e887b6a Jonathan Cameron 2022-07-19  303  		}
9d24322e887b6a Jonathan Cameron 2022-07-19  304  		goto retry_resp;
9d24322e887b6a Jonathan Cameron 2022-07-19  305  	}
9d24322e887b6a Jonathan Cameron 2022-07-19  306  
9d24322e887b6a Jonathan Cameron 2022-07-19  307  	rc  = pci_doe_recv_resp(doe_mb, task);
9d24322e887b6a Jonathan Cameron 2022-07-19  308  	if (rc < 0) {
9d24322e887b6a Jonathan Cameron 2022-07-19  309  		signal_task_abort(task, rc);
9d24322e887b6a Jonathan Cameron 2022-07-19  310  		return;

Same

9d24322e887b6a Jonathan Cameron 2022-07-19  311  	}
9d24322e887b6a Jonathan Cameron 2022-07-19  312  
9d24322e887b6a Jonathan Cameron 2022-07-19 @313  	signal_task_complete(task, rc);
9d24322e887b6a Jonathan Cameron 2022-07-19  314  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

