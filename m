Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC050155330
	for <oe-kbuild@lists.linux.dev>; Mon, 11 Nov 2024 09:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731316632; cv=none; b=UztRhz7eejAHWLWfnKmlNt6HSP6yymAR4vYTlPLqdDZ71a59liqKZmk1RIL+iKTMcksOnKYoFJUUadleiBksFpQD1HmizQyNtlqa70jr7Xo/VOZFalETiLjlKzutQCukAPCymiT9vflxOOWZ6+ocrCHK6ekF2BkhaNDE8VU49m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731316632; c=relaxed/simple;
	bh=S6IdCwFyYOZtCBhKS6god+fdnVQCBLyZ7yGLvVY9+mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=gNe/NMtbE6z2EHFgDXEFVtdOYvDsQkFizGOffNMbdoSefR9izlIPMOolUxByLMpy7L91MdgmYR13r5Fqv2KpHWvquybEKnPKXn8tBLqaJiJlWEuy3B/eCefOddDDU5Mcjgv/fALLTFpAcIuk+FagIcUXGv+OBSWMinmqPklKkTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q3gyNkVl; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q3gyNkVl"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a99cc265e0aso677362966b.3
        for <oe-kbuild@lists.linux.dev>; Mon, 11 Nov 2024 01:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731316629; x=1731921429; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7rOGsYh2/Wili8BFk/17en+8hxRhfW8LwTIEitemabI=;
        b=Q3gyNkVlKbxWKJdWbP2OBMdeWur1lEVdHBcTihRNcQIYHv7orJ8pxxWvTCDfTWkMPr
         +gjCtQoOheEJ+IstUxeMhgY40Yg9nh2GTZNkvaUr8lJlK2h8aqQ2WJ2PZGO4kfjibIku
         4A7EpSR5zPMwNjxOsx8Fin5F9apV6s/glNAIgyZOTF4T85nsIee2Uial+JV2OTpIeFeb
         bXJYTr1E/ARlShYargyIh5aRAFI/iVAvmsH4c0BTrFvgKFB8ANgO0dgovfnvjTJnolQz
         29MlkJI8G3lka7TmzfGk4v71vWUzvXV2+7NPG1MIDEpqb6ZhrKf6I9gJijKEBx5WlwAC
         IMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731316629; x=1731921429;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7rOGsYh2/Wili8BFk/17en+8hxRhfW8LwTIEitemabI=;
        b=ANQQG5/QLlmQx1fmmQEV1NKs6ASFIYoK8tVUSxcoLzXjcALVoxMtDyLn9b4/JVJv8W
         3O/Md1x/7dFn1f/zXqgXD/L1QoGcp9GeTvxNNRVoOFttjvGpNiG8QHgBCnHyjab0LH9D
         RlpfN0OpUpTJAtWT5oh4coQhbD9zLbptJOsS5VKJMC7Y65o29nUpTVlySBKINIFtYxMM
         YcUZGWNplqu/WEAXJQDaaj5sIbOwSqXZ//wE/3kJBowgKidD8BhxOlj6H0EB7CPtkquJ
         8klY4TzjGTsB0STbfeLDLINLV9+eF45uhacnsD3j7OEYnWhUUsIVm6uDBoHHyb40r40+
         06Fw==
X-Gm-Message-State: AOJu0YzgSSRkoX9pG9lQIAgTvCHiwhsvPbAbvCCpv4dYq+2e5hJBuDXu
	lX7bOKmU3tgdbQ4izSw1f1+78xsGiTmcH0qYC5ChfvoFpOGv2j4kyZfueskL2LfEhZDIAH4woa3
	g4gU=
X-Google-Smtp-Source: AGHT+IHzPV/QpdnkA9QR4O4QeTMDVHrrc+pu8jyYjL/901IXR5afM3S6goVHpS6w+lkvn22u2U3k6A==
X-Received: by 2002:a17:907:72c3:b0:a9e:df65:372b with SMTP id a640c23a62f3a-a9ef001fdb7mr1050127666b.52.1731316628640;
        Mon, 11 Nov 2024 01:17:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a176cbsm581450966b.23.2024.11.11.01.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 01:17:08 -0800 (PST)
