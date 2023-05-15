Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EE3846B
	for <oe-kbuild@lists.linux.dev>; Mon, 15 May 2023 07:34:51 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3078c092056so6351904f8f.1
        for <oe-kbuild@lists.linux.dev>; Mon, 15 May 2023 00:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684136089; x=1686728089;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6gfSJd3vy+0+DlmQAr/7jRIJEG9slIC2VDuxWzND7JM=;
        b=PEZ4c4cQvSRWCKBhDpv8531TJfA8k173ajQdh5763cq4HgpqGuUDVbF+JSpBg/qwhd
         5nPRpPwxH1tR8Af0eGtchQ68tyfUvjijnNvFWRD96PiOHLP9ywLSrd2e/ixtsLaRpIwy
         JMQ3eu6hFoeQxqZnqYmRd8n6Gfhf75qyAUl0Qp9sQiCp6c6Xd3DT5bZVOPaLy1y0yZ/5
         3Zuc0bFuqNsqoyhN6conwu59tU2Gp9GNeJAECjJK4m0M/jsBkCnFR9muvyEXj/XTXxiA
         4udYhqO7LcNMHW+M6ypeb/8VNKzZbQy06t8AXozbpo6SKy1p3pWeJ4fhY1eC6Ifpo6MH
         RUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684136089; x=1686728089;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6gfSJd3vy+0+DlmQAr/7jRIJEG9slIC2VDuxWzND7JM=;
        b=MtchBAGrgC18vNMcbbnkZo3JIdRWnmbyACZpvHFq4XAnAvgkpj3VCN+KVgcTC1UpUT
         5lqWl80PCnA/Rxv19wMaJmA5fws67f4AWydMMeFgYOwcr7abnLnzyozh2mKv2MmQlS02
         g1gQ1iCL2coL9fGYO1TMOLFdZLk9XAycsu0tK3W5G21S40vo8cmjFy3BHFiGcCg1hpv0
         5/zW0BX1ACvjoSrEOeICHMI8evM/2hTnN6hZOMz5YnATa6IDbURfmZPtDzBo1cp4S1qG
         eVO1xaMa5xpdUv3pY/C128zs0OTKrXFS3HWinaA0CXmkC+MMdHiMRlg0S3dAHVedO1Ng
         TGqg==
X-Gm-Message-State: AC+VfDxnwrxEQqDGu/ZFgbOqUZoSwPMDwwYo6+7sx70TS6fB/VJuVWZy
	MVSdkp9jauBTPAvGyBP3QgNrxXTZ4ohI5cNh1hg=
X-Google-Smtp-Source: ACHHUZ4AV1bhDWszFWsspM3tY5j9w2VhPJmTY1CMAm6t9CDO1pVcL+KYe01h8AiYc5Eyp3Z2uJwUKQ==
X-Received: by 2002:a05:6000:120a:b0:306:4054:6e41 with SMTP id e10-20020a056000120a00b0030640546e41mr26550358wrx.53.1684136089145;
        Mon, 15 May 2023 00:34:49 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l8-20020a5d4bc8000000b0030631f199f9sm30973085wrt.34.2023.05.15.00.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 00:34:47 -0700 (PDT)
Date: Mon, 15 May 2023 10:34:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Joel Granados <j.granados@samsung.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [joelgranados:jag/sysctl-testing-for-0day 2/6]
 drivers/parport/procfs.c:502 parport_proc_register() warn: possible memory
 leak of 't'
Message-ID: <819e68aa-8c11-4f4d-9dcb-d20ef136fe0f@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Joelgranados/linux.git jag/sysctl-testing-for-0day
head:   947f41127456cd102688bcddc3002d03111668c1
commit: 3756e44223c2862f95de9d4280b44987e0b3aafc [2/6] parport: Remove register_sysctl_table from parport_proc_register
config: x86_64-randconfig-m001
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305150948.pHgIh7Ql-lkp@intel.com/

smatch warnings:
drivers/parport/procfs.c:502 parport_proc_register() warn: possible memory leak of 't'
drivers/parport/procfs.c:509 parport_proc_register() warn: missing error code 'err'

vim +/t +502 drivers/parport/procfs.c

