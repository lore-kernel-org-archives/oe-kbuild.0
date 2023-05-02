Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB77464C;
	Tue,  2 May 2023 14:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 653EAC433D2;
	Tue,  2 May 2023 14:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683038983;
	bh=EbN5U9p1dvBRyYU8tr68GXf44XmTOJfHp6pBtDEBN6Q=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
	b=IpzOhEigE9MDbCSSfaGdpB0A65MdfJOzxrTw7RQodGXLoyYGyf8Pu6OE+4lm0GTXF
	 G1kOpjDqgAKpbPLDUgqFrWiXjpSwSchNP5HrHSHiDj25yvHNWj0wp3VYdEzuPIJs0a
	 DNF+DXlLssz0h4bnd6b8OevHNFPFv2BqC+xLN4z0tiyQoIlYY36kp31dVGe5ExD5tO
	 H4fM8fzTWti1p9EUSrCDPOiayf/e3PskrJh+Mpo7fyYPdXjg2Ak4uUtXF12y0ihwQt
	 WHQeQQ/xqYQtQ4Epk2nZ10h4RMH4KPhxgUgeqNDKj9ooqCsyXGxR2i76suCty03b7f
	 SxAVd0WX7MTSg==
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-18f4a6d2822so23060368fac.1;
        Tue, 02 May 2023 07:49:43 -0700 (PDT)
X-Gm-Message-State: AC+VfDxzXFMu4YNC4uOKXdzAZLk7WZbxvpc0uXInJln1cLmc37SwVt2h
	6La+x9E71pfzq1uWr5VKd0q8RiedMB0lA0Ac774=
X-Google-Smtp-Source: ACHHUZ56Tai8Hg7phjdFyrwPU13Vf/8XPu2DBkuusYJt3gbwZgfEsGDiBUZ2boE93+AStvioqp1vKcteI17l+08AATE=
X-Received: by 2002:a05:6820:3cd:b0:547:6db6:7755 with SMTP id
 s13-20020a05682003cd00b005476db67755mr7992917ooj.3.1683038982541; Tue, 02 May
 2023 07:49:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a8a:1086:0:b0:4d3:d9bf:b562 with HTTP; Tue, 2 May 2023
 07:49:42 -0700 (PDT)
In-Reply-To: <670b3581-db50-4ba4-ad49-73c1e7006ad1@kili.mountain>
References: <670b3581-db50-4ba4-ad49-73c1e7006ad1@kili.mountain>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 2 May 2023 23:49:42 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-NNEXdHQQ9YnHgROFH24A7MQmBG8LCsHKudikDLk7imA@mail.gmail.com>
Message-ID: <CAKYAXd-NNEXdHQQ9YnHgROFH24A7MQmBG8LCsHKudikDLk7imA@mail.gmail.com>
Subject: Re: fs/ksmbd/smb_common.c:350 smb1_allocate_rsp_buf() warn: Please
 consider using kzalloc instead of kmalloc
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Steve French <stfrench@microsoft.com>
Content-Type: text/plain; charset="UTF-8"

2023-05-02 20:31 GMT+09:00, Dan Carpenter <dan.carpenter@linaro.org>:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> master
> head:   d06f5a3f7140921ada47d49574ae6fa4de5e2a89
> commit: dc8289f912387c3bcfbc5d2db29c8947fa207c11 ksmbd: fix
> slab-out-of-bounds in init_smb2_rsp_hdr
> config: openrisc-randconfig-m041-20230423
> (https://download.01.org/0day-ci/archive/20230428/202304281001.oskkuJo0-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 12.1.0
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Link: https://lore.kernel.org/r/202304281001.oskkuJo0-lkp@intel.com/
>
> smatch warnings:
> fs/ksmbd/smb_common.c:350 smb1_allocate_rsp_buf() warn: Please consider
> using kzalloc instead of kmalloc
>
> vim +350 fs/ksmbd/smb_common.c
>
> dc8289f912387c Namjae Jeon 2023-04-01  348  static int
> smb1_allocate_rsp_buf(struct ksmbd_work *work)
> dc8289f912387c Namjae Jeon 2023-04-01  349  {
> dc8289f912387c Namjae Jeon 2023-04-01 @350  	work->response_buf =
> kmalloc(MAX_CIFS_SMALL_BUFFER_SIZE,
> dc8289f912387c Namjae Jeon 2023-04-01  351  			GFP_KERNEL | __GFP_ZERO);
>
> Someone else wrote this Smatch check to encourage people to use kzalloc()
> instead of __GFP_ZERO.  I try stay out of style debates.  :P
Okay. I will change it.

Thanks.
>
> dc8289f912387c Namjae Jeon 2023-04-01  352  	work->response_sz =
> MAX_CIFS_SMALL_BUFFER_SIZE;
> dc8289f912387c Namjae Jeon 2023-04-01  353
> dc8289f912387c Namjae Jeon 2023-04-01  354  	if (!work->response_buf) {
> dc8289f912387c Namjae Jeon 2023-04-01  355  		pr_err("Failed to allocate %u
> bytes buffer\n",
> dc8289f912387c Namjae Jeon 2023-04-01  356
> 				MAX_CIFS_SMALL_BUFFER_SIZE);
> dc8289f912387c Namjae Jeon 2023-04-01  357  		return -ENOMEM;
> dc8289f912387c Namjae Jeon 2023-04-01  358  	}
> dc8289f912387c Namjae Jeon 2023-04-01  359
> dc8289f912387c Namjae Jeon 2023-04-01  360  	return 0;
> dc8289f912387c Namjae Jeon 2023-04-01  361  }
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
>
>
