Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260D31E7A30
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Aug 2024 13:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723036176; cv=none; b=fNQM5iC/yWHzALlqKcRFCU562KIU6rRfUIOJXMh82nkmjwVx0wa4nrQNm1bH0yzvCb1+oP60d0rfOpxL4fzC4ACC4iCAfefx2YN+tnTlCUZ+g+WzhQ7WwULNm9RwkEF+MYPaOXvMYU962ILwkW+s4/NLWtcFf6FqqbOn+K485qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723036176; c=relaxed/simple;
	bh=h5D+TxxzyQOd6cFLpqhzBGmIlcHnvQChvX3mlW8gCyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p31UxhHo2dEYq2hkrthg1tlpOFSl45APWY7kBkPcDf/YwuIZjJDIzoo3GAQSl7y+587YRM96pBovqwV7h0MBY8HFm+FscK1bHzz723PRbI4zKkIN+euFUrBLAmyf93FD4lH2qAGFG8U+ohFi5UhSu2YOYqXU8hwCPtzcomGHNT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=husTUjh2; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="husTUjh2"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4281ca54fd3so12190565e9.2
        for <oe-kbuild@lists.linux.dev>; Wed, 07 Aug 2024 06:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723036172; x=1723640972; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FSD5ZSfiVX3CykW683z0+/F5lPHuAwYoRAjZAf9aOlE=;
        b=husTUjh21ioHgssJf2DwjoB1Lr0r801e9NfXvB408HIDE4W9poteFWDVQC5kUdFiKn
         y3IbxYmscJDmyMeso8VzUNmEs0FNEPwiet8lTA6tVurfu2Gqj/Rm8weUD93OBOL1hmd6
         fWRm/HaAKSFykdhfk8194lAjwWc/LWie+YsKXy+iFkdaEHd+Bj82nNhXZvbUEbQd4Dkf
         tFmA5tKvr3Ux0/2PmxdHMjL9g8jWrnyaXVVBKm1lhEwUfKwJl1hkYA2/3H7kTX7C/0cP
         8suv0pdqvJjR+birbM2UwbvXqg5NvHnKjsEaZHgVyp8+gbp6CxbTtDfwzEIMPc8uUegK
         qNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723036172; x=1723640972;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FSD5ZSfiVX3CykW683z0+/F5lPHuAwYoRAjZAf9aOlE=;
        b=s1adQOe40xQ41uRsdXyugPQPEpj1yB5kWCVQ5wIW2gG3ezIMNQkI4giDC9IXtS34H/
         f5ZpIjRhDu91w3GGHth3ynuti3xv6A2MJa0MC8ys35q0rVZ7M1y5uoPpNqosR0DmW4Zz
         H+CJwr3sYpsJkbd1MOBF+2JXraV+GgetvEBHWyJzOgr7XSq+TwBOYYqqhasFhC+zYWhB
         tGB7XzXM3K/meCwTgHPJKr2Um0wGvvko/ZuXGe+AB4g/O2N6juenL1t4aXbGLWHq6LWN
         aI9u4K9BQpmbn2Ty5cRIRWF0WUdu9GCI+wk2fs8Kyu4LEasJBer7lQUhnfun+osn91VH
         4vVg==
X-Gm-Message-State: AOJu0Yy9N9OpLN58Vu6HE4WfvgsjmknIY/Sz51hwuPCfHs4WratOVltZ
	CodytgmKl+COw+0MdoW0HTCBvQ+kXiLNm0+Br/xrxeSePSSmnhwyHufim/SnfI98Wx4eT7hb1od
	B
X-Google-Smtp-Source: AGHT+IHvB3LkDgYwKbjr7I2JMY+coCXXo9BwC2WGoOjltmhK0af8zEz3y+p9ADJJ3nDgWh+TPCchNA==
X-Received: by 2002:a05:600c:1c17:b0:426:5ee5:3129 with SMTP id 5b1f17b1804b1-428e6aea7bdmr134763095e9.2.1723036172089;
        Wed, 07 Aug 2024 06:09:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290579fe08sm28766335e9.16.2024.08.07.06.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 06:09:31 -0700 (PDT)
Date: Wed, 7 Aug 2024 08:09:27 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [plbossart-sound:sdw/fix-bool-properties 16/19]
 sound/soc/sof/debug-dsp-ops.c:174 sof_dsp_ops_tester_dfs_read() error:
 uninitialized symbol 'string'.
Message-ID: <dabf48bf-3762-4291-8014-0c6f3892a1c2@suswa.mountain>
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
config: x86_64-randconfig-161-20240807 (https://download.01.org/0day-ci/archive/20240807/202408071524.CplRSiTF-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408071524.CplRSiTF-lkp@intel.com/

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


string not initialized for the default case.

b5d1176eefb868 Ranjani Sridharan 2024-03-25  167  		}
98ab12fb50b6f3 Ranjani Sridharan 2024-03-25  168  	} else if (!strcmp(dentry->d_name.name, "fw_state")) {
98ab12fb50b6f3 Ranjani Sridharan 2024-03-25  169  		return sof_dsp_ops_fw_state_read(sdev, buffer, count, ppos);
b5d1176eefb868 Ranjani Sridharan 2024-03-25  170  	} else {
0858d83e4c4122 Ranjani Sridharan 2024-03-21  171  		return 0;
b5d1176eefb868 Ranjani Sridharan 2024-03-25  172  	}
0858d83e4c4122 Ranjani Sridharan 2024-03-21  173  
0858d83e4c4122 Ranjani Sridharan 2024-03-21 @174  	if (*ppos || !string)
                                                                     ^^^^^^^

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

