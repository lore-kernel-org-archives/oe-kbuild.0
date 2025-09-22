Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C8F23D7C5
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Sep 2025 05:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758520454; cv=none; b=rYBl5z8ibtOxRK17ytVjnyTTqIvpdAZ1ZjRBVY9Mdnea8auHNvD2GNcE6e7lP1xndtiCC7RUOBjqg42/D8CYMmad326oxZx95BGK+iUKpGKZyNonuO5xwdkLgXeHFhLjMAaSxJBHL24CZX92iKEePkATXYTnJ1a2KgFLzZmzjZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758520454; c=relaxed/simple;
	bh=zYyfsE5qxjpWqC2tIG/SJ/cvRfcvcZO8dXlqyOcODTs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ucfdD2zVXSgUlEkg1CP5n9BJbwH/XVxFWao7j/83WljNiSmNTzmddIbHYB3SVldbvj52aUZk6J8GcliXdfvP/BXehLtxkOH/8e2du7U8ymKvdFOkVK/9pF720gzMTx23f6jumRtJV1JK8yZhRMkVibaOMX5obWnlz6TcHZLu7I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tdwHHv9u; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tdwHHv9u"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45df7dc1b98so22817665e9.1
        for <oe-kbuild@lists.linux.dev>; Sun, 21 Sep 2025 22:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758520451; x=1759125251; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7x1XLmO4ro/r1UnNyESVV9NhzCGPAPCv/VTwwF6oKiQ=;
        b=tdwHHv9ufNZduZ8IClqhwso1EgyHIZTi8LDr/TtLBXPjRcPFEjFb9fQU5e7ym2BO+E
         ACzxgpcm4bFmwGy6KxLd4ReXERRauUFnQ47T4WQu1kdtFfYfMjtz+MSKK7pdZr9WM3Pa
         2q7wNzq7cTQTkLXRxFMjaRJiX8xGrRmBxkvLkToQbg7hy/i0Y2aeumYoim3UPnH1oD2k
         LDm6bNGv7pqL/2agzFWrSyJELttazSCl6HGUru+5g6YOLiqnpH+JBjbvQa+P4qyT+EOP
         iA0nIDXcbUcFSdFtL2/mEagLe8gDS6FtRoQb6piIa6aJ9D+/JAkutoH9IvEUNV3pEGMw
         x/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758520451; x=1759125251;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7x1XLmO4ro/r1UnNyESVV9NhzCGPAPCv/VTwwF6oKiQ=;
        b=iiyq0Xg5v42h86lJ+48VAWQwhAK/+UG/4cYESsN5vC0tORw852XfOS6xjo19J+Cagz
         upb7TD5PhAnUfZMwrvkLkmM/pV8LryESebXXQRFWhnfeyBxT+5IMLlQOdq/tm5IZXzLg
         mNn7ktTWWdWpeth+khYRrlSr9y9JTDXUvKW7Dlsa5hCA224wQn0B8ahq6ddsW2KoaVAa
         1p4OptGVTApGdttvWNu7VBmTtjzqH55n24J2l+ZqGiDYIqi1w/EHO3GPZqdTUAxdfB+F
         4JR6TKf+JEH7GQ4x/5VjuXNKehwOhL2uYn2qIKbrO9tEH34kTbJwJVLc3m8MI3BePuAg
         ayPg==
X-Gm-Message-State: AOJu0YzmAENPIDBfQ0USwWv+uMwT5n6Qpk6WP7gnkls1KDpgedo27N/w
	1I90Mgb9XEANyIcnEboYsuciY3TUyzQQiiT7Er+y+9YFNqmH8fITlDUGxHMwX9IAacksSN2vMe4
	3t1gt
X-Gm-Gg: ASbGncsUNJrCQWTlbkiBYGHgZgmbJgWlgjE7AYkIlnpQTVQQb+8kAoOmeHqEOpxs6Rt
	bejz19JZB6DmwaHqe8dMsgAOv8KnfO6xuMBs6L+TXLNlk+mrZvYdweC+kZORvgxelQi3zpYY9lj
	khvQTgJvCRmNqUKeb6XPAF/wCcuFeFRgNfFHDys9k/j4zO6YBqURxbhB4dgtCSF7EshKWhDBaGR
	qU7nCaa4JhABMr7TiYkMI0fHRsaNps3NaibRM0SP8/ArGCZDwBAPfPLc5mPsh2Ta1urf/CwCLMQ
	wPo+XP5IcpkE+VUQ2PnyHoutqjw2Pom1er/x8ioZu5c6e1Frt6fML24QAERhM1YHZ7zWGdkRkju
	06WaOGMqg9K6RKNHu+cKe1RNde4tYq/EiyofcVQs=
X-Google-Smtp-Source: AGHT+IEJDYs9Qdhl2DErybligSpaMmJqfbQNod5ofMmx1MIFAp0DGmty47Gx8QvuNyJ6eu7eycn4UA==
X-Received: by 2002:a05:6000:2681:b0:400:1bbb:d257 with SMTP id ffacd0b85a97d-4001bbbd440mr746236f8f.26.1758520450860;
        Sun, 21 Sep 2025 22:54:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee073f53c4sm18477257f8f.3.2025.09.21.22.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 22:54:10 -0700 (PDT)
