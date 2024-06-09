Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F47F4501F
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Jun 2024 15:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717946997; cv=none; b=W8cujrf06XulPXdzUZFtsSTolR1abGI4kFIZWUq65uXD4aIaQzQ1oiS6X0hmt5gpkymxNyXML6il2eGjy6hB6035Jw4geLbPhMj8Lc5evTU3rVUUdeGE/CSsnaFmM7FpK8ghI02damNWB0uajUeoKQTlBJdjw47z/+E8lvNZ4e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717946997; c=relaxed/simple;
	bh=LkPXGai8kaRoajhEuKD9q1QTp4VpWFHLrSWtfPGkqEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=XogHAe3V7MBLpsw+YWPX3Oj1d1p5RB5VJoQB2DnTiTQtzxQ6QG985kbPgf58301csDP5thxxx8lFJKViruPRE42vf8iPQxTzj5gigXHdur2zb0ObZCcxN1z3k+Fcu7ZL8OkTc8EXVTaTHzbTt+nYo8LcPWJ6FL3ntEOxww7mcOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GTVCBz1+; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GTVCBz1+"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52bbdb15dd5so2430929e87.3
        for <oe-kbuild@lists.linux.dev>; Sun, 09 Jun 2024 08:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717946993; x=1718551793; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+p7Dbyuweupea3JxyYctujxWv1vr+kMS3mFulUukLl4=;
        b=GTVCBz1+xgGo7eX1Ecw0TTvf4MAl1hXd8dE8b4m3NtRNMtHQswupq1FOPggff9ZwR8
         v/rgvzDKyTCRkS7VQTZqwa1zWrBxndmiThiQvgw1YHOms5r6ttcurgydq0Z4mRR8FsV3
         n2x1taFtcOT9bkj9rxK+5Ku5sjbSKj6Zhu4HDq7gEAlJm9HcVq5U56hQCb1nzbLxF8QK
         PAtDoZH/cz+jFp8XY0p8GbqO6aVYJoiu0zbfihEAaK8LZygyYsYdqUr6oNAplDPCTA2t
         VrEyz3LkVyESBE4TnkB+MOJRCFyT16yWR6cTWsGSAwtJeGgqQbrFgychXYVGc5IlQKpC
         VAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717946993; x=1718551793;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+p7Dbyuweupea3JxyYctujxWv1vr+kMS3mFulUukLl4=;
        b=ffpavQl+hr9qmq7eEKTwv0PLYZ2zzlyWbejlHoHz9PBRrG0ervwmEzsn1RZZG+rbqZ
         0kEOB4UDGmGHQcV/7dNzdSLofN8zxcD7Qfep1UrQ/udrtfQMlx0dsVtNoyqSe5JV4BXA
         265/xQ8eBBUA/JNI7kGRaIz2Va1Ha0Zh/Cy/LRhca/GsFQ0iJyBwkiwBLt/V3Ed8mfIK
         eU+kgOlIBQ5WyP3e5hk6zAiUqwLY4iAmWXZf+DpO0te/KOhYM4zoox/4+BCc87GRoec3
         ciFmFtfqdFl6HGQMqFWTsDblYtKAgjunWIJftGyA98SnSFTSmTQR4J/S65rnTCIwRtXo
         +Cfg==
X-Gm-Message-State: AOJu0Yzg1b1yBJNgV5cug6iJqeTjLnLANgJiVMWzek4QJliVqRp36JLz
	s3KShXcNx9ef+LvkEpRkQJ7NASiqSKaWsiHY15FrUD3GRJDozx9Lz7FCTkWPAgIkWYJoTLoLWZp
	p
X-Google-Smtp-Source: AGHT+IHAD4z52RxtAlhkJKnz6xDUNUsq8wzsH9aGCceUyMemIpuwQ3lYTq1VwnfUMEWgqgARHYFD4Q==
X-Received: by 2002:a19:5f5b:0:b0:520:c2c1:153a with SMTP id 2adb3069b0e04-52bb9fd2521mr4380150e87.58.1717946992519;
        Sun, 09 Jun 2024 08:29:52 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f2024b1c8sm1716363f8f.39.2024.06.09.08.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 08:29:52 -0700 (PDT)
Date: Sun, 9 Jun 2024 18:29:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Fred Griffoul <fgriffo@amazon.co.uk>,
	griffoul@gmail.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Fred Griffoul <fgriffo@amazon.co.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Zefan Li <lizefan.x@bytedance.com>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mark Brown <broonie@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Yi Liu <yi.l.liu@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Eric Auger <eric.auger@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Ye Bin <yebin10@huawei.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	cgroups@vger.kernel.org
