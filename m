Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4BF1C2BA
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Sep 2023 07:46:09 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-405361bb94eso106207225e9.0
        for <oe-kbuild@lists.linux.dev>; Wed, 27 Sep 2023 00:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695800768; x=1696405568; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9As+lJOY0lQwvkmgOpEKtf4u1BL8RJ1PAFxRq2flP+A=;
        b=RZpKnopWMU1VY0SKJ4hUAWZtMyWcksGAOedUPJm2YGnK/PCaEH1+QeLnALXBRESIy7
         O3iYTh3NNxzxZkG85xjFdRYjCm0bhFDpGo0vDpNh6JrlqH0N7eXC9ldkLVjRjyq81Egp
         WJ74F3zPGdToXMnEiyEGR5YJmBAgRMj/A2WPf2gUUZUqEG/07JNfBwlXk/9XeLXJ2HM1
         j7o4ocL22zW7HaAnvWKyTy5xK2sHVRLF0ghdUmVtGNqcCa4e+reiQWgxe8RWK0Gq2Wrs
         RwwP1mejosETMjr1QnYRJM+Ipger4opZzSpCPICXo0pTjxlp5rstsmWBMMERjTq9hn/G
         3zZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695800768; x=1696405568;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9As+lJOY0lQwvkmgOpEKtf4u1BL8RJ1PAFxRq2flP+A=;
        b=WMP7lU42VHyqKy2cT3mT6mOYrm9FcMEPmq0Lf061Yr+Gc20ETCVepRmxS3CojDar9u
         thL4vyoT0y9kluJxGLXYnO1ZWEWBuIjBE+ivBqd47Ey4K+YRZWp2cKO/dpiIx3DC9Wmr
         Ajf/r7XE3hoBu4UbiVk5KeBfKQXiRptVv7K/A/yyvOsnCxZyp0YxzGlMNW5GoTespquO
         bFWDd263ir+M/uVS88sGmsW0ScOLOaJFjWRP/EtIir/q6xTJhrTf3vL4RqD80kKobjm1
         J8w1w6gvfkfGy+nx+uR5L39ozeXESTWqfBk1g7tg9CHy0QidYfY4tkGxG1BZvvQhdgEi
         pIig==
X-Gm-Message-State: AOJu0Yxz/vR7TTlhyEhB4XmLfAVnoybSEkZ6I5Edawu8DmuQQGJ3mO9L
	MO1atYcgxmm3OQ2OoMUhOCiaufG0A3f+5PKLZqo=
X-Google-Smtp-Source: AGHT+IEyfEKgua+5MfFm29VSXuQCwtoO1zAZqoo5cb3LaKZyuQFLtsusG31OKcPm7Ay+E7dTMCfNOA==
X-Received: by 2002:a05:600c:20d4:b0:3f7:f2d0:b904 with SMTP id y20-20020a05600c20d400b003f7f2d0b904mr1357965wmm.8.1695800767876;
        Wed, 27 Sep 2023 00:46:07 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t1-20020a1c7701000000b003fe23b10fdfsm19889573wmi.36.2023.09.27.00.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 00:46:07 -0700 (PDT)
Date: Wed, 27 Sep 2023 10:46:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Amir Goldstein <amir73il@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [amir73il:ovl_want_write 8/8] fs/overlayfs/copy_up.c:459
 ovl_set_origin_fh() warn: variable dereferenced before check 'fh' (see line
 458)
Message-ID: <1ce9ae3e-718d-490f-b85d-80f7a5d1df72@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux ovl_want_write
head:   4ea9d9f55925f6631923f76831d8a2a850d3876e
commit: 4ea9d9f55925f6631923f76831d8a2a850d3876e [8/8] ovl: do not encode lower fh with upper sb_writers held
config: i386-randconfig-141-20230909 (https://download.01.org/0day-ci/archive/20230909/202309091443.rCZuOntT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230909/202309091443.rCZuOntT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/1ce9ae3e-718d-490f-b85d-80f7a5d1df72@kadam.mountain/

smatch warnings:
fs/overlayfs/copy_up.c:459 ovl_set_origin_fh() warn: variable dereferenced before check 'fh' (see line 458)

vim +/fh +459 fs/overlayfs/copy_up.c

4ea9d9f55925f6 Amir Goldstein 2023-08-16  450  int ovl_set_origin_fh(struct ovl_fs *ofs, const struct ovl_fh *fh,
4ea9d9f55925f6 Amir Goldstein 2023-08-16  451  		      struct dentry *upper)
4ea9d9f55925f6 Amir Goldstein 2023-08-16  452  {
4ea9d9f55925f6 Amir Goldstein 2023-08-16  453  	int err;
4ea9d9f55925f6 Amir Goldstein 2023-08-16  454  
6266d465bde044 Miklos Szeredi 2017-05-18  455  	/*
6266d465bde044 Miklos Szeredi 2017-05-18  456  	 * Do not fail when upper doesn't support xattrs.
6266d465bde044 Miklos Szeredi 2017-05-18  457  	 */
a0c236b11706cc Amir Goldstein 2021-06-19 @458  	err = ovl_check_setxattr(ofs, upper, OVL_XATTR_ORIGIN, fh->buf,
                                                                                                       ^^^^^^^
Dereference

cbe7fba8edfc8c Amir Goldstein 2019-11-15 @459  				 fh ? fh->fb.len : 0, 0);
                                                                         ^^
Checked too late.  This code is from 2021 though, so why is the warning
getting reported now?

3a1e819b4e8021 Amir Goldstein 2017-03-30  460  
6939f977c54a39 Miklos Szeredi 2020-12-14  461  	/* Ignore -EPERM from setting "user.*" on symlink/special */
6939f977c54a39 Miklos Szeredi 2020-12-14  462  	return err == -EPERM ? 0 : err;
3a1e819b4e8021 Amir Goldstein 2017-03-30  463  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