Date: Mon, 11 Nov 2024 12:17:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Bernd Schubert <bschubert@ddn.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v5 09/16] fuse: {uring} Add uring sqe commit and
 fetch support
Message-ID: <28a805ed-461a-4557-b851-cda47d01d758@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107-fuse-uring-for-6-10-rfc4-v5-9-e8660a991499@ddn.com>

Hi Bernd,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Bernd-Schubert/fuse-rename-to-fuse_dev_end_requests-and-make-non-static/20241108-013957
base:   0c3836482481200ead7b416ca80c68a29cfdaabd
patch link:    https://lore.kernel.org/r/20241107-fuse-uring-for-6-10-rfc4-v5-9-e8660a991499%40ddn.com
patch subject: [PATCH RFC v5 09/16] fuse: {uring} Add uring sqe commit and fetch support
config: x86_64-randconfig-161-20241109 (https://download.01.org/0day-ci/archive/20241109/202411091639.9TrH6yhu-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411091639.9TrH6yhu-lkp@intel.com/

smatch warnings:
fs/fuse/dev_uring.c:251 fuse_uring_copy_from_ring() warn: maybe return -EFAULT instead of the bytes remaining?

vim +251 fs/fuse/dev_uring.c

7940d4237db3ce Bernd Schubert 2024-11-07  238  static int fuse_uring_copy_from_ring(struct fuse_ring *ring,
7940d4237db3ce Bernd Schubert 2024-11-07  239  				     struct fuse_req *req,
7940d4237db3ce Bernd Schubert 2024-11-07  240  				     struct fuse_ring_ent *ent)
7940d4237db3ce Bernd Schubert 2024-11-07  241  {
7940d4237db3ce Bernd Schubert 2024-11-07  242  	struct fuse_copy_state cs;
7940d4237db3ce Bernd Schubert 2024-11-07  243  	struct fuse_args *args = req->args;
7940d4237db3ce Bernd Schubert 2024-11-07  244  	struct iov_iter iter;
7940d4237db3ce Bernd Schubert 2024-11-07  245  	int err;
7940d4237db3ce Bernd Schubert 2024-11-07  246  	int res_arg_len;
7940d4237db3ce Bernd Schubert 2024-11-07  247  
7940d4237db3ce Bernd Schubert 2024-11-07  248  	err = copy_from_user(&res_arg_len, &ent->headers->in_out_arg_len,
7940d4237db3ce Bernd Schubert 2024-11-07  249  			     sizeof(res_arg_len));
7940d4237db3ce Bernd Schubert 2024-11-07  250  	if (err)
7940d4237db3ce Bernd Schubert 2024-11-07 @251  		return err;

	if (copy_from_user(&res_arg_len, &ent->headers->in_out_arg_len,
			   sizeof(res_arg_len)))
		return -EFAULT;

7940d4237db3ce Bernd Schubert 2024-11-07  252  
7940d4237db3ce Bernd Schubert 2024-11-07  253  	err = import_ubuf(ITER_SOURCE, ent->payload, ent->max_arg_len, &iter);
7940d4237db3ce Bernd Schubert 2024-11-07  254  	if (err)
7940d4237db3ce Bernd Schubert 2024-11-07  255  		return err;
7940d4237db3ce Bernd Schubert 2024-11-07  256  
7940d4237db3ce Bernd Schubert 2024-11-07  257  	fuse_copy_init(&cs, 0, &iter);
7940d4237db3ce Bernd Schubert 2024-11-07  258  	cs.is_uring = 1;
7940d4237db3ce Bernd Schubert 2024-11-07  259  	cs.req = req;
7940d4237db3ce Bernd Schubert 2024-11-07  260  
7940d4237db3ce Bernd Schubert 2024-11-07  261  	return fuse_copy_out_args(&cs, args, res_arg_len);
7940d4237db3ce Bernd Schubert 2024-11-07  262  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

