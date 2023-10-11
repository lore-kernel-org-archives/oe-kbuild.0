Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7934179BE
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Oct 2023 07:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XbXpI4vG"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-503f39d3236so7828457e87.0
        for <oe-kbuild@lists.linux.dev>; Wed, 11 Oct 2023 00:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697008539; x=1697613339; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7z9KLR0xuq/1ZC7Hf1voQfsB0dArsVBPmdduY9bNHqw=;
        b=XbXpI4vGAPIwj8S8ZgyzKIyTsmUENhsipvyI6a56HXs+E3qA1kb2wPpmNIwniJ3c/d
         SSonvIUd5OF+809TYdbGLjpIztGqxDEgSdg5WpkjEeDcPEd18EwJrIB471D679dFOUdx
         XFF61Rw9uh2olAsf7sccPIHCz+QOUjMtt8lp/gF1VQPFVcgLuX7OS992ip4uKg0uWf0p
         wqcpsge7OgOHdJr6VG0Mr4Jelki6jHb7cAbiBGtYRM8f9XASuHZ6qZw1qgV+Ir3Z/72e
         ceSK5kA3VUXO2rqhosMjaJjuZMuGVVRY1U2gfYcQi0fgJIJQIzBz0DacxSTaEeZuvA9o
         ScxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697008539; x=1697613339;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7z9KLR0xuq/1ZC7Hf1voQfsB0dArsVBPmdduY9bNHqw=;
        b=LER8v4EfwssN/f3iw1lrNsKEwQkpYQ3wgRGRVzbyn7mtd8xiyW+PSkWi85N3C3jRUE
         TlIh+Rdp1MI1+j4LWB4uSGq9UhaOnSCAV0JMN3olSfLxbqJoKbhs3iDbKWDHgUWOdzHw
         +kHPUtQL10PtHwIGQ9yUabjizids6M6i2LCpf4xcu9U1f655vCtYZJ/BXj5XKHi9Bd0+
         Vu9xK7BlNUm6Sa5ncw7rgmUeQs7hryR8xURklYjXHkjldv7EDICqvgTs8+vYdeG5gDxI
         81lFgavsWMhHBy5AkdmNl28eK8WfeUzIDshVQEfWri9AlT2wTckzlQdM+hVEJbdlfXRk
         YA/w==
X-Gm-Message-State: AOJu0YwFDnxCQmk2M/CJwbkbz1LZ8Ft8orBok8A0vtZjsARMRX/795hL
	7Ru/tb5DDDyiufoGS+HUpiXt+aWDei/aXjegz2s=
X-Google-Smtp-Source: AGHT+IHCUyCYWUDhYINLZ0fvhP+DLvI0NF5T6HW+PjVvCQlqvJjfs+jNqYvC6D1NYmm7PN4JvpNC2w==
X-Received: by 2002:a19:771d:0:b0:505:6ede:20b0 with SMTP id s29-20020a19771d000000b005056ede20b0mr15469018lfc.58.1697008538536;
        Wed, 11 Oct 2023 00:15:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c12-20020a05600c0acc00b00402f713c56esm15976765wmr.2.2023.10.11.00.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 00:15:38 -0700 (PDT)
Date: Wed, 11 Oct 2023 10:15:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Namjae Jeon <linkinjeon@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Steve French <stfrench@microsoft.com>
Subject: fs/smb/server/smb2pdu.c:6131 smb2_read_pipe() error: double free of
 'rpc_resp'
