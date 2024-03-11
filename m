Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A496F516;
	Mon, 11 Mar 2024 05:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710135395; cv=none; b=f3M3MGJXdq80qlisXdzy8N3UHWWl2lCXYNvSJGWge5rVbIOohHH60yaXb5Q8xZgmrDyzOYxqbk2ITLSFwa/7tXBVaSZB/eCT6Oasf3L3RKoKYOcBemopkGFBC96Y7hIL98aoGVjsWTZ0QzNiJteButgHxy8taN11S2jSQ7bdtEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710135395; c=relaxed/simple;
	bh=xMF4TtwuURvrqIcEiICWqFl6L9CFb+LKwK76NSZuxPc=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dQGynepIVFEF+mcrYomuLeYNS0nTzE3L/1yCsb57/mgL4Sk+onzhhpfE+MdakX3bxcmAiBnLk7+lgaIO9ZxX7h4xZxhw3rdQmc6CZyPkkIrq/puPFOen8sdPXWhEKgdwgDdslVSENcIe3DUrK+44cPlt9BtY0u7DAYnooOKmkSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+3M7G2L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+3M7G2L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8840AC43394;
	Mon, 11 Mar 2024 05:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710135394;
	bh=xMF4TtwuURvrqIcEiICWqFl6L9CFb+LKwK76NSZuxPc=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
	b=g+3M7G2Lcjx8ZygWFiCYwpXL1Jrq2J+GcneHnGcJKOyPK326RMmHJsZpg+nXx6Rej
	 /XQ+CH9USRtRcPw8sh1W1tCFPMo7fcz0h3TEfBMx+6SQVXXQnYuj8Exw+nrYXWF6s9
	 mKdTU/jEyeO9THLXFOLfzUYPhlg9qesqW4JIz4qbZ6F9k3aWKiURc23YYmc8FtV+hL
	 S5oMCHNT66v+q82pLs9MxoCsfeDbgqUVBvWbYxnJKA3SGX/YkO8vqbRWgKyRfebmXc
	 YUk3z7CLCiZOhE0pmpTYKZjFPTf+C1ZeTLg4wZ6JqNBT6dYoREH43Tdd7HHC3MATwn
	 5E3DDHLK6E31Q==
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6e52dfce542so235457a34.1;
        Sun, 10 Mar 2024 22:36:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUxK7rTcvudtTFi1aVB/TS9nwEANfGw9+K2D2LKsviss+w+ZE+8EUSgSvu5FP6HmPw2wSIQW9kh/MmzNXb4RUOmFA4JP7dzih4jLSD6/w==
X-Gm-Message-State: AOJu0Yy41IW0ywsdLJcpW/MqpjAxspLlFB2MMtTpeQnxXey+a/MvvM5n
	R+itYPpCfunsZHH8edVTDMcTz4TOogZ+sr60bl5OhCRli3Pik0fzX2WCY87k6O+YNZqUkRh2ZfU
	N2ATMvzac9lo9o8R63LkRgU+YMH4=
X-Google-Smtp-Source: AGHT+IHMKW+6N0EpBIs8CmxlemvjxNxeMS8hiuwXB9SZJ81oSSwcTe3H5iIPOOzWxawfQK0+PhEzJC5bh39YHxlMpd4=
X-Received: by 2002:a05:6870:b149:b0:221:9cf3:8ae5 with SMTP id
 a9-20020a056870b14900b002219cf38ae5mr2965984oal.24.1710135393814; Sun, 10 Mar
 2024 22:36:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:ac9:7bd4:0:b0:51e:5fb5:2f75 with HTTP; Sun, 10 Mar 2024
 22:36:33 -0700 (PDT)
In-Reply-To: <cd61edb3-b938-42e9-b9c3-d5c05827b4e1@moroto.mountain>
References: <cd61edb3-b938-42e9-b9c3-d5c05827b4e1@moroto.mountain>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 11 Mar 2024 14:36:33 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9M6Umx+pqU5P0KAG8HaZLWMQC-2CfOVFkZ-ZBA_ezV2w@mail.gmail.com>
Message-ID: <CAKYAXd9M6Umx+pqU5P0KAG8HaZLWMQC-2CfOVFkZ-ZBA_ezV2w@mail.gmail.com>
Subject: Re: [samba-ksmbd:ksmbd-for-next-next 4/4] fs/smb/server/smb2pdu.c:2654
 parse_durable_handle_context() warn: passing zero to 'PTR_ERR'
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

