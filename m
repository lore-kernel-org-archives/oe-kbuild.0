Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6B9173333;
	Thu,  2 May 2024 20:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714682774; cv=none; b=ZhHu4InH+78oarKQ0aH3Rh8u8jylG6694mYdfLbz9ln5lh+eXZeY7ZbOX/wBw5wagCtWp0HP6VIH3k3jbYyztt4Vl6k843zDX/jkrVJfx42Kng8qzpPH0fCexyhnGWXGdv3QQYNKiS8nLAtIlvq/kBDe1nUdk9NXx6GWy0gtoog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714682774; c=relaxed/simple;
	bh=kHdI7uoIvTy+aqgfi4h+cWiaabxohimmlZFLNSU1OWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LIzZaRHuVw3xG1VnaN4TmQaHPCbAerirEgzTT2Pl4fH6VvfJSL/RlShPKU4v9EB6oo1sawm5CcWbZzlXimkw9VWL2MEC3BKPO2yqxAqsAlf+YKtxroDUIIc2U02YoxdbNI4oVOM/g4PRO5Drd3IN8rQFcknL58zlN5k0KAv7VdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mhePX391; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mhePX391"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 442KD8x9019442;
	Thu, 2 May 2024 20:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=+kIWJM0/hSyuFZCMXyPlz9EkQHiUgJs926JlBrH1zYc=; b=mh
	ePX391CMVYro3O5droDh1TfF3GcrSwXNnn9gLXrLTXv0KjJVvdCkBBgyJECEDaFe
	C4kFVCixlsN9THQNVVj/B0hrgWZXQPQLJKyJxNcz3yTPhmErg7d7s9Ne/P2LjgV2
	2OBTFqJufr+TJV+rHhWuNG5CBsOoz/ZLOxyWTzLY0tRdGJGRHWIWXbV0krsSYeg2
	Z+0+zQzNyBBsCM4e61hn2tR8fDA2pXxzWvjfBEplFRErKtrkLGjl24pzo8U9X9cJ
	US/vU7DzNPFeHoi1zwnqX1vAVDnHbg2YR3L9MQYhkwqMGLDd7aFrsrfZPPPC4DPG
	MZj8PYM+18FXog2+8Epw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xv8vs9b11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 May 2024 20:46:02 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 442Kk0tD024792
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 2 May 2024 20:46:00 GMT
Received: from [10.71.110.192] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 2 May 2024
 13:45:59 -0700
Message-ID: <17deb294-223d-4aa2-8aa1-d9e3eee929c9@quicinc.com>
Date: Thu, 2 May 2024 13:45:59 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 9793/10134] drivers/of/of_reserved_mem.c:463
 fdt_init_reserved_mem() error: uninitialized symbol 'nomap'.
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, <oe-kbuild@lists.linux.dev>
CC: <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
        Linux Memory Management
 List <linux-mm@kvack.org>,
        "Rob Herring (Arm)" <robh@kernel.org>
References: <34976102-567d-4651-bf14-41b85af8735e@moroto.mountain>
From: Oreoluwa Babatunde <quic_obabatun@quicinc.com>
In-Reply-To: <34976102-567d-4651-bf14-41b85af8735e@moroto.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BI7MfE7A_DxRJrXZ_YCkGpJVk0cXW75X
X-Proofpoint-GUID: BI7MfE7A_DxRJrXZ_YCkGpJVk0cXW75X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-02_12,2024-05-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405020137


