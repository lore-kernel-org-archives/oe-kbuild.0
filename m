Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E55836B;
	Wed,  4 Jan 2023 08:37:09 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id bk16so19000999wrb.11;
        Wed, 04 Jan 2023 00:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I7IsvyAIBM8fHGvfiisr8q3VV1hoGttoIus3r+xUD8A=;
        b=iYGaQz7EeP0SJVFka4ZJuMuywHalxo1T/4cWUgsWhbqIbnnXBYXmfrF4dzomUejUdS
         WGM+S0shVhYbFSqrlPvki/Dyqb/a2N1a3Ghy4Bca17YpyNQjV2/imDhPWdSzoFG+xfro
         L4ODmD7c86OCUGFxb/eXD4zNtyT1wcLzmBKfNCDaLUq/Hgtt+dGQdWkfk+bg2/y+yUpY
         SgholpRXXbrBZeu9RhRm48okk9AWqf3UsL+jbA6BpO4rPhnxkywM6QBAoQmh99ReKuzu
         uIKZQlzOTR4zV/eRq7CmNm+j+x6CHoGtMmFKCaF26qQ1Nb4shOi4xQ6uIR3UKyWI/kpo
         SlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I7IsvyAIBM8fHGvfiisr8q3VV1hoGttoIus3r+xUD8A=;
        b=TanafJcfhr8MT6eLp7T11fPeSQP3l9mT3lpt/c1Pl1SogrDPHvw8jlWrgCc/ZD1IMY
         bJ9OEQpiFlRtZHEBStx7APHpmWjSN6vNdCKOxkJvpiYCbQ8XQf2Mr5HvaAN2SZdWvFFb
         3DSuwPl28Qg6NTvQwIdKMemnJOgkOTn3Hqgx+TDOWUZnu7VS01TsOBSFH5uk/W7fQGlk
         ilBN6OBj4TesYjl1eEB3Gn2EGfufW9/IVCtqbgZ9XPbDCehVitFw/gUN+PI4vryxo2VL
         Q8vsN2IXYFWMYCMhDmzWDJOUhY+0Fx21wQzUgCuqzmq8N6RZNQaK3gegSj+YPqCEK8DM
         L2aw==
X-Gm-Message-State: AFqh2kpxYWHp/ItdC2HDDtzBnTaXGncDzixa9PlGWq0X+sWBQrjLD9El
	cVicw+OHjMKVdeQMvLtSoR6//s2uccJbJyMH
X-Google-Smtp-Source: AMrXdXtEaa06IzF53ZtnCUHbxkeoPZE+G8qdUJHdFxCuChLLO9KkG6YpBJZo1BD0DZEb8N+9vSJtKA==
X-Received: by 2002:a05:6000:1b03:b0:27c:1896:639c with SMTP id f3-20020a0560001b0300b0027c1896639cmr20220069wrz.45.1672821427479;
        Wed, 04 Jan 2023 00:37:07 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b2-20020adff242000000b0023662245d3csm33725803wrp.95.2023.01.04.00.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 00:37:07 -0800 (PST)
Date: Wed, 4 Jan 2023 11:37:01 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Sweet Tea Dorminy <sweettea-kernel@dorminy.me>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 04/17] fscrypt: factor out fscrypt_set_inode_info()
Message-ID: <202301032219.6equSd0D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fba20d354834b5b9f20c284b577381e5147692a0.1672547582.git.sweettea-kernel@dorminy.me>
Message-ID: <20230104083701.TrX_oMUX-5vx43JKEJ1EJA9ovPtm9i6UTYez4aNmSr8@z>

Hi Sweet,

url:    https://github.com/intel-lab-lkp/linux/commits/Sweet-Tea-Dorminy/fscrypt-factor-accessing-inode-i_crypt_info/20230101-130927
base:   b7af0635c87ff78d6bd523298ab7471f9ffd3ce5
patch link:    https://lore.kernel.org/r/fba20d354834b5b9f20c284b577381e5147692a0.1672547582.git.sweettea-kernel%40dorminy.me
patch subject: [RFC PATCH 04/17] fscrypt: factor out fscrypt_set_inode_info()
config: i386-randconfig-m021
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
fs/crypto/keysetup.c:593 fscrypt_setup_encryption_info() error: uninitialized symbol 'set_succeeded'.

vim +/set_succeeded +593 fs/crypto/keysetup.c

