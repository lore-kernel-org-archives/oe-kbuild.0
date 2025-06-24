Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAAF2DECA6
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Jun 2025 14:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750776055; cv=none; b=QGIvvjqt0HwaYPYd6745ZYA7NgglxkIJH8oKI+HH016mX9eNOxdkEVfRi+Wy5nRaaph7+/swbDVv602YBw/XYW7UBwkHde003j2SK5xxUsX4ZfkXpd4qsJLcmLoSwJm43hmyr1fRwm8xlvsw3cH/k0N7ux+4P3ZguMydSEyQTGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750776055; c=relaxed/simple;
	bh=Ly14UqA/2FkDU/lX5EZaSjFKnh+VRCEQaDdKgQWZ+4s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=nFZwxAJ9rmzwSFNhS9CBwBuAt6HNKY64/OQPCivuWFMaoEJcYwOILGUVNHTYVmMysPYo2sddmq2hudH8tfg+jwh87I151VXynQEUnXIXnlORr6wt8aNYzyPMYhkz1a5pZ+0IbebshZXZJyu6hLs4ZZvIC5Bb51Wh8p+Ujnl3t+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j01p+wev; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j01p+wev"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7382ffcb373so349507a34.0
        for <oe-kbuild@lists.linux.dev>; Tue, 24 Jun 2025 07:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750776052; x=1751380852; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wZbeeLBzYw2J68dkHLzQTlRrqE4md3QIGHGi5VxEd00=;
        b=j01p+wevkjzbcBPAw2/xvMsyCseST/sep0CFaOhotym0sSEaBLWJbYva19dYsEVZCZ
         dDMtLur4MtnlSuRrYPofYnmkzqbeF87inFXZ/sm7piDoXD2rPldjj8qvssHnlBQ8foMv
         AULBdpDSS6m+czfisfkXhhn1XxFfFtVEGonshG6eOoxMpdy9ADZj/Ln1xStZ2mqf9KXY
         1ZImoK0YRsZOk0DzpRMtcu9QrutmeJLxDMfKKwJb4bevzldXhGJryNItzXEP+HexSwfw
         c/f4ExXzgKMgRzuwmzzH9OXt6co5NSIFh9PWQ8SU4TONGaThAvbFM5gL8DnNyHBtQK/W
         dOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750776052; x=1751380852;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wZbeeLBzYw2J68dkHLzQTlRrqE4md3QIGHGi5VxEd00=;
        b=WtxNZXJE+x8mMCvy7sm53/GcfH+vpDKskX2Yyr0Xp4A9YItAJTiTmU2Bwbtowa/rsD
         8EybuoxPHgfOIldvongqEweKWiHNr5W7USBqGWlw8N/FiivGdzEEtfgtqR5d5AqQmC4+
         giSIv2mCY4ibnd0Z4Ija6otc9PYrxtB5IsZOeE0+m7GTyAeVZghKDKd+rUSFBMzZ0Lic
         NTDN6HtC+cCdO0vryxMrmFs8V2gpJQoDl1Tct0zivPcLxtNIhKGcd9dcEBTq/jU36NDy
         HFtEHpNDPGe+bfOiQwuieY7hNSZn6sZUDZ5u08WiEvhX/B1V8P1b2DvpDc2yV4h/sKec
         Ht3w==
X-Gm-Message-State: AOJu0Yzc+lxw8I3ZA6rAu3mdBRlrPihuSratezWs8bnE4IVJv5Gs7MMS
	HB3SwZwQHK4yQ9dSIloshe+HxBQcBQuYnbJ1FXORxNV9cT0T1t2/OGGF0zGN97cdn3hlZU6Q8+m
	xrQYZ
X-Gm-Gg: ASbGnct80gEgNibGCSpd4d3EohFVLbAo5MNf/7Wsp4/Ew/u4KRglMKOfDmFco9oLxtG
	9P91ZKbju8ZzMwVLk6O6hhxP0UwgJpeCuN56ssdyVQkQmXKQhtipspHKbRGnC1iQBRXdgIvpZ2W
	0feSZHVp9EiReAja5eVmfvb5mIA9HifXJ7KkWjVmFtMquJKWgmC1IgYlWoQ3pPC7XcbfP4ixhft
	ORWJcoXHA5MCYYsIZN+8tPiadGDFFCSwObaoml/jk1YlB4PZNScNBXFb3kT5QXpaTL4C2xsC3GM
	hrmOhtmYOxhYwK+3ykqNqF7uTXBA9lCEgLSWekjenz/SIU484tnJbI0IYjC4sI9QwWwTRA==
