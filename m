Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DD97485
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Jul 2023 07:52:47 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3fc02a92dcfso14505205e9.0
        for <oe-kbuild@lists.linux.dev>; Fri, 14 Jul 2023 00:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689321165; x=1691913165;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EBCR5YE3hkj8TXxgf5IxSnNoKQxdKTi1pthS2vt7w2k=;
        b=g0WxwttA0CE+Gf9T53Xgr8Y1D8t284SvSSPen1BC8DO3ksg6l503SjZYUErV6ePwRN
         ZhuL1I3p3VTF5t9g1kF2qwJvGpthwAut2Ap+IPl0ItlUs00b1iOi7T5zf2YB4I598loW
         nX6q79q4Wrh4Lx1g3TVyTLVNU6E5tRI7U5M1YDgIbnIIMVDMuRVJJhpmXUSnKquYckHR
         FaL2GHRSPhPksG0THrXPgvi6u0jqjHpwBlQWlRB1+iA6Lx070ILKZTJtc7T71cX3vtPa
         E54H5k/aOeg03HmsJ3oK0NGbMZu0yu9CdGFJz/AdyZnC1LX3gtj6+TH0Qybr3o+PnhnY
         GxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689321165; x=1691913165;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EBCR5YE3hkj8TXxgf5IxSnNoKQxdKTi1pthS2vt7w2k=;
        b=j5947TveysPf8+hBDNMDS9DNRGc+t2yiooxKI9k2hcQWJlZFiKVu11U7IRromNlDGC
         FBJA0v3+Z7UYD3C7LCW3YDpvFfMCOXadoXFPwWJ0VCyEGAgdlmbjLlqZ9GBZ/bj0pX+/
         W9rbwkV3d1mESEo7y48XLraVXQa6lJZllBUSqiwqdph16ogtWw/c9wSu6doUdAhvzsUK
         XKtrMLZZ/kSgaToZ00uiToxdJDgMYTWO0XVzrl5tP5DsmGDY1ylKVfpy2WiEEqqVuYBu
         +6A46WqqvBMForoVB85fr97ozVIbDF8gCDHK1lZmG/Akxp9juZyVVUIXJDzsoZSpjFLa
         JrLg==
X-Gm-Message-State: ABy/qLZemGkRAz2mGOXWZf+cM90XPp6Wsu/49rxKOt6r/iSx/seSQ6zW
	xKleAV0OaV6tdLQ23ZyZiupPJcgabZKYFFgTWac=
X-Google-Smtp-Source: APBJJlFlOsFcqh2FMMAPPnUqu6WVf+6P5sLcIzSMaCH1yjAvQ4nXrAe5sZOMAUzTtsU/8XoXdYMZbg==
X-Received: by 2002:a7b:c84a:0:b0:3fa:96ae:fd78 with SMTP id c10-20020a7bc84a000000b003fa96aefd78mr3440449wml.29.1689321164671;
        Fri, 14 Jul 2023 00:52:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k4-20020a056000004400b00314326c91e2sm10136641wrx.28.2023.07.14.00.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 00:52:42 -0700 (PDT)
