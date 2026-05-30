Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEE43AFAE2
	for <oe-kbuild@lists.linux.dev>; Sat, 30 May 2026 17:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780163197; cv=none; b=YO7yWTOFGBcf+6K8f60SFx6rMjUGCB4ZKOGG4PmQ9u0CCl/ZlYK6hhqufqLWKpMIbpumpV/Q0ob/sRKzEpC3KG2++LbGRbSPlDj22war5Rbm3E9Y/ds9odCuAkEJsA3EO+SHYNgi4Tb4E4CDKP4bHBD0R7gOxp25ohwwSxIM88Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780163197; c=relaxed/simple;
	bh=p9mmt+HC9BO3hUp9yEhHwEZiKKcOtn8P/wxRR15M1ZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=f7rn/o78HfXJq4s+P1qmKin4qlMSyM/uH/dlM834PZD1qDZWdXHsjHJRftpzgos3qcrKd9KOAG44hziqJ8HNa1TUeOLeQnHC7lz3O9lT4i9NyExIOjZyQU8KceATzf5WQFdNKmOoyOxMM6Unc/KxAtdC5ZblqUbqsE+kfzWI7aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DoVxwcWl; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DoVxwcWl"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ef4223be7so920847f8f.2
        for <oe-kbuild@lists.linux.dev>; Sat, 30 May 2026 10:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780163195; x=1780767995; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HhbZmkaWK2d+OrlQbKHk4YxAXH5lr2lMy7P+sZtQEn8=;
        b=DoVxwcWltvBHAc5HOs/rEX8/tqOZSJPfvRMJ6CuhsD+UG10nQz9Xh/ANF+sJCp6oQf
         1P2wM9ls/SiPsDdxfBeeAS2nBDdl3pkOxfpNaodVVLhV9aznls+WQiiTeM0Gukx2xnRj
         LdrT6yrW7/CE1izlNtHm1rtKgY9kV1qXwyDMbmZBZwiQES9iojgb6WL+FyVg8wTMiDvP
         fthuiZTdkVWIumcEhDAuU1/2UuU8xOAmK2XTWWXhYl/pI3TUX+VIDEPXz91WLLav1Cbe
         +1CqhKUM9H+ogb2vyrj/kvCOSseeUA/dZOwZGu2vNxZAEqluEaquJLtk2yZTnHvw9nYq
         rldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780163195; x=1780767995;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HhbZmkaWK2d+OrlQbKHk4YxAXH5lr2lMy7P+sZtQEn8=;
        b=Fc6oB3buhOHcKY1jQJpdPCaqzu+XMge06keVkP7LGv7QgTet8SqsRtybWKfC20Gp07
         7/BQy9/jGyeS/+3JkxGS6WMnAvaigp6nF3lB1XLfB4g5R+1QzB2l1oWZFKy/lfK4ia+1
         Ft83gXrre1v/+EzQcDrABnLA7yDipygst2/KUMAD5etFQ1g5ew8QuDS627cSNGkNqVQ+
         HanRBzxu3J8Ows7WiTxwoE3n6mAbVOyhaxW/n+TBwvffwfta14l8Y6QFWQ//r8y4hVsU
         jUl/fg0qXbnO7TIGRkiO62O5Yu7uBtXyqGcSMo8URI8eyMglYMineXD9XmpE8RrRpW7O
         GzgA==
X-Gm-Message-State: AOJu0YwmA98/+jCFmmSC0AbODyO9ktF27Bks/uYMth48LXV+kWu33n3Y
	NXAREb5FU/lMYt2+KIvFJX6PyrNvAthV9mOb3Dg9tQjAXfFJlrXI8KPN1ESiuw==
X-Gm-Gg: Acq92OEqdJ1VDD5LYbWNdQhj9F0LLcHd1X9M4XIYqpoSW9U7kfA0x21EIP7anTehjpY
	P7He5mwfkekj5mHnmVt1xYrEK4EwqcwwsRDY+mtGM81aZ2iT7wQF++4Arsh5bQ09W7XXvkLaStP
	3mgMB8QICAniw1v9X78EMhtJZCi7PTJZBASk6DWtd6sa2SnLRiYrzHHPpPgiIgUBEr3W0TfwG8W
	0vBr4rNhdB3bO7/O2d8ujpmtKpM+UCsyaacSz2PWMCa+RY8ngN0hvMc903Dnnp2lWAtNQt9PVcD
	riKG0t7NkySmb5FhPh/LOA6LhBLC8aOnr/tCl629j5Fz0bSDL05rAEwd+gNqMcJ5/eOosDHyFpu
	Ik/j/ccoYBeo18+x0mgNSLKpImIZN//6nwPxKL8ruuwJIfS+Oep7ZSa8wZgYrgth9X4ZbRmQVjA
	UV4V9kHiabFw54F9eXWldC6zJLcvDap3+HyA==
X-Received: by 2002:adf:f190:0:b0:44f:9b70:2996 with SMTP id ffacd0b85a97d-45ef6b4f4f5mr5775458f8f.21.1780163194681;
        Sat, 30 May 2026 10:46:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef354cd7csm12052902f8f.18.2026.05.30.10.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 10:46:34 -0700 (PDT)