Date: Mon, 22 Sep 2025 08:54:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 5/6] vduse: add vq group asid support
Message-ID: <202509220050.26g9byC5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250919093359.961296-6-eperezma@redhat.com>
Message-ID: <20250922055406.aii6J6iASgoKZdzDiHAGqU4_Xw6na4vXJMbGx8vkyXQ@z>

Hi Eugenio,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eugenio-P-rez/vduse-make-domain_lock-an-rwlock/20250919-174108
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/20250919093359.961296-6-eperezma%40redhat.com
patch subject: [PATCH v3 5/6] vduse: add vq group asid support
config: microblaze-randconfig-r073-20250921 (https://download.01.org/0day-ci/archive/20250922/202509220050.26g9byC5-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202509220050.26g9byC5-lkp@intel.com/

New smatch warnings:
drivers/vdpa/vdpa_user/vduse_dev.c:1644 vduse_dev_ioctl() warn: maybe return -EFAULT instead of the bytes remaining?

Old smatch warnings:
drivers/vdpa/vdpa_user/vduse_dev.c:662 vduse_get_vq_map() warn: unsigned 'vq_group' is never less than zero.
drivers/vdpa/vdpa_user/vduse_dev.c:662 vduse_get_vq_map() warn: error code type promoted to positive: 'vq_group'

vim +1644 drivers/vdpa/vdpa_user/vduse_dev.c

5df53984377b18 Eugenio Pérez 2025-09-19  1369  		spin_lock(&dev->as[asid].domain->iotlb_lock);
5df53984377b18 Eugenio Pérez 2025-09-19  1370  		map = vhost_iotlb_itree_first(dev->as[asid].domain->iotlb,
5df53984377b18 Eugenio Pérez 2025-09-19  1371  					      entry.v1.start, entry.v1.last);
c8a6153b6c59d9 Xie Yongji    2021-08-31  1372  		if (map) {
c8a6153b6c59d9 Xie Yongji    2021-08-31  1373  			map_file = (struct vdpa_map_file *)map->opaque;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1374  			f = get_file(map_file->file);
5df53984377b18 Eugenio Pérez 2025-09-19  1375  			entry.v1.offset = map_file->offset;
5df53984377b18 Eugenio Pérez 2025-09-19  1376  			entry.v1.start = map->start;
5df53984377b18 Eugenio Pérez 2025-09-19  1377  			entry.v1.last = map->last;
5df53984377b18 Eugenio Pérez 2025-09-19  1378  			entry.v1.perm = map->perm;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1379  		}
5df53984377b18 Eugenio Pérez 2025-09-19  1380  		spin_unlock(&dev->as[asid].domain->iotlb_lock);
50988b052b5f91 Eugenio Pérez 2025-09-19  1381  		read_unlock(&dev->domain_lock);
c8a6153b6c59d9 Xie Yongji    2021-08-31  1382  		ret = -EINVAL;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1383  		if (!f)
c8a6153b6c59d9 Xie Yongji    2021-08-31  1384  			break;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1385  
c8a6153b6c59d9 Xie Yongji    2021-08-31  1386  		ret = -EFAULT;
5df53984377b18 Eugenio Pérez 2025-09-19  1387  		if (dev->api_version >= VDUSE_API_VERSION_1)
5df53984377b18 Eugenio Pérez 2025-09-19  1388  			ret = copy_to_user(argp, &entry,
5df53984377b18 Eugenio Pérez 2025-09-19  1389  					   sizeof(entry));
5df53984377b18 Eugenio Pérez 2025-09-19  1390  		else
5df53984377b18 Eugenio Pérez 2025-09-19  1391  			ret = copy_to_user(argp, &entry.v1,
5df53984377b18 Eugenio Pérez 2025-09-19  1392  					   sizeof(entry.v1));

copy_to_user() returns the numbers of bytes it wasn't able to copy but
we want to return -EFAULT to the user.

5df53984377b18 Eugenio Pérez 2025-09-19  1393  
5df53984377b18 Eugenio Pérez 2025-09-19  1394  		if (ret) {
c8a6153b6c59d9 Xie Yongji    2021-08-31  1395  			fput(f);
c8a6153b6c59d9 Xie Yongji    2021-08-31  1396  			break;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1397  		}
5df53984377b18 Eugenio Pérez 2025-09-19  1398  		ret = receive_fd(f, NULL, perm_to_file_flags(entry.v1.perm));
c8a6153b6c59d9 Xie Yongji    2021-08-31  1399  		fput(f);
c8a6153b6c59d9 Xie Yongji    2021-08-31  1400  		break;
c8a6153b6c59d9 Xie Yongji    2021-08-31  1401  	}
c8a6153b6c59d9 Xie Yongji    2021-08-31  1402  	case VDUSE_DEV_GET_FEATURES:
c8a6153b6c59d9 Xie Yongji    2021-08-31  1403  		/*

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

