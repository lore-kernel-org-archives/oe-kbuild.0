Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66365ED0
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Aug 2023 04:55:04 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3fe4ad22eb0so4173015e9.3
        for <oe-kbuild@lists.linux.dev>; Wed, 09 Aug 2023 21:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691643302; x=1692248102;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z/BqMxGg389X38v6j4a//mKYYTt3ExR7xQzbT0BeY8w=;
        b=H6B6mgbHIKoTBYU0Eo0YA/j1DL0rpxjTSjeb93lYYOHrsLoNTEsgOFGNP79OX+2cbT
         VhKh4IVDxmMMFGSs7t49Etyze/LJ+zY8Xg0Ar0IVwJo6Mih7A8Egs57eWRZEcHTgYUai
         xSMZRLanE/cIR7sCOjYx0jMAAzXKpxFv6LTltf4ts8UhxaJAj2T0YUbRT/vZ/AIQYHev
         vVZqVortNQl2ZUMTAZAnFm1lmIyaHYx0RwN/H+k8dlfjItuzhBtb7eMBh4jYf7a0Dejo
         uKv9Cuu7u4Bg7WgbujMmca37xjRbuOVaU0AM8AG75W6FPDEsrRq7ns6GxDNzXvQxsyxS
         3s4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691643302; x=1692248102;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z/BqMxGg389X38v6j4a//mKYYTt3ExR7xQzbT0BeY8w=;
        b=I8bbKutr+Qy7DjHC9dxGyNNGDNS+mzzymuzokEFs0H7u1SRbYnApBbznkLY0jQyFMr
         K4GelId+8TuQ5BMDC3JpDE0LYm7RdafDxzJu9+O50CSQmmAUS21Y9vqTEjTGKHruQeaG
         N1oix9a2r8IZtxPicQUfQOLb9QJZFZhhhTqMmG/z5GKWkkVHDApffp52JoOy3mUN+Cio
         Z1YQlu7KygF+SRdKTINspahwyZDH/2PtWDTFjJ6fLUKW6/qWpGP+/2OYcjlZS8gheqOT
         IdrQ9N0/8JZGsC8yfYMUGYdRwZ8YSxb6OHJBGCSpNSeY6oyxeh8SntYSrYREMXvXrA3A
         +UNA==
X-Gm-Message-State: AOJu0YxdNC6WIicNokXO+JTGnYu7ku29MX1CWp+roBfEC/CFUe1gZP66
	N6pM/ab0GSL/zsawayJHrbmyx3mJoxAG5Y7K+IQ=
X-Google-Smtp-Source: AGHT+IH87AIZ4KmUJm/7yiOqmq3LkAYPiScuuajvyaDb9s2Xp8WugLB0vKU1gyi4ht4RdN8VNipR0g==
X-Received: by 2002:a1c:7314:0:b0:3f6:9634:c8d6 with SMTP id d20-20020a1c7314000000b003f69634c8d6mr975049wmb.18.1691643301721;
        Wed, 09 Aug 2023 21:55:01 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 24-20020a05600c029800b003fe2397c17fsm3689328wmk.17.2023.08.09.21.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 21:55:01 -0700 (PDT)
Date: Thu, 10 Aug 2023 07:54:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Sweet Tea Dorminy <sweettea-kernel@dorminy.me>,
	Chris Mason <chris.mason@fusionio.com>,
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@meta.com,
	linux-btrfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
Subject: Re: [PATCH v6 8/8] fscrypt: make prepared keys record their type
Message-ID: <87315be8-16b4-4d83-874f-93be91df4790@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64c47243cea5a8eca15538b51f88c0a6d53799cf.1691505830.git.sweettea-kernel@dorminy.me>