Subject: Re: [PATCH v4 2/2] vfio/pci: add msi interrupt affinity support
Message-ID: <714268da-d199-4371-8360-500e7165119c@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607190955.15376-3-fgriffo@amazon.co.uk>

Hi Fred,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Fred-Griffoul/cgroup-cpuset-export-cpuset_cpus_allowed/20240608-031332
base:   cbb325e77fbe62a06184175aa98c9eb98736c3e8
patch link:    https://lore.kernel.org/r/20240607190955.15376-3-fgriffo%40amazon.co.uk
patch subject: [PATCH v4 2/2] vfio/pci: add msi interrupt affinity support
config: mips-randconfig-r081-20240609 (https://download.01.org/0day-ci/archive/20240609/202406092245.Hgx6MqK9-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406092245.Hgx6MqK9-lkp@intel.com/

New smatch warnings:
drivers/vfio/pci/vfio_pci_core.c:1241 vfio_pci_ioctl_set_irqs() warn: maybe return -EFAULT instead of the bytes remaining?

vim +1241 drivers/vfio/pci/vfio_pci_core.c

2ecf3b58ed7bc5 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-31  1190  static int vfio_pci_ioctl_set_irqs(struct vfio_pci_core_device *vdev,
663eab456e072b drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-31  1191  				   struct vfio_irq_set __user *arg)
2ecf3b58ed7bc5 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-31  1192  {
2ecf3b58ed7bc5 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-31  1193  	unsigned long minsz = offsetofend(struct vfio_irq_set, count);
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1194  	struct vfio_irq_set hdr;
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1195  	cpumask_var_t mask;
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1196  	u8 *data = NULL;
05692d7005a364 drivers/vfio/pci/vfio_pci.c      Vlad Tsyrklevich 2016-10-12  1197  	int max, ret = 0;
ef198aaa169c61 drivers/vfio/pci/vfio_pci.c      Kirti Wankhede   2016-11-17  1198  	size_t data_size = 0;
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1199  
663eab456e072b drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-31  1200  	if (copy_from_user(&hdr, arg, minsz))
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1201  		return -EFAULT;
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1202  
05692d7005a364 drivers/vfio/pci/vfio_pci.c      Vlad Tsyrklevich 2016-10-12  1203  	max = vfio_pci_get_irq_count(vdev, hdr.index);
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1204  
ea3fc04d4fad2d drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-31  1205  	ret = vfio_set_irqs_validate_and_prepare(&hdr, max, VFIO_PCI_NUM_IRQS,
ea3fc04d4fad2d drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-31  1206  						 &data_size);
ef198aaa169c61 drivers/vfio/pci/vfio_pci.c      Kirti Wankhede   2016-11-17  1207  	if (ret)
ef198aaa169c61 drivers/vfio/pci/vfio_pci.c      Kirti Wankhede   2016-11-17  1208  		return ret;
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1209  
ef198aaa169c61 drivers/vfio/pci/vfio_pci.c      Kirti Wankhede   2016-11-17  1210  	if (data_size) {
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1211  		if (hdr.flags & VFIO_IRQ_SET_DATA_AFFINITY) {
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1212  			if (!zalloc_cpumask_var(&mask, GFP_KERNEL))
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1213  				return -ENOMEM;
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1214  
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1215  			ret = copy_from_user(mask, &arg->data, data_size);

copy_from_user() returns the number of bytes remaining to be copied.
This should be:

	if (copy_from_user(mask, &arg->data, data_size)) {
		ret = -EFAULT;
		goto out;
	}

66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1216  			if (ret)
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1217  				goto out;
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1218  
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1219  			data = (u8 *)mask;
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1220  
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1221  		} else {
663eab456e072b drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-31  1222  			data = memdup_user(&arg->data, data_size);
3a1f7041ddd59e drivers/vfio/pci/vfio_pci.c      Fengguang Wu     2012-12-07  1223  			if (IS_ERR(data))
3a1f7041ddd59e drivers/vfio/pci/vfio_pci.c      Fengguang Wu     2012-12-07  1224  				return PTR_ERR(data);
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1225  		}
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1226  	}
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1227  
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1228  	mutex_lock(&vdev->igate);
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1229  
ea3fc04d4fad2d drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-31  1230  	ret = vfio_pci_set_irqs_ioctl(vdev, hdr.flags, hdr.index, hdr.start,
ea3fc04d4fad2d drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-31  1231  				      hdr.count, data);
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1232  
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1233  	mutex_unlock(&vdev->igate);
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1234  
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1235  out:
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1236  	if (hdr.flags & VFIO_IRQ_SET_DATA_AFFINITY && data_size)
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1237  		free_cpumask_var(mask);
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1238  	else
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1239  		kfree(data);
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1240  
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31 @1241  	return ret;
2ecf3b58ed7bc5 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-31  1242  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

