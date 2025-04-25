Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB532472A0
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Apr 2025 13:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745586731; cv=none; b=f9dTCWtpOe+JFoj3ctzTGMC2o43WA3Wk7SDnwrwkFYYpQoUgBQXuGgfVunfvdRdLsQlgJDj3KaxloFwfjeXfRSrskMLRCDNJkBed58uNNqhahj0PN4zhZL4SHeuECGFLPSik4gzwiFLkztQKnhpaw1G7PqV0JoEmmLTJrxJlvjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745586731; c=relaxed/simple;
	bh=GWNSpW8Q2zHYggDEL314pnHlb5AIr7sdd6QxUoSi+5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JGC9VWEAHZybwxy2yLXETeyU/5bY2OxxX+9i/CQurPYs/m+jfvs6KzeCFW91b261ofDn0BLcx8SJkumBCxIOfF/j9c9YblYZAWuVxYVdoHG56KhWVBAGfDsKPrxxk7svFkmRKeB75GmBsWL1EQFBvMr0XCXHmAxvbWVT6de78ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yd1y4dKA; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yd1y4dKA"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf680d351so19920835e9.0
        for <oe-kbuild@lists.linux.dev>; Fri, 25 Apr 2025 06:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745586727; x=1746191527; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r2mJzYQDvuI9M7uIZt86YPzc2zUlO98o0UWqYzD5/Yo=;
        b=Yd1y4dKA5vwr3kvSM9uf6pgvk4Ff0KBdL8G4z4ybaT8euZa3Ad3Bkl1cuPadnCcOHy
         w4yeLILMlh7+AyBb8lVgv1XsUGxcbzToJDQNZLbU6LiecTuip+bDkHB7iLWIPBgT+2Qo
         jgI1ytGFN7S04uImW5CYMEoaSkgL4cIqFMp3lastoPU3WYBz9fKDdL0vTf8ynUxFBJaW
         yWdEGeCUllqvtGT1uLt03oMDag1VKtHAKTQYADnHC5icdFBDneKypRRobYfehA9Qc4JE
         TmWHe586vXvh0kWOmQgmWbqc6eoN4kLjsaSHiXCyG0rcFGfB9nCoNbkvva+BimKNlUeF
         koYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745586727; x=1746191527;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r2mJzYQDvuI9M7uIZt86YPzc2zUlO98o0UWqYzD5/Yo=;
        b=szY6TXQdGeT0d+gpvjqR2nO+zS+Ffi0+atoL+rNOj/Lm0g7xdLJACQWggSLvR4N0Y7
         NTkkAXFshoNNaWIUR7SOt9D5zDBkFs5f5QKVhVLq8lJ0fwH+foVN79xUatauNYOfoLun
         OmSOc1gcp2SRzno7corhQicLJdioyu/pKkZ5nEV5yk2NrMr3x+EU/hBM22sU0ZTIiGYg
         mi/ZHibQfQVlWlo12W3XBFwmr3Uuxfl3R5fZ/Hs097Zp+V+M7zO5ltM/h697EChDoaCB
         9zq9T2pCtHOr0PzhWj1V6/mM/LpHCHuTpxE2o5EJOa0YL2E+kyZchNfyPfEwHdm4UbON
         ohEQ==
X-Gm-Message-State: AOJu0Ywcoig56eEVIrI79JTG0G+UF0Mm1Cj06/6O0EiZnz2znTICaEUc
	l23ITJ6+RL0Dke8YeLdAz45twJeTDQH7mPrPRkU/1jQE3C0ioiMsZGcyE71ozzjknY3j/fvPCCu
	I
X-Gm-Gg: ASbGncusVgCqh6oYBmDlC0iT4UsUjXmLJx4ZoO/Y+Y2Qk6JRNSigcmCWU3Gr7v/cNKe
	iiabQVCcVk/ijqorWlW8lq+xd13ZTHfKw+QuMdEQvwnH4uMngHE2jPC5IDnvhYK1FyylzckgG5/
	h6yPeVx0W9p7X4Kh8NSm5KHHv9w4DprOu2lfPyGn08bP8Yz/y+Ja4kwuPbFFsFgvs027wcqcTfH
	EKzrFtrhv35iSLC4rmn6m6W4WfE8QjyrlrrEIXTrm5qMpSgvgilnXX9HFqCgEjGN+wykIJwIMu3
	UkleP43ycJjJB8pOGFqL9sJDbhofpgO4ow+k5hXuCq6K8KKYtLuaklZR
