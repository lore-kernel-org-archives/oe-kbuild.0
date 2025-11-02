Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9C626656F
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Nov 2025 09:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762074644; cv=none; b=X6qRL94bnbOe1rhfaibf8pc3a+yN5OdnRxoj7i5R77l0dyYECoeT5NNx0aDAVqIAUqlxqUiaad6qFszRCEZInnNv4EgiU+vP8U1j00Rf1UN1Gku6rL0bXzZbJ2fptDEkyYbFHKIIrTZ0sF1iudFBmy/3s+fJNIMuZijcmQYPlaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762074644; c=relaxed/simple;
	bh=qD5/FoCTLkyARa5AQA/+l/GmKs4cQP/TjyJXRCDh7V4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryns+WQbdMMInlIfIMZLrt2SNzBpICus7vZ71H6T8iOJMZE3QmcCu8SYg8/5gGuJ7hdN1gTl4dzztF1sEtRSXXSz1+mibXA+hLNlQe4bTbDsOuw5YNVmxpJw135CCTXv+xH56Zc2QMAn7McaGiSmMiwIdQ9DfDyZLRwN45AoeSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YdPFoWPU; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YdPFoWPU"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-474975af41dso26018255e9.2
        for <oe-kbuild@lists.linux.dev>; Sun, 02 Nov 2025 01:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762074641; x=1762679441; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m7cGnlggGwCStKE++4amSGBWkBioEl4HVTFZyJlNXgM=;
        b=YdPFoWPUkO7Mrrw5ahpjSwtCb6B+yxPkMHRig6bYHPCETqC0Ee6VvQuShjqLvrXKzs
         1w4zcJW0DW/hxP9rvG2IS4wdx4QO6nn4u2tzH9eV5OtRZriy+/KvwnljjpebQ4eTZcQS
         JE7MN16Nn+ELo+oZhaTUIJDCz0ueXLSTOG0MU3iaq+5zwW+ZaU6J6XBDUgkEgqRscbr0
         e+lqn1rsWYSms69xV1BNDMNg1XqkVJdyWmTNAkjw/sfoN5EA8ufYtItK5afIxVnriJQA
         CzQRxxH9VaaJ6JyBNBUtvg3hD2dHtFN6ndNA3SbLhRqK2UHLh/t7+t9eN+eAxe9Z1sf5
         24uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762074641; x=1762679441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7cGnlggGwCStKE++4amSGBWkBioEl4HVTFZyJlNXgM=;
        b=LKIrxWBR2+Am5gERyI3NXXf7q0m0fvPW8QcJcInbXFz+IscYzCtTH27VDUwDEX3RTV
         h2CTRAXXoeed01knmzTkgVfuXiFiw3o8gIa2Bkg2gFywr7/0nFqKFgNxlJtbUTGEKQvJ
         Go77J0aIGqwVDi2PGgf3KNhd4J4UqgAEtS1w8c4C2srPJL4/QY2uaq0RMoN/OGPSql7C
         U408yBlpWN0IlTACBO12ZVR4T9os93QoJInFGqThFDAHCkV0tp5L36I+P+8vW6+HtHSa
         T3DTh5fpsq6y0RUcSvY9dPzoS73hNVfNSFLcswB2Juh7oL27fPWzqvmFw5T4BPZanYd+
         DNJg==
X-Gm-Message-State: AOJu0Yz+/TZHMOEHDv554Z0VMX6An/56VzQgjk92xH2hazCkkt6m0JFq
	a194S7HOe6NABwZrT1jX5lILvtFhxH/v4JzeoTX4z6bCXvSvW9zIIBdv6hOA5gLBXrnTy/HR2Q7
	ykB5r
