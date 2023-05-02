Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5AC1106
	for <oe-kbuild@lists.linux.dev>; Tue,  2 May 2023 11:31:28 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-2fa47de5b04so3497763f8f.1
        for <oe-kbuild@lists.linux.dev>; Tue, 02 May 2023 04:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683027085; x=1685619085;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vgouLHt67B3v2ehwGE/0MEW+U6EiOv+zR81KVmek+co=;
        b=lsS3QOHHI3E7EQ6XOHLd2dr9r+x41qiXFeUDutI0eZrl9ec9OYaLXPBP0jBP1lzMb2
         fnaQyVeh80DeHjgDURvZfOxjju+9NM+PoGMbWXWNFCo54d6ws0ZmUOrh8GgWjKOsR3CY
         KB1mLeRrMVh8c8UvpP1NzMOD4rsRHu/i9RfeSbOlcQq1MRZn43PlnAVeTqRJ6htFo51a
         WBRLZvVxdq+fyxfqY2D/vq+Ly52K7cm8aiA9+1GzzShfxq18qLBknKNYFyEnbMijgSmj
         uz9+K4IxgDrFV8BUAo2OaxQ0EkJpRXGYrSp+TKsMBApgyUYHp5K3T50L+zKW3yWy2CFk
         bP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683027085; x=1685619085;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vgouLHt67B3v2ehwGE/0MEW+U6EiOv+zR81KVmek+co=;
        b=B80yVYiKqU0uEvMK4lZH4r9KzEzShYJmF9gxTx1Gxz6XXMSMiLgogU+qicK3fbDugc
         y4hUZOOs7SOGA4WH+fnIMT+ZPhmBkR+aDTsils8l5++JTHfm3I97SUqtoD/EMho7xu/U
         UvLiXYGYExqgRDJ0HFljy/CKbp8gl1+96mFq0XgGIYlK3P5z+l7TW8Dt3gw3bNJPGysR
         BQRK47c7/m92k2Ws1NGVHWoD4z34KIpb4ZrR7eyKGdJpzxfEccXdh2H6pEMVO0Qeu/Ax
         yXUmcZ2K12TqiTyWJhrSj+yNfcuNDop+EaoDYQVtEqyL+qzX0FeSaAfIXNZ2qvq36jRs
         80cA==
X-Gm-Message-State: AC+VfDw9+qcW//yqqEBDpKrjWgteLke4sJ/NfUvzD3L7jsuONCSNCA2k
	ZgqTI/q0uNgVnQOXJwGFTK2c6RZ66Jh7CEJsBOI=
X-Google-Smtp-Source: ACHHUZ4nyqX2wSqcF7T9axJmiJaKlnqKXlJo9uefp3OfJHIHYIONpy2H+9kUGbvbxECAgDnKXB+cMA==
X-Received: by 2002:a5d:49c6:0:b0:306:2c01:4029 with SMTP id t6-20020a5d49c6000000b003062c014029mr4410508wrs.5.1683027085613;
        Tue, 02 May 2023 04:31:25 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m18-20020adffa12000000b003047297a5e8sm24006691wrr.54.2023.05.02.04.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 04:31:24 -0700 (PDT)
Date: Tue, 2 May 2023 14:31:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Namjae Jeon <linkinjeon@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Steve French <stfrench@microsoft.com>
Subject: fs/ksmbd/smb_common.c:350 smb1_allocate_rsp_buf() warn: Please
 consider using kzalloc instead of kmalloc
Message-ID: <670b3581-db50-4ba4-ad49-73c1e7006ad1@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d06f5a3f7140921ada47d49574ae6fa4de5e2a89
commit: dc8289f912387c3bcfbc5d2db29c8947fa207c11 ksmbd: fix slab-out-of-bounds in init_smb2_rsp_hdr
config: openrisc-randconfig-m041-20230423 (https://download.01.org/0day-ci/archive/20230428/202304281001.oskkuJo0-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304281001.oskkuJo0-lkp@intel.com/

smatch warnings:
fs/ksmbd/smb_common.c:350 smb1_allocate_rsp_buf() warn: Please consider using kzalloc instead of kmalloc

vim +350 fs/ksmbd/smb_common.c

dc8289f912387c Namjae Jeon 2023-04-01  348  static int smb1_allocate_rsp_buf(struct ksmbd_work *work)
dc8289f912387c Namjae Jeon 2023-04-01  349  {
dc8289f912387c Namjae Jeon 2023-04-01 @350  	work->response_buf = kmalloc(MAX_CIFS_SMALL_BUFFER_SIZE,
dc8289f912387c Namjae Jeon 2023-04-01  351  			GFP_KERNEL | __GFP_ZERO);

Someone else wrote this Smatch check to encourage people to use kzalloc()
instead of __GFP_ZERO.  I try stay out of style debates.  :P

dc8289f912387c Namjae Jeon 2023-04-01  352  	work->response_sz = MAX_CIFS_SMALL_BUFFER_SIZE;
dc8289f912387c Namjae Jeon 2023-04-01  353  
dc8289f912387c Namjae Jeon 2023-04-01  354  	if (!work->response_buf) {
dc8289f912387c Namjae Jeon 2023-04-01  355  		pr_err("Failed to allocate %u bytes buffer\n",
dc8289f912387c Namjae Jeon 2023-04-01  356  				MAX_CIFS_SMALL_BUFFER_SIZE);
dc8289f912387c Namjae Jeon 2023-04-01  357  		return -ENOMEM;
dc8289f912387c Namjae Jeon 2023-04-01  358  	}
dc8289f912387c Namjae Jeon 2023-04-01  359  
dc8289f912387c Namjae Jeon 2023-04-01  360  	return 0;
dc8289f912387c Namjae Jeon 2023-04-01  361  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

