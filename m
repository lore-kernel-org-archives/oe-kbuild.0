Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4202228489B
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Sep 2025 10:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757759668; cv=none; b=NG+csWHCT/npFBNw5spaVhqhtyk+tkhoL8WmzAaSN28dPTJMwPxMPxX0amrmqHtLWb4ZebrCMYRXvnFUz80NH3Fbqs7jno6qpJVJWECSX2MoqBrzJoEqKEHoA1GjrL/3zazLbQDyYM+OrHk4xUJcLzKrs+YUt45mYeMvWFrAVKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757759668; c=relaxed/simple;
	bh=h8JwbvwyW2P7gQFG2zaN5MiksCvFsFDvf6U9oStazJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f/jvRINsCdKT/um/LgpGbw6ks+/ZZgAZSNAs/XErrvKbecgkcH2OE76M9sf4ZoDDdk6ZN3Rv4SB7k4mrmvIatWqHwb0CiRp+3ND/8CiKpny4UbZy89jfME/80zwrU7MxV9/XkNig7R1r7heRP5/7ny/yeSxIo2K3y1+2KQIO9kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N1xIt8jA; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N1xIt8jA"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so24342545e9.0
        for <oe-kbuild@lists.linux.dev>; Sat, 13 Sep 2025 03:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757759664; x=1758364464; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v+GA69unbvtgXr6RVU3bFQ9DEodnNP5kqSiglG4UkRU=;
        b=N1xIt8jAvwroW6OM6LetZSoBSDwvCycw7GLOtMMKNuqHZb7EF26vcN0opUCqQoj0o0
         Y2KItF+g8mm34bqmD2RdWJbwgQJr+GY6a2FjCUkfdTrOj0WAS1NV3NbwAc3GAU9Rx7/O
         ZNFyE6lF4GJlV8UMo7KfFhoDHIUL3e/eIvNf6GZNTi8tONQm8T87IvkPrRSps74WvINN
         R3p+rWxPBRWW3gQyq3hC93npEa4G3BE+O4N7R6NMtm1Ml9JBY4QtbDSnOxsmVnNtUuQy
         Gs9xTMe5oisCVBYvYgdpbQI64LhmIkXyf890DCqCy/S43ri8S9OBq3uIyGGTgcuRIQU1
         aXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757759664; x=1758364464;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v+GA69unbvtgXr6RVU3bFQ9DEodnNP5kqSiglG4UkRU=;
        b=fQnpT+qyVRqrJqhaC6kzFie7gJZd55TcqHGZl3fw4aVpaOtT+u4GgXvF4Z72EYulb9
         j5z03a0ALNP80kXcK1753pDBWpJ/2kbStewq8pJ+8lHbP4ELIckWf3Rw9WMkfwUnRDlM
         i9G+TYji+6tRGzY4YvK6oKAdKpfmxccqUGm2y2XXAA/g+pMsGg98SeMYJo8PZt4Sq4Zn
         5YAQzQYBbuz/pt0Vk72sZlDFWsPVi/wiXGWeKlAA4N81k401lbU25rrWUF6GqB0+qjxt
         TBaMttLjc67QC8iyTIWOuOH/xHojeInaqFDP4IcvCqVbcIdlva39YLdFFTiKbgfZorlF
         Obxw==
X-Gm-Message-State: AOJu0YyhKgUQmAJKNM6frOh1aVG0ktDYtmmz7nMm+O6gheUPFMXRCEjo
	RvBDmSOe6OaCBCU4zNPYCme6rRxS4iwQ9wk2vNSvX6/Exl/MjpszaFsw5EQuwY/vF00GgFRz7IN
	HyGSq
X-Gm-Gg: ASbGncsCsAN/v62Za6gecQP+mTZAVpWK1p0vQemtsHME1EIRAljafHl9Y2KV3oFoYHf
	ey7Da642gwEbJ0TPmvwTo741vqfO3V8AHNavAKn/W18dTyjdtNRDuFaiFJ9xhJ2CTIzQJy3sQRr
	U0rYEboYF7LdsJicD90oGZqNICdIo9DardOhNtMWtQTo3DAb0OZG9gbUioGOMvMmmV9dV8dp9m9
	4I56Shj+a20ZK50O80fwXKu3PwEAqgvBlyFJbdEIMjxHBeO+bZ6geTnmGDmtfOrLw2jjxYHCf+6
	eWcc7JcCAfUKLuAV+AYdF3Rz987wCxpREP70XR5Tg44xdoPnd5pmO7F6++k1mzYn7wiWvdRG78O
	8ksnwebkFeSjsRMTJh3tRb9pBbq8=
X-Google-Smtp-Source: AGHT+IG+KxBywTWC73f20ZIoRXzpjdjLkuMkfOI+yS//wh7s1CqTwE5rmFi7w8RMhHIM5dY/jksVVQ==
X-Received: by 2002:a05:600c:49a2:b0:45b:92a6:63e3 with SMTP id 5b1f17b1804b1-45dfd5e3d5bmr65229385e9.9.1757759664273;
        Sat, 13 Sep 2025 03:34:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e760777851sm9950677f8f.4.2025.09.13.03.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 03:34:23 -0700 (PDT)