On 5/2/2024 1:45 AM, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   f68868ba718e30594165879cc3020607165b0761
> commit: 2acef04ad57cab44b33001542791fc93f81cadf1 [9793/10134] of: reserved_mem: Remove the use of phandle from the reserved_mem APIs
> config: i386-randconfig-141-20240501 (https://download.01.org/0day-ci/archive/20240502/202405020127.3ncxx3EI-lkp@intel.com/config)
> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202405020127.3ncxx3EI-lkp@intel.com/
>
> smatch warnings:
> drivers/of/of_reserved_mem.c:463 fdt_init_reserved_mem() error: uninitialized symbol 'nomap'.
>
> vim +/nomap +463 drivers/of/of_reserved_mem.c
>
> 3f0c8206644836 Marek Szyprowski   2014-02-28  430  void __init fdt_init_reserved_mem(void)
> 3f0c8206644836 Marek Szyprowski   2014-02-28  431  {
> 3f0c8206644836 Marek Szyprowski   2014-02-28  432  	int i;
> ae1add247bf8c2 Mitchel Humpherys  2015-09-15  433  
> ae1add247bf8c2 Mitchel Humpherys  2015-09-15  434  	/* check for overlapping reserved regions */
> ae1add247bf8c2 Mitchel Humpherys  2015-09-15  435  	__rmem_check_for_overlap();
> ae1add247bf8c2 Mitchel Humpherys  2015-09-15  436  
> 3f0c8206644836 Marek Szyprowski   2014-02-28  437  	for (i = 0; i < reserved_mem_count; i++) {
> 3f0c8206644836 Marek Szyprowski   2014-02-28  438  		struct reserved_mem *rmem = &reserved_mem[i];
> 3f0c8206644836 Marek Szyprowski   2014-02-28  439  		unsigned long node = rmem->fdt_node;
> 3f0c8206644836 Marek Szyprowski   2014-02-28  440  		int err = 0;
> 6f1188b4ac7577 Yue Hu             2020-07-30  441  		bool nomap;
> 3f0c8206644836 Marek Szyprowski   2014-02-28  442  
> 3f0c8206644836 Marek Szyprowski   2014-02-28  443  		if (rmem->size == 0)
> 3f0c8206644836 Marek Szyprowski   2014-02-28  444  			err = __reserved_mem_alloc_size(node, rmem->name,
> 3f0c8206644836 Marek Szyprowski   2014-02-28  445  						 &rmem->base, &rmem->size);
> d0b8ed47e83a22 pierre Kuo         2019-02-19  446  		if (err == 0) {
> d0b8ed47e83a22 pierre Kuo         2019-02-19  447  			err = __reserved_mem_init_node(rmem);
> d0b8ed47e83a22 pierre Kuo         2019-02-19  448  			if (err != 0 && err != -ENOENT) {
> d0b8ed47e83a22 pierre Kuo         2019-02-19  449  				pr_info("node %s compatible matching fail\n",
> d0b8ed47e83a22 pierre Kuo         2019-02-19  450  					rmem->name);
> 2acef04ad57cab Oreoluwa Babatunde 2024-04-22  451  
> 2acef04ad57cab Oreoluwa Babatunde 2024-04-22  452  				nomap = of_get_flat_dt_prop(node, "no-map", NULL) != NULL;
> d0b8ed47e83a22 pierre Kuo         2019-02-19  453  				if (nomap)
> 7b25995f5319ad Dong Aisheng       2021-06-11  454  					memblock_clear_nomap(rmem->base, rmem->size);
> 3c6867a12a224d Dong Aisheng       2021-06-11  455  				else
> 3ecc68349bbab6 Mike Rapoport      2021-11-05  456  					memblock_phys_free(rmem->base,
> 3ecc68349bbab6 Mike Rapoport      2021-11-05  457  							   rmem->size);
> aeb9267eb6b1df Martin Liu         2023-02-10  458  			} else {
> aeb9267eb6b1df Martin Liu         2023-02-10  459  				phys_addr_t end = rmem->base + rmem->size - 1;
> aeb9267eb6b1df Martin Liu         2023-02-10  460  				bool reusable =
> aeb9267eb6b1df Martin Liu         2023-02-10  461  					(of_get_flat_dt_prop(node, "reusable", NULL)) != NULL;
> aeb9267eb6b1df Martin Liu         2023-02-10  462  
> 6ee7afbabcee4d Geert Uytterhoeven 2023-02-16 @463  				pr_info("%pa..%pa (%lu KiB) %s %s %s\n",
> aeb9267eb6b1df Martin Liu         2023-02-10  464  					&rmem->base, &end, (unsigned long)(rmem->size / SZ_1K),
> aeb9267eb6b1df Martin Liu         2023-02-10  465  					nomap ? "nomap" : "map",
>                                                                                         ^^^^^    ^^^^^
> This is nomap from the previous iteration through the loop.  How is
> it useful?
Hi Dan,

I have uploaded a new patch which has the correct behavior
for nomap in this loop.
https://lore.kernel.org/all/20240502192403.3307277-1-quic_obabatun@quicinc.com/

Moving line 452 into the if statement was an error on my
part because I did not take note that the value was being
printed in the else statement as well.

Thank you!

Oreoluwa
