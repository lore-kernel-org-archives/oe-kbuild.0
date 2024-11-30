Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CCE433BC
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 15:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732981979; cv=none; b=KtN0ohJDFY3WNGq6FhnlJ35du+REMHaOf0nXBl0cpoE17M7Xk0ehgPUX/JZeQmgFwb1gw0YJRJ/MmD/j6akaqbn49LKwf5rUoKh0PdEfOCus2INTPAUXyxjCOBa4Jghr/fGRXdI3FKR1NQQd2l6eroKfH0Hv5JuTXj8z+ni/N1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732981979; c=relaxed/simple;
	bh=I49dnAtKBkyWUVfHE4NJM9pZnpMFI+AtbmHuC3Azwv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fb/z2rRxyydIuwosa23idkTj9cTClqaqCMsVbOJAhgCtZef4t5jqLzIcBI9NXwSmG1u14wrq3hjF5zoKZLm5307ZUlvW8Pr69PVXnYwNdNcIb0CN+QFdS0gfS5FQOgzQgam/LN5HDe3Ql/8E38O5ab5+6nhorRqKS8am4ZMjoHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MTEnMKpo; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MTEnMKpo"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa5500f7a75so437790266b.0
        for <oe-kbuild@lists.linux.dev>; Sat, 30 Nov 2024 07:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732981975; x=1733586775; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y81XCOype9REO2oETu3qZYpgEdRmUvV0yjKKrqT3ACc=;
        b=MTEnMKpoSj58SnNGhbJv+ryaxegTpgCPJGg267ELVWlpzVsgHYM86Pz+BxJwFqqcRw
         96PeMUvJNgyXKqraDhyT2vLg8Gs+Rp8QKuAfdSEw2D4DO2zGvsUNsxaEDDRIICX+09G5
         E0oTq12gx0Z7R8DyMW4tyDZngpP5nEm6sduP6slGifdQSGoxQy/YKE4u6EzSLHnen0zn
         1DOVAifWA04epgRUsfQpljyiIKESyfFMFSj/dJ1s+IA+aRIISYhtg92LKxYabUVf/8Vw
         mmK7/0Pyd+fFrJ9v4wRw+N7loz3JiAMihpTH9CbJjnpHf5SI6O/wo3RQsgE1XwLTZlFW
         IISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732981975; x=1733586775;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y81XCOype9REO2oETu3qZYpgEdRmUvV0yjKKrqT3ACc=;
        b=MrGAL5cS80hc7Xzbsixf5z2TplRMIogtvuw+la2fect7BfWngilYLuHa8d+GpbIclK
         4twKlPgx5gPYLBus0QIQGjdRCYJ2NZPmLuqz9P03KJ3YILSgKIYKCLnzHdwM/TvC05XF
         CK2+yxvtUEcnpaGAvvzAqDVo/wKmYQ1RvjxYA885iUoEXItYTtRmmB0cEJRqkGxu5ehe
         f7FzA1wAFTq7NL2sbJETYeBZPB7q/BPusugZ6qzQrHRHl9KpCOPbZytfR6ELsaGW1Rbg
         3kPe828geRVWLQDR2BRMOiropzaQtG7sXWZpselpE9jC1E54gnX/zs0UOL+OtjbR5vT1
         kZhg==
X-Gm-Message-State: AOJu0YwktcvZ67WYVQSVspVAaw+sv3PtM549ehxDvxaO1+zVAAVOZxAp
	HKDKd8MjtwijKznZZgRtdJo0vCzs3r1lcUFxoeUjA+AhH2PHd8K2YDyml45OODdbkp2qhAkz3Ip
	r
X-Gm-Gg: ASbGnctN3Gh4JsBwfLDSEg+IqAjNo2PgpJwBPZ4ih2v4V3cjdGZfNW7L7Y4iQcB06hH
	Ze0iuPqexMwMoqQXvaBpTOuLVg37/PI6CL2JGF3ovSDOjgVNpE5EYotjZGsWUeVLQzk0FSBuE3g
	sIIyIFyD24oCjRdDcmOAsObXY1Kn0OZmQRf6G5iUPPjV7f7fA/KUQA1EYuhxFB2Zs3xUXvNixhB
	wK48tKzcGCr+2hIjrGuVWjMexRF1DQA4K7LC2InLHynxl3PdjrKg3LWfJH7e7eVZUaqiKfe
X-Google-Smtp-Source: AGHT+IHpPVO/Cbm9ckrbmermEfSlzy4cXf5lsqqqCGkiVXda+dGtuMzjOZsPJqQgmzIJDcfLsihpuQ==
X-Received: by 2002:a17:907:77cc:b0:aa5:4cc1:1967 with SMTP id a640c23a62f3a-aa580eede36mr1209839566b.9.1732981975324;
        Sat, 30 Nov 2024 07:52:55 -0800 (PST)
