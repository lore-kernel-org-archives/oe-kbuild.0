Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB4524A079
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Nov 2025 09:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762074535; cv=none; b=P1T1i4jwbg7eow92zxRA6NsxDmuPkTCBqxGES6gGfplSaQv3M2YBE/VGVRi4kxSrrfNI5ixMkoxOXB51rBg6XqpRm/MdRGPAsDdynRuZ3U/ZKvq+76xW3H+mryYU8Wuuw/e3nR6EGxeMbCtmCrxPNMqdjo8qY41TS+pVFiJouWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762074535; c=relaxed/simple;
	bh=7/D/9JuKlda0IizNfN3bJ+LCT/7NPYyYMDu6mmOz2tY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=YfxWyW/hMP+FVrPyr2VOyjjhBNmW8iiNDt/zeoGeKgkMXirFq/wXgwyp2PHXPivguYY8bngreCTX0u+L8pBuPGQtxhE7QwttmatrekRxa/pNzziOEKeu3AqtTh+cCcBtZZ4WJw3z4goCPOpruBjXkle2KEBfbcjm/G1oxJx6ZGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KxYMnSPK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KxYMnSPK"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-471191ac79dso39234935e9.3
        for <oe-kbuild@lists.linux.dev>; Sun, 02 Nov 2025 01:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762074531; x=1762679331; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gICqRIRyRxEMMN/HX8MILNkO7MD4631S+ctChFJDT7Q=;
        b=KxYMnSPK97kUEVYdd5d88YsalB6md+5yTAM7g+5bZiSOrXYVdjJgpdbN7ZnO3Ulw0v
         jdlkkj5m8LVMI9yn6MLXZLRgh1Sb+8QaLOiD6syYXk1w4+23vlpQO4cnR76PdtRfGs0X
         4l5a2OfTkkMWNSGhh7OzNTb1bIkiZQjYOrF7Qod/q1HX3AibjyNWGUPcSmOvA0fZ/7wZ
         maBom+0tyZGRv2UBLvHJ0w0ncXAIrRMsk3Ui32qRzYFX/NpkdPIRAI19P8i4TqWI7xae
         BJ2Nq/YUj9ega3JwZo/khuAnoloBrmVAX7cz6I4EQkuoi1UPu6HSOi8hfrYB/PHAUies
         9E1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762074531; x=1762679331;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gICqRIRyRxEMMN/HX8MILNkO7MD4631S+ctChFJDT7Q=;
        b=tZAhbTIKmA5cNV7Egd8xG6BGE6Vhu0VZbGwKvIKO1T3PRUlH9wV4zrIrXSxrYjcj+D
         g4VECnL+4cvYh1xoLpRwtnJmHvI7yXHDxiUpgHfhQlsXNyI+wSgow4DrrkL8SPQC540H
         anueIHOuyv1tT3oCo7tr2GVkZrzyA2QVcWFGfqH/yRSUmYoOSkqO0h/vqaECK6Ql401l
         vu140Y+s6YPaEMSXAIkb3rA2ohgxhSgc+fwdE1KnTZWHWWYUPi4xYiEAd07mEyqZXbDP
         FR9WzasIHbNJ1AQKPACIlHWGq/1m1f5lfFF8RnuOPeAvFw501Xx5ph7TSYnDjRQ43k3h
         OSug==
X-Gm-Message-State: AOJu0YxKticUAHVRulcNHjgMHx6CEBN1sBiQNPfQbvDuSBOXK2aAm9Ma
	8Qv3/Hlzh2POjfmkJfXvdqKkgqqrwFCkZ0UjJmdfRj8OoWr9Ppn9F9s1vFachG3KVDApn13MuSe
	q0IDl
X-Gm-Gg: ASbGncu6lQnmhIFZQgE6+6RQ8UHT91L63Tk5OWfzTFTsARRcq37cXMAPopeL/PoWvGZ
	lmOw36aYDmcIm1kmSkmMVI2opIMJlkdZ9IaO2ZngEvxGmyNTQHZqFKegtm8gFCX+KK8DOigG05c
	gyPGJRnwUcYZZZQ4qoKKctGBNQm3DG5vqIFkxlbq3zmQc/dk1RVccv16LPqtDLftBiizBi2lUAl
	qVfCe/hK+qGRW4492Y35xKWDS8LaZb8MetIx+6622WcQyIypbNqHYDaw2SmWCcBjWj6ZmrK3f0B
	VTb3U8NKluL2ZwJ97YcVRV6g4hGQTkOj/Xo3parLMNffhhvVKlITHiPA/8zw8KGMy14i1zjaXn0
	hhEIC1U5dWz5RxIrKvBrl7VruutoMz92olk8t3KfPi7FPTcPxDHemUyHm6GI2j3W//ovb/mbAwn
	s1oR8Ev8367CxBOs0h
X-Google-Smtp-Source: AGHT+IGn5bPwV56bsV2deYi9JT5okvhROQmNRKf5EUkUmao9tiHAn5dobVx2xgvTKyZJ700Wv08Crg==
X-Received: by 2002:a05:600c:6218:b0:475:dd53:6c06 with SMTP id 5b1f17b1804b1-477308ec45dmr82695135e9.40.1762074531098;
        Sun, 02 Nov 2025 01:08:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429c114be36sm13128018f8f.18.2025.11.02.01.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 01:08:50 -0800 (PST)
Date: Sun, 2 Nov 2025 12:08:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, NeilBrown <neilb@ownmail.net>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
	Chris Mason <chris.mason@fusionio.com>,
	David Sterba <dsterba@suse.com>,
	David Howells <dhowells@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Tyler Hicks <code@tyhicks.com>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Chuck Lever <chuck.lever@oracle.com>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>, Namjae Jeon <linkinjeon@kernel.org>,
	Steve French <smfrench@gmail.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Carlos Maiolino <cem@kernel.org>,
	John Johansen <john.johansen@canonical.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v4 04/14] VFS/nfsd/cachefiles/ovl: add start_creating()
 and end_creating()
