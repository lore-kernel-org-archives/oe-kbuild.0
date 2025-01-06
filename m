Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EA61D90C5
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jan 2025 09:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736155673; cv=none; b=B1cw3KPzMlHAxQpdxlyhmpsZguxgDrE8c1Gpvq3Exc+0aj6JY0pOzoT7Hdp+Ds+6V0Vk/ycPkhcjWD9Xh+xQP+KQnyd7YX9lqxNeJ9lSrRdf9vHy1ja/DoXIVQWOYoMJ97yCcrFKet0aEd2T3PKyilY9sPlqKydVBIHef0n4K0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736155673; c=relaxed/simple;
	bh=C2Oa+YEhXHBj1sDP307/ttqPJZSGcU79Tpnen9/Ybjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ghye1RY4OOHhrLa+fjme2/+sgn/rAwIlCK4oSYEhLPhFpEa62/7TRMGpkYZHELHEPMKvClHKxFW1ohfPgLDoLArMRGVmM7DCiCOLroEdLRUCDKO6XO4M5QXnXymbhSIHsI4a+wvXQmK78DudxId+K0S8KfpZ/oBm9uKd/v+2fOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gXjXcd55; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gXjXcd55"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3863c36a731so10899881f8f.1
        for <oe-kbuild@lists.linux.dev>; Mon, 06 Jan 2025 01:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736155670; x=1736760470; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cpnOz1N1TAeC9+MC41xtWqOkcPvFTaXHe21eO6iPF/o=;
        b=gXjXcd55Yz231s3gMn7S0MxUyyqKAK91HEK/yUbJbtP60cDffn0NvHGU33x1HGOG5o
         /8WeYQ5EeLtb5yWhHqsYOoK5PfPtdZbMMRBIrIue8Pw9OKV8G1cdz1ZEB95br8NszT8u
         z8SStZquSW/Uhk8DU4lg+u8BjJjZHQT+0jUQnLVACHKlpJJ2TYb4p0NAKTmWhojkuTyY
         EfnZAUlbD7dX8rDV1/V+MX09SWgZDHiHw9yTJCKC8iuk3OaQ5TIbBBdYDa9A5jZr04x/
         G+DY8OIwaODrVJN8sVP52nO9InHlhmRIujriSftLA2VezpTwk5lilnbr1STrlGxCQ3Iy
         ZWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736155670; x=1736760470;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cpnOz1N1TAeC9+MC41xtWqOkcPvFTaXHe21eO6iPF/o=;
        b=Sy9fM7G7pFVrd3ld/v8tu6sT42CL05SKXBB8Cs97T4MzNLQqLuvDAGPFpXn4ySv6TJ
         Slg9mSXBFEJydb8eKzNWErCUAZqfn9NVGczwW4wS+zSajqkLeFlWJjmcYAWiqc7eGymZ
         Zevw/KkFp2G6fZBKaaLMV151ts+iLELEClVGnZZTtJL6rgS1JwGDJxkTo03GUXmIba04
         G9HuQXPXeha6Q1bWbBskcmv6Ho1ocloSdPY2sYjwsykpvjR+ta2SpMBMotKQqPF7u8P8
         aM7qM6Z0UHcT2iY0NzooNGBoUWsGzeBKVXKEJYBXpK9B933JS2xDSm5G4Cy4gBlQI5jI
         NUXg==
X-Gm-Message-State: AOJu0YzSJ0TtFbrtjScW6A828fxgIIsIuNsu/JoM47Sxqmb6ltTRduPk
	RH4lu2MJN0vAzI0uZHp5nVwZQ7EoA8H5x/U3zu8AD5tR/1ph/ARFogDa2pQh7CVigS7bAfYrYB3
	X
X-Gm-Gg: ASbGnctH/cJb5g4OasRpiaqBzvesbMS3D8ra3QwhKMyIajK5TuxKkgI8g6xwJd1a2jV
	Wzv0UTdhy176cTVJEgHrN9KG/FW+2zi/tzU3jXTE1Ho+ake0A/yCETMANqkgfMOwdWvzo/kZnyn
	Tzq3xPA13pYvg2IfLLJYM/4ZCJPqv4RE4LezqvWFLNjjfhkLEqDeftXEwLV88MayKTRozyXOByR
	EGDDQF86YBRaE0JFIYePiW+0O8R4KM35tx/xviZ81gOmPO6+lXIRc46nIwjtg==
X-Google-Smtp-Source: AGHT+IFh4zH5nntZ9t3H+tkXvCfJIEjyQxwmuicbh5Gpwe+lKHMvvNSXc2aiJ0Wzi1GhHtgBBbpwfw==
X-Received: by 2002:a5d:588b:0:b0:385:de8d:c0f5 with SMTP id ffacd0b85a97d-38a221eabecmr55090621f8f.16.1736155669594;
        Mon, 06 Jan 2025 01:27:49 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828d39sm48942690f8f.9.2025.01.06.01.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 01:27:49 -0800 (PST)
Date: Mon, 6 Jan 2025 12:27:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@intel.com>
Subject: [thesofproject:topic/sof-dev-rebase 62/66]
 sound/soc/sof/debug-dsp-ops.c:174 sof_dsp_ops_tester_dfs_read() error:
 uninitialized symbol 'string'.