Received: from localhost (h1109.n1.ips.mtn.co.ug. [41.210.145.9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a848sm291723966b.150.2024.11.30.07.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 07:52:54 -0800 (PST)
Date: Sat, 30 Nov 2024 18:52:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [plbossart-sound:sdw/fix-bool-properties 16/19]
 sound/soc/sof/debug-dsp-ops.c:174 sof_dsp_ops_tester_dfs_read() error:
 uninitialized symbol 'string'.
Message-ID: <83752380-7b5b-43ca-9f21-f9136d2e3f33@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/fix-bool-properties
head:   cc66cbd8eb2728b3b654f29c0a44009826c7a108
commit: 98ab12fb50b6f367cd21ac2c59898574a0a6297c [16/19] ASoC: SOF: debug-dsp-ops: Add a debugfs entry to read current FW status
config: nios2-randconfig-r073-20241126 (https://download.01.org/0day-ci/archive/20241127/202411270232.zEnUph1v-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411270232.zEnUph1v-lkp@intel.com/

smatch warnings:
sound/soc/sof/debug-dsp-ops.c:174 sof_dsp_ops_tester_dfs_read() error: uninitialized symbol 'string'.

vim +/string +174 sound/soc/sof/debug-dsp-ops.c

0858d83e4c4122 Ranjani Sridharan 2024-03-21  142  static ssize_t sof_dsp_ops_tester_dfs_read(struct file *file, char __user *buffer,
0858d83e4c4122 Ranjani Sridharan 2024-03-21  143  					   size_t count, loff_t *ppos)
0858d83e4c4122 Ranjani Sridharan 2024-03-21  144  {
0858d83e4c4122 Ranjani Sridharan 2024-03-21  145  	struct snd_sof_dfsentry *dfse = file->private_data;
0858d83e4c4122 Ranjani Sridharan 2024-03-21  146  	struct snd_sof_dev *sdev = dfse->sdev;
0858d83e4c4122 Ranjani Sridharan 2024-03-21  147  	struct dentry *dentry;
98ab12fb50b6f3 Ranjani Sridharan 2024-03-25  148  	const char *string;
0858d83e4c4122 Ranjani Sridharan 2024-03-21  149  	size_t size_ret;
0858d83e4c4122 Ranjani Sridharan 2024-03-21  150  
0858d83e4c4122 Ranjani Sridharan 2024-03-21  151  	/* return the FW filename or path */
0858d83e4c4122 Ranjani Sridharan 2024-03-21  152  	dentry = file->f_path.dentry;
b5d1176eefb868 Ranjani Sridharan 2024-03-25  153  	if (!strcmp(dentry->d_name.name, "fw_filename")) {
0858d83e4c4122 Ranjani Sridharan 2024-03-21  154  		string = sdev->test_profile.fw_name;
b5d1176eefb868 Ranjani Sridharan 2024-03-25  155  	} else if (!strcmp(dentry->d_name.name, "fw_path")) {
0858d83e4c4122 Ranjani Sridharan 2024-03-21  156  		string = sdev->test_profile.fw_path;
b5d1176eefb868 Ranjani Sridharan 2024-03-25  157  	} else if (!strcmp(dentry->d_name.name, "dsp_power_state")) {
b5d1176eefb868 Ranjani Sridharan 2024-03-25  158  		switch (sdev->dsp_power_state.state) {
b5d1176eefb868 Ranjani Sridharan 2024-03-25  159  		case SOF_DSP_PM_D0:
98ab12fb50b6f3 Ranjani Sridharan 2024-03-25  160  			string = "D0\n";
b5d1176eefb868 Ranjani Sridharan 2024-03-25  161  			break;
b5d1176eefb868 Ranjani Sridharan 2024-03-25  162  		case SOF_DSP_PM_D3:
98ab12fb50b6f3 Ranjani Sridharan 2024-03-25  163  			string = "D3\n";
b5d1176eefb868 Ranjani Sridharan 2024-03-25  164  			break;
b5d1176eefb868 Ranjani Sridharan 2024-03-25  165  		default:
b5d1176eefb868 Ranjani Sridharan 2024-03-25  166  			break;

string not initialized here

b5d1176eefb868 Ranjani Sridharan 2024-03-25  167  		}
98ab12fb50b6f3 Ranjani Sridharan 2024-03-25  168  	} else if (!strcmp(dentry->d_name.name, "fw_state")) {
98ab12fb50b6f3 Ranjani Sridharan 2024-03-25  169  		return sof_dsp_ops_fw_state_read(sdev, buffer, count, ppos);
b5d1176eefb868 Ranjani Sridharan 2024-03-25  170  	} else {
0858d83e4c4122 Ranjani Sridharan 2024-03-21  171  		return 0;
b5d1176eefb868 Ranjani Sridharan 2024-03-25  172  	}
0858d83e4c4122 Ranjani Sridharan 2024-03-21  173  
0858d83e4c4122 Ranjani Sridharan 2024-03-21 @174  	if (*ppos || !string)
0858d83e4c4122 Ranjani Sridharan 2024-03-21  175  		return 0;
0858d83e4c4122 Ranjani Sridharan 2024-03-21  176  
0858d83e4c4122 Ranjani Sridharan 2024-03-21  177  	count = min_t(size_t, count, strlen(string));
0858d83e4c4122 Ranjani Sridharan 2024-03-21  178  	size_ret = copy_to_user(buffer, string, count);
0858d83e4c4122 Ranjani Sridharan 2024-03-21  179  	if (size_ret)
0858d83e4c4122 Ranjani Sridharan 2024-03-21  180  		return -EFAULT;
0858d83e4c4122 Ranjani Sridharan 2024-03-21  181  
0858d83e4c4122 Ranjani Sridharan 2024-03-21  182  	*ppos += count;
0858d83e4c4122 Ranjani Sridharan 2024-03-21  183  
0858d83e4c4122 Ranjani Sridharan 2024-03-21  184  	return count;
0858d83e4c4122 Ranjani Sridharan 2024-03-21  185  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

