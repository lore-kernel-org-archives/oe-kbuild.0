Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA3BAD36
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Sep 2023 08:18:02 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-401bbfc05fcso46069395e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 11 Sep 2023 01:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694420281; x=1695025081; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ghOk3mQjRD6nktkkJO9Z2clGd3jvPgI65U2kpsQhXa0=;
        b=KSPNBxItCtYVcOEVj0hWcgiC6r0m28NWRkcobHBCn/SktBBtI6CRJwniq87n5+v6Kg
         NIDWQ8N97sq0YHQBkNRVkheB5qYiJ1MxJ2ymZdCTbT6oBY6VFfVDIIQZZYWBVFEAQIMz
         PN0JLinfh/9NnLRKyCZ/xS1neIoNDZyF2PFZhddym5trEn4fHimK4ZRqDs9TzwESJdnW
         h37Hlj8Mde7a21R/A0KcsYeVcxRdtKMAsXFnfyGZ7IxDE8b4GcZVPlHUSc0zOBonM5wi
         ZSFL761/TQM5eCtsE7zCQoKuYgOHd/lugH7hNlMWZjaKBeDQcOK/usDFp52uy+PpHmSv
         wctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694420281; x=1695025081;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ghOk3mQjRD6nktkkJO9Z2clGd3jvPgI65U2kpsQhXa0=;
        b=TBY8AMFAgMyc3HgP5dKpWMK/bSNOIBcBpI17ERy5cXrJTJg6JT7hw7k7DRs4EqmZu6
         GkjxbNKzicKawdZvlEXMlDHYqYdaUWpC7ED7OIIeq3UZjs5luMMWxUP6Xt4SU6L+Dhap
         vam0L/w/qI1AhK1IrfnhKhb3mEEb46uY7ERxdHMZsAhUO1O+AECkUKUtUtB36zB1eXK2
         4iZEW0RjhOCWt1mj3cdV/25ZnixTdHxpGgn6TVlrb0OVGdwzikwKyEofgzbdiId1IhVo
         SwCC2RzQgc8k83Wstg7pV8ruJDZ1lgjIoJCrCI0OK6yF014wdklHA98KhhSgf1u1i0tZ
         IamQ==
X-Gm-Message-State: AOJu0Yy1BUiSnvuZtTSOKgXJ3p6w6Cp5go6IjWzDoy9LleExcGAl/dKa
	kSb9SEBsUQhe76Rp/Ta+X5MCG54Zzj8p5JzPGTQ=
X-Google-Smtp-Source: AGHT+IFNDdz058vs4BTxajc1ALDRYm9virYOJkO60ysTS5r67aIuq/AAZX2CYNe3A5EYX1ziG3MITA==
X-Received: by 2002:a05:600c:1d82:b0:402:f510:e5b3 with SMTP id p2-20020a05600c1d8200b00402f510e5b3mr7681351wms.2.1694420280716;
        Mon, 11 Sep 2023 01:18:00 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u3-20020a05600c210300b003fe601a7d46sm12445939wml.45.2023.09.11.01.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 01:18:00 -0700 (PDT)
Date: Mon, 11 Sep 2023 11:17:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Hilda Wu <hildawu@realtek.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Alex Lu <alex_lu@realsil.com.cn>,
	Simon Horman <simon.horman@corigine.com>
Subject: net/bluetooth/msft.c:563 msft_add_monitor_sync() warn: passing zero
 to 'PTR_ERR'