Message-ID: <202511021406.Tv3dcpn5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029234353.1321957-5-neilb@ownmail.net>
Message-ID: <20251102090847.0m-Kmp-3G6ab0DL5_XQHFint8cKg1MSB2yk3zLiMvSc@z>

Hi NeilBrown,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/debugfs-rename-end_creating-to-debugfs_end_creating/20251030-075146
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20251029234353.1321957-5-neilb%40ownmail.net
patch subject: [PATCH v4 04/14] VFS/nfsd/cachefiles/ovl: add start_creating() and end_creating()
config: x86_64-randconfig-161-20251101 (https://download.01.org/0day-ci/archive/20251102/202511021406.Tv3dcpn5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511021406.Tv3dcpn5-lkp@intel.com/

smatch warnings:
fs/overlayfs/dir.c:130 ovl_whiteout() error: uninitialized symbol 'whiteout'.
fs/overlayfs/dir.c:130 ovl_whiteout() warn: passing zero to 'PTR_ERR'

vim +/whiteout +130 fs/overlayfs/dir.c

c21c839b8448dd Chengguang Xu     2020-04-24   97  static struct dentry *ovl_whiteout(struct ovl_fs *ofs)
e9be9d5e76e348 Miklos Szeredi    2014-10-24   98  {
e9be9d5e76e348 Miklos Szeredi    2014-10-24   99  	int err;
807b78b0fffc23 NeilBrown         2025-10-30  100  	struct dentry *whiteout, *link;
c21c839b8448dd Chengguang Xu     2020-04-24  101  	struct dentry *workdir = ofs->workdir;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  102  	struct inode *wdir = workdir->d_inode;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  103  
8afa0a73671389 NeilBrown         2025-07-16  104  	guard(mutex)(&ofs->whiteout_lock);
8afa0a73671389 NeilBrown         2025-07-16  105  
c21c839b8448dd Chengguang Xu     2020-04-24  106  	if (!ofs->whiteout) {
807b78b0fffc23 NeilBrown         2025-10-30  107  		whiteout = ovl_start_creating_temp(ofs, workdir);
8afa0a73671389 NeilBrown         2025-07-16  108  		if (IS_ERR(whiteout))
8afa0a73671389 NeilBrown         2025-07-16  109  			return whiteout;

white out is not an error pointer.

807b78b0fffc23 NeilBrown         2025-10-30  110  		err = ovl_do_whiteout(ofs, wdir, whiteout);
807b78b0fffc23 NeilBrown         2025-10-30  111  		if (!err)
807b78b0fffc23 NeilBrown         2025-10-30  112  			ofs->whiteout = dget(whiteout);
807b78b0fffc23 NeilBrown         2025-10-30  113  		end_creating(whiteout, workdir);
807b78b0fffc23 NeilBrown         2025-10-30  114  		if (err)
807b78b0fffc23 NeilBrown         2025-10-30  115  			return ERR_PTR(err);
e9be9d5e76e348 Miklos Szeredi    2014-10-24  116  	}

whiteout not set on else path

e9be9d5e76e348 Miklos Szeredi    2014-10-24  117  
e4599d4b1aeff0 Amir Goldstein    2023-06-17  118  	if (!ofs->no_shared_whiteout) {
807b78b0fffc23 NeilBrown         2025-10-30  119  		link = ovl_start_creating_temp(ofs, workdir);
807b78b0fffc23 NeilBrown         2025-10-30  120  		if (IS_ERR(link))
807b78b0fffc23 NeilBrown         2025-10-30  121  			return link;
807b78b0fffc23 NeilBrown         2025-10-30  122  		err = ovl_do_link(ofs, ofs->whiteout, wdir, link);
807b78b0fffc23 NeilBrown         2025-10-30  123  		if (!err)
807b78b0fffc23 NeilBrown         2025-10-30  124  			whiteout = dget(link);

It's set here, but then returned on line 127.

807b78b0fffc23 NeilBrown         2025-10-30  125  		end_creating(link, workdir);
807b78b0fffc23 NeilBrown         2025-10-30  126  		if (!err)
807b78b0fffc23 NeilBrown         2025-10-30  127  			return whiteout;;

nit: double ;;

807b78b0fffc23 NeilBrown         2025-10-30  128  
807b78b0fffc23 NeilBrown         2025-10-30  129  		if (err != -EMLINK) {
672820a070ea5e Antonio Quartulli 2025-07-21 @130  			pr_warn("Failed to link whiteout - disabling whiteout inode sharing(nlink=%u, err=%lu)\n",
672820a070ea5e Antonio Quartulli 2025-07-21  131  				ofs->whiteout->d_inode->i_nlink,
672820a070ea5e Antonio Quartulli 2025-07-21  132  				PTR_ERR(whiteout));

whiteout is either valid or uninitialized.  For some reason
Smatch thinks whiteout can be NULL, I suspect because of
the NULL check in dget().

e4599d4b1aeff0 Amir Goldstein    2023-06-17  133  			ofs->no_shared_whiteout = true;
c21c839b8448dd Chengguang Xu     2020-04-24  134  		}
c21c839b8448dd Chengguang Xu     2020-04-24  135  	}
c21c839b8448dd Chengguang Xu     2020-04-24  136  	whiteout = ofs->whiteout;
c21c839b8448dd Chengguang Xu     2020-04-24  137  	ofs->whiteout = NULL;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  138  	return whiteout;
e9be9d5e76e348 Miklos Szeredi    2014-10-24  139  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