X-Google-Smtp-Source: AGHT+IHQmpmStrmy566OJribqD8RtwP6KL/xHNY9xGU4rAa44Vf23D8eyGlStk+WGDGCfO0FlEnwUA==
X-Received: by 2002:a7b:ce14:0:b0:43b:baf7:76e4 with SMTP id 5b1f17b1804b1-4409c453b1fmr53981615e9.1.1745586727231;
        Fri, 25 Apr 2025 06:12:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4409d2ac5a9sm57367865e9.23.2025.04.25.06.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:12:06 -0700 (PDT)
Date: Fri, 25 Apr 2025 16:12:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Kurt Borja <kuurtb@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>
Subject: [pdx86-platform-drivers-x86:review-ilpo-next 9/38]
 drivers/platform/x86/dell/alienware-wmi-wmax.c:931 awcc_hwmon_fans_init()
 error: uninitialized symbol 'temp_id'.
Message-ID: <202504250521.HEkFK1Jy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250425131203.0hsrsDYEOq7LhyooBzqQQ0senYWRwXEYpDGoGr-fWro@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
head:   4d1e8c8f11c611db5828e4bae7292bc295eea8ef
commit: d699907834959c87a6b6c5214d5e9a3e8ba6b5a1 [9/38] platform/x86: alienware-wmi-wmax: Add HWMON support
config: x86_64-randconfig-161-20250424 (https://download.01.org/0day-ci/archive/20250425/202504250521.HEkFK1Jy-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202504250521.HEkFK1Jy-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/dell/alienware-wmi-wmax.c:931 awcc_hwmon_fans_init() error: uninitialized symbol 'temp_id'.

vim +/temp_id +931 drivers/platform/x86/dell/alienware-wmi-wmax.c

d699907834959c Kurt Borja 2025-03-29  882  static int awcc_hwmon_fans_init(struct wmi_device *wdev)
d699907834959c Kurt Borja 2025-03-29  883  {
d699907834959c Kurt Borja 2025-03-29  884  	struct awcc_priv *priv = dev_get_drvdata(&wdev->dev);
d699907834959c Kurt Borja 2025-03-29  885  	unsigned long fan_temps[AWCC_ID_BITMAP_LONGS];
d699907834959c Kurt Borja 2025-03-29  886  	unsigned long gather[AWCC_ID_BITMAP_LONGS];
d699907834959c Kurt Borja 2025-03-29  887  	u32 min_rpm, max_rpm, temp_count, temp_id;
d699907834959c Kurt Borja 2025-03-29  888  	struct awcc_fan_data *fan_data;
d699907834959c Kurt Borja 2025-03-29  889  	unsigned int i, j;
d699907834959c Kurt Borja 2025-03-29  890  	char *label;
d699907834959c Kurt Borja 2025-03-29  891  	int ret;
d699907834959c Kurt Borja 2025-03-29  892  	u8 id;
d699907834959c Kurt Borja 2025-03-29  893  
d699907834959c Kurt Borja 2025-03-29  894  	for (i = 0; i < priv->fan_count; i++) {
d699907834959c Kurt Borja 2025-03-29  895  		fan_data = devm_kzalloc(&wdev->dev, sizeof(*fan_data), GFP_KERNEL);
d699907834959c Kurt Borja 2025-03-29  896  		if (!fan_data)
d699907834959c Kurt Borja 2025-03-29  897  			return -ENOMEM;
d699907834959c Kurt Borja 2025-03-29  898  
d699907834959c Kurt Borja 2025-03-29  899  		/*
d699907834959c Kurt Borja 2025-03-29  900  		 * Fan IDs are listed first at offset 0
d699907834959c Kurt Borja 2025-03-29  901  		 */
d699907834959c Kurt Borja 2025-03-29  902  		ret = awcc_op_get_resource_id(wdev, i, &id);
d699907834959c Kurt Borja 2025-03-29  903  		if (ret)
d699907834959c Kurt Borja 2025-03-29  904  			return ret;
d699907834959c Kurt Borja 2025-03-29  905  
d699907834959c Kurt Borja 2025-03-29  906  		ret = awcc_thermal_information(wdev, AWCC_OP_GET_FAN_MIN_RPM, id,
d699907834959c Kurt Borja 2025-03-29  907  					       &min_rpm);
d699907834959c Kurt Borja 2025-03-29  908  		if (ret)
d699907834959c Kurt Borja 2025-03-29  909  			return ret;
d699907834959c Kurt Borja 2025-03-29  910  
d699907834959c Kurt Borja 2025-03-29  911  		ret = awcc_thermal_information(wdev, AWCC_OP_GET_FAN_MAX_RPM, id,
d699907834959c Kurt Borja 2025-03-29  912  					       &max_rpm);
d699907834959c Kurt Borja 2025-03-29  913  		if (ret)
d699907834959c Kurt Borja 2025-03-29  914  			return ret;
d699907834959c Kurt Borja 2025-03-29  915  
d699907834959c Kurt Borja 2025-03-29  916  		ret = awcc_get_fan_sensors(wdev, AWCC_OP_GET_TOTAL_FAN_TEMPS, id,
d699907834959c Kurt Borja 2025-03-29  917  					   0, &temp_count);
d699907834959c Kurt Borja 2025-03-29  918  		if (ret)
d699907834959c Kurt Borja 2025-03-29  919  			return ret;
d699907834959c Kurt Borja 2025-03-29  920  
d699907834959c Kurt Borja 2025-03-29  921  		for (j = 0; j < temp_count; j++) {
d699907834959c Kurt Borja 2025-03-29  922  			ret = awcc_get_fan_sensors(wdev, AWCC_OP_GET_FAN_TEMP_ID,
d699907834959c Kurt Borja 2025-03-29  923  						   id, j, &temp_id);
d699907834959c Kurt Borja 2025-03-29  924  			if (ret)
d699907834959c Kurt Borja 2025-03-29  925  				break;

return ret?

d699907834959c Kurt Borja 2025-03-29  926  
d699907834959c Kurt Borja 2025-03-29  927  			temp_id = FIELD_GET(AWCC_RESOURCE_ID_MASK, temp_id);
d699907834959c Kurt Borja 2025-03-29  928  			__set_bit(temp_id, fan_temps);
d699907834959c Kurt Borja 2025-03-29  929  		}
d699907834959c Kurt Borja 2025-03-29  930  
d699907834959c Kurt Borja 2025-03-29 @931  		label = awcc_get_fan_label(&wdev->dev, temp_count, temp_id);
                                                                                                           ^^^^^^^
uninitialized.

d699907834959c Kurt Borja 2025-03-29  932  		if (!label)
d699907834959c Kurt Borja 2025-03-29  933  			return -ENOMEM;
d699907834959c Kurt Borja 2025-03-29  934  
d699907834959c Kurt Borja 2025-03-29  935  		fan_data->id = id;
d699907834959c Kurt Borja 2025-03-29  936  		fan_data->min_rpm = min_rpm;
d699907834959c Kurt Borja 2025-03-29  937  		fan_data->max_rpm = max_rpm;
d699907834959c Kurt Borja 2025-03-29  938  		fan_data->label = label;
d699907834959c Kurt Borja 2025-03-29  939  		bitmap_gather(gather, fan_temps, priv->temp_sensors, AWCC_ID_BITMAP_SIZE);
d699907834959c Kurt Borja 2025-03-29  940  		bitmap_copy(&fan_data->auto_channels_temp, gather, BITS_PER_LONG);
d699907834959c Kurt Borja 2025-03-29  941  		priv->fan_data[i] = fan_data;
d699907834959c Kurt Borja 2025-03-29  942  
d699907834959c Kurt Borja 2025-03-29  943  		bitmap_zero(fan_temps, AWCC_ID_BITMAP_SIZE);
d699907834959c Kurt Borja 2025-03-29  944  	}
d699907834959c Kurt Borja 2025-03-29  945  
d699907834959c Kurt Borja 2025-03-29  946  	return 0;
d699907834959c Kurt Borja 2025-03-29  947  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

