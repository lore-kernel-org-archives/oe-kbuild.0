Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1948B7F0;
	Thu,  5 Jan 2023 04:25:28 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id h16so34956755wrz.12;
        Wed, 04 Jan 2023 20:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mlF6HO6o81QnTlpWAW+FlcP9DvIspnjBxpuCgMSKncs=;
        b=CoSHGXuIfCrJ/6d3/zWBEaaQoNXDBIdsVDQGOmjIOiptHSJoIbWu4p6Rfkydi9x+0O
         2P2khnejYt6Wd34ahMDVY/IpBBFzbRIgyJDAFmssLJ1ihLOWDFuIAvuo+cYx7jeu/0gY
         /XDCBCfDKr2SWP9MBe7FruwCuqsMShH9pVtLi1983x4lUlk9a/ucyBS8z818IT+QFSt5
         6/enGMPMHPFzVtKKtRTbEAZfvJxSs2D98cBIqcjpPY20+VwwN4zjxt6bQGL+Qfj+aB9s
         OjsSFMkLI8a4Cx2OHASWLH3fazBSgcURgXqbtAXQ0IxyF7ogdWYhMCSMoRE0my7HxtGJ
         02vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mlF6HO6o81QnTlpWAW+FlcP9DvIspnjBxpuCgMSKncs=;
        b=hlF+tyygj8yUXcoTfj55i1+SPzFK+lxciKqJm9PuEsgeAQcmDXEAgDY+8Zuip7pSS0
         0fTQjy0f556gaR0ivtvSKHhODWBwm76/WV+QYynJMmjwa2c0LK7NJ60tS6yZ5od5cUm/
         y5iub+7z6NAskzfK8NcmfvCOuGHyiG7KtCeSGkk97y3olRf29LBf+uoiTdUCeWUvBzWS
         TCFvOBpDsqzO8mTpKYFF1hItz5AW1Hg1QpGC351IRZMtUjW+qMaQdR9aZICOnnEiixHO
         GfxhbpB0BF4FQi/Y1EBMaUTvSqc1OgudFZSYwtl6m+gOUmNavOYqFa0CYUJww//1qyHX
         bCCg==
X-Gm-Message-State: AFqh2kriC6ykupSqob1UIE7vEUdqssKimW5v8sGM4PbTBJg4bCkgVSi6
	HBadSne0nURJslJMO9S6N+LgX0Jsatsl1Q==
X-Google-Smtp-Source: AMrXdXs9qAQeRuGaPhtyCg6qyaZR9J+QKGufID+O4EWlr3+gOXId35yDtp4s9RsN2PfmQO++BrFpdA==
X-Received: by 2002:a05:6000:1a41:b0:24b:b74d:8012 with SMTP id t1-20020a0560001a4100b0024bb74d8012mr29672312wry.18.1672892727065;
        Wed, 04 Jan 2023 20:25:27 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r13-20020adfa14d000000b002779dab8d85sm32236953wrr.8.2023.01.04.20.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 20:25:26 -0800 (PST)
Date: Thu, 5 Jan 2023 07:25:23 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Jan Kara <jack@suse.cz>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jack-fs:for_next 31/33] fs/udf/file.c:177 udf_file_write_iter()
 warn: inconsistent returns '&iinfo->i_data_sem'.
Message-ID: <202301050355.Zcimjj6d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230105042523.pRrsl-v-zGoBamxfA6UAOft7BT4MV4gFDz9C5N0Fis4@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git for_next
head:   e86812bfac97e23c9ad9e607c370c63b2e5b4722
commit: 16919375dca0b1769b7ac956c0c492fbed476463 [31/33] udf: Do not update file length for failed writes to inline files
config: parisc-randconfig-m041-20230102
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
fs/udf/file.c:177 udf_file_write_iter() warn: inconsistent returns '&iinfo->i_data_sem'.

vim +177 fs/udf/file.c

