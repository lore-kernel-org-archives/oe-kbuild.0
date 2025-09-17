Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E293064B7
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Sep 2025 08:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758099339; cv=none; b=s8ng1Sz4xvTLJQOeH0VH4BkmrN7rLdcaBsDYMF10/F7QZCef5tJ7Nemipew2DeZPTBouch5eWRt+XQesh/Qoe6+5aD+CBloh7vWulQWnFoPzmiX3BJxBD38wtpFxv7X6DzIeR9185J1nw4Al3Ey7S1XcPeWTkKZ6t617yRuIbAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758099339; c=relaxed/simple;
	bh=xwSHI/o4u50J881ftyToVBoYLg17be76U5g7Vcy0mz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tI/9TTYPmNZVqnAVJYuzf5IX03ktjim1YAVJkP9+rCZTqgivEofQC3wTHCYLOb5+MQxmUVJEeU8j9sqIy9Ho6OYJM4TdUJKd/i2dJXpcfk4bmtkWSMZyS9b5Fz/EEzs82VEyIgclZKwfu+4LIFtzgwYlXpuQmsVwYtC41Kqm3TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sid7IH8N; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sid7IH8N"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45f29e5e89bso42482815e9.2
        for <oe-kbuild@lists.linux.dev>; Wed, 17 Sep 2025 01:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758099336; x=1758704136; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nmgRAXzW/9f+OKShqpEsleaouz9wwraYra0XYWrZBHg=;
        b=sid7IH8NhCGK1Kn1iSHduXx7TvtrtZQzFFlib0k6mkEgZnM2DQSDF1Bf3nqBdTPFCC
         ZdVWCCGVQq+OLYXykiltKyR9hRMiskURadc+0vY0ZC8S3b2QIx5XH6hLav45IN+jbATe
         eAXOjdfhf6nv4/77GYKRyDrlrCu0lta7M+3NMystVhA9fxMEYUx+QDD0W7yEGPwvLmzP
         feFj36f2orQaGn2r74+BAga5POTYkYO/Sk/5cjVlgt4LLmT65aZtcSbFBmq2dp60n+tc
         AcgtD9Jk4rXybV7swcf8GAaHzQmAW1LEySUO7u9nV4xdBR3Tw5q6h/J/XUyAtzepIsYd
         ZsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758099336; x=1758704136;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nmgRAXzW/9f+OKShqpEsleaouz9wwraYra0XYWrZBHg=;
        b=SbFW6nyEO9Vx/xAFt4lID9T2RFEQrPDAguEiIdcpj31kCJhwRHuByF0fSBZu1P/by1
         sod6teahCN8VKCoX3RYIirUSdmMbOzZASxEMcZoHTukj7CFBFN5DcNklPQx9s6mz0BLb
         39dvMj7AC2Br1oyaCWRS0aKE8Bdy270XA270vmw1rKUbJ4zWmC6Lewg2cKHOLwYKntnT
         FWjS4G3hD57mipzCHefU2bKOAIBIv11N9co7KJbQUZu+GN77w8Nn0uvBaugfP02pNWGj
         ak2M8CIbpccdBczmG9nn2pu2noKZQncFInDjIvXL9xN7UV/34xFeOswIqZje8dfW35nA
         lNIg==
X-Gm-Message-State: AOJu0YwApwNZ1Dl5iWiZsI7T86/m7D4qdrRyqqeLauN5iUl/zkskw63Z
	T4VS3FuV2wPEL4xySd0SkKezugkrkvrCd5/1Ny1T9OfgVzP6sx/blYLL011hlFWq47YgJSiDxOp
	+N5Le
X-Gm-Gg: ASbGncs77qzYrxhC6YA5oyg0eW1wjVMlndqq8fJJyZrQ8tVJ9NY9OEfWKXooKPBz77u
	xj+gHKveUU1ay/6pi9dC/4btONdwRfc2KqCaCAGcbi1d/Ll9JplLjq0DzgJAOn9l3+Em7Ka0es9
	NoI95AZsOV/yu7KkE8x3hFOjYuqArkpl1pu/k/syRgjEOaMKRxNh2iOsRDQ6qUPeZxhiIU3iliU
	J/nhJLQ7Z26wrPBDrx0qLDM4dfa6g9eGNaG1EvoIk/Zhxvm2NiBKpQkSj4P7GHUjHsSKv4067tZ
	JKJlxXZUw6IIqp6OPZoelM+ooXAZrQJdMpWJmIaBo9YdSwxfJJGBTuZDuWan/2E2vAmhIrKN81H
	Zsn9x7dSe1vtJWD4DtvPXFEKEQ9M=
X-Google-Smtp-Source: AGHT+IFYI0PazZAgMJFCipmPOvaL5sk1f7U5vKwzqJ04uAmIB5mQ9nuzk6RIaVB5K5niW1pz+S0T3g==
X-Received: by 2002:a05:600c:3b20:b0:458:bc3f:6a77 with SMTP id 5b1f17b1804b1-46202174e7bmr11202475e9.2.1758099335678;
        Wed, 17 Sep 2025 01:55:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-461371847d0sm28606095e9.2.2025.09.17.01.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 01:55:35 -0700 (PDT)