X-Gm-Gg: ASbGncurH6RT3PPL+ei23tIeGrSjgCZCVqSCnMbWcz3Mdav7qI0uhgWMO3zAGtalJA/
	Dkn2+VZKmYlwvsNVVkmtvPPIMxpDe2+uRuUMb7sSKdiPCsu/0Nu4z/VBPaJFKNVvDgBPCJsMX6d
	6Lw6llHZxkTBSAWuNPkHbxbu77dZvsZ43W2j8wFFOhDbeevCzyTs9kN92vgM79h7IUVLJ3hVnun
	lYkqHZIZYdaA0K3lo/FNjPRNrK4OerOUBBdo/TOkf62dsNOB4KO0Gx4dECegxtpejlW2IFJkB/K
	f4Q+HuHD36iur3vvhOduk7b2E65BeEROvWcAyDuEzSg7x5jAaiUDIuleou7wHVnZyiQQ1Gc5bmq
	l7Y9lOgjidehDX2PEjR8w1vcqg52tfvGIBujv4ILk8SvnNti+iXyu345uOwg0k70HSnpsTPrG6o
	CQ/q88En8lycd0oR+v
X-Google-Smtp-Source: AGHT+IECHyILSrbd0QXTTRGviLOb/cK2qhNsm2Df6/6M1eVjARvdq8vgt6DKUnfZZFhEiuN3prCXvw==
X-Received: by 2002:a05:600c:828c:b0:476:651d:27e6 with SMTP id 5b1f17b1804b1-477308a8967mr82981805e9.36.1762074640521;
        Sun, 02 Nov 2025 01:10:40 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429c6ac1645sm8714761f8f.12.2025.11.02.01.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 01:10:40 -0800 (PST)
Date: Sun, 2 Nov 2025 12:10:36 +0300
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
Message-ID: <aQcgDOjZqJqkKNXa@stanley.mountain>
References: <20251029234353.1321957-5-neilb@ownmail.net>
 <202511021406.Tv3dcpn5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202511021406.Tv3dcpn5-lkp@intel.com>

On Sun, Nov 02, 2025 at 12:08:47PM +0300, Dan Carpenter wrote:
> Hi NeilBrown,
> 
> kernel test robot noticed the following build warnings:
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/NeilBrown/debugfs-rename-end_creating-to-debugfs_end_creating/20251030-075146
> base:   driver-core/driver-core-testing
> patch link:    https://lore.kernel.org/r/20251029234353.1321957-5-neilb%40ownmail.net
> patch subject: [PATCH v4 04/14] VFS/nfsd/cachefiles/ovl: add start_creating() and end_creating()
> config: x86_64-randconfig-161-20251101 (https://download.01.org/0day-ci/archive/20251102/202511021406.Tv3dcpn5-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202511021406.Tv3dcpn5-lkp@intel.com/
> 
> smatch warnings:
> fs/overlayfs/dir.c:130 ovl_whiteout() error: uninitialized symbol 'whiteout'.
> fs/overlayfs/dir.c:130 ovl_whiteout() warn: passing zero to 'PTR_ERR'
> 
> vim +/whiteout +130 fs/overlayfs/dir.c
> 
> c21c839b8448dd Chengguang Xu     2020-04-24   97  static struct dentry *ovl_whiteout(struct ovl_fs *ofs)
> e9be9d5e76e348 Miklos Szeredi    2014-10-24   98  {
> e9be9d5e76e348 Miklos Szeredi    2014-10-24   99  	int err;
> 807b78b0fffc23 NeilBrown         2025-10-30  100  	struct dentry *whiteout, *link;
> c21c839b8448dd Chengguang Xu     2020-04-24  101  	struct dentry *workdir = ofs->workdir;
> e9be9d5e76e348 Miklos Szeredi    2014-10-24  102  	struct inode *wdir = workdir->d_inode;
> e9be9d5e76e348 Miklos Szeredi    2014-10-24  103  
> 8afa0a73671389 NeilBrown         2025-07-16  104  	guard(mutex)(&ofs->whiteout_lock);
> 8afa0a73671389 NeilBrown         2025-07-16  105  
> c21c839b8448dd Chengguang Xu     2020-04-24  106  	if (!ofs->whiteout) {
> 807b78b0fffc23 NeilBrown         2025-10-30  107  		whiteout = ovl_start_creating_temp(ofs, workdir);
> 8afa0a73671389 NeilBrown         2025-07-16  108  		if (IS_ERR(whiteout))
> 8afa0a73671389 NeilBrown         2025-07-16  109  			return whiteout;
> 
> white out is not an error pointer.
> 

I meant after this return statement...

regards,
dan carpenter