d4637bc18f3bf8 Al Viro           2014-04-03  137  static ssize_t udf_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
^1da177e4c3f41 Linus Torvalds    2005-04-16  138  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  139  	ssize_t retval;
543ade1fc901db Badari Pulavarty  2006-09-30  140  	struct file *file = iocb->ki_filp;
496ad9aa8ef448 Al Viro           2013-01-23  141  	struct inode *inode = file_inode(file);
48d6d8ff7dca80 Marcin Slusarz    2008-02-08  142  	struct udf_inode_info *iinfo = UDF_I(inode);
165f1a6e300d5a Al Viro           2015-04-07  143  	int err;
^1da177e4c3f41 Linus Torvalds    2005-04-16  144  
5955102c9984fa Al Viro           2016-01-22  145  	inode_lock(inode);
165f1a6e300d5a Al Viro           2015-04-07  146  
3309dd04cbcd2c Al Viro           2015-04-09  147  	retval = generic_write_checks(iocb, from);
3309dd04cbcd2c Al Viro           2015-04-09  148  	if (retval <= 0)
165f1a6e300d5a Al Viro           2015-04-07  149  		goto out;
165f1a6e300d5a Al Viro           2015-04-07  150  
8754a3f718f08d Jan Kara          2010-11-16  151  	down_write(&iinfo->i_data_sem);
16919375dca0b1 Jan Kara          2023-01-02  152  	if (iinfo->i_alloc_type == ICBTAG_FLAG_AD_IN_ICB &&
16919375dca0b1 Jan Kara          2023-01-02  153  	    inode->i_sb->s_blocksize < (udf_file_entry_alloc_offset(inode) +
16919375dca0b1 Jan Kara          2023-01-02  154  				 iocb->ki_pos + iov_iter_count(from))) {
7e49b6f2480cb9 Jan Kara          2010-10-22  155  		err = udf_expand_file_adinicb(inode);
7e49b6f2480cb9 Jan Kara          2010-10-22  156  		if (err) {
5955102c9984fa Al Viro           2016-01-22  157  			inode_unlock(inode);
^1da177e4c3f41 Linus Torvalds    2005-04-16  158  			udf_debug("udf_expand_adinicb: err=%d\n", err);
^1da177e4c3f41 Linus Torvalds    2005-04-16  159  			return err;

up_write(&iinfo->i_data_sem);?

^1da177e4c3f41 Linus Torvalds    2005-04-16  160  		}
d2eb8c359309ec Jan Kara          2011-12-10  161  	} else
8754a3f718f08d Jan Kara          2010-11-16  162  		up_write(&iinfo->i_data_sem);
^1da177e4c3f41 Linus Torvalds    2005-04-16  163  
d4637bc18f3bf8 Al Viro           2014-04-03  164  	retval = __generic_file_write_iter(iocb, from);
5f380c7fa7e01f Al Viro           2015-04-07  165  out:
16919375dca0b1 Jan Kara          2023-01-02  166  	down_write(&iinfo->i_data_sem);
16919375dca0b1 Jan Kara          2023-01-02  167  	if (iinfo->i_alloc_type == ICBTAG_FLAG_AD_IN_ICB && retval > 0)
16919375dca0b1 Jan Kara          2023-01-02  168  		iinfo->i_lenAlloc = inode->i_size;
16919375dca0b1 Jan Kara          2023-01-02  169  	up_write(&iinfo->i_data_sem);
5955102c9984fa Al Viro           2016-01-22  170  	inode_unlock(inode);
09ebb17ab476b6 Jan Kara          2014-02-18  171  
09ebb17ab476b6 Jan Kara          2014-02-18  172  	if (retval > 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  173  		mark_inode_dirty(inode);
e259221763a404 Christoph Hellwig 2016-04-07  174  		retval = generic_write_sync(iocb, retval);
09ebb17ab476b6 Jan Kara          2014-02-18  175  	}
28de7948a89676 Cyrill Gorcunov   2007-07-21  176  
^1da177e4c3f41 Linus Torvalds    2005-04-16 @177  	return retval;
^1da177e4c3f41 Linus Torvalds    2005-04-16  178  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