Date: Wed, 17 Sep 2025 11:55:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-lts 1/1] fs/smb/client/smb2inode.c:520
 smb2_compound_op() error: uninitialized symbol 'rsp_iov'.
Message-ID: <202509171639.2AtRG7fT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250917085531.bUQ2IriUMW7MHhM8pIWWdK9F9amo59oO59HJ7Ljb0Ls@z>

tree:   https://android.googlesource.com/kernel/common android14-6.1-lts
head:   8c8937bc84545d6e04812fafa04bcf969f3a5cab
commit: 3fc11ff13fbc2749871d6ac2141685cf54699997 [1/1] fs/smb: Fix inconsistent refcnt update
config: i386-randconfig-141-20250917 (https://download.01.org/0day-ci/archive/20250917/202509171639.2AtRG7fT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509171639.2AtRG7fT-lkp@intel.com/

New smatch warnings:
fs/smb/client/smb2inode.c:520 smb2_compound_op() error: uninitialized symbol 'rsp_iov'.

vim +/rsp_iov +520 fs/smb/client/smb2inode.c

76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03   58  static int smb2_compound_op(const unsigned int xid, struct cifs_tcon *tcon,
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   59  			    struct cifs_sb_info *cifs_sb, const char *full_path,
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03   60  			    __u32 desired_access, __u32 create_disposition, __u32 create_options,
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03   61  			    umode_t mode, void *ptr, int command, struct cifsFileInfo *cfile,
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03   62  			    struct kvec *err_iov, int *err_buftype)
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   63  {
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20   64  	struct cop_vars *vars = NULL;
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20   65  	struct kvec *rsp_iov;
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20   66  	struct smb_rqst *rqst;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   67  	int rc;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   68  	__le16 *utf16_path = NULL;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   69  	__u8 oplock = SMB2_OPLOCK_LEVEL_NONE;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   70  	struct cifs_fid fid;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   71  	struct cifs_ses *ses = tcon->ses;
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31   72  	struct TCP_Server_Info *server;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   73  	int num_rqst = 0;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   74  	int resp_buftype[3];
c2e0fe3f5aae1f7 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   75  	struct smb2_query_info_rsp *qi_rsp = NULL;
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03   76  	struct cifs_open_info_data *idata;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   77  	int flags = 0;
c2e0fe3f5aae1f7 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   78  	__u8 delete_pending[8] = {1, 0, 0, 0, 0, 0, 0, 0};
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   79  	unsigned int size[2];
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   80  	void *data[2];
bb435512cec806a fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   81  	int len;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03   82  
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20   83  	vars = kzalloc(sizeof(*vars), GFP_ATOMIC);
3fc11ff13fbc274 fs/smb/client/smb2inode.c Shuhao Fu       2025-08-28   84  	if (vars == NULL) {
3fc11ff13fbc274 fs/smb/client/smb2inode.c Shuhao Fu       2025-08-28   85  		rc = -ENOMEM;
3fc11ff13fbc274 fs/smb/client/smb2inode.c Shuhao Fu       2025-08-28   86  		goto out;

rsp_iov is uninitialized.

3fc11ff13fbc274 fs/smb/client/smb2inode.c Shuhao Fu       2025-08-28   87  	}
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20   88  	rqst = &vars->rqst[0];
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20   89  	rsp_iov = &vars->rsp_iov[0];
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20   90  
352d96f3acc6e02 fs/cifs/smb2inode.c       Aurelien Aptel  2020-05-31   91  	server = cifs_pick_channel(ses);

[ snip ]

c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  513  	}
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03  514  
3fc11ff13fbc274 fs/smb/client/smb2inode.c Shuhao Fu       2025-08-28  515  out:
4fe07d55a5461e6 fs/smb/client/smb2inode.c Shyam Prasad N  2023-06-22  516  	if (cfile)
4fe07d55a5461e6 fs/smb/client/smb2inode.c Shyam Prasad N  2023-06-22  517  		cifsFileInfo_put(cfile);
4fe07d55a5461e6 fs/smb/client/smb2inode.c Shyam Prasad N  2023-06-22  518  
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03  519  	if (rc && err_iov && err_buftype) {
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03 @520  		memcpy(err_iov, rsp_iov, 3 * sizeof(*err_iov));

Uninitialized

76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03  521  		memcpy(err_buftype, resp_buftype, 3 * sizeof(*err_buftype));
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03  522  	} else {
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  523  		free_rsp_buf(resp_buftype[0], rsp_iov[0].iov_base);

Here too.

c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  524  		free_rsp_buf(resp_buftype[1], rsp_iov[1].iov_base);
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  525  		free_rsp_buf(resp_buftype[2], rsp_iov[2].iov_base);
76894f3e2f71177 fs/cifs/smb2inode.c       Paulo Alcantara 2022-10-03  526  	}
a7d5c2946280887 fs/cifs/smb2inode.c       Ronnie Sahlberg 2020-05-20  527  	kfree(vars);
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  528  	return rc;
c5a5f38f075cf76 fs/cifs/smb2inode.c       Ronnie Sahlberg 2018-09-03  529  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