Message-ID: <7f385b60-62f3-42c0-8262-3807f33ceafb@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thesofproject/linux topic/sof-dev-rebase
head:   f8cb4262a32283bd5f380f28e178002d9ab552c5
commit: 4ee3702773b8965d591600ebba308288dfd498a3 [62/66] ASoC: SOF: debug-dsp-ops: Add a debugfs entry to read current FW status
config: x86_64-randconfig-161-20241221 (https://download.01.org/0day-ci/archive/20241222/202412220432.yREZa6ba-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412220432.yREZa6ba-lkp@intel.com/

smatch warnings:
sound/soc/sof/debug-dsp-ops.c:174 sof_dsp_ops_tester_dfs_read() error: uninitialized symbol 'string'.

vim +/string +174 sound/soc/sof/debug-dsp-ops.c

554de1577ecc78 Ranjani Sridharan 2024-03-21  142  static ssize_t sof_dsp_ops_tester_dfs_read(struct file *file, char __user *buffer,
554de1577ecc78 Ranjani Sridharan 2024-03-21  143  					   size_t count, loff_t *ppos)
554de1577ecc78 Ranjani Sridharan 2024-03-21  144  {
554de1577ecc78 Ranjani Sridharan 2024-03-21  145  	struct snd_sof_dfsentry *dfse = file->private_data;
554de1577ecc78 Ranjani Sridharan 2024-03-21  146  	struct snd_sof_dev *sdev = dfse->sdev;
554de1577ecc78 Ranjani Sridharan 2024-03-21  147  	struct dentry *dentry;
4ee3702773b896 Ranjani Sridharan 2024-03-25  148  	const char *string;
554de1577ecc78 Ranjani Sridharan 2024-03-21  149  	size_t size_ret;
554de1577ecc78 Ranjani Sridharan 2024-03-21  150  
554de1577ecc78 Ranjani Sridharan 2024-03-21  151  	/* return the FW filename or path */
554de1577ecc78 Ranjani Sridharan 2024-03-21  152  	dentry = file->f_path.dentry;
a9c6044bf2d2d3 Ranjani Sridharan 2024-03-25  153  	if (!strcmp(dentry->d_name.name, "fw_filename")) {
554de1577ecc78 Ranjani Sridharan 2024-03-21  154  		string = sdev->test_profile.fw_name;
a9c6044bf2d2d3 Ranjani Sridharan 2024-03-25  155  	} else if (!strcmp(dentry->d_name.name, "fw_path")) {
554de1577ecc78 Ranjani Sridharan 2024-03-21  156  		string = sdev->test_profile.fw_path;
a9c6044bf2d2d3 Ranjani Sridharan 2024-03-25  157  	} else if (!strcmp(dentry->d_name.name, "dsp_power_state")) {
a9c6044bf2d2d3 Ranjani Sridharan 2024-03-25  158  		switch (sdev->dsp_power_state.state) {
a9c6044bf2d2d3 Ranjani Sridharan 2024-03-25  159  		case SOF_DSP_PM_D0:
4ee3702773b896 Ranjani Sridharan 2024-03-25  160  			string = "D0\n";
a9c6044bf2d2d3 Ranjani Sridharan 2024-03-25  161  			break;
a9c6044bf2d2d3 Ranjani Sridharan 2024-03-25  162  		case SOF_DSP_PM_D3:
4ee3702773b896 Ranjani Sridharan 2024-03-25  163  			string = "D3\n";
a9c6044bf2d2d3 Ranjani Sridharan 2024-03-25  164  			break;
a9c6044bf2d2d3 Ranjani Sridharan 2024-03-25  165  		default:
a9c6044bf2d2d3 Ranjani Sridharan 2024-03-25  166  			break;

The zero day bot doesn't do cross function analysis.  (Cross function
analysis is too slow to scale).  So it warns about this break, which is
potentially never reached if we have enough information.

a9c6044bf2d2d3 Ranjani Sridharan 2024-03-25  167  		}
4ee3702773b896 Ranjani Sridharan 2024-03-25  168  	} else if (!strcmp(dentry->d_name.name, "fw_state")) {
4ee3702773b896 Ranjani Sridharan 2024-03-25  169  		return sof_dsp_ops_fw_state_read(sdev, buffer, count, ppos);
a9c6044bf2d2d3 Ranjani Sridharan 2024-03-25  170  	} else {
554de1577ecc78 Ranjani Sridharan 2024-03-21  171  		return 0;
a9c6044bf2d2d3 Ranjani Sridharan 2024-03-25  172  	}
554de1577ecc78 Ranjani Sridharan 2024-03-21  173  
554de1577ecc78 Ranjani Sridharan 2024-03-21 @174  	if (*ppos || !string)
554de1577ecc78 Ranjani Sridharan 2024-03-21  175  		return 0;
554de1577ecc78 Ranjani Sridharan 2024-03-21  176  
554de1577ecc78 Ranjani Sridharan 2024-03-21  177  	count = min_t(size_t, count, strlen(string));
554de1577ecc78 Ranjani Sridharan 2024-03-21  178  	size_ret = copy_to_user(buffer, string, count);
554de1577ecc78 Ranjani Sridharan 2024-03-21  179  	if (size_ret)
554de1577ecc78 Ranjani Sridharan 2024-03-21  180  		return -EFAULT;
554de1577ecc78 Ranjani Sridharan 2024-03-21  181  
554de1577ecc78 Ranjani Sridharan 2024-03-21  182  	*ppos += count;
554de1577ecc78 Ranjani Sridharan 2024-03-21  183  
554de1577ecc78 Ranjani Sridharan 2024-03-21  184  	return count;
554de1577ecc78 Ranjani Sridharan 2024-03-21  185  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