Date: Sat, 30 May 2026 20:46:31 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Pavitra Jha <jhapavitra98@gmail.com>,
	idryomov@gmail.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, Slava.Dubeyko@ibm.com,
	amarkuze@redhat.com, ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Pavitra Jha <jhapavitra98@gmail.com>
Subject: Re: [PATCH v2] ceph: fix bare ceph_decode_8 OOB in decode_lockers()
Message-ID: <202605310022.LGyGb8eD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528132521.843004-1-jhapavitra98@gmail.com>
Message-ID: <20260530174631.TCgAInT4tWFDJ0WoBgksWvDSZMJUKlfM18s6bD1k-u8@z>

Hi Pavitra,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavitra-Jha/ceph-fix-bare-ceph_decode_8-OOB-in-decode_lockers/20260528-212749
base:   https://github.com/ceph/ceph-client.git testing
patch link:    https://lore.kernel.org/r/20260528132521.843004-1-jhapavitra98%40gmail.com
patch subject: [PATCH v2] ceph: fix bare ceph_decode_8 OOB in decode_lockers()
config: um-randconfig-r073-20260530 (https://download.01.org/0day-ci/archive/20260531/202605310022.LGyGb8eD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605310022.LGyGb8eD-lkp@intel.com/

smatch warnings:
net/ceph/cls_lock_client.c:313 decode_lockers() warn: missing error code 'ret'

vim +/ret +313 net/ceph/cls_lock_client.c

d4ed4a53056288 Douglas Fuller 2015-06-29  288  static int decode_lockers(void **p, void *end, u8 *type, char **tag,
d4ed4a53056288 Douglas Fuller 2015-06-29  289  			  struct ceph_locker **lockers, u32 *num_lockers)
d4ed4a53056288 Douglas Fuller 2015-06-29  290  {
d4ed4a53056288 Douglas Fuller 2015-06-29  291  	u8 struct_v;
d4ed4a53056288 Douglas Fuller 2015-06-29  292  	u32 struct_len;
d4ed4a53056288 Douglas Fuller 2015-06-29  293  	char *s;
d4ed4a53056288 Douglas Fuller 2015-06-29  294  	int i;
d4ed4a53056288 Douglas Fuller 2015-06-29  295  	int ret;
d4ed4a53056288 Douglas Fuller 2015-06-29  296  
d4ed4a53056288 Douglas Fuller 2015-06-29  297  	ret = ceph_start_decoding(p, end, 1, "cls_lock_get_info_reply",
d4ed4a53056288 Douglas Fuller 2015-06-29  298  				  &struct_v, &struct_len);
d4ed4a53056288 Douglas Fuller 2015-06-29  299  	if (ret)
d4ed4a53056288 Douglas Fuller 2015-06-29  300  		return ret;
d4ed4a53056288 Douglas Fuller 2015-06-29  301  
d4ed4a53056288 Douglas Fuller 2015-06-29  302  	*num_lockers = ceph_decode_32(p);
69050f8d6d075d Kees Cook      2026-02-20  303  	*lockers = kzalloc_objs(**lockers, *num_lockers, GFP_NOIO);
d4ed4a53056288 Douglas Fuller 2015-06-29  304  	if (!*lockers)
d4ed4a53056288 Douglas Fuller 2015-06-29  305  		return -ENOMEM;
d4ed4a53056288 Douglas Fuller 2015-06-29  306  
d4ed4a53056288 Douglas Fuller 2015-06-29  307  	for (i = 0; i < *num_lockers; i++) {
d4ed4a53056288 Douglas Fuller 2015-06-29  308  		ret = decode_locker(p, end, *lockers + i);
d4ed4a53056288 Douglas Fuller 2015-06-29  309  		if (ret)
d4ed4a53056288 Douglas Fuller 2015-06-29  310  			goto err_free_lockers;
d4ed4a53056288 Douglas Fuller 2015-06-29  311  	}
d4ed4a53056288 Douglas Fuller 2015-06-29  312  
cff58e4599d8e1 Pavitra Jha    2026-05-28 @313  	ceph_decode_8_safe(p, end, *type, err_free_lockers);

This macro has a goto err_free_lockers but the error code isn't set.

d4ed4a53056288 Douglas Fuller 2015-06-29  314  	s = ceph_extract_encoded_string(p, end, NULL, GFP_NOIO);
d4ed4a53056288 Douglas Fuller 2015-06-29  315  	if (IS_ERR(s)) {
d4ed4a53056288 Douglas Fuller 2015-06-29  316  		ret = PTR_ERR(s);
d4ed4a53056288 Douglas Fuller 2015-06-29  317  		goto err_free_lockers;
d4ed4a53056288 Douglas Fuller 2015-06-29  318  	}
d4ed4a53056288 Douglas Fuller 2015-06-29  319  
d4ed4a53056288 Douglas Fuller 2015-06-29  320  	*tag = s;
d4ed4a53056288 Douglas Fuller 2015-06-29  321  	return 0;
d4ed4a53056288 Douglas Fuller 2015-06-29  322  
d4ed4a53056288 Douglas Fuller 2015-06-29  323  err_free_lockers:
d4ed4a53056288 Douglas Fuller 2015-06-29  324  	ceph_free_lockers(*lockers, *num_lockers);
d4ed4a53056288 Douglas Fuller 2015-06-29  325  	return ret;
d4ed4a53056288 Douglas Fuller 2015-06-29  326  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