X-Google-Smtp-Source: AGHT+IHEJALXMoWMJJfwyl85aW1TfU0u/0HKeioz8AHf36+ZEvj7mCBj3LsxpYhW/267ja4dcJ4+aA==
X-Received: by 2002:a05:6830:3c09:b0:72b:8889:8224 with SMTP id 46e09a7af769-73ad7bb8ff1mr117599a34.10.1750776052609;
        Tue, 24 Jun 2025 07:40:52 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:22c9:dcd3:f442:dd1d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a90aee7f7sm1871806a34.8.2025.06.24.07.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:40:52 -0700 (PDT)
Date: Tue, 24 Jun 2025 17:40:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org
Subject: Re: [PATCH v5 net-next 4/9] vhost-net: allow configuring extended
 features
Message-ID: <80948a1d-270a-4859-bb54-07039b385d73@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e195567cf1f705143477f6eee7b528ee15918873.1750436464.git.pabeni@redhat.com>

Hi Paolo,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Paolo-Abeni/scripts-kernel_doc-py-properly-handle-VIRTIO_DECLARE_FEATURES/20250621-014409
base:   net-next/main
patch link:    https://lore.kernel.org/r/e195567cf1f705143477f6eee7b528ee15918873.1750436464.git.pabeni%40redhat.com
patch subject: [PATCH v5 net-next 4/9] vhost-net: allow configuring extended features
config: i386-randconfig-141-20250623 (https://download.01.org/0day-ci/archive/20250624/202506241710.pvHQGmeZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506241710.pvHQGmeZ-lkp@intel.com/

New smatch warnings:
drivers/vhost/net.c:1724 vhost_net_ioctl() warn: check for integer overflow 'count'

vim +/count +1724 drivers/vhost/net.c

3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1683  static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1684  			    unsigned long arg)
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1685  {
059c23697448c5 Paolo Abeni        2025-06-20  1686  	u64 all_features[VIRTIO_FEATURES_DWORDS];
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1687  	struct vhost_net *n = f->private_data;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1688  	void __user *argp = (void __user *)arg;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1689  	u64 __user *featurep = argp;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1690  	struct vhost_vring_file backend;
059c23697448c5 Paolo Abeni        2025-06-20  1691  	u64 features, count, copied;
059c23697448c5 Paolo Abeni        2025-06-20  1692  	int r, i;
d47effe1be0c4f Krishna Kumar      2011-03-01  1693  
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1694  	switch (ioctl) {
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1695  	case VHOST_NET_SET_BACKEND:
d3553a52490dca Takuya Yoshikawa   2010-05-27  1696  		if (copy_from_user(&backend, argp, sizeof backend))
d3553a52490dca Takuya Yoshikawa   2010-05-27  1697  			return -EFAULT;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1698  		return vhost_net_set_backend(n, backend.index, backend.fd);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1699  	case VHOST_GET_FEATURES:
059c23697448c5 Paolo Abeni        2025-06-20  1700  		features = vhost_net_features[0];
d3553a52490dca Takuya Yoshikawa   2010-05-27  1701  		if (copy_to_user(featurep, &features, sizeof features))
d3553a52490dca Takuya Yoshikawa   2010-05-27  1702  			return -EFAULT;
d3553a52490dca Takuya Yoshikawa   2010-05-27  1703  		return 0;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1704  	case VHOST_SET_FEATURES:
d3553a52490dca Takuya Yoshikawa   2010-05-27  1705  		if (copy_from_user(&features, featurep, sizeof features))
d3553a52490dca Takuya Yoshikawa   2010-05-27  1706  			return -EFAULT;
059c23697448c5 Paolo Abeni        2025-06-20  1707  		if (features & ~vhost_net_features[0])
059c23697448c5 Paolo Abeni        2025-06-20  1708  			return -EOPNOTSUPP;
059c23697448c5 Paolo Abeni        2025-06-20  1709  
059c23697448c5 Paolo Abeni        2025-06-20  1710  		virtio_features_from_u64(all_features, features);
059c23697448c5 Paolo Abeni        2025-06-20  1711  		return vhost_net_set_features(n, all_features);
059c23697448c5 Paolo Abeni        2025-06-20  1712  	case VHOST_GET_FEATURES_ARRAY:
059c23697448c5 Paolo Abeni        2025-06-20  1713  		if (get_user(count, featurep))
059c23697448c5 Paolo Abeni        2025-06-20  1714  			return -EFAULT;
059c23697448c5 Paolo Abeni        2025-06-20  1715  
059c23697448c5 Paolo Abeni        2025-06-20  1716  		/* Copy the net features, up to the user-provided buffer size */
059c23697448c5 Paolo Abeni        2025-06-20  1717  		argp += sizeof(u64);
059c23697448c5 Paolo Abeni        2025-06-20  1718  		copied = min(count, VIRTIO_FEATURES_DWORDS);
059c23697448c5 Paolo Abeni        2025-06-20  1719  		if (copy_to_user(argp, vhost_net_features,
059c23697448c5 Paolo Abeni        2025-06-20  1720  				 copied * sizeof(u64)))
059c23697448c5 Paolo Abeni        2025-06-20  1721  			return -EFAULT;
059c23697448c5 Paolo Abeni        2025-06-20  1722  
059c23697448c5 Paolo Abeni        2025-06-20  1723  		/* Zero the trailing space provided by user-space, if any */
059c23697448c5 Paolo Abeni        2025-06-20 @1724  		if (clear_user(argp, (count - copied) * sizeof(u64)))

This can have an integer overflow.  Which is fine.  Except that we're
eventually going to add tooling to complain when there is math like
this where a sizeof() or any size_t multiplication leads to an integer
overflow.  (Unless it's part of an integer overflow check or it's
annotated.  There are several different ways where an integer overlow
is idiomatic and those are allowed).

059c23697448c5 Paolo Abeni        2025-06-20  1725  			return -EFAULT;
059c23697448c5 Paolo Abeni        2025-06-20  1726  		return 0;
059c23697448c5 Paolo Abeni        2025-06-20  1727  	case VHOST_SET_FEATURES_ARRAY:
059c23697448c5 Paolo Abeni        2025-06-20  1728  		if (get_user(count, featurep))
059c23697448c5 Paolo Abeni        2025-06-20  1729  			return -EFAULT;
059c23697448c5 Paolo Abeni        2025-06-20  1730  
059c23697448c5 Paolo Abeni        2025-06-20  1731  		virtio_features_zero(all_features);
059c23697448c5 Paolo Abeni        2025-06-20  1732  		argp += sizeof(u64);
059c23697448c5 Paolo Abeni        2025-06-20  1733  		copied = min(count, VIRTIO_FEATURES_DWORDS);
059c23697448c5 Paolo Abeni        2025-06-20  1734  		if (copy_from_user(all_features, argp, copied * sizeof(u64)))
059c23697448c5 Paolo Abeni        2025-06-20  1735  			return -EFAULT;
059c23697448c5 Paolo Abeni        2025-06-20  1736  
059c23697448c5 Paolo Abeni        2025-06-20  1737  		/*
059c23697448c5 Paolo Abeni        2025-06-20  1738  		 * Any feature specified by user-space above
059c23697448c5 Paolo Abeni        2025-06-20  1739  		 * VIRTIO_FEATURES_MAX is not supported by definition.
059c23697448c5 Paolo Abeni        2025-06-20  1740  		 */
059c23697448c5 Paolo Abeni        2025-06-20  1741  		for (i = copied; i < count; ++i) {
059c23697448c5 Paolo Abeni        2025-06-20  1742  			if (get_user(features, featurep + 1 + i))
059c23697448c5 Paolo Abeni        2025-06-20  1743  				return -EFAULT;
059c23697448c5 Paolo Abeni        2025-06-20  1744  			if (features)
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  1745  				return -EOPNOTSUPP;
059c23697448c5 Paolo Abeni        2025-06-20  1746  		}
059c23697448c5 Paolo Abeni        2025-06-20  1747  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

