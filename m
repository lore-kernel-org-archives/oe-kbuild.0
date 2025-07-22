Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB372AF19;
	Tue, 22 Jul 2025 02:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753152543; cv=none; b=iugSgaL2fsDQYbLynkWGQ5tCi3dp5FBWG77xJF6ft2jDbHiiOZne2xDKneKioPikcMTEwVUeREcVx9q2DfwZyu8ZrvRKxycaw4eBNrTz+ue07Vkt0HnwqU69PQJZI7Zvg2pxiB1M1MVIP5NSHeP62LfUwTiEBkN8nQ1tNeQdVBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753152543; c=relaxed/simple;
	bh=9J99+paIOjgsfN7RjGyOlgJSazMYPFDxkztxwc2Lp20=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=cO1kIBVOAEjsOD7hIs/xUZK8HIYx4WuJJH2FL7CTndX4GeMA0rQgoBMDl+sE9rmOZfNNga1WUKHHwMXGX1gMuTCgQKZN4ZEZwQKyw/5w2WRGBCaqY7H+KRYyYrr9NlOPgiGa+4DISipnk8jPDRve6PC+7+ntAADO2TckfKm6llU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=net-swift.com; spf=pass smtp.mailfrom=net-swift.com; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=net-swift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=net-swift.com
X-QQ-mid: zesmtpsz3t1753152494t57810750
X-QQ-Originating-IP: puccBWfF/Orvo5AWHvH+Ko9BdKvW8qzebvwg9Fyk7Zs=
Received: from smtpclient.apple ( [36.24.205.22])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 22 Jul 2025 10:48:12 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11290490953618489811
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [linux-next:master 7606/11307]
 drivers/net/ethernet/wangxun/libwx/wx_vf_common.c:99
 wx_request_msix_irqs_vf() warn: why call request_threaded_irq() with a NULL
 thread
From: "mengyuanlou@net-swift.com" <mengyuanlou@net-swift.com>
In-Reply-To: <ada3c3a9-556f-4860-bff0-af0364a984b8@suswa.mountain>
Date: Tue, 22 Jul 2025 10:48:00 +0800
Cc: oe-kbuild@lists.linux.dev,
 lkp@intel.com,
 oe-kbuild-all@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C2F07D3D-DB95-4E42-948F-ADE4025FDCB9@net-swift.com>
References: <ada3c3a9-556f-4860-bff0-af0364a984b8@suswa.mountain>
To: Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:net-swift.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: N0mS+7D7RQfjlhSJKSbnUOMgXCTAs1zbfUjsRVO2Tq65+RBZepv5nqHO
	BbKFtQunb3MQbRmwXEdhJZISB29TIv+Srt4KUuNercUoWhq6Bv6InkWQH9eRiTPkiJuHm/q
	jf/KxujTVWQ/F1tSQeFNK1N/U0jQARQodruil2fuH5YZoapSDaqmXjak6RUCYMOiHi0pmBz
	wS61YHZ+ZrKKrmh9W/pg9DY+LOT5oABLegQqylbPKWe3s7KleaRiqbGqGW7nE0cQmhOljtw
	ldgyJ/F7BAS7szpJnHhwhC6Ncn4j49Hl8zSGIqTDXI2c5edhWleZL40Ox4SBjOdAClhS0+O
	epzG2uCrB7xilVgKp/M3SsdYAl0pH15LDv6uLdvTlpcF3hnKYppYfGk++TeS2KwnBx+HvvE
	j1pPBtv2M9u5LP3gdXkzpdqXVJc1XqALZYUKOGGAdP5IVPySQp6uXEnWAnhZk3UJJU4rz0a
	VcrdyZjL5b7xNDvjaC7Pb3G58oMVAt64Z6d9LtRGyR1QMLWbwNO8yU3nu+qoLtUmy01oWyK
	HQskqLwKq5sjtWd+/ZL3XpNKbltUelHr60Mq/8tEnWV8NwOkWjoxb/F2rH88Tbv/Mu6EXon
	qOTnTA2MelqY1gd4BjcaiNEpRYWoZ5aIY267GvjV+9XBkY0UbJySgOiAij3E4mXf7qVSybc
	sHKOqcieE/haQhDRe8wCd2WECWUvHKTM/2k6IN9+04dMeMIzJvfoziF0vNyYgMhNkibe2m+
	EPqjxGpjsg6wDTlvacJSb4fx5ERJZFNwD3I7Hf2qY+pqUxJz5wScisk+i4t1RoGD52AbMQ3
	6k+1iMMYgjer8jI2sHcWX0HMLvIcl+PZsV6eVRSVAFmgzc7O9vLeVbyoZotpk7xzQxz+P+z
	Woz/T+3TO4e0l1XC1Dq5ZACy2vR+51nekz+PD1VOrjTICu5nWIcMGoS2Plb21wzdQjJNFvJ
	JCg/IeJafeK2tZvGG701AJ7PGH3/sNNuNOKOsCyQLBXOMOPJsCvBmFbl2G4AxmqxuAgRJHV
	UzM2kPI4OQCTPU0+MlVbF2ZRXTUFc=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0