^1da177e4c3f41 Linus Torvalds       2005-04-16  468  int parport_proc_register(struct parport *port)
^1da177e4c3f41 Linus Torvalds       2005-04-16  469  {
^1da177e4c3f41 Linus Torvalds       2005-04-16  470  	struct parport_sysctl_table *t;
3756e44223c286 Joel Granados        2023-05-12  471  	char *tmp_dir_path;
3756e44223c286 Joel Granados        2023-05-12  472  	size_t tmp_path_len, port_name_len;
3756e44223c286 Joel Granados        2023-05-12  473  	int i, err = 0;
^1da177e4c3f41 Linus Torvalds       2005-04-16  474  
2451a84839187c Silviu-Mihai Popescu 2013-03-11  475  	t = kmemdup(&parport_sysctl_template, sizeof(*t), GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds       2005-04-16  476  	if (t == NULL)
^1da177e4c3f41 Linus Torvalds       2005-04-16  477  		return -ENOMEM;
^1da177e4c3f41 Linus Torvalds       2005-04-16  478  
^1da177e4c3f41 Linus Torvalds       2005-04-16  479  	t->device_dir[0].extra1 = port;
^1da177e4c3f41 Linus Torvalds       2005-04-16  480  
^1da177e4c3f41 Linus Torvalds       2005-04-16  481  	t->vars[0].data = &port->spintime;
3756e44223c286 Joel Granados        2023-05-12  482  	for (i = 0; i < 5; i++) {
3756e44223c286 Joel Granados        2023-05-12  483  		t->vars[i].extra1 = port;
3756e44223c286 Joel Granados        2023-05-12  484  		t->vars[5 + i].extra2 = &port->probe_info[i];
3756e44223c286 Joel Granados        2023-05-12  485  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  486  
3756e44223c286 Joel Granados        2023-05-12  487  	port_name_len = strnlen(port->name, PARPORT_NAME_MAX_LEN);
3756e44223c286 Joel Granados        2023-05-12  488  	/*
3756e44223c286 Joel Granados        2023-05-12  489  	 * Allocate a buffer for two paths: dev/parport/PORT and dev/parport/PORT/devices.
3756e44223c286 Joel Granados        2023-05-12  490  	 * We calculate for the second as that will give us enough for the first.
3756e44223c286 Joel Granados        2023-05-12  491  	 */
3756e44223c286 Joel Granados        2023-05-12  492  	tmp_path_len = PARPORT_BASE_DEVICES_PATH_SIZE + port_name_len;
3756e44223c286 Joel Granados        2023-05-12  493  	tmp_dir_path = kmalloc(tmp_path_len, GFP_KERNEL);
3756e44223c286 Joel Granados        2023-05-12  494  	if (!tmp_dir_path) {
3756e44223c286 Joel Granados        2023-05-12  495  		err = -ENOMEM;
3756e44223c286 Joel Granados        2023-05-12  496  		goto exit_free_t;
3756e44223c286 Joel Granados        2023-05-12  497  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  498  
3756e44223c286 Joel Granados        2023-05-12  499  	if (tmp_path_len
3756e44223c286 Joel Granados        2023-05-12  500  	    <= snprintf(tmp_dir_path, tmp_path_len, "dev/parport/%s/devices", port->name)) {
3756e44223c286 Joel Granados        2023-05-12  501  		kfree(tmp_dir_path);
3756e44223c286 Joel Granados        2023-05-12 @502  		return -ENOENT;

Should be goto exit_free_t;

3756e44223c286 Joel Granados        2023-05-12  503  	}
3756e44223c286 Joel Granados        2023-05-12  504  	if (register_sysctl(tmp_dir_path, t->device_dir) == NULL)
3756e44223c286 Joel Granados        2023-05-12  505  		/*
3756e44223c286 Joel Granados        2023-05-12  506  		 * We keep the original behavior of parport where failure to register
3756e44223c286 Joel Granados        2023-05-12  507  		 * does not return error.
3756e44223c286 Joel Granados        2023-05-12  508  		 */
3756e44223c286 Joel Granados        2023-05-12 @509  		goto  exit_free_tmp_dir_path;

Smatch wants a error code for this error path.

The comments say that we are doing the wrong thing deliberately to
maintain backwards compatibility and avoid breaking stuff.  Fortunately,
(LOL), no one is checking the returns from parport_proc_register() so we
are free to return a correct error code without any worry about breakage.

^1da177e4c3f41 Linus Torvalds       2005-04-16  510  
^1da177e4c3f41 Linus Torvalds       2005-04-16  511  
3756e44223c286 Joel Granados        2023-05-12  512  	tmp_path_len = PARPORT_BASE_PATH_SIZE + port_name_len;
3756e44223c286 Joel Granados        2023-05-12  513  	if (tmp_path_len
3756e44223c286 Joel Granados        2023-05-12  514  	   <= snprintf(tmp_dir_path, tmp_path_len, "dev/parport/%s", port->name)) {
3756e44223c286 Joel Granados        2023-05-12  515  		err = -ENOENT;
3756e44223c286 Joel Granados        2023-05-12  516  		goto exit_free_tmp_dir_path;
^1da177e4c3f41 Linus Torvalds       2005-04-16  517  	}
3756e44223c286 Joel Granados        2023-05-12  518  
3756e44223c286 Joel Granados        2023-05-12  519  	t->sysctl_header = register_sysctl(tmp_dir_path, t->vars);
3756e44223c286 Joel Granados        2023-05-12  520  	if (t->sysctl_header == NULL)
3756e44223c286 Joel Granados        2023-05-12  521  		goto exit_free_tmp_dir_path;

Same here.  Return an error code.

3756e44223c286 Joel Granados        2023-05-12  522  
^1da177e4c3f41 Linus Torvalds       2005-04-16  523  	port->sysctl_table = t;
3756e44223c286 Joel Granados        2023-05-12  524  
3756e44223c286 Joel Granados        2023-05-12  525  	kfree(tmp_dir_path);
^1da177e4c3f41 Linus Torvalds       2005-04-16  526  	return 0;
3756e44223c286 Joel Granados        2023-05-12  527  
3756e44223c286 Joel Granados        2023-05-12  528  exit_free_tmp_dir_path:
3756e44223c286 Joel Granados        2023-05-12  529  	kfree(tmp_dir_path);
3756e44223c286 Joel Granados        2023-05-12  530  exit_free_t:
3756e44223c286 Joel Granados        2023-05-12  531  	kfree(t);
3756e44223c286 Joel Granados        2023-05-12  532  	t = NULL;

t is a local variable.  No point in setting it to NULL.  (This was
copied from the original code, I know, but since you're re-writing stuff
you may as well delete the nonsense bits).

3756e44223c286 Joel Granados        2023-05-12  533  	return err;
3756e44223c286 Joel Granados        2023-05-12  534  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
