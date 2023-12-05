Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5918017F1
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 02:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="vWRtjqH2"
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20231205021303epoutp028c50c3d361b9b7690e93ed9f3684608c~dza6ZG-N11189411894epoutp02X
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Dec 2023 02:13:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20231205021303epoutp028c50c3d361b9b7690e93ed9f3684608c~dza6ZG-N11189411894epoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1701742384;
	bh=AwRFuB7qZXhfRkTN+3x6O7fIJ0ZODsnPiKZ/h4q/GvY=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=vWRtjqH2jfiAvRdF7hHh64UUaKl+JcxlFVmdLgpvyIBq+SuHgDDddyGiXMQS9wZ3L
	 crMqFGS9pRo/zswkGVX6eC7Gk80rjpEKRzi5BIsAGdJ/Fk0cDi4xvWtqFQQzd4ArdH
	 D0rO0rNAX1z4h7mQtCvGGkvVeeAf70tG7HzICIaM=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTP id
	20231205021302epcas1p213951e22e8bb52f6943302298b2fa0ab~dza40vmDk2023220232epcas1p2g;
	Tue,  5 Dec 2023 02:13:02 +0000 (GMT)
Received: from epcpadp4 (unknown [182.195.40.18]) by epsnrtp3.localdomain
	(Postfix) with ESMTP id 4Skkb21xlDz4x9Q2; Tue,  5 Dec 2023 02:13:02 +0000
	(GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
	20231205021157epcas1p3f8d5f7eb75fc6ff82fb8b3b7bb380886~dzZ8P2y_o0913509135epcas1p3M;
	Tue,  5 Dec 2023 02:11:57 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20231205021157epsmtrp1cb4691d519e2ee2e4989366b057b386f~dzZ8PDFoe2631226312epsmtrp1f;
	Tue,  5 Dec 2023 02:11:57 +0000 (GMT)
X-AuditID: b6c32a29-fa1ff70000002233-a3-656e86ed6233
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	64.50.08755.DE68E656; Tue,  5 Dec 2023 11:11:57 +0900 (KST)
Received: from W10PB11329 (unknown [10.253.152.129]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20231205021157epsmtip276607d53ca2fcd0325ff0316504c1ec1~dzZ8B5vin1759817598epsmtip21;
	Tue,  5 Dec 2023 02:11:57 +0000 (GMT)
From: "Sungjong Seo" <sj1557.seo@samsung.com>
To: "'Dan Carpenter'" <dan.carpenter@linaro.org>,
	<oe-kbuild@lists.linux.dev>, <Yuezhang.Mo@sony.com>, <linkinjeon@kernel.org>
Cc: <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	<linux-fsdevel@vger.kernel.org>, <Andy.Wu@sony.com>,
	<Wataru.Aoyama@sony.com>, <cpgs@samsung.com>, <sj1557.seo@samsung.com>
In-Reply-To: <4308b820-7d69-42e6-8b07-205e81add314@suswa.mountain>
Subject: RE: [PATCH v5 1/2] exfat: change to get file size from DataLength
Date: Tue, 5 Dec 2023 11:11:56 +0900
Message-ID: <1891546521.01701742382249.JavaMail.epsvc@epcpadp4>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQGxd3wNhL+eaFfSGY7zFr2t4G5sZQF3kZuwsN+PREA=
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRmVeSWpSXmKPExsWy7bCSvO7btrxUg8dfOS1aj+xjtHh5SNPi
	w7xWdouJ05YyW+zZe5LF4lXzIzaLQyuvMFk0rDvLbrHl3xFWi48PdjNaXH/zkNWB22PxnpdM
	HptWdbJ53Lm2h83jxeaZjB59W1YxerRP2Mns8XmTXAB7FJdNSmpOZllqkb5dAlfGt3vfGAuW
	clWcPD2FrYFxGkcXIyeHhICJxOamOcxdjFwcQgK7GSXa1j9h72LkAEpISRzcpwlhCkscPlwM
	UfKcUWLXiRmsIL1sAroST278BOsVEWhhlLh44QkLiMMssJdR4sH02VBTJzNKLF/9gwWkhVPA
	SWLm0l1sILawgJfE5scH2UFsFgEViQ2928BsXgFLiStbTjBB2IISJ2eCTOUAmqon0baRESTM
	LCAvsf0tyNUgHyhI7P50FOwiEQEriSn3HrFC1IhIzO5sY57AKDwLyaRZCJNmIZk0C0nHAkaW
	VYySqQXFuem5xYYFhnmp5XrFibnFpXnpesn5uZsYwXGopbmDcfuqD3qHGJk4GA8xSnAwK4nw
	zruVnSrEm5JYWZValB9fVJqTWnyIUZqDRUmcV/xFb4qQQHpiSWp2ampBahFMlomDU6qBKbPw
	+YXN9a9WOzTxB86rE2xVjTVNmpLctu3yC3bVpIye1Wdf/1t77F73JxvTCmtHT4Uei9zymRZt
	ZzpVoxUNtcs6DSf9Ur3q89l/XaidwXqJFHmZ9SaHNwQkl36rPbn66A6GNxzHVBhYb1ziNuE/
	PJPxo/0b5mk5h/kZKuLirDivs13ut3gR6Wp2ZclHPxsjac6T7hItnvsjNyi++XxAaGO5sXTa
	x4Ot91UUxF6wK8xKCFr4ys9ZtinhwXovn8VWJWFMs07m1v7zP+b9r37e2QNz4491Lyl/b7FJ
	2SRX40XQmYh3XHl/Hhr9eJif9Hv6p5RN2lMdl6f7LejZ99nmz+VHk3fwxR1c3nOqWlBCiaU4
	I9FQi7moOBEA31fXrzIDAAA=
X-CMS-MailID: 20231205021157epcas1p3f8d5f7eb75fc6ff82fb8b3b7bb380886
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
X-CPGSPASS: Y
X-ArchiveUser: EV
X-Hop-Count: 3
X-CMS-RootMailID: 20231201082951epcas1p49f84b72f950c5038b85a6fce6b6b54f3
References: <CGME20231201082951epcas1p49f84b72f950c5038b85a6fce6b6b54f3@epcas1p4.samsung.com>
	<4308b820-7d69-42e6-8b07-205e81add314@suswa.mountain>

[snip]
> 6642222a5afe775 Yuezhang.Mo@sony.com 2023-11-30  515  	if (ret < 0)
{
> 6642222a5afe775 Yuezhang.Mo@sony.com 2023-11-30  516  		if
(rw
> & WRITE)
> 
> This code works and the checker doesn't complain about it, but for
> consistency I think it should be if (rw == WRITE).
> 
> 5f2aa075070cf5b Namjae Jeon          2020-03-02  517
> 	exfat_write_failed(mapping, size);
> 6642222a5afe775 Yuezhang.Mo@sony.com 2023-11-30  518
> 6642222a5afe775 Yuezhang.Mo@sony.com 2023-11-30  519  		if
> (ret != -EIOCBQUEUED)
> 6642222a5afe775 Yuezhang.Mo@sony.com 2023-11-30  520
> 	return ret;
> 6642222a5afe775 Yuezhang.Mo@sony.com 2023-11-30  521  	} else
> 6642222a5afe775 Yuezhang.Mo@sony.com 2023-11-30  522  		size
=
> pos + ret;
> 6642222a5afe775 Yuezhang.Mo@sony.com 2023-11-30  523
> 6642222a5afe775 Yuezhang.Mo@sony.com 2023-11-30  524  	/* zero the
> unwritten part in the partially written block */
> 6642222a5afe775 Yuezhang.Mo@sony.com 2023-11-30 @525  	if ((rw &
READ)
> && pos < ei->valid_size && ei->valid_size < size) {
> 
> I think this should be rw == READ.
You're definitely right.
READ is 0, so it always be false.

Dear Yuezhang,

Can you please send v6 again for this?
It would be nice to include fixes for a minor issue reported
by Kernel test robot.

Thanks