Message-ID: <6b4f7617-8885-4444-9e59-2ddb5994b2b5@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   32bf43e4efdb87e0f7e90ba3883e07b8522322ad
commit: 9e14606d8f38ea52a38c27692a9c1513c987a5da Bluetooth: msft: Extended monitor tracking by address filter
config: x86_64-randconfig-161-20230906 (https://download.01.org/0day-ci/archive/20230909/202309091157.V0PEAQVg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230909/202309091157.V0PEAQVg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202309091157.V0PEAQVg-lkp@intel.com/

smatch warnings:
net/bluetooth/msft.c:563 msft_add_monitor_sync() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +563 net/bluetooth/msft.c

182ee45da083db Luiz Augusto von Dentz 2021-10-27  549  	list_for_each_entry(entry, &monitor->patterns, list) {
182ee45da083db Luiz Augusto von Dentz 2021-10-27  550  		pattern = (void *)(pattern_data->data + offset);
182ee45da083db Luiz Augusto von Dentz 2021-10-27  551  		/* the length also includes data_type and offset */
182ee45da083db Luiz Augusto von Dentz 2021-10-27  552  		pattern->length = entry->length + 2;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  553  		pattern->data_type = entry->ad_type;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  554  		pattern->start_byte = entry->offset;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  555  		memcpy(pattern->pattern, entry->value, entry->length);
182ee45da083db Luiz Augusto von Dentz 2021-10-27  556  		offset += sizeof(*pattern) + entry->length;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  557  	}
182ee45da083db Luiz Augusto von Dentz 2021-10-27  558  
182ee45da083db Luiz Augusto von Dentz 2021-10-27  559  	skb = __hci_cmd_sync(hdev, hdev->msft_opcode, total_size, cp,
182ee45da083db Luiz Augusto von Dentz 2021-10-27  560  			     HCI_CMD_TIMEOUT);
182ee45da083db Luiz Augusto von Dentz 2021-10-27  561  
ce78e557ff8819 Soenke Huster          2022-07-22  562  	if (IS_ERR_OR_NULL(skb)) {
9e14606d8f38ea Hilda Wu               2023-06-21 @563  		err = PTR_ERR(skb);
9e14606d8f38ea Hilda Wu               2023-06-21  564  		goto out_free;

This returns success if __hci_cmd_sync() returns NULL.

I don't think __hci_cmd_sync() can return NULL.  It is a design fail if
it can.  And it needs to be commented what the NULL means.  And yet this
file consistently assumes that __hci_cmd_sync() can be NULL.


ce78e557ff8819 Soenke Huster          2022-07-22  565  	}
182ee45da083db Luiz Augusto von Dentz 2021-10-27  566  
9e14606d8f38ea Hilda Wu               2023-06-21  567  	err = msft_le_monitor_advertisement_cb(hdev, hdev->msft_opcode,
b747a83690c8f5 Manish Mandlik         2022-07-20  568  					       monitor, skb);
9e14606d8f38ea Hilda Wu               2023-06-21  569  	if (err)
9e14606d8f38ea Hilda Wu               2023-06-21  570  		goto out_free;
9e14606d8f38ea Hilda Wu               2023-06-21  571  
9e14606d8f38ea Hilda Wu               2023-06-21  572  	handle_data = msft_find_handle_data(hdev, monitor->handle, true);
9e14606d8f38ea Hilda Wu               2023-06-21  573  	if (!handle_data) {
9e14606d8f38ea Hilda Wu               2023-06-21  574  		err = -ENODATA;
9e14606d8f38ea Hilda Wu               2023-06-21  575  		goto out_free;
9e14606d8f38ea Hilda Wu               2023-06-21  576  	}
9e14606d8f38ea Hilda Wu               2023-06-21  577  
9e14606d8f38ea Hilda Wu               2023-06-21  578  	handle_data->rssi_high	= cp->rssi_high;
9e14606d8f38ea Hilda Wu               2023-06-21  579  	handle_data->rssi_low	= cp->rssi_low;
9e14606d8f38ea Hilda Wu               2023-06-21  580  	handle_data->rssi_low_interval	  = cp->rssi_low_interval;
9e14606d8f38ea Hilda Wu               2023-06-21  581  	handle_data->rssi_sampling_period = cp->rssi_sampling_period;
9e14606d8f38ea Hilda Wu               2023-06-21  582  
9e14606d8f38ea Hilda Wu               2023-06-21  583  out_free:
9e14606d8f38ea Hilda Wu               2023-06-21  584  	kfree(cp);
9e14606d8f38ea Hilda Wu               2023-06-21  585  	return err;
b747a83690c8f5 Manish Mandlik         2022-07-20  586  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

