Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA14B2901
	for <oe-kbuild@lists.linux.dev>; Thu, 23 May 2024 14:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716475656; cv=none; b=nHpgpHxKrw+3R6zF/6fdtQtxJsQrSk3uxfpkFFBUTC6qzOH88ggrPcumVwsYg4FAgGvdVYC6YxBa5/kK/XYLDLUwZX0ADoO8LdtqwnKnhFWUV9TDMmyTbf07eF323v6/p+ud2LvqsRkbNpTFxiqXCWPleKrdp7/4RHFT+YSUglc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716475656; c=relaxed/simple;
	bh=b1l6USnY+R7KOOqh9JqzGwwny16vwNBuXqnjCPkRoMs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=iQmTjC8HLhdTcrZX1U+9P32qwC69olducE49CHlenk10i0m0etEkR8MMTA9GTvvlYKP18m3jbcUc/1i1qIE4O0ZPMpzSNv93Ut3owCuLzemIsl+mgfs6uQ7/W4C5VLgW7/jo8ShGoUfyTq1g+ZMlSbFYWmzPhvmY4cZMeqlYprE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GZRt/RV5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GZRt/RV5"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-420180b59b7so19452415e9.0
        for <oe-kbuild@lists.linux.dev>; Thu, 23 May 2024 07:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716475653; x=1717080453; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BIKCBr/JTBTMmR/LzHvL/9eeEKI/QpQAofYG+DZTe60=;
        b=GZRt/RV5nrZkB1mxcsqN2mC1TYJeC2G5grmVW2Be7WqmB4YwLY7eD/KqjB1yKroxu8
         LgELUFVCe4ufwPrRgXiCeeHO7YrrTeT0JULvk7Sczv3Gs/cPA8jqRmG482SoYNJwVjdl
         McouihIDkNBBWpWwb+Q/h1mZgk07p9t1a1s4FClYPEz5z1uvey9b2//AZeWchEE8lgzE
         63McqQWAoJq+nTmxGApuaerAFhBZK4haT5+nXw7wD90MDtEtoxIXyuUCt1qIOlwZsCfI
         NjLb4kxtio19riaBaQNOYIHO84tzMPLroGb9/vSv3dLtJ/fFSdvizU2TqSI9Bl7SsnkZ
         DlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716475653; x=1717080453;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BIKCBr/JTBTMmR/LzHvL/9eeEKI/QpQAofYG+DZTe60=;
        b=hhOoHxqdoTSSnRchhWth6rtKdXfdmTXh1Yl1jaLJvonzqrgXs7uqWK62m6yPN0+uAe
         5No8k6KJHhwQzuunT5BAWg3lTUwt1N7RDXB6NOWxtKwExOY9LvG82xUoUy+4uDEZaHIU
         86ak2OTmz1SOEjY3ya68ZIBQLSWvO/KDswL+KKnXIqdhG86aTvnE/K/OohhGCRnQAdxu
         zDKoXYhW1pl4foqvG6Yn+d+p07a8V9TSH+efOhcJLMmk92wZNM5h5kfaD/b/JA0nr0K9
         2iceqnHmXn96rKQRMrBYCHDhRSnl0A3vwXdIBIdfOy/8jPNqngE9nCOQL0jRvnZUz0VM
         05+w==
X-Gm-Message-State: AOJu0YxZVlFw1QZZhvWOdsFTp/Z62ayWBPr79klXo1MxE/nZfve2Htmv
	13YhJb1Zvf0e11WhVaaScsDruxXqmJeHEvlbwxn75nRVe+0/zUvtY7sRkgaKPdc5KH9ohbmraWc
	Z7WM=
X-Google-Smtp-Source: AGHT+IFyFbuN37ASGbffygEMVXUbvdO2cQyG6k0iwBCDmjVo8cw7/71y2eeu5ulLaPcEBcyCnZ2e/g==
X-Received: by 2002:a5d:4386:0:b0:354:f550:8363 with SMTP id ffacd0b85a97d-354f5508616mr2509556f8f.34.1716475652467;
        Thu, 23 May 2024 07:47:32 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-354cab20062sm9095666f8f.117.2024.05.23.07.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 07:47:31 -0700 (PDT)
Date: Thu, 23 May 2024 17:47:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Aleksa Sarai <cyphar@cyphar.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] fhandle: expose u64 mount id to name_to_handle_at(2)
Message-ID: <01718884-e9a1-4dc8-994a-4839ce3f8a0e@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520-exportfs-u64-mount-id-v1-1-f55fd9215b8e@cyphar.com>

