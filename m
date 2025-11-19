Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104BD35292B;
	Wed, 19 Nov 2025 11:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763552995; cv=none; b=Y4oxaWCaSPcnbzBskCXVPwM2NDQeayMFnYRsCG5irWtmdAWEb89ZrfrFk+qwR1XyXBF2UFd9y+F25SETptO34gM8v8INaQ7j3zWkO2T7o/C38NSKVkBkXVZ9ur3LifwWlIvdyAjO3K1NDZUOXabU5mbhOPEGK5yAJDLuXQ6Rm/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763552995; c=relaxed/simple;
	bh=DvoRRHTYWIPU875PXjEamFEK84qv3zHLzsw8G1GYaQk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=n9teQfmHyn8Yb8SVQYU7MyiZ2d357coMDtKp4oKOL1euPriJafnc2pjTqqPxQTtlzl1vHZR7VH3s0TLlY4dQFTBVUIahG1321/tVIMNtw0qKKlx7XXWZMyxBt0yTvkxLp29L6JcjNaNAcv8o4e9YqIkJ9+cXriTjv8EzMvwAfxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dBKWb3WlczJ46k8;
	Wed, 19 Nov 2025 19:48:59 +0800 (CST)
Received: from frapema500003.china.huawei.com (unknown [7.182.19.114])
	by mail.maildlp.com (Postfix) with ESMTPS id 537B01402A4;
	Wed, 19 Nov 2025 19:49:43 +0800 (CST)
Received: from frapema500004.china.huawei.com (7.182.19.21) by
 frapema500003.china.huawei.com (7.182.19.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 19 Nov 2025 12:49:43 +0100
Received: from frapema500004.china.huawei.com ([7.182.19.21]) by
 frapema500004.china.huawei.com ([7.182.19.21]) with mapi id 15.02.1544.011;
 Wed, 19 Nov 2025 12:49:43 +0100
From: Roberto Sassu <roberto.sassu@huawei.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, "oe-kbuild@lists.linux.dev"
	<oe-kbuild@lists.linux.dev>
CC: "lkp@intel.com" <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>
Subject: RE: [robertosassu:ima-snapshots-v1-devel-v1 1/1]
 security/integrity/ima/ima_fs.c:321 ima_measurements_snap_write() warn: maybe
 return -EFAULT instead of the bytes remaining?
Thread-Topic: [robertosassu:ima-snapshots-v1-devel-v1 1/1]
 security/integrity/ima/ima_fs.c:321 ima_measurements_snap_write() warn: maybe
 return -EFAULT instead of the bytes remaining?
Thread-Index: AQHcWUpHuW1NGUEbcEmWDT/Dj2mfqLT54mrA
Date: Wed, 19 Nov 2025 11:49:43 +0000
Message-ID: <4a3433e45ab949af8d40356bb2fda857@huawei.com>
References: <202511170428.8scOuqUb-lkp@intel.com>
In-Reply-To: <202511170428.8scOuqUb-lkp@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

> From: Dan Carpenter <dan.carpenter@linaro.org>
> Sent: Wednesday, November 19, 2025 12:47 PM=20
> tree:   https://github.com/robertosassu/linux ima-snapshots-v1-devel-v1
> head:   b0bd002b6caa9d5d4f4d0db2a041b1fd91f33f8a
> commit: b0bd002b6caa9d5d4f4d0db2a041b1fd91f33f8a [1/1] ima: Add
> support for measurement list snapshots
> config: i386-randconfig-141-20251116 (https://download.01.org/0day-
> ci/archive/20251117/202511170428.8scOuqUb-lkp@intel.com/config)
> compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion
> of the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202511170428.8scOuqUb-lkp@intel.com/
>=20
> smatch warnings:
> security/integrity/ima/ima_fs.c:321 ima_measurements_snap_write() warn:
> maybe return -EFAULT instead of the bytes remaining?
>=20
> vim +321 security/integrity/ima/ima_fs.c
>=20
> b0bd002b6caa9d Roberto Sassu 2025-11-13  309  static ssize_t
> ima_measurements_snap_write(struct file *file,
> b0bd002b6caa9d Roberto Sassu 2025-11-13  310
> 		   const char __user *buf,
> b0bd002b6caa9d Roberto Sassu 2025-11-13  311
> 		   size_t datalen, loff_t *ppos)
> b0bd002b6caa9d Roberto Sassu 2025-11-13  312  {
> b0bd002b6caa9d Roberto Sassu 2025-11-13  313  	unsigned char
> req[SNAPSHOT_REQ_LENGTH];
> b0bd002b6caa9d Roberto Sassu 2025-11-13  314  	int ret;
> b0bd002b6caa9d Roberto Sassu 2025-11-13  315
> b0bd002b6caa9d Roberto Sassu 2025-11-13  316  	if (*ppos > 0 ||
> datalen !=3D SNAPSHOT_REQ_LENGTH)
> b0bd002b6caa9d Roberto Sassu 2025-11-13  317  		return -
> EINVAL;
> b0bd002b6caa9d Roberto Sassu 2025-11-13  318
> b0bd002b6caa9d Roberto Sassu 2025-11-13  319  	ret =3D
> copy_from_user(req, buf, datalen);
> b0bd002b6caa9d Roberto Sassu 2025-11-13  320  	if (ret < 0)
> b0bd002b6caa9d Roberto Sassu 2025-11-13 @321  		return ret;
>=20
> Yep.  This should be:
>=20
> 	if (copy_from_user(req, buf, datalen))
> 		return -EFAULT;

Ok, thanks!

Roberto

> b0bd002b6caa9d Roberto Sassu 2025-11-13  322
> b0bd002b6caa9d Roberto Sassu 2025-11-13  323  	if (req[1] !=3D '\n')
> b0bd002b6caa9d Roberto Sassu 2025-11-13  324  		return -
> EINVAL;
> b0bd002b6caa9d Roberto Sassu 2025-11-13  325
> b0bd002b6caa9d Roberto Sassu 2025-11-13  326  	switch (req[0]) {
> b0bd002b6caa9d Roberto Sassu 2025-11-13  327  	case
> SNAPSHOT_REQ_MAKE:
> b0bd002b6caa9d Roberto Sassu 2025-11-13  328  		ret =3D
> ima_queue_make_snapshot();
> b0bd002b6caa9d Roberto Sassu 2025-11-13  329  		break;
> b0bd002b6caa9d Roberto Sassu 2025-11-13  330  	case
> SNAPSHOT_REQ_DEL:
> b0bd002b6caa9d Roberto Sassu 2025-11-13  331  		ret =3D
> ima_queue_delete_snapshot();
> b0bd002b6caa9d Roberto Sassu 2025-11-13  332  		break;
> b0bd002b6caa9d Roberto Sassu 2025-11-13  333  	default:
> b0bd002b6caa9d Roberto Sassu 2025-11-13  334  		ret =3D -EINVAL;
> b0bd002b6caa9d Roberto Sassu 2025-11-13  335  		break;
> b0bd002b6caa9d Roberto Sassu 2025-11-13  336  	}
> b0bd002b6caa9d Roberto Sassu 2025-11-13  337
> b0bd002b6caa9d Roberto Sassu 2025-11-13  338  	if (ret < 0)
> b0bd002b6caa9d Roberto Sassu 2025-11-13  339  		return ret;
> b0bd002b6caa9d Roberto Sassu 2025-11-13  340
> b0bd002b6caa9d Roberto Sassu 2025-11-13  341  	return datalen;
> b0bd002b6caa9d Roberto Sassu 2025-11-13  342  }
>=20
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