Date: Sat, 13 Sep 2025 13:34:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, NeilBrown <neil@brown.name>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Chuck Lever <chuck.lever@oracle.com>,
	Jeff Layton <jlayton@kernel.org>
Subject: [cel:nfsd-testing 45/50] fs/nfsd/nfs4recover.c:406 purge_old()
 error: uninitialized symbol 'child'.
Message-ID: <202509131751.4STnDcZg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250913103420.j4qzm06Wxb3xpZSLCm4lph3F9Uu8Ca2I0h-Ezw9G_DA@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   454e99ac23dc63c1472eb5df8f97c961c0f178c9
commit: 30424fb94b7bea14e27922669924948d6320e991 [45/50] nfsd: move name lookup out of nfsd4_list_rec_dir()
config: sparc64-randconfig-r072-20250913 (https://download.01.org/0day-ci/archive/20250913/202509131751.4STnDcZg-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509131751.4STnDcZg-lkp@intel.com/

smatch warnings:
fs/nfsd/nfs4recover.c:406 purge_old() error: uninitialized symbol 'child'.

vim +/child +406 fs/nfsd/nfs4recover.c

c7b9a45927e74c8 NeilBrown         2005-06-23  398  static int
30424fb94b7bea1 NeilBrown         2025-09-08  399  purge_old(struct dentry *parent, char *cname, struct nfsd_net *nn)
c7b9a45927e74c8 NeilBrown         2005-06-23  400  {
c7b9a45927e74c8 NeilBrown         2005-06-23  401  	int status;
30424fb94b7bea1 NeilBrown         2025-09-08  402  	struct dentry *child;
6b1891052a3f8e3 Scott Mayhew      2019-03-26  403  	struct xdr_netobj name;
c7b9a45927e74c8 NeilBrown         2005-06-23  404  
30424fb94b7bea1 NeilBrown         2025-09-08  405  	if (strlen(cname) != HEXDIR_LEN - 1) {
6b1891052a3f8e3 Scott Mayhew      2019-03-26 @406  		printk("%s: illegal name %pd in recovery directory\n",
6b1891052a3f8e3 Scott Mayhew      2019-03-26  407  				__func__, child);
                                                                                          ^^^^^
s/child/cname/

6b1891052a3f8e3 Scott Mayhew      2019-03-26  408  		/* Keep trying; maybe the others are OK: */
b37ad28bcaa7c48 Al Viro           2006-10-19  409  		return 0;
6b1891052a3f8e3 Scott Mayhew      2019-03-26  410  	}
30424fb94b7bea1 NeilBrown         2025-09-08  411  	name.data = kstrdup(cname, GFP_KERNEL);
6b1891052a3f8e3 Scott Mayhew      2019-03-26  412  	if (!name.data) {
6b1891052a3f8e3 Scott Mayhew      2019-03-26  413  		dprintk("%s: failed to allocate memory for name.data!\n",
6b1891052a3f8e3 Scott Mayhew      2019-03-26  414  			__func__);
6b1891052a3f8e3 Scott Mayhew      2019-03-26  415  		goto out;
6b1891052a3f8e3 Scott Mayhew      2019-03-26  416  	}
6b1891052a3f8e3 Scott Mayhew      2019-03-26  417  	name.len = HEXDIR_LEN;
6b1891052a3f8e3 Scott Mayhew      2019-03-26  418  	if (nfs4_has_reclaimed_state(name, nn))
6b1891052a3f8e3 Scott Mayhew      2019-03-26  419  		goto out_free;
c7b9a45927e74c8 NeilBrown         2005-06-23  420  
30424fb94b7bea1 NeilBrown         2025-09-08  421  	inode_lock_nested(d_inode(parent), I_MUTEX_PARENT);
30424fb94b7bea1 NeilBrown         2025-09-08  422  	child = lookup_one(&nop_mnt_idmap, &QSTR(cname), parent);
30424fb94b7bea1 NeilBrown         2025-09-08  423  	if (!IS_ERR(child)) {
abf08576afe3150 Christian Brauner 2023-01-13  424  		status = vfs_rmdir(&nop_mnt_idmap, d_inode(parent), child);
c7b9a45927e74c8 NeilBrown         2005-06-23  425  		if (status)
a6a9f18f0a9f943 Al Viro           2013-09-16  426  			printk("failed to remove client recovery directory %pd\n",
a6a9f18f0a9f943 Al Viro           2013-09-16  427  			       child);
30424fb94b7bea1 NeilBrown         2025-09-08  428  		dput(child);
30424fb94b7bea1 NeilBrown         2025-09-08  429  	}
30424fb94b7bea1 NeilBrown         2025-09-08  430  	inode_unlock(d_inode(parent));
30424fb94b7bea1 NeilBrown         2025-09-08  431  
6b1891052a3f8e3 Scott Mayhew      2019-03-26  432  out_free:
6b1891052a3f8e3 Scott Mayhew      2019-03-26  433  	kfree(name.data);
6b1891052a3f8e3 Scott Mayhew      2019-03-26  434  out:
c7b9a45927e74c8 NeilBrown         2005-06-23  435  	/* Keep trying, success or failure: */
b37ad28bcaa7c48 Al Viro           2006-10-19  436  	return 0;
c7b9a45927e74c8 NeilBrown         2005-06-23  437  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