Hi Aleksa,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksa-Sarai/fhandle-expose-u64-mount-id-to-name_to_handle_at-2/20240521-053815
base:   584bbf439d0fa83d728ec49f3a38c581bdc828b4
patch link:    https://lore.kernel.org/r/20240520-exportfs-u64-mount-id-v1-1-f55fd9215b8e%40cyphar.com
patch subject: [PATCH RFC] fhandle: expose u64 mount id to name_to_handle_at(2)
config: x86_64-randconfig-161-20240521 (https://download.01.org/0day-ci/archive/20240521/202405211900.ZcYOJf1E-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202405211900.ZcYOJf1E-lkp@intel.com/

smatch warnings:
fs/fhandle.c:84 do_sys_name_to_handle() warn: maybe return -EFAULT instead of the bytes remaining?

vim +84 fs/fhandle.c

6ccaaf59c335a8 Al Viro             2022-08-04  17  static long do_sys_name_to_handle(const struct path *path,
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  18  				  struct file_handle __user *ufh,
1702d25fd14170 Aleksa Sarai        2024-05-20  19  				  void __user *mnt_id, bool unique_mntid,
1702d25fd14170 Aleksa Sarai        2024-05-20  20  				  int fh_flags)
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  21  {
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  22  	long retval;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  23  	struct file_handle f_handle;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  24  	int handle_dwords, handle_bytes;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  25  	struct file_handle *handle = NULL;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  26  
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  27  	/*
96b2b072ee62be Amir Goldstein      2023-05-02  28  	 * We need to make sure whether the file system support decoding of
96b2b072ee62be Amir Goldstein      2023-05-02  29  	 * the file handle if decodeable file handle was requested.
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  30  	 */
66c62769bcf6aa Amir Goldstein      2023-10-23  31  	if (!exportfs_can_encode_fh(path->dentry->d_sb->s_export_op, fh_flags))
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  32  		return -EOPNOTSUPP;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  33  
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  34  	if (copy_from_user(&f_handle, ufh, sizeof(struct file_handle)))
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  35  		return -EFAULT;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  36  
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  37  	if (f_handle.handle_bytes > MAX_HANDLE_SZ)
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  38  		return -EINVAL;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  39  
68d6f4f3fbd9b1 Gustavo A. R. Silva 2024-03-25  40  	handle = kzalloc(struct_size(handle, f_handle, f_handle.handle_bytes),
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  41  			 GFP_KERNEL);
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  42  	if (!handle)
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  43  		return -ENOMEM;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  44  
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  45  	/* convert handle size to multiple of sizeof(u32) */
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  46  	handle_dwords = f_handle.handle_bytes >> 2;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  47  
96b2b072ee62be Amir Goldstein      2023-05-02  48  	/* we ask for a non connectable maybe decodeable file handle */
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  49  	retval = exportfs_encode_fh(path->dentry,
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  50  				    (struct fid *)handle->f_handle,
96b2b072ee62be Amir Goldstein      2023-05-02  51  				    &handle_dwords, fh_flags);
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  52  	handle->handle_type = retval;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  53  	/* convert handle size to bytes */
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  54  	handle_bytes = handle_dwords * sizeof(u32);
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  55  	handle->handle_bytes = handle_bytes;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  56  	if ((handle->handle_bytes > f_handle.handle_bytes) ||
7cdafe6cc4a6ee Amir Goldstein      2023-05-24  57  	    (retval == FILEID_INVALID) || (retval < 0)) {
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  58  		/* As per old exportfs_encode_fh documentation
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  59  		 * we could return ENOSPC to indicate overflow
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  60  		 * But file system returned 255 always. So handle
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  61  		 * both the values
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  62  		 */
7cdafe6cc4a6ee Amir Goldstein      2023-05-24  63  		if (retval == FILEID_INVALID || retval == -ENOSPC)
7cdafe6cc4a6ee Amir Goldstein      2023-05-24  64  			retval = -EOVERFLOW;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  65  		/*
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  66  		 * set the handle size to zero so we copy only
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  67  		 * non variable part of the file_handle
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  68  		 */
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  69  		handle_bytes = 0;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  70  	} else
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  71  		retval = 0;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  72  	/* copy the mount id */
1702d25fd14170 Aleksa Sarai        2024-05-20  73  	if (unique_mntid)
1702d25fd14170 Aleksa Sarai        2024-05-20  74  		retval = put_user(real_mount(path->mnt)->mnt_id_unique,
1702d25fd14170 Aleksa Sarai        2024-05-20  75  				  (u64 __user *) mnt_id);
1702d25fd14170 Aleksa Sarai        2024-05-20  76  	else
1702d25fd14170 Aleksa Sarai        2024-05-20  77  		retval = put_user(real_mount(path->mnt)->mnt_id,
1702d25fd14170 Aleksa Sarai        2024-05-20  78  				  (int __user *) mnt_id);
1702d25fd14170 Aleksa Sarai        2024-05-20  79  	/* copy the handle */
1702d25fd14170 Aleksa Sarai        2024-05-20  80  	if (!retval)
1702d25fd14170 Aleksa Sarai        2024-05-20  81  		retval = copy_to_user(ufh, handle,
1702d25fd14170 Aleksa Sarai        2024-05-20  82  				struct_size(handle, f_handle, handle_bytes));

copy_to_user() doesn't return error codes, it returns the number of
bytes that were NOT copied.

990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  83  	kfree(handle);
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29 @84  	return retval;
990d6c2d7aee92 Aneesh Kumar K.V    2011-01-29  85  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