Message-ID: <2fd570a5-ceaf-4d9b-8aa2-16e8bd16dbd8@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1c8b86a3799f7e5be903c3f49fcdaee29fd385b5
commit: e2b76ab8b5c9327ab2dae6da05d0752eb2f4771d ksmbd: add support for read compound
config: i386-randconfig-141-20231010 (https://download.01.org/0day-ci/archive/20231011/202310111236.IXH2OKfq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231011/202310111236.IXH2OKfq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202310111236.IXH2OKfq-lkp@intel.com/

New smatch warnings:
fs/smb/server/smb2pdu.c:6131 smb2_read_pipe() error: double free of 'rpc_resp'

vim +/rpc_resp +6131 fs/smb/server/smb2pdu.c

e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6076  static noinline int smb2_read_pipe(struct ksmbd_work *work)
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6077  {
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6078  	int nbytes = 0, err;
64b39f4a2fd293cf fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-30  6079  	u64 id;
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6080  	struct ksmbd_rpc_command *rpc_resp;
7b7d709ef7cf2853 fs/smb/server/smb2pdu.c Namjae Jeon     2023-06-24  6081  	struct smb2_read_req *req;
7b7d709ef7cf2853 fs/smb/server/smb2pdu.c Namjae Jeon     2023-06-24  6082  	struct smb2_read_rsp *rsp;
7b7d709ef7cf2853 fs/smb/server/smb2pdu.c Namjae Jeon     2023-06-24  6083  
7b7d709ef7cf2853 fs/smb/server/smb2pdu.c Namjae Jeon     2023-06-24  6084  	WORK_BUFFERS(work, req, rsp);
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6085  
2d004c6cae567e33 fs/ksmbd/smb2pdu.c      Paulo Alcantara 2022-03-21  6086  	id = req->VolatileFileId;
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6087  
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6088  	rpc_resp = ksmbd_rpc_read(work->sess, id);
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6089  	if (rpc_resp) {
e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6090  		void *aux_payload_buf;
e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6091  
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6092  		if (rpc_resp->flags != KSMBD_RPC_OK) {
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6093  			err = -EINVAL;
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6094  			goto out;
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6095  		}
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6096  
e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6097  		aux_payload_buf =
81a94b27847f7d2e fs/smb/server/smb2pdu.c Namjae Jeon     2023-05-31  6098  			kvmalloc(rpc_resp->payload_sz, GFP_KERNEL);
e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6099  		if (!aux_payload_buf) {
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6100  			err = -ENOMEM;
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6101  			goto out;
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6102  		}
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6103  
e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6104  		memcpy(aux_payload_buf, rpc_resp->payload, rpc_resp->payload_sz);
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6105  
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6106  		nbytes = rpc_resp->payload_sz;
79f6b11a104f3a32 fs/cifsd/smb2pdu.c      Namjae Jeon     2021-04-02  6107  		kvfree(rpc_resp);

Freed

e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6108  		err = ksmbd_iov_pin_rsp_read(work, (void *)rsp,
e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6109  					     offsetof(struct smb2_read_rsp, Buffer),
e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6110  					     aux_payload_buf, nbytes);
e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6111  		if (err)
e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6112  			goto out;

Goto out

e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6113  	} else {
e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6114  		err = ksmbd_iov_pin_rsp(work, (void *)rsp,
e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6115  					offsetof(struct smb2_read_rsp, Buffer));
e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6116  		if (err)
e2b76ab8b5c9327a fs/smb/server/smb2pdu.c Namjae Jeon     2023-08-29  6117  			goto out;
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6118  	}
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6119  
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6120  	rsp->StructureSize = cpu_to_le16(17);
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6121  	rsp->DataOffset = 80;
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6122  	rsp->Reserved = 0;
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6123  	rsp->DataLength = cpu_to_le32(nbytes);
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6124  	rsp->DataRemaining = 0;
699230f31bf55abc fs/ksmbd/smb2pdu.c      Ronnie Sahlberg 2021-09-09  6125  	rsp->Flags = 0;
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6126  	return 0;
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6127  
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6128  out:
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6129  	rsp->hdr.Status = STATUS_UNEXPECTED_IO_ERROR;
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6130  	smb2_set_err_rsp(work);
79f6b11a104f3a32 fs/cifsd/smb2pdu.c      Namjae Jeon     2021-04-02 @6131  	kvfree(rpc_resp);

Double freed

e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6132  	return err;
e2f34481b24db2fd fs/cifsd/smb2pdu.c      Namjae Jeon     2021-03-16  6133  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

