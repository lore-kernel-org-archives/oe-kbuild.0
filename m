Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C461119BCC
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Aug 2023 15:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691595161; x=1723131161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s5Ojx9R4XMWAOUp74mZyEdcj5KuNm3X+UltH7szqigo=;
  b=BFtCB0pFn/yOmUMnbesQOg2aXeTU5hATCh+R6tzFeWiKflTlsYxemTWH
   dOP57hvZjnedlgSchkfou+RXiPwQi1/55OzSt/Ux38b8oyTfyeK1VPaWx
   qHQRpVss6jPgr+odJO8KB+xVZLOhBT0zq8M8eX6LF6gBZNBukvW2D71Id
   TK3T6hGaHT5ov9vB8YzOOMX9h+d7mR3KMOVTqSEdJYukHh/m7+W8N7DyT
   9bUuVzTux6o+kSN/kiasoAt6aJOasQ40pAqobiP/C2BdSzkdiqvvvo0vf
   ssGvf/JFOcIVbkwWZRfh+0USXQ+E7Kl8hsKSJz/2aDdAR5TPBx9H+MPLZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="368614074"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="368614074"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 08:32:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="681726261"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="681726261"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 Aug 2023 08:32:36 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTlAq-0006C8-0I;
	Wed, 09 Aug 2023 15:32:36 +0000
Date: Wed, 9 Aug 2023 23:32:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v6 8/8] fscrypt: make prepared keys record their type
Message-ID: <202308092324.d0OCNA1O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <64c47243cea5a8eca15538b51f88c0a6d53799cf.1691505830.git.sweettea-kernel@dorminy.me>
References: <64c47243cea5a8eca15538b51f88c0a6d53799cf.1691505830.git.sweettea-kernel@dorminy.me>
TO: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
TO: Chris Mason <chris.mason@fusionio.com>
TO: Josef Bacik <josef@toxicpanda.com>
TO: David Sterba <dsterba@suse.com>
TO: "Theodore Y . Ts'o" <tytso@mit.edu>
TO: Jaegeuk Kim <jaegeuk@kernel.org>
TO: kernel-team@meta.com
TO: linux-btrfs@vger.kernel.org
TO: linux-fscrypt@vger.kernel.org
TO: Eric Biggers <ebiggers@kernel.org>
CC: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>

Hi Sweet,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 54d2161835d828a9663f548f61d1d9c3d3482122]

url:    https://github.com/intel-lab-lkp/linux/commits/Sweet-Tea-Dorminy/fscrypt-move-inline-crypt-decision-to-info-setup/20230809-030251
base:   54d2161835d828a9663f548f61d1d9c3d3482122
patch link:    https://lore.kernel.org/r/64c47243cea5a8eca15538b51f88c0a6d53799cf.1691505830.git.sweettea-kernel%40dorminy.me
patch subject: [PATCH v6 8/8] fscrypt: make prepared keys record their type
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: x86_64-randconfig-m001-20230808 (https://download.01.org/0day-ci/archive/20230809/202308092324.d0OCNA1O-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308092324.d0OCNA1O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308092324.d0OCNA1O-lkp@intel.com/

smatch warnings:
fs/crypto/keysetup.c:300 setup_new_mode_prepared_key() warn: inconsistent returns '&fscrypt_mode_key_setup_mutex'.

vim +300 fs/crypto/keysetup.c

78265b33a56a52 Sweet Tea Dorminy 2023-08-08  237  
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
3bd6d42474f3a9 Sweet Tea Dorminy 2023-08-08  294  	prep_key->type = FSCRYPT_KEY_MASTER_KEY;
5fee36095cda45 Satya Tangirala   2020-07-02  295  	err = fscrypt_prepare_key(prep_key, mode_key, ci);
5dae460c2292db Eric Biggers      2019-08-04  296  	memzero_explicit(mode_key, mode->keysize);
a03cf25a20f748 Sweet Tea Dorminy 2023-08-08  297  
e3b1078bedd323 Eric Biggers      2020-05-15  298  out_unlock:
e3b1078bedd323 Eric Biggers      2020-05-15  299  	mutex_unlock(&fscrypt_mode_key_setup_mutex);
e3b1078bedd323 Eric Biggers      2020-05-15 @300  	return err;
5dae460c2292db Eric Biggers      2019-08-04  301  }
5dae460c2292db Eric Biggers      2019-08-04  302  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