Date: Fri, 14 Jul 2023 10:52:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Edward Lo <loyuantsung@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Subject: fs/ntfs3/xattr.c:120 ntfs_read_ea() warn: missing unwind goto?
Message-ID: <45669af5-abe7-4adf-8c0a-fff50e0049af@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eb26cbb1a754ccde5d4d74527dad5ba051808fad
commit: c9db0ff04649aa0b45f497183c957fe260f229f6 fs/ntfs3: Return error for inconsistent extended attributes
config: x86_64-randconfig-m001-20230713 (https://download.01.org/0day-ci/archive/20230714/202307140548.oJyBUCnj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307140548.oJyBUCnj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202307140548.oJyBUCnj-lkp@intel.com/

smatch warnings:
fs/ntfs3/xattr.c:120 ntfs_read_ea() warn: missing unwind goto?

vim +120 fs/ntfs3/xattr.c

be71b5cba2e648 Konstantin Komarov 2021-08-13   73  static int ntfs_read_ea(struct ntfs_inode *ni, struct EA_FULL **ea,
be71b5cba2e648 Konstantin Komarov 2021-08-13   74  			size_t add_bytes, const struct EA_INFO **info)
be71b5cba2e648 Konstantin Komarov 2021-08-13   75  {
0e8235d28f3a0e Konstantin Komarov 2022-10-10   76  	int err = -EINVAL;
cff32466bf851b Konstantin Komarov 2021-09-24   77  	struct ntfs_sb_info *sbi = ni->mi.sbi;
be71b5cba2e648 Konstantin Komarov 2021-08-13   78  	struct ATTR_LIST_ENTRY *le = NULL;
be71b5cba2e648 Konstantin Komarov 2021-08-13   79  	struct ATTRIB *attr_info, *attr_ea;
be71b5cba2e648 Konstantin Komarov 2021-08-13   80  	void *ea_p;
0e8235d28f3a0e Konstantin Komarov 2022-10-10   81  	u32 size, off, ea_size;
be71b5cba2e648 Konstantin Komarov 2021-08-13   82  
be71b5cba2e648 Konstantin Komarov 2021-08-13   83  	static_assert(le32_to_cpu(ATTR_EA_INFO) < le32_to_cpu(ATTR_EA));
be71b5cba2e648 Konstantin Komarov 2021-08-13   84  
be71b5cba2e648 Konstantin Komarov 2021-08-13   85  	*ea = NULL;
be71b5cba2e648 Konstantin Komarov 2021-08-13   86  	*info = NULL;
be71b5cba2e648 Konstantin Komarov 2021-08-13   87  
be71b5cba2e648 Konstantin Komarov 2021-08-13   88  	attr_info =
be71b5cba2e648 Konstantin Komarov 2021-08-13   89  		ni_find_attr(ni, NULL, &le, ATTR_EA_INFO, NULL, 0, NULL, NULL);
be71b5cba2e648 Konstantin Komarov 2021-08-13   90  	attr_ea =
be71b5cba2e648 Konstantin Komarov 2021-08-13   91  		ni_find_attr(ni, attr_info, &le, ATTR_EA, NULL, 0, NULL, NULL);
be71b5cba2e648 Konstantin Komarov 2021-08-13   92  
be71b5cba2e648 Konstantin Komarov 2021-08-13   93  	if (!attr_ea || !attr_info)
be71b5cba2e648 Konstantin Komarov 2021-08-13   94  		return 0;
be71b5cba2e648 Konstantin Komarov 2021-08-13   95  
be71b5cba2e648 Konstantin Komarov 2021-08-13   96  	*info = resident_data_ex(attr_info, sizeof(struct EA_INFO));
be71b5cba2e648 Konstantin Komarov 2021-08-13   97  	if (!*info)
0e8235d28f3a0e Konstantin Komarov 2022-10-10   98  		goto out;
be71b5cba2e648 Konstantin Komarov 2021-08-13   99  
e8b8e97f91b80f Kari Argillander   2021-08-03  100  	/* Check Ea limit. */
be71b5cba2e648 Konstantin Komarov 2021-08-13  101  	size = le32_to_cpu((*info)->size);
0e8235d28f3a0e Konstantin Komarov 2022-10-10  102  	if (size > sbi->ea_max_size) {
0e8235d28f3a0e Konstantin Komarov 2022-10-10  103  		err = -EFBIG;
0e8235d28f3a0e Konstantin Komarov 2022-10-10  104  		goto out;
0e8235d28f3a0e Konstantin Komarov 2022-10-10  105  	}
be71b5cba2e648 Konstantin Komarov 2021-08-13  106  
0e8235d28f3a0e Konstantin Komarov 2022-10-10  107  	if (attr_size(attr_ea) > sbi->ea_max_size) {
0e8235d28f3a0e Konstantin Komarov 2022-10-10  108  		err = -EFBIG;
0e8235d28f3a0e Konstantin Komarov 2022-10-10  109  		goto out;
0e8235d28f3a0e Konstantin Komarov 2022-10-10  110  	}
be71b5cba2e648 Konstantin Komarov 2021-08-13  111  
0e8235d28f3a0e Konstantin Komarov 2022-10-10  112  	if (!size) {
0e8235d28f3a0e Konstantin Komarov 2022-10-10  113  		/* EA info persists, but xattr is empty. Looks like EA problem. */
0e8235d28f3a0e Konstantin Komarov 2022-10-10  114  		goto out;
0e8235d28f3a0e Konstantin Komarov 2022-10-10  115  	}
be71b5cba2e648 Konstantin Komarov 2021-08-13  116  
e8b8e97f91b80f Kari Argillander   2021-08-03  117  	/* Allocate memory for packed Ea. */
e001e608693906 Dan Carpenter      2022-09-12  118  	ea_p = kmalloc(size_add(size, add_bytes), GFP_NOFS);
be71b5cba2e648 Konstantin Komarov 2021-08-13  119  	if (!ea_p)
be71b5cba2e648 Konstantin Komarov 2021-08-13 @120  		return -ENOMEM;

Should this be err = -ENOMEM, goto out?

be71b5cba2e648 Konstantin Komarov 2021-08-13  121  
0e8235d28f3a0e Konstantin Komarov 2022-10-10  122  	if (attr_ea->non_res) {
be71b5cba2e648 Konstantin Komarov 2021-08-13  123  		struct runs_tree run;
be71b5cba2e648 Konstantin Komarov 2021-08-13  124  
be71b5cba2e648 Konstantin Komarov 2021-08-13  125  		run_init(&run);
be71b5cba2e648 Konstantin Komarov 2021-08-13  126  
42f86b1226a42b Konstantin Komarov 2022-05-13  127  		err = attr_load_runs_range(ni, ATTR_EA, NULL, 0, &run, 0, size);
be71b5cba2e648 Konstantin Komarov 2021-08-13  128  		if (!err)
cff32466bf851b Konstantin Komarov 2021-09-24  129  			err = ntfs_read_run_nb(sbi, &run, 0, ea_p, size, NULL);
be71b5cba2e648 Konstantin Komarov 2021-08-13  130  		run_close(&run);
be71b5cba2e648 Konstantin Komarov 2021-08-13  131  
be71b5cba2e648 Konstantin Komarov 2021-08-13  132  		if (err)
0e8235d28f3a0e Konstantin Komarov 2022-10-10  133  			goto out1;
be71b5cba2e648 Konstantin Komarov 2021-08-13  134  	} else {
be71b5cba2e648 Konstantin Komarov 2021-08-13  135  		void *p = resident_data_ex(attr_ea, size);
be71b5cba2e648 Konstantin Komarov 2021-08-13  136  
0e8235d28f3a0e Konstantin Komarov 2022-10-10  137  		if (!p)
0e8235d28f3a0e Konstantin Komarov 2022-10-10  138  			goto out1;
be71b5cba2e648 Konstantin Komarov 2021-08-13  139  		memcpy(ea_p, p, size);
be71b5cba2e648 Konstantin Komarov 2021-08-13  140  	}
be71b5cba2e648 Konstantin Komarov 2021-08-13  141  
be71b5cba2e648 Konstantin Komarov 2021-08-13  142  	memset(Add2Ptr(ea_p, size), 0, add_bytes);
0e8235d28f3a0e Konstantin Komarov 2022-10-10  143  
c9db0ff04649aa Edward Lo          2023-03-17  144  	err = -EINVAL;
0e8235d28f3a0e Konstantin Komarov 2022-10-10  145  	/* Check all attributes for consistency. */
0e8235d28f3a0e Konstantin Komarov 2022-10-10  146  	for (off = 0; off < size; off += ea_size) {
0e8235d28f3a0e Konstantin Komarov 2022-10-10  147  		const struct EA_FULL *ef = Add2Ptr(ea_p, off);
0e8235d28f3a0e Konstantin Komarov 2022-10-10  148  		u32 bytes = size - off;
0e8235d28f3a0e Konstantin Komarov 2022-10-10  149  
0e8235d28f3a0e Konstantin Komarov 2022-10-10  150  		/* Check if we can use field ea->size. */
0e8235d28f3a0e Konstantin Komarov 2022-10-10  151  		if (bytes < sizeof(ef->size))
0e8235d28f3a0e Konstantin Komarov 2022-10-10  152  			goto out1;
0e8235d28f3a0e Konstantin Komarov 2022-10-10  153  
0e8235d28f3a0e Konstantin Komarov 2022-10-10  154  		if (ef->size) {
0e8235d28f3a0e Konstantin Komarov 2022-10-10  155  			ea_size = le32_to_cpu(ef->size);
0e8235d28f3a0e Konstantin Komarov 2022-10-10  156  			if (ea_size > bytes)
0e8235d28f3a0e Konstantin Komarov 2022-10-10  157  				goto out1;
0e8235d28f3a0e Konstantin Komarov 2022-10-10  158  			continue;
0e8235d28f3a0e Konstantin Komarov 2022-10-10  159  		}
0e8235d28f3a0e Konstantin Komarov 2022-10-10  160  
0e8235d28f3a0e Konstantin Komarov 2022-10-10  161  		/* Check if we can use fields ef->name_len and ef->elength. */
0e8235d28f3a0e Konstantin Komarov 2022-10-10  162  		if (bytes < offsetof(struct EA_FULL, name))
0e8235d28f3a0e Konstantin Komarov 2022-10-10  163  			goto out1;
0e8235d28f3a0e Konstantin Komarov 2022-10-10  164  
0e8235d28f3a0e Konstantin Komarov 2022-10-10  165  		ea_size = ALIGN(struct_size(ef, name,
0e8235d28f3a0e Konstantin Komarov 2022-10-10  166  					    1 + ef->name_len +
0e8235d28f3a0e Konstantin Komarov 2022-10-10  167  						    le16_to_cpu(ef->elength)),
0e8235d28f3a0e Konstantin Komarov 2022-10-10  168  				4);
0e8235d28f3a0e Konstantin Komarov 2022-10-10  169  		if (ea_size > bytes)
0e8235d28f3a0e Konstantin Komarov 2022-10-10  170  			goto out1;
0e8235d28f3a0e Konstantin Komarov 2022-10-10  171  	}
0e8235d28f3a0e Konstantin Komarov 2022-10-10  172  
be71b5cba2e648 Konstantin Komarov 2021-08-13  173  	*ea = ea_p;
be71b5cba2e648 Konstantin Komarov 2021-08-13  174  	return 0;
be71b5cba2e648 Konstantin Komarov 2021-08-13  175  
0e8235d28f3a0e Konstantin Komarov 2022-10-10  176  out1:
195c52bdd5d5ec Kari Argillander   2021-08-24  177  	kfree(ea_p);
0e8235d28f3a0e Konstantin Komarov 2022-10-10  178  out:
0e8235d28f3a0e Konstantin Komarov 2022-10-10  179  	ntfs_set_state(sbi, NTFS_DIRTY_DIRTY);
be71b5cba2e648 Konstantin Komarov 2021-08-13  180  	return err;
be71b5cba2e648 Konstantin Komarov 2021-08-13  181  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