a992b20cd4ee36 fs/crypto/keysetup.c Eric Biggers      2020-09-16  550  static int
a992b20cd4ee36 fs/crypto/keysetup.c Eric Biggers      2020-09-16  551  fscrypt_setup_encryption_info(struct inode *inode,
a992b20cd4ee36 fs/crypto/keysetup.c Eric Biggers      2020-09-16  552  			      const union fscrypt_policy *policy,
a992b20cd4ee36 fs/crypto/keysetup.c Eric Biggers      2020-09-16  553  			      const u8 nonce[FSCRYPT_FILE_NONCE_SIZE],
a992b20cd4ee36 fs/crypto/keysetup.c Eric Biggers      2020-09-16  554  			      bool need_dirhash_key)
26bf3dc7e25b81 fs/f2fs/crypto_key.c Jaegeuk Kim       2015-05-19  555  {
0b81d077907269 fs/crypto/keyinfo.c  Jaegeuk Kim       2015-05-15  556  	struct fscrypt_info *crypt_info;
e1cc40e5d42acb fs/crypto/keyinfo.c  Eric Biggers      2018-05-18  557  	struct fscrypt_mode *mode;
d7e7b9af104c7b fs/crypto/keysetup.c Eric Biggers      2022-09-01  558  	struct fscrypt_master_key *mk = NULL;
0adda907f23df2 fs/f2fs/crypto_key.c Jaegeuk Kim       2015-04-21  559  	int res;
6da376f1c405a2 fs/crypto/keysetup.c Sweet Tea Dorminy 2023-01-01  560  	bool set_succeeded;
0adda907f23df2 fs/f2fs/crypto_key.c Jaegeuk Kim       2015-04-21  561  
f32d7ac20a5864 fs/crypto/keyinfo.c  David Gstir       2016-12-06  562  	res = fscrypt_initialize(inode->i_sb->s_cop->flags);
0adda907f23df2 fs/f2fs/crypto_key.c Jaegeuk Kim       2015-04-21  563  	if (res)
0adda907f23df2 fs/f2fs/crypto_key.c Jaegeuk Kim       2015-04-21  564  		return res;
0b81d077907269 fs/crypto/keyinfo.c  Jaegeuk Kim       2015-05-15  565  
9dad5feb49a5c3 fs/crypto/keysetup.c Eric Biggers      2020-09-16  566  	crypt_info = kmem_cache_zalloc(fscrypt_info_cachep, GFP_KERNEL);
0adda907f23df2 fs/f2fs/crypto_key.c Jaegeuk Kim       2015-04-21  567  	if (!crypt_info)
0adda907f23df2 fs/f2fs/crypto_key.c Jaegeuk Kim       2015-04-21  568  		return -ENOMEM;
0adda907f23df2 fs/f2fs/crypto_key.c Jaegeuk Kim       2015-04-21  569  
59dc6a8e1f534c fs/crypto/keyinfo.c  Eric Biggers      2019-08-04  570  	crypt_info->ci_inode = inode;
a992b20cd4ee36 fs/crypto/keysetup.c Eric Biggers      2020-09-16  571  	crypt_info->ci_policy = *policy;
a992b20cd4ee36 fs/crypto/keysetup.c Eric Biggers      2020-09-16  572  	memcpy(crypt_info->ci_nonce, nonce, FSCRYPT_FILE_NONCE_SIZE);
640778fbc97b36 fs/f2fs/crypto_key.c Jaegeuk Kim       2015-05-12  573  
5dae460c2292db fs/crypto/keysetup.c Eric Biggers      2019-08-04  574  	mode = select_encryption_mode(&crypt_info->ci_policy, inode);
e1cc40e5d42acb fs/crypto/keyinfo.c  Eric Biggers      2018-05-18  575  	if (IS_ERR(mode)) {
e1cc40e5d42acb fs/crypto/keyinfo.c  Eric Biggers      2018-05-18  576  		res = PTR_ERR(mode);
26bf3dc7e25b81 fs/f2fs/crypto_key.c Jaegeuk Kim       2015-05-19  577  		goto out;

set_succeeded not initialized on this path.

e1cc40e5d42acb fs/crypto/keyinfo.c  Eric Biggers      2018-05-18  578  	}
8094c3ceb21ad9 fs/crypto/keyinfo.c  Eric Biggers      2019-01-06  579  	WARN_ON(mode->ivsize > FSCRYPT_MAX_IV_SIZE);
8094c3ceb21ad9 fs/crypto/keyinfo.c  Eric Biggers      2019-01-06  580  	crypt_info->ci_mode = mode;
8f39850dffa9cb fs/crypto/keyinfo.c  Eric Biggers      2016-09-15  581  
d7e7b9af104c7b fs/crypto/keysetup.c Eric Biggers      2022-09-01  582  	res = setup_file_encryption_key(crypt_info, need_dirhash_key, &mk);
26bf3dc7e25b81 fs/f2fs/crypto_key.c Jaegeuk Kim       2015-05-19  583  	if (res)
26bf3dc7e25b81 fs/f2fs/crypto_key.c Jaegeuk Kim       2015-05-19  584  		goto out;
26bf3dc7e25b81 fs/f2fs/crypto_key.c Jaegeuk Kim       2015-05-19  585  
6da376f1c405a2 fs/crypto/keysetup.c Sweet Tea Dorminy 2023-01-01  586  	set_succeeded = fscrypt_set_inode_info(inode, crypt_info, mk);
b1c0ec3599f42a fs/crypto/keysetup.c Eric Biggers      2019-08-04  587  	res = 0;
0adda907f23df2 fs/f2fs/crypto_key.c Jaegeuk Kim       2015-04-21  588  out:
d7e7b9af104c7b fs/crypto/keysetup.c Eric Biggers      2022-09-01  589  	if (mk) {
d7e7b9af104c7b fs/crypto/keysetup.c Eric Biggers      2022-09-01  590  		up_read(&mk->mk_sem);
d7e7b9af104c7b fs/crypto/keysetup.c Eric Biggers      2022-09-01  591  		fscrypt_put_master_key(mk);
b1c0ec3599f42a fs/crypto/keysetup.c Eric Biggers      2019-08-04  592  	}
6da376f1c405a2 fs/crypto/keysetup.c Sweet Tea Dorminy 2023-01-01 @593  	if (!set_succeeded)
                                                                             ^^^^^^^^^^^^^


a992b20cd4ee36 fs/crypto/keysetup.c Eric Biggers      2020-09-16  594  		put_crypt_info(crypt_info);
a992b20cd4ee36 fs/crypto/keysetup.c Eric Biggers      2020-09-16  595  	return res;
a992b20cd4ee36 fs/crypto/keysetup.c Eric Biggers      2020-09-16  596  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