Hi Sweet,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Sweet-Tea-Dorminy/fscrypt-move-inline-crypt-decision-to-info-setup/20230809-030251
base:   54d2161835d828a9663f548f61d1d9c3d3482122
patch link:    https://lore.kernel.org/r/64c47243cea5a8eca15538b51f88c0a6d53799cf.1691505830.git.sweettea-kernel%40dorminy.me
patch subject: [PATCH v6 8/8] fscrypt: make prepared keys record their type
config: x86_64-randconfig-m001-20230808 (https://download.01.org/0day-ci/archive/20230809/202308092324.d0OCNA1O-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308092324.d0OCNA1O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202308092324.d0OCNA1O-lkp@intel.com/

smatch warnings:
fs/crypto/keysetup.c:300 setup_new_mode_prepared_key() warn: inconsistent returns '&fscrypt_mode_key_setup_mutex'.

vim +300 fs/crypto/keysetup.c

a03cf25a20f748 Sweet Tea Dorminy 2023-08-08  238  static int setup_new_mode_prepared_key(struct fscrypt_master_key *mk,
a03cf25a20f748 Sweet Tea Dorminy 2023-08-08  239  				       struct fscrypt_prepared_key *prep_key,
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  240  				       const struct fscrypt_info *ci)
5dae460c2292db Eric Biggers      2019-08-04  241  {
b103fb7653fff0 Eric Biggers      2019-10-24  242  	const struct inode *inode = ci->ci_inode;
b103fb7653fff0 Eric Biggers      2019-10-24  243  	const struct super_block *sb = inode->i_sb;
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  244  	unsigned int policy_flags = fscrypt_policy_flags(&ci->ci_policy);
5dae460c2292db Eric Biggers      2019-08-04  245  	struct fscrypt_mode *mode = ci->ci_mode;
85af90e57ce969 Eric Biggers      2019-12-09  246  	const u8 mode_num = mode - fscrypt_modes;
5dae460c2292db Eric Biggers      2019-08-04  247  	u8 mode_key[FSCRYPT_MAX_KEY_SIZE];
b103fb7653fff0 Eric Biggers      2019-10-24  248  	u8 hkdf_info[sizeof(mode_num) + sizeof(sb->s_uuid)];
b103fb7653fff0 Eric Biggers      2019-10-24  249  	unsigned int hkdf_infolen = 0;
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  250  	u8 hkdf_context = 0;
a03cf25a20f748 Sweet Tea Dorminy 2023-08-08  251  	int err = 0;
e3b1078bedd323 Eric Biggers      2020-05-15  252  
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  253  	switch (policy_flags & FSCRYPT_POLICY_FLAGS_KEY_MASK) {
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  254  	case FSCRYPT_POLICY_FLAG_DIRECT_KEY:
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  255  		hkdf_context = HKDF_CONTEXT_DIRECT_KEY;
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  256  		break;
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  257  	case FSCRYPT_POLICY_FLAG_IV_INO_LBLK_64:
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  258  		hkdf_context = HKDF_CONTEXT_IV_INO_LBLK_64_KEY;
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  259  		break;
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  260  	case FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32:
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  261  		hkdf_context = HKDF_CONTEXT_IV_INO_LBLK_32_KEY;
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  262  		break;
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  263  	}
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  264  
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  265  	/*
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  266  	 * For DIRECT_KEY policies: instead of deriving per-file encryption
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  267  	 * keys, the per-file nonce will be included in all the IVs.  But
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  268  	 * unlike v1 policies, for v2 policies in this case we don't encrypt
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  269  	 * with the master key directly but rather derive a per-mode encryption
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  270  	 * key.  This ensures that the master key is consistently used only for
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  271  	 * HKDF, avoiding key reuse issues.
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  272  	 *
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  273  	 * For IV_INO_LBLK policies: encryption keys are derived from
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  274  	 * (master_key, mode_num, filesystem_uuid), and inode number is
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  275  	 * included in the IVs.  This format is optimized for use with inline
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  276  	 * encryption hardware compliant with the UFS standard.
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  277  	 */
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  278  
e3b1078bedd323 Eric Biggers      2020-05-15  279  	mutex_lock(&fscrypt_mode_key_setup_mutex);
e3b1078bedd323 Eric Biggers      2020-05-15  280  
5fee36095cda45 Satya Tangirala   2020-07-02  281  	if (fscrypt_is_key_prepared(prep_key, ci))
a03cf25a20f748 Sweet Tea Dorminy 2023-08-08  282  		goto out_unlock;
5dae460c2292db Eric Biggers      2019-08-04  283  
5dae460c2292db Eric Biggers      2019-08-04  284  	BUILD_BUG_ON(sizeof(mode_num) != 1);
b103fb7653fff0 Eric Biggers      2019-10-24  285  	BUILD_BUG_ON(sizeof(sb->s_uuid) != 16);
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  286  	BUILD_BUG_ON(sizeof(hkdf_info) != MAX_MODE_KEY_HKDF_INFO_SIZE);
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  287  	hkdf_infolen = fill_hkdf_info_for_mode_key(ci, hkdf_info);
78265b33a56a52 Sweet Tea Dorminy 2023-08-08  288  
5dae460c2292db Eric Biggers      2019-08-04  289  	err = fscrypt_hkdf_expand(&mk->mk_secret.hkdf,
b103fb7653fff0 Eric Biggers      2019-10-24  290  				  hkdf_context, hkdf_info, hkdf_infolen,
5dae460c2292db Eric Biggers      2019-08-04  291  				  mode_key, mode->keysize);
5dae460c2292db Eric Biggers      2019-08-04  292  	if (err)
3bd6d42474f3a9 Sweet Tea Dorminy 2023-08-08  293  		return err;

Originally this was goto out_unlock;  Not sure why it was changed to a
direct return.

3bd6d42474f3a9 Sweet Tea Dorminy 2023-08-08  294  	prep_key->type = FSCRYPT_KEY_MASTER_KEY;
5fee36095cda45 Satya Tangirala   2020-07-02  295  	err = fscrypt_prepare_key(prep_key, mode_key, ci);
5dae460c2292db Eric Biggers      2019-08-04  296  	memzero_explicit(mode_key, mode->keysize);
a03cf25a20f748 Sweet Tea Dorminy 2023-08-08  297  
e3b1078bedd323 Eric Biggers      2020-05-15  298  out_unlock:
e3b1078bedd323 Eric Biggers      2020-05-15  299  	mutex_unlock(&fscrypt_mode_key_setup_mutex);
e3b1078bedd323 Eric Biggers      2020-05-15 @300  	return err;
5dae460c2292db Eric Biggers      2019-08-04  301  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