2024-03-11 14:16 GMT+09:00, Dan Carpenter <dan.carpenter@linaro.org>:
> tree:   git://git.samba.org/ksmbd.git ksmbd-for-next-next
> head:   f4ab0ca366e96a297b511d020a7fcd212f0268c9
> commit: f4ab0ca366e96a297b511d020a7fcd212f0268c9 [4/4] ksmbd: add support
> for durable handles v1/v2
> config: i386-randconfig-141-20240310
> (https://download.01.org/0day-ci/archive/20240311/202403110538.jBX2iDwP-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version
> of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202403110538.jBX2iDwP-lkp@intel.com/
>
> smatch warnings:
> fs/smb/server/smb2pdu.c:2654 parse_durable_handle_context() warn: passing
> zero to 'PTR_ERR'
>
> vim +/PTR_ERR +2654 fs/smb/server/smb2pdu.c
>
> f4ab0ca366e96a Namjae Jeon 2024-03-10  2637  static int
> parse_durable_handle_context(struct ksmbd_work *work,
> f4ab0ca366e96a Namjae Jeon 2024-03-10  2638  					struct smb2_create_req
> *req,
> f4ab0ca366e96a Namjae Jeon 2024-03-10  2639  					struct lease_ctx_info
> *lc,
> f4ab0ca366e96a Namjae Jeon 2024-03-10  2640  					struct durable_info
> *dh_info)
> f4ab0ca366e96a Namjae Jeon 2024-03-10  2641  {
> f4ab0ca366e96a Namjae Jeon 2024-03-10  2642  	struct ksmbd_conn *conn =
> work->conn;
> f4ab0ca366e96a Namjae Jeon 2024-03-10  2643  	struct create_context
> *context;
> f4ab0ca366e96a Namjae Jeon 2024-03-10  2644  	int dh_idx, err = 0;
> f4ab0ca366e96a Namjae Jeon 2024-03-10  2645  	u64 persistent_id = 0;
> f4ab0ca366e96a Namjae Jeon 2024-03-10  2646  	int req_op_level;
> f4ab0ca366e96a Namjae Jeon 2024-03-10  2647  	static const char * const
> durable_arr[] = {"DH2C", "DHnC", "DH2Q", "DHnQ"};
> f4ab0ca366e96a Namjae Jeon 2024-03-10  2648
> f4ab0ca366e96a Namjae Jeon 2024-03-10  2649  	req_op_level =
> req->RequestedOplockLevel;
> f4ab0ca366e96a Namjae Jeon 2024-03-10  2650  	for (dh_idx =
> DURABLE_RECONN_V2; dh_idx <= ARRAY_SIZE(durable_arr);
> f4ab0ca366e96a Namjae Jeon 2024-03-10  2651  	     dh_idx++) {
> f4ab0ca366e96a Namjae Jeon 2024-03-10  2652  		context =
> smb2_find_context_vals(req, durable_arr[dh_idx - 1], 4);
> f4ab0ca366e96a Namjae Jeon 2024-03-10  2653  		if (IS_ERR_OR_NULL(context))
> {
> f4ab0ca366e96a Namjae Jeon 2024-03-10 @2654  			err = PTR_ERR(context);
> f4ab0ca366e96a Namjae Jeon 2024-03-10  2655  			if (err == -EINVAL)
> f4ab0ca366e96a Namjae Jeon 2024-03-10  2656  				goto out;
> f4ab0ca366e96a Namjae Jeon 2024-03-10  2657  			err = 0;
> f4ab0ca366e96a Namjae Jeon 2024-03-10  2658  			continue;
>
Hi Dan,
> The smb2_find_context_vals() return ERR_PTR(-EINVAL) on error or NULL on
> not found.  But you're not doing yourself a favor to write it this way...
> It's confusing to the reader and what about if we add new error codes?
> Better to write it like:
>
> 		context = smb2_find_context_vals(req, durable_arr[dh_idx - 1], 4);
> 		if (IS_ERR(context)) {
> 			err = PTR_ERR(context);
> 			goto out;
> 		}
> 		if (!context)
> 			continue;
Okay. I just updated the patch as you suggest.
Thank you!