> 2025=E5=B9=B47=E6=9C=8819=E6=97=A5 12:18=EF=BC=8CDan Carpenter =
<dan.carpenter@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> tree:   =
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git =
master
> head:   d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
> commit: fd0a2e03bf6083354994c2efe2bd12e369c0c830 [7606/11307] net: =
txgbevf: init interrupts and request irqs
> config: parisc-randconfig-r071-20250719 =
(https://download.01.org/0day-ci/archive/20250719/202507191110.FWkwuVJQ-lk=
p@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 8.5.0
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: =
https://lore.kernel.org/r/202507191110.FWkwuVJQ-lkp@intel.com/
>=20
> smatch warnings:
> drivers/net/ethernet/wangxun/libwx/wx_vf_common.c:99 =
wx_request_msix_irqs_vf() warn: why call request_threaded_irq() with a =
NULL thread
>=20
> vim +99 drivers/net/ethernet/wangxun/libwx/wx_vf_common.c
>=20
> eb4898fde1de8c Mengyuan Lou 2025-07-04   74  int =
wx_request_msix_irqs_vf(struct wx *wx)
> eb4898fde1de8c Mengyuan Lou 2025-07-04   75  {
> eb4898fde1de8c Mengyuan Lou 2025-07-04   76   struct net_device =
*netdev =3D wx->netdev;
> eb4898fde1de8c Mengyuan Lou 2025-07-04   77   int vector, err;
> eb4898fde1de8c Mengyuan Lou 2025-07-04   78 =20
> eb4898fde1de8c Mengyuan Lou 2025-07-04   79   for (vector =3D 0; =
vector < wx->num_q_vectors; vector++) {
> eb4898fde1de8c Mengyuan Lou 2025-07-04   80   struct wx_q_vector =
*q_vector =3D wx->q_vector[vector];
> eb4898fde1de8c Mengyuan Lou 2025-07-04   81   struct msix_entry *entry =
=3D &wx->msix_q_entries[vector];
> eb4898fde1de8c Mengyuan Lou 2025-07-04   82 =20
> eb4898fde1de8c Mengyuan Lou 2025-07-04   83   if (q_vector->tx.ring && =
q_vector->rx.ring)
> eb4898fde1de8c Mengyuan Lou 2025-07-04   84   snprintf(q_vector->name, =
sizeof(q_vector->name) - 1,
> eb4898fde1de8c Mengyuan Lou 2025-07-04   85   "%s-TxRx-%d", =
netdev->name, entry->entry);
> eb4898fde1de8c Mengyuan Lou 2025-07-04   86   else
> eb4898fde1de8c Mengyuan Lou 2025-07-04   87   /* skip this unused =
q_vector */
> eb4898fde1de8c Mengyuan Lou 2025-07-04   88   continue;
> eb4898fde1de8c Mengyuan Lou 2025-07-04   89 =20
> eb4898fde1de8c Mengyuan Lou 2025-07-04   90   err =3D =
request_irq(entry->vector, wx_msix_clean_rings, 0,
> eb4898fde1de8c Mengyuan Lou 2025-07-04   91    q_vector->name, =
q_vector);
> eb4898fde1de8c Mengyuan Lou 2025-07-04   92   if (err) {
> eb4898fde1de8c Mengyuan Lou 2025-07-04   93   wx_err(wx, "request_irq =
failed for MSIX interrupt %s Error: %d\n",
> eb4898fde1de8c Mengyuan Lou 2025-07-04   94         q_vector->name, =
err);
> eb4898fde1de8c Mengyuan Lou 2025-07-04   95   goto free_queue_irqs;
> eb4898fde1de8c Mengyuan Lou 2025-07-04   96   }
> eb4898fde1de8c Mengyuan Lou 2025-07-04   97   }
> eb4898fde1de8c Mengyuan Lou 2025-07-04   98 =20
> fd0a2e03bf6083 Mengyuan Lou 2025-07-04  @99   err =3D =
request_threaded_irq(wx->msix_entry->vector, wx_msix_misc_vf,
> fd0a2e03bf6083 Mengyuan Lou 2025-07-04  100     NULL, IRQF_ONESHOT, =
netdev->name, wx);
>                                                                        =
   ^^^^
> It's not a threaded IRQ if the thread is NULL.  You could just
> use request_irq().

Thanks, I got it.

Mengyuan Lou

>=20
> eb4898fde1de8c Mengyuan Lou 2025-07-04  101   if (err) {
> eb4898fde1de8c Mengyuan Lou 2025-07-04  102   wx_err(wx, "request_irq =
for msix_other failed: %d\n", err);
> eb4898fde1de8c Mengyuan Lou 2025-07-04  103   goto free_queue_irqs;
> eb4898fde1de8c Mengyuan Lou 2025-07-04  104   }
> eb4898fde1de8c Mengyuan Lou 2025-07-04  105 =20
> eb4898fde1de8c Mengyuan Lou 2025-07-04  106   return 0;
> eb4898fde1de8c Mengyuan Lou 2025-07-04  107 =20
> eb4898fde1de8c Mengyuan Lou 2025-07-04  108  free_queue_irqs:
> eb4898fde1de8c Mengyuan Lou 2025-07-04  109   while (vector) {
> eb4898fde1de8c Mengyuan Lou 2025-07-04  110   vector--;
> eb4898fde1de8c Mengyuan Lou 2025-07-04  111   =
free_irq(wx->msix_q_entries[vector].vector,
> eb4898fde1de8c Mengyuan Lou 2025-07-04  112   wx->q_vector[vector]);
> eb4898fde1de8c Mengyuan Lou 2025-07-04  113   }
> eb4898fde1de8c Mengyuan Lou 2025-07-04  114   =
wx_reset_interrupt_capability(wx);
> eb4898fde1de8c Mengyuan Lou 2025-07-04  115   return err;
> eb4898fde1de8c Mengyuan Lou 2025-07-04  116  }
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>=20
>=20

